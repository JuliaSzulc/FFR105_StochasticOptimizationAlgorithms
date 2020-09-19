clear all;

STARTING_X = [1, 2];

STEP_LENGTH = 1e-4;
THRESHOLD = 1e-6;
MU_VALUES = [1, 10, 100, 1000];

rowsNumber = length(MU_VALUES);
outputSize = [rowsNumber, 3];
columnNames = {'mu', 'x1*', 'x2*'};
columnTypes = {'double', 'double', 'double'};
output = table('Size', outputSize, 'VariableTypes', columnTypes, 'VariableNames', columnNames);

for i = 1:rowsNumber
    mu = MU_VALUES(i);

    x = RunGradientDescent(STARTING_X, mu, STEP_LENGTH, THRESHOLD);
    x = round(x, 3);

    output(i, :) = {mu, x(1), x(2)};
end

disp(output);
