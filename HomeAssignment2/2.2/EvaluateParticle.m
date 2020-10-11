function performance = EvaluateParticle(position)
    [x, y] = deal(position(1), position(2));
    performance = (x^2 + y - 11)^2 + (x + y^2 - 7)^2;
end
