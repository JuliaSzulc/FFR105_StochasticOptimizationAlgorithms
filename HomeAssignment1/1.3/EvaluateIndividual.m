function fitnessValue = EvaluateIndividual(x)
    functionValue = CalculateFunctionValue(x);
    fitnessValue = 1 / functionValue; 
end
