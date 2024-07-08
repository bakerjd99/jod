NB.*bnlSmoke01 t-- (bnl) display pack/backup dates.
NB.
NB. assumes:
NB.
NB.   0) (JODTEST) defined: jpath '~JODTEST'
NB. 
NB.   1) (testjod00) dictionary 
NB.
NB.      newd 'testjod00';jpath '~JODTEST/testjod00' NB. create 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00' NB. or register
NB.       
NB. created: 2019mar22
NB. changes: -----------------------------------------------------
NB. 24jun22 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAbnlSmoke01'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od ''

NB. insure we have some backups
er packd tdict
er packd tdict

NB. Show embedded backup dates. These dates will appear
NB. as zero dates in older backups. Sometimes J binaries
NB. change so much that later versions cannot read 
NB. older binaries. In that case instead of a date
NB. an error message will be displayed.
er 14 bnl '.'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
