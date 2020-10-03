function cityDistances = CalculateDistances(cityLocations)
    % cityDistances(i, j) - distance between cities i and j
    nCities = size(cityLocations, 1);
    cityDistances = zeros(nCities, nCities);

    for i = 1:nCities
        for j = (i + 1):nCities
            euclideanDistance = norm(cityLocations(i, :) - cityLocations(j, :));
            cityDistances(i, j) = euclideanDistance;
            cityDistances(j, i) = euclideanDistance;
        end
    end
end
