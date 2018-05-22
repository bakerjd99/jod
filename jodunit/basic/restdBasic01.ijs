NB.*restdBasic01 t-- basic (restd) tests.
NB.
NB. author:  John D. Baker
NB. created: September 2000
NB. changes: -----------------------------------------------------
NB. 11nov29 updated for J7/Linux


clear '' [ cocurrent 'base'
require 'jodtester'
testenvironment 'good';'JOD'

dict=: 'testjod0'

NB. open a test dictionary and pack it.
er od dict
er packd dict

NB. now insert some never before seen junk word
NB. into the test dictionary.
(newname=: 'a', ": didnum_ajod_ 0) =: 3 : '2 * y'
er put newname
erase newname
er get newname
erase newname

NB. restore the previous backup - it does not contain
NB. the newname
er restd dict
ner get newname
er 3 od ''

NB. check restores from at least two volumes
NB. using unique directory and dictionary names

vol1=: 'c:'
vol2=: '\\meccnas00\users\jdbaker'

NB. NIMP tweak for linux and volume config
er newd newname;vol1,'/temp/',newname
newername=: 'a', ": didnum_ajod_ 0
er newd newername;vol2,'\temp\',newername

NB. volume 1
er od newname
er packd newname
er put 'newname'
er restd newname
ner get newname
er 3 od ''

NB. volume 2
er od newername
er packd newername
er put 'newername'
er restd newername
ner get newername
er 3 od ''

NB. TEST SUCCESSFUL

ereopen 0
