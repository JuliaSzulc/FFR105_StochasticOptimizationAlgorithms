function visibility = GetVisibility(cityLocations)
    nCities = length(cityLocations);

    visibility = inf(nCities, nCities);

    for i = 1:nCities
        for j = (i + 1):nCities
            distanceBetween = CalculateDistance(i, j, cityLocations);

            pathVisibility = inv(distanceBetween);
            visibility(i, j) = pathVisibility;
            visibility(j, i) = pathVisibility;
        end
    end
end
