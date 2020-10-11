function pheromoneLevel = InitializePheromoneLevels(nCities, tau0)
    pheromoneLevel = zeros(nCities, nCities);
    for i = 1:nCities
        for j = 1:nCities
            if i == j
                continue;
            end
            pheromoneLevel(i, j) = tau0;
        end
    end
end
