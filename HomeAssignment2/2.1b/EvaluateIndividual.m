function fitnessValue = EvaluateIndividual(permutation, cityDistances)
    pathLength = CalculatePathLength(permutation, cityDistances);
    fitnessValue = inv(pathLength);
end
