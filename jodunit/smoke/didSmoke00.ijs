NB.*didSmoke00 t-- (did) smoke test.
NB.
NB. assumes: 
NB.
NB.   1) standard J profile
NB.   2) (jodtester) verbs available
NB.   3) READWRITE test disctionaries:
NB.      (testjod00, testjod01, testjod10, testjod100) 
NB.
NB. author:  John D. Baker
NB. created: 2000sep01
NB. changes: -----------------------------------------------------
NB. 07dec19 converted to j6.02 JOD
NB. 11nov18 updated for J7/Linux
NB. 15jul09 renamed (didSmoke00) from (didBasic001) 
NB.         run in junk locale
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

NB. the dictionary identification verb (did) ignores it's arguments.
er od tdict
er did 0

NB. number of dictionaries on path must match
1 = # }. did 0

er od ;:'testjod01 testjod10 testjod100'

4 = # }. did 0

er u=: 0 did 0
5 = # 1 pick u  NB. includes header

er 3 od ;:tdict,' testjod100'
er u=: did ~ 0
3 = # 1 pick u

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_