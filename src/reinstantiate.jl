"""
    reinstantiate(old, pairs...)

create a new struct which is a copy of an existing struct with specific fields changed.

source: https://stackoverflow.com/a/58613307
"""
function reinstantiate(old::T, pairs::Pair...) where {T}
    field_values = [getfield(old, field) for field in fieldnames(T)]
    for pair in pairs
        index = findfirst(fieldnames(T) .== pair.first)
        @assert index !== nothing "$(pair.first) is not a field of $(T)"
        field_values[index] = pair.second
    end
    return T(field_values...)
end