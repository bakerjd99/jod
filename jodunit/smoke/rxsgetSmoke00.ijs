NB.*rxsgetSmoke00 t-- test (rxsget).
NB.
NB. (rxsget) gathers the texts searched by (rxs). (rxsget) is not
NB. an interface word. These tests are internal  tests  hence the
NB. (JODobj) suffix.
NB.
NB. assumes:
NB.
NB.   1) first test assumption
NB.   2) second test assumption
NB.           ....
NB.
NB. author:  John D. Baker
NB. created: 2019feb08
NB. changes: -----------------------------------------------------

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

require 'jodtester'

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

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

NB. (rxsget) either returns an error or a possibly empty rank 2 (name,text) table

NB. dictionary document is empty - result table empty
2 = {: $ >1{(DICTIONARY_ajod_,7 1) rxsget__JODobj ''

NB. no objects stored - expected errors
ner 1 7 1 rxsget__JODobj }. dnl ''
ner 2 7 1 rxsget__JODobj }. dnl ''
ner 3 7 1 rxsget__JODobj }. dnl ''
ner 4 7 1 rxsget__JODobj }. dnl ''
ner 4 7 1 rxsget__JODobj }. dnl ''
ner 1 8 1 rxsget__JODobj }. dnl ''
ner 2 8 1 rxsget__JODobj }. dnl ''
ner 3 8 1 rxsget__JODobj }. dnl ''
ner 4 8 1 rxsget__JODobj }. dnl ''
ner 1 9 1 rxsget__JODobj }. dnl ''
ner 2 9 2 rxsget__JODobj }. dnl ''
ner 3 9 3 rxsget__JODobj }. dnl ''
ner 4 9 1 rxsget__JODobj }. dnl ''

NB. store word text(s) - using a JOD class as word source
er 'ajod' put nl_ajod_ 3

NB. should have word texts that match
er txt=: 0 7 1 rxsget__JODobj }. dnl ''
0 = #(nl_ajod_ 3) -.~ 0 {"1 > 1 { txt

NB. short and long document texts are all empty and (rxsget) removes 0 length texts
er txt=: 0 8 1 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt
er txt=: 0 8 2 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt
er txt=: 0 8 3 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt

NB. there is no 0 option
NB. ner 0 8 0 rxsget__JODobj }. dnl ''

er txt=: 0 9 1 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt
er txt=: 0 9 2 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt
er txt=: 0 9 3 rxsget__JODobj }. dnl ''
0 2 -: $ > 1{txt

NB. load some short and long document text
er txt=: dnl ''
txt=: }. txt
er 0 8 put (shtx=: txt {~  (<.-:#txt) {. ?~ #txt) ,. <'like totally bogus short descriptions man'
er 0 9 put (lgtx=: txt {~  (<.-:-:#txt) {. ?~ #txt) ,. <; 50 # <'All work and no play makes jack a dull boy. ',LF

NB. fetch back
er txt=: 0 8 2 rxsget__JODobj }. dnl ''
0 = #shtx -. 0 {"1 > 1{txt
er txt=: 0 9 1 rxsget__JODobj }. dnl ''
0 = #lgtx -. 0 {"1 > 1{txt

NB. put macros of varying type
mcnt=: 50
mtype=: <"0 (mcnt?mcnt){ mcnt$JSCRIPT_ajod_,TEXT_ajod_,MARKDOWN_ajod_,XML_ajod_,SQL_ajod_
er 4 put (<"1 ('macro' ,"1 ": ,. i. mcnt) -."1 ' ') ,. mtype ,. <'NB. do nothing macro texts'

NB. short and long macro documents are empty
NB. note how the name list uses macro types
er 4 7 1 rxsget__JODobj }. (MACRO_ajod_,1,SQL_ajod_) dnl ''
er txt=: 4 8 1 rxsget__JODobj }. (MACRO_ajod_,1,SQL_ajod_) dnl ''
0 2 -: $ > 1{txt
er txt=: 4 9 1 rxsget__JODobj }. (MACRO_ajod_,1,SQL_ajod_) dnl ''
0 2 -: $ > 1{txt


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_