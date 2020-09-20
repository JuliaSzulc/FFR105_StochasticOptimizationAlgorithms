function x = DecodeChromosome(chromosome, nVariables, variableRange)
    nGenes = size(chromosome, 2);
    genesPerVariable = nGenes / nVariables;

    x = zeros(1, nVariables);
    
    for iVariable = 1:nVariables
        shift = (iVariable - 1) * genesPerVariable;

        for i = 1:genesPerVariable
            x(iVariable) = x(iVariable) + chromosome(i + shift) * 2^(-i);
        end
        x(iVariable) = -variableRange + (2 * variableRange * x(iVariable) / (1 - 2^(-genesPerVariable)));
    end
end
