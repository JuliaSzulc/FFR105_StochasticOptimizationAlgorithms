function y = Polynomial(x, coefficients)
    % 'coefficients': [a0, a1, ..., an]
    y = 0;
    for i = 1:length(coefficients)
        coeff = coefficients(i);
        degree = i - 1;
        
        y = y + coeff * x.^degree;
    end
end
