NB.*globsBasic001 t--  basic (globs) tests.
NB.
NB. Tests a failure in valid name extraction discovered when
NB. loading some of Bob Bernecky's J code into J.  
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 11nov23 updated for J7/Linux
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'

cocurrent 'base'
require 'jodtester'


coclass tmploc_AAAbasic999_=: 'AAAbasic999' [ coerase <'AAAbasic999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-


NB. create a verb with no global variable references.
NB. all the assigned names are various J constants 
NB. none should appear as names when (globs) is applied.
testconstants=: 3 : 0
a=. _1j1
b=. _7x7
c=. 23r5
d=. _1e7
f=. _1b17
e=. 23x
f=. 4p8
)

NB. should be empty global list - refer to name in temp locale
0=#>{: globs 'testconstants_',tmploc,'_'

erase 'testconstants'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAbasic999_
