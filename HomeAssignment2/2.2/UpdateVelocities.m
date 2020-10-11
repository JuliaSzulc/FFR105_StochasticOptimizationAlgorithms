function velocities = UpdateVelocities(velocities, c1, c2, positions, bestIndividualPositions,...
    bestIndividualPerformances, maxVelocity, inertiaWeight)
    cognitiveComponents = CalculateCognitiveComponents(c1, positions, bestIndividualPositions);
    socialComponents = CalculateSocialComponents(c2, positions, bestIndividualPerformances);

    velocities = inertiaWeight * velocities + cognitiveComponents + socialComponents;
    velocities(abs(velocities) > maxVelocity) = maxVelocity;
end