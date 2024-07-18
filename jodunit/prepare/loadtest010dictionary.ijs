NB.*loadtest010dictionary t-- load 10x first order of magnitude test dictionary.
NB.
NB. assumes:
NB.
NB.   1) test dictionary (testjod01) exists and is loaded.
NB.
NB. author:  John D. Baker
NB. created: 1999nov01
NB. changes: -----------------------------------------------------
NB. 11nov22 updated for JOD 0.9.4+
NB. 18oct10 updated for J 8.07
NB. 24jun30 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloadtest010dictionary'

testenvironment 'good';'JOD'

tdict1=: 'testjod01'
tdict10x=: 'testjod100'

NB. open (tdict1) and grab 1200 words without defining
er od tdict1
>{. xxx=: 0 10 get (1200?#}.dnl''){}.dnl''  NB. words
>{. ttt=: 1 get }. 1 dnl ''                 NB. tests
>{. mmm=: 4 get }. 4 dnl ''                 NB. macros
ggg=: <: ; #@grp&.> }. grp''     NB. size of (tdict1) groups
xxx=: 1 pick xxx
ttt=: 1 pick ttt 
mmm=: 1 pick mmm

er 3 od tdict1

NB. open (tdict10x) and delete all words, groups, tests, suites, macros
er od tdict10x
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''
er did ~ 0

NB. pack dictionary to recover wasted space
er packd tdict10x

NB. store words
er 0 10 put xxx

NB. store tests
er 1 put ttt

NB. store macros
er 4 put mmm

NB. repeatedly change word names and store
rename=: 13 : '({."1 y) -.&'' ''@,&.> <"1 ": ,. (x* #y) + i. #y'
>{. showpass 0 10 put (0 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (1 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (2 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (3 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (4 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (5 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (6 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (7 rename xxx) (<a:;0)} xxx
>{. showpass 0 10 put (8 rename xxx) (<a:;0)} xxx

NB. rename test copies and store
>{. showpass 1 put (0 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (1 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (2 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (3 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (4 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (5 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (6 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (7 rename ttt) (<a:;0)} ttt
>{. showpass 1 put (8 rename ttt) (<a:;0)} ttt

NB. insert test word descriptions
WNAMES=: dnl ''
WNAMES=: }. WNAMES
SHORTDOCS=:(?.(#WNAMES)#80) $&.> (#WNAMES)#<'test10 generic meaningless test descriptions'
er 0 8 put WNAMES ,. SHORTDOCS

NB. generate arbitrary groups roughly ten times larger than
NB. the groups in the (testjod01) dictionary
ggg=: >: ?. 10 * 10 # ggg
MAXGRPSIZE=: #WNAMES
ggg=: MAXGRPSIZE <. ggg
GRPLISTS=: ((<"0 ggg) ?&.> <MAXGRPSIZE) {&.> <WNAMES
GRPLISTS=: (<"0 trimnl_ajod_ <"1 'test10grp' ,"1  ljust ":  ,. i. #ggg) ,&.> GRPLISTS
; {."1 grp&> GRPLISTS

NB. generate arbitrary random test suites 
; {."1 [ 3 grp"0 1 ((<'suite') ,&.> ":&.> <"0 i. 100) ,. (30 ?"0 1 [ 100 # #}.1 dnl '') { }. 1 dnl ''

NB. generate all cross references - ignoring errors as many words
NB. are missing and many ambigous names are improperly declared.
1 [ 0 globs&> }. dnl ''

NB. show dictionary stats
er did ~ 0

NB. close test10 dictionary and clean up
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_