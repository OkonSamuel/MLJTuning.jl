# extract items useful for plotting from the history generated by the
# fallback `result` method:
function plotting_report(fields, scales, history)

    n_models = length(history)
    n_parameters = length(fields)

    A = Array{Any}(undef, (n_models, n_parameters))
    measurements = Vector{Float64}(undef, n_models)

    for j in eachindex(history)
        m, r = history[j]
        A[j,:] = [recursive_getproperty(m, fld) for fld in fields]
        measurements[j] = last(r)[1]
    end

    return plotting=(parameter_names=string.(fields) |> collect,
                     parameter_scales=scales |> collect,
                     parameter_values = A,
                     measurements = measurements)

end
