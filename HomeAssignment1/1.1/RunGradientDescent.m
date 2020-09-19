function x = RunGradientDescent(startingX, mu, stepLength, threshold)
    x = startingX;

    while true
        gradient = ComputeGradient(x(1), x(2), mu);

        if norm(gradient) < threshold
            break;
        end

        x = x - stepLength * gradient;
    end
end