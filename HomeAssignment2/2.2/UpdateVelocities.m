function velocities = UpdateVelocities(velocities, c1, c2, positions, bestIndividualPositions,...
    bestIndividualPerformances, maxVelocity)
    cognitiveComponents = CalculateCognitiveComponents(c1, positions, bestIndividualPositions);
    socialComponents = CalculateSocialComponents(c2, positions, bestIndividualPerformances);

    velocities = velocities + cognitiveComponents + socialComponents;
    velocities(abs(velocities) > maxVelocity) = maxVelocity;
end