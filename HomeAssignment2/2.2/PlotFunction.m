X = linspace(-5, 5);
Y = linspace(-5, 5);
Z = Calculate(X, Y);
contour(X, Y, Z, 30);
xlabel('x');
ylabel('y');

function Z = Calculate(X, Y)
    nX = length(X);
    nY = length(Y);

    Z = zeros(nY, nX);
    for iY = 1:nY
        for iX = 1:nX
            z = f(X(iX), Y(iY));
            Z(iY, iX) = z;
        end
    end
end

function z = f(x, y)
    z = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
    z = log(0.01 + z);
end