NB.*putSmokeVerNewB0 t-- (put) behaviour  for binary incompatible
NB. dictionaries.
NB.
NB. Second part of (put) binary compatibility test see (putSmokeVerNewA0).
NB.
NB. author:  John D. Baker
NB. created: 2023jan25
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'


coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. HARDCODE: prior J version
tdict=: 'testjodj903'
oldicts=: 3 {. (] #~ +./@(tdict&E.)&>) }. od''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_