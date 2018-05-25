NB.*grplitBasic01 t-- basic test for main jodliterate verb (grplit).
NB.
NB. verbatim: assumes (jodliterate)  and (jod) is loaded
NB.
NB. author:  John D. Baker
NB. created: 2012oct09
NB. -----------------------------------------------------------------

cocurrent 'base'
require   'jodtester jodliterate'
coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert  'ijod'
coinsert  'ajodliterate'

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
coerase <tmploc_AAAtrash999_