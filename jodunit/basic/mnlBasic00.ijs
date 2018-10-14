NB.*mnlBasic00 t-- check (mnl) basic functions.
NB.
NB. (mnl) has two  use cases. It provides a simple  means to scan
NB. all registered  dictionaries for simple prefix, contains  and
NB. suffix name patterns  and it makes it  easy to find duplicate
NB. names  in  registered dictionaries.  JOD  is  biased  towards
NB. linear  unique names and dictionaries  are  more flexible  if
NB. duplicates are kept to a minimum.
NB.
NB. assumes:
NB.
NB.   1) All test dictionaries have been created and loaded.
NB.      See the tests (createtestdictionaries) and
NB.      (loadSmoketest0, loadSmoketest1, loaddumpSmoke00,
NB.       loadtest001dictionary, loadtest002dictionary, loadtest003dictionary
NB.       loadtest004dictionary, loadtest010dictionary, loadtest100dictionary)
NB.
NB. author:  John D. Baker
NB. created: 2018oct14
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'


coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. returns table of all word, dictionary name pairs in all
NB. registered dictionaries - when test dictionaries are present
NB. this table is over 100,000
100000 < >./ #&> mnl ''

NB. identity
(0 mnl '') -: mnl ''

NB. tolerate patterns that are not J names - needed for some patterns
1 0 -: #&> mnl '***not///name'

NB. all duplicate names in all dictionaries
rc [ 'rc names'=: 0 _1 mnl ''

NB. duplicate names will satisfy
mask=: ~: 0 {"1 names
(mask # 0 {"1 names) -: ; ~.&.> mask (<;.1) 0 {"1 names

NB. prefix 
pat=: 'rebtbcol'
rc [ 'rc names'=: 0 1 mnl pat
*./ 0 {"1 (,:pat) E. > 0 {"1 names

NB. contains 
pat=: 'text'
rc [ 'rc names'=: 0 2 mnl pat
*./ +./"1 (,:pat) E. > 0 {"1 names

NB. suffix
pat=: 'exp'
rc [ 'rc names'=: 0 3 mnl pat
*./ (<pat) = (-#pat) {.&.> 0 {"1 names


NB. various ad hoc tests 

NB. duplicate MARKDOWN macro names in all dictionaries
rc [ 'rc names'=: (4 1,MARKDOWN_ajod_) mnl ''
mask=: ~: 0 {"1 names
(mask # 0 {"1 names) -: ; ~.&.> mask (<;.1) 0 {"1 names

NB. suite names containing 
pat=:'smoke'
rc [ 'rc names'=: 3 2 mnl pat
*./ +./"1 (,:pat) E. > 0 {"1 names

NB. test names ending with
pat=: '00'
rc [ 'rc names'=: 1 3 mnl pat
*./ (<pat) = (-#pat) {.&.> 0 {"1 names

NB. group names starting with
pat=: 'build'
rc [ 'rc names'=: 2 1 mnl pat
*./ 0 {"1 (,:pat) E. > 0 {"1 names



NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_