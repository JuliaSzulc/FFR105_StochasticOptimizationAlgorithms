function nextCity = GetNextCity(currentCity, tabuList, pheromoneLevels, visibilities, alpha, beta)
    nCities = length(tabuList);
    stream = RandStream('mlfg6331_64');

    probabilities = GenerateProbabilities(currentCity, tabuList, pheromoneLevels, ...
        visibilities, alpha, beta);

    index = probabilities(2, probabilities(1, :)>=rand);
    nextCity = index(1);
end