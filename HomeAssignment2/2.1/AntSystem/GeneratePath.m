function path = GeneratePath(pheromoneLevels, visibility, alpha, beta)
    nCities = length(pheromoneLevels);

    path = zeros(1, nCities);
    tabuList = false(1, nCities);

    currentCity = randi(nCities);
    path(1) = currentCity;
    tabuList(currentCity) = true;

    for i = 2:nCities
        nextCity = GetNextCity(currentCity, tabuList, pheromoneLevels, visibility, alpha, beta);

        path(i) = nextCity;
        tabuList(nextCity) = true;

        currentCity = nextCity;
    end
end