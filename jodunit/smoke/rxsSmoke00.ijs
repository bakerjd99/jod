NB.*rxsSmoke00 t-- (rxs) argument smoke tests.
NB.
NB. assumes:
NB. 
NB.   1) (testjod00) dictionary 
NB.      regd 'testjod00';jpath '~JODTEST/testjod00'
NB.
NB.   2) (testjod00) contans appropriate match patterns 
NB.      for tests. NIMP: insure build of test dictionary
NB.      inserts such patterns,
NB.  
NB. author:  John D. Baker
NB. created: 2018nov09
NB. changes: -----------------------------------------------------
NB. 19jan07 add short/long document text tests
NB. 19feb12 add empty pattern - empty dictionary tests

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

NB. save smoke load test scripts
NB. rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
NB. ({."1 loadSmoke)=: {:"1 loadSmoke
NB. (4!:55) ;:'rc loadSmoke'


testenvironment 'good';'JOD'

NB. following code fragment generates all (rxs) valid nonempty code patterns
NB.   t=.  > (, { (i. 5) ; 7 8 9 ; 1 2 3) , , {5;7;1 2 3
NB.   (<"0 ~. 0 {"1 t) , (<"1 ~. 0 1 {"1 t) , <"1 t


tdict=: 'testjod00'
tpfx=: 'testjod'

NB. Note: the ~JODTEST root must be set - use J configure
JODTESTROOT=: jpath '~JODTEST'
1 [ makedir_ajod_ <JODTESTROOT
JODTESTROOT=: tslash2_ajod_ JODTESTROOT

NB. create empty new dictionary - didnum insures it doesn't exist
dn=:tpfx,":didnum_ajod_ ''
er newd dn;JODTESTROOT,dn
er od dn

NB. search patterns
pat00=: 'ab[0-9aeiou]c'
pat01=: '[[:digit:]]+'
pat02=: '[[:digit:]]+'


NB. empty patterns with empty dictionaries
er od dn [ 3 od ''

NB. only empty dictionary case that returns text
er ('';5) rxs ''

NB. name lists must be nonempty
ner rxs }. dnl ''
ner ('';0) rxs }. dnl ''
ner ('';1) rxs }. 1 dnl ''
ner ('';2) rxs }. 2 dnl ''
ner ('';3) rxs }. 3 dnl ''
ner ('';4) rxs }. 4 dnl ''

NB. insert objects so name lists are not empty

NB. save all J z locale objects in empty test dictionary
er 'z' put nl_z_ i. 4  

er rxs }. dnl ''
er ('';0) rxs }. dnl ''
er ('';0 7 3) rxs }. dnl 's' NB. many words in (z) start with 's'

TESTSOFF=: (0 : 0)

er od tdict [ 3 od ''

NB. Option 1: search for and return first match in texts

NB. basic search of nonbinary word text
NB. (rxs) only search texts - ignore binary data
NB. default is first match 
er pat00 rxs }. dnl '' 

NB. same as previous
er (pat00;0) rxs }. dnl '' 
er (pat00;0 7) rxs }. dnl '' 
er (pat00;0 7 1) rxs }. dnl '' 

NB. search of word short and long document texts
er (pat00;0 8) rxs }. dnl ''    NB. first match short text
er (pat00;0 8 1) rxs }. dnl ''  NB. first match short text
er (pat00;0 8 2) rxs }. dnl ''  NB. all matches short text
er (pat00;0 8 3) rxs }. dnl ''  NB. all match array and short text
er (pat00;0 9) rxs }. dnl ''    NB. first match long text
er (pat00;0 9 1) rxs }. dnl ''  NB. first match long text
er (pat00;0 9 2) rxs }. dnl ''  NB. all matches long text
er (pat00;0 9 3) rxs }. dnl ''  NB. all match array and long text

NB. search test text
er (pat00;1) rxs }. 1 dnl ''

NB. same as previous
er (pat00;1 7) rxs }. 1 dnl ''
er (pat00;1 7 1) rxs }. 1 dnl ''

NB. search of test short and long document texts
er (pat00;1 8) rxs }. dnl ''    NB. first match short text
er (pat00;1 8 1) rxs }. dnl ''  NB. first match short text
er (pat00;1 8 2) rxs }. dnl ''  NB. all matches short text
er (pat00;1 8 3) rxs }. dnl ''  NB. all match array and short text
er (pat00;1 9) rxs }. dnl ''    NB. first match long text
er (pat00;1 9 1) rxs }. dnl ''  NB. first match long text
er (pat00;1 9 2) rxs }. dnl ''  NB. all matches long text
er (pat00;1 9 3) rxs }. dnl ''  NB. all match array and long text

NB. search group header texts for first match
er (pat00;2) rxs }. 2 dnl ''

NB. same as previous
er (pat00;2 7) rxs }. 2 dnl ''
er (pat00;2 7 1) rxs }. 2 dnl ''

NB. search of group short and long document texts
er (pat00;2 8) rxs }. dnl ''    NB. first match short text
er (pat00;2 8 1) rxs }. dnl ''  NB. first match short text
er (pat00;2 8 2) rxs }. dnl ''  NB. all matches short text
er (pat00;2 8 3) rxs }. dnl ''  NB. all match array and short text
er (pat00;2 9) rxs }. dnl ''    NB. first match long text
er (pat00;2 9 1) rxs }. dnl ''  NB. first match long text
er (pat00;2 9 2) rxs }. dnl ''  NB. all matches long text
er (pat00;2 9 3) rxs }. dnl ''  NB. all match array and long text

NB. search suite header texts for first match
er (pat00;3) rxs }. 3 dnl '' 

NB. same as previous
er (pat00;3 7) rxs }. 3 dnl '' 
er (pat00;3 7 1) rxs }. 3 dnl '' 

NB. search of suite short and long document texts
er (pat00;3 8) rxs }. dnl ''    NB. first match short text
er (pat00;3 8 1) rxs }. dnl ''  NB. first match short text
er (pat00;3 8 2) rxs }. dnl ''  NB. all matches short text
er (pat00;3 8 3) rxs }. dnl ''  NB. all match array and short text
er (pat00;3 9) rxs }. dnl ''    NB. first match long text
er (pat00;3 9 1) rxs }. dnl ''  NB. first match long text
er (pat00;3 9 2) rxs }. dnl ''  NB. all matches long text
er (pat00;3 9 3) rxs }. dnl ''  NB. all match array and long text

NB. search macro texts for first match
er (pat00;4) rxs }. 4 dnl '' 

NB. same as previous
er (pat00;4 7) rxs }. 4 dnl '' 
er (pat00;4 7 1) rxs }. 4 dnl '' 

NB. more search macro texts 
er (pat00;4) rxs }. 4 1 25 dnl 'b' 
er (pat00;4 7) rxs }. 4 1 25 dnl 'b'              NB. same as previous
er (pat00;4) rxs }. (4 1,TEXT_ajod) dnl 'b'       NB. same as previous
er (pat00;4 7 1) rxs }. 4 1 25 dnl 'b'            NB. same as previous
er (pat00;4) rxs }. (4 1,SQL_ajod_) dnl 'b'       NB. first match sql macros
er (pat00;4 7 2) rxs }. (4 2,LATEX_ajod_) dnl ''     NB. all matches from select latex macros
er (pat00;4 7 3) rxs }. (4 2,MARKDOWN_ajod_) dnl ''  NB. all matches from select markdown macros

NB. search of macro short and long document texts
er (pat00;4 8) rxs }. dnl ''    NB. first match short text
er (pat00;4 8 1) rxs }. dnl ''  NB. first match short text
er (pat00;4 8 2) rxs }. dnl ''  NB. all matches short text
er (pat00;4 8 3) rxs }. dnl ''  NB. all match array and short text
er (pat00;4 9) rxs }. dnl ''    NB. first match long text
er (pat00;4 9 1) rxs }. dnl ''  NB. first match long text
er (pat00;4 9 2) rxs }. dnl ''  NB. all matches long text
er (pat00;4 9 3) rxs }. dnl ''  NB. all match array and long text


NB. Basic (rxs) search matches the first pattern in a text.
NB. This is the default option 1. 

NB. search short and long documents of words,tests,groups,suites
NB. when third code is missing the default is 1 - find first occurrence
er (pat01;0 8) rxs }. dnl ''
er (pat01;0 9) rxs }. dnl ''

er (pat01;1 8) rxs }. 1 dnl ''
er (pat00;1 9) rxs }. 1 dnl ''

er (pat01;2 8) rxs }. 2 dnl ''
er (pat01;2 9) rxs }. 2 dnl ''

er (pat01;3 8) rxs }. 3 dnl ''
er (pat01;3 9) rxs }. 3 dnl ''

er (pat01;4 8) rxs }. 4 dnl ''
er (pat01;4 9) rxs }. 4 dnl ''


NB. dictionary documents do not have short and long text
NB. an empty (rxs) (y) argument indicates - search dictionary document
NB. when the object code is 5
er (oat00;5) rxs ''
er (pat02;5 7)  rxs ''
er (pat02;5 7 1)  rxs ''  NB. first match
er (pat02;5 7 2)  rxs ''  NB. all matches
er (pat02;5 7 3)  rxs ''  NB. match array and text

NB. Option 2 matches all patterns.
NB. while option 3 return the match array and text satisfying matches.

NB. Option 2: search for and return all matches in texts

NB. search macro texts and return all matches (code 7 is JOD default)
er (pat00;4 7 2) rxs }. 4 1 25 dnl 'b' 
er (pat01;3 8 2) rxs }. 3 dnl ''
er (pat01;3 9 2) rxs }. 3 dnl ''
er (pat02;5 7 2) rxs ''
er (pat02;0 7 2) rxs }. dnl '' 

NB. Option 3: search for and return pattern array and texts

NB. search macro texts and return patterb table and text with matches
er (pat00;4 7 3) rxs }. 4 1 25 dnl 'b' 
er (pat01;3 8 3) rxs }. 3 dnl ''
er (pat01;3 9 3) rxs }. 3 dnl ''
er (pat00;5 7 3) rxs ''
er (pat02;0 7 3) rxs }. dnl '' 
)


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_