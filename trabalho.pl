
:- include('casinhas.pl').


run:-
	write('\33\[2J'), nl,
	write('\t\t#############################################'), nl, nl,
	write('\t\t####               SHACRU                ####'), nl, nl,
	write('\t\t#############################################'), nl, nl,
	startingBoard(T), startBoard(T).

printRowSeparator:-
	write('# --------------------------------------------------- #'), nl.

printSectorSeparator:-
	write('# ################################################### #'), nl.
printDownBorder:-
	write('#######################################################'), nl.

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
printLine(LineNumber, [], Iterator).
printLine(LineNumber, [Pair], Iterator):-
	marking(LineNumber, Pair).
printLine(LineNumber, [Pair|Rest], 3):-
	marking(LineNumber, Pair),
	write(' # '),
	printLine(LineNumber, Rest, 1).
printLine(LineNumber, [Pair|Rest], Iterator):-
	IteratorPlus is Iterator + 1,
	marking(LineNumber, Pair),
	write(' | '),
	printLine(LineNumber, Rest, IteratorPlus).
	
printRow(Row):-
	write('# '), printLine(1, Row, 1), write(' #'), nl,
	write('# '), printLine(2, Row, 1), write(' #'), nl, 
	write('# '), printLine(3, Row, 1), write(' #'), nl.

displayBoard([], Iterator).
displayBoard([Row], Iterator):-
	printRow(Row).
displayBoard([Row|Rest], 3):- % Quando se faz o separador de secções
	printRow(Row),
	printSectorSeparator,
	displayBoard(Rest, 1).
displayBoard([Row|Rest], Iterator):-
	IteratorPlus is Iterator + 1,
	printRow(Row),
	printRowSeparator,
	displayBoard(Rest, IteratorPlus).
	
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
				[[0, 0],[0, 0],[1, 2],[0, 0],[0, 0],[0, 0],[2, 2],[0, 0],[1, 1]]], 1),
		
	printDownBorder.
printBoard(T):-
	printDownBorder, %experiencia
	displayBoard(T, 1),
	printDownBorder.

% Game predicates

% Moves the marker of a player to a different tile
% moveMarker(Player, Tile).
%gameEnd(G)
