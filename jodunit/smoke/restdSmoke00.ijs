NB.*restdSmoke00 t-- (restd) test backup restores.
NB.
NB. assumes:
NB.
NB.   0) configured J test folder JODTEST, standard J utils (dir, erase, ferase)
NB. 
NB.   1) (testjod00) dictionary 
NB.      newd 'testjod00';jpath '~JODTEST/testjod00' NB. create
NB.      regd 'testjod00';jpath '~JODTEST/testjod00' NB. register extant
NB.  
NB. created: 2024feb03
NB. changes: -----------------------------------------------------
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAArestdSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od ''

NB. erase any current test dictionary backups
DL=: {: {.DPATH__ST__JODobj
0 0$ferase 1 dir BAK__DL,'*.*'

NB. no backup error expected
ner 14 bnl '.'

NB. attempt to restore with no backups
ner restd tdict

NB. insert random arrays  between backups to insure
NB. hashes in the njhashes.txt sidecar files differ
h1=: hashhack=: ?5 5 5$1000000
hashmsg=: 'first backup'
er tmploc put 'hashhack'
er tmploc put 'hashmsg'
er packd tdict

h2=: hashhack=: ?5 5 5$1000000
hashmsg=: 'second backup'
er tmploc put 'hashhack'
er tmploc put 'hashmsg'
er packd tdict

h3=: hashhack=: ?5 5 5$1000000
hashmsg=: 'third backup'
er tmploc put 'hashhack'
er tmploc put 'hashmsg'
er packd tdict

NB. all hashes should pass
er hashes=:17 bnl '.'
*./ ; 1 1 }. rv_ajod_ hashes

NB. clear stored nouns
erase ;:'hashhack hashmsg'

NB. backup numbers from recent to oldest
er bnums=: bnl '.'
bnums=: ".&> (}. bnums) -.&.> '.'

NB. restore the first backup
er restd tdict;{:bnums

NB. reopen restored backup
er od tdict [ 3 od ''

NB. message should be 'first backup'
er tmploc get 'hashmsg'
'first backup' -: hashmsg 

NB. array should match first 
er tmploc get 'hashhack'
h1 -: hashhack

NB. read and write bytes
read=: 1!:1&(]`<@.(32&>@(3!:0)))
write=: 1!:2 ]`<@.(32&>@(3!:0))

NB. copy and rename older backup word files over
NB. newer backups - this will introduce a hash failure
DL=: {: {.DPATH__ST__JODobj
jwords=: dirtree BAK__DL,'*jwords.ijf'
jwords=: (\: 1 {"1 jwords){jwords
(read ;0{{:jwords) write ;0{{.jwords
er hckhashes=: 17 bnl '.'

NB. index of backup with hash failure
badback=: 0 i.~ *./"1  ;"1 ] 1 1 }. rv_ajod_ hckhashes
badnum=: ".(;badback { }. bnl '.') -. '.' 

NB. attempt to retore bad backup - hash failure expected
ner restd tdict;badnum

NB. ignore hash failure - not recommended - HASH = 17 code
er restd tdict;badnum,HASH_ajod_


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
