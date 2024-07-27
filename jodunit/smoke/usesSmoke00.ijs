NB.*usesSmoke00 t-- (uses) smoke tests.
NB.
NB.   0) (testjod07) exists - run (createtestdictionaries)
NB.   1) JOD dev dictionaries available
NB.
NB. author:  John D. Baker
NB. created: 2024jul26
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAusesSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

showpass=:] [ 1!:2&2

tdict=: 'testjod07'

NB. load some JOD dictionary words that have many references
er od ;:'joddev jod utils' [ 3 od ''

refs=: uses&> }. dnl ''
refs=: ,/ >1 {"1 refs

NB. include "reffy" words without locale suffixes
refs=: refs #~ 0 = {:"1 #&> refs
refs=: 5 {. refs {~ \: 1 {"1 #&> refs
wrds=: (top5=: 0 {"1 refs), ; 1 {"1 refs
er tmploc get wrds
er od tdict [ 3 od ''

NB. save all referenced words from top 5
er tmploc put wrds -. top5

NB. save top 5 and reference
er tmploc put ;0{top5
er 0 globs ;0{top5
er t05=: uses ;0{top5
rf05=: ; 1 {, >1{t05

NB. refs should match
(rf05) -: >0 { 1 {"1 refs

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_