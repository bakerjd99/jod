NB.*makePathtest01 t-- sets up test dictionaries for path name class tests.
NB.
NB. verbatim: assumes (testjod00, testjod01, testjod02) created
NB.  
NB. author:  John D. Baker
NB. created: 2011nov24
NB. changes: -----------------------------------------------------
NB. 11nov27 split into two tests (makePathtest01,mathPathtest02)
NB. 24jul20 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAmakePathtest01'

testenvironment 'good';'JOD'

NB. test dictionaries
dicts=: ;:'testjod00 testjod01 testjod02'
wtypes=: ;:'noun adverb verb'

nounfix=: 10 % ?5 5$10
verbfix=: 3 : 'x * y'
adverbfix=: 1 : 'u\.'
conjfix=: 2 : 'v u\.'

NB. noun adverb verb
test=: 10 ?. 10
er od 0 pick dicts
er tmploc put ;:'test nounfix'
er 3 od ''
er od 1 pick dicts
test=: 1 : 'u\'
er tmploc put ;:'test verbfix'
er 3 od ''
er od 2 pick dicts
test=: 3 : 'x + y'
er tmploc put ;:'test adverbfix conjfix'
er 0 _1 dnl ''
er 3 od ''

NB. TEST SUCCESSFUL

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
