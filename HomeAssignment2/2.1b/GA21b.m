clear all;
addpath('TSPgraphics');

POPULATION_SIZE = 100;
NUMBER_OF_GENERATIONS = 3000;
MUTATION_PROBABILITY = 0.02;
ELITISM_PARAMETER = 1;

% preparing data
cityLocations = LoadCityLocations();
nCities = size(cityLocations, 1);
cityDistances = CalculateDistances(cityLocations);

tspFigure = InitializeTspPlot(cityLocations, [0 20 0 20]); 
connection = InitializeConnections(cityLocations);
plottedShortestPath = zeros(1, nCities);

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

    % elitism
    maximumFitness = 0.0;
    shortestPathLength = 0.0;
    shortestPath = zeros(1, nCities);

    for i = 1:POPULATION_SIZE
        chromosome = population(i, :);
        fitness(i) = EvaluateIndividual(chromosome, cityDistances);

        if fitness(i) > maximumFitness
            maximumFitness = fitness(i);
            shortestPath = chromosome;
            shortestPathLength = CalculatePathLength(shortestPath, cityDistances);
        end
    end

    population = InsertBestIndividual(tempPopulation, shortestPath, ELITISM_PARAMETER);

    if ~isequal(shortestPath, plottedShortestPath)
        PlotPath(connection, cityLocations, shortestPath);
        plottedShortestPath = shortestPath;
    end
end

fprintf('shortestPathLength: %f\n', shortestPathLength);
fprintf('shortestPath: %s', mat2str(shortestPath));
