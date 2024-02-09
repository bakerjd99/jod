NB.*odSmoke00 t-- (od) test opening of entire path (6 od) option.
NB.
NB. assumes:
NB.
NB.   0) configured J test folder JODTEST, standard J utils (dir, dirtree)
NB.
NB. created: 2024feb09
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. is folder configured
iscf '~JODTEST'

NB. open all dictionaries on (adnd) path - very long jod path
er settdict 'adnd' 
er showpass 6 od 'adnd'

NB. basic bad argument tests
er 3 od ''
ner 6 od ''
ner 6 od 'doesnotexist'
ner 6 od 43  NB. invalid names
ner 6 od 1 7$'yada'

NB. first dict ok - others ignored even if bad
er 6 od 'adnd';'778889999999999'

NB. first dict bad
ner 6 od 'wrongbitch';'adnd'
ner 6 od '778889999999999990';'adnd'

NB. set test dictionaries
er settdict tdict0=: 'testjod00'
er settdict tdict1=: 'testjod01'
er settdict tdict2=: 'testjod02'

clrtback=: 3 : 0
NB. close any open and open test dictionary
('fail opening -> ',y) assert er od y [ 3 od ''

NB. clear any current path
('fail path clearing -> ',y) assert er dpset 'CLEARPATH'

NB. erase any current test dictionary backups
DL=: {: {.DPATH__ST__JODobj
0 0$ferase 1 dir BAK__DL,'*.*'

NB. no backup error expected
'fail backups found' assert ner 14 bnl '.'

NB. we're good
1
)

clrtback tdict0
clrtback tdict1
clrtback tdict2

NB. open all test dicts and create a group - this gives the put dictionary a path
er 3 od ''
er od tdict0;tdict1;tdict2 

boo=:Hoo=:fOO=: i. 5
er tmploc put ;:'boo Hoo fOO'
er grp ;:'HooGroup boo Hoo fOO' 

NB. put dictionary path
pdpath=: ;{:1{rv_ajod_ did ~ 0

er 3 od ''
er 6 od tdict0
od6path=: ;{:1{rv_ajod_ did ~ 0

NB. paths should match
pdpath -: od6path

NB. these dicts should have empty paths
er 3 od ''
er 6 od tdict1
'/' = ;{:1{rv_ajod_ did ~ 0

er 3 od ''
er 6 od tdict2
'/' = ;{:1{rv_ajod_ did ~ 0


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_
