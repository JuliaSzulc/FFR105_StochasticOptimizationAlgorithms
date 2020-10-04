function deltaPheromoneLevels = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)
    [nPaths, nCities] = size(pathCollection);
    deltaPheromoneLevels = zeros(nCities, nCities);

    for i = 1:nPaths
        path = pathCollection(i, :);
        pathLength = pathLengthCollection(i);

        currentCity = path(end);
        for nextCity = 1:nCities
            antPheromone = inv(pathLength);
            deltaPheromoneLevels(currentCity, nextCity) = ...
                deltaPheromoneLevels(currentCity, nextCity) + antPheromone;
        end
    end
end
