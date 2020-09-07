function derivCoefficients = PolynomialDifferentiation(coefficients, order)
    % 'coefficients': [a0, a1, ..., an]
    derivCoefficients = coefficients;

    for i = 1:order
        if length(derivCoefficients) < 2
            derivCoefficients = [];
            break;
        end

        newDerivCoefficients = zeros(1, length(derivCoefficients) - 1);
        for j = 1:length(newDerivCoefficients)
            newDerivCoefficients(j) = derivCoefficients(j + 1) * j;
        end

        derivCoefficients = newDerivCoefficients;
    end
end
