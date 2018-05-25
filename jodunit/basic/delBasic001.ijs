NB.*delBasic001 t-- basic valid (del) tests.
NB. 
NB. assumes:
NB.
NB.   1) a READWRITE put dictionary (testjod0).
NB.
NB. JOD calls to setup test environment - assumes JODSOURCE 
NB. addon installed and JOD development dictionaries (joddev/jod/utils)
NB.
NB.   od ;:'joddev jod utils' [ 3 od ''
NB.   mls 'jodtester'
NB.   load 'jodtester'  
NB.   1 rtt 'createtestdictionaries'  NB. create test dictionaries
NB.
NB. author:  John D. Baker
NB. created: 2000sep01
NB. changes: -----------------------------------------------------
NB. 07nov01 converted to j6.02 - renamed
NB. 11may13 updated for J7/Linux version of JOD
NB. 11may20 (jodtester) require'd
NB. 11nov23 changed to use temporary locale
NB. 18may24 upated for J 8.07

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAbasic999_=: 'AAAbasic999' [ coerase <'AAAbasic999'
coinsert 'ijod'

testenvironment 'good';'JOD'

tdict=: 'testjod00'

er od tdict

NB. insert a word and delete it
iamword=: 3 : 0
a=. 2 + y
a * 2x
)

ljust=: ' '&$: :(] |."_1~ i."1&0@(] e. [))

er tmploc put 'iamword'   NB. into dictionary
er dnl 'iamword'   NB. is it in the dictionary

er del 'iamword'   NB. delete word
ner tmploc get 'iamword'  NB. word is deleted cannot get

NB. insert 100 words into dictionary and delete them
(wordypoos=: <"1 'wordypoo' ,"1  ljust ": ,. i. 100) =: 100 # < 5!:5 <'iamword'
er tmploc put wordypoos
er del wordypoos

NB. will not be able to get any deleted words
ner tmploc get (10?#wordypoos){wordypoos

NB. delete all references and check they are gone
er 11 del wordypoos
ner uu=: uses wordypoos

NB. regenerate references
1 [ 0 globs&> wordypoos

NB. TEST SUCCESSFUL

NB. reopen any dictionaries
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAbasic999_
