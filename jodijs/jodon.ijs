NB.*jodon s-- places (jodon) and (jodoff) in z locale.

cocurrent 'z'
NB.*end-header

jodoff=:3 : 0

NB.*jodoff v-- turns JOD off  result is  1  if  successful and  0
NB. otherwise.
NB.
NB. Destroys dictionary objects, clears JOD classes and drops the
NB. (ijod) interface. This  verb plus (jodon) and (jodsystempath)
NB. remain in the (z) locale after off'ing JOD and can be used to
NB. reload the system.
NB.
NB. monad:  jodoff uuIgnore

NB. HARDCODE: JODobj_ijod_ ajod ijod base
try.
  jo=. <'JODobj_ijod_'
  if. 0 = (4!:0) jo do. (4!:55) jo [ (18!:55) destroyjod__JODobj 0 end.

  NB. erase jod classes
  (18!:55) w #~ 'ajod'&-:@:(4&{.)&> w=. 18!:1 ] 0

  NB. erase (ijod) interface and clear base path
  ((18!:2<'base')-.<'ijod') 18!:2 <'base'
  (18!:55)<'ijod'

  _1=(4!:0) jo
catchd.
   0
end.
)


jodon=:3 : 0

NB.*jodon v--  turn  JOD on  result  is 1  if  successful  and  0
NB. otherwise.
NB.
NB. Tests the  current J environment and creates or activates JOD
NB. objects.
NB.
NB. monad:  paRc =. jodon uuIgnore

NB. format of (9!:14) has changed without warning in the past
jvn=. 9!:14 ''

NB. first value before '/' is the version number (we hope).
jvn=. , (jvn i. '/') {. jvn
if. #jvn do. jvn=. 0 ". jvn #~ jvn e. '0123456789' else. jvn=. 0 end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  msg=. 'JOD requires J 6.02 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 6.0x-8.0x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN' do.
  msg=. 'JOD depends on core J load and class utilities.'
  0 [ sp msg=. msg,LF,'Load J with a standard profile to use JOD.'
  return.
end.

NB. HARDCODE: JODobj_ijod_ ijod ajod
jodob=. nc 'JODobj_ijod_'          NB. name class of JOD object pointer
jodco=. (<'ajod') e. 18!:1 ] 0     NB. JOD class status

if. (0=jodob) *. jodco      do. 1  NB. JOD is loaded
elseif. (_1=jodob) *. jodco do.
  NB. jod is off and classes are loaded - create objects !(*)=. conew
  JODobj_ijod_=: conew 'ajod'
  if. jodcs=. createjod__JODobj JODobj_ijod_ do. 1 else. 0 [ ex 'JODobj_ijod_' end.
elseif. -. jodco do.
  NB. JOD classes absent load and start system !(*)=. load
  ex 'JODobj_ijod_'
  NB. JOD load now requires addon path
  load 'general/jod'
  0 = nc 'JODobj_ijod_'
elseif.do. 0 NB. utterly screwed up system state
end.
)