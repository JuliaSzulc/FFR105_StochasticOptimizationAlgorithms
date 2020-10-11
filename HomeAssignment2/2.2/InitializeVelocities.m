function velocities = InitializeVelocities(nParticles, nDimensions, xMin, xMax, alpha)
    velocities = zeros(nParticles, nDimensions);
    shifts = rand(nParticles, nDimensions) * (xMax - xMin);
    center = (xMax - xMin) / 2;

    velocities = alpha * (velocities - center + shifts);
end
