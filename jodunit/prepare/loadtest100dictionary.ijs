NB.*loadtest100dictionary t-- load 100x 2nd order of magnitude test dictionary.
NB.
NB. verbatim: assumes (testjod100) loaded
NB.
NB. author:  John D. Baker
NB. created: November 1999
NB. changes: -----------------------------------------------------
NB. 11nov22 updated for JOD 0.9.4+
NB. 18oct10 updated for J 8.07
NB. 24jun30 revise for J 9.6 (cocreate/coerase) changes
NB. 24jul18 merge in (jodtest, jod, utils) dictionaries 

cocurrent 'base'
require 'jodtester'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloadtest100dictionary'

testenvironment 'good';'JOD'

tdict10x=: 'testjod100'
tdict100x=: 'testjod1000'

NB. open (tdict10x) and get around 10000 words without defining
er od tdict10x
>{. xxx=: 0 10 get (10010?#}.dnl''){}.dnl''  NB. words
>{. ggg=: grp ''                             NB. groups
xxx=: 1 pick xxx 
ggg=: }. ggg
er 3 od tdict10x

NB. open (tdict100x) and delete all words, groups, tests, suites, macros
er od tdict100x
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''
>{. showpass did ~ 0

NB. pack dictionary to recover wasted space
er packd tdict100x

NB. store words
>{. showpass 0 10 put xxx

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

NB. insert test word descriptions (extreme use of put command here)
>{.0 8 put (}.dnl '') ,. <'test100 more meaningless test descriptions of average length'

NB. merge in various dictionaries so (tests, groups, macros) exist
er od ;:'jodtest joddev jod utils' [ 3 od ''
er df=: make ''
er od tdict100x [ 3 od ''
1 [ (0!:0) {:df
er packd tdict100x

NB. show dictionary stats
er showpass did ~ 0

NB. close (tdict100x) dictionary and clean up
er 3 od ''

NB. TEST SUCCESSFUL

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
