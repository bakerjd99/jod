NB.*dnlSmokeMacroTexts  t--  checks  that all macro texts can  be
NB. saved and seen by (dnl).
NB.
NB. assumes:
NB.
NB.   1) READWRITE put dictionary (testjod00)
NB.   2) (jodtester) verbs available
NB.
NB. author:  John D. Baker
NB. created: 2000sep01
NB. changes: -----------------------------------------------------
NB. 07dec19 converted to j6.02 JOD
NB. 11nov23 updated for J7/Linux
NB. 18may31 updated for J 8.07
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAdnlSmokeMacroTexts'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tpfx=: 'testjod'

er od tpfx,'00'

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. store various macro text types.  Note JOD does
NB. VALIDATE MACRO TEXTS.  IT SIMPLY STORES THE TEXT
NB. AS BYTES WITH AN ASSOCIATED TYPE CODE FOR EASY RETRIEVAL.
NB. It is up to the JOD user/caller to validate text.
NB. All text types are essentially equivalent to bytes.

er 4 put a0=:'jscript';21;'... j script text ...'
er 4 put a1=:'latex';22;'... latex text ...'
er 4 put a2=:'html';23;'... html text ...'
er 4 put a3=:'xml';24;'... xml text ...'
er 4 put a4=:'text';25;'... plain old text ...'
er 4 put a5=:'byte';26;'... arbitrary list of bytes ...'
er 4 put a6=:'markdown';27;' ... markdown text ...'
er 4 put a7=:'utf8';28;' ... utf8 bytes ...'
er 4 put a8=:'python';29;' ... python bytes ...'
er 4 put a9=:'sql';30;' ... sql bytes ...'
er 4 put a10=:'json';31;' ... json bytes ...'
er 4 put a11=:'ipynb';32;' ... ipynb bytes ...'
er 4 put a12=:'lean';33;' ... lean bytes ...'
er 4 put a13=:'zig';34;' ... zig bytes ...'


(1;'jscript') -: 4 1 21 dnl 'jscript'
(1;'latex') -: 4 1 22 dnl 'latex'
(1;'html') -: 4 1 23 dnl 'html'
(1;'xml') -: 4 1 24 dnl 'xml'
(1;'text') -: 4 1 25 dnl 'text'
(1;'byte') -: 4 1 26 dnl 'byte'
(1;'markdown') -: 4 1 27 dnl 'markdown'
(1;'utf8') -: 4 1 28 dnl 'utf8'
(1;'python') -: 4 1 29 dnl 'python'
(1;'sql') -: 4 1 30 dnl 'sql'
(1;'json') -: 4 1 31 dnl 'json'
(1;'ipynb') -: 4 1 32 dnl 'ipynb'
(1;'lean') -: 4 1 33 dnl 'lean'
(1;'zig') -: 4 1 34 dnl 'zig'

1 [dat=. a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,:a13

NB. do texts match?
dat -: >{: 4 get {."1 dat

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
