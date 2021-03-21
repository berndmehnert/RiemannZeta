module RiemannZeta
using Images
export SimpleRiemann, GetImageOfCriticalStrip

# s = σ + it, first non-trivial zeros at s = 0.5 +/- i14.135
function SimpleRiemann(s, ae = 0.00001)
    N = floor(1/(ae/(1 + abs(s)/real(s)))^(1/real(2))) + 1
    return sum([n^(-s) for n in 1:N]) + N^(1-s)/(s-1)
end

"""
Get an approximated picture of the critical strip between the y-coordinates y1 < y2.
"""
function GetImageOfCriticalStrip(x_range :: Int, y_range :: Int, y1 :: Real, y2 :: Real)
    result_image = zeros(RGB{Float32}, x_range, y_range)
    for x in 1:x_range
        for y in 1:y_range
            x_coord = (1 + x)/(x_range + 2)
            y_coord = y1 + y/y_range * (y2 - y1)
            z = SimpleRiemann(x_coord + y_coord*1im)
            point = RGB(1.0-exp(-abs(z)), 1.0-exp(-abs(z)), 1.0-exp(-abs(z)))
            result_image[x,y] = point
        end
    end
    return result_image
end

SaveAsPng(filename, image :: Array{RGB{Float32}}) = save(filename, image)
end # module
