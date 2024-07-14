NB.*docSmoke00 t-- (doc) smoke test.
NB.
NB. assumes:
NB.
NB.   0) dictionary (testjod01) exists and is loaded.
NB.
NB. author:  John D. Baker
NB. created: 2024jul12
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAdocSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. show and then pass noun
showpass=:] [ 1!:2&2

tdict=: 'testjod01'

tdict=: 'testjod01'
er od tdict [ 3 od ''

NB. example from jod.pdf
docexample0=: 3 : 0
NB.*docexample0 v-- the leading block of comments
NB. can be a scriptdoc     
NB.                      compatible mess as far
NB. as formatting goes.
NB.
NB. However, if you run doc over 
NB.     a word in a JOD dictionary your
NB.                    mess is cleaned up. See below.
NB. monad: docexample uuHungarian
NB.
NB. text below monad: and dyad: is left unformatted
NB. this region is used to display example calls
J code from now on
)

NB. store in dictionary and format document block
er tmploc put 'docexample0'
er doc 'docexample0'
NB. show formatted text
1 [ showpass disp 'docexample0'

tidytest=: 0 : 0
NB.*tidytest t-- a test
NB.        that is a     hot  depraved
NB.       mess.
NB.
NB.  We   are so   
NB.                           messed up that only  JOD
NB.      can                     set us    right!
)

er TEST_ajod_ put 'tidytest';".'tidytest_',testlocale_ijod_,'_'
er TEST_ajod_ doc 'tidytest'
1 [ showpass TEST_ajod_ disp 'tidytest'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_