function nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocations)
    nCities = length(cityLocations);
    tabuList = false(1, nCities);
    nearestNeighbourPathLength = 0;
    startCity = randi(nCities);
    
    currentCity = startCity;
    tabuList(currentCity) = true;

    for i = 1:(nCities - 1)
        [nextCity, distance] = FindNearestNeighbour(tabuList, currentCity, cityLocations);
        
        nearestNeighbourPathLength = nearestNeighbourPathLength + distance;
        tabuList(nextCity) = true;
        currentCity = nextCity;
    end
    
    nearestNeighbourPathLength = nearestNeighbourPathLength +...
        CalculateDistance(currentCity, startCity, cityLocations);
end
