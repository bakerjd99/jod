NB.*putSmokeVerNewA0 t-- OUTDATED 24jul10 (put) behaviour  for binary incompatible
NB. dictionaries.
NB.
NB. Only two JOD verbs (put) and (globs) write to binary J files.
NB. This two  part test  checks that older  READONLY dictionaries
NB. that were registered by a new J behave when  an  older system
NB. changes the read status to READWRITE.
NB.
NB. assumes:
NB.
NB.   1) Some test dictionaries have been created in a version of J
NB.      prior to 9.04. Run (create_version_test_dictionaries) and
NB.      (load_test001_version_dictionary) on an older J.
NB.
NB.   2) The read/write status has been set on some older dictionaries.
NB.      Run (dpsetVerOld00) on an older J.
NB.
NB. author:  John D. Baker
NB. created: 2023jan24
NB. changes: -----------------------------------------------------
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAputSmokeVerNewA0'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string (y) after last occurrence of (x)
afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

NB. WARNING: HARDCODE: prior J version bolted in cowboy - beware
tdict=: 'testjodj903'

NB. get names of prior J dictionaries they may
NB. not be registered locate by looking for files
tjvd=: (] #~ +./@(tdict&E.)&>) dirpath '~JODTEST'

NB. HARDCODE: number of dicts
tjvd=: 3 {. tjvd #~ -.('/'&afterlaststr&.> tjvd) e. ;:'alien backup document dump script suite'
rgdicts=: ('/'&afterlaststr&.> ,. ]) tjvd

NB. insure selected dictionaries are not registered
1 [ 3&regd&> 0{"1 rgdicts

NB. the first three old dictionaries are READONLY - these can be registered
er@regd"1 rgdicts  NB. returns all 1s

1 [ smoutput 'in an older J change to READWRITE -> ' ;< 0 {"1 rgdicts
1 [ smoutput 'then in a new J run (putSmokeVerNewB0)'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_