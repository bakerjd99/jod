NB.*jodsourcesetup   s--  creates  and   loads   JOD  development
NB. dictionaries from JOD dumps.
NB.
NB. This   script   creates   and  loads   the  JOD   development
NB. dictionaries (joddev,  jod, utils).  To run this  script  the
NB. following must hold:
NB.
NB. verbatim:
NB.
NB. 0) J 6.0x-8.0x for Windows, Mac, Linux must be installed.
NB.
NB. 1) The JOD addon must be installed. Use JAL to install
NB.    general/jod
NB.
NB. 2) The JODSOURCE addon must be installed. Use JAL to install
NB.    general/jodsource
NB.
NB. 3) The JFILES addon must be installed. Use JAL to install
NB.    data/jfiles
NB.    
NB. 4) The directory c:\jodroot\ (win) or /home/{$HOME}/jodroot/ (linux)
NB.    must be empty.
NB.
NB. 5) No JOD dictionaries with names (joddev, jod, utils) exist.
NB.
NB. author:  John D. Baker
NB. created: 2011may24
NB. changes: -----------------------------------------------------
NB. 11dec19 added note about arc/zip failure on 64 bit systems
NB. 18mar15 remove zfiles dependency - will now run on all J systems

require 'files task regex dir'

cocurrent 'base'
coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

NB. returns result of linux/unix commands as text string
host=:[: 2!:0 '('"_ , ] , ' || true)'"_

NB. make a directory (1 success, 0 failure)
makedir=:1!:5 ::0:

NB. writes a list of bytes to file
write=:1!:2 ]`<@.(32&>@(3!:0))

setupjodsource=: 3 : 0

NB.*setupjodsource  v--  creates  and   loads   JOD  development
NB. dictionaries from JOD dumps.
NB.
NB. monad:  setupjodsource uuIgnore

if. -.fexist jpath '~addons/general/jod/jmaster.ijf' do.
  smoutput 'ERROR: JOD addon is not installed' return.
elseif. -.fexist jodzip=. jpath '~addons/general/jodsource/joddev.ijs' do.
  smoutput 'ERROR: JODSOURCE addon is not installed' return.
elseif. -.fexist jpath '~addons/data/jfiles/jfiles.ijs' do.
  smoutput 'ERROR: JFILES addon is not installed' return.
end.

require 'general/jod'

NB. JOD source dictionaries in reverse path order
dicts=. ;:'utils jod joddev'
if. 1 e. dicts e. od '' do.
  smoutput 'ERROR: some JOD development dictionaries exist' return.
end.

NB. if a JODroot folder is defined use it
if. '~'={.jodroot=. jpath '~JODroot/' do.  
  NB. otherise use this default 
  jodroot=. '/jodroot/' 
  if. IFWIN do. jodroot=. 'c:',jodroot 
  else. 
    jodroot=. (LF -.~ host 'echo $HOME'),jodroot 
  end.
end.

if. 0 = #1 dir jodroot do.
  makedir <jodroot
  smoutput 'JOD root directory created: ',jodroot
else.
  smoutput 'ERROR: nonempty JOD root directory -> ',jodroot return.
end.

NB. create dictionaries
smoutput newd (0{dicts),<jodroot,;0{dicts
smoutput newd (1{dicts),<jodroot,;1{dicts
smoutput newd (2{dicts),<jodroot,;2{dicts

NB. run dictionary dump scripts
tmppath=. jpath '~addons/general/jodsource/'

for_dict. dicts do.
  dict=. ;dict
  smoutput 'Loading: ',dict
  NB. insure dictionary path order
  od |.(>:dict_index){.dicts [ 3 od ''
  NB. load dump script
  0!:0 <tmppath,dict,'.ijs'
  NB. insure we remain in working locale
  cocurrent tmploc_AAAtrash999_
  NB. regenerate cross references
  tmprefs=. 0 globs&> }. revo ''
  smoutput 'Cross references generated: ',dict
end.

smoutput 'SUCCESS: registered JOD dictionaries' [ 3 od ''
smoutput 4 od ''
)

setupjodsource 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_
