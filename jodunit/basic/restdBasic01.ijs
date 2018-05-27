NB.*restdBasic01 t-- basic (restd) tests.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod00) exists
NB.
NB. author:  John D. Baker
NB. created: September 2000
NB. changes: -----------------------------------------------------
NB. 11nov29 updated for J7/Linux
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'
NB. 18may26 edit for systems with UNC volumes 

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAbasic999_=: 'AAAbasic999' [ coerase <'AAAbasic999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

dict=: 'testjod00'

NB. open a test dictionary and pack it.
er od dict
er packd dict

NB. now insert some never before seen junk word
NB. into the test dictionary.
(newname=: 'a', ": didnum_ajod_ 0) =: 3 : '2 * y'
er tmploc put newname
erase newname
er tmploc get newname
erase newname

NB. restore the previous backup - it does not contain
NB. the newname
er restd dict
ner get newname
er 3 od ''

NB. check restores from at least two volumes
NB. using unique directory and dictionary names

vol1=: 'c:'

NB. UNC paths are not always present
NB. vol2=: '\\pnas02fs2\home\john2000\temp'

NB. NIMP tweak for linux and volume config
er newd newname;vol1,'/temp/',newname
newername=: 'a', ": didnum_ajod_ 0

NB. UNC paths
NB. er newd newername;vol2,'\temp\',newername

NB. volume 1
er od newname
er packd newname
er tmploc put 'newname'
er restd newname
ner get newname
er 3 od ''

NB. volume 2 UNC paths
NB. er od newername
NB. er packd newername
NB. er tmploc put 'newername'
NB. er restd newername
NB. ner get newername
NB. er 3 od ''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAbasic999_