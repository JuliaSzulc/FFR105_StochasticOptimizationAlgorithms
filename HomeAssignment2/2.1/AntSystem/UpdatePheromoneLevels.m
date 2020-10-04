function pheromoneLevels = UpdatePheromoneLevels(pheromoneLevels, deltaPheromoneLevels, rho)
    nCities = length(pheromoneLevels);

    for i = 1:nCities
        for j = 1:nCities
            if i == j
                continue;
            end

            pheromoneLevels(i, j) = ...
                (1 - rho) * pheromoneLevels(i, j) + deltaPheromoneLevels(i, j);
        end
    end
end
