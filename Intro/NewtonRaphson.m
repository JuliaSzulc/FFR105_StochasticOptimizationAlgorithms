function iterates = NewtonRaphson(coefficients, startingPoint, tolerance)
    if length(coefficients) < 3
        fprintf('ERROR: The degree of the polynomial must be 2 or larger!')
        exit;
    end

    x = Inf;
    nextX = startingPoint;
    iterates = [];

    while abs(nextX - x) > tolerance
        iterates = [iterates, nextX];

        x = nextX;
        firstOrderOfX = Polynomial(x, PolynomialDifferentiation(coefficients, 1));
        secondOrderOfX = Polynomial(x, PolynomialDifferentiation(coefficients, 2));

        if secondOrderOfX == 0
            fprintf('ERROR: The second order derivative is 0 in x=%f!', x)
            exit;
        end


        nextX = NewtonRaphsonStep(x, firstOrderOfX, secondOrderOfX);
    end
end
