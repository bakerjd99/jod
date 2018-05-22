NB.*bnlBasic01 t-- basic backup name list tests.
NB.
NB. Assumes (testjod1) backups loaded with enough words  to match
NB. names.
NB.
NB. verbatim:
NB.
NB. author:  John D. Baker
NB. created: 2011dec20
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. there must be an open dictionary
ner bnl ''
ner bnl '.'
ner bnl 'reb.14'

er od 'testjod1'
NB. words from most current backup
er bnl ''

NB. tests from most current backup
er 1 bnl ''

NB. et cetera
er 2 bnl ''
er 3 bnl ''
er 4 bnl ''

NB. bnl MOSTLY mirrors dnl for the most current backup - except
NB. bnl only searches a single put dictionary backup there is no path
NB. hence there are no path order results like:  0 _1 dnl ''
er 4 3 bnl '_DOT'  NB. macros ending with '_DOT' in current backup
er 2 2 bnl 'od'    NB. groups containing substring 'od' in current backup

er 0 1 0 bnl ''    NB. all nouns in current backup
er 0 1 1 bnl ''    NB. all adverbs in current backup


NB. words from particular backups
NB. blcl of backup number dots, eg: <;.1 '.23.17.16.15.14.13.12.04'
NB. formatted so alpha sorts match numeric sorts
er bnums=: bnl '.'
bk=: >1{bnums=: }. bnums

er bnl bk              NB.  bnl '.17'     NB. matches all words in given backup
er bnl 'reb',bk        NB.  bnl 'reb.17'  NB. matches all words starting with 'reb' in given backup
er 0 3 bnl 'ex',bk     NB.  0 3 bnl 'ex.17'  NB. words ending with 'ex' in given backup
er 1 3 bnl 'ex',bk     NB.  1 3 bnl 'ex.17'  NB. tests ending with 'ex' in given backup
er 2 2 bnl 'od',bk     NB.  2 2 bnl 'od.17'  NB. groups containing substring 'od' in given backup

er 0 1 1 bnl 'B',bk    NB. all adverbs starting with 'B' in given backup


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_