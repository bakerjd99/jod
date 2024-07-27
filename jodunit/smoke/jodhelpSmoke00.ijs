NB.*jodhelpSmoke00 t-- (jodhelp) smoke test.
NB.
NB.   0) JOD is loaded - standard J utils (fexist) loaded
NB.
NB. author:  John D. Baker
NB. created: 2024jul27
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAjodhelpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. (jodhelp) starts a pdf reader to display (jod.pdf) which is 
NB. typically installed by the (joddocument) addon in this location
fexist '~addons/general/joddocument/pdfdoc/jod.pdf'

NB. display (jod.pdf)
er jodhelp 0


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_