NB.*globsBasic001 t--  basic globs tests.
NB.
NB. Tests a failure in valid name extraction discovered when
NB. loading some of Bob Bernecky's J code into J.  
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 11nov23 updated for J7/Linux

clear '' [ cocurrent 'base'
require 'jodtester'
testenvironment 'good';'JOD'

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

NB. should be empty global list
0=#>{: globs'testconstants'

erase 'testconstants'


NB. TEST SUCCESSFUL

NB. reopen any dictionaries
ereopen 0
