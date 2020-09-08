function iSelected = TournamentSelect(fitness, pTournament)
    populationSize = size(fitness, 1);

    iDrawn1 = 1 + fix(rand * populationSize);
    iDrawn2 = 1 + fix(rand * populationSize);

    if rand < pTournament
        if fitness(iDrawn1) > fitness(iDrawn2)
            iSelected = iDrawn1;
        else
            iSelected = iDrawn2;
        end
    else
        if fitness(iDrawn1) > fitness(iDrawn2)
            iSelected = iDrawn2;
        else
            iSelected = iDrawn1;
        end
    end
end
