NB.*noexpSmoke00 t-- (noexp) smoke test.
NB.
NB. assumes:
NB.
NB.   0) (testjod04) exists
NB.   1) (utils) dictionary is available
NB.
NB. author:  John D. Baker
NB. created: 2024jul19
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAnoexpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. load some utils into test locale
er od 'utils' [ 3 od ''
er tmploc get ;:'showpass comb'

tdict=: 'testjod04'
er od tdict [ 3 od ''

NB. create new words that do not exist in the dictionary
newwords=: (3 : 0)
nms=. 0$a:
for_wrd. i. 10 do.
  newwrd=. ('wrd',(":wrd),'nm'),":didnum_ajod_ 0
  (newwrd)=: ] [ 1!:2&2
  nms=. nms,<newwrd
end.
nms
)

NB. store new words
wrdlist=: newwords 0
er tmploc put wrdlist

NB. these new words do not have explanations
er nwex=: noexp ''
wrdlist e. nwex

NB. explain some of them
er 0 8 put (5 {. wrdlist) ,. <'undocumented code is abhorent'
er dnwx=: noexp ''

NB. none of the documented words should be on the list
-.(5 {. wrdlist) e. dnwx

NB. create new tests that do not exist in the dictionary
newtests=: (3 : 0)
nms=. 0 0$a:
for_tst. i. 10 do.
  newtest=. 'tst',(":tst),'nm',":didnum_ajod_ 0
  nms=. nms,newtest;'this is a test'
end.
nms
)

NB. store tests
tsttable=: newtests 0
er 1 put tsttable

NB. none of these tests have explanations
(0 {"1 tsttable) e. 1 noexp ''

NB. create new groups from new words
grptab=: wrdlist {~ (10?120){3 comb #wrdlist
grptab=: ('grp'&,&.> 0 {"1 grptab) ,. grptab
;0 {"1 grp"1 grptab

NB. none of these groups have explanations
(0 {"1 grptab) e. 2 noexp ''

NB. create new suites from new tests
suitab=: (0 {"1 tsttable) {~ (10?120){3 comb #tsttable
suitab=: ('sui'&,&.> 0 {"1 suitab) ,. suitab
;0 {"1 ] 3 grp"1 suitab

NB. none of these suites have explanations
(0 {"1 suitab) e. 3 noexp ''

NB. create new TEXT_ajod_ macros from tests
er 4 put mactab=: ('mac'&,&.> 0 {"1 tsttable) ,. (<TEXT_ajod_) ,. 1 {"1 tsttable

NB. none of these macros have explanations
(0 {"1 mactab) e. 4 noexp ''
 

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_