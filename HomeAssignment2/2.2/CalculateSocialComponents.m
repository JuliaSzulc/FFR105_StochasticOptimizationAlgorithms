function socialComponents = CalculateSocialComponents(constant, positions, bestPosition)
    socialComponents = constant * rand(size(positions)) .* (bestPosition - positions);
end
