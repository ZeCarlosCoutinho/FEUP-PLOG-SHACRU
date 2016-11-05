
:- include('casinhas.pl').


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

printBoard:-
	printDownBorder, %experiencia
	T=	[[[2, 0],[0, 0],[1, 0],[1, 2],[1, 2],[0, 0],[2, 0],[2, 0],[1, 3]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[0, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[1, 0],[1, 0],[2, 0],[1, 9],[2, 0],[1, 0],[2, 0],[1, 0],[2, 0]],
		[[2, 4],[2, 0],[1, 0],[2, 0],[2, 0],[1, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 9]],
		[[0, 0],[0, 0],[1, 0],[2, 0],[2, 0],[2, 0],[2, 0],[0, 0],[1, 0]]],
	displayBoard(T, 1),
	printDownBorder.
printBoard(T):-
	printDownBorder, %experiencia
	displayBoard(T, 1),
	printDownBorder.

% Predicados

movePeca(Jogador, Peca, Direcao).
colocaMarcador(Jogador, Casa).
giraPeca(Jogador, Peca, Direcao). % 0 - Nao gira, 1 - 45º contra-relogio, 2 - 45º sentido relogio
podeMoverPeca(Jogador, Peca, Direcao). %- Verifica se uma peca pode ser movida na direcao escolhida
mudouDeSeccao(Jogador, Peca, Direcao). %- Verifica se uma peca mudou de seccao
alcancavel(Jogador, Peca, Casa). %- Verifica se, nesse momento, é possivel determinada peça, com um numero qualquer de jogadaschegar a uma determinada casa
casaTemPeca(Casa). %
casaTemMarcadorOposto(Jogador, Casa). %
contaMarcadores(Jogador, Tabuleiro, Contador). %
fimDeJogo. %


getLine(Board, Line, LineNumber):- getLine(Board, Line, LineNumber, 1). % Iterator = 1
getLine([], ResultLine, LineNumber, Iterator):- %If lineNumber is greater that the board size
	write('Line not existent'), nl, fail.
getLine([Line|Rest], ResultLine, LineNumber, LineNumber):- % When Iterator = LineNumber
	ResultLine = Line.
getLine([Line|Rest], ResultLine, LineNumber, Iterator):- % Iterates across the lines of the board
	IteratorPlus is Iterator + 1,
	getLine(Rest, ResultLine, LineNumber, IteratorPlus).


getLineElement(Line, Tile, ColumnNumber):- getLineElement(Line, Tile, ColumnNumber, 1).
getLineElement([], _, _, _):-
	write('Column not existent'), nl, fail.
getLineElement([Element|Rest], Tile, ColumnNumber, ColumnNumber):-
	Tile = Element.
getLineElement([Element|Rest], Tile, ColumnNumber, Iterator):-
	IteratorPlus is Iterator + 1,
	getLineElement(Rest, Tile, ColumnNumber, IteratorPlus).


getTile(Board, Tile, LineNumber, ColumnNumber):-
	getLine(Board, Line, LineNumber), !, % - Avoids redoing getLine
	getLineElement(Line, Tile, ColumnNumber),
	write(Tile).

showLine(LineNumber):-
	T=	[[[2, 0],[0, 0],[1, 0],[1, 2],[1, 2],[0, 0],[2, 0],[2, 0],[1, 3]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[0, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[1, 0],[1, 0],[2, 0],[1, 9],[2, 0],[1, 0],[2, 0],[1, 0],[2, 0]],
		[[2, 4],[2, 0],[1, 0],[2, 0],[2, 0],[1, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 9]],
		[[0, 0],[0, 0],[1, 0],[2, 0],[2, 0],[2, 0],[2, 0],[0, 0],[1, 0]]],
	getLine(T, Line, LineNumber),
	write(Line).

showTile(LineNumber, ColumnNumber):-
	T=	[[[2, 0],[0, 0],[1, 0],[1, 2],[1, 2],[0, 0],[2, 0],[2, 0],[1, 3]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[0, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[1, 0],[1, 0],[2, 0],[1, 9],[2, 0],[1, 0],[2, 0],[1, 0],[2, 0]],
		[[2, 4],[2, 0],[1, 0],[2, 0],[2, 0],[1, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 9]],
		[[0, 0],[0, 0],[1, 0],[2, 0],[2, 0],[2, 0],[2, 0],[0, 0],[1, 0]]],
	getTile(T, Tile, LineNumber, ColumnNumber).
	
jogadasValidas(Tabuleiro, Jogador, Peca, []).