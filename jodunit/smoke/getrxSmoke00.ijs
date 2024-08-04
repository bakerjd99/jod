NB.*getrxSmoke00 t-- (getrx) smoke test.
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

cocurrent jodtestlocale 'AAAgetrxSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod05'

>0{od tdict [ 3 od ''

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. define and cross reference some words that call each other
showpass=: ] [ 1!:2&2
er tmploc put 'showpass'

bottom=: {{showpass y}}
er tmploc put 'bottom'
er 0 globs 'bottom'

boo00=: {{bottom y}}
boo10=: {{bottom y}}
boo20=: {{bottom y}}
er tmploc put ;:'boo00 boo10 boo20'
; 0 {"1 ] 0&globs&> ;:'boo00 boo10 boo20'

hoo21=: {{bottom y}}
hoo11=: {{bottom y}}
hoo01=: {{bottom y}}
er tmploc put ;:'hoo21 hoo11 hoo01'
; 0 {"1 ] 0&globs&> ;:'hoo21 hoo11 hoo01'

boo30 =: {{hoo21 hoo11 hoo01 y}}
er tmploc put 'boo30'
er 0 globs 'boo30'

boohoo=: {{boo30 boo20 boo10 boo00 y}}
er tmploc put 'boohoo'
er 0 globs 'boohoo'

NB. uses union - unique list of called words call tree
er useu=: showpass 31 uses 'boohoo'

NB. clear base locale WARNING: DANGER WILL ROBINSON!!!
1 [ (4!:55) (nl_base_ '') ,&.> <'_base_'

NB. load all words required to execute to base
er getrx 'boohoo'

NB. it should match the uses union
(nl_base_ '') -: /:~ (0 { ,1 pick useu) , ; 1 { ,1 pick useu

NB. clear base locale WARNING: DANGER WILL ROBINSON!!!
1 [ (4!:55) (nl_base_ '') ,&.> <'_base_'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_