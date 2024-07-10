NB.*rxsBadSmoke00 t-- (rxs) invalid argument smoke tests.
NB.
NB. assumes:
NB.  
NB. author:  John D. Baker
NB. created: 2019feb11
NB. changes: -----------------------------------------------------
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

require 'jodtester'

cocurrent jodtestlocale 'AAArxsBadSmoke00'

testenvironment 'good';'JOD'

NB. following code fragment generates all (rxs) valid nonempty code patterns
NB.   t=.  > (, { (i. 5) ; 7 8 9 ; 1 2 3) , , {5;7;1 2 3
NB.   (<"0 ~. 0 {"1 t) , (<"1 ~. 0 1 {"1 t) , <"1 t


tdict=: 'testjod00'
tpfx=: 'testjod'

NB. search patterns
pat00=: 'ab[0-9aeiou]c'
pat01=: '[[:digit:]]+'
pat02=: '[[:digit:]]+'


NB. invalid name lists
ner pat00 rxs ''
ner pat00 rxs 0
ner pat00 rxs 2 2$2
ner pat00 rxs 'good';'good';'--bad'
ner pat00 rxs 2 2$<'no';'tables'


NB. invalid patterns
ner ((i.3);0 7 1) rxs ;:'ok names cowboy'
ner ('boo';1 7 4) rxs ;:'almost correct options'

NB. no zero option
ner ('hoo';4 8 0) rxs ;:'more almost correct options'
ner 0 8 0 rxs ;:'so very bad'

NB. test edge case were the dictionary contains nothing but nouns
NB. (rxs) does not search nouns even if they are character 

NB. Note: the ~JODTEST root must be set - use J configure
JODTESTROOT=: jpath '~JODTEST'
1 [ makedir_ajod_ <JODTESTROOT
JODTESTROOT=: tslash2_ajod_ JODTESTROOT

NB. create empty new dictionary - didnum insures it doesn't exist
dn=:tpfx,":didnum_ajod_ ''
er newd dn;JODTESTROOT,dn
er od dn

NB. insert nothing but nouns
noun0=:'yeah it is text but it aint searched because noun '
noun1=: i. 5
noun2=: <^:(10) 'go deep'
noun3=: ;:'nesty nesty testy testy'
noun4=: 666j1 * j. i. 3 2 2  
noun5=: % 100?100
noun6=: noun0;noun1;noun2

er tmploc put ;:'noun0 noun1 noun2 noun3 noun4 noun5 noun6'

NB. nothing found 
er nada=: 'rgx' rxs }. dnl ''
0 2 -: $>1{nada

NB. the dictionary case 5 does not have short and long texts
er (pat00;5 7 1) rxs ''
er (pat00;5 7 3) rxs ''
ner (pat00;5 8 1) rxs ''
ner (pat00;5 9 3) rxs ''

NB. insert some objects in empty dictionary for nearly correct tests
er 4 put 'MACRO00';21;'NB. test macro'
er 1 put 'TEST00';'NB. test test'
er 'ajod' put nl_ajod_ i. 4

NB. nearly correct patterns 
ner ('somepat';4 1) rxs }. 4 dnl ''
ner ('somepat';0 1 3) rxs }. dnl ''
ner ('somepat';1 2) rxs }. 1 dnl ''


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_