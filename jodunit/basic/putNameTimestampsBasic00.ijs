NB.*putNameTimestampsBasic00 t-- basic valid put name timestamps tests.
NB.
NB. verbatim: assumes
NB. 
NB. 1) a jpath ~JODTEST directory has been set.
NB.  
NB. author:  John D. Baker
NB. created: 2015jul02
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

NB. we need a configured directory 
-. (] -: jpath) '~JODTEST'

NB. work in clear base or trash locale
NB. clear ''

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. create new test dictionary 
dtname=: 'testjod0',(12?12){":didnum_ajod_''
dtpath=: (tslash2_ajod_ jpath '~JODTEST'),dtname 
>0{newd dtname;dtpath

>0{od dtname

NB. store some words - using J's z locale as object source
>0{'z' put (] {.~ 10 <. #) nl_z_ 0  NB. nouns
>0{'z' put (] {.~ 10 <. #) nl_z_ 1  NB. adverbs
>0{'z' put (] {.~ 10 <. #) nl_z_ 2  NB. conjunctions
>0{'z' put (] {.~ 10 <. #) nl_z_ 3  NB. verbs

NB. UTC date and time Neil Armstrong stepped on the moon
moonstep=: nowfd_ajod_ 1969 7 21 2 56 0.0

NB. set word timestamps to fixed value
rc [ 'rc nts'=: 0 _14 get }. dnl ''
nts=: (<($;1{nts)$moonstep) (1)} nts
>0{0 _14 put nts

NB. do timestamps match
'rc nts'=: 0 _14 get }. dnl ''
moonstep = ,;1{nts

NB. set conjunctions lastput to fixed value
rc [ 'rc nts'=: 0 _14 get }. 0 1 2 dnl ''
NB. times can be valid future dates
obamagone=: nowfd_ajod_ 2017 1 20 0 0 0.0  
nts=: (<(0{;1{nts) ,: ({:$;1{nts)$obamagone) (1)} nts
>0{0 _14 put nts
NB. timestamps must match
(;1{nts) -: ({:$;1{nts) #"1 moonstep,:obamagone

NB. retain timestamps in dumps
>0{dpset 'RETAINAGE';1
>0{df=: make ''
>0{3 od ''

NB. second new test dictionary
dtname2=: 'testjod0',(12?12){":didnum_ajod_''
dtpath2=: (tslash2_ajod_ jpath '~JODTEST'),dtname2 
>0{newd dtname2;dtpath2
>0{od dtname2

NB. load dump of first dictionary
((0!:0) :: 0:) {:df
1 [ cocurrent 'AAAtrash999'

NB. all timestamps from both dictionaries must match
ts2=: getallts__MK__JODobj 0
>0{od dtname [ 3 od ''
ts1=: getallts__MK__JODobj 0
ts1 -: ts2

NB. destroy test dictionaries
>0{3 regd dtname [ 3 od ''
>0{3 regd dtname2 
1 [ rmroot dtpath 
1 [ rmroot dtpath2

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_