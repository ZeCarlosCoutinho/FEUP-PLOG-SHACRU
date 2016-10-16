% Game tiles

/* each tile has 9 chars. 
# 1 2 3 #
# 4 5 6 #
# 7 8 9 #
directions
#1 2 3#
#4 0 6#
#7 8 9#
Player Color is represented like
#       #
#   1   #
#       # 
Player Icons
1- o; 2 - *; 3 - @; 4- +;
marking(linha, [corPlayer, direcaoPeca]).
*/
marking(1, [1, 1]):- write('o  ').
marking(1, [1, 2]):- write(' o ').
marking(1, [1, 3]):- write('  o').
marking(1, [2, 1]):- write('*  ').
marking(1, [2, 2]):- write(' * ').
marking(1, [2, 3]):- write('  *').
marking(1, [3, 1]):- write('@  ').
marking(1, [3, 2]):- write(' @ ').
marking(1, [3, 3]):- write('  @').
marking(1, [4, 1]):- write('+  ').
marking(1, [4, 2]):- write(' + ').
marking(1, [4, 3]):- write('  +').
marking(1, [_, _]):- write('   '). % Qualquer outro numero nao mostra nada na 1a linha

marking(2, [1, 4]):- write('o1 ').
marking(2, [1, 6]):- write(' 1o').
marking(2, [1, _]):- write(' 1 ').
marking(2, [2, 4]):- write('*2 ').
marking(2, [2, 6]):- write(' 2*').
marking(2, [2, _]):- write(' 2 ').
marking(2, [3, 4]):- write('@3 ').
marking(2, [3, 6]):- write(' 3@').
marking(2, [3, _]):- write(' 3 ').
marking(2, [4, 4]):- write('+4 ').
marking(2, [4, 6]):- write(' 4+').
marking(2, [4, _]):- write(' 4 ').
marking(2, [_, _]):- write('   ').

marking(3, [1, 7]):- write('o  ').
marking(3, [1, 8]):- write(' o ').
marking(3, [1, 9]):- write('  o').
marking(3, [2, 7]):- write('*  ').
marking(3, [2, 8]):- write(' * ').
marking(3, [2, 9]):- write('  *').
marking(3, [3, 7]):- write('@  ').
marking(3, [3, 8]):- write(' @ ').
marking(3, [3, 9]):- write('  @').
marking(3, [4, 7]):- write('+  ').
marking(3, [4, 8]):- write(' + ').
marking(3, [4, 9]):- write('  +').
marking(3, [_, _]):- write('   '). % Qualquer outro numero nao mostra nada na 3a linha