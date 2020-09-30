clear all;

POPULATION_SIZE = 10;
CROSSOVER_PROBABILITY = 0.8;
MUTATION_PROBABILITY = 0.02;
TOURNAMENT_SELECTION_PARAMETER = 0.75;
TOURNAMENT_SIZE = 2;
NUMBER_OF_VARIABLES = 2;
VARIABLE_RANGE = 10.0;
NUMBER_OF_GENERATIONS = 100;
ELITISM_PARAMETER = 1;

cityLocations = LoadCityLocations();
nCities = size(cityLocations, 1);
cityDistances = CalculateDistances(cityLocations);

fitness = zeros(POPULATION_SIZE, 1);
population = InitializePopulation(POPULATION_SIZE, nCities);

for iGeneration = 1:1
    % Evaluation
    for i = 1:POPULATION_SIZE
        chromosome = population(i, :);
        fitness(i) = EvaluateIndividual(chromosome, cityDistances);
    end

    tempPopulation = population;
end