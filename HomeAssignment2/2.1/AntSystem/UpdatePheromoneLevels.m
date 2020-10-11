function pheromoneLevels = UpdatePheromoneLevels(pheromoneLevels, deltaPheromoneLevels, rho)
    pheromoneLevels = (1 - rho) * pheromoneLevels + deltaPheromoneLevels;
end
