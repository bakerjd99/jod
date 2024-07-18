NB.*makeHashchkStress00 t-- (make) large dump hash test.
NB.
NB.   0) (testjod1000) dictionary exists and is loaded
NB.
NB. author:  John D. Baker
NB. created: 2024jul18
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAmakeHashchkStress00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod1000'

NB. open large dictionary
er od tdict
100000 < #dnl ''

NB. make large dump script
df=: make ''

NB. hash should match
er 17 make ;{:df

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_