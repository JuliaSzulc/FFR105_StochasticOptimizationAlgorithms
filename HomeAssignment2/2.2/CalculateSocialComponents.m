function socialComponents = CalculateSocialComponents(constant, positions, bestIndividualPerformances)
    socialComponents = constant * rand(size(positions)) .* (bestIndividualPerformances - positions);
end
