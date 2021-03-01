module RiemannZeta
export SimpleRiemann

# s = σ + it, first non-trivial zeros at s = 0.5 +/- i14.135
function SimpleRiemann(s, ae = 0.5)
    N = floor(1/(ae/(1 + abs(s)/real(s)))^(1/real(2))) + 1
    return sum([n^(-s) for n in 1:N]) + N^(1-s)/(s-1)
end

end # module
