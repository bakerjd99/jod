NB.*etSmoke00 t-- (et) smoke test.
NB.
NB. author:  John D. Baker
NB. created: 2024jul13
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAetSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. (et) places text in edit windows. Inspect
NB. edit windows in various J front ends, JQt, JHS
et ,50 # ,: 'I do what I do because I am what I am',LF

NB. dyad specifies temp file name
'ShiningMagumOpus' et ,10000 # ,: 'all work and no play make Jack a dull boy',LF

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_