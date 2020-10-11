function cognitiveComponents = CalculateCognitiveComponents(constant, positions, bestIndividualPositions)
    cognitiveComponents = constant * rand(size(positions)) .* (bestIndividualPositions - positions);
end
