NB.*getStress00 t-- (get) a very large number of words.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod1000) exists.
NB.   
NB.
NB. author:  John D. Baker
NB. created: 2018oct14
NB. changes: -----------------------------------------------------
NB. 24jul11 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

cocurrent jodtestlocale 'AAAgetStress00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod1000'

er od tdict 

NB. This test requires an absurdly high word count.
100000 < #dnl '' [ showpass did ~ 0

er testlocale_ijod_ get }. dnl ''

100000 < # ".'nl_',testlocale_ijod_,'_ i. 4'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_ 