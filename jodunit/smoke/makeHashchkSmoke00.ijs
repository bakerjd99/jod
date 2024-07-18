NB.*makeHashchkSmoke00 t-- (make) hash check smoke tests.
NB.
NB. assumes:
NB.
NB.   0) (testjod01) dictionary exists and is loaded
NB.
NB. author:  John D. Baker
NB. created: 2024jul17
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

-. '~JODTEST' -: jpath '~JODTEST'

cocurrent jodtestlocale 'AAAmakeHashchkSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod01'

17 = HASH_ajod_

NB. invalid arguments
ner 17 make ''
ner 17 make 0
ner 17 make 'make my day'
ner 17 make a:
ner 17 make 'c:/this/file/is/missing/nada.ijs'
ner 17 make _1 s: ' this is symbolic'
ner 666 make '/boo/hoo/bitch.ijs'

er od ;:tdict

NB. dump dictionary
df=: make ''

NB. check hash
er HASH_ajod_ make ;{:df

NB. alter dump file - will change hash
bytes=: read ;{:df

NB. change some bytes
bytes=: '*' (?10 # #bytes)} bytes
1 [ bytes write ;{:df

NB. hash will no longer match
ner 17 make ;{:df


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_