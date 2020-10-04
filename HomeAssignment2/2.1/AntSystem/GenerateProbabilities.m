function probabilities = GenerateProbabilities(currentCity, tabuList, pheromoneLevels, ...
    visibilities, alpha, beta)
    nCities = length(tabuList);
    probabilities = zeros(1, nCities);
    denominator = 0;

    for j = 1:nCities
        if tabuList(j)
            continue;
        end

        numerator = CalculateEdgeFactor(currentCity, j, pheromoneLevels, visibilities, alpha, beta);
        
        probabilities(j) = numerator;
        denominator = denominator + numerator;
    end

    probabilities = probabilities / denominator;
end


function edgeFactor = CalculateEdgeFactor(i, j, pheromoneLevels, ...
    visibilities, alpha, beta)
    edgeFactor = pheromoneLevels(i, j)^alpha * visibilities(i, j)^beta;
end