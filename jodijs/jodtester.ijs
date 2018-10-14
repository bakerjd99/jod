NB.*jodtester g-- jod test script utilities.
NB.
NB. author:  John D. Baker
NB. created: 2011may13
NB. changes: -----------------------------------------------------
NB. 11feb14 (jodtester) now loaded into (ijod) locale
NB. 11nov18 (testenvironment) changed to create (er, ner, testpass) in (ijod)

coclass 'ijod'
NB.*end-header

NB. test message switch - 1 on 0 off
TESTYAMMER=:0


ereopen=:3 : 0

NB.*ereopen v-- reopen dictionaries
NB.
NB. monad:  ereopen uuIgnore

1 [ od OPENJODDICTIONARIES_ijod_ [ 3 od '' NB. !(*)=. od OPENJODDICTIONARIES_ijod_
)

NB. hex from decimal: hfd 5078
hfd=:16&#.@('0123456789ABCDEF'&i.)^:_1

NB. converts path \/ separators to the preferred host form
hostsep=:'\'&(('/' I.@:= ])})


rmroot=:3 : 0

NB.*rmroot v-- delete a directory all contents - windows and linux.
NB.
NB. monad:  rmroot clRoot

NB. require 'task' !(*)=. shell
if. IFWIN do.
  shell_jtask_ 'rd "',y,'" /s /q'
else.
  shell_jtask_ 'rm -rf ',y
end.
)

NB. show and then pass noun
showpass=:] [ 1!:2&2


testenvironment=:3 : 0

NB.*testenvironment v-- sets up the (ijod) locale for running test cases.
NB.
NB. monad:  testenvironment (clTest ; clSystemname ; paYammer)
NB.
NB.   testenvironment 'bad';'JOD'    NB. yammer is off (default)
NB.   testenvironment 'bad';'JOD';1  NB. yammer is on

'type system yammer'=. 3 {. y , <0

NB. control display of (testpass) !(*)=. TESTYAMMER_ijod_
TESTYAMMER_ijod_=: yammer

NB. record any open dictionaries and close 
NB. require 'jod' !(*)=. did od OPENJODDICTIONARIES_ijod_
OPENJODDICTIONARIES_ijod_=: }. did 0
3 od ''

NB. display or pass !(*)=. testpass
testpass_ijod_=: ]`showpass@.(TESTYAMMER-:1)

NB. test utils !(*)=. err er ner
er_ijod_=: err@:testpass  NB. expected result
ner_ijod_=: -.@:er        NB. negative expected result

select. type
case. 'bad' do.
  err_ijod_=: [: -. 1: -: [: > {.
  1
case. 'good' do.
  err_ijod_=: 1: -: [: > {.
  1
case.do.
  0 [ showpass 'TEST ENVIRONMENT SETUP ERROR'
end.
)