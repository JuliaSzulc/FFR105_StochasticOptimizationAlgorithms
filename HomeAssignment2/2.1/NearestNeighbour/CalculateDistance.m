function distance = CalculateDistance(city1, city2, cityLocations)
    distance = norm(cityLocations(city1, :) - cityLocations(city2, :));
end