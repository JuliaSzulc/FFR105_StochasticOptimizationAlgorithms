function functionValue = CalculateFunctionValue(x)
    a = x(1);
    b = x(2);

    factor1Part1 = (a + b + 1)^2;
    factor1Part2 = 19 - 14 * a + 3 * a^2 - 14 * b + 6 * a * b + 3 * b^2;
    factor1 = 1 + factor1Part1 * factor1Part2;
    
    factor2Part1 = (2 * a - 3 * b)^2;
    factor2Part2 = 18 - 32 * a + 12 * a^2 + 48 * b - 36 * a * b + 27 * b^2;
    factor2 = 30 + factor2Part1 * factor2Part2;

    functionValue = factor1 * factor2;
end
