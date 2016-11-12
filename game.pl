:- include('gameUtils.pl').
:- include('boards.pl').

askForNumPlayers(NumPlayers):-
	write('NumPlayers :'),
	read(NumPlayersTemp), nl,
	NumPlayersTemp > 1, NumPlayersTemp < 5,
	NumPlayers = NumPlayersTemp .
	
% -----------------------------------------------
% -----------------------------------------------	

createPlayersScoreStructure(NumPlayers, ScoreStructure):- createPlayersScoreStructure(NumPlayers, [], 1, ScoreStructure).
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):- %Creates the ScoreStructure after all player scores are created
	Iterator > NumPlayers,
	ScoreStructure = TemporaryStructure.
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):-
	IteratorPlus is Iterator + 1,
	append(TemporaryStructure, [[Iterator, 0]], NewTemporaryStructure),
	createPlayersScoreStructure(NumPlayers, NewTemporaryStructure, IteratorPlus, ScoreStructure).

% -----------------------------------------------
% -----------------------------------------------

createPlayerScores(ScoreStructure):-
	askForNumPlayers(NumPlayers),
	createPlayersScoreStructure(NumPlayers, ScoreStructure).

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

moveAPiece(Board, ScoreStructure, [X, Y], NewBoard, NewScoreStructure):- %No marker -> Increases score
	getTile(Board, [TilePlayer, TileDirection], [X, Y]),
	TileDirection \= 0, %It must have a piece in the tile
	write('Whats the next direction?: '),
	read(Direction),
	moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure).
	
moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure):- %No marker -> Increases score
	\+nextTileHasMarker(Board, [X,Y], Direction),
	getPlayer(Board, [X, Y], Player),
	movePiece(Board, [X, Y], Direction, NewBoardTemp),
	increaseMarkScore(ScoreStructure, Player, NewScoreStructureTemp),
	NewBoard = NewBoardTemp,
	NewScoreStructure = NewScoreStructureTemp .
moveAPieceAux(Board, ScoreStructure, [X, Y], Direction, NewBoard, NewScoreStructure):- %Already placed marker -> No increase in score
	nextTileHasMarker(Board, [X,Y], Direction),
	getPlayer(Board, [X, Y], Player), 
	movePiece(Board, [X, Y], Direction, NewBoardTemp),
	NewBoard = NewBoardTemp,
	NewScoreStructure = ScoreStructure .

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