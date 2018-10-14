NB.*mnlSmokeArgs00 t-- (mnl) simple valid argument checks.
NB.
NB. Checks all valid argument patterns for (mnl).
NB.
NB. assumes:
NB.
NB.   1) ...
NB.
NB. author:  John D. Baker
NB. created: 2018jun02
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

NB. (mnl) unlike most JOD words does not require open dictionaries.
NB. One of the basic uses of (mnl) is to scan all registered dictionaries
NB. for simple name patterns.

er mnl ''    NB. will list all words in all registered dictionaries

NB. simple invalid arguments
ner 'wrong' mnl ''
ner mnl 5   
ner mnl ;:'no boxes ehh'

er 0 mnl ''  NB. all words (monad)
er 1 mnl ''  NB. all tests
er 2 mnl ''  NB. all groups
er 3 mnl ''  NB. all suites
er 4 mnl ''  NB. all macros

ner 5 mnl ''  NB. only name lists


NB. all valid two item (x) arguments.
sres=: (, { OBJECTNC_ajod_ ; PATOPS_ajod_) mnl&.> <''

NB. all these searches should succeed - sometimes with nothing found
>@(0&{) &> sres

NB. valid three item (x) nondefault arguments 
lst=: , { WORD_ajod_ ; PATOPS_ajod_ ; i. 4
sres=: lst mnl&.> <''
>@(0&{) &> sres

lst=: , { MACRO_ajod_ ; PATOPS_ajod_ ; MACROTYPE_ajod_
srec=. lst mnl&.> <''
>@(0&{) &> srec


NB. some basic plausible errors
ner 1 1 1 mnl 'hey'    NB. tests, groups, suites do not have class
ner 2 3 0 mnl 'smarten'
ner 3 2 2 mnl 'up'

NB. bad options
ner 1 _4 1 mnl 'notevenwrong'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_