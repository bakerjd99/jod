NB.*odSmokeArgFail00 t-- basic (od) invalid argument tests.
NB.
NB. author:  John D. Baker
NB. created: October 1999
NB. changes: -----------------------------------------------------
NB. 11nov28 updated for J7/Linux
NB. 18may31 updated for J 8.07
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

NB. The following inputs should result in error messages (newd).

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAodSmokeArgFail00'

NB. expecting failures
testenvironment 'bad';'JOD'
NB. -{TEST START}-

NB. (od) accepts only cl|blcl -- character list and boxed lists 
NB. of character lists.  Valid dictionary names must also exist on
NB. the master dictionary last.  Everything else should be rudely
NB. rejected.

NB. numeric atoms
er od 0
er od 3
er od _3
er od 23.7
er od 8j4
er od 1.8976e24
er od 1x1       NB. the number e in J
er od 4ar4
er od 8888888777777999999999999999999999x
er od 112233445566778899r7878787878787878787878787

NB. numeric arrays (non null random shapes and sizes)
er od (>:?(?4)#3)$0
er od (>:?(?4)#3)$3
er od (>:?(?4)#3)$_3
er od (>:?(?4)#3)$23.7
er od (>:?(?4)#3)$8j4
er od (>:?(?4)#3)$1.8976e24
er od (>:?(?4)#3)$8888888777777999999999999999999999x
er od (>:?(?4)#3)$112233445566778899r787878787878787878787878

NB. symbols and unicode are forbidden
er od s:<'sowrong'
er od u: 'boo'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
