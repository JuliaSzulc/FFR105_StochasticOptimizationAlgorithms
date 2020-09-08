function f = EvaluateIndividual(x)
    a = x(1);
    b = x(2);

    fNumerator1 = exp(-a^2 - b^2);
    fNumerator2 = sqrt(5) * sin(b * a^2)^2;
    fNumerator3 = 2 * cos(2 * a + 3 * b)^2;
    fDenominator = 1 + a^2 + b^2;

    f = (fNumerator1 + fNumerator2 + fNumerator3) / fDenominator;
end
