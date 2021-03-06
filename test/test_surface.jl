function xy_data(x,y,i, N)
	x = ((x/N)-0.5f0)*i
	y = ((y/N)-0.5f0)*i
	r = sqrt(x*x + y*y)
	Float32(sin(r)/r)
end
generate(i, N) = Float32[xy_data(Float32(x),Float32(y),Float32(i), N) for x=1:N, y=1:N]
function surface_data(N)
	heightfield = lift(generate, bounce(1f0:200f0), N)
	return (heightfield, :surface)
end
surface_data(40)


push!(TEST_DATA, surface_data(128))

surface_data(40)