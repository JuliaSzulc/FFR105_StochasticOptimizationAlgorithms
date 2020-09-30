function pathLength = CalculatePathLength(permutation, cityDistances)
    pathLength = 0;
    currentCity = permutation(end);

    for nextCity = permutation
        pathLength = pathLength + cityDistances(currentCity, nextCity);
        currentCity = nextCity;
    end
end
