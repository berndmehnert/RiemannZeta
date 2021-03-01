module RiemannZeta
using Images
export SimpleRiemann, GetImageOfCriticalStrip

# s = σ + it, first non-trivial zeros at s = 0.5 +/- i14.135
function SimpleRiemann(s, ae = 0.001)
    N = floor(1/(ae/(1 + abs(s)/real(s)))^(1/real(2))) + 1
    return sum([n^(-s) for n in 1:N]) + N^(1-s)/(s-1)
end

function GetImageOfCriticalStrip(x_range :: Int, y_range :: Int)
    result_image = zeros(RGB{Float32}, x_range-2, y_range)
    for x in 1:x_range-2
        for y in 1:y_range
            re = (1 + x)/x_range 
            z = SimpleRiemann(re + y*1im/100)
            point = RGB(abs(z), imag(z), real(z))
            result_image[x,y] = point
        end
    end
    return result_image
end

end # module
