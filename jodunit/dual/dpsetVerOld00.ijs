NB.*dpsetVerOld00 t--  set read/write  statue  on  older  J  test
NB. dictionaries.
NB.
NB. Set READWRITE  and READONLY  status on selected  dictionaries
NB. that were created in an older version of J.
NB.
NB. assumes:
NB.
NB.   1) Test dictionaries exist run tests (create_version_test_dictionaries)
NB.      and (load_test001_version_dictionary)
NB.
NB. author:  John D. Baker
NB. created: 2023jan24
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])

NB. name embeds current running version of J
tpfx=: 'testjod', '/' beforestr 9!:14 ''

NB. this J version's test dictionaries
tjvd=: (] #~ +./@(tpfx&E.)&>) }. od''

1 [ 3 od '' NB. close any open dicts

NB. set status on first few dicts
er od 0 pick tjvd
er dpset 'READWRITE'
er dpset 'READONLY'
er 3 od ''

er od 1 pick tjvd
er dpset 'READWRITE'
er dpset 'READONLY'
er 3 od ''

er od 2 pick tjvd
er dpset 'READWRITE'
er dpset 'READONLY'
er 3 od ''

er od 3 pick tjvd
er dpset 'READWRITE'
er 3 od ''

er od 4 pick tjvd
er dpset 'READWRITE'
er 3 od ''

NB. show read status settings
1 [ smoutput  did~0 [ od (i.5){tjvd
1 [ 3 od ''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_