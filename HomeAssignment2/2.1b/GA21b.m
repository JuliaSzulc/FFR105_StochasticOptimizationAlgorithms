clear all;

POPULATION_SIZE = 10;
NUMBER_OF_GENERATIONS = 1;
MUTATION_PROBABILITY = 0.02;
% preparing data
cityLocations = LoadCityLocations();
nCities = size(cityLocations, 1);
cityDistances = CalculateDistances(cityLocations);

% initialization
fitness = zeros(POPULATION_SIZE, 1);
population = InitializePopulation(POPULATION_SIZE, nCities);

for iGeneration = 1:NUMBER_OF_GENERATIONS
    % evaluation
    for i = 1:POPULATION_SIZE
        chromosome = population(i, :);
        fitness(i) = EvaluateIndividual(chromosome, cityDistances);
    end

    tempPopulation = population;

    % roulette-wheel selection
    for i = 1:2:POPULATION_SIZE
        i1 = RouletteWheelSelect(fitness);
        i2 = RouletteWheelSelect(fitness);

        tempPopulation(i, :) = population(i1, :);
        tempPopulation(i + 1, :) = population(i2, :);
    end

    % mutations
    for i = 1:POPULATION_SIZE
        originalChromosome = tempPopulation(i, :);
        mutatedChromosome = Mutate(originalChromosome, MUTATION_PROBABILITY);
        tempPopulation(i, :) = mutatedChromosome;
    end

    population = tempPopulation;
end