clear all;
addpath('../TSPgraphics');

cityLocations = LoadCityLocations();
pathLength = GetNearestNeighbourPathLength(cityLocations);

fprintf('Nearest neighbour path length: %f\n', pathLength);
