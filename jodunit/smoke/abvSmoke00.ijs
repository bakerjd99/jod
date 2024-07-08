NB.*abvSmoke00 t-- (abv) argument smoke tests.
NB.
NB. assumes:
NB.
NB.   0) JOD dev dictionaries open
NB. 
NB.   1) (testjod00) dictionary 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.
NB.   2) (jodtester) is a load script
NB.  
NB. author:  John D. Baker
NB. created: 2020nov26
NB. changes: -----------------------------------------------------
NB. 24jun29 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. make jodtester from JOD distribution dictionaries
NB.
NB.   od ;:'joddev jod utils' [ 3 od ''
NB.   mls 'jodtester'
load 'jodtester'

cocurrent jodtestlocale 'AAAabvSmoke00'

NB. save smoke load test scripts
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

testenvironment 'good';'JOD' NB. ;1  NB. yammer on 

beforestr=: ] {.~ 1&(i.~)@([ E. ])

tdict=: 'testjod00'

NB. -{TEST START}-

NB. quote=:''''&,@(,&'''')@(#~ >:@(=&''''))
NB.
NB. NB. generate all possible valid (abv) argument patterns
NB.
NB. jnc=: OBJECTNC_ajod_
NB.
NB. NB. valid left (x) arguments - including elided (x)
NB. larg=: (<i.0) , (<"0 jnc) 
NB.
NB. NB. valid right (y) argument patterns - plain J name prefix and empty ''
NB. rarg=: 'name'  ; '''''' 
NB.
NB. NB. valid (abv) argument patterns
NB. jarg=: <"1 ;"1 ":&.> 1 0 2 {"1  > (<' abv ') , L: 1 , { (<larg) , <(quote&.> }:rarg) , {:rarg

NB.  abv 'name' 
NB.  abv ''     
NB. 0 abv 'name'
NB. 0 abv ''    
NB. 1 abv 'name'
NB. 1 abv ''    
NB. 2 abv 'name'
NB. 2 abv ''    
NB. 3 abv 'name'
NB. 3 abv ''    
NB. 4 abv 'name'
NB. 4 abv ''    

>0{od tdict [ 3 od ''

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. erase any backups 
DL=: {:{. DPATH__ST__JODobj
1 ,, (1!:55) 1 dir BAK__DL,'*.ijf'

NB. try searching when there are no backups - expected error
ner abv ''          NB. nothing
ner abv 'tosee'
ner abv 'here'

ner 2 abv ''      NB. still nada
ner 4 abv 'you'   NB. persisting 
ner 1 abv 'giveup'

NB. create three backups

NB. first object collection - empty
>0{packd tdict

NB. second object collection
1 [ ((0!:100) :: _1:) loadSmoketest0
>0{packd tdict
 
NB. third object collection
1 [ ((0!:100) :: _1:) loadSmoketest1
>0{packd tdict

NB. various invalid arguments
ner 5 abv ''
ner abv 42
ner 7j5 abv ''
ner 'just wrong' abv 'ok'

NB. valid patterns with current backups

NB. abv ''   NB. identity when nothing added after last backup
0 = # (}. dnl '') -. '.'&beforestr&.> abv''

NB. abv 'name'
0 {"1 (,:'BOOLATOM') E. > }. abv 'BOOLATOM'

NB. 0 abv 'name'
0 {"1 (,:'int') E. > }. 0 abv 'int'

NB. 1 abv ''
0 = # (}. 1 dnl '') -. '.'&beforestr&.> 1 abv ''

NB. 1 abv 'name'
0 {"1 (,:'smoke') E. > }. 1 abv 'smoke'

NB. 2 abv ''
0 = # (}. 2 dnl '') -. '.'&beforestr&.> 2 abv ''

NB. 2 abv 'name'
0 {"1 (,:'intsmoke') E. > }. 2 abv 'intsmoke'

NB. 3 abv ''
0 = # (}. 3 dnl '') -. '.'&beforestr&.> 3 abv ''

NB. 3 abv 'name'
0 {"1 (,:'suite') E. > }. 3 abv 'suite'

NB. 4 abv ''
0 = # (}. 4 dnl '') -. '.'&beforestr&.> 4 abv ''

NB. 4 abv 'name'
0 {"1 (,:'smoke') E. > }. 4 abv 'smoke'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
