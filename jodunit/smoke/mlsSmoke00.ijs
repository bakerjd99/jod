NB.*mlsSmoke00 t-- (mls) smoke test.
NB.
NB. assumes:
NB.
NB.   0) (testjod05) exists - run (createtestdictionaries)
NB.   1) JOD dev dictionaries (joddev, jod, utils) available
NB.
NB. author:  John D. Baker
NB. created: 2024aug02
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAmlsSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod05'

NB. save smoke load test scripts
er od ;:'joddev jod utils' [ 3 od ''

NB. fetch some utils
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

NB. put dictionary directory object
do=: {:{. DPATH__ST__JODobj

NB. clear any previous test script artifacts
1 [ ferase testscr=: SCR__do,grpname,'.ijs'
er dpset 'ROOTFOLDER';''

NB. fetch startup 
cfgfile=: jpath '~config/startup.ijs'
strcfg=: read cfgfile

NB. remove any prior test group - startup.ijs is only read when J loads
NB. this must be done before running this test - use config menus

NB. group script should be missing here
(3 : 0) -. +./ grpname E. strcfg=: read cfgfile
if. y do. 1 else. 0 [ showpass 'edit ~config/startup.ijs - remove -> ',grpname end.
)

NB. generate group
er mls grpname

NB. check file exists
fexist testscr

NB. group should be in startup.ijs
+./ grpname E. read cfgfile

NB. clear any group objects
1 [ erase based=: grpcontents

NB. load group 
1 [ load grpname

NB. objects in group should be in base
0 <: nc based
1 [ ferase based

NB. add a group post processor
postproc=: 'smoutput ''this is a test of the one pure thing!'''
er 4 put ('POST_',grpname);JSCRIPT_ajod_;postproc

NB. regenerate group and reload - should show message
er mls grpname
1 [ load grpname

NB. return generated script as result
rc [ 'rc genscr'=: 2 mls grpname
1 [ showpass genscr

NB. redirect generated script to other CONFIGURED folder
1 [ ferase jpath '~temp/',grpname,'.ijs'
er dpset 'ROOTFOLDER';'~temp'
er mls grpname

NB. check redirected file exists
fexist jpath '~temp/',grpname,'.ijs'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_