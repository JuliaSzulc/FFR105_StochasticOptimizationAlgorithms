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
    probabilities1 = numerator / denominator;
    probabilities = zeros(2, length(probabilities1));
    
    for i = 1:length(probabilities1)
        probabilities(1, i) = probabilities1(i);
        probabilities(2, i) = i;
    end
    
    probabilities = sortrows(probabilities', 1)';
    probabilities(1, :) = cumsum(probabilities(1, :));
end


function edgeWeight = CalculateEdgeWeight(i, j, pheromoneLevels, visibilities, alpha, beta)
    edgeWeight = pheromoneLevels(i, j)^alpha * visibilities(i, j)^beta;
    
    if edgeWeight == 0
       edgeWeight = realmin;
    end
end