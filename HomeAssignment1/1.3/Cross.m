function newChromosomePair = Cross(chromosome1, chromosome2)
    nGenes = size(chromosome1, 2);
    crossoverPoint = 1 + fix(rand * (nGenes - 1));

    newChromosomePair = zeros(2, nGenes);
    for i = 1:nGenes
        if i <= crossoverPoint
            newChromosomePair(1, i) = chromosome1(i);
            newChromosomePair(2, i) = chromosome2(i);
        else
            newChromosomePair(1, i) = chromosome2(i);
            newChromosomePair(2, i) = chromosome1(i);
        end
    end
end
