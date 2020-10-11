clear all;

% Parameters
nParticles = 50;
nDimensions = 2;
nIterations = 1000;
[xMin, xMax] = deal(-5, 5);
alpha = 1;
[c1, c2] = deal(2, 2);
maxVelocity = xMax - xMin;

% Initialization
positions = InitializePositions(nParticles, nDimensions, xMin, xMax);
velocities = InitializeVelocities(nParticles, nDimensions, xMin, xMax, alpha);

bestIndividualPerformances = inf(nParticles, 1);
bestIndividualPositions = inf(nParticles, nDimensions);

bestPerformance = inf;
bestPosition = inf(1, nDimensions);

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

                fprintf('Iteration: %d, bestPerformance: %.4f, bestPosition: (%.4f, %.4f)\n',...
                    i, bestPerformance, bestPosition);
            end
        end
    end

    % Update velocities and positions
    velocities = UpdateVelocities(velocities, c1, c2, positions, bestIndividualPositions,...
        bestIndividualPerformances, maxVelocity);
    positions = positions + velocities;
end
