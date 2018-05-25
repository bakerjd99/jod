NB.*dpsetBasic01 t-- basic (dpset) parameter set/change tests.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod00) exists.
NB.
NB. author:  John D. Baker
NB. created: 2012nov20
NB. changes: -----------------------------------------------------
NB. 18may21 ROOTFOLDER tests added

cocurrent 'base'
require 'jodtester'

NB. work in clear base or trash locale
clear ''

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er 2 od tdict          NB. open READONLY
ner dpset 'ASCII85';1  NB. cannot change parameter

NB. reopen insure READWRITE
er od tdict [ 3 od ''
er dpset 'READWRITE'
er dpset 'ASCII85';1
er dpset 'RETAINAGE';1

NB. make read only - change will fail
er dpset 'READONLY'
ner dpset 'ASCII85';1

NB. reopen - dictionary is READONLY
er od tdict [ 3 od ''
ner dpset 'ASCII85';0

NB. insure test group exists
er dpset 'READWRITE'
1 [ 2 del 'testgroup'
NB. using words in loaded jod class
er 'ajoddob' put nl_ajoddob_ ''
er grp 'testgroup';nl_ajoddob_ ''

NB. relative roots begin with '~'
er dpset 'ROOTFOLDER';'BADROOT'

NB. attempt to make group will fail because of bad root
ner mls 'testgroup'

NB. reset to valid root and remake - insure target folder exists
1 [ makedir_ajod_ <jpath '~JODTEST/testdpset'
er dpset 'ROOTFOLDER';'~JODTEST/testdpset'
er mls 'testgroup'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_