NB.*edSmoke00 t-- smoke  tests of (ed) (name,[class],text)  table
NB. editing.
NB.
NB. (ed) tests require more user intervention than many other JOD
NB. tests.  As  the  tests  run  they  spawn   user  windows  (or
NB. hyperlinks in JHS) that must be examined and closed.
NB.
NB. assumes:
NB.
NB.   1) (testjod00) dictionary
NB.
NB. author:  John D. Baker
NB. created: 2015jul29
NB. changes: -----------------------------------------------------
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'
NB. 19dec07 ed/bget tests added 
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAedSmoke00'

NB. save smoke load test scripts
rc [ 'rc loadSmoke'=: 1 get ;:'loadSmoketest0 loadSmoketest1'
({."1 loadSmoke)=: {:"1 loadSmoke
(4!:55) ;:'rc loadSmoke'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od ''

NB. insert (overwrite) words of various types
boolboy=: 0
floatme=: 197 % ? 3 2 2 $ 77
IhaveCharacter=: 'how much wood would a wood chuck chuck'
doubleplusungood=: +: @ +:
amperdot=: &.
wnames=: ;:'boolboy floatme IhaveCharacter doubleplusungood amperdot'
>0{tmploc put wnames
>0{t0=: 0 10 get wnames

NB. this test require manual inspection of J editor windows

NB. edit word (name,class,text) table
1 [ showpass 'check editor 1 - ',;0{wnames [ ed ;1{t0

NB. insert tests and and macros
>0{1 put 'testalpha00';'NB. innocous text'
>0{1 put 'testalpha01';'NB. innocous text'
>0{1 put 'testalpha02';'NB. innocous text'
>0{4 put 'macroalpha00';21;'1 + 1'
>0{4 put 'macroalpha01';21;'1 + 1'

>0{t1=: 1 get tnames=: }. 1 dnl 'testalpha0'

NB. edit test(name,text) table
1 [ showpass 'check editor 2 - ',;0{tnames [ ed ;1{t1

>0{t2=: 4 get mnames=: }. 4 dnl 'macroalpha0'

NB. edit macro (name,code,text) table
1 [ showpass 'check editor 3 - ',;0{mnames [ ed ;1{t2

NB. create three backups

NB. first object collection - empty
>0{packd tdict

NB. second object collection
1 [ ((0!:100) :: _1:) loadSmoketest0
>0{packd tdict
 
NB. third object collection
1 [ ((0!:100) :: _1:) loadSmoketest1
>0{packd tdict

NB. opens a single edit window with text representations of all words in last backup
er uv=: bget }. bnl ''
1 [ showpass 'check editor 4 -', ;0{,0{>1{uv [ ed >1{uv

NB. opens a single edit window with text representations of all tests in last backup
er uv=: 1 bget }. 1 bnl ''
1 [ showpass 'check editor 5 -', ;0{,0{>1{uv [ ed >1{uv


er 3 od tdict

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_