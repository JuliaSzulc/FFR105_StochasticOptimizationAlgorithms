function mutatedChromosome = Mutate(chromosome, mutationProbability)
    nGenes = size(chromosome, 2);
    mutatedChromosome = chromosome;

    for i = 1:nGenes
        if rand < mutationProbability
            mutatedChromosome(i) = 1 - chromosome(i);
        end
    end
end
