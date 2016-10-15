% Game tiles

% Empty tile
translate(0, 1):- write('   ').
translate(0, 2):- write('   ').
translate(0, 3):- write('   ').

% Starting and finish markers
translate(1, 1):- write(' - ').
translate(1, 2):- write('| |').
translate(1, 3):- write(' - ').
translate(2, 1):- write(' - ').
translate(2, 2):- write(' o>').
translate(2, 3):- write(' - ').
translate(3, 1):- write('   ').
translate(3, 2):- write('( )').
translate(3, 3):- write('   ').
translate(4, 1):- write('   ').
translate(4, 2):- write('(#)').
translate(4, 3):- write('   ').

% Directional tiles
translate(5, 1):- write(' | ').
translate(5, 2):- write(' o ').
translate(5, 3):- write('/| ').
translate(6, 1):- write('  /').
translate(6, 2):- write('-o-').
translate(6, 3):- write('   ').
translate(7, 1):- write(' | ').
translate(7, 2):- write('-o-').
translate(7, 3):- write('   ').
translate(8, 1):- write('   ').
translate(8, 2):- write(' o-').
translate(8, 3):- write('/ \\').
translate(9, 1):- write(' | ').
translate(9, 2):- write('-o ').
translate(9, 3):- write('/  ').
translate(10, 1):- write(' | ').
translate(10, 2):- write(' o-').
translate(10, 3):- write('  \\').
translate(11, 1):- write('   ').
translate(11, 2):- write('-o ').
translate(11, 3):- write(' |\\').
translate(12, 1):- write('  /').
translate(12, 2):- write(' o ').
translate(12, 3):- write('/ \\').
translate(13, 1):- write('\\|/').
translate(13, 2):- write(' o ').
translate(13, 3):- write('   ').
translate(14, 1):- write('  /').
translate(14, 2):- write(' o ').
translate(14, 3):- write(' |\\').
translate(15, 1):- write('   ').
translate(15, 2):- write(' o ').
translate(15, 3):- write('/|\\').
translate(16, 1):- write('\\| ').
translate(16, 2):- write('-o ').
translate(16, 3):- write('   ').
translate(17, 1):- write('\\  ').
translate(17, 2):- write(' o ').
translate(17, 3):- write(' |\\').
translate(18, 1):- write('\\ /').
translate(18, 2):- write(' o ').
translate(18, 3):- write(' | ').
translate(19, 1):- write(' | ').
translate(19, 2):- write(' o-').
translate(19, 3):- write(' | ').
translate(20, 1):- write('\\| ').
translate(20, 2):- write(' o-').
translate(20, 3):- write('   ').
translate(21, 1):- write('\\ /').
translate(21, 2):- write('-o ').
translate(21, 3):- write('   ').
translate(22, 1):- write('\\  ').
translate(22, 2):- write('-o ').
translate(22, 3):- write('/  ').
translate(23, 1):- write('\\| ').
translate(23, 2):- write(' o ').
translate(23, 3):- write('/  ').
translate(24, 1):- write(' | ').
translate(24, 2):- write(' o-').
translate(24, 3):- write('/  ').
translate(25, 1):- write('   ').
translate(25, 2):- write('-o-').
translate(25, 3):- write('  \\').
translate(26, 1):- write('  /').
translate(26, 2):- write('-o ').
translate(26, 3):- write('/  ').
translate(27, 1):- write('\\  ').
translate(27, 2):- write(' o-').
translate(27, 3):- write('/ \\').
translate(28, 1):- write('  /').
translate(28, 2):- write(' o-').
translate(28, 3):- write('  \\').
translate(29, 1):- write('   ').
translate(29, 2):- write(' o-').
translate(29, 3):- write(' |\\').
translate(30, 1):- write(' | ').
translate(30, 2):- write(' o ').
translate(30, 3):- write('/ \\').
translate(31, 1):- write('   ').
translate(31, 2):- write('-o-').
translate(31, 3):- write(' | ').
translate(32, 1):- write('  /').
translate(32, 2):- write(' o-').
translate(32, 3):- write('/  ').
translate(33, 1):- write('   ').
translate(33, 2):- write('-o ').
translate(33, 3):- write('/ \\').
translate(34, 1):- write(' |/').
translate(34, 2):- write(' o ').
translate(34, 3):- write('  \\').
translate(35, 1):- write('\\  ').
translate(35, 2):- write('-o ').
translate(35, 3):- write(' | ').
translate(36, 1):- write('\\  ').
translate(36, 2):- write(' o-').
translate(36, 3):- write('/  ').
translate(37, 1):- write('  /').
translate(37, 2):- write('-o ').
translate(37, 3):- write('  \\').
translate(38, 1):- write('   ').
translate(38, 2):- write('-o-').
translate(38, 3):- write('/  ').
translate(39, 1):- write('\\| ').
translate(39, 2):- write(' o ').
translate(39, 3):- write(' | ').
translate(40, 1):- write('   ').
translate(40, 2):- write('-o-').
translate(40, 3):- write(' | ').
translate(41, 1):- write(' | ').
translate(41, 2):- write('-o ').
translate(41, 3):- write('  \\').
translate(42, 1):- write('\\  ').
translate(42, 2):- write(' o ').
translate(42, 3):- write('/| ').
translate(43, 1):- write('\\| ').
translate(43, 2):- write(' o ').
translate(43, 3):- write('  \\').
translate(44, 1):- write(' |/').
translate(44, 2):- write(' o ').
translate(44, 3):- write(' | ').
translate(45, 1):- write('\\  ').
translate(45, 2):- write(' o-').
translate(45, 3):- write(' | ').
translate(46, 1):- write('\\  ').
translate(46, 2):- write('-o-').
translate(46, 3):- write('   ').
translate(47, 1):- write('\\  ').
translate(47, 2):- write('-o ').
translate(47, 3):- write('  \\').
translate(48, 1):- write(' | ').
translate(48, 2):- write(' o ').
translate(48, 3):- write(' |\\').
translate(49, 1):- write('  /').
translate(49, 2):- write(' o ').
translate(49, 3):- write('/| ').
translate(50, 1):- write('  /').
translate(50, 2):- write(' o-').
translate(50, 3):- write(' | ').
translate(51, 1):- write('\\  ').
translate(51, 2):- write(' o-').
translate(51, 3):- write('  \\').
translate(52, 1):- write(' |/').
translate(52, 2):- write('-o ').
translate(52, 3):- write('   ').
translate(53, 1):- write(' |/').
translate(53, 2):- write(' o-').
translate(53, 3):- write('   ').
translate(54, 1):- write('   ').
translate(54, 2):- write(' o-').
translate(54, 3):- write('/| ').
translate(55, 1):- write('\\ /').
translate(55, 2):- write(' o ').
translate(55, 3):- write('  \\').
translate(56, 1):- write('\\ /').
translate(56, 2):- write(' o ').
translate(56, 3):- write('/  ').
translate(57, 1):- write(' |/').
translate(57, 2):- write(' o ').
translate(57, 3):- write('/  ').
translate(58, 1):- write('   ').
translate(58, 2):- write('-o ').
translate(58, 3):- write('/| ').
translate(59, 1):- write('  /').
translate(59, 2):- write('-o ').
translate(59, 3):- write(' | ').
translate(60, 1):- write('\\ /').
translate(60, 2):- write(' o-').
translate(60, 3):- write('   ').

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