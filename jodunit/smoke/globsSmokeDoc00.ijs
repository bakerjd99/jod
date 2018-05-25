NB.*globsSmokeDoc00 t-- (globs) document fragment test. 
NB.
NB. Tested material occurs in jod.pdf. Insure it works.
NB.
NB. author:  John D. Baker
NB. created: 2018may24
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

mixedassignment=: 3 : 0
NB. I have a mixed global and local assignment. Usually, this is
NB. poor name choice but there are good reasons for such assignments.
names=. ;:'we are going to be globals'
(names)=: <'clandestine global'
)

confusing=: 3 : 0
NB. allow mixed assignments (<:)=:
scopeless=. <'cis_scoping_is_so_un_woke'
(scopeless)=: scopeless
)

NB. mixed assignment triggers error
ner globs 'mixedassignment_AAAsmoke999_'

NB. override tag allows mixed assignments
er globs 'confusing_AAAsmoke999_'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_