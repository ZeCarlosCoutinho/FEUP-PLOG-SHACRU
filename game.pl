:- include('gameUtils.pl').

askForNumPlayers(NumPlayers):-
	write('NumPlayers :'),
	read(NumPlayersTemp), nl,
	NumPlayersTemp > 1, NumPlayersTemp < 5,
	NumPlayers = NumPlayersTemp .

createPlayersScoreStructure(NumPlayers, ScoreStructure):- createPlayersScoreStructure(NumPlayers, [], 1, ScoreStructure).
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):- %Creates the ScoreStructure after all player scores are created
	Iterator > NumPlayers,
	ScoreStructure = TemporaryStructure.
createPlayersScoreStructure(NumPlayers, TemporaryStructure, Iterator, ScoreStructure):-
	IteratorPlus is Iterator + 1,
	append(TemporaryStructure, [[Iterator, 0]], NewTemporaryStructure),
	createPlayersScoreStructure(NumPlayers, NewTemporaryStructure, IteratorPlus, ScoreStructure).
	
createPlayerScores(ScoreStructure):-
	askForNumPlayers(NumPlayers),
	createPlayersScoreStructure(NumPlayers, ScoreStructure).

getScore(ScoreStructure, Player, Score):-
	Player > 0, Player < 5,
	getScore(ScoreStructure, Player, 1, Score).
getScore([], _, _, _):-
	write('ScoreStructure error').
getScore([[ScorePlayer, ScoreNumber] | RemainingScores], Player, Iterator, Score):-
	Player =:= Iterator,
	Score = ScoreNumber.
getScore([ActualScore | RemainingScores], Player, Iterator, Score):-
	Player \= Iterator,
	IteratorPlus is Iterator + 1,
	getScore(RemainingScores, Player, IteratorPlus, Score).
	
	
increaseMarkScore(ScoreStructure, Player, NewScoreStructure).
	