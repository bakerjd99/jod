NB.*delgrpSmoke00 t-- (delgrp) smoke tests.
NB.
NB.   0) (testjod05) exists - run (createtestdictionaries)
NB.   1) JOD dev dictionaries (joddev, jod, utils) available
NB.
NB. author:  John D. Baker
NB. created: 2024jul27
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAdelgrpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod05'

NB. save smoke load test scripts
er od ;:'joddev jod utils' [ 3 od ''
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

>0{od tdict [ 3 od ''

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. load objects into test dictionary
1 [ ((0!:100) :: _1:) loadSmoketest0
1 [ ((0!:100) :: _1:) loadSmoketest1

NB. some groups/suites were loaded
er grp ''
er 3 grp ''

NB. group & suite contents
grpwrds=: grp 1 pick grp''
suitests=: 3 grp 1 pick 3 grp ''

NB. delete objects - test for presence
er (;1 pick grp '') delgrp ;1 pick grpwrds
-. (<1 pick grpwrds) e. 1 pick grpwrds

er ((;1 pick 3 grp '');3) delgrp ;1 pick suitests
-. (<1 pick suitests) e. 1 pick suitests

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_