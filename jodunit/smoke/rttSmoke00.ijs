NB.*rttSmoke00 t-- (rtt) smoke test.
NB.
NB. (rtt) run tautology test is one of  the most heavily used JOD
NB. interface words. It is used  to run J  test scripts stored in
NB. JOD dictionaries. A J test  script consists  of a sequence of
NB. assignments and statements that return all 1s.
NB.
NB. assumes:
NB.
NB.   0) (testjod03) exists - run (createtestdictionaries)
NB.
NB. author:  John D. Baker
NB. created: 2024jul28
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAArttSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod03'
er od tdict [ 3 od ''

NB. insert a test script - returns all 1s
tscr0=: ;( 'NB. series of all 1s';'1';'10$1';'5<10 12 13') ,&.> LF
er 1 put 'AllOnes';tscr0

NB. silently run script - should pass
1 rtt 'AllOnes'

NB. insert a script with at least one 0
tscr1=: ;( 'NB. at least one zero';'1';'10$1';'5>10 12 13') ,&.> LF
er 1 put 'NotAllOnes';tscr1

NB. silently run  - should fail
ner 1 rtt 'NotAllOnes'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_