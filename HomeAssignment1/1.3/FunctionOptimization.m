POPULATION_SIZE = 100;
NUMBER_OF_GENES = 50;
CROSSOVER_PROBABILITY = 0.8;
MUTATION_PROBABILITY = 0.025;
TOURNAMENT_SELECTION_PARAMETER = 0.75;
TOURNAMENT_SIZE = 2;
NUMBER_OF_VARIABLES = 2;
VARIABLE_RANGE = 10.0;
NUMBER_OF_GENERATIONS = 100;
NUMBER_OF_COPIES_OF_BEST = 1;

fitness = zeros(POPULATION_SIZE,1);

fitnessFigureHandle = figure;
hold on;
% set(fitnessFigureHandle, 'Position', [50, 50, 500, 200]);
set(fitnessFigureHandle, 'DoubleBuffer', 'on');
axis([1 NUMBER_OF_GENERATIONS 0 0.01]);
bestPlotHandle = plot(1:NUMBER_OF_GENERATIONS, zeros(1, NUMBER_OF_GENERATIONS));
textHandle = text(30, 2.6, sprintf('best: %4.3f', 0.0));
hold off;
drawnow;

population = InitializePopulation(POPULATION_SIZE, NUMBER_OF_GENES);

for iGeneration = 1:NUMBER_OF_GENERATIONS
    for i = 1:POPULATION_SIZE
        chromosome = population(i, :);
        x = DecodeChromosome(chromosome, NUMBER_OF_VARIABLES, VARIABLE_RANGE);
        fitness(i) = EvaluateIndividual(x);
    end

    tempPopulation = population;

    for i = 1:2:POPULATION_SIZE
        i1 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        i2 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);

        chromosome1 = population(i1, :);
        chromosome2 = population(i2, :);

        if rand < CROSSOVER_PROBABILITY
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(i, :) = newChromosomePair(1, :);
            tempPopulation(i + 1, :) = newChromosomePair(2, :);
        else
            tempPopulation(i, :) = chromosome1;
            tempPopulation(i + 1, :) = chromosome2;
        end
    end

    for i = 1:POPULATION_SIZE
        originalChromosome = tempPopulation(i, :);
        mutatedChromosome = Mutate(originalChromosome, MUTATION_PROBABILITY);
        tempPopulation(i, :) = mutatedChromosome;
    end

    % Elitism
    maximumFitness = 0.0;
    xBest = zeros(1,2);
    bestIndividual = zeros(1, NUMBER_OF_GENES);

    for i = 1:POPULATION_SIZE
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, NUMBER_OF_VARIABLES, VARIABLE_RANGE);

        fitness(i) = EvaluateIndividual(x);
        if fitness(i) > maximumFitness
            maximumFitness = fitness(i);
            bestIndividual = chromosome;
            xBest = x;
        end
    end

    tempPopulation = InsertBestIndividual(population, bestIndividual, NUMBER_OF_COPIES_OF_BEST);
    population = tempPopulation;

    plotvector = get(bestPlotHandle, 'YData');
    plotvector(iGeneration) = maximumFitness;
    set(bestPlotHandle, 'YData', plotvector);
    set(textHandle, 'String', sprintf('best: %4.3f', maximumFitness));
    drawnow;
end

fprintf('xBest: (%f, %f)\n', xBest);
fprintf('maximumFitness: %f', maximumFitness);

function newPopulation = createNextGeneration(population)
    
end