function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
    populationSize = size(fitness, 1);

    tournamentIndexes = fix(rand(1, tournamentSize) * populationSize) + 1;
    
    tournamentFitness = zeros(1, tournamentSize);
    for i = 1:tournamentSize
        tournamentFitness(i) = fitness(tournamentIndexes(i));
    end
    [~, sortKey] = sort(tournamentFitness, 'descend');

    % selecting the worst individual
    iSelected = tournamentIndexes(sortKey(end));

    % for tournament size n at most n-1 checks are needed because if only
    % one individual is left it is going do be selected anyway
    for i = 1:(tournamentSize - 1)
        if rand < pTournament
            iSelected = tournamentIndexes(sortKey(i));
            break;
        end
    end
end
