function pheromoneLevel = InitializePheromoneLevels(nCities, tau0)
    pheromoneLevel = zeros(nCities, nCities) + tau0;
end
