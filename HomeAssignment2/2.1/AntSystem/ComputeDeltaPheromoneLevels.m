function deltaPheromoneLevels = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)
    [nPaths, nCities] = size(pathCollection);
    deltaPheromoneLevels = zeros(nCities, nCities);

    for i = 1:nPaths
        path = pathCollection(i, :);
        pathLength = pathLengthCollection(i);

        currentCity = path(end);
        for nextCity = path
            antPheromone = inv(pathLength);
            deltaPheromoneLevels(currentCity, nextCity) = ...
                deltaPheromoneLevels(currentCity, nextCity) + antPheromone;
            currentCity = nextCity;
        end
    end
end
