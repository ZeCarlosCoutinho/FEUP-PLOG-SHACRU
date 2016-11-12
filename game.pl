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
	