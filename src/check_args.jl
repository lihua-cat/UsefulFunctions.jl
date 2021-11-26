"""
    @check_args(D, cond)

macro for argument checking.

source: https://github.com/JuliaStats/Distributions.jl/blob/v0.25.32/src/utils.jl#L3
"""
macro check_args(D, cond)
    quote
        if !($(esc(cond)))
            throw(ArgumentError(string(
                $(string(D)), ": the condition ", $(string(cond)), " is not satisfied.")))
        end
    end
end