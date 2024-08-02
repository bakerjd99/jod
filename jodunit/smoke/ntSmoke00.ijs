NB.*ntSmoke00 t-- (nt) smoke test.
NB.
NB. (nt) (new test) places test text in a  J (JQt or  JHS) window
NB. for  editing. The text is  derived from templates  stored  in
NB. path dictionaries.
NB.
NB. assumes:
NB.
NB.   0) (testjod03) exists - run (createtestdictionaries)
NB.
NB. author:  John D. Baker
NB. created: 2024jul29
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAntSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

showpass=:] [ 1!:2&2

tdict=: 'testjod03'

er od ;:'joddev jod utils' [ 3 od ''

NB. name of test template - (nt) looks for this name on the path
1 [ showpass tplname=: TESTSTUB_ajodtools_

NB. default test template
1 [ tpltext=: 1 disp TESTSTUB_ajodtools_

NB. make a new test script tempate
newtpl=: (0 : 0)
NB.*{~T~} t-- test ({~T~}) stub.
NB.
NB. This test '{~T~}' begs for ... formatted text
NB. 
NB. I STRINGS what REPLACE because DYADICNT
NB.
NB. assumes:
NB.
NB.  0) list of test assumptions ...
NB.
NB. authors:  {~A~} and ROBIN
NB. created: {~D~}
NB. short date: {~SD~}
)

NB. various (ijod) nouns used to fill templates
CLASSAUTHOR_ijod_=: 'Bat Man'

er od tdict [ 3 od ''

NB. put template on path
er 1 put tplname;newtpl

NB. create a new test - opens edit window
1 [ nt 'batcave'

NB. create another test - opens another window - makes string subs
1 [ '#STRINGS#do#REPLACE#I do#DYADICNT#I am what I am#ROBIN#Wolverine' nt 'biglycave'	

erase 'CLASSAUTHOR_ijod_'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_