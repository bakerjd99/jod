NB.*dpsetVerNew00  t-- (dpset)  binary  compatibility new  system
NB. checks.
NB.
NB. (dpset)   cannot   change  dictionary   parameters   of   old
NB. dictionaries.  Old  dictioaries  are  strictly  READONLY  and
NB. parameter changes require writes.
NB.
NB. assumes:
NB.
NB.   1) Old test dictionaries exist run (create_version_test_dictionaries)
NB.      on and older J.
NB.
NB.   2) Run test (dpsetVerOld00) to set READONLY on older dicts
NB.
NB. author:  John D. Baker
NB. created: 2023jan25
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string (y) after last occurrence of (x)
afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

NB. HARDCODE: prior J version
tpfx=: 'testjodj903'

NB. get names of old J dictionaries they may 
NB. not be registered locate by looking for files
3<:#tjvd=: (] #~ +./@(tpfx&E.)&>) dirpath '~JODTEST'

NB. HARDCODE: number of dicts 
tjvd=: 3 {. tjvd #~ -.('/'&afterlaststr&.> tjvd) e. ;:'alien backup document dump script suite'

rgdicts=: ('/'&afterlaststr&.> ,. ]) tjvd

NB. insure selected dictionaries are not registered
1 [ 3&regd&> 0{"1 rgdicts

NB. register READONLY dicts
er@regd"1 rgdicts  NB. returns all 1s

NB. attempt parameter changes
er od ;0{0{rgdicts
ner showpass dpset 'READWRITE'
ner dpset 'CLEARPATH'
ner dpset 'RETAINAGE'
ner dpset 'ASCII85';1
ner dpset 'ROOTFOLDER';'~BOGUS'
ner dpset 'DOCUMENTWIDTH';71

1 [ 3 od '' NB. close any open dicts

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_