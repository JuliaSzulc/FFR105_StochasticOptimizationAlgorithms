function nextCity = GetNextCity(currentCity, tabuList, pheromoneLevels, visibilities, alpha, beta)
    nCities = length(tabuList);
    stream = RandStream('mlfg6331_64');

    probabilities = GenerateProbabilities(currentCity, tabuList, pheromoneLevels, ...
        visibilities, alpha, beta);

    disp(mat2str(probabilities));
    nextCity = randsample(stream, 1:nCities, 1, true, probabilities);
end