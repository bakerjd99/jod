NB.*jodon s-- places (jodon) and (jodoff) in z locale.

cocurrent 'z'
NB.*end-header

jodoff=:3 : 0

NB.*jodoff v-- turns JOD off  result is  1
NB.
NB. monad:  jodoff uuIgnore

NB. HARDCODE: 3 ijod base
NB. close dictionaries remove JOD from base path !(*)=. copath
1 [ 'base' copath~ (copath 'base') -. <'ijod' [ 3 od ''
)


jodon=:3 : 0

NB.*jodon v--  turn  JOD on  result  is 1  
NB.
NB. monad:  paRc =. jodon uuIgnore

1 ['base' copath~ ~.'ijod';copath 'base' 
)