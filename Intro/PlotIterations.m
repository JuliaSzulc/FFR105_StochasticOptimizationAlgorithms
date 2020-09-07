function [] = PlotIterations(coefficients, iterates)
    padding = (max(iterates) - min(iterates)) / 5;
    xValues = linspace(min(iterates) - padding, max(iterates) + padding);

    plot(xValues, Polynomial(xValues, coefficients), 'blue');
    hold on;
    scatter(iterates, Polynomial(iterates, coefficients), 'blue');
end
