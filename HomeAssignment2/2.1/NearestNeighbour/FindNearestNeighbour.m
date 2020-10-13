function [nextCity, distance] = findNearestNeighbour(tabuList, currentCity, cityLocations)
    distance = inf;

    for iCity = 1:size(cityLocations, 1)
        if tabuList(iCity)
            continue;
        end
        
        newDistance = CalculateDistance(currentCity, iCity, cityLocations);
        if newDistance < distance
            distance = newDistance;
            nextCity = iCity;
        end
    end
end
