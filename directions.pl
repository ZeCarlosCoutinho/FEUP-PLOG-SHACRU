% -----------------------------------------------
% -----------------------------------------------
directionToCoordinates(1, [X, Y], [ResultX, ResultY]):-
	ResultY is Y - 1,
	ResultX is X - 1.
directionToCoordinates(2, [X, Y], [ResultX, ResultY]):-
	ResultY is Y - 1,
	ResultX is X.
directionToCoordinates(3, [X, Y], [ResultX, ResultY]):-
	ResultY is Y - 1,
	ResultX is X + 1.
directionToCoordinates(4, [X, Y], [ResultX, ResultY]):-
	ResultY is Y,
	ResultX is X - 1.
directionToCoordinates(0, [X, Y], [ResultX, ResultY]):-
	ResultY is Y,
	ResultX is X.
directionToCoordinates(5, [X, Y], [ResultX, ResultY]):-
	ResultY is Y,
	ResultX is X.
directionToCoordinates(6, [X, Y], [ResultX, ResultY]):-
	ResultY is Y,
	ResultX is X + 1.
directionToCoordinates(7, [X, Y], [ResultX, ResultY]):-
	ResultY is Y + 1,
	ResultX is X - 1.
directionToCoordinates(8, [X, Y], [ResultX, ResultY]):-
	ResultY is Y + 1,
	ResultX is X.
directionToCoordinates(9, [X, Y], [ResultX, ResultY]):-
	ResultY is Y + 1,
	ResultX is X + 1.
	
% -----------------------------------------------
% -----------------------------------------------

getNearDirections(0, NearDirections):- NearDirections = [0].
getNearDirections(1, NearDirections):- NearDirections = [4, 1, 2].
getNearDirections(2, NearDirections):- NearDirections = [1, 2, 3].
getNearDirections(3, NearDirections):- NearDirections = [2, 3, 6].
getNearDirections(4, NearDirections):- NearDirections = [7, 4, 1].
getNearDirections(5, NearDirections):- NearDirections = [0].
getNearDirections(6, NearDirections):- NearDirections = [3, 6, 9].
getNearDirections(7, NearDirections):- NearDirections = [8, 7, 4].
getNearDirections(8, NearDirections):- NearDirections = [9, 8, 7].
getNearDirections(9, NearDirections):- NearDirections = [6, 9, 8].

displayDirectionName(0):-write('Pass').
displayDirectionName(1):-write('Up-Left').
displayDirectionName(2):-write('Up').
displayDirectionName(3):-write('Up-Right').
displayDirectionName(4):-write('Left').
displayDirectionName(5):-write('Pass').
displayDirectionName(6):-write('Right').
displayDirectionName(7):-write('Down-Left').
displayDirectionName(8):-write('Down').
displayDirectionName(9):-write('Down-Right').
