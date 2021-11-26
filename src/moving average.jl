# Source: https://julialang.org/blog/2016/02/iteration/#writing_multidimensional_algorithms_with_cartesianindex_iterators
# compute the "moving average" over a 3-by-3-by-... block around each element
# Origin code:
function boxcar3(A::AbstractArray)
    out = similar(A)
    R = CartesianIndices(A)
    Ifirst, Ilast = first(R), last(R)
    I1 = oneunit(Ifirst)
    for I in R
        n, s = 0, zero(eltype(out))
        for J in max(Ifirst, I-I1):min(Ilast, I+I1)
            s += A[J]
            n += 1
        end
        out[I] = s/n
    end
    out
end
#--------------------------------------------------------------
"""
    move_average(A, N)

compute the moving average over a (2N+1)-by-(2N+1)-by-... block around each element
"""
function move_average(A::AbstractArray, N::Integer)
    out = similar(A)
    R = CartesianIndices(A)
    Ifirst, Ilast = first(R), last(R)
    I1 = oneunit(Ifirst)
    for I in R
        n, s = 0, zero(eltype(out))
        for J in max(Ifirst, I-N*I1):min(Ilast, I+N*I1)
            s += A[J]
            n += 1
        end
        out[I] = s/n
    end
    out
end

