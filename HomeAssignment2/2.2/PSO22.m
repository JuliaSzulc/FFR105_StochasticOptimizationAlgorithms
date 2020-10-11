clear all;

% Parameters
nParticles = 30;
nDimensions = 2;
nIterations = 100;
[xMin, xMax] = deal(-5, 5);
alpha = 0.99;
[c1, c2] = deal(2, 2);
maxVelocity = xMax - xMin;
[minIntertiaWeight, maxInertiaWeight] = deal(0.3, 1.4);
beta = 0.95;

% Initialization
positions = InitializePositions(nParticles, nDimensions, xMin, xMax);
velocities = InitializeVelocities(nParticles, nDimensions, xMin, xMax, alpha);

bestIndividualPerformances = inf(nParticles, 1);
bestIndividualPositions = inf(nParticles, nDimensions);

bestPerformance = inf;
bestPosition = inf(1, nDimensions);

inertiaWeight = maxInertiaWeight;

% Iterations
for i = 1:nIterations
    for iParticle = 1:nParticles
        position = positions(iParticle, :);

        % Evaluation
        performance = EvaluateParticle(position);

        % Look for new best positions
        if performance < bestIndividualPerformances(iParticle)
            bestIndividualPerformances(iParticle) = performance;
            bestIndividualPositions(iParticle, :) = position;

            if performance < bestPerformance
                bestPerformance = performance;
                bestPosition = position;

                fprintf('Iteration: %d, bestPerformance: %.6f, bestPosition: (%.6f, %.6f)\n',...
                    i, bestPerformance, bestPosition);
            end
        end
    end

    % Update velocities, positions and inertia weight
    velocities = UpdateVelocities(velocities, c1, c2, positions, bestIndividualPositions,...
        bestIndividualPerformances, maxVelocity, inertiaWeight);
    positions = positions + velocities;
    inertiaWeight = UpdateInertiaWeight(inertiaWeight, beta, minIntertiaWeight);
end
