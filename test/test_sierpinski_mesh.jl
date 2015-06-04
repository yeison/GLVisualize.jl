typealias Point3f Point3{Float32}

function sierpinski(n, positions=Point3f[])
    if n == 0
        push!(positions, Point3f(0))
        positions
    else
        t = sierpinski(n - 1, positions)
        for i=1:length(t)
        	t[i] = t[i] * 0.5f0
        end
        t_copy = copy(t)
        mv = (0.5^n * 2^n)/2f0
        mw = (0.5^n * 2^n)/4f0
        append!(t, [p + Point3f(mw, mw, -mv) 	for p in t_copy])
        append!(t, [p + Point3f(mw, -mw, -mv) 	for p in t_copy])
        append!(t, [p + Point3f(-mw, -mw, -mv) 	for p in t_copy])
        append!(t, [p + Point3f(-mw, mw, -mv) 	for p in t_copy])
        t
    end
end
function sierpinski_data(n)
    positions 	= sierpinski(n)
    len         = length(positions)
    pstride     = 2048
    if len % pstride != 0 # sadly this is needed right now, as I have to put particles into a 2D texture. Will be automated
        append!(positions, fill(Point3f(typemax(Float32)), pstride-(len%pstride))) # append if can't be reshaped with 1024
    end
    positions = reshape(positions, (pstride, div(length(positions), pstride)))
    return (positions, 
    	:model 		=> scalematrix(Vec3(0.5^n)), 
    	:primitive 	=> GLNormalMesh(Pyramid(Point3f(0), 1f0,1f0))
    )
end

push!(TEST_DATA, sierpinski_data(4))