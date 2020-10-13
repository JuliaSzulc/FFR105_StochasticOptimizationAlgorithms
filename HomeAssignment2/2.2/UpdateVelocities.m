function newVelocities = UpdateVelocities(velocities, c1, c2, positions, bestIndividualPositions,...
    bestPosition, maxVelocity, inertiaWeight)
    newVelocities = zeros(size(velocities));

    cognitiveComponents = CalculateCognitiveComponents(c1, positions, bestIndividualPositions);
    socialComponents = CalculateSocialComponents(c2, positions, bestPosition);

    newVelocities = inertiaWeight * velocities + cognitiveComponents + socialComponents;
    
    newVelocities(velocities > maxVelocity) = maxVelocity;
    newVelocities(velocities < -maxVelocity) = -maxVelocity;
end