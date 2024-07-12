NB.*addgrpSmoke00 t-- (addgrp) smoke test.
NB.
NB. assumes:
NB.
NB.   0) dictionary (testjod01) exists and is loaded.
NB.
NB. author:  John D. Baker
NB. created: 2024jul12
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAaddgrpSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod01'
er od tdict [ 3 od ''

NB. create new empty group
newgrp=: 'grp',":didnum_ajod_ '' 
er grp <newgrp

NB. insert random words into group
er grp newgrp ; wrds {~ (20?#) wrds=: }. dnl ''
wrds=: (? ~ #wrds){wrds=: wrds -. grp newgrp

NB. random words
er newgrp addgrp 10 {. wrds

NB. create new empty suite
newsui=: 'sui',":didnum_ajod_ '' 
er SUITE_ajod_ grp <newsui

NB. insert random tests into suite
er SUITE_ajod_ grp newsui ; tests {~ (5?#) tests=: }. TEST_ajod_ dnl ''

NB. add tests to suite
er (newsui;SUITE_ajod_) addgrp 2 {. tests -. SUITE_ajod_ grp newsui


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_