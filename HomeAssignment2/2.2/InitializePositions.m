function positions = InitializePositions(nParticles, nDimensions, xMin, xMax)
    positions = zeros(nParticles, nDimensions);
    shifts = rand(nParticles, nDimensions) * (xMax - xMin);

    positions = positions + xMin + shifts;
end
