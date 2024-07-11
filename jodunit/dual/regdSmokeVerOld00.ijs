NB.*regdSmokeVerOld00   t--   OUTDATED 24jul11  (regd)    behaviour    for   binary
NB. incompatible dictionaries.
NB.
NB. assumes:
NB.
NB.   1) Some test dictionaries have been created in J version 9.04+.
NB.      Run (create_version_test_dictionaries) in a J 9.04+.
NB.
NB. author:  John D. Baker
NB. created: 2023jan25
NB. changes: -----------------------------------------------------
NB. 24jul11 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAregdSmokeVerOld00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string (y) after last occurrence of (x)
afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

NB. HARDCODE: prior J version bolted in cowboy - beware
tdict=: 'testjodj904'

NB. get names of new system J dictionaries they are
NB. not be registered and must be found from files
tjvd=: (] #~ +./@(tdict&E.)&>) dirpath '~JODTEST'
tjvd=: tjvd #~ -.('/'&afterlaststr&.> tjvd) e. ;:'alien backup document dump script suite'
rgdicts=: ('/'&afterlaststr&.> ,. ]) tjvd

NB. dictionaries created in new J's (after 9.04) cannot be registered
NB. by older JOD J's. The differences in GMP/old extended integers
NB. can lead to unreadable dictionaries if permitted.

ner@regd"1 rgdicts   NB. returns all 1s

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_