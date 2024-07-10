NB.*putSmokeVerNewB0 t-- OUTDATED 24jul10 (put) behaviour  for binary incompatible
NB. dictionaries.
NB.
NB. Second part of (put) binary compatibility test see (putSmokeVerNewA0).
NB.
NB. author:  John D. Baker
NB. created: 2023jan25
NB. changes: -----------------------------------------------------
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAputSmokeVerNewA0'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. WARNING: HARDCODE: prior J version
tdict=: 'testjodj903'
oldicts=: 3 {. (] #~ +./@(tdict&E.)&>) }. od''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_