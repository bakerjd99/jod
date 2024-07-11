NB.*regdSmokeVerNew00   t--   OUTDATED 24jul11 (regd)    behaviour    for   binary
NB. incompatible dictionaries.
NB.
NB. J 9.04 (2023) changed the internal representation of extended
NB. integers  and rationals. This was done so the  well respected
NB. GMP arbitrary precision arithmetic module could be used by J.
NB. GMP is orders of magnitude faster than J's original arbitrary
NB. precision  so  it's  worth the  nuisance  of handling  binary
NB. incompatibilites for existing dictionary files.
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
NB. 24jul11 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAregdSmokeVerNew00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string (y) after last occurrence of (x)
afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

NB. HARDCODE: prior J version bolted in cowboy - beware
tdict=: 'testjodj903'

NB. get names of prior J dictionaries they may 
NB. not be registered locate by looking for files
tjvd=: (] #~ +./@(tdict&E.)&>) dirpath '~JODTEST'

NB. HARDCODE: number of dicts 
tjvd=: 5 {. tjvd #~ -.('/'&afterlaststr&.> tjvd) e. ;:'alien backup document dump script suite'

NB. the last two dictionaries set by (dpsetVerOld00) are READWRITE. You
NB. cannot register binary incompatible READWRITE dictionaries
rgdicts=: ('/'&afterlaststr&.> ,. ]) tjvd

NB. insure selected dictionaries are not registered
1 [ 3&regd&> 0{"1 rgdicts

NB. HARDCODE: positions
ner@regd"1 ] 3 4{rgdicts   NB. returns all 1s

NB. the first three old dictionaries are READONLY - these can be registered
er@regd"1 ] 0 1 2{rgdicts  NB. returns all 1s


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_