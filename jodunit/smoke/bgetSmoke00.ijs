NB.*bgetSmoke00 t-- (bget) argument smoke tests.
NB.
NB. assumes:
NB. 
NB.   1) (testjod00) dictionary 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.
NB.   2) (jodtester) is a load script
NB.  
NB. author:  John D. Baker
NB. created: 2019dec04
NB. changes: -----------------------------------------------------
NB. 24jul07 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. make jodtester from JOD distribution dictionaries
NB.
NB.   od ;:'joddev jod utils' [ 3 od ''
NB.   mls 'jodtester'
load 'jodtester'

cocurrent jodtestlocale 'AAAbgetSmoke00'

NB. save smoke load test scripts
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

testenvironment 'good';'JOD' NB. ;1  NB. yammer on 

tdict=: 'testjod00'

NB. -{TEST START}-

NB. quote=:''''&,@(,&'''')@(#~ >:@(=&''''))
NB.
NB. NB. generate all possible valid (bget) argument patterns
NB.
NB. jnc=: OBJECTNC_ajod_,DICTIONARY_ajod_  
NB.
NB. NB. valid left (x) arguments - including elided (x)
NB. larg=: (<i.0) , (<"0 jnc) , (,{(OBJECTNC_ajod_);8 9) 
NB.
NB. NB. valid right (y) argument patterns
NB. NB.     name   ;  name.count  ;  list of backup names
NB. rarg=: 'name'  ; 'name.count' ;  'blclBNames'
NB.
NB. NB. valid (bget) argument patterns
NB. jarg=: <"1 ;"1 ":&.> 1 0 2 {"1  > (<' bget ') , L: 1 , { (<larg) , <(quote&.> }:rarg) , {:rarg
NB.
NB. NB. when (x) is 5 = DICTIONARY any name part of name.count patterns are ignored
NB. jarg=: jarg , '5 bget ''''' ; '5 bget ''.count''' ; '5 bget blclCounts'
NB.
NB. NB. groups and suites have an additional case to fetch backup name lists
NB. jarg=: jarg , '2 1 bget ''name''' ; '2 1 bget ''name.count''' ; '2 1 bget blclBNames'
NB. jarg=: jarg , '3 1 bget ''name''' ; '3 1 bget ''name.count''' ; '3 1 bget blclBNames'

>0{od tdict [ 3 od ''

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. erase any backups 
DL=: {:{. DPATH__ST__JODobj
1 ,, (1!:55) 1 dir BAK__DL,'*.ijf'

NB. try searching when there are no backups - expected error
ner bget 'nothing'
ner bget ;:'to see'
ner bget 'here'

NB. create three backups

NB. first object collection - empty
>0{packd tdict

NB. second object collection
1 [ ((0!:100) :: _1:) loadSmoketest0
>0{packd tdict
 
NB. third object collection
1 [ ((0!:100) :: _1:) loadSmoketest1
>0{packd tdict

NB. NB. some basic invalid arguments - expected error
ner 0 8 0 bget 'xarg_wrong'  NB. lists of at most 2 
ner bget '.a'
ner 4 bget '.-1'
ner 2 bget '..'
ner bget 0
ner bget <''

NB. NB. J names with embedded locales are not in JOD dictionaries
ner bget 'is__wrong'
ner bget 'is__even__wronger'
ner bget 'still_wrong_'
ner bget 'a&'      NB. not a J name

NB. NB. appends current first backup number 
LASTBNUM=: ;1 { bnl '.' 
ner bget 'my_bad_',LASTBNUM
ner bget 'my__bad',LASTBNUM
ner bget 'just&^^awful',LASTBNUM

NB. insure various objects are in last backup
>0{od tdict [ 3 od ''
JustPeachey=: i. 3
HunkeyDory=: 'I do what I do because I am what I am'
GodTwilight=: &.>
MyTacitVerb=: +/
MyExplicitVerb=: 3 : 0
x + y
)
er tmploc put ;:'JustPeachey HunkeyDory GodTwilight MyTacitVerb MyExplicitVerb' 

NB. some short word explanations
er 0 8 put 'JustPeachey';'are things really just peachy'
er 0 8 put 'MyExplicitVerb';'explicit verbs get no respect from j gurus'

NB. some long word explanations
AllWorkNoPlay=: 0 : 0
  all work and no play makes jack a dull boy
  all work and no play makes jack a dull boy
  all work and no play makes jack a dull boy
  all work and no play makes jack a dull boy
  of course jack was a dull boy anyway so back to work jack
)

er 0 9 put 'GodTwilight';AllWorkNoPlay
er 0 9 put 'MyTacitVerb';AllWorkNoPlay

TestText0=: 'test text made unique to this test: ',":didnum_ajod_''
TestText1=: 'more test text made unique to this test: ',":didnum_ajod_''
TestText2=: 'even more test text made unique to this test: ',":didnum_ajod_''
er 1 put 'TestText0';TestText0
er 1 put 'TestText1';TestText1
er 1 put 'TestText2';TestText2

NB. some short and long test explanations
er 1 8 put 'TestText2';'open tests are more revealing than open code'
er 1 9 put 'TestText0';AllWorkNoPlay

MacroText0=: 'macro text made unique to this test: ',":didnum_ajod_''
MacroText1=: 'more macro text made unique to this test: ',":didnum_ajod_''
er 4 put 'MacroText0';TEXT_ajod_;MacroText0
er 4 put 'MacroText1';TEXT_ajod_;MacroText1

NB. some short and long test explanations
er 4 8 put 'MacroText0';'mini macro explanation'
er 4 9 put 'MacroText0';AllWorkNoPlay

NB. some groups and suites
er grp MyStuffGroup=: ;:'MyStuffGroup MyTacitVerb MyExplicitVerb'
er grp JustGroup=: ;:'JustGroup JustPeachey HunkeyDory GodTwilight'
er 3 grp TestSmokeSuite=: ;:'TestSmokeSuite TestText0 TestText2'

NB. insert dictionary document - insure test dictionary document is writeableT
tdict -: ;1{did 0 
er dpset 'DOCUMENTDICT';1
er 5 put DicDocText=: 'dictionary document text made unique to this test: ',":didnum_ajod_''

NB. generates last backup
>0{packd tdict 
LASTBNUM=: ;1 { bnl '.' 

NB. basic valid arguments
er bget 'JustPeachey'       
er bget 'JustPeachey',LASTBNUM
er bget ;:'JustPeachey HunkeyDory GodTwilight' 
er bget (;:'JustPeachey GodTwilight') ,&.> <LASTBNUM    
er 0 bget 'JustPeachey'       
er 0 bget 'JustPeachey',LASTBNUM  
er 0 bget (;:'HunkeyDory GodTwilight') ,&.> <LASTBNUM
er 1 bget 'TestText0'        
er 1 bget 'TestText1',LASTBNUM  
er 1 bget ;:'TestText0 TestText2'   
er 2 bget 'JustGroup'        
er 2 bget 'JustGroup',LASTBNUM
er 2 bget ;:'JustGroup MyStuffGroup'
  
NB. 3 bget 'name'        
NB. 3 bget 'name.count'  
NB. 3 bget blclBNames  
  
er 4 bget 'MacroText0'      
er 4 bget 'MacroText0',LASTBNUM
er 4 bget ;:'MacroText0 MacroText0'  
  
NB. some don't care cases 
er 5 bget 'ValidNamesAccepted'     NB. put dictionary document returned   
er 5 bget 'IamSoIgnored',LASTBNUM  NB. if backup number is present it must be ok  
er 5 bget ;:'valid names ignored'  NB. put dictionary document returned 

NB. out of range backup numbers error out
ner 5 bget (;:'invalid backup number') ,&.> <'.',":10 + ".}.LASTBNUM  
  
er 0 8 bget 'MyExplicitVerb'     
er 0 8 bget 'MyExplicitVerb',LASTBNUM
er 0 8 bget ;:'MyExplicitVerb GodTwilight'
er 0 9 bget 'GodTwilight'   
er 0 9 bget 'GodTwilight',LASTBNUM

NB. 0 9 bget blclBNames  
NB. 1 8 bget 'name'      
NB. 1 8 bget 'name.count'
NB. 1 8 bget blclBNames  
NB. 1 9 bget 'name'      
NB. 1 9 bget 'name.count'
NB. 1 9 bget blclBNames  
NB. 2 8 bget 'name'      
NB. 2 8 bget 'name.count'
NB. 2 8 bget blclBNames  
NB. 2 9 bget 'name'      
NB. 2 9 bget 'name.count'
NB. 2 9 bget blclBNames  
NB. 3 8 bget 'name'      
NB. 3 8 bget 'name.count'
NB. 3 8 bget blclBNames  
NB. 3 9 bget 'name'      
NB. 3 9 bget 'name.count'
NB. 3 9 bget blclBNames  
NB. 4 8 bget 'name'      
NB. 4 8 bget 'name.count'
NB. 4 8 bget blclBNames  
NB. 4 9 bget 'name'      
NB. 4 9 bget 'name.count'
NB. 4 9 bget blclBNames  

er DicDocBack=: 5 bget ''

NB. document texts must match
(; {:, > }. DicDocBack) -: DicDocText
          
er 5 bget LASTBNUM      
er 5 bget }. bnl '.'  NB. documents from all backups
  
er GroupDat=: 2 1 bget 'MyStuffGroup'  

NB. group lists must match - order is irrelevant
(/:~ ;{:, > }. GroupDat) -: /:~ }.MyStuffGroup
    
er 2 1 bget 'MyStuffGroup',LASTBNUM

NB. 2 1 bget blclBNames  
NB. 3 1 bget 'name'      
NB. 3 1 bget 'name.count'
NB. 3 1 bget blclBNames  


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_