
:- include('casinhas.pl').
:- include('teste.pl').


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
printLine(_, [], _).
printLine(LineNumber, [Pair], _Iterator):-
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

displayBoard([], _).
displayBoard([Row], _Iterator):-
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
/*
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
*/
%----------------------------------------------------------
%----------------------------------------------------------
getLine(Board, Line, LineNumber):- getLine(Board, Line, LineNumber, 1). % Iterator = 1
getLine([], _, _, _):- %If lineNumber is greater that the board size
	write('Line not existent'), nl, fail.
getLine([Line|_Rest], ResultLine, LineNumber, LineNumber):- % When Iterator = LineNumber
	ResultLine = Line.
getLine([_Line|Rest], ResultLine, LineNumber, Iterator):- % Iterates across the lines of the board
	IteratorPlus is Iterator + 1,
	getLine(Rest, ResultLine, LineNumber, IteratorPlus).
%----------------------------------------------------------
%----------------------------------------------------------

getLineElement(Line, Tile, ColumnNumber):- getLineElement(Line, Tile, ColumnNumber, 1).
getLineElement([], _, _, _):-
	write('Column not existent'), nl, fail.
getLineElement([Element|_Rest], Tile, ColumnNumber, ColumnNumber):-
	Tile = Element.
getLineElement([_Element|Rest], Tile, ColumnNumber, Iterator):-
	IteratorPlus is Iterator + 1,
	getLineElement(Rest, Tile, ColumnNumber, IteratorPlus).

%----------------------------------------------------------
%----------------------------------------------------------
getTile(Board, Tile, LineNumber, ColumnNumber):-
	getLine(Board, Line, LineNumber), !, % - Avoids redoing getLine
	getLineElement(Line, Tile, ColumnNumber),
	write(Tile), nl.
% -----------------------------------------------
% -----------------------------------------------
directionToCoordinates(1, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line - 1,
	ResultColumn is Column - 1.
directionToCoordinates(2, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line - 1,
	ResultColumn is Column.
directionToCoordinates(3, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line - 1,
	ResultColumn is Column + 1.
directionToCoordinates(4, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line,
	ResultColumn is Column - 1.
directionToCoordinates(0, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line,
	ResultColumn is Column.
directionToCoordinates(5, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line,
	ResultColumn is Column.
directionToCoordinates(6, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line,
	ResultColumn is Column + 1.
directionToCoordinates(7, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line + 1,
	ResultColumn is Column - 1.
directionToCoordinates(8, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line + 1,
	ResultColumn is Column.
directionToCoordinates(9, [Line, Column], [ResultLine, ResultColumn]):-
	ResultLine is Line + 1,
	ResultColumn is Column + 1.
% -----------------------------------------------
% -----------------------------------------------	

validMove(Board, Player, [_TileLine, _TileColumn], Direction):- %Checks if moving a player's piece in the Direction is a valid move.
	directionToCoordinates(Direction, [_TileLine, _TileColumn], [NextLine, NextColumn]),
	NextLine > 0, NextColumn > 0,
	NextLine < 10, NextColumn < 10,
	getTile(Board, [NextTilePlayer, NextTileDirection], NextLine, NextColumn), % Gets the next tile acording to the direction given
	!, (NextTilePlayer =:= Player ; NextTilePlayer =:= 0), % The next tile must be the from the players color, or no color
	NextTileDirection =:= 0. % The next tile must not have any piece there
% jogadasValidas(Tabuleiro, Jogador, Peca, []).

/*ESTA ERRADO*/
getValidMoves(Board, Player, [TileLine, TileColumn], Result):- getValidMoves(Board, Player, [TileLine, TileColumn], [], [1,2,3,4,5,6,7,8,9], Result).
getValidMoves(Board, Player, [TileLine, TileColumn], DirectionsList, [], Result):-
	Result = DirectionsList.
getValidMoves(Board, Player, [TileLine, TileColumn], DirectionsList, [ActualIterator | Rest], Result):- % Iterator is the directions
	(validMove(Board, Player, [TileLine, TileColumn], ActualIterator), 
	append(DirectionsList, [ActualIterator], NextDirectionsList));
	getValidMoves(Board, Player, [TileLine, TileColumn], NextDirectionsList, Rest, Result).
	
% -----------------------------------------------
% -----------------------------------------------
changeLine(Board, NewLine, LineNumber, Result):- 
	length(NewLine, 9),
	LineNumber < 10,
	LineNumber > 0,
	changeLine(Board, [], LineNumber, NewLine, 1, Result).
changeLine(RemainderOfBoard, NewBoard, LineNumber, _, Iterator, Result):-
	Iterator > LineNumber,
	LineNumber < 10,
	append(NewBoard, RemainderOfBoard, Result).
changeLine([Line | Rest], NewBoard, LineNumber, NewLine, Iterator, Result):-
	Iterator < LineNumber,
	LineNumber > 0,
	IteratorPlus is Iterator + 1,
	append(NewBoard, [Line], NewBoardPlus),
	changeLine(Rest, NewBoardPlus, LineNumber, NewLine, IteratorPlus, Result).
changeLine([Line | Rest], NewBoard, LineNumber, NewLine, Iterator, Result):-
	LineNumber =:= Iterator,
	IteratorPlus is Iterator + 1,
	append(NewBoard, [NewLine], NewBoardPlus), %Adds line to the NewBoard
	changeLine(Rest, NewBoardPlus, LineNumber, NewLine, IteratorPlus, Result).

	
changeElement(Line, NewElement, ColumnNumber, Result):-
	length(NewElement, 2),
	ColumnNumber > 0,
	ColumnNumber < 10,
	changeElement(Line, TempLine, NewElement, ColumnNumber, 1, Result).
changeElement([Element | Rest], TempLine, NewElement, ColumnNumber, Iterator, Result):-
	Iterator =:= ColumnNumber,
	append(TempLine, [NewElement], TempLinePlus),
	append(TempLinePlus, Rest, Result).
changeElement([Element | Rest], TempLine, NewElement, ColumnNumber, Iterator, Result):-
	Iterator < ColumnNumber,
	IteratorPlus is Iterator + 1,
	append(TempLine, [Element], TempLinePlus),
	changeElement(Rest, TempLinePlus, NewElement, ColumnNumber, IteratorPlus, Result).
	
	
changeTile(Board, [X, Y], NewTile, ResultBoard):-
	getLine(Board, TargetLine, X), % Gets line to change
	changeElement(TargetLine, NewTile, Y, ResultLine), %Changes the line
	changeLine(Board, ResultLine, X, ResultBoard). %Changes the board
% -----------------------------------------------
% -----------------------------------------------
/*
So para se for necessario guardar:
Tabuleiro Final=	
		[[[2, 0],[0, 0],[1, 0],[1, 2],[1, 2],[0, 0],[2, 0],[2, 0],[1, 3]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[0, 0],[2, 0],[1, 0],[0, 0],[1, 0],[2, 0],[2, 0],[1, 0],[2, 0]],
		[[1, 0],[1, 0],[2, 0],[1, 9],[2, 0],[1, 0],[2, 0],[1, 0],[2, 0]],
		[[2, 4],[2, 0],[1, 0],[2, 0],[2, 0],[1, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 0],[2, 6]],
		[[0, 0],[0, 0],[2, 0],[1, 0],[1, 0],[1, 0],[2, 0],[1, 0],[2, 9]],
		[[0, 0],[0, 0],[1, 0],[2, 0],[2, 0],[2, 0],[2, 0],[0, 0],[1, 0]]]
		
Tabuleiro Vazio=
		[[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
		[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]]]
		*/