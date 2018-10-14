NB.*makeStress00 t-- dump very large dictionary.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod1000) exists.
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
coerase <tmploc_AAAtrash999_