
:- include('casinhas.pl').
:- include('teste.pl').
:- include('directions.pl').
:- use_module(library(lists)).
:- use_module(library(sets)).


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


getLineElement(Line, Tile, ColumnNumber):- getLineElement(Line, Tile, ColumnNumber, 1).
getLineElement([], _, _, _):-
	write('Column not existent'), nl, fail.
getLineElement([Element|_Rest], Tile, ColumnNumber, ColumnNumber):-
	Tile = Element.
getLineElement([_Element|Rest], Tile, ColumnNumber, Iterator):-
	IteratorPlus is Iterator + 1,
	getLineElement(Rest, Tile, ColumnNumber, IteratorPlus).

	
getTile(Board, Tile, [X, Y]):-
	!,
	getLine(Board, Line, Y), !, % - Avoids redoing getLine
	getLineElement(Line, Tile, X).
	%WARNING write(Tile), nl.
	

getPlayer(Board, [X, Y], Player):-
	getTile(Board, [TilePlayer, _TileDirection], [X, Y]),
	Player = TilePlayer.

setPlayer(Board, [X, Y], Player, NewBoard):-
	getTile(Board, [_TilePlayer, TileDirection], [X, Y]),
	changeTile(Board, [X, Y], [Player, TileDirection], NewBoard).
	
getDirection(Board, [X, Y], Direction):-
	getTile(Board, [_TilePlayer, TileDirection], [X, Y]),
	Direction = TileDirection.
	
setDirection(Board, [X, Y], Direction, NewBoard):-
	Direction > -1, Direction < 10,
	getTile(Board, [TilePlayer, _TileDirection], [X, Y]),
	changeTile(Board, [X, Y], [TilePlayer, Direction], NewBoard).
	
% -----------------------------------------------
% -----------------------------------------------	

validMove(Board, Player, [_X, _Y], Direction):- %Checks if moving a player's piece in the Direction is a valid move.
	%TODO getTile to get the Player color automatically???
	directionToCoordinates(Direction, [_X, _Y], [NextX, NextY]),
	NextX > 0, NextY > 0,
	NextX < 10, NextY < 10,
	getTile(Board, [NextTilePlayer, NextTileDirection], [NextX, NextY]), % Gets the next tile acording to the direction given
	!, (NextTilePlayer =:= Player ; NextTilePlayer =:= 0), % The next tile must be the from the players color, or no color
	NextTileDirection =:= 0. % The next tile must not have any piece there
% jogadasValidas(Tabuleiro, Jogador, Peca, []).


getValidMoves(Board, Player, [X, Y], Result):- 
	Y > 0, X > 0,
	Y < 10, X < 10,
	getValidMoves(Board, Player, [X, Y], [], 1, Result).
getValidMoves(_Board, _Player, [_X, _Y], DirectionsList, 10, Result):- %Ending condition (Iterator == 10)
	Result = DirectionsList.
	
getValidMoves(Board, Player, [X, Y], DirectionsList, Iterator, Result):- % Iterator is the directions
	IteratorPlus is Iterator + 1,
	\+validMove(Board, Player, [X, Y], Iterator),
	getValidMoves(Board, Player, [X, Y], DirectionsList, IteratorPlus, Result).
	
getValidMoves(Board, Player, [X, Y], DirectionsList, Iterator, Result):- % Iterator is the directions
	IteratorPlus is Iterator + 1,
	validMove(Board, Player, [X, Y], Iterator),
	append(DirectionsList, [Iterator], NewDirectionsList),
	getValidMoves(Board, Player, [X, Y], NewDirectionsList, IteratorPlus, Result).

	% Obtains the list of Directions that the piece can move in
getMovingDirections(Board, [X, Y], Directions):-
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),
	TileDirection \= 0, %It must have a piece in the tile
	getValidMoves(Board, TilePlayer, [X, Y], ValidMovesList), %Get all the valid tiles around the [X, Y] tile
	getNearDirections(TileDirection, NearDirectionsList), %Get the near possible directions to move the piece
	list_to_set(NearDirectionsList, NearDirectionsSet),
	list_to_set(ValidMovesList, ValidMovesSet),
	intersection(NearDirectionsSet, ValidMovesSet, Directions). %Get the near possible directions to move the piece that are valid
	
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
changeLine([_Line | Rest], NewBoard, LineNumber, NewLine, Iterator, Result):-
	LineNumber =:= Iterator,
	IteratorPlus is Iterator + 1,
	append(NewBoard, [NewLine], NewBoardPlus), %Adds line to the NewBoard
	changeLine(Rest, NewBoardPlus, LineNumber, NewLine, IteratorPlus, Result).

	
changeElement(Line, NewElement, ColumnNumber, Result):-
	length(NewElement, 2),
	ColumnNumber > 0,
	ColumnNumber < 10,
	changeElement(Line, [], NewElement, ColumnNumber, 1, Result).
changeElement([_Element | Rest], TempLine, NewElement, ColumnNumber, Iterator, Result):-
	Iterator =:= ColumnNumber,
	append(TempLine, [NewElement], TempLinePlus),
	append(TempLinePlus, Rest, Result).
changeElement([Element | Rest], TempLine, NewElement, ColumnNumber, Iterator, Result):-
	Iterator < ColumnNumber,
	IteratorPlus is Iterator + 1,
	append(TempLine, [Element], TempLinePlus),
	changeElement(Rest, TempLinePlus, NewElement, ColumnNumber, IteratorPlus, Result).
	
	
changeTile(Board, [X, Y], [TilePlayer, TileDirection], ResultBoard):-
	TileDirection > -1, TileDirection < 10,
	getLine(Board, TargetLine, Y), % Gets line to change
	changeElement(TargetLine, [TilePlayer, TileDirection], X, ResultLine), %Changes the line
	changeLine(Board, ResultLine, Y, ResultBoard). %Changes the board
% -----------------------------------------------
% -----------------------------------------------

	% This DOESN'T ask for the initial direction change of the piece!!!
	% That must be done before, after input from the player/AI
movePiece(Board, [X, Y], Direction, NewBoard):-
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),!, %get old Tile
	TilePlayer \= 0, !,						%if it is 0, then there is no piece
	TileDirection \= 0, TileDirection \= 5, !,%if it is 0 or 5, there is no piece
	getMovingDirections(Board, [X, Y], ValidDirections),!, %get valid directions to move
	memberchk(Direction, ValidDirections), %check if direction is a valid direction
	directionToCoordinates(Direction, [X, Y], [NewX, NewY]), %Get the new Tile
	changeTile(Board, [NewX, NewY], [TilePlayer, Direction], TempBoard), %Place the marker and the piece in the new Tile
	setDirection(TempBoard, [X, Y], 0, NewBoard). %Erase the old piece from the previous tile

% -----------------------------------------------
% -----------------------------------------------

rotatePiece(Board, [X, Y], 1, NewBoard):- % CounterClockWise
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),!, %get Tile
	write('Got tile'), nl,
	TilePlayer \= 0, !,						%if it is 0, then there is no piece
	TileDirection \= 0, TileDirection \= 5, !,%if it is 0 or 5, there is no piece
	getNearDirections(TileDirection, [CounterClockWise, _Same, _ClockWise]),
	setDirection(Board, [X, Y], CounterClockWise, NewBoard),
	write('Rotate Piece done'), nl.
	
rotatePiece(Board, [X, Y], 2, NewBoard):- % Same direction
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),!, %get old Tile
	TilePlayer \= 0, !,						%if it is 0, then there is no piece
	TileDirection \= 0, TileDirection \= 5, !,%if it is 0 or 5, there is no piece
	getNearDirections(TileDirection, [_CounterClockWise, Same, _ClockWise]),
	setDirection(Board, [X, Y], Same, NewBoard).
	
rotatePiece(Board, [X, Y], 3, NewBoard):- % ClockWise
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),!, %get old Tile
	TilePlayer \= 0, !,						%if it is 0, then there is no piece
	TileDirection \= 0, TileDirection \= 5, !,%if it is 0 or 5, there is no piece
	getNearDirections(TileDirection, [_CounterClockWise, _Same, ClockWise]),
	setDirection(Board, [X, Y], ClockWise, NewBoard).
	
rotatePiece(_, _, _, _):- fail .
	
% -----------------------------------------------
% -----------------------------------------------
	
	% Detects if between the two tiles there is an area change
changedArea([PrevX, PrevY], [NewX, NewY]):-
	(PrevX =:= 3, NewX =:= 4);
	(PrevX =:= 4, NewX =:= 3);
	(PrevX =:= 6, NewX =:= 7);
	(PrevX =:= 7, NewX =:= 6);
	(PrevY =:= 3, NewY =:= 4);
	(PrevY =:= 4, NewY =:= 3);
	(PrevY =:= 6, NewY =:= 7);
	(PrevY =:= 7, NewY =:= 6).
	
changedArea([PrevX, PrevY], Direction, HasChanged):-
	directionToCoordinates(Direction, [PrevX, PrevY], [ResX, ResY]),
	changedArea([PrevX, PrevY], [ResX, ResY]),
	HasChanged = 1.
changedArea([PrevX, PrevY], Direction, HasChanged):-
	directionToCoordinates(Direction, [PrevX, PrevY], [ResX, ResY]),
	\+changedArea([PrevX, PrevY], [ResX, ResY]),
	HasChanged = 0.
% -----------------------------------------------
% -----------------------------------------------

nextTileHasMarker(Board, [X,Y], Direction):-
	directionToCoordinates(Direction, [X, Y], [NewX, NewY]),!,
	getTile(Board, [TilePlayer, _TileDirection], [NewX, NewY]),!,
	TilePlayer \= 0.
	
% -----------------------------------------------
% -----------------------------------------------
getPlayerPieces(Board, Player, Pieces, PiecesLength):- %TODO Verification of NumPlayers
	Player > 0, Player < 5,
	getPlayerPieces(Board, Player, 1, [], Pieces, 0, PiecesLength).
getPlayerPieces([], _, _, TempPieces, Pieces, TempPiecesLength, PiecesLength):-
	Pieces = TempPieces,
	PiecesLength = TempPiecesLength.
getPlayerPieces([Line | Rest], Player, ActualY, TempPieces, Pieces, TempPiecesLength, PiecesLength):-
	getPlayerPiecesLine(Line, Player, [1, ActualY], [], Pieces1, 0, PiecesLength1),
	ActualYPlus is ActualY + 1,
	TempPiecesLengthPlus is PiecesLength1 + TempPiecesLength,
	append(TempPieces, Pieces1, TempPiecesPlus),
	getPlayerPieces(Rest, Player, ActualYPlus, TempPiecesPlus, Pieces, TempPiecesLengthPlus, PiecesLength).

getPlayerPiecesLine([], _, _, TempPieces, Pieces, TempPiecesLength, PiecesLength):-
	Pieces = TempPieces,
	PiecesLength = TempPiecesLength.
getPlayerPiecesLine([[TilePlayer, _TileDirection] | Rest], Player, [ActualX, ActualY], TempPieces, Pieces, TempPiecesLength, PiecesLength):-
	TilePlayer \= Player,
	ActualXPlus is ActualX + 1,
	getPlayerPiecesLine(Rest, Player, [ActualXPlus, ActualY], TempPieces, Pieces, TempPiecesLength, PiecesLength).
getPlayerPiecesLine([[TilePlayer, _TileDirection] | Rest], Player, [ActualX, ActualY], TempPieces, Pieces, TempPiecesLength, PiecesLength):-
	TilePlayer =:= Player,
	append(TempPieces, [[ActualX, ActualY]], TempPiecesPlus),
	ActualXPlus is ActualX + 1,
	PiecesLengthPlus is TempPiecesLength + 1,
	getPlayerPiecesLine(Rest, Player, [ActualXPlus, ActualY], TempPiecesPlus, Pieces, PiecesLengthPlus, PiecesLength).
	
% TODO Funcao que filtra o getPlayerPieces para ter so aquelas que se possam movimentar
pieceCanMove(Board, [X, Y]):-
	getMovingDirections(Board, [X, Y], Directions),
	!,
	Directions \= []. %If it is empty, the piece cant move to any valid tile
	
% -----------------------------------------------
% -----------------------------------------------
getPlayerMovingPieces(Board, Player, Pieces, PiecesLength):- %Only return the pieces of the player that can move
	getPlayerPieces(Board, Player, AllPieces, _AllPiecesLength),
	getPlayerMovingPiecesAux(Board, AllPieces, Pieces, PiecesLength).
	
getPlayerMovingPiecesAux(Board, AllPieces, MovingPieces, MovingPiecesLength):-
	getPlayerMovingPiecesAux(Board, AllPieces, [], MovingPieces, 0, MovingPiecesLength).
	
getPlayerMovingPiecesAux(_Board, [], TempMovingPieces, MovingPieces, TempMovingPiecesLength, MovingPiecesLength):-
	MovingPieces = TempMovingPieces,
	MovingPiecesLength = TempMovingPiecesLength.
getPlayerMovingPiecesAux(Board, [Piece | Rest], TempMovingPieces, MovingPieces, TempMovingPiecesLength, MovingPiecesLength):-
	pieceCanMove(Board, Piece),
	append(TempMovingPieces, [Piece], TempMovingPiecesPlus),
	TempMovingPiecesLengthPlus is TempMovingPiecesLength + 1,
	getPlayerMovingPiecesAux(Board, Rest, TempMovingPiecesPlus, MovingPieces, TempMovingPiecesLengthPlus, MovingPiecesLength).
	
getPlayerMovingPiecesAux(Board, [Piece | Rest], TempMovingPieces, MovingPieces, TempMovingPiecesLength, MovingPiecesLength):-
	\+pieceCanMove(Board, Piece),
	getPlayerMovingPiecesAux(Board, Rest, TempMovingPieces, MovingPieces, TempMovingPiecesLength, MovingPiecesLength).
	
% -----------------------------------------------
% -----------------------------------------------

%getMostValuableMove(Board, Tile). %TODO So verificar a linha reta em frente