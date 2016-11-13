:- include('gameUtils.pl').

askForNumPlayers(NumPlayers):-
	write('Number of Players :'),
	read(NumPlayersTemp), nl,
	NumPlayersTemp > 1, NumPlayersTemp < 5,
	NumPlayers = NumPlayersTemp .
	
askForRotation(Orientation):-
	write('In which direction do you want to rotate the piece?'),nl,
	write('1 - Counterclockwise; 2 - No Rotation; 3 - Clockwise'), nl,
	read(OrientationTemp), nl,
	OrientationTemp > 0, OrientationTemp < 4,
	Orientation = OrientationTemp .

% -----------------------------------------------
% -----------------------------------------------	

createPlayersScores(NumPlayers, ScoreStructure):- createPlayersScoreStructure(NumPlayers, [], 1, ScoreStructure).
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):- %Creates the ScoreStructure after all player scores are created
	Iterator > NumPlayers,
	ScoreStructure = TemporaryStructure.
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):-
	IteratorPlus is Iterator + 1,
	append(TemporaryStructure, [[Iterator, 0]], NewTemporaryStructure),
	createPlayersScoreStructure(NumPlayers, NewTemporaryStructure, IteratorPlus, ScoreStructure).
	
	
createPlayerList(NumPlayers, PlayerList):- 
	NumPlayers > 1, NumPlayers < 5, 
	createPlayerList(NumPlayers, 1, [], PlayerList).
createPlayerList(NumPlayers, Iterator, TempList, PlayerList):-
	NumPlayers =:= Iterator,
	append(TempList, [Iterator], PlayerList).
createPlayerList(NumPlayers, Iterator, TempList, PlayerList):-
	NumPlayers \= Iterator,
	IteratorPlus is Iterator + 1,
	append(TempList, [Iterator], TempListPlus),
	createPlayerList(NumPlayers, IteratorPlus, TempListPlus, PlayerList).
	

% -----------------------------------------------
% -----------------------------------------------
/*
createPlayerScores(ScoreStructure):-
	askForNumPlayers(NumPlayers),
	createPlayersScoreStructure(NumPlayers, ScoreStructure).*/

% -----------------------------------------------
% -----------------------------------------------
getScore(ScoreStructure, Player, Score):-
	Player > 0, Player < 5,
	getScore(ScoreStructure, Player, 1, Score).
getScore([], _, _, _):-
	write('ScoreStructure error').
getScore([[_ScorePlayer, ScoreNumber] | _RemainingScores], Player, Iterator, Score):-
	Player =:= Iterator,
	Score = ScoreNumber.
getScore([_ActualScore | RemainingScores], Player, Iterator, Score):-
	Player \= Iterator,
	IteratorPlus is Iterator + 1,
	getScore(RemainingScores, Player, IteratorPlus, Score).
	
% -----------------------------------------------
% -----------------------------------------------	
	% RETURNS TRUE EVEN IF PLAYER > ScoreStructureLength
increaseMarkScore(ScoreStructure, Player, NewScoreStructure):-
	Player > 0, Player < 5,
	increaseMarkScore(ScoreStructure, [], Player, 1, NewScoreStructure).
increaseMarkScore([], TemporaryStructure, _, _, NewScoreStructure):- % Ending condition
	NewScoreStructure = TemporaryStructure.
increaseMarkScore([ActualScore | RemainingScores], TemporaryStructure, Player, Iterator, NewScoreStructure):-
	Player \= Iterator,
	IteratorPlus is Iterator + 1,
	append(TemporaryStructure, [ActualScore], NewTemporaryStructure),
	increaseMarkScore(RemainingScores, NewTemporaryStructure, Player, IteratorPlus, NewScoreStructure).
increaseMarkScore([[ScorePlayer, ScoreNumber] | RemainingScores], TemporaryStructure, Player, Iterator, NewScoreStructure):-
	Player =:= Iterator,
	NewScoreNumber is ScoreNumber + 1,
	IteratorPlus is Iterator + 1,
	append(TemporaryStructure, [[ScorePlayer, NewScoreNumber]], NewTemporaryStructure),
	increaseMarkScore(RemainingScores, NewTemporaryStructure, Player, IteratorPlus, NewScoreStructure).
	
% -----------------------------------------------
% -----------------------------------------------

%TODO if the chosen direction is not on the list, it loops infinitely
moveAPiece(Board, ScoreStructure, [X, Y], NewBoard, NewScoreStructure, HasChangedArea):- %No marker -> Increases score
	getTile(Board, [_, TileDirection], [X, Y]),
	TileDirection \= 0, %It must have a piece in the tile
	displayDirectionsToMove(Board, [X, Y]),
	read(Direction),
	changedArea([X, Y], Direction, HasChangedArea),
	moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure).
	
moveAPieceAux(Board, ScoreStructure, [_X, _Y], 0, NewBoard, NewScoreStructure):- %In case of pass
	NewBoard = Board,
	NewScoreStructure = ScoreStructure.
moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure):- %No marker -> Increases score
	\+nextTileHasMarker(Board, [X,Y], Direction),
	getPlayer(Board, [X, Y], Player),
	movePiece(Board, [X, Y], Direction, NewBoardTemp),
	increaseMarkScore(ScoreStructure, Player, NewScoreStructureTemp),
	NewBoard = NewBoardTemp,
	NewScoreStructure = NewScoreStructureTemp .
moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure):- %Already placed marker -> No increase in score
	nextTileHasMarker(Board, [X,Y], Direction),
	movePiece(Board, [X, Y], Direction, NewBoardTemp),
	NewBoard = NewBoardTemp,
	NewScoreStructure = ScoreStructure .

displayDirectionsToMove(Board, [X, Y]):-
	getMovingDirections(Board, [X, Y], Directions),
	write('Whats the next direction? '), nl,
	displayDirectionsToMoveAux(Directions).
	
displayDirectionsToMoveAux([]):-
	displayDirectionName(0), write(' - '), write(0).
displayDirectionsToMoveAux([Direction | Rest]):-
	displayDirectionName(Direction), write(' - '), write(Direction),nl,
	displayDirectionsToMoveAux(Rest).
	
rotateAPiece(Board, Piece, 0, NewBoard).
rotateAPiece(Board, Piece, 1, NewBoard):-
	askForRotation(Orientation),
	rotatePiece(Board, Piece, Orientation, NewBoard).

	
% -----------------------------------------------
% -----------------------------------------------

createBoard(2, Scores, Board, ScoresAfterInit):-
	Board = [[[2, 9],[0, 0],[1, 8],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[1, 2],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[1, 1]]],
	increaseMarkScore(Scores, 1, Scores1),
	increaseMarkScore(Scores1, 1, Scores2),
	increaseMarkScore(Scores2, 1, Scores3),
	increaseMarkScore(Scores3, 1, Scores4),
	increaseMarkScore(Scores4, 2, Scores5),
	increaseMarkScore(Scores5, 2, Scores6),
	increaseMarkScore(Scores6, 2, Scores7),
	increaseMarkScore(Scores7, 2, ScoresAfterInit).
	
createBoard(3, Scores, Board, ScoresAfterInit):-
	Board = [[[0, 0],[0, 0],[1, 8],[0, 0],[0, 0],[0, 0],[2, 8],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[3, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[3, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[1, 2],[0, 0],[3, 2],[0, 0],[2, 2],[0, 0],[0, 0]]],
			increaseMarkScore(Scores, 1, Scores1),
			increaseMarkScore(Scores1, 1, Scores2),
			increaseMarkScore(Scores2, 1, Scores3),
			increaseMarkScore(Scores3, 2, Scores4),
			increaseMarkScore(Scores4, 2, Scores5),
			increaseMarkScore(Scores5, 2, Scores6),
			increaseMarkScore(Scores6, 3, Scores7),
			increaseMarkScore(Scores7, 3, Scores8),
			increaseMarkScore(Scores8, 3, ScoresAfterInit).
			
createBoard(4, Scores, Board, ScoresAfterInit):-
	Board = [[[0, 0],[0, 0],[1, 8],[0, 0],[4, 8],[0, 0],[2, 8],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[4, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[4, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[1, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[2, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[3, 6],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[3, 4]],
			[[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]],
			[[0, 0],[0, 0],[1, 2],[0, 0],[3, 2],[0, 0],[2, 2],[0, 0],[0, 0]]],
			increaseMarkScore(Scores, 1, Scores1),
			increaseMarkScore(Scores1, 1, Scores2),
			increaseMarkScore(Scores2, 1, Scores3),
			increaseMarkScore(Scores3, 2, Scores4),
			increaseMarkScore(Scores4, 2, Scores5),
			increaseMarkScore(Scores5, 2, Scores6),
			increaseMarkScore(Scores6, 3, Scores7),
			increaseMarkScore(Scores7, 3, Scores8),
			increaseMarkScore(Scores8, 3, Scores9),
			increaseMarkScore(Scores9, 4, Scores10),
			increaseMarkScore(Scores10, 4, Scores11),
			increaseMarkScore(Scores11, 4, ScoresAfterInit).

createBoard(_, _, _, _).

% -----------------------------------------------
% -----------------------------------------------
choosePiece(Board, Player, Piece):-
	getPlayerMovingPieces(Board, Player, Pieces, PiecesLength),
	write('Which piece do you want to move? '), nl,
	displayPiecesToChoose(Pieces),
	read(PieceChosen),
	PieceChosen > -1, PieceChosen < PiecesLength + 1,
	choosePieceAux(Pieces, PieceChosen, Piece).

choosePieceAux(_, 0, Piece):-
	Piece = [].
%choosePieceAux([], _, _):- write('choosePieceAux: wrong index'), fail.
choosePieceAux([Piece | _Rest], 1, PieceChosen):-
	PieceChosen = Piece.
choosePieceAux([_Piece | Rest], DecreasingIndex, PieceChosen):-
		DecreasingIndex \= 1,
		DecreasingIndexMinus is DecreasingIndex - 1,
		choosePieceAux(Rest, DecreasingIndexMinus, PieceChosen).

displayPiecesToChoose(Pieces):- displayPiecesToChoose(Pieces, 1).
displayPiecesToChoose([], _):-
	write('0 - Pass'), nl .
displayPiecesToChoose([Piece | Rest], Iterator):-
	write(Iterator), write(' - '), write(Piece), nl,
	IteratorPlus is Iterator + 1,
	displayPiecesToChoose(Rest, IteratorPlus).
	
% -----------------------------------------------
% -----------------------------------------------

turn(Board, Scores, Player, NewBoard, NewScores):-
	choosePiece(Board, Player, PieceChosen),
	moveAPiece(Board, Scores, PieceChosen, NewBoard1, NewScores, HasChangedArea),
	rotateAPiece(NewBoard1, PieceChosen, HasChangedArea, NewBoard2).

	
game :-
	%TODO Presentation + Instructions
	askForNumPlayers(NumPlayers),
	createPlayerScores(NumPlayers, Scores),
	createBoard(NumPlayers, Scores, Board, ScoresAfterInit).
	
	%TODO getVictoriousPlayers
	
%TODO Ciclo de jogo
%TODO Turno (Verificacao, Escolher Peca, Escolher Direcao, (Escolher Rotacao), Next)
%TODO Incluir a opcao "Passar o turno" na escolha das pecas