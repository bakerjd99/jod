NB.*packdStress00 t-- (packd) very large dictionary.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod1000) exists.
NB.
NB. author:  John D. Baker
NB. created: 2018oct14
NB. changes: -----------------------------------------------------
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

cocurrent jodtestlocale 'AAApackdStress00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod1000'

er od tdict  NB. open READONLY

NB. This test requires an absurdly high word count.
100000 < #dnl '' [ showpass did ~ 0

er packd tdict

1 [ showpass dir jpath '~JODTEST/',tdict,'/backup'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_