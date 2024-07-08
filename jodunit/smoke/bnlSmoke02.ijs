NB.*bnlSmoke02 t-- (bnl) test hash failure detection.
NB.
NB. assumes:
NB.
NB.   0) configured J test folder JODTEST, standard J utils (dir, dirtree)
NB.
NB.   1) (testjod00) dictionary
NB.      newd 'testjod00';jpath '~JODTEST/testjod00' NB. create
NB.      regd 'testjod00';jpath '~JODTEST/testjod00' NB. register extant
NB.
NB. created: 2024feb03
NB. changes: -----------------------------------------------------
NB. 24jul07 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAbnlSmoke02'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. is folder configured
iscf '~JODTEST'

NB. set test dictionary
er settdict tdict=: 'testjod00'

NB. read and write bytes
read=: 1!:1&(]`<@.(32&>@(3!:0)))
write=: 1!:2 ]`<@.(32&>@(3!:0))

NB. close any open and open test dictionary
er od tdict [ 3 od ''

NB. erase any current test dictionary backups
DL=: {: {.DPATH__ST__JODobj
0 0$ferase 1 dir BAK__DL,'*.*'

NB. no backup error expected
ner 14 bnl '.'

NB. insert random arrays  between backups to insure
NB. hashes in the njhashes.txt sidecar files differ
hashhack=: ?5 5 5$1000000
hashmsg=: 'first backup'
er tmploc put 'hashhack'
er tmploc put 'hashmsg'
er packd tdict

hashhack=: ?5 5 5$1000000
hashmsg=: 'second backup'
er tmploc put 'hashhack'
er tmploc put 'hashmsg'
er packd tdict

NB. all hashes should pass
er showpass hashes=: 17 bnl '.'
*./ ; 1 1 }. rv_ajod_ hashes

NB. copy and rename older backup word files over
NB. newer backups - this will introduce a hash failure
jwords=: dirtree BAK__DL,'*jwords.ijf'
jwords=: (\: 1 {"1 jwords){jwords
(read ;0{{:jwords) write ;0{{.jwords
er showpass hckhashes=: 17 bnl '.'

NB. some hashes fail - 0s in 17 bnl '.'
0 e. ; 1 1 }. rv_ajod_ hckhashes

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
