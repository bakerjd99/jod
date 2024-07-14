NB.*macroloadStress00 t-- (make) (put) load stress test.
NB.
NB. assumes:
NB.
NB.   0) (jodtest) exists and is loaded
NB.
NB. author:  John D. Baker
NB. created: 2024jul13
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAmacroloadStress00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

showpass=:] [ 1!:2&2

NB. dump (jodtest) this dictionary holds two large
NB. dictionary dump scripts in the form of text macros.
NB. when dumped they create a arge >100mb script file
NB. that holds the two objects. Dumping and reloading
NB. such big texts is a pathological use of JOD.

NB. open (utils) to use (dumpput)
er od ;:'jodtest utils' [ 3 od ''
1 [ rs 'dumpput'

jot=: {: {. DPATH__ST__JODobj
dumpfile=:  DMP__jot ,'jodtest.ijs' 

NB. dump file must exist
fex <dumpfile

NB. create new empty dictionary
dnm=: 'jodtest',":didnum_ajod_ 0
er newd dnm;jpath '~JODTEST/',dnm

NB. open new dictionary and load
er od dnm [ 3 od ''
1 [ 0!:0 <dumpfile

NB. show macro names if load succeeds
er showpass 4 dnl ''

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_