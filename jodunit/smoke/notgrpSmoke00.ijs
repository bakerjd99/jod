NB.*notgrpSmoke00 t-- (notgrp) smoke tests.
NB.
NB.   0) (testjod05) exists - run (createtestdictionaries)
NB.   1) JOD dev dictionaries (joddev, jod, utils) available
NB.
NB. author:  John D. Baker
NB. created: 2024jul28
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAnotgrpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

showpass=:] [ 1!:2&2

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

NB. show any ungrouped words
er showpass ngwrds=: notgrp }. dnl ''

NB. group everything and recheck - result should be null
er grp 'allwordsgroup';}.ngwrds
er showpass notgrp }. dnl ''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_