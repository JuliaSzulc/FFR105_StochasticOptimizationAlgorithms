function pathLength = GetPathLength(path, cityLocations)
    pathLength = 0;

    currentCity = path(end);

    for nextCity = path
        distance = CalculateDistance(currentCity, nextCity, cityLocations);
        pathLength = pathLength + distance;

        currentCity = nextCity;
    end
end
