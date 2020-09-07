function nextX = NewtonRaphsonStep(x, firstOrderOfX, secondOrderOfX)
    nextX = x - firstOrderOfX / secondOrderOfX;
end
