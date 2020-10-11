function inertiaWeight = UpdateInertiaWeight(inertiaWeight, beta, minInertiaWeight)
    if inertiaWeight == minInertiaWeight
        return
    end
    
    inertiaWeight = max(beta * inertiaWeight, minInertiaWeight);
end
