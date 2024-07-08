NB.*loaddumpSmoke00 t-- dump script reloading smoke tests.
NB.
NB. assumes:
NB.
NB.   0) JOD dev dictionaries open
NB. 
NB.   1) (testjod00) dictionary 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.  
NB. author:  John D. Baker
NB. created: 2015oct05
NB. changes: -----------------------------------------------------
NB. 18may26 updated for J 8.07 see: rtt 'createtestdictionaries'
NB. 19mar14 adjusted for 18!:4 change
NB. 24jun29 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloaddumpSmoke00'

NB. save smoke load test scripts
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

testenvironment 'good';'JOD'

>0{od 'testjod00' [ 3 od ''

NB. turn off timestamps
>0{dpset 'RETAINAGE';0

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. load objects into test dictionary
1 [ ((0!:100) :: _1:) loadSmoketest0
1 [ ((0!:100) :: _1:) loadSmoketest1

NB. dump current and reload
df=: make ''  
1 [ ((0!:0) :: _1:) {:df

NB. turn on timestamps and dump/reload
>0{dpset 'RETAINAGE';1
df=: make ''  
1 [ ((0!:0) :: _1:) {:df

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
