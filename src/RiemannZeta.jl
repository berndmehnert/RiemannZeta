module RiemannZeta
export SimpleRiemann

function SimpleRiemann(z, N = 100)
    return sum([n^(-z) for n in 1:N]) + N^(1-z)/(z-1)
end

end # module
