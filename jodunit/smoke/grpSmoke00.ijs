NB.*grpSmoke00 t-- (grp) create empty groups.
NB.
NB. assumes: 
NB.
NB.    1) test dictionary (testjod00) exists
NB.    2) READWRITE put dictionary open.
NB.
NB. author:  John D. Baker
NB. created: 2018may23
NB. changes: -----------------------------------------------------
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAgrpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

NB. open and insure READWRITE
er od tdict [ 3 od  ''
er dpset 'READWRITE'

NB. create empty group
er grp <'groupnull0'

NB. create empty group - this form occurs during dump restores of empty groups
er grp 'groupnull1';''

NB. multiple nulls tolerated
er grp 'groupnull2';'';'',a:,<i.0


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_