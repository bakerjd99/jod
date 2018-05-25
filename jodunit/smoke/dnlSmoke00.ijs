NB.*dnlSmoke00 t-- (dnl) smoke tests.
NB.
NB. Checks  all  the valid  argument  cases  of  (dnl).  Numerous
NB. "nearly correct" invalid cases are also tested.
NB.
NB. assumes:
NB.
NB.   1) (testjod00) dictionary
NB.
NB. author:  John D. Baker
NB. created: 2015jul20
NB. changes: -----------------------------------------------------
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. only put dictionary is on the path
2 = #did 0

NB. dictionary is empty
0 = #> 1 { 0 dnl ''
0 = #> 1 { 1 dnl ''
0 = #> 1 { 2 dnl ''
0 = #> 1 { 3 dnl ''
0 = #> 1 { 4 dnl ''

NB. insert some verbs
vnames=: 'bwrd0 bwrd1 bwrd2 bwrd3'
bwrd0=: =
bwrd1=: -
bwrd2=: 3 : 'x * y'
bwrd3=: 13 : 'x - 2 * y'
>0{tmploc put ;:vnames

NB. insert some nouns
nnames=: 'nwrd0 nwrd1 nwrd2 nwrd3 nwrd4'
(;:nnames)=: ('ugly cowboys');(i. 2 3);(10?10);(89 % ?5 2$77);<u:'unicode me bro'
>0{tmploc put ;:nnames


(dnl '') -: 1 ; (;:vnames) , ;:nnames
(0 dnl '') -: 1 ; (;:vnames) , ;:nnames

(0 1 dnl '') -: 1 ; (;:vnames) , ;:nnames  NB. empty word prefix
(0 2 dnl '') -: 1 ; (;:vnames) , ;:nnames  NB. empty word infix
(0 3 dnl '') -: 1 ; (;:vnames) , ;:nnames  NB. empty word suffix

(0 1 dnl 'bwr') -: 1 ; ;:vnames        NB. word prefix
(0 2 dnl '4') -: 1 ; ;:'nwrd4'         NB. word infix
(0 3 dnl 'd1') -: 1 ; ;:'bwrd1 nwrd1'  NB. word suffix

ner 0 0 dnl '' NB. qualifier errors
ner 0 4 dnl ''
ner 0 0 0 dnl ''

(0 1 0 dnl '') -: 1 ; ;:nnames       NB. empty word prefix (nouns)
(0 1 0 dnl 'nwrd4') -: 1 ; ;:'nwrd4' NB. word prefix (nouns)
(0 2 0 dnl 'rd3') -: 1 ; ;:'nwrd3'   NB. word infix (nouns)
(0 3 0 dnl 'd1') -: 1 ; ;:'nwrd1'    NB. word suffix (nouns)

ner 0 4 0 dnl 'rd'  NB. qualifier errors
ner 0 4 3 dnl 'rd'  
ner 0 0 3 dnl 'no'
ner 0 0 1 dnl 'wrong'
ner 0 0 2 dnl 'again'
 
(0 1 3 dnl '') -: 1 ; ;:vnames       NB. empty word prefix (verbs)
(0 1 3 dnl 'bwrd3') -: 1 ; ;:'bwrd3' NB. word prefix (verbs)
(0 2 3 dnl 'rd3') -: 1 ; ;:'bwrd3'   NB. word infix (verbs)
(0 3 3 dnl 'd1') -: 1 ; ;:'bwrd1'    NB. word suffix (verbs)

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_