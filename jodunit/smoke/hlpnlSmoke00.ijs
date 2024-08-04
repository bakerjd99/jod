NB.*hlpnlSmoke00 t-- (hlpnl) smoke test.
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

cocurrent jodtestlocale 'AAAhlpnlSmoke00'

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

NB. insert help text for group words
er 0 8 put ggh=: grpcontents ,. <'all workd and no play make jack a dull boy'

NB. short help for group contents matches
((>0{"1 ggh) ; >1{"1 ggh) -: hlpnl grpcontents

NB. group short help text
er 2 8 put ggh=: grpname;'i do what i do because i am what i am'
(,:&.> ggh) -: 2 hlpnl grpname

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_