function mutatedChromosome = Mutate(chromosome, mutationProbability)
    nGenes = size(chromosome, 2);
    mutatedChromosome = chromosome;

    for i = 1:nGenes
        if rand < mutationProbability
            j = 1 + fix(rand * nGenes);
            mutatedChromosome([i, j]) = mutatedChromosome([j, i]);
        end
    end
end
