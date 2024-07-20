NB.*makePathtest02 t-- (make) path permutations of (makePathtest01).
NB.
NB. verbatim: 
NB.
NB.   0) assumes (testjod00, testjod01, testjod02) created
NB.   1) test (makePathtest01) run
NB. 
NB. author:  John D. Baker
NB. created: 2011nov27
NB. changes: -----------------------------------------------------
NB. 24jul20 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAmakePathtest02'

testenvironment 'good';'JOD'

NB. test dictionaries
dicts=: ;:'testjod00 testjod01 testjod02'
wtypes=: ;:'noun adverb verb'

filepath=: jpath '~temp/'

NB. all path permutations should make
pt=: (i.!3) A."0 1 i. 3

er od (0{pt){dicts
this=: (0{pt){wtypes
er tmploc put 'this'
er make filepath,'0.ijs'
er 3 od ''

er od (1{pt){dicts
this=: (1{pt){wtypes
er tmploc put 'this'
er make filepath,'1.ijs'
er 3 od ''

er od (2{pt){dicts
this=: (2{pt){wtypes
er tmploc put 'this'
er make filepath,'2.ijs'
er 3 od ''

er od (3{pt){dicts
this=: (3{pt){wtypes
er tmploc put 'this'
er make filepath,'3.ijs'
er 3 od ''

er od (4{pt){dicts
this=: (4{pt){wtypes
er tmploc put 'this'
er make filepath,'4.ijs'
er 3 od ''

er od (5{pt){dicts
this=: (5{pt){wtypes
er tmploc put 'this'
er make filepath,'5.ijs'
er 3 od ''


NB. TEST SUCCESSFUL

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_

