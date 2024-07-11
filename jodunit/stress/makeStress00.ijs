NB.*makeStress00 t-- (make) dump very large dictionary.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod1000) exists.
NB.
NB. author:  John D. Baker
NB. created: 2018oct14
NB. changes: -----------------------------------------------------
NB. 24jul11 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

cocurrent jodtestlocale 'AAAmakeStress00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod1000'

er od tdict  NB. open READONLY

NB. This test requires an absurdly high word count.
NB. If you ever create a system with 100000 parts
NB. you have bigger problems than storage.
100000 < #dnl '' [ showpass did ~ 0

NB. creates a roughly 400mb script
er make ''

1 [ dir jpath '~JODTEST/',tdict,'/dump'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_