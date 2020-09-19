function x = DecodeChromosome(chromosome, variableRange)
    nGenes = size(chromosome, 2);
    nHalf = fix(nGenes / 2);

    x(1) = 0.0;
    for i = 1:nHalf
        x(1) = x(1) + chromosome(i) * 2^(-i);
    end
    x(1) = -variableRange + (2 * variableRange * x(1) / (1 - 2^(-nHalf)));

    x(2) = 0.0;
    for i = 1:nHalf
        x(2) = x(2) + chromosome(i + nHalf) * 2^(-i);
    end
    x(2) = -variableRange + (2 * variableRange * x(2) / (1 - 2^(-nHalf)));
    
end
