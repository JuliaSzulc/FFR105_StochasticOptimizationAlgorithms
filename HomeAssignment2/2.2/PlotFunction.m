X = linspace(-5, 5);
Y = linspace(-5, 5);
Z = Calculate(X, Y);
contour(X, Y, Z, 30);
hold on;

minima = [3 2; -3.78 -3.28; -2.81 3.13; 3.58 -1.85];
scatter(minima(:, 1), minima(:, 2), 'filled')

xlabel('x');
ylabel('y');


function Z = Calculate(X, Y)
    nX = length(X);
    nY = length(Y);

    Z = zeros(nY, nX);
    for j = 1:nY
        for i = 1:nX
            x = X(i);
            y = Y(j);
            
            z = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
            % z = log(0.01 + z);
            
            Z(j, i) = z;
        end
    end
end
