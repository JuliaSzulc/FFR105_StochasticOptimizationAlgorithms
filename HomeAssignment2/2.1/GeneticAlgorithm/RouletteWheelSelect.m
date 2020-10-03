function iSelected = RouletteWheelSelect(fitness)
    populationSize = size(fitness, 1);
    fitnessSum = sum(fitness);

    randomNumber = rand;
    partialSum = 0;

    for i = 1:populationSize
        partialSum = partialSum + fitness(i);
        if partialSum / fitnessSum > randomNumber
            iSelected = i;
            break
        end
    end
end
