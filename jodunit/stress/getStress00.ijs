NB.*getStress00 t-- get a very large number of words.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod1000) exists.
NB.   
NB.
NB. author:  John D. Baker
NB. created: 2018oct14
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'


coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod1000'

er od tdict 

NB. This test requires an absurdly high word count.
100000 < #dnl '' [ showpass did ~ 0

er 'AAArubbish999' get }. dnl ''

100000 < #nl_AAArubbish999_ i. 4

coerase <'AAArubbish999'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_