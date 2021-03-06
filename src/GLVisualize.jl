VERSION >= v"0.4.0-dev+6521" && __precompile__(true)
module GLVisualize

using GLFW
using GLWindow
using GLAbstraction
using ModernGL
using FixedSizeArrays
using GeometryTypes
using ColorTypes
using Reactive
using Quaternions
using Compat
using FixedPointNumbers
using FileIO
using Meshes
using Packing
import Images


import Base: merge, convert, show


shaderdir() = Pkg.dir("GLVisualize", "src", "shader")

include("FreeTypeAbstraction.jl")

include("utils.jl")
export collect_for_gl
export y_partition
export x_partition
export loop
export bounce


include(joinpath("display", "renderloop.jl"))


include("visualize_interface.jl")
export view #push renderobject into renderlist of the default screen, or supplied screen
export visualize    # Visualize an object
export visualize_default # get the default parameter for a visualization

include(joinpath("texture_atlas", 	"texture_atlas.jl"))
export Sprite
export GLSprite
export SpriteStyle
export GLSpriteStyle

include(joinpath("edit", "color_chooser.jl"))
include(joinpath("edit", "numbers.jl"))
export vizzedit # edits some value, name should be changed in the future!

include(joinpath("visualize", "text", "utils.jl"))
include(joinpath("visualize", "2dparticles.jl"))
include(joinpath("visualize", "containers.jl"))
include(joinpath("visualize", "distancefields.jl"))
include(joinpath("visualize", "dots.jl"))
include(joinpath("visualize", "image.jl"))
include(joinpath("visualize", "mesh.jl"))
include(joinpath("visualize", "meshgrid.jl"))
include(joinpath("visualize", "particles.jl"))
include(joinpath("visualize", "surface.jl"))
include(joinpath("visualize", "text.jl"))
include(joinpath("visualize", "vectorfield.jl"))
include(joinpath("visualize", "videos.jl"))
include(joinpath("visualize", "volume.jl"))
include(joinpath("visualize", "axis.jl"))

include("camera.jl")
export cubecamera

Base.precompile(glscreen, ())
end # module
