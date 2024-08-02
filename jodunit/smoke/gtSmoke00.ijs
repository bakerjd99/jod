NB.*gtSmoke00 t-- (gt) smoke test.
NB.
NB. (gt) fetches (ijs) text from JQt or JHS edit windows.
NB.
NB. assumes:
NB.
NB.   0) JOD is running
NB.
NB. author:  John D. Baker
NB. created: 2024jul28
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'


testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. stuff some text into the standard J edit directory
bootxt=: ,10 # ,:'I do what I do because I am what I am',LF
1 [ bootxt write jpath '~temp/boofile.ijs'

NB. fetch text should match after line end normalization
booback=: gt 'boofile'
bootxt -: booback -. CR


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_