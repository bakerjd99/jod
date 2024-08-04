NB.*lgSmoke00 t-- (lg) smoke test.
NB.
NB. assumes:
NB.
NB.   0) (testjod05) exists - run (createtestdictionaries)
NB.   1) JOD dev dictionaries (joddev, jod, utils) available
NB.
NB. author:  John D. Baker
NB. created: 2024aug04
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAlgSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod05'

NB. fetch some utils
er od ;:'joddev jod utils' [ 3 od ''
er tmploc get ;:'read write beforestr afterstr showpass'

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
er testgrps=: grp ''
er 3 grp ''
grpname=: 1 pick testgrps
grpcontents=: }. grp grpname

NB. clear base locale WARNING: DANGER WILL ROBINSON!!!
1 [ (4!:55) (nl_base_ '') ,&.> <'_base_'

NB. load group goes to base
er lg grpname

NB. check that words got loaded
grpcontents -: nl_base_ ''

NB. clear base locale WARNING: DANGER WILL ROBINSON!!!
1 [ (4!:55) (nl_base_ '') ,&.> <'_base_'

NB. add a group post processor
er 4 put ('POST_',grpname);21;'smoutput 10 # ,:''hello CRUEL world'''

NB. load with post processor
er lg~ grpname

NB. check that words got loaded
grpcontents -: nl_base_ ''

NB. clear base locale WARNING: DANGER WILL ROBINSON!!!
1 [ (4!:55) (nl_base_ '') ,&.> <'_base_'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_