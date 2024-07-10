NB.*grplitBasic01 t-- basic test for main jodliterate verb (grplit).
NB.
NB. verbatim: assumes (jodliterate)  and (jod) is loaded
NB.
NB. author:  John D. Baker
NB. created: 2012oct09
NB. -----------------------------------------------------------------
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require   'jodtester jodliterate'

cocurrent 'ijod ajodliterate' jodtestlocale 'AAAgrplitBasic01'

testenvironment 'good';'JOD'
NB. -{TEST START}-

1 [ 3 od ''
er od ;:'joddev jod utils'
er setjodliterate 'c:/temp'

NB. generate latex for all groups on path - a cruncher
;{."1 showpass grplit&> }. grp''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_