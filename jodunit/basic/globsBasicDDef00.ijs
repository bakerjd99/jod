NB.*globsBasicDDef00 t-- basic direct definition (globs) tests.
NB.
NB. Basic tests  of JOD's handling  of  new  (J  9.02 and  above)
NB. direct definitions.
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 12dec10 start of test cases
NB. 24jul09 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAglobsBasicDDef00'

testenvironment 'good';'JOD' NB. ;1 NB. to show testpass results
NB. -{TEST START}-

ddef00=:3 : 0

NB.*ddef00 v-- word with direct definitions
NB.
NB. monad:  ddef00 uuIgnore

NB. JOD local declaration
NB. j profile !(*)=. smoutput

ndef=:{{  }}

ndef2=:{{ )v }}

ndef3=:{{ )c
 }}

ndef4=:{{)d }}

NB. throw J error
NB. nbad=:{{)wrong}}

dad=. {{ x + y }}
testpass 10 dad 12

testpass {{ y + bl_t=. y^3 }} i: 2 10

mom=: {{ )m
(<<'greatgrand';y);(<'grand';y);y }}
testpass mom 'mother'

mom2=: {{ x ; mom mom y }}
testpass 'yada' mom2 'mother'

locmom=. {{ (<<'local_greatgrand';y);(<'local_grand';y);y }}

NB. pick up local verb
mom3=. {{ u. u. y }}
testpass locmom mom3 'local_mother'

sis=: {{ (u 3 * y) ; (u 2 * y) ; u y }}
testpass sis i. 5

sis2=: {{ (u. 3 * y) ; (u. 2 * y) ; u. y }}
testpass sis2 - i. _3

lsis=: {{ )c
testpass 'in lsis'
inlsis=. 2 * x
dg_we=:dg_are=:dg_global=: 'ddef globals'
inlsis ; (|. y) ; v v v u y
 }}
testpass ,. 5 (+/ lsis +:) i. 20

boohoo=:{{ )d
testpass 'in boohoo'
bl_not=.bl_really=.bl_local=.bl_to_ddef00=.'bogus locals'
x * y + y
 }}
testpass 2 boohoo 4

testpass ,. +/\ sis i. 20
bro=: {{ )d
        testpass 'in bro'
        x + y * y + x
 }}
testpass 5 bro 4

For_the_love_of_God_Montresor=.{{
)d
cask=. 2
wine=: {{ (":x),y,spade=.' cement'}}
impunity=. ;:'he had it coming'
for_floc. impunity do.
  testpass ;floc
end.
sweet_revenge=: cask wine 'wet'
}}

1 NB. OK
)

ExpectedGlobals=: /:~ ;:'ndef ndef2 ndef3 ndef4 mom mom2 sis sis2 lsis boohoo bro dg_we dg_are dg_global wine sweet_revenge testpass'
ExpectedLocals=: /:~ ;:'dad bl_t mom3 bl_not inlsis locmom bl_really bl_local bl_to_ddef00 smoutput cask impunity spade floc For_the_love_of_God_Montresor'

ddef00 ''

NB. refer to definition in test locale
er testpass GlobsResult=: 11 globs 'ddef00_',tmploc,'_'

NB. check name lists
GlobsResult=: >1{GlobsResult
ExpectedGlobals -: /:~ ;1{0{GlobsResult
ExpectedLocals -: /:~ ;1{1{GlobsResult

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
