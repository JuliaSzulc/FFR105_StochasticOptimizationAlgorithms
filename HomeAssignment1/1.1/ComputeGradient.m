function gradient = ComputeGradient(x1, x2, mu)
    constraint = x1^2 + x2^2 - 1;

    x1PartialDeriv = 2 * (x1 - 1);
    x2PartialDeriv = 4 * (x2 - 2);

    if constraint > 0
        commonPenaltyDeriv = 4 * mu * (x1^2 + x2^2 -1);
        x1PartialDeriv = x1PartialDeriv + x1 * commonPenaltyDeriv;
        x2PartialDeriv = x2PartialDeriv + x2 * commonPenaltyDeriv;
    end

    gradient = [x1PartialDeriv, x2PartialDeriv];
end