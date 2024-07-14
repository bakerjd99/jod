NB.*gdepsSmoke00 t-- (gdeps) smoke test.
NB.
NB. assumes:
NB.
NB.   0) dictionary (testjod01) exists and is loaded.
NB.
NB. author:  John D. Baker
NB. created: 2024jul13
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAgdepsSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod01'
er od tdict [ 3 od ''

showpass=:] [ 1!:2&2
allwhitetrim=:] #~ [: -. [: (*./\. +. *./\) ] e. (9 10 13 32{a.)"_

NB. select random words
rpick=: ] { ~ [ {. [: ?~ [: # ]
gwds=: 20 rpick }. dnl ''

NB. new group 
gnm=: 'gdep',":didnum_ajod_ 0
er grp gnm;gwds

NB. redefine some words in dependent section
rdef=. 10 {. gwds
depsec=: 'NB.*dependents',LF,(ctl_ajod_ > rdef ,&.> <'=: 0'),LF,'NB.*enddependents'
er 2 1 put gnm;depsec

er showpass dsec=: gdeps gnm

NB. words in section match
(}.dsec) -: /:~ rdef

NB. another new group 
gnm2=: 'gdep',":didnum_ajod_ 0
er grp gnm2;gwds

NB. redefine all words in dependent section
depsec2=: 'NB.*dependents',LF,(ctl_ajod_ > gwds ,&.> <'=: 0'),LF,'NB.*enddependents'
er 2 1 put gnm2;depsec2
dsec2=: gdeps gnm2
(}.dsec2) -: /:~ gwds

NB. when the second group is generated the text following the
NB. dependent section should be empty as all words are excluded
NB. since they are in the dependent section
er gtxt=: 2 2 make gnm2

NB. clip header and trim whitespace nothing should be left
0 = #allwhitetrim 'NB.*end-header' afterstr_ajod_ 1 pick gtxt


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_