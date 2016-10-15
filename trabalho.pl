
:- include('casinhas.pl').


run:-
	write('\33\[2J'), nl,
	write('\t\t#############################################'), nl, nl,
	write('\t\t####               SHACRU                ####'), nl, nl,
	write('\t\t#############################################'), nl, nl,
	startingBoard(T), startBoard(T).
/*
% Game board
startingBoard([[2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0],
	   [2, 0, 0, 0, 0, 0, 0, 3, 0]).

board([[2, 5, 6, 7, 8, 9, 10, 3],
	   [11, 12, 13, 14, 15, 16, 17, 18],
	   [19, 20, 21, 22, 23, 24, 25, 26],
	   [27, 28, 29, 0, 0, 30, 31, 32],
	   [33, 34, 35, 0, 0, 36, 37, 38],
	   [39, 40, 41, 42, 43, 44, 45, 46],
	   [47, 48, 49, 50, 51, 52, 53, 54],
	   [4, 55, 56, 57, 58, 59, 60, 1]]).

printRowSeparator:-
	write('# ------------------------------------- #'), nl.

printDownBorder:-
	write('#########################################').

printBorder:-
    write('#').

printColSeparator:-
    write('|').

printTopBorder:-
	write('#################'), nl,
    write('#   |   |   |   #'), nl,
    write('#   | 1 | 2 | 3 #'), nl,
    write('#   |   |   |   #'), nl,
    printRowSeparator, nl.

% Prints a line of the game board
displayRowA([]).

displayRowA([C]):-
	translate(C, 1),
	printBorder.

displayRowA([C|Cs]):-
	translate(C, 1),
	printColSeparator,
	displayRowA(Cs).

displayRowB([]).

displayRowB([C]):-
	translate(C, 2),
	printBorder.

displayRowB([C|Cs]):-
	translate(C, 2),
	printColSeparator,
	displayRowB(Cs).

displayRowC([]).

displayRowC([C]):-
	translate(C, 3),
	printBorder.

displayRowC([C|Cs]):-
	translate(C, 3),
	printColSeparator,
	displayRowC(Cs).

% Prints the game board
startBoard(T):-
	printTopBorder,
	displayBoard(T, 0).

displayBoard([T], N):-
    X is N+1,
    write('#   |'),
	displayRowA(T), nl,
    write('# '), write(X), write(' |'),
	displayRowB(T), nl,
    write('#   |'),    
	displayRowC(T), nl,
	printDownBorder, nl.


displayBoard([T|Ts], N):-
    X is N+1,
    write('#   |'),
	displayRowA(T), nl,
    write('# '), write(X), write(' |'),
	displayRowB(T), nl,
    write('#   |'),    
	displayRowC(T), nl,
	printRowSeparator, nl,
	displayBoard(Ts, X).
	
 ------------------- */
 printRowSeparator:-
	write('# --------------------------------------------------- #'), nl.

printDownBorder:-
	write('#########################################'), nl.

printBorder:-
    write('#').

printColSeparator:-
    write('|').
	
/*pair[playermarkercolor, direction]
startingBoard([	[[2, 9],[0, 0],[1, 8],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[1, 2],[0, 0],[0, 0],[0, 0],[2, 2],[0, 0],[1, 1]]
]).*/
startingBoard:-[	[[2, 9],[0, 0],[1, 8],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[1, 2],[0, 0],[0, 0],[0, 0],[2, 2],[0, 0],[1, 1]]
].
printLine(LineNumber, []).
printLine(LineNumber, [Pair]):-
	marking(LineNumber, Pair).
printLine(LineNumber, [Pair|Rest]):-
	marking(LineNumber, Pair),
	write(' | '),
	printLine(LineNumber, Rest).
	
printRow(Row):-
	write('# '), printLine(1, Row), write(' #'), nl,
	write('# '), printLine(2, Row), write(' #'), nl, 
	write('# '), printLine(3, Row), write(' #'), nl.

displayBoard([]).
displayBoard([Row]):-
	printRowSeparator,
	printRow(Row),
	printRowSeparator.
displayBoard([Row|Rest]):-
	printRowSeparator,
	printRow(Row),
	displayBoard(Rest).
	
printBoard(1):-
	printDownBorder, %experiencia
	displayBoard([	[[2, 9],[0, 0],[1, 8],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
				[[0, 0],[0, 0],[1, 2],[0, 0],[0, 0],[0, 0],[2, 2],[0, 0],[1, 1]]]),
		
	printDownBorder.
printBoard(T):-
	printDownBorder, %experiencia
	displayBoard(T),
	printDownBorder.

% Game predicates

% Moves the marker of a player to a different tile
% moveMarker(Player, Tile).
%gameEnd(G)
