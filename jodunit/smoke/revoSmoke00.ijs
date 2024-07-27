NB.*revoSmoke00 t-- (revo) smoke tests.
NB.
NB.   0) (testjod06) exists - see (createtestdictionaries)
NB.
NB. author:  John D. Baker
NB. created: 2024jul25
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAArevoSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod06'
er od tdict [ 3 od ''

NB. insert words to make them recent
WeAre=: i. 23
Just=: 'boo hoo'
PutInDic=: {{x + y}}
er tmploc put wrds=: ;:'WeAre Just PutInDic'

NB. revo sorts based on internal timestamps
er 'rs wtimes'=: 0 13 get wrds

NB. they should be first words on (revo) result
er rvwrds=: revo ''
(/:~ 3 {. }. rvwrds) -: /:~ wrds

NB. create some recent tests
er 1 put 'weare';'unburdened by'
er 1 put 'unburdened';'by what '
er 1 put 'has';'gone before'
tests=: ;:'weare unburdened has'
er rvtests=: 1 revo ''
(/:~ 3 {. }. rvtests) -: /:~ tests

NB. create some recent groups
er 2 grp 'boohoo';wrds
er 2 grp 'too';2{.wrds
er 2 grp 'you';_2{.wrds
tgrps=: ;:'boohoo too you'
er rvgrps=: 2 revo ''
(/:~ 3 {. }. rvgrps) -: /:~ tgrps

NB. create some recent suites
rvtests=: }. rvtests
er 3 grp 'asuite';rvtests
er 3 grp 'oflittle';2{.rvtests
er 3 grp 'dumbtests';_2{.rvtests
suites=: ;:'asuite oflittle dumbtests'
er rvsuits=: 3 revo ''
(/:~ 3 {. }. rvsuits) -: /:~ suites

NB. create some recent macro
er 4 put 'weare';25;'unburdened by'
er 4 put 'unburdened';25;'by what '
er 4 put 'has';25;'gone before'
macs=: ;:'weare unburdened has'
er rvmacs=: 4 revo ''
(/:~ 3 {. }. rvmacs) -: /:~ macs


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_