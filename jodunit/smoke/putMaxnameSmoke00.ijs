NB.*putMaxnameSmoke00 t-- (put) test MAXNAME length check.
NB.
NB. assumes:
NB. 
NB.   1) (testjod00) dictionary - see test createtestdictionaries
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.           ....
NB.
NB. author:  John D. Baker
NB. created: 2019mar18
NB. changes: -----------------------------------------------------
NB. 24jul11 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAputMaxnameSmoke00'

NB. turn yammer on 
testenvironment 'good';'JOD';1
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od ''
er dpset 'READWRITE'

NB. make name too long and assign bogus value
bigly=: 'biglyname',MAXNAME_ajod_#'S'
(bigly)=: i. 2 2

NB. attempt to put - should fail
ner tmploc put bigly 


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_