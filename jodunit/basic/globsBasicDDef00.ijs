NB.*globsBasicDDef00 t--  basic direct definition (globs) tests.
NB.
NB. Basic tests of JOD's handling of new (J 9.02 and above) direct definition.
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 12dec10 start of test cases


cocurrent 'base'
require 'jodtester'


coclass tmploc_AAAbasic999_=: 'AAAbasic999' [ coerase <'AAAbasic999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

ddef00=:3 : 0

NB.*ddef00 v-- word with direct definitions
NB.
NB. monad:  ddef00 uuIgnore

ndef=:{{  }} 

ndef2=:{{ )v }} 

ndef3=:{{ )c
 }} 

ndef4=:{{)d }}

NB. throw J error
NB. nbad=:{{)wrong}}

dad=. {{ x + y }} 
smoutput 10 dad 12

smoutput {{ y + bl_t=. y^3 }} i: 2 10

mom=: {{ )m
(<<'greatgrand';y);(<'grand';y);y }} 
smoutput mom 'mother'

mom2=: {{ x ; mom mom y }} 
smoutput 'yada' mom2 'mother'

locmom=. {{ (<<'local_greatgrand';y);(<'local_grand';y);y }} 

NB. pick up local verb
mom3=. {{ u. u. y }} 
smoutput locmom mom3 'local_mother'

sis=: {{ (u 3 * y) ; (u 2 * y) ; u y }} 
smoutput sis i. 5

sis2=: {{ (u. 3 * y) ; (u. 2 * y) ; u. y }} 
smoutput sis2 - i. _3

lsis=: {{ )c
smoutput 'in lsis'
inlsis=. 2 * x
dg_we=:dg_are=:dg_global=: 'ddef globals'
inlsis ; (|. y) ; v v v u y
 }} 
smoutput ,. 5 (+/ lsis +:) i. 20

boohoo=:{{ )d
smoutput 'in boohoo'
bl_not=.bl_really=.bl_local=.bl_to_ddef00=.'bogus locals'
x * y + y
 }} 
smoutput 2 boohoo 4

smoutput ,. +/\ sis i. 20
bro=: {{ )d
        smoutput 'in bro'
        x + y * y + x
 }} 
smoutput 5 bro 4

1 NB. OK
)


ddef00 ''
er showpass 11 globs 'ddef00'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAbasic999_
