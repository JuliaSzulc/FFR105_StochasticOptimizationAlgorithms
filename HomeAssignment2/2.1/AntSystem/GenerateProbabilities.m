function probabilities = GenerateProbabilities(currentCity, tabuList, pheromoneLevels, ...
    visibilities, alpha, beta)
    nCities = length(tabuList);
    numerator = zeros(1, nCities);

    for j = 1:nCities
        if tabuList(j)
            continue;
        end

        numerator(j) = CalculateEdgeWeight(currentCity, j, pheromoneLevels, visibilities, alpha, beta);
    end

    denominator = sum(numerator);
    probabilities = numerator / denominator;
end


function edgeWeight = CalculateEdgeWeight(i, j, pheromoneLevels, visibilities, alpha, beta)
    edgeWeight = pheromoneLevels(i, j)^alpha * visibilities(i, j)^beta;
    
    if edgeWeight == 0
        edgeWeight = realmin;
    end
end