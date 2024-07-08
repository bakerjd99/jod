NB.*jodonSmoke00 t-- test (jodon,jodoff).
NB.
NB. assumes:
NB.
NB.   0) run test (createtestdictionaries) 
NB.
NB. author:  John D. Baker
NB. created: 2024jul07
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAjodonSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. current numbered locales must be JOD only
NB. run in a clear base locale
numlocs=: conl 1

NB. open some test dictionaries
er od ;:'testjod00 testjod01 testjod02' [ 3 od ''

numopen=: conl 1

NB. repeated (jodon)'s do not change numbered locales
jodon jodon jodon jodon jodon 0
(/:~ numopen) -: /:~ conl 1

NB. turn JOD off and on
(jodon , jodoff) 0

NB. any open dictionaries closed by (jodoff)
ner did 0

NB. turn JOD off and on many times
(jodon , jodoff) 0
(jodon , jodoff) 0
(jodon , jodoff) 0
(jodon , jodoff) 0

NB. numbered locales do not change
(/:~ numlocs) -: /:~ conl 1

NB. J increments numbered locales and does not reuse
NB. numbers in a session - hence the current list should
NB. have all new numbers

NB. repeated loads produce new lists of numbered locales
1 [ load 'general/jod'
nl0=: conl 1 

1 [ load 'general/jod'
(#nl0) = #nl1=: conl 1

1 [ load 'general/jod'
(#nl1) = #nl2=: conl 1

1 [ load 'general/jod'
(#nl2) = #nl3=: conl 1

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_