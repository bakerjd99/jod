NB.*bnlSmoke00 t-- (bnl) argument smoke tests.
NB.
NB. assumes:
NB. 
NB.   1) (testjod00) dictionary 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.  
NB. author:  John D. Baker
NB. created: 2015jul31
NB. changes: -----------------------------------------------------
NB. 18oct12 adjusted for 18!:4 change
NB. 19dec03 test for invalid J names and embedded locales added

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

NB. save smoke load test scripts
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

testenvironment 'good';'JOD'

tdict=: 'testjod00'

NB. -{TEST START}-

NB. quote=:''''&,@(,&'''')@(#~ >:@(=&''''))

NB. generate all possible valid (bnl) argument patterns

NB. schq=: >:i. 3  NB. search qualifiers
NB. jnc=:    i. 4  NB. J word name class

NB. valid left (x) arguments
NB.    Elided   DictionaryCodes        DictionaryCodesSearch       WordSearchJNameClass          MacroSearchMacrotype
NB. larg=: (<i.0) , (<"0 OBJECTNC_ajod_) , (,{(OBJECTNC_ajod_);schq) , (,{(,WORD_ajod_);schq;i. 4) , (,{(,MACRO_ajod_);schq;MACROTYPE_ajod_)

NB. valid right (y) argument patterns
NB.    empty  backupcnt   allinbackup  matchrecent   matchinbackup
NB. rarg=: ''  ;  '.'       ; '.count' ;   'name'      ; 'name.count'

NB. formats all valid (bnl) argument patterns
NB. 'NB. ' ,"1  ;"1 ":&.> 1 0 2 {"1  > (<' bnl ') , L: 1 , { (<larg) , <quote&.> rarg

>0{od tdict [ 3 od ''

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. erase any backups 
DL=: {:{. DPATH__ST__JODobj
1 ,, (1!:55) 1 dir BAK__DL,'*.ijf'

NB. try searching when there are no backups - expected error
ner bnl ''
ner bnl '.'
ner bnl '.3'

NB. create three backups

NB. first object collection - empty
>0{packd tdict

NB. second object collection
1 [ ((0!:100) :: _1:) loadSmoketest0
>0{packd tdict
 
NB. third object collection
1 [ ((0!:100) :: _1:) loadSmoketest1
>0{packd tdict

NB. some basic invalid arguments - expected error
ner bnl '.a'
ner 4 bnl '.-1'
ner 2 bnl '..'
ner bnl 0
ner bnl <''

NB. J names with embedded locales are not in JOD dictionaries
ner bnl 'is__wrong'
ner bnl 'is__even__wronger'
ner bnl 'still_wrong_'
ner bnl 'a&'      NB. not a J name

NB. appends current first backup number 
LASTBNUM=: '.', ;1 { bnl '.' 
ner bnl 'my_bad_',LASTBNUM
ner bnl 'my__bad',LASTBNUM
ner bnl 'just&^^awful',LASTBNUM

NB. some basic identities 
(bnl '') -: bnl ;1{bnl '.' 
(0 bnl '') -: 0 bnl ;1{0 bnl '.' 
(1 bnl '') -: 1 bnl ;1{1 bnl '.' 
(2 bnl '') -: 2 bnl ;1{2 bnl '.' 
(3 bnl '') -: 3 bnl ;1{3 bnl '.' 
(4 bnl '') -: 4 bnl ;1{4 bnl '.' 

NB.  bnl '.'
>0{bnl '.' 
4 = #bnl'.'

badnum=: '.' , ": 13 + ". (;1{bnl '.') -. '.'

NB. fetch from  nonexistent backup - error expected
ner bnl badnum
ner 0 bnl badnum
ner 1 bnl badnum
ner 2 bnl badnum
ner 3 bnl badnum
ner 4 bnl badnum

NB. Many of remaining tests critically depend on the loaded objects.
NB. If the load smoke test scripts are changed a lot of these tests
NB. must be revised. 

NB.  bnl ''
(dnl '') -: bnl ''

NB.  bnl '.count'
(bnl '') -: bnl ;1{bnl '.'

NB.  bnl 'name'
(1; ;:'BOOLATOM0 BOOLATOM1 BOOLLIST BOOLTABLE') -: bnl 'BOOL'

NB.  bnl 'name.count'
(1;'INTATOM0';'INTTABLE') -: bnl 'INT',;2{bnl'.'

NB. 0 bnl ''
(0 dnl '') -:  0 bnl ''

NB. 0 bnl '.'
(bnl '.') -: 0 bnl '.'

NB. 0 bnl '.count'
(0 dnl '') -: 0 bnl ;1{bnl '.'

NB. 0 bnl 'name'
(1; ;:'BOOLATOM0 BOOLATOM1 BOOLLIST BOOLTABLE') -: 0 bnl 'BOOL'

NB. 0 bnl 'name.count'
(1;'INTATOM0';'INTTABLE') -: 0 bnl 'INT',;2{bnl'.'

NB. 1 bnl ''
(1;'smoke0Test0';'smoke1Test0';'smoke1Test1') -: 1 bnl ''

NB. 1 bnl '.'
(bnl '.') -: 1 bnl '.'

NB. 1 bnl '.count'
(1;'smoke0Test0') -: 1 bnl ;2{bnl'.'

NB. 1 bnl 'name'
(1;'smoke1Test0';'smoke1Test1') -: 1 bnl 'smoke1'

NB. 1 bnl 'name.count'
(1;'smoke0Test0') -: 1 bnl 'smoke0',;2{bnl'.'

NB. 2 bnl ''
(1;'boolsmoke0';'boolsmoke1';'intsmoke0';'intsmoke1') -: 2 bnl ''

NB. 2 bnl '.'
(bnl '.') -: 2 bnl '.'

NB. 2 bnl '.count'
((<1),<0$a:) -: 2 bnl ;3{bnl'.'

NB. 2 bnl 'name'
(1;'intsmoke1') -: 2 bnl 'intsmoke1'

NB. 2 bnl 'name.count'
(1;'boolsmoke0') -: 2 bnl 'bool',;2{bnl '.'

NB. 3 bnl ''
(1;'suitesmoke1') -: 3 bnl''

NB. 3 bnl '.'
(bnl '.') -: 3 bnl '.'

NB. 3 bnl '.count'
(1;'suitesmoke1') -: 3 bnl ;1{bnl'.'

NB. 3 bnl 'name'
(1;'suitesmoke1') -: 3 bnl 'su'

NB. 3 bnl 'name.count'
((<1),<0$a:) -: 3 bnl 'su',;2{bnl'.'

NB. 4 bnl ''
(1;'smoke0Macro0';'smoke0Macro1';'smoke1Macro0';'smoke1Macro1') -: 4 bnl ''

NB. 4 bnl '.'
(bnl '.') -: 4 bnl '.'

NB. 4 bnl '.count'
NB. 4 bnl 'name'
NB. 4 bnl 'name.count'
NB. 0 1 bnl ''

NB. 0 1 bnl '.'
(bnl '.') -: 0 1 bnl '.'

NB. 0 1 bnl '.count'
NB. 0 1 bnl 'name'
NB. 0 1 bnl 'name.count'
NB. 0 2 bnl ''

NB. 0 2 bnl '.'
(bnl '.') -: 0 2 bnl '.'

NB. 0 2 bnl '.count'
NB. 0 2 bnl 'name'
NB. 0 2 bnl 'name.count'
NB. 0 3 bnl ''

NB. 0 3 bnl '.'
(bnl '.') -: 0 3 bnl '.'

NB. 0 3 bnl '.count'
NB. 0 3 bnl 'name'
NB. 0 3 bnl 'name.count'
NB. 1 1 bnl ''

NB. 1 1 bnl '.'
(bnl '.') -: 1 1 bnl '.'

NB. 1 1 bnl '.count'
NB. 1 1 bnl 'name'
NB. 1 1 bnl 'name.count'
NB. 1 2 bnl ''

NB. 1 2 bnl '.'
(bnl '.') -: 1 2 bnl '.'

NB. 1 2 bnl '.count'
NB. 1 2 bnl 'name'
NB. 1 2 bnl 'name.count'
NB. 1 3 bnl ''

NB. 1 3 bnl '.'
(bnl '.') -: 1 3 bnl '.'

NB. 1 3 bnl '.count'
NB. 1 3 bnl 'name'
NB. 1 3 bnl 'name.count'
NB. 2 1 bnl ''

NB. 2 1 bnl '.'
(bnl '.') -: 2 1 bnl '.'

NB. 2 1 bnl '.count'
NB. 2 1 bnl 'name'
NB. 2 1 bnl 'name.count'
NB. 2 2 bnl ''

NB. 2 2 bnl '.'
(bnl '.') -: 2 2 bnl '.'

NB. 2 2 bnl '.count'
NB. 2 2 bnl 'name'
NB. 2 2 bnl 'name.count'
NB. 2 3 bnl ''

NB. 2 3 bnl '.'
(bnl '.') -: 2 3 bnl '.'

NB. 2 3 bnl '.count'
NB. 2 3 bnl 'name'
NB. 2 3 bnl 'name.count'
NB. 3 1 bnl ''

NB. 3 1 bnl '.'
(bnl '.') -: 3 1 bnl '.'

NB. 3 1 bnl '.count'
NB. 3 1 bnl 'name'
NB. 3 1 bnl 'name.count'
NB. 3 2 bnl ''

NB. 3 2 bnl '.'
(bnl '.') -: 3 2 bnl '.'

NB. 3 2 bnl '.count'
NB. 3 2 bnl 'name'
NB. 3 2 bnl 'name.count'
NB. 3 3 bnl ''

NB. 3 3 bnl '.'
(bnl '.') -: 3 3 bnl '.'

NB. 3 3 bnl '.count'
NB. 3 3 bnl 'name'
NB. 3 3 bnl 'name.count'
NB. 4 1 bnl ''

NB. 4 1 bnl '.'
(bnl '.') -: 4 1 bnl '.'

NB. 4 1 bnl '.count'
NB. 4 1 bnl 'name'
NB. 4 1 bnl 'name.count'
NB. 4 2 bnl ''

NB. 4 2 bnl '.'
(bnl '.') -: 4 2 bnl '.'

NB. 4 2 bnl '.count'
NB. 4 2 bnl 'name'
NB. 4 2 bnl 'name.count'
NB. 4 3 bnl ''

NB. 4 3 bnl '.'
(bnl '.') -: 4 3 bnl '.'

NB. 4 3 bnl '.count'
NB. 4 3 bnl 'name'
NB. 4 3 bnl 'name.count'
NB. 0 1 0 bnl ''

NB. 0 1 0 bnl '.'
(bnl '.') -: 0 1 0 bnl '.'

NB. 0 1 0 bnl '.count'
NB. 0 1 0 bnl 'name'
NB. 0 1 0 bnl 'name.count'
NB. 0 1 1 bnl ''

NB. 0 1 1 bnl '.'
(bnl '.') -: 0 1 1 bnl '.'

NB. 0 1 1 bnl '.count'
NB. 0 1 1 bnl 'name'
NB. 0 1 1 bnl 'name.count'
NB. 0 1 2 bnl ''

NB. 0 1 2 bnl '.'
(bnl '.') -: 0 1 2 bnl '.'

NB. 0 1 2 bnl '.count'
NB. 0 1 2 bnl 'name'
NB. 0 1 2 bnl 'name.count'
NB. 0 1 3 bnl ''

NB. 0 1 3 bnl '.'
(bnl '.') -: 0 1 3 bnl '.'

NB. 0 1 3 bnl '.count'
NB. 0 1 3 bnl 'name'
NB. 0 1 3 bnl 'name.count'
NB. 0 2 0 bnl ''

NB. 0 2 0 bnl '.'
(bnl '.') -: 0 2 0 bnl '.'

NB. 0 2 0 bnl '.count'
NB. 0 2 0 bnl 'name'
NB. 0 2 0 bnl 'name.count'
NB. 0 2 1 bnl ''

NB. 0 2 1 bnl '.'
(bnl '.') -: 0 2 1 bnl '.'

NB. 0 2 1 bnl '.count'
NB. 0 2 1 bnl 'name'
NB. 0 2 1 bnl 'name.count'
NB. 0 2 2 bnl ''

NB. 0 2 2 bnl '.'
(bnl '.') -: 0 2 2 bnl '.'

NB. 0 2 2 bnl '.count'
NB. 0 2 2 bnl 'name'
NB. 0 2 2 bnl 'name.count'
NB. 0 2 3 bnl ''

NB. 0 2 3 bnl '.'
(bnl '.') -: 0 2 3 bnl '.'

NB. 0 2 3 bnl '.count'
NB. 0 2 3 bnl 'name'
NB. 0 2 3 bnl 'name.count'
NB. 0 3 0 bnl ''

NB. 0 3 0 bnl '.'
(bnl '.') -: 0 3 0 bnl '.'

NB. 0 3 0 bnl '.count'
NB. 0 3 0 bnl 'name'
NB. 0 3 0 bnl 'name.count'
NB. 0 3 1 bnl ''

NB. 0 3 1 bnl '.'
(bnl '.') -: 0 3 1 bnl '.'

NB. 0 3 1 bnl '.count'
NB. 0 3 1 bnl 'name'
NB. 0 3 1 bnl 'name.count'
NB. 0 3 2 bnl ''

NB. 0 3 2 bnl '.'
(bnl '.') -: 0 3 2 bnl '.'

NB. 0 3 2 bnl '.count'
NB. 0 3 2 bnl 'name'
NB. 0 3 2 bnl 'name.count'
NB. 0 3 3 bnl ''

NB. 0 3 3 bnl '.'
(bnl '.') -: 0 3 3 bnl '.'

NB. 0 3 3 bnl '.count'
NB. 0 3 3 bnl 'name'
NB. 0 3 3 bnl 'name.count'
NB. 4 1 21 bnl ''

NB. 4 1 21 bnl '.'
(bnl '.') -: 4 1 21 bnl '.'

NB. 4 1 21 bnl '.count'
NB. 4 1 21 bnl 'name'
NB. 4 1 21 bnl 'name.count'
NB. 4 1 22 bnl ''

NB. 4 1 22 bnl '.'
(bnl '.') -: 4 1 22 bnl '.'

NB. 4 1 22 bnl '.count'
NB. 4 1 22 bnl 'name'
NB. 4 1 22 bnl 'name.count'
NB. 4 1 23 bnl ''

NB. 4 1 23 bnl '.'
(bnl '.') -: 4 1 23 bnl '.'

NB. 4 1 23 bnl '.count'
NB. 4 1 23 bnl 'name'
NB. 4 1 23 bnl 'name.count'
NB. 4 1 24 bnl ''

NB. 4 1 24 bnl '.'
(bnl '.') -: 4 1 24 bnl '.'

NB. 4 1 24 bnl '.count'
NB. 4 1 24 bnl 'name'
NB. 4 1 24 bnl 'name.count'
NB. 4 1 25 bnl ''

NB. 4 1 25 bnl '.'
(bnl '.') -: 4 1 25 bnl '.'

NB. 4 1 25 bnl '.count'
NB. 4 1 25 bnl 'name'
NB. 4 1 25 bnl 'name.count'
NB. 4 1 26 bnl ''

NB. 4 1 26 bnl '.'
(bnl '.') -: 4 1 26 bnl '.'

NB. 4 1 26 bnl '.count'
NB. 4 1 26 bnl 'name'
NB. 4 1 26 bnl 'name.count'
NB. 4 1 27 bnl ''

NB. 4 1 27 bnl '.'
(bnl '.') -: 4 1 27 bnl '.'

NB. 4 1 27 bnl '.count'
NB. 4 1 27 bnl 'name'
NB. 4 1 27 bnl 'name.count'
NB. 4 1 28 bnl ''

NB. 4 1 28 bnl '.'
(bnl '.') -: 4 1 28 bnl '.'

NB. 4 1 28 bnl '.count'
NB. 4 1 28 bnl 'name'
NB. 4 1 28 bnl 'name.count'
NB. 4 2 21 bnl ''

NB. 4 2 21 bnl '.'
(bnl '.') -: 4 2 21 bnl '.'

NB. 4 2 21 bnl '.count'
NB. 4 2 21 bnl 'name'
NB. 4 2 21 bnl 'name.count'
NB. 4 2 22 bnl ''

NB. 4 2 22 bnl '.'
(bnl '.') -: 4 2 22 bnl '.'

NB. 4 2 22 bnl '.count'
NB. 4 2 22 bnl 'name'
NB. 4 2 22 bnl 'name.count'
NB. 4 2 23 bnl ''

NB. 4 2 23 bnl '.'
(bnl '.') -: 4 2 23 bnl '.'

NB. 4 2 23 bnl '.count'
NB. 4 2 23 bnl 'name'
NB. 4 2 23 bnl 'name.count'
NB. 4 2 24 bnl ''

NB. 4 2 24 bnl '.'
(bnl '.') -: 4 2 24 bnl '.'

NB. 4 2 24 bnl '.count'
NB. 4 2 24 bnl 'name'
NB. 4 2 24 bnl 'name.count'
NB. 4 2 25 bnl ''

NB. 4 2 25 bnl '.'
(bnl '.') -: 4 2 25 bnl '.'

NB. 4 2 25 bnl '.count'
NB. 4 2 25 bnl 'name'
NB. 4 2 25 bnl 'name.count'
NB. 4 2 26 bnl ''

NB. 4 2 26 bnl '.'
(bnl '.') -: 4 2 26 bnl '.'

NB. 4 2 26 bnl '.count'
NB. 4 2 26 bnl 'name'
NB. 4 2 26 bnl 'name.count'
NB. 4 2 27 bnl ''

NB. 4 2 27 bnl '.'
(bnl '.') -: 4 2 27 bnl '.'

NB. 4 2 27 bnl '.count'
NB. 4 2 27 bnl 'name'
NB. 4 2 27 bnl 'name.count'
NB. 4 2 28 bnl ''

NB. 4 2 28 bnl '.'
(bnl '.') -: 4 2 28 bnl '.'

NB. 4 2 28 bnl '.count'
NB. 4 2 28 bnl 'name'
NB. 4 2 28 bnl 'name.count'
NB. 4 3 21 bnl ''

NB. 4 3 21 bnl '.'
(bnl '.') -: 4 3 21 bnl '.'

NB. 4 3 21 bnl '.count'
NB. 4 3 21 bnl 'name'
NB. 4 3 21 bnl 'name.count'
NB. 4 3 22 bnl ''

NB. 4 3 22 bnl '.'
(bnl '.') -: 4 3 22 bnl '.'

NB. 4 3 22 bnl '.count'
NB. 4 3 22 bnl 'name'
NB. 4 3 22 bnl 'name.count'
NB. 4 3 23 bnl ''

NB. 4 3 23 bnl '.'
(bnl '.') -: 4 3 23 bnl '.'

NB. 4 3 23 bnl '.count'
NB. 4 3 23 bnl 'name'
NB. 4 3 23 bnl 'name.count'
NB. 4 3 24 bnl ''

NB. 4 3 24 bnl '.'
(bnl '.') -: 4 3 24 bnl '.'

NB. 4 3 24 bnl '.count'
NB. 4 3 24 bnl 'name'
NB. 4 3 24 bnl 'name.count'
NB. 4 3 25 bnl ''

NB. 4 3 25 bnl '.'
(bnl '.') -: 4 3 25 bnl '.'

NB. 4 3 25 bnl '.count'
NB. 4 3 25 bnl 'name'
NB. 4 3 25 bnl 'name.count'
NB. 4 3 26 bnl ''

NB. 4 3 26 bnl '.'
(bnl '.') -: 4 3 26 bnl '.'

NB. 4 3 26 bnl '.count'
NB. 4 3 26 bnl 'name'
NB. 4 3 26 bnl 'name.count'
NB. 4 3 27 bnl ''

NB. 4 3 27 bnl '.'
(bnl '.') -: 4 3 27 bnl '.'

NB. 4 3 27 bnl '.count'
NB. 4 3 27 bnl 'name'
NB. 4 3 27 bnl 'name.count'
NB. 4 3 28 bnl ''

NB. 4 3 28 bnl '.'
(bnl '.') -: 4 3 28 bnl '.'

NB. 4 3 28 bnl '.count'
NB. 4 3 28 bnl 'name'
NB. 4 3 28 bnl 'name.count'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_