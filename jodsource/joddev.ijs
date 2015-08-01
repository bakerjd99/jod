NB. JOD dictionary dump:  1 Aug 2015 10:18:19
NB. Generated with JOD version; 0.9.980; 23; 1 Aug 2015 10:06:39
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|225346394776877887587393570006481670086|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.980';80;'1 Aug 2015 10:18:19'

JODVMD=:'0.9.980';24;'1 Aug 2015 10:18:18'

MACROTYPE=:21+i.8

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

TESTYAMMER=:0

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


bget=:3 : 0

NB.*bget v-- retrieves objects from put dictionary backups.
NB.
NB. (bget) implements  a subset of (get). (bget) fetches  objects
NB. from either the last backup or particular backups.
NB.
NB. OBJECTS ARE NOT DEFINED IN LOCALES for the simple reason that
NB. backup fetches may return many versions of the same object.
NB.
NB. Only put  dictionary backups  are searched there is no backup
NB. path.  Also,  there is no corresponding  (bput)  because  the
NB. files  read  by (bget)  are backups that, once  created,  are
NB. never altered by JOD.
NB.
NB. Also,   certain  objects  are  not  fetched,  name   classes,
NB. timestamps and sizes.
NB.
NB. monad:  bget blcl
NB.
NB.   NB. collect from must current backup
NB.   bget ;: 'shawn of the dead'
NB.
NB.   NB. collect objects from particular put dictionary backups
NB.   bget <;._1 ' us.12 poor.10 little.08 words.08 lastback'
NB.
NB.   NB. get many versions of a word
NB.   bget <;._1 ' me.12 me.09 me.08 me.02'
NB.
NB. dyad:  ilCodes bget bluu
NB.
NB.   5 bget ''     NB. dictionary document from last backup
NB.   5 bget '.12'  NB. dictionary document from particular backup
NB.
NB.   2   bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group
NB.   2 1 bget <;._1 ' gfoo.12 gfoo.05 gfoo.00'  NB. three versions of a group's header

WORD bget y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

ok 'NIMP bget' return. NB. NIMP out for now

NB. NIMP are the requested backup names valid?
NB. NIMP are the requested backups present?

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (WORD,0) bgetobjects__ST y
    case. EXPLAIN  do. WORD bgetexplain__ST y
    case. DOCUMENT do. WORD bgetdocument__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) bgetobjects__ST y
    case. EXPLAIN  do. TEST bgetexplain__ST y
    case. DOCUMENT do. TEST bgetdocument__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. HEADER   do. GROUP bgslist__ST y  
    case. DEFAULT  do. GROUP bgetgstext__ST y
    case. EXPLAIN  do. GROUP bgetexplain__ST y
    case. DOCUMENT do. GROUP bgetdocument__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. HEADER   do. SUITE bgslist__ST y
    case. DEFAULT  do. SUITE bgetgstext__ST y
    case. EXPLAIN  do. SUITE bgetexplain__ST y
    case. DOCUMENT do. SUITE bgetdocument__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) bgetobjects__ST y
    case. EXPLAIN  do. MACRO bgetexplain__ST y
    case. DOCUMENT do. MACRO bgetdocument__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. bgetdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

checknttab3=:3 : 0

NB.*checknttab3 v-- checks all three (name,[class],text) tables.
NB.
NB. monad:  checknttab3 bt

if. 3 = cols=. {:$y do.  
  NB. there are two species of three column tables - words 
  NB. and macros - distingquished by the codes in column 1
  if. ((i. 4), MACROTYPE) badblia 1 {"1 y do. jderr ERR014
  NB. macro codes start at 21 much higher than J name class codes
  elseif. 3 < <./ ;1 {"1 y do.
    MACROTYPE checknttab2 y
  elseif. do.
    (i. 4) checknttab2 y
  end.
elseif. 2 = cols do.
  NB. two column tables 
  checknttab y
elseif.do. jderr ERR014
end.
)

compressj=:3 : 0

NB.*compressj v--  removes  all  white  space  from  J words  and
NB. shortens local names. This process reduces the readability of
NB. code and should only be applied to production code.
NB.
NB. monad:  cl =. compressj ct
NB.
NB.   compressj jcr 'verbname'
NB.
NB.   NB. call in object context
NB.   compressj__UT__JODobj jcr_ajod_ 'compressj_base_'

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. check for presence of obfuscation tag
if. o=. 1 e. OBFUSCATE E. ,y do.
  NB. local names less J arguments
  l=. ;(<1;1){m
  l=. l -. JARGS__MK
else.
  NB. local names less any single char names
  l=. ;(<1;1){m
  s=. l #~ 1 = #&> l
  l=. l -. s
end.

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

if. o do.
  NB. form obsfucated name replacements - drop trailing _ in (NAMEALPHA)
  bnr=. (<:#NAMEALPHA)&#.@((}:NAMEALPHA)&i.)^:_1
  r=. ' ' -.~ ,'/' ,"1  (>m) ,"1 '/' ,"1 OBFUSCPFX ,"1 bnr (#m)?OBFUSCCNT   
else.
  NB. form replacements from any remaining chars !(*)=. SHORTNAMES
  NB. J arguments m n x y u v are not on SHORTNAMES
  if. 0=#r=. SHORTNAMES -. ,&.> s do. u return. end.
  if. (#r) < #m do. 
    NB. we have more replacements than available SHORTNAMES
    NB. form base (#r) numbers using SHORTNAMES digits
    bnr=. (#r)&#.@((;r)&i.)^:_1
    r=. r,<"1(#r) }. bnr i. #m
  end.
  r=. ; '/' ,&.> m ,. (#m) {. r
end.

NB. replace tokens
r changetok u
)

createjod=:3 : 0

NB.*createjod  v--  dictionary  object  creation verb. (y)  is  a
NB. dictionary object locale reference. This verb initializes  an
NB. (ijod) locale user interface for the JOD system.  and creates
NB. all necessary subobjects.
NB.
NB. monad:  paRc =. createjod ba
NB.
NB.   JD=: conew 'ajod'
NB.   createjod__JD JD

NB. set default master, profile and user if they don't exist
if. -.wex <'JMASTER' do. JMASTER=:jodsystempath 'jmaster' end.
if. -.wex <'JODPROF' do. JODPROF=:jodsystempath 'jodprofile.ijs' end.
if. -.wex <'JODUSER' do. JODUSER=:jodsystempath 'joduserconfig.ijs' end.

NB. set J version number
JVERSION_ajod_=: (jvn :: _9:) ''

NB. create master file if necessary
if. -. fex <JMASTER,IJF do.
  if. badrc mdat=. createmast JMASTER do. mdat return. end.
end.

NB. execute any user script - allows for redefintions of various
NB. class nouns before JOD objects are created - joduserconfig.ijs
NB. is not installed and must be created by users
if. fex <JODUSER do.
  NB. attempt execution of script - obfuscate names (/:)=: 
  if. (_9 -: ((0!:0) :: _9:) <JODUSER){0 1 do. (jderr ERR026),<13!:12 '' return. end.
end.

NB. initialize master dictionary parameters - used when
NB. creating directory objects to insure that all master
NB. parameters are set in directory objects - this amends
NB. the "jod" class to exploit inheritance in all derived classes
if. badjr mdat=. jread JMASTER;CNMFPARMS do. jderr ERR006 return. end.
MASTERPARMS_ajod_=: > mdat

NB. extension objects and complete (ijod) interface (*)=. JODEXT IZJODALL
JODEXT=: 0$a:
IZJODALL=: IzJODinterface,<'JODobj'

NB. create storage, scratch, maker and utility objects !(*)=. JOD ST SO MK UT
JOD=: y
ST=: conew 'ajodstore'
MK=: conew 'ajodmake'
UT=: conew 'ajodutil'

NB. empty classless object - must see ijod
SO=: cocreate ''    
('ijod';'z') copath ;SO

obs=. JOD;ST;MK;UT;<SO

NB. initialize objects - they need to know each other
createst__ST obs
createmk__MK obs
createut__UT obs

NB. create direct _n_ (ijod) locale interface - if the (ijod)
NB. trap word (jodsf) exists define an error trapping interface
".&.> y defzface IzJODinterface

NB. attempt to create J temp directory ignoring errors
NB. required for JOD edit utilities and not always present on J systems
makedir <jpath '~temp/'

NB. execute any master dictionary profile script
if. fex <JODPROF do. (_9 -: ((0!:0) :: _9:) <JODPROF){1 0 else. 1 end.
)

ed=:3 : 0

NB.*ed v-- edit dictionary objects.
NB.
NB. (ed) typically fetches, formats and places object(s) in an edit window.
NB.
NB. monad:  ed cl|blcl|bt
NB.
NB.   ed 'wordname'
NB.
NB.   ed ;:'many words mashed into one edit script
NB.
NB.   NB. edit contents of (name,value) and (name,class,value) tables
NB.   ed ; }. 0 10 get }. dnl 're'
NB.   ed ; }. 4 get }. 4 dnl 'build'
NB.   
NB.   NB. place many backup versions in edit window
NB.   ed ; }. bget <;._1 ' word.12 word.11 word.09 word.02'
NB.   ed ; }. 4 bget <;._1 'macro.9 macro.7 macro.2'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. 2=#$ y do. 
  if. badrc uv=. checknttab3 y do. uv return.
  elseif. 3 = {:$ uv=. rv uv   do.
    if. 3 >: <./ jc=. ;1{"1 uv do.
      NB. convert binary nouns to linear representations
      jc=. I. 0=jc
      if. badrc nv=. 0 nounlrep__MK jc{uv do. nv return. end.
      uv=. (rv nv) jc} uv
      NB. format words for editing
      text=. _2 }. ; (0 {"1 uv) ,. (<'=:') ,. (2 {"1 uv) ,. <2#LF
    else.
      NB. format non words for editing
      text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF 
    end.  
  elseif.do.
    NB. format non words for editing
    text=. _2 }. ; ({:"1 uv) ,&.>  <2#LF
  end.
  NB. set default object name - if there is more than one 
  NB. object reset (x) to prevent affixing document command  
  oname=. ;0{0{uv [ x=.  1 < #uv 	
elseif. badrc uv=. x obtext y do. uv return. 
elseif.do. 
  'oname text'=. }.uv 
end.

NB. undocumented and seldom used feature - removed unless someone complains
NB. if. wex <'EDLOCALE' do.   NB. !(*)=. EDLOCALE
NB.   NB. set up to define objects into specified locale if requested
NB.   pfx=.'18!:4 <''',EDLOCALE,''' [ CRLOC_ajodutil_=: 18!:5 '''' '
NB.   sfx=. '18!:4 CRLOC_ajodutil_'
NB.   text=. pfx,LF,LF,text,LF,LF,sfx
NB. end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',oname) changestr DOCUMENTCOMMAND_ijod_
end.

oname et text
)

getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)

lg=:3 : 0

NB.*lg v-- make and load JOD group.
NB.
NB. (lg) assembles and loads  JOD group  scripts. The monad loads
NB. without  the  postprocessor  and  the  dyad  loads  with  the
NB. postprocessor.
NB.
NB. monad:  lg clGroup
NB.
NB.   lg 'groupname'  NB. no postprocessor
NB.
NB. dyad:  uu lg clGroup
NB.
NB.   2 lg 'group'    NB. no postprocessor
NB.   lg~  'group'    NB. postprocessor

NB. (/:)=: obfuscate names
2 lg y
:
if. x-:2 do.
  NB. 2 _2 make assembles entire group script
  NB. with preamble regardless of where the
  NB. group appears on the JOD path
  msg=. OK00404 NB. okmsg: group loaded
  t=. 2 _2 make y
else.
  msg=. OK00405 NB. okmsg: group loaded with postprocessor
  t=. 2 mls y
end.
'r s'=. 2{.t
if. r do.
  curr=. 18!:5 ''   NB. current locale
  18!:4 <'base'     NB. run script from base
  try. 0!:0 s
  catchd.
    18!:4 curr      NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  18!:4 curr        NB. restore locale
  ok (y),msg
else.
  t
end.
)

loadwords=:4 : 0

NB.*loadwords v-- loads dictionary words into target locales.

DL=. {: y  NB. obfuscate (/:)=: directory object !(*)=. DL

NB. NIMP GETFACTOR not used yet
NB. read words and determine name class
if. badjr wu=. jread WF__DL;x{WORDCN__DL do.
  jderr ERR088  NB. errmsg: read failure
else.
  bu=.   0 ~: ; 1&{&> wu
  loc=. >{. y  NB. target locale

  NB. define words that are not nouns
  NB. NIMP may be able to speed things up by switching
  NB. to target locale in top of script and then switching
  NB. back to current - eliminates need to hard wire target locale
  NB. to each word.

  try.
    if. #vu=. bu#wu do.
      0!:0  ; (({.&> vu) ,&.> <loc,'=:') ,&.> ({:&> vu) ,&.> <LF
    end.

    NB. define nouns
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)

nounlrep=:4 : 0

NB.*nounlrep v-- converts nouns stored as binary  to linear  text
NB. representations. Uses  a  scratch locale to temporarily define
NB. nouns.
NB.
NB. dyad:  iaNoex nounlrep bt

if. #y do.
  clearso 0
  names=. (errnames=. {."1 y) ,&.> locsfx SO  NB. !(*)=. SO
  try.
    (names)=: (3!:2)&.> {:"1 y
    names=. (5!:5@<)&.> names
  catch. (jderr ERR016),errnames return. end. NB. retain scratch on failure
  if. x do. names=. names ,&.> LF end.
  y=. names (<a:;2)} y
  clearso 0
end.
ok <y
)

obtext=:4 : 0

NB.*obtext v-- assembles and returns object text
NB.
NB. dyad:  bt =. iaObject obtext blcl

if. badrc text=. checkopen__ST y do. text return. end.
select. x
case. WORD do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. (WORD,NVTABLE) get y do. text return. end.
  if. badrc text=. WORD wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case. DICTIONARY do.
  if. badrc text=. DICTIONARY get '' do. text return. else. text=. rv text end.
  file=. (' ' -.~ ;0{0{DPATH__ST__JODobj),'_DTXT' NB. HARDCODE document text suffix
case. SUITE;GROUP do.
  if. badrc text=. (x,2) make y do. text return. else. text=. rv text end.
  file=. y -. ' '
case. TEST;MACRO do.
  if. badrc y=. checknames__ST y do. y return. else. y=. }.y end.
  if. badrc text=. x get y do. text return. end.
  if. badrc text=. x wttext__MK rv text do. text return. else. text=. rv text end.
  file=. >{.y
case.do.
  if. (<x) e. {(SUITE,GROUP);HEADER  do. 
    NB. group and suite headers are frequently edited
    if. badcl y do. jderr ERR0154__MK return. end.
    if. badrc uv=. ({.x) get y do. uv return. else. 'file text'=. , rv uv end.
  elseif. (<x) e. ,{OBJECTNC;DOCUMENT,EXPLAIN do.
    NB. get object documentation text
    if. badrc uv=. x get y do. uv return.
    else.
      NB. merge all document texts
      file=. >{.{. uv=. rv uv
      text=. ; ({:"1 uv) ,&.> <2#LF  NB. HARDCODE 2
     end.
  elseif.do.
    jderr ERR001 return. NB. errmsg: invalid option(s)
  end.
end.
ok file;text
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

rm=:3 : 0

NB.*rm v-- runs J macro scripts
NB.
NB. monad:  rm cl|blcl
NB. dyad:  pa rm cl|blcl

NB. (/:)=: obfuscate names
0 rm y
:
if. badrc uv=. MACRO get y do. uv return. end.
uv=. rv uv

if. *./um=. JSCRIPT = ; 1 {"1 uv do.

  scr=. ;({:"1 uv) ,&.> LF
  curr=. 18!:5 ''

  try.
    NB. run from base, (display default, suppress x.-:1) stop on errors
    18!:4 <'base'
    if. x-:1 do. 0!:100 scr else. 0!:101 scr end.
    18!:4 curr
  catchd.
    18!:4 curr  NB. restore locale
    (jderr ERR0256),<13!:12 '' return.
  end.

else.
  NB. errmsg: not J script(s)
  (jderr ERR0252),(-.um)#{."1 uv
end.
)

rtt=:3 : 0

NB.*rtt v-- runs J test scripts
NB.
NB. monad:  rtt cl|blcl
NB.
NB.   rtt 'runmytautology'
NB.   rtt ;: 'run these tautology tests in order'
NB.
NB. dyad:
NB.
NB.   0 rtt 'tautology'
NB.   1 rtt 'silenttautology'
NB.   2 rtt 'plaintest'
NB.   3 rtt 'suite'   NB. make and run tautology test suite
NB.   4 rtt 'suite'   NB. make suite and run silently

0 rtt y
:

NB. HARDCODE: option codes (/:)=: obfuscate names
if. (3-:x) +. 4-:x do. 
  if. badrc uv=. (SUITE,_2) make y do. uv return. end.
  scr=.rv uv
  x=. x-3 NB. run option
else. 
  if. badrc uv=. TEST get y do. uv return. end.
  uv=. rv uv
  scr=. ;({:"1 uv) ,&.> LF
end.

curr=. 18!:5 ''

NB. run from base, (display default, suppress x-:1), stop on errors
18!:4 <'base'
try.
  if. 0-:x     do. 0!:2 scr
  NB. Note: silent execution that fails suppresses all output
  elseif. 1-:x do. (] [ 1!:2&2) 0!:3 scr 
  elseif. 2-:x do. 0!:001 scr
  elseif.do.
    18!:4 curr
    jderr ERR001 return.
  end.
catchd.
  18!:4 curr
  (jderr ERR0256),<13!:12 '' return. 
end.

NB. back to original locale
18!:4 curr
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f(a21,U10+>t>t2]sh3+>u"u1,9t-2]sh/+>Yer0fC.01E\D,+>Y_p2BXb1+?:Q'1E\\#1GL"4
+>l/%3?U+8+>GPm1GU(0+>beq0eje-1E\\#2DH=7+>Y_p1*A>.+>GPm1bp1/+>P_q3?U.6+?1K%
1*AIt1G^.5+>Ynu1*A>++>Y,p3ClS)6q(!dEc6)>+CT.u+EM[>FCcS.ART+\EZek1A7\>Y8l%ih
DKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GF<DuQATV[*
A8,q'ATDBk@q@)\H:gt$Bl8$(Eb8`iAQ)Po:..BG7!!HYDId0rA0>B#Eb-@c:IH=>DKKH1Amo1\
8U=!)7!*?cCi`3E6rZrX9N*&^BkhQs.3N>BFCfK)@:NjkGAhM4F!)SsH:gt$F`_>8FCfK)@:Nk`
De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]Tu
A79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk9gM-E:K1In7;ZICEc3(BAU&;>FEqh:F"AGE
AT23uA90dS8lJ)T8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q=117TEAS
5u^9k@V0b(@psIj+Dbt+@;I'#A7]Y#BkD'jEcW@F@:rA&7TEAS6V^Tu@;TQuDdm=$F(8X#Bl@l3
Ch[a#F<E.XBPD*mATAo:@;L'tF!,:1F)rI?Bkq9rGp%3I+Cf4rF(e?97TEAS:e"Q*@V0b(@psIn
Df-\6De!3l+DG@tDKKT)Bk;<-E,oN%Bm<TG;cHmc9he&SFCfN8+Dk\2F(&]m+EMa@FCSu,/Kcbj
Df-[O+E(k(@V97oEb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-Bk)7!Df0!(Gp$R)@r$4+F(8lp@r#t(
FCAW7@q]F`CNCV,Cht59BQ@Zq+=M,9D.P8&@r,RpF'U>=AU&;G+EV%$Ch7ZtDf'H6ATMp-Eb0*+
G%G_;@;Ka&GA(]4AKZ&5@:NjkAo_g,+A*c#DfTB0+CT.u+EM47Ecbl1F!,:;@ps0rDIIBnF(96%
@<?'qDe*Bm@ruF'DIIR2+E(_(ARfg)@rc-hFD5Z2+Eh=:@V'(]A8--.A8,OqBl@ltEd8dG@VTIa
FE;)+FDc2AFCB$*B4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E-#i.D..3k
+CT.u+Dbt)A0=K?6m-,_Dfp#8Ddd1#DfTB0Ci<`mF!,"-@ruF'DIIR2+EqaEA9/l-DKKe>FCB3&
ATT&2De!3lATMa-F`)#9AT2-tDK]T3FE8RBDfor=+EMXCEb/c(@<3Q#Bl7@"Gp%3I+Dbb0ARTU%
FCf]=+ED%4Eb0<'DKK</Bl@m1Ddmg"G][A8F(K2tCh7Z1@;]TuEb0?8Ec,q@DdmHm@rri8AU&<9
F`_&.Cij`;F`_[I@;Ka&FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mOD/sc:F!+'tD.-ppD]j+2
EbTK7F)lAEEcl8@+A*buATMr9F(96)E--.                                        ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)l^;+>P&o0H`A02)cX41*A>+1bp1.1*A>22_uR20H`))1,9t,0H`,-1,U17+>Gf00H`,*+>Y`4
0k,$:;f-GgAM>f567s`sDJW6gDeio<0HbHh/KcHNDJUaEG%#3$A0><$B6A'&DKI"BD/X3$+EV19
FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2
%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbmdT
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4
FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4
<$5+=5uL[1/I`$r$?:3,FCdTr-RU8h-7hD1/1)_l-RU?.-mO0`4utqW4XMO(-RU>l%13OO:-pQU
B4YslEaa'$+CT)&+E27?F(o*"AKZ/)Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$4R>`@q]jF
3ZpUIBeCMa+<XEG/g,4H@<,jk+E;O4Ch[KqATDi$$>OHg4ZX].+<YAN+>b2`:-pQU8g&=rEb$;1
@;TQu@r,RpEt&Hc$;No?+Eh10Bk/?&AS-$,.!R0`@<-"'D.RU,Et&IO67sB'+<X*hBk1dc+<Vdp
Bk)7!Df0!(GscL\ATJt:+<VdL+<X'd@ruF'DIIR26Z6LHF&QXYEarc*+<VdL+<Xa(Eb&*[@<,jk
8krf3AOC9BF)rHH+<VdL+<VdL9jqOPDc:4UEarcW@:O=rFEqh:%16o[Eb@Nr+=K?d/he^s/0H?'
+tt-86:s[6<),ef@;9^k?R[*K+=Jdf-r30%771$L6XO8:De*3(4*+nFE@E"]+=Jdf-nJFq;FFl#
C2[Wi.6DT\BQ6+J/g)u"+=nW`/:/cr9gM-E:L@OFDe*3(4*+nFEB?l\6W-]Z=\qOo@;9^k?RZEk
%15is/g,=GCh[E&EbT0"F<DuW.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+<VdLASlC.Gp"5=@:O(q
E+<d-+<Ve8Ci!g'@UWb^F`8HGD..NrBQ@ZoASuT4+<YN0FCSuuDIR$aCNXS*$?BQqB0A9u-RU#Z
4!5Xn/ghba+<VdL+?L\n/n8gBDKI6K4!5Xg-Z3@0ALATC+<VdL4!5ng@;TR.@rHL-F=.M)%15is
/g+bEEc#6,F!+n-C`mn0Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+=BoN/g)Ma/0Zek
+?Lc%+<iin/j:C4+>=on+F>:e+<Wij-p/k"@W$!)-Rg/h+A=g=0d&"iHQX_!Cgh?s.3L/a4E5L^
FCcdO4s4lSEb>gg%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<
DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&@;^?5@UWb^F`;CE%15Ks
4ZX^43dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@EZd\794)$o9IqP@/no'4
-OgCl$;No?+CfG'@<?''FD,]+AKYGj@r$4+Et&I?0RIbI@r#Tt-Zip@FD>`)0II;:4tq>&@:O(`
+=D8BF*)/8A2#A?$9g.jE+*6lA0<7AATMs.De(OL%13OO%15is/g)9GDJUFC-OgCl$;No?+<Y-2
C`k)X-OgDH0RI8HC`k)X-Qij*1a"q(,@YP,-S?bU$4R>;67sB'@W$!)-SAnIF`):K%15is/g)9G
DJUFCDIIBn-OgDX67sB'@W$!)-Z3@0AM.J2F`):K%13OO:-pQU0HahBC`k)Q%13OO:-pQU0HahB
C`k)X-OgD2@W$!)-S?bq+>#Vs0HahBC`k)X-OgCl$;No?+>=pIDJUFC/n8gBDKI68$;No?+>=pI
DJUFCDIIBn-OgDX67sB7+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+C]5)+=ANG$4R>;67sB8+C]5)
+=Ach%14LmDJUFC/gi(j/NP"/+C]5)+=Ach%13OO:-pQU0d'qCC`k)X@rHL-F=.M):-pQU0d'qC
C`k*C@;TR'%15is/g)kk@W$!)-Z3@0AM.J2F`):K%15is/g)nl@W$!)-RT?1%15is/g)nl@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)+=AdODfor>-OgDX67sB9+C]5)
+=D&8D.P(($;No?+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>Y-LDJUFC-OgCl$;No?+>Y-LDJUFC
/gh)8-t7(1+=Ach.3L3'+>Y-LDJUFC/gh)8%15is/g)qm@W$!)-SAnIF`):K%15is/g)qm@W$!)
-Z3@0AL@oo:-pQU1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a$7FC`k)Q%13OO:-pQU1a$7FC`k)X
-OgD2@W$!)-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68$;No?+>b3MDJUFC
DIIBn-OgDX67sB;+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl$;No?+>=om+C]5)
+=Ach%14LmDJUFC/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X@rHL-F=.M):-pQU
0H`(m@W$!)-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*C%DC`k)Q%13OO
:-pQU0H`+n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?+>=on+C]5)+=AdO
Dfor>-OgDX67sB7+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo
+C]5)+=ANG$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)+=Ach%13OO:-pQU
0H`.o@W$!)-SAnIF`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU0d&1n@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n@W$!)
-S?bU$4R>;67sB8+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P(($;No?+>Fun+C]5)
+=D&8D.P>0Dfor>-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j
/NP"/+>P'KDJUFC/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0AL@oo
:-pQU0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>-OgDX67sB8+>Y-L
DJUFCDIIBn-OgDX67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)+=ANG$4R>;67sB9
+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o@W$!)-SAnIF`):K
%15is/g)nl0d'qCC`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1*A=p@W$!)
-RT?1%15is/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9+>P'K
DJUFC/n8gBDKI68$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX
67sB9+>Y-LDJUFC-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC/gh)8
%15is/g)nl1E^.EC`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)-Z3@0
AM.J2F`):K%15is/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$
0d'qCC`k)X-OgCl$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFCDIIBn-OgDX67sB:
+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'KDJUFC/gh)8-t7(1
+=Ach.3L3'+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is/g)qm1*C%DC`k*C
@;TR'%15is/g)qm1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1%15is/g)qm1E^.E
C`k)X-OgD2@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC/n8gBDKI68$;No?
+>Y,r+C]5)+=D&8D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>G!JDJUFC-OgCl
$;No?+>b2q+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is/g)tn0d'qCC`k)X
@rHL-F=.M):-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*C%DC`k)Q%13OO:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl$;No?
+>b2r+C]5)+=AdODfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'KDJUFCDIIBn/n8gB
DKI68$;No?+>b2s+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+C]5)
+=Ach%13OO:-pQU1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'%15is/g)tn1E^.E
C`k*C@;TR.@rHL-F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahBC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`(m0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68$;No?+>=om+>=pI
DJUFCDIIBn-OgDX67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun+C]5)+=ANG$4R>;
67sB7+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO:-pQU0H`(m0d'qC
C`k)X@rHL-F=.M):-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)-Z3@0AM.J2F`):K
%15is/g)hj0d&4o@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&4o
@W$!)-S?bU$4R>;67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)+=D&8D.P(($;No?
+>=om+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?+>=om+>Y-LDJUFC
/gh)8-t7(1+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)-SAnIF`):K%15is
/g)hj0d&7p@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0HahB
C`k)Q%13OO:-pQU0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl$;No?
+>=on+>=pIDJUFC/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7+>P&n+C]5)+=D&8
D.P>0Dfor>-OgDX67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach%14LmDJUFC/gi(j
/NP".+>P&o+C]5)+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU0H`+n0d'qCC`k*C
@;TR'%15is/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)-RT?1%15is/g)hj
1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7+>P&p+C]5)+=AdO
Dfor>-OgDX67sB7+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn/n8gBDKI68$;No?
+>=on+>Y-LDJUFC-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>Y-LDJUFC
/gh)8%15is/g)hj1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU0H`+n
1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o0HahBC`k)X-OgD2
@W$!)-S?bq+>#Vs0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gBDKI68$;No?+>=oo
+>=pIDJUFCDIIBn-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)+=ANG
$4R>;67sB7+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach%13OO:-pQU0H`.o
0d'qCC`k)X@rHL-F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0AM.J2
F`):K%15is/g)hj1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!
1E\Fq@W$!)-S?bU$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q+C]5)+=D&8D.P((
$;No?+>=oo+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo+>Y-L
DJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir@W$!)-SAnIF`):K
%15is/g)hj1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq
1,0n\DJUFC-OgCl$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)+=Ach
%13OO:-pQU1a"Lq1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Lq
1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn0d&5,+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)-SAnIF`):K%15is
/g)tn0d&5,+C]5)+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5-
+C]5)+=ANG$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC/gh)8
%15is/g)tn0d&5-+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'%15is/g)tn0d&5-
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X@rHL-F=.M):-pQU
1a"Lq1,L+_DJUFCDIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,U1`
DJUFC-OgCl$;No?+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach%13OO
:-pQU1a"Lq1,U1`DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq1,U1`
DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnIF`):K%15is/g)tn
0d&50+C]5)+=D&8D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&51+C]5)
+=ANG$4R>;67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8%15is
/g)tn0d&51+C]5)+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is/g)tn0d&51+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2q+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU1a"Lq
1,pCcDJUFCDIIBn-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,0n\DJUFC
-OgDX67sB;+>P&p0d'qCC`k)X-OgDX67sB;+>P&p0d'qCC`k)X@rHL-F=.M):-pQU1a"Or1,0n\
DJUFCDIIBn-OgDX67sB;+>P&p0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,9t]DJUFC-OgDX
67sB;+>P&p1*C%DC`k)X-OgDX67sB;+>P&p1*C%DC`k)X@rHL-F=.M):-pQU1a"Or1,9t]DJUFC
DIIBn-OgDX67sB;+>P&p1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,C%^DJUFC-OgDX67sB;
+>P&p1E^.EC`k)X-OgDX67sB;+>P&p1E^.EC`k)X@rHL-F=.M):-pQU1a"Or1,C%^DJUFCDIIBn
-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,L+_DJUFC-OgDX67sB;+>P&p
1a$7FC`k)X-OgDX67sB;+>P&p1a$7FC`k)X@rHL-F=.M):-pQU1a"Or1,L+_DJUFCDIIBn-OgDX
67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,U1`DJUFC-OgDX67sB;+>P&p2'?@G
C`k)X-OgDX67sB;+>P&p2'?@GC`k)X@rHL-F=.M):-pQU1a"Or1,U1`DJUFCDIIBn-OgDX67sB;
+>P&p2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,^7aDJUFC-OgDX67sB;+>P&p2BZIHC`k)X
-OgDX67sB;+>P&p2BZIHC`k)X@rHL-F=.M):-pQU1a"Or1,^7aDJUFCDIIBn-OgDX67sB;+>P&p
2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,g=bDJUFC-OgDX67sB;+>P&p2]uRIC`k)X-OgDX
67sB;+>P&p2]uRIC`k)X@rHL-F=.M):-pQU1a"Or1,g=bDJUFCDIIBn-OgDX67sB;+>P&p2]uRI
C`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,pCcDJUFC-OgDX67sB;+>P&p3$;[JC`k)X-OgDX67sB;
+>P&p3$;[JC`k)X@rHL-F=.M):-pQU1a"Or1,pCcDJUFCDIIBn-OgDX67sB;+>P&p3$;[JC`k*C
@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\DJUFC-OgDX67sB;+>Y,q0d'qCC`k)X-OgDX67sB;+>Y,q
0d'qCC`k)X@rHL-F=.M):-pQU1a"Rs1,0n\DJUFCDIIBn-OgDX67sB;+>Y,q0d'qCC`k*C@;TR.
@rHL-F=.M):-pQU1a"Rs1,9t]DJUFC-OgDX67sB;+>Y,q1*C%DC`k)X-OgDX67sB;+>Y,q1*C%D
C`k)X@rHL-F=.M):-pQU1a"Rs1,9t]DJUFCDIIBn-OgDX67sB;+>Y,q1*C%DC`k*C@;TR.@rHL-
F=.M):-pQU1a"Rs1,C%^DJUFC-OgDX67sB;+>Y,q1E^.EC`k)X-OgDX67sB;+>Y,q1E^.EC`k)X
@rHL-F=.M):-pQU1a"Rs1,C%^DJUFCDIIBn-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Rs1,L+_DJUFC-OgDX67sB;+>Y,q1a$7FC`k)X-OgDX67sB;+>Y,q1a$7FC`k)X@rHL-
F=.M):-pQU1a"Rs1,L+_DJUFCDIIBn-OgDX67sB;+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M):-pQU
1a"Rs1,U1`DJUFC-OgDX67sB;+>Y,q2'?@GC`k)X-OgDX67sB;+>Y,q2'?@GC`k)X@rHL-F=.M)
:-pQU1a"Rs1,U1`DJUFCDIIBn-OgDX67sB;+>Y,q2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs
1,^7aDJUFC-OgDX67sB;+>Y,q2BZIHC`k)X-OgDX67sB;+>Y,q2BZIHC`k)X@rHL-F=.M):-pQU
1a"Rs1,^7aDJUFCDIIBn-OgDX67sB;+>Y,q2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,g=b
DJUFC-OgDX67sB;+>Y,q2]uRIC`k)X-OgDX67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs
1,g=bDJUFCDIIBn-OgDX67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC
-OgDX67sB;+>Y,q3$;[JC`k)X-OgDX67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCc
DJUFCDIIBn-OgDX67sB;+>Y,q3$;[JC`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eX
D/X3$3B9*,@rH4'C/\tfCLo1R:-pQ_@rH4'C/\tfCLo1R+ET1e+EV19F<DuADf'H..3NM:D.Oi.
@V0b(@psInDf.0:$;No?%15is/g+5/ASrW4BOr;/F*)G:DJ((?001OF3ZoPRE,]AsEcW?GBl5%9
@3A/b+EqaEA0<!C@rH4'C+19LBl%Sp$;No?+E(_$F`V&$FCcS'DL!?ICi<flC`mV(D.Rc@+AZHY
F`V&$FCeu*DIIBnF!)T7AS5^p+<YlBFD)e=BOqV[:-pQUE,oN%Bm:aC-r30!<Du7]7T_)^+CT.u
+<Ve<DIak4GA2/4+<Y]5DId[&+<Y-%F(HI::-hTC5tk*G5n+/r67sC%F_56"G\(q=+<Y04DKKo;
Ci!Zn+<Y-=+<W(.6:OsR6UOUJ.4u_c+@p3ZBOu3,+<Yi9Cis<1+<YT7%15is/g)Q<6:OsR6UOUJ
.3N87DImisFCcS2Df03!EZee.A0>]"F)rI?Bkq9rGp%3I+Cf4rF(c\6@;TRs/e&._67r]S:-pQU
G%G]'@<?4#3XlEk67r]S:-pQU+<WBf+CT>4F_t]2+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#GT
AU%p1FE7lu:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]g
Cb[jX$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$9g.jDe't<FCfN8C2[W:-QlV91E^UH+<W$Z%13OO:-pQU@q]:k@:OCj
EZfI4@VfTuEb031ATMF#FCB9*Df-\9Afth2GAhM4F"AGD@;Ka@+<YE/EZc`QATD6-%16i[E]lHf
3Zq]i/mg=U-o!E&@4iuO/0J.X+>k<'2'>!j$4R>;67sBkAS,XoAKZ28Eb$;:Bln#2Ddm=$F(8X#
Bl@ku$?'BcF`V&$FCf<#0KhH>1E\_$0F\@a67sB/001OF3Zr?MAp&0)@<?''Ci<flC`mV(D.Rbt
$7BY.@ps1p+EV:*F<G4-F<Gd=Bl[`34Y@k&%16]cEaO!.De*c=+F,)?D_;J++<YK=@ps1p%144#
G@bK/A.8kg+DDr]/g)BTDe!3lEt&I!+Enqk/g+j;$>"*c/e&.:%13OO:-pQUCi<flC`m\5@;0U%
DIIBnEt&ImDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D):Ap&0)@<?'tAM@IW5s]R/
DeioE3B:Fo%13OO:-pQUF*)>@AKY])+Co1rFD5Z2@<-W&$>"6#FDYu5Ddso/F`\`RDdm=$F(8X#
ASl!4-OgCl$;No?+ED%%A0>>i@r!2qDIal#AS,XoAKZ22FD)e8@V0b(@psIjA0>buD.Rbt$8EZ-
+>=s"0JG4(>9H!^HXgu2E,$LCDdm=$F(8X#ASl!4-OgCl$;No?+Dbt+@;I')@V0b(@psIjA0>bu
D.Rbt$?'fjD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2
AN;b2?RH9i%14L.Df0!#ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::@;TRs+=o,fDf0!#
ATJ:f%17/iDfTr2DJ`r=4ZX]A+?CW!%14J!De!3lF!,R<@<<W)ATT&=ASH0q-Ts()Gmt*mDfT3.
Df90)/g,E^A8a(0$6UI-De!3lEt&I!+EqC2Eb#Ud+<YA@4Y@j%Ci<flCi^$m+<YkN4Y@jk%16Za
A1e;u.1HUn$;No?+Dbt+@;I'*Cgh$q+DtV)ATJ:fCi3ZuATL!q+?Lu60fq*=+F>4m+>G!c+>GSn
B5DKqF!)iOBQ%p5ASu?r0OI+36$$m]CLoLd3F=-C$4R>;67sC%FDl22+DG^9A8,OqBl@ltEd8*$
ATAo8D/a<0@j#`5F<DrPBQ%p5ASu?r0II;:%15is/g,1G@:UKi@:O'q@;]TuA7]@eDIj7a0d'[C
0HiJ20JO\S+?M<)@rH4'C*4mFBQ%p5ASu?r0II;:%15is/g+tK@ps0rF(fK4F<GI0D.Rbt$?L)n
D.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/@WNY>F(fK4FCf?,AM@IW5s]R/DeioE3B:Fo%13OO
-mNeN@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0BQ&*6@<6K4Ci3ZuATJtF/g,4Q@;TRs%13OO%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?97D/a5gD/X3$0JQ<h/h1@LD/a5gD/X3$0JO\l/M/(n@rH4'
C+19K@;KXg+CT;'F_t]-F<GXADeio,FCfN8F"Rep67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf
+=M>CF*)/8A2#GTA8,OqBl@ltEd8!e67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YE
ART[lA3(hg0JG2%AT0=X$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0emQaFttirF`:l"FCeu*AoD]48l%ht0J5@<1b/o.
67sB82/78M1,0nlAStpnARloqEc5e;-t@14E,%^JF(o,5+CT.u+CSeqF`VY9A0>K&EZdss3%cmA
$;No?+<VdL+<VdL+CT.u+Dtb7+=M;JDeio8@UX=l@k;G)EbAr7F*)G6F)rmBEclG:.3N_DF*),6
B-;5+B5)3o$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I$=e!g
DKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=5uL[1
/IDi,ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;$>"6#De't<FCfN8C2[W:-OL2U67sBpDKBB0
F<GXCD.Oi2FCB&t@<,m$GAhM4F!,RC+Cf>,E,oN2EsbTZDJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]
E+M0n+>Y-$+>=-0@W-0-4Y@jtARTCkH#.D:B5V-pATM9tDJsf;AKX,g+EV:.H!t`)@<6^2E--#8
+?_>"0FD`1AU%crATMp,G%G`:@;]UaEb'564Y@jdDf5siFD,*)@<,pfF(A]r@:s:lB45k!Df^#/
DId0rA79RgCht4W/g+VAD]gMPGmXm+<(02H:K:=9;,pCk7787n5tsdH+@/mo+@/\":EW#&<DGnP
7787d:KL:=+?_>"@W-/l$7A>;:I7?@;]nM26VLKJ778Ld3ZqmMD[Ip#$>"6#FDYu5Ddso/F`\`R
9Q+f]:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo-OOm(+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lP
ATL.XAQ!)JCi"Af@<,mXDcD"$AL@g>+Bot0D/XQ=E-67FFEhm7$?Km!EcaH*+>Y-$+>=-t67sBu
@;TRs+CT)&Eb/ZiGp%$CAKYJr@<*JB+Du+>+Cf(nDJ*Nk$=Q(MGm\g[/n#kP+>O:M4YC.c.Nj!Z
.Nj!D.1-DnEZfI@E,9H&+E2IF+=D5DDfTqI$?BW!>9G;6@j#l<F=044@rH4'C*4mFBQ%p5-OMRN
>9J!(Dfp/@F`\aJG]X9"$?'BgARfh&AS-!H3Zp4$3Zp*`Bjkjc?Z0CgARfgF/g,E^:-pQUA8`T.
Dfd+3Df'H6ATMo8DdmHm@ruc!Ci=B:?XIMb?XI_\C1Ums?XI;]DJ"$4Bl@lP/g)nV$=mjkARfgh
G^+I?4Y@k&+AP6U+CoC5DJsV>@rH4'Eb0<5+Dbt+@;KLr$7Q;hATAo8D/a<0@j#`5F<DrL@VTIa
FE1r)F!h<8@j"tu-ZW]>FEhmT4Z[(kD/a54-Z<I/ARfh&AS-!2$8EZ-+EMC<F`_SFF<G[MF:&@f
Ci<ckCiX*!F$2Q?+?CW!$>40n@UX(o+=\LBEb-@C+Du+>+=\LDDf'H6ATMp(A0<?EGmYu-$>"6#
FDYu5Ddso/F`\`RB5DKq@;KsqAof=,Eap4r+=D2>+EVjM-TsL5@rH4'C*4m:Ci<ckCiX*!F!h;L
+Bot0D/XQ=E-67FFEhm7$4:<T@r,RoARojlDfB9/4ZX]B+?CW!$49Np/g+\9@r,RoARlp)@rH<t
F!+n3AKZ)5F^o*1+DtV)ATJu&DIakuEb,SQ67sBlG[kQ4A7]9oAo_g,+EV:.+Cf>,E,oN2F(oQ1
+E2@>@qB_&$4:]pATDg*A7[nbB5DKq@;L!J3ZrYi+AP6U-n6Z//g,(UATDg*A7ZlrCi<ckCi]pj
@W-0J/nf0A4YChpD`o]q0d%S]+<Ve%67sB/.OdMA+C]8-+D>\3+EVO?$4:B`EaN]mD.Rc@+F,)?
D_;A>+<Ve9Df6aJ+DtV)ATM3mDId='+<XEG/g+kFE,95uBlkJ0DfRHQCi<flCi^_:Dfd+3BOPdk
ARl,j+<VdSG@_n0ATT&)Ecl80BOt]sDfp.EDe:,'G\M5@ASu!h-QkQ)+DtV)ATJtD+DtV)ATJ2i
DIb@,$>=?r+=\LZ$7Q;hATAo8D/a<0@j#`5F<DrAARfObEb/d&@rH<tF!h<8@j"tu-ZW]>FEhmT
4ZX]qDf'H.+=C]2@r,RoARojlDfB9/-OMRN>9J!(Dfp/@F`\aJG]X9"D/"6+A927!E+O)R3Zp4$
3Zp*`$;No?+Dbt+@;I'#F!+n4F(o9)ARlp"De!3l+CT.u+D5M/@UX'[:-pQUGA(Q*+CT/5+Dkh;
ARlp)@rH<tF!+n3AKYMpFCes(ARlp%DJXS*:-pQUGA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=
Ddmc:+ED%4DfTr@$;No?+CT.u+DG@tDKKT)Bk;?.D/"6+A0>r'DfB9/$4:Tf@ps1:/g,EHCi<fl
Ccsg%1*A%hCi<flC^MTu$>"6#FDYu5Ddso/F`\`RD/"6+A927!E+O)<$?BW!>9G;6@j#l<F=044
+Cf>,E,$LCD/"6+A927!E+O)<$8EZ-+EMC<F`_SFF<G[MF:&@bDf000F(Jm'@rH<tF$2Q,1E\_$
0FA.^67sBpAfu2/ATD?)@<,p%@;^?5DIIBn+Cf4rF)u&-Bk(RnBl@l3Ble?<ATJ2R67sBsBkq9&
@rH6sF`V,)+EM%2E+O)5Df0B:+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2:$;No?+EV:2F!,1<+EV:.
+ELt'ATMr9FD,B+B-;;7+CoCC+<XWsAKWC6Ci<d(.1/g:/g,=KEag/%ATVKnFE8R5DIal1AT2R.
FE8R7Df000F(Jl)A7]7e@<,duBl@m1/d_q\67sBiDf6b4F!,")@r,RoARlp"De!3l+CT.u+D5M/
@UX'q/Ke\E+D,>#F`M%#$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-$>=?r4YC2^D]gMPGp"5)
67sB/.OdMA+C]8-$7Q;hATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!h<8@j"tu-ZW]>FEhmT
4ZX]qDf'H.+=CZ;DJ"$4ARojlDfB9/-OL2U67sB4HW3F4<$5+>6UO:@;asb\I4Ye;Eb00.ASrVE
$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWBk1.ZDeio<0MXqe
.V*7(;f-GgAM>e\F=f'e-tI%&.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL+:SZQ67r]S
:-pQU+<WBf+EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'n
CggdhAISuA67sB'+>YGh;FNl>=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+3XlEk67sB'+<VdL.!0$A
FD>`)0J">gATMs.De(RR+EV19FD>`)0eb.$FCfN8C2[W;0JFpu%15is/e&._67sBhF`_;8E]P<c
8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(C9F(K;E0b"Ib67sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72e6K00f^@d
Df0`0Ecbl'+EVNEC,R[u1*B1b6k'Ju67sB80lCoQ0fU:uE+EC!ARloqDfQsm2_Rj=DKU15$;No?
+>G`gF_i`l+ED%2@;TRd+=Lc7A5d>`CLo1R.3N5CDf$UFA8,R@@<6-m0JG41+:SZQ67sB'+<VdL
+<VeIF`&=9DBN\:DJLA2De!3lAIStU$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2
+Eh=:@N[(0Bk/Y8BkM=%Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De't<FCfN8C2[W:-OgDoEZen,
A0<Q8$4R>;67sBuF_tT!EZf:4+Co1rFD5Z2@<-'nF!,C=+E1b2BHV/7F*&OA@<?!m%14g44Wksl
I4cXQBk/>?%13OOATAo3A0<rp-Zip@FD>`)0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!+?^hl
+FPjbA8,Qs0F\?u$>"6#FZhc.0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"F!,.-
@:Wqi%13OOATAnL+E(d54$"a2ATMs.De(OEFCfN8C2[W;0JFj`$>"6#FZhc.A8,QsINU<R$8Wef
+<r!`+E2%)CERa/$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWDJW6gDeio<0MXqe.V*F5;f-Gg
AM>e\F=f'e-tI43.3N\KDeio,FCfN8F"Rn/:-pQB$;No?+@BgR@r$-.+CT)&+<Yc>AKZ/)Ch[E&
+CT;'F_t]-F<D]9@<6"$+<YT7+<W(CDJUaS+<XF%D.Ra+F`S!!:-pQU,&Ut#Ebp"D@rHC.ARfg+
+DG_:@;KXg+Cei$ATJu&Eb-A%CiaM;FCfN8ARmD&$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?
+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JPG"F_ife%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I
+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&
F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%16Ze+E(d5-Zip@FD>`)0II;:%15is
/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&
AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUDf0B:+E2IF
+Co1rFD5Z2@<-W9BlbD8DBO%7AKYr#FD)*j1*A_&,@kM!+>=63%15is/g+\=@ruF'DIIR2+DGm>
ASlC.Gmt*7+?^hl4s2R&HQY!bA8Z3+-RT?10H`M$,<d5)+F>4c+CoA++=ANG$8<Sc+<s&m0d(fc
1*C+FC`k)Q%14d34Wkt5+>G!c+>Y-NDJUFC-OgD:+?^hl4s2R&HQY-fA8Z3+-RT?1%15is/g+kG
F(KB6+EMI<AKZ/-Eaj)!$?g;qD.RcO3ZoeZGB.4J+C]P8A2,39GB.4L+C]P8A2>SB$=\4"A2$/-
+?^/@@Wuj'0g.Q?/I`%rGB.4L4ZX]A+?CVmGT\IYGpa%.@Wuj'1HdcA0f'q5+=DCV/Kcek.Nj!a
%159QHZX+DCi<f+E-67F4$%P&@;TRs%13OO:-pQUBl8!'Ec`FFDf'&.DJsZ8Et&IoDIIBnF$2Q,
-Z4-KA2#-DGB.4K+DuCDA259FGB.4M+DuCDA2GYC$7ItsDJim"ATK:`3ZoguF_>N9+Cf>6@W-O5
-Rh,*BeCM`+>YH.-o!D?0eb%<-oa40,p5E0+>P3$2^pgNFZLmmDJ<U!A7Zm#AKYH&D^Pu$4tq>*
D/a<0@j#`5F<EY+DJim"ATJ:f%13OO-tI43+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBn
Et&I)0HanDC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f%14L;+>G!LDJUFC-Rg/i
3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2E,oN%Bm:'o-nlc!+CoA+
+=ANc+>#Vs0d&P#-p'J5DIIBnF"&4_+?MW%DIIBnF!)T#67sBlD/aTB+EqaEA0>T(AncK!$7ISN
1E^4GC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;6F_56"
GRXuh$7ISN0d("EC`k*7GB,&[+>#Vs0d&P#4$%P&@;TRs+<VdL+<VdL:-pQUGAhM4+E2@4AncK!
$7ISN1*C+FC`k)^-Rg/i3Zp."4!6UG-Z4-KA2GYV+<VdL+<VdL:-pQUGAhM4+DG_*Bm:'o-nlc"
+CoA++=C\S-Rg/i3Zp."4!6UG-Xq:?A2,3EGB.4K-QjO,67sC)DfTA2F*2),Bm:'o%16uaEZd%Y
0HanDC`k)Q+AP6U+E;O4Ch[KqATAo)EcQ)=Et&IoATAnI+>b3ODJUFC-OgE#ATAnI+>=ol+CoA+
+=ANG$4R=j0H`(m0HanDC`k)Q.3L3'+>G!#+?MW%DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3
Eb/isGT\DPDfor=.1HV40H`(m0HanDC`k*CGB.4N-Rg/i3Zp."4!6UG-Z4-KA2GYV:-pQUGAhM4
+E2@4AncK4-uNsGDK@69$7ISN1*A7nA8Z3+-ZW`R-Rg/i3Zp."4!6UG-Z4-KA2>SU+<XEG/g,@V
Eb$;,DJ!U-+=M,GF`)7L%14L;+>Y,o+CoA++=C\S-Rg/i3Zp."4!6UG-Z4-KA2,GS+<Ve%67sC)
DfTA2F*2),Bm:aKDJsZ8F"%P*%16uaEZd%Y1a"IpA8Z3+-ZW`F+<XEG/g,.V@;KXiBk;<-ATDg0
EcVZsDImi20H`1p1E^4GC`k*GA1&KB%16uaEZd%Y0H`.oA8Z3+-Z3iM%16uaEZd%Y0H`(mA8Z3+
-[0TLDJ(=+$>sEq+>=ol+>P'MDJUFC@:s"_DC5l#+:SZ+0H`(m1E^4GC`k)Q.3L3'+>G!#+?MW-
DIIBnF!)SJ+<VdL:-pQUASlC.Gp%<LEb$;3Eb/isGT\DXATD7$.1HV40H`(m1E^4GC`k*7GB.4M
-Rg/i3Zp."4!6UG-Xq:?A2>SU:-pQUGAhM4+E2@4AncK4.!B0B@WNt-$7ISN1*A@qA8Z3+-ZW`R
-Rg/i3Zp."4!6UG-Xq:?A2>SU+<XEG/g,@VEb$;,DJ!U-+=MDEEaj)=%14L;+>Y,r+CoA++=C\S
-Rg/i3Zp."4!6UG-Xq:?A2,GS+<Ve%67sC)DfTA2F*2),Bm:aKG%G]'F"%P*%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$$m]CLoLd3F??.;f-GgAM>f567sa!A5d>`CLo1R+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3
.3L$V@;TR,>@VJXF)tV<FCf]=.3KaT@:F%a%15is/g+_9Bln',B.aW#:-pQB$;No?+=Lf3.3N_D
F*)IGEb065Bl[c-D/XH++E_a:EZf(6FCfK9ASuU(Df-\>BOPd$D..=-+E)@8ATAnc:IGX!:-pQU
FCfN8F"SRX6$".kFD,5.+EV19FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeLF(KA7+EqO;A8c[5+<W(N
EX`@N67sBoH#R>8Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&
$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W&$;No?
%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ifn%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUBl8!'Ec`EPDg#]4GB.D>ALSaG
DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IcDf9H$Dg=K,+>=63Ao)BoFDYSP3Zp.;2]sCh59Ma)1*A=p
,To$)%15[?@<Q3LBOPpi@ru:&4ZX]5BQ&);D09?%+EqaBA0?)7F_kS2@3Bc4De'u#BQ[g#+Cf)-
@r!G$$=n't@VfUpCisfADJ*m+A3Dsr.lne<+=fJ^$=RdjATD="F?MZ--8#`7GA^i+ATL!q+?MV3
@W-1$@W-N7Ao)BoFDYS38SDOUAOC->Ea`I"ATAo(DfoN*AT2I.F*2A5Df9//@;TspEb'*1-OgDH
0RInYE,9H&+E2IF+Eq^3D.Rbt$9g.jF>,j=+>=om0Hb">F<GdF@;TRs%13OO:-pQUARoLs+EqaE
A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd(Z/KcDl
4"u#*DIIBnF!+[0ARloF0me!r%13OO:-pQUBl8!'Ec`FGATMs7+CT.u+CT.u+DkOsEc6".$9g.j
0d(FXF<DrQATMs%CiF&r0JFk9-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r
0JOq:-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r0JY";-Vcu\+DG_2De!^.
F!,R9G]Y;B$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'A_4#/NP-SZ_o+>G5Q$9g.j1a$a[F<DrJ@:O=r
@;Kmr@5'D`4#/NP-SZ_o+>G5Q$4R>+0RImr4ZX]?+D58-+EVL0D.RcO3Zri'+>G!LDJUFCFCfN8
@;Kmr@5'&<$4R>;67sBlA8--.FCfN8-uNI1ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$
@r!2uA8-.(EZd+[/KcDl4"u#'DIIBnF!+[0ARloF0me!s%13OO4tq>*1-IZ@1a$FBF<GF<@;TRs
4ZX^6/g)tnA8Z3+-Z*:%Ec5B&E+iZ6-OgCl$;No?+D#(tF<GF/@rcK1-uNI1ALq>0A7[<6AU&;G
+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsV+>"]`/3>P4D/Nd!ATJtu+D#(+4#))(
1(=R"$4R>+0RGSuDe't<FCfN8C2[W:-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Zg<u@<?'q
De*BmF*)G:@Wcd,Df/<:/h2!_A79RkC2[WnBleB:Bju4,Bl@l3F"JsdF`:l"FCfM9Anc'mF!,17
+A,Et+Co2-FE2))F`_>9DCuA*:-pQU%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp+<V+#:-pQU
@rc-hFCeuD+AZKhDdm9u+>PW)2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K<oXGqq?%Eb0*+G%G2,
Bl8!6@;Ka&@UXA"+CT.u+EM%5BlJ08+>"^WBl.g*BkD'jF!+(@9H\1\Bl8$(DIIEmAISuA67sB7
3-/YM1,L+^A7T7^+D>J1FDl2F/p)>[+EVNEA8-+,EbT!*FCeu*Anc'mEt&IO67sB80kP!+0f1"_
DeX*1ATDl8-Y[=6A1&L.A7T7^/8B*6/oY?5+ED%1Dg#]&+D,Y4D'4.=E"*.L67sB'+<VdL+<Ve>
Df99)AM7P3A7]^rAU#>.Bl[cpFDl2F+E_X6@<?''Eb0*+G%G1n$;No?+>GT_AR[AQ+DPh*E+EQ5
FEhmMA8-'q@ruX0Gp%'B@:Nk^DerrqEZee$A7]9\$;No?+>GTf@<jRe+DPh*A8bs2Ch[d0G]%GA
ATKJGG]Y':A7T7^%15is/g)l(C3=DL0H_cbATVZqA7TUrE+*j%F"&5?A7T7^+D,P4+EqO;/0JbC
DKU1T+DkOs+E1b2BFP;D67sB812:rL1,9t\A7T7^+=M)8@r?4,ATM3X=B$^l%15is/g)l(C3=DL
2'?LLEarg$B-;#)DIjr%DIdf2.!0B".1HVZ67sB812:rJ0K1+aDfBtEA8-+,+F7a@+EVNEA9)U-
@W-K6AoDKrATA4e:-pQU0f3WfDDF'lEb0*+G%De,Ec5o+Dg3C:DerrqEZek1E-Vm":-pQU0f<fV
E\THpEb0*+G%DeBAnc'mF!*%WAnc'mF!,RC+>,9!05>E9A7]p;@;KXhDD-'Q@<?'6/hSb!A8-'q
@ruX0Bk;>p$;No?+>G`gF_ici+ED%1Dg#\7-u*[2Bl7HmG[F!@9hZuYCgh?sAKYo#F)Pl+FCcS5
@VTIaF:AQd$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@
6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU
Eb0&u@<6!&A8,OqBl@ltEbT*+%16TfEcO<(+Co1s+>=634tq=>+E(d5-RT?14tq>%A0<rp-YdR1
A7]p,C2[W*F`_>6F!hD(%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`Hn
Bl7Q+DJsZ8Et&I?0RInYE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%16igA9MO)F(oQ14ZX]:
4tq=U:IJ5X6k'J4$;No?+A,Et+EMX5B5)6r+Co2,ARfh#Ed8dMDId=!+E2IF+Co1rFD5Z2@<-'n
F!+n-Bk;0)A8-'q@ruX0Gmt*Q:IJ,\5t=@38Q%]4+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi
8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4cifFCAfn05>E90..29%15is/g,4F
EbTK7F"AGM@:F:#@;]Tu@UXA"%17/m4ZX]5BPDO0DfU,<De'u)DKBo.Ci!j)A0>o(F(KH.De'u*
De*fqEc#k?C2[X%Ec5Q(Ch4`+@;]dkATMs.De'u,@:Eem@;Tt"AM>em+DPh*Bl8$5D]ie5A7Th"
E$l)%F)4!#+EM?M-Ql)k@RP?UE$/n6A7B+kF<G:8F*(i,Chdm!@UX@$Eb0<'FD>`)@UX@$C2[X%
Eb]G6C2[X*F(KB%Df00$B4>:b-OgE(Ccsg%4$"L*Cb-qVC2[X%A7f1J=B$DZBl8'<DJsW.F'hmK
<$6$d@r?4,ATM3X=B$XW$4R>_@j"tu-ZW]>C2[X(@r`q[3Zp7%B4Z0-F)29m%15is/g,4HF<GX7
EbTK7Et&I)HS-Ks+DPh*F(95>4ZX^43[-:$C2[X(@r`"c%15is/g,1WDBMP;9H\1\DJ<]oF*%iu
-n$bm3\`?C.3LZ4+>>i*+DkP)BkCptFD>`)%13OO:-pQUF`:l"FCcS,Bl%@%%14dO.!0B"+DPh*
E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X%@<-4+/no'A-OgD:4=G;i8g%keA8lR-
Anc'm.3K`U+D,h<Blmo/8l%iR<'a#C6qL9--YdR1E,ol/Bl%?5Bkh]:%14dO.!0B"+D>J1FDl2F
C2[W3+<VdLAp890FCcRe:IJ,\5t=@38Q%)eBPDO0DfU+UFEhmT%14dO.!0B"+DPh*E,ol/Bl%?0
+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2De*g-De<^"AR](`/no'A-OgD:4=G;i8g%ke
A8kstD0%-K+<VdL+D,h<Blmo/8l%iR<'a#C6qL9--YdR1@UX%*C2[X%@<-4+@UX%)Bkh]:%14dO
.!0B"+DPh*F`V,7@rH6sBkLm`CFLAKAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2De+!3ATD:!
DJ!Tq@UX%)Bkh]:%14dO.!0B"+DkP)BkCptFD>`).3K`UAp890FCcRe:IJ,\5t=@38Q%)eD..<r
An?%*/no'A-OgD:4=G;i8g%qY@V'dmD/a<&0JG41+D,h<Blmo/8l%iR<'a#C6qL9--YdR1Cggdo
05P'+AU%X#E,9)>0JP1oC3(a3$8=RjFDjbo9OVBuF_u(H+<VdL+<Ve=GB.D>AKXT@6rR&N7n#g;
;Cj21De*Zm@WO2=@:EbiD/_+AC3(a3$8=RjFDjboC2[WsDKKo;.3K`U+<Ve=GB.D>AKXT@6rR&N
7n#g;;Cj21De*Zm@WO2;De*R"FE2:PBkh`;%14dO.!0B"+DPh*A9Da..3K`U+<VdLAp890FCcRe
:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WnF_u(MBkh`;%14dO.!0B"+DPh*@V'V&.3K`U+<VdLAp890
FCcRe:IJ,\5t=@38Q%)eC2[X!@:F:2C2[WlATMrGBkh`;%13OO:-pQUAThX&FEM#.Cj@.3DJsW1
ATAo4Ec5](@rri1@;]LdATAo0@:C@'Bl%T.@V$ZjA7T7^+:SYe$;No?+EMXCEb-A,FDYh:Bl7Hm
GT\R\DffZ(EZf:<Ch[cu+D,>(ATJu&@q0(kF(Jl)G%kA-Bl8$(Ec,H1+Dbb0CNBpl:-pQU0K^b*
Db;-eDe*R"A7^!m85r;W.3N5HEbTW,+A,Et;cH%Q779^F/151NA7TUg05,HECh.Ho05>E9Bl7Hm
GV3ZOD/:R/$4R>;67sC%FDl22+DPh*E+EQ5FEhmME,8rmAKYZ)Ch.*t+D,P4+DPh*/oY?5+>"^E
G%#*$@:F%a+E).6Bl7Jk$8=RjFDjboC2[X%A7f1J=B$^lAp890FCcRe:IJ,\5t=@38Q%)eC2[Wn
DdtG>A7f@j@kVS8A8l'k/p)>[-OgCl$;No?+EMXCEb-A0Bl8'<05Y--+EML5@qfOh@j#Z-FCfM&
$8=RjFDjboCh[d0G]%GAATM3X=B$^lAp890FCcRe:IJ,\5t=@38Q%)eC2[WnDdtG:Bl8'<DJsW.
F"VQZF=.M)0K^b*Db;-h@:O1nFCfN#<*3*K+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kV\-
@r?4,ATKJGG]Y;B$4R>;67sC$AT)O!D@Hq:0RGSuDe't<-OgDH0RI_K+FPkPF`ML3$4R>`D/XQ=
E-67F-YdR1+EMX5B4W2rBl[cpFDl2F+E_X6@<?'k-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3                                          ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o1*A>4+>GVo1Gg4/0H`).+>GPm0fL48+>kqt1,0n-1Lk??E,&<gDeio<0Q^lIF<DuA
Df'H..3NM:D.Oi.@V0b(@psInDf0''D/a5gD/X3$0JOtcDf'H..3NeBCh[E&@<-"'D.RU,+EMC<
CLnW1ATMs7A8,RQD/X3$0JFncBk/Y8F)>i2AKZ)+F*(r1Cf>1hCLo1R-tI43.3N\KDeio,FCfN8
F(Jl\D/X3$0JIQbDeio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3N_@@VfTuARoLs
Bl7R+E+EC!ASQ-oA8-+,EbT!*FD5Z2F`:l"FCfM9Anc'mF!,17+A,Et+Co2-FE2))F`_>9D?  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eb@*0ea_++>G_r1*AA00JFV)0H`+n1G_!E+>GSn1*A>+3&;[30H`+n0f:dI2'=V0+>P&p0Jt^1
0fL41+?2>;+>Get1*AJ11a"M-+>P&o1cR030f^@3+>l)5+>Get1*A;.1Gh^"6pamF9LMEC;cHOj
=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35
F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cPgL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0f:(G
F_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K'7F$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Get8p+qm1,(F?+>GW41bh$H
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0fL4I
F_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iDs$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0d')2C`kJe0f:(.0fh$F
3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh
1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe0f:(.0fh'G3\rMu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh1a#D5C`kJe0f:(.
2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Gbs+@KX[
ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#$49Np/g+)<F*(u13Zq$j6m+TS
@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,L+GF_i0U0JPF-
0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.;+<X'\
FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$F$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1-$ILF_i0U0JPF-0ebXB1-.0L$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp15+<X'\FCdKU1-$ILF_i0U
0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp16
+<X'\FCdKU0d&c)B-8r`0f:(.0KLmG3\rc'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg+@1-_+>PW*2'=V-3\`TT0fTM4:IJ/X:J=\R<CokP84c`Z
:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\
FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U0JPF-0ek^E1cdBM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3?TG4@<?'A+>G_r8p+qm1,(F?+>>f:
2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2D?6r
6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6C`kJe0f:(.0KLmE3\rZ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=9+<X'\FCdKU0fL4IF_i0U0JPF-
0ebXG3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$
1E[f.@<?'A+>Get8p+qm1,(F?+>GW41H7EL2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS2DcO!6t(1K3Zp.9+A-cm+>PW*2'=V/3]&QP1,fOI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u)"+@KX[ANCqg2]t_8C`kJe
0f:(.1cdBK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2]s52@<?'A+>PYo8p+qm1,(F?+>GT30K2$J1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E2g%6t(1K3Zp14+A-cm
+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r
@V'R@+>u5&+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\rc'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@8+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E0fh-N$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0d%T,@<?'A+>P_q
8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&
:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm+>PW*2'=V23\r`V1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?))!+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r`&
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@<+<X'\FCdKU
1,L+GF_i0U0JPF-0f;!K3BB#S$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P=%2'=#0@<?'A+>Po!8p+qm1,(F?+>G`71cRNM1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`;d$6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ
0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)5%+@KX[
ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fP$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%3?TG4@<?'A+>G!)F_;gP0JPF-0ebXB
2EEZL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=&0H_K+
@<?'A+>G!)F_;gP0JPF-0ebXC3'&cS$=\-lCh.:!A8,e"1,2Nj/h1=QBl%<pDe*QsF!,NU/Kf1T
A79RkF!)T8Df'?&DKKH#+DPh*Bkh]3F(96)E--.D+DG^9+DPh*B5)Gp:-pQUA8-'q@ruX0GqKG!
67rU?67sC(ATD6gFD5SQ$;No?$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfs
Bl5%c:IGOb67sB'+>Y-YA0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1r
FD5Z2@<-'nEsbZ//g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"
ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7$;No?$;No?+<Vd]+ED<A-Xq44Ch.:!A8,e"-QjO,67sC$
F`&=:De'u-@:O=r+=JreF*2G@Eb0<5ATJu.D/a<*@qg$-BeOBR$;No?$;No?+CT>4F_t]23XSVK
/db??/g*o-+D#S6DfQt1BOt[hBl7Q9$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm$;No?
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*0ktiK0JWu167sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>
/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b
/no'A$;No?+>G`^E,mWf+ED%1Dg#]&+F7X6Ch7Z1/KetSFDuAE+Co2,ARfgnA0>u4+DPh*B5)H1
F`(`$EZee,Bk;/h$=e!aF`MM6DKI!K@UX=h-OO@%@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm
-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]k:-pQU
Eb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ2sDf7d"+FPjb
A8,Qs0FD`/+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT6.:-pQUAn?'oBHV>,EHPu9ARlp+
FD5Q4+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1F`)7-FDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1
$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M$49Np/g+S=Bk;0)C2[WsC3(M.Bl[cpFDl2F$;+)^7nHZP
:IIcH;c#bZ83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!)
:IK,1C'mR/6q9gJ8l%iH8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPfC2[WqBll"C
De*QsF"\mJ$;No?+D58'ATD4$AKYK$D/Ej%FCeu*8l%ht@r,RpF!,O6EbTK7EscYlCghC+ATL!q
+?MV3C2[W*C2[X(FDl22+DPh*A8bp"C2[X"@;BEsC2[X*FD5P6C2[X)Df9H5+DPh*Df-p0C2[Wp
Bl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+ATJ1c:-pQUEb/Zi+Cf4rF)rI9Bl%@%+C\bhCC2J)
@r,RpF(KD8/1)u5+?V#^@<<kG4ZX^+ART*r/j:D)3[-:$C2[WpBl%@%$49Np/g+YBCi!ZmF<Ga8
EbTH7F!,=.@rcK1F(96)E--..-ZW]>F)kb<4ZX]B+D58-+?MV3C2[X%Ec5Q(Ch4`(De*fqEc#k?
C2[X*F(KB%Df00$B4>:b-OM8K/g<"mF)kb>4ZX^43[-:$F)kat$;No?+E_X6@<?''A8-'q@ruX0
Gp$^5Ch7Yp7S-9B;a!/a-u*7.@<6L$F!*"VHS-Ks+EMR5.3L/g/j:C?-SB+JF!h;a8PDQO4ZX]6
4A&C;7nHZP:IIcH;c#bZ81>Z4-8%J)7S-9B;[P3@C2[Wn@<<V7+<VdLAp890FCcRV0RH8\9LVke
0Ka)gA92j2Eb/ciF<G1>EbTW,+?M<)7S-9B;[P3@C2[WnDdm6cF<D\KAp890FCcRV14)J^9LVke
0Ka)gA8PajARo4k+<Y9?EbTW,+?MB+7S-9B;[P3@C2[X*FD5Q%@<<V7Ap890FCcRV1j_\`9LVke
0Ka)gA9;a.Cia,qF<G1>EbTW,+?MH-7S-9B;[P3@C2[X$DId0t+<VdLAp890FCcRV2L@nb9LVke
0Ka)gA8lR-Anc'm+<Y9?EbTW,+?MN/7S-9B;[P3@C2[X%@<-4++<VdLAp890FCcRV3."+d9LVke
0Ka)gA9Ds)Eas$*Anbme@;?u.Ap890FCcRV3I=4e9LVke$?L'&F`_SFF<Dr@Df'?&DKKH#+DPh*
Bkh]3F(96)E--.DF`:l"FCeu1$?L'&F`_SFF<F1O6q9gJ8l%iH8lJPP<(I?':-pQUEb0<6DfTD3
DfB9*+Co1rFD5Z2@<-'nEschr+E)1:+BosE+E(d<-OL2jDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,$>=-pFDl2FC2[W<2[p+,ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0
DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'
BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&;DfTA2@rGmh+Dbt+@;I'(@;TRs+CT;%+E(_$
F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)
?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.
EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psIn
Df-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE
+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<
%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-
%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%
BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=
.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;u
A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.
Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*
@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk
+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(q
E$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\
Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2
BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__
ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%
0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk
?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1
@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2
?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ
+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu
+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2
@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL
+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!
?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN
-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBn
F!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+
-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6
@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL
+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf
78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS
=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3
AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM
@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6
Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5
DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$
@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08
/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-
FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#
+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh
%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9
-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums
+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7
?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;
+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4Ysl
Eaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%
F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("
@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#
+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&
$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;
E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL
+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4
+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&
FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$
AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqR
Eb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)
Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8s
G[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0
Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO
,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A
@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1
BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p
9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3
F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9
DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*
FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1H
F*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%
?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA
<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<
Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43
Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(
+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*
%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;
Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N
.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]G
F(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1
E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL
+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts()
,@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs
/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9
F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:
@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1
+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2
AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%
0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5
%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6
D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2
%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0
F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$
A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+
BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk
>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f
+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*Qs
F'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.
A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl
+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#
+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth
+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-
DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#
+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eur
F<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(
Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(n
DJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP
8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)
+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z
=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqB
B6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*E
Df021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m
+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth
+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+
D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$
7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&
FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8
F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%
@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.
CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-
FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^
73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1
Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@lt
Ci"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?
+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9
;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#
ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]A
Be=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>
F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&
Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(t
FE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+
D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co
@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:
>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RG
ATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%
+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"
@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*
FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@n
Cige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKt
A9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680
H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=
@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<fl
Ch5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3
F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-
F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J
+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%
EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-
FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsg
E\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?
Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@F
BOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L
+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#
.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<
2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et
/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6
+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>
A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<
+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.
+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+
Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$
A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(
ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[
DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq
+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=)
,9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+
?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:
@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd
/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#
F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"C
BPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n
+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u
+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE
+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%
Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%
@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-
+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*
$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>
De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-
+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>
Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)
+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V
%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;
%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%
@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8
ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+
ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7
A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)
A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#
+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#
EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_
9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgr
DJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7k
DKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-
F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-
FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt
+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.
Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu
+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.
Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OG
Bl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s
$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od
@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%
+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j7
8l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<
0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?
@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!
$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku
$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'
+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@e
DIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*
BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%q
Bl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#
@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(
AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht
@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6
+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..C
Bl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?cs
F<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<fl
C`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNE
Eb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4
D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5
BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA
%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-
FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX
6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2
@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:
ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,
+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6
%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO
+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3
ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3
Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4
AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU
0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,
+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q
@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=)
,9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj
$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pG
ARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:
ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U
0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7
De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6
De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq
$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb
+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)
E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNE
CghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31
+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK
%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2
EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8
A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6
%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RK
Bln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1
+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:
F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL
+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@H"q8.A8bs52eQ]>ATD3q
05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE
<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681
+Cf(nDJ*O%+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'
Ec#6,FD5W*+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?
%13OO+<W-VD/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j
9jr'PBHT&f/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E.
/ibj5/KdbrEarc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#
D.RU,ARl5W%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:g
B4Z-,FDi:0C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*
B-;/3F*&N6$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?
+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&
De*Bs@s)X"DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0
+AQiuASkmfEZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4
+Co2-FE2))F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"
$6Uf@?uC'o+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<
G%l#/A0<HH@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1
+AZKhDdm9u+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u
+CI&LA8-+(+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--o
Dg-))-tm^EE&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm
3A*9F+>"^.F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&
A7TUgF_t]-FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@
:ddbq8l%htA8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'
@;0Tg$6UH6Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4
Bl.F&+EV:.+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&
+D,Y4D'3q6AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj
/oY?5?sP0oFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)
+C\nnDBNA2@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g
+<Ve:DfBtEFDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#
+E2@>Ch[KmEaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.
DJ(($$6UH6D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(
AKYE!A0>Aq@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26
ATKI5$6TcbD..3k6=FqL@nKNb<+U,mF##IF67sa)@;BF@@<6-m8l%iSATMs7+EK+d+DkP&AKXT@
6m,rIF(o,,FCfN8+EM%5BlJ/H%15is/e&._67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&
F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=7@<6-m%15is/g,7IF*)IU+B3#c+D58'ATD4$ARlo+
F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-F(HdCCi<flCh4`5
Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/e&._67r]S:-pQU<+ohc+EM7CAKW*<
De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gmt*U67sB/<(0_b
6Vg]W<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.%15is
/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6$;No?%15is/g+SD
F*2>2F#ja;:-pQU+<V+#:-pQU+<WBf+@.,[Df00$B6A6+A0=JeA8-'q@ruX0Gp%Q.:IJ/N;cF25
:-pQB$;No?+Eh=:@UX@mD)re]D]j1DAKYN%3XlEk67r]S:-pQU+<XEG/g+e<DImisFCcS9@rc:&
F:ARP67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<Y]A+=D#7CLoh@
F(o,V:IJ/nF*)IN%15is/g(T1:-pQU+<XEG/g,1WDBNY8%15is/g)8Z-nlf*1+=>.C2dU'BHS[O
8l%iS78m/=6=FqL@nKNb<+U,mF"V0AF!hD(:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130f<]gCbRjY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$>aWhA0<77
De*s$F*(u6-OgE"@;BFQD/X3$8l%iSATMs71,2Nj/h1^HCLpF]DeioV:IJ/nF*)IGF"JsdD..3k
+A,Et+EMC<CLnW1ATMr9F(96)E-*]>:-pQ?:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)
E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%htF)>i2AI;1!/g,7IF*)IU+B3#c+D58'ATD4$ARlo+
F(96)E-*3F@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+ALSa<De!3lAKZ22
FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC$;No?$;No?+B3#c+<Y`>H=\3A+E(j7
+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U67sB/<(0_b6Vg]W
<%0FB+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.$;No?+Du==
@V'R&De:,6ATMs7+DG^9FD,5.-u*[2F)>i2ATVL)FE8lRF*22=AM+<b67rU?67sBhF)uJ@ATKm>
:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k
3Zp130f<]gCbRjV:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$>aWhA0<77De*s$F*(u6-OO^!DJ<]o
F*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@lt
Ed9#A$<BSn;b9b[4ZXrE/ibOE3%u]h$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL
%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=D
C3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kst
D0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b
/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6
A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARl
De*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&
0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXs*2D?j.C,Rb$+DNhh0d(3j
0JO\b3&!*1C,dn'+DNki1a`_>6q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP
<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;TjqDJ()6
Df9GE+A,Et+DGm>%16MdGAhM4+E):7ASuU$A0>DkFCAWeF(HJ+DfQt/Cht59H#R>9+E(j78g&%]
C1UmsF"SS-:IH<7$?L?/E,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*
ATJu9Df9H5+D,P4+:SZgDe!p,ASuU(DJ()#DIal3ATMs-DJ((a+Cf>#AM,)7$4R>7+?(o,GV;$/
0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<%15pPBlA#7G%G]8Bl@m1+E(j7
8g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/%15[=+F.mJ+DG_7
FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&q
FCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0
De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=L
BkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(
Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ
+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#
Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO
9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>
FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM4K".1HW$@;]dkATMs.De*Bs
@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#
<^fnb8P`)E3Zoe(/ibOE2_ufj$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!
7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn
$;s;d76sj@4ZX]5C,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jk-d$:I<]6W-KP<(Tk\
4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<
AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m
%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'E&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7
@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg
%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu8
67sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+
Dfp)1AL@oo<^fnb8P`)E3[ZU63A*<O0II;::eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV
5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?
C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-YbOn
0d(3h0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!0:%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3
De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0
A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5
BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#
De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)
H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'
DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3
A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2
F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.
@4uA-Bl%@%.3N&0A8c?<+Ad)mDfQs0$?g!$F(oQ1F!,C5+A*bn@;BEs-u*@.Ch7Z:+CTG%Bl%3e
Ch4`$Ec5e;F*VhKASiQ2@rc:&FE9&D$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"ATJu(@;[2sAKZ&*
F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6IUQbtDf0VLB4Ysl
Ea`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=BOr<,ARfXqD.RTq
ARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(D/!m1FCcS5EZfFA
+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7
F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'nDfU+U+A$/fH#Ig7
$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVB>
$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm
@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#
$6UH6BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)%14Nn$3       ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2DcO20H`+n0f:(/3$9t1+>Yer0eje.1*A;*+>Yer0f'q/0d&20+>Pht0fL412BX_/+>Pht0f^@4
1a"M3+>YcF:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<rqF_PZ&C2[WsC3+N:A79Rk
F!+t2D/Ej%FCeu*C2[WsC3(M=@rc:&FE8R=DBN\4A7oUu+Co2,ARfh#Ed;>4F*)>@H"q8.8l%ht
@:WneDBNV,F*)>@GqO2`F<G:8+DkP-CLh@-DJ3a*FDl2FC2[WnDduC86psg<<D>nW<$5U[A8c?.
BPDO0DfU+UFEhmMBl5&1@<--oDg-)9@;BF@@<6-m8l%iSATMs7D..3k+A,Et+C\c#Bk&9-ATMr9
F(96)E-,r*CLpF]DeioV:IJ/nF*)J?@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&FDYH(BkCptFD>`)
8jQ,nD..<rAn?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-F@nhm+DkP)BkCptF<G16
EZdtM6psg<<D>nW<$5U[A8c@&@;]dkATMs.De*p-F`Lu'8jQ,nD..<rAn?%*+D,P4+A,Et;bpCk
6U`,+A7TUr                                                                ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS CNMFPARMS C'
zz=:zz,'NMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENTSSTART DIC'
zz=:zz,'TIONARY DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ER'
zz=:zz,'R004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012 ERR013'
zz=:zz,' ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR'
zz=:zz,'023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GROUP HEAD'
zz=:zz,'ER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface JDFILE'
zz=:zz,'S JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRIPT JVER'
zz=:zz,'SION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNA'
zz=:zz,'ME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK'
zz=:zz,'008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUT'
zz=:zz,'BLACK REFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WORD XML a'
zz=:zz,'fterstr alltrim badappend badblia badbu badcl badfl badil badjr bad'
zz=:zz,'locn badobj badrc badreps badsts badunique beforestr bget bnl boxop'
zz=:zz,'en catrefs cd changestr checknames checknttab checknttab2 checkntta'
zz=:zz,'b3 createjod createmast ctl datefrnum dblquote decomm defzface del '
zz=:zz,'destroyjod did didnum dnl dpset dptable empdnl fex firstone fod fop'
zz=:zz,'ix gdeps get globals globs grp gsmakeq guids guidsx host hostsep is'
zz=:zz,'empty islocref jappend jcr jcreate jderr jdmasterr jnfrblcl jodsyst'
zz=:zz,'empath jpathsep jread jreplace justdrv justpath jvn lfcrtrim locsfx'
zz=:zz,' make makedir markmast mubmark nc newd nlargs now nowfd obidfile od'
zz=:zz,' ok packd plt put quote read readnoun readobid regd remast restd rv'
zz=:zz,' saveobid second tc trimnl tslash2 tstamp uses valdate wex wrep wri'
zz=:zz,'te writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DI'
zz=:zz,'RNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR20'
zz=:zz,'2 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 ERR211 ER'
zz=:zz,'R212 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum copydirin'
zz=:zz,'v copyfile copyfiles createdl dfclose dfopen dfp dncn dnix dnnc dnn'
zz=:zz,'m dnrn dropall dropbakdir dropdir dropinv dropnc dropref gettstamps'
zz=:zz,' justdrvpath libstatus loadbakdir loaddir loadnc loadref loadstamps'
zz=:zz,' maxback movefile nummask packdict packspace puttstamps renamefiles'
zz=:zz,' restdict restspace savedir saveref tmpdatfile tmpusesfile volfree'''
zz=:zz,'),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPTAG ERR'
zz=:zz,'0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR015'
zz=:zz,'8 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS'
zz=:zz,' OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWI'
zz=:zz,'TCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk dec85 dumpdictdoc'
zz=:zz,' dumpdoc dumpgs dumpheader dumpntstamps dumptext dumptm dumptrailer'
zz=:zz,' dumpwords extscopes fap fmtdumptext fromascii85 getallts getascii8'
zz=:zz,'5 halfbits htclip jnb jscript jscriptdefs makedump makegs masknb na'
zz=:zz,'mecats nlfrrle nounlrep opaqnames parsecode putallts rlefrnl sexpin'
zz=:zz,' sonl tabit toascii85 uqtsingle wraplinear wrdglobals writeijs wtte'
zz=:zz,'xt''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR C'
zz=:zz,'NEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCIN'
zz=:zz,'IT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 E'
zz=:zz,'RR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR06'
zz=:zz,'8 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ER'
zz=:zz,'R079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088'
zz=:zz,' ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR'
zz=:zz,'098 ERR099 ERR100 ERR101 INVGROUPS INVMACROS INVSUITES INVTESTS INV'
zz=:zz,'WORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 O'
zz=:zz,'K059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTIT READSTATS afterlas'
zz=:zz,'tstr allnlctn allnlpfx allnlsfx apptable appwords badcn bnlsearch b'
zz=:zz,'nums checkntstamp checkopen checkpath checkput closedict createst d'
zz=:zz,'efwords delstuff delwordrefs didstats dnlsearch freedisk freediskli'
zz=:zz,'nux freediskmac freediskwin fullmonty getdicdoc getdocument getexpl'
zz=:zz,'ain getgstext getntstamp getobjects getrefs gslistnl inputdict inva'
zz=:zz,'ppend invdelete invfetch invreplace islib iswriteable iswriteableli'
zz=:zz,'nux iswriteablewin jdatcreate jwordscreate loadalldirs loadallrefs '
zz=:zz,'loadwords mainddir newdparms newregdict nlctn nlpfx nlsfx nubnlctn '
zz=:zz,'nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc putexplain putg'
zz=:zz,'s putntstamp puttable puttexts putwords putwordxrs rpdtrim rplctabl'
zz=:zz,'e rplcwords sortdnub''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK'
zz=:zz,' ERR00400 ERR00401 ERR00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR'
zz=:zz,'00407 ERR00408 GROUPSUITES IzJODtools JODLOADEND JODLOADSTART JODTO'
zz=:zz,'OLSVMD LF OK00400 OK00401 OK00402 OK00403 OK00404 OK00405 OK00406 P'
zz=:zz,'OSTAMBLEPFX TESTSTUB WARNING00400 WORDTESTS addgrp addloadscript ad'
zz=:zz,'dloadscript1 allnames allrefs betweenidx createjodtools dayage delg'
zz=:zz,'rp firstcomment firstperiod fsen getrx hlpnl jodage lg locgrp mls n'
zz=:zz,'oexp notgrp nt nw obnames onlycomments pr refnames revonex today to'
zz=:zz,'dayno updatepublic usedby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK '
zz=:zz,'AUTHORMARK CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK EDTEMP ERR025'
zz=:zz,'0 ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 E'
zz=:zz,'RR0262 IzJODutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBF'
zz=:zz,'USCPFX OK0250 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMA'
zz=:zz,'C ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok compclu'
zz=:zz,'t compj compressj createut ctit de dewhitejcr dewhitejscript disp d'
zz=:zz,'oc docct2 docfmt2 doctext docword ed et exobrefs gt jodfork jodhelp'
zz=:zz,' ljust obtext pdfreader qt reb revo rm rtt textform2''              '
zz=:5279{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`-1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+APL&:c]_.@:O(qE$0%,D.Oi+BleB;
+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN
@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ
67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$
F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u
+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGF
F<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k
+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]Tu
F*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*
$;No?+<VeDDJUF<+<Ve%8PN#B+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1
Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3
@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is
/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2
@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeI
ATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL
+APL&:c]_>AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlom
Gp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX
6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,
Eb-@@C1_0rATJu7AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
DBO%7BlbD<ARfgrDf-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h
+F5/HDe!3lAKYl/F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ
:*<P35tscj8Oc9I;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0
AKYQ%A9/1e9L_0+0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQU
D.-ppD]j+2EbTK7+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#
AISuA67sBhDIal,De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a
;Fs\a4ZY>Q%15cp<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M%15is/g,">@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R"
;Fs\a/5/?/79D*3<)$%;=A;I?<(0ng/4*K=74_/!;G0DR=&(;H<(8hV$;EfR;GU7p:dmN.8lJ)T
8PiA;9L2WH==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q:ha%15is/g,(AC1Ums+Cf>#
ATJ:f=&2^^4ZY8+$<0Gm<'<8s%15U':K:4S3\h-O;cQCg76N[f%15fq6W-]C3]%9Q%15is/g+\=
@ruF'DIIR2+EM+1Afu,*An?!oDI[5e$:IHQ<(Tk\5uLiK3].?R%15is/g,(AC1Ums+DtV)AKYK!
@<6K@+Co&&ASu%"3ZqL";FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRY,6:s[6<),eD3`f*T6nD;+
;cG;<;GU:h/5oP?<(/?45snOG%13OO:-pQU@UWdiDdmHm@rri'De*E1+Co&&ASu%"3Zq3b8ju*H
:.#Ht@UWec@VS%e><3lY/g+@Z+=\us+BplL/0J4@AM,*$6:s[6<),e)?O[>O$;No?+E1b2BHUhs
Ch[a#FCfJ8@q]:k@:OCjEZc\OE+*j%+E2I@@ruj%FD5Z2+Cf(nEa`I"ATDi$$;a#f845m?4ZX]W
7TW/V+F>4Y03fk6$;a#f84,pG;a!/h+?D,,-S/([<(KDG9FV=<$;No?+E1b2BHVJ0Eaj)4/KeVA
@V''m03fW0BOPq&+Co&&ASu$mDJ()1DBNV2F*&O#;[j(IDf^#AAT0dn+=KfN=%Q/6-SJ^P.4-Gk
-qQm08PXU[>V@HR+A"1N3^"Tk.=EWS$4R>;67sBlG][t7@ruc7Df0B:+EV:.+E1b2BHUo-Df$V:
F^]*#Anbge+D,>(AKYl!D.Rbt$>O^)FDtZ1BK\C\3Zri3+C-*7INU%C3Zp",+BplL.kWJ[/g)N&
-RLu*+=\ud><3lW/h^H^+Ab@'845m?-9VeF%15is/g+\9AmoguF<GF/F*(u6+E2@>Anc'm+E_a:
EZf1:@psInDf0V*$;No?+DPh*F*VhKASlBpFD)e2F!,:1Aoo/.Ci<ckC`mD&Eb-A%F!,R<Bla^j
:-pQUG%G]'+DGm>A7]@eDIm?$Bl5&.De*d(/no'A%15^%5uU`O;E['UDe*p7F*(u1E+*j%+=Co@
@<6O%E[M;'8l%iO;GTbF3biSDF*VhKASlBpFD)dEC2[X%Ec5Q(Ch555C3(a3$;+)^<Du=a4Z[=r
A93$;FCf<.@<?0*-YdR1F`V,7@rH6sBkK&4C3(a3$4R>;67sa!DId9hE+NotASuU2%16igA7TUf
:-pQU.V`m4A8bp"@kB8TA8-'q@ruX0Gp%$7C1Ums+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA92j2
Eb-[P%15is/e&._67sBKBl[cpFDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+EqL1DBNJ(@ruF'DIIR"
ATJu&Eb-A3E+NouA.8l@67sBhDIal#ATMs6Dg>o)+EqL1DBO%7AU,D,Eb-A'Ci=B+A1euI6tp[Q
@ruX0Gp%$7C1UmsF!+t2DKK<$D@HqJ67sBh+EM+9+E(j7DJsZ8F!+n/A0?&,Eaj)4FD,*)+DkP)
@:s-o.P>FMAft]"Ch4`"Bl[cpFDl26ATKI5$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'
F#ja;:-pQU+<W(L@;^?5DJsZ8F!+n3AKY])A8-'q@ruO4+CAIuEb/ioEb0,uARm5!$;No?+<Ve;
An,XqF(HI:+<Ve:Ci=B++Co1rFD5Z2@<-W9Anc'm%15is/g)8ZA7fb!ASrV5+<VdLDfB9*+Co1r
FD5Z2@<-W9Anc'm%15is/g)8ZA7fd'+<VdL+<VdLA8-'q@ruX0Gp$^5Ch4`.@<?1(%15is/g)8Z
A8Ymp+<VdL+<VdLDIIBn+E(j7D..-r+Co2,ARfh#Ed8d;Df'H3DIm^-+Du+?D@HqJ67sB'+CoA(
GT\+O+<VdL+DtV)AKYo'+DkP$DBNJ(Eb/a&DfU+GBl7HmGT^mBF`%Wq:-pQU+<Y34DIXe3+<VdL
+<YQ1D.Oi.AftT"@<6K4DJsZ8%15is/g)8ZA8Z:%+<VdL+<VdLG%l#3@VfTuDdmHm@rri2@;TRs
%15is/g)8ZA9)U-A8-',+<VdLATD4#AKYMtEb/a&DfU+GDJsZ8Et&IO67sB'+CoM2E,K/.+<VdL
+D#S%F(HJ(CghC+06DJYAKYl/F`)70$;No?+<Ve;Ec5o;AS*&-+<Ve<Eaa$#+ED%*ATD@"@q?d#
Dfor=%15is/g)8ZB4Z1,F*(i-E-!-EEb/ZiF!+t5ART[pDf-\+DIal+@<6O0F`\a:@<?''FD5T'
F*(i-E,uHq:-pQU+<YK=@:Wn_EZcJI+<YK=@:UKkBl[cpFDl2F%15is/g)8ZCi<`mDIXe3+<VdL
Ci<`m+EqaEA0>;uA0>_t@rcK1@r,RpF"_W\E+O)"$;No?+<VeCDdd0sAS*&-+<VeCDdd0!Eb/io
Eb0,uATJ:f:-pQU+<YK=@:XG$@;Tt)+<YK=@:UL&Bl.E(F*(i-E,uHq:-pQU+<YW3@r#Uh@rrh9
+<YW3@r$-.A8,OqBl@ltEd8d9DIal2@<Q4'+E)(,+D,>(ATJu&F!+m6@UWb^F`7cs:-pQU+<YW3
@r$.)@:Njk+<Yc;F*)IGAoD]4F*2),Bk(jgDKI"1@:O(qE$04@@:NjX$;No?+<VeGF`__HFCB$*
F!)TJE+EC!AKY])G%G]9ARlonEb/[$Bl@l3@;]TuCghC,E-67FFD5T'F*(i-E,uHq:-pQU+<Y]9
F*(r,@rrh9+<Y]9F*)>@ATJu2Df^"CEb/`lDKI"1@:O(qE$/Y2ART[lA0>?,+=M2;@r#Uh@rs./
$;No?+<VeIATMs7E+*6f+<VeKATMs7+D,P4+EM[;AnbahASuT4Eb0<6DfTD3F)YPtAISuA67sB'
+ELt7ARoLq+<VdL+ELt7AKYMtEb/a&DfU+4$;No?+<VeJ@<Q4&AS*&-+<VeJ@<Q3)Eb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)l':IJ`3@N]]"DJ*N'1,(C6
1,M!?%13OO@rGjn@<6K4-Xgb.A7TUf-OgDmDeX*1ATDl8-Xgb.A92j2Eb-U-$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]6tC4F+Co&&ASu$iDKI"3AS,XoBln'-DK?6o%15is/g+\=Eb/a&DfU+GDJsZ8
+DtV)AKYr4AS,Y$ATJ:f6qL9O9iF294?G0&0d%hd=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]-
%13OO:-pQUA8-'q@ruX0Gp%!CF`&=CF_56"G\(q=/KetPA7]d(D..O.ATDi$$:Iil8Q\>T4ZY\e
/mg=U-QlAe+A#ZX6V]!<$4R>;67sC&Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=
Dfoq?DIIBnEt&I)4$"`W8Q&Md+@Je!8Q[*'8Q%oN-Rh2>+?Ui&+FH3m6qL9O9iE/c-8%J8+@K1-
8Q\>T%13OO:-pQUDIIBn+Cf4rF)rI4DIal,@:O=r+EVmJAKYl/F`&=>@;TRs%15Kp;GKSB3]oJV
?SNZN+BM?:6r$)l9gM-E:JO8)%13OO:-pQUEb/ioEb0,uAKYo#C1UmsEt&IE8Q&GU:-CX#4"akp
+=A:5:JsSY77JD!78m/`77JX6$4R>;67sC$AS,LoASu!h+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5
DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-W3B&<)Xo;77KjN+AtWt6V]!X4ZX]J+u(3f3Zpg^
;GotZ+=nil4te$H<)Z@j6V\'t%15is/h1FMA7T7jASu$iDKKr7De*]nCLp7-/g)WYDe*]nCLnVu
/M/)d@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._
67r]S:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:
Ec5e;%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]Li
H$X1BB-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\
+Du+?DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is
/g)8ZD..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0
Gmt*U67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE
@;TRc@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL
+E2IFF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeN
DfTA2@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs
+D,Y4D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k
+ECn.B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;
67s`uAT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is
/g,7EB6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K)
.X`ZR$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0
BFP;M;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m
+E(_(ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)
+ED%&F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;
-Qm&BE$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"
EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56
Bl5&8BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A
9LUK[-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1
+EV:*F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng
4ZXr5E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1
Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?
D.7'sARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX
<'a"`$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl
+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!
CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(
ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'
@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\
3XlEk67sB'+Cf(r@r$"%ASrV5+<Y0-ARfLs+DGF1@;^?5A8,OqBl@ltEd8dAF!,C?ASqqa:-pQU
+<Y0-ARfLp@<?0*+<Ve:BOt[hF!+t8EcP`/F<GO2FD)e*B45LlF*&O8Bk)7!Df0!(Gp%'7FD)*j
:-pQU+<Y0-ARfLpF`\`K+<Ve:BOt[hF!,1/+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!+m6E-67F
A8,OqBl@ltEd8*$:-pQU+<Y01Df]K#Bk)6-+<Ve:Ci=B+F!,"-@ruF'DIIR"ATJ:f:-pQU+<Y07
ART[lF*&NI+<Ve@DJ=3,@;KY(ATJu8FDl2.B4W3(@VTIaFE7lu:-pQU+<Y3+Ap806A9/k9+<Ve;
AS,XoAKZ28Eb'5#$;No?+<Ve;AScF0F_55.+<VdLA7]RgFCcS5@VTIaFE7lu:-pQU+<Y3/A92j$
FE8QI+<Ve;Bk)7!Df0!(Gp%0M@<?4)FD56++CT.u+E1b2BHV#,AoD^,@<?4%D@HqJ67sB'+CoA+
F(Jd#@qZu-+<Y`:@<,jk+D,P4+DtV)AKYr#FED)7DK?6o:-pQU+<Y<.FC]<"F_t]-F<D]=ATT&5
@VTIaF<G+4@s)X"DKK</Bl@ku$;No?+<Ve>ATVL.E,8rsDBL&EB4Z0-F(fK4F<GL2C1Ums+D#e:
Cgh3iFD5Z2Et&IO67sB'+D58-B6/0+G]Y&N+<Y<.F<G4:Dfp"A@;]TuF*22=AKZ&(EbTK7+EV1>
F:ARP67sB'+D58-DKKrA@;Ts++<Y<.F<GI0D.P7@@rc-hFD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1
@;Tt)%15is/g)8ZB4Z1'@VTIaFE8QI+D58-+E(_(ARfh'%15is/g)8ZB4Z1*AS-!++<VdL+D58-
+ED%*ATD@"@qB]j$;No?+<Ve>F)5Q3FDbn;+<VdLB6%p5E$/S,A0>r9Blmo/DIIBn+Dbb5FE7lu
:-pQU+<YB9E-685Bk)6-+<VeKATMr9AoD]4DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gmt*U67sB'
+DG_:@;p0sDIak4+<Y*3E+Not+DG_:ATDm(A0>DkFC>Uc:-pQU+<YB9G%>0#ATVK++<Ve;ASbq"
AKY])G%G]9ARloo@<>oe$;No?+<Ve@DK]W'FCSu,+<VdLAn?'oBHV#,G%G]9ARloo@<>oe$;No?
+<Ve@DK^&3E,8rmAKW*<F`:l"FCcS/DK]T3FCeu*A79Rg%15is/g)8ZDIn$4AS5Of@rrh9+CfG'
@<?''DIn#7DfQt@AS5^uFCfJ8A8,OqBl@ltEd8*$:-pQU+<YTAASu$m@rrh9+<VeFE+No0@3B)p
@ruF'DIIR2%15is/g)8ZE+*j%DJUF<+<VdL+E1b2BHV2$D.Oi+BleB;%15is/g)8ZE-686G]7J-
Bl5%9+EMXCEb-A7BQ%p5+E(_(ARfg)AU&01@;]LqBl@m1%15is/g)8ZE-688F!)SJ+<VdL+EMXC
Eb-A+Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZE-68?FE;P4D/^U?+EMXCEb-A2@;TR,+CfG'@<?4%
DBNA*A0>\sF*&ODF`\aJBl.F&FCB$*Et&IO67sB'+E2IFFCAWpAKW*<+<Y`IDfTD3-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs%15is/g)8ZE-68EAU&<<+<VdL+EMXCEb-A3
@VTIaF<G+4@s)X"DKK</Bl@l3@;]TuB6%p5E%c9TBlmo/FCf]=Et&IO67sB'+E2IFGAhM4F!)SJ
+<Y`IDfTD3GAhM4Et&IO67sB'+E2IFGAhM4G]IjJ+<Y`IDfTD3GAhM4+D5M/@UX'qEb/ioEb0,u
ATJ:f:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*p2DfTD3Ea`iuAKWZa
0J,"93@PCE%16T`@r,RpF!)SQ@;9^kF*)>@AL@oo@rH(!F(KB6+=CT4De(4)$4R>;67s`uAT23u
A7]Y#F!,]Z/KdY]7!!HgEb-A(AT23uA7]Y#+Co%qBl8$,Df0V*$4R>0:/+#P90G<i+<VdL+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqpNF`):D@;]TuFD5T'F*(i-E$0"+Ebc*k6V^<H;cGn@1a!n`+<Ve%
67sBmBl%?'@rH4'Df0-(F?1O]@;0U%DdmHm@rri-DId='+Dbb5F:ARE:.%fO:fBM<2'="a+<XEG
/g+b?Ch4`!Df'H3DIm^-3Zr9JBl5&3@VTIaF<G(3D/aE2ASuT4Ch[s4%13OO:-pQUD..-r+Co2,
ARfh#Ed8d>Bl%?'@rH4'Df0-(F<GC6F*%iu6V^$@;E['.:/+#P9.WG*9M&/^/430":JFYa%13OO
6V^!B5uU]F3]8*'+<Ve%67sBmBl%?'@rH4'Df0-(F?1OgDfTA2DIIBn+Cf4rF)rIBEZf4-@rcK1
FEqh:%15Ht6W-?=<(Tk\4ZYPF+AP6U+D,>(AKYK$D/aE2ASuTN+EqL1DBNk,C1Ums+Eq78+D,>.
F*&O7Eb/[$ARl5W6V^$@6UX^;4ZY>@+<Ve%67sBmBl%?'@rH4'Df0-(F?1OTBk)7!Df0!(Gp$X9
@s)X"DKK</Bl@l3/KcH^AS5O&%15Ht79EA[5tOg73\`?3+AP6U+D,>(AKYK$D/aE2ASuTN+EM47
Ec`F8G]7J-DIIX$Df0V*$:@Qb5uLEU4ZYAA+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^A8,OqBl@lt
Ed8dH@<,dnATVL(Et&ID:/Fqi6pXd@4ZYME+<XEG/g+b?Ch4`!Df'H3DIm^-3Zr6IF*&OHBl.E(
DdmHm@rri;@<3P>E-67O%15Ht;FO&<3]/F%/i"P)+AP6U+ED%*ATD@"@q?cmDf'H3DIm^-+EV%$
Ch4%_6V^NU5u^B<3\`W;+<Ve%67sBmBl%?'@rH4'Df0-(F?1ObAS,LoASu!h+E1b2BHSlL-tI%&
DKTeF+Dbb5F:ARE:/a_f76N[l+<VdL+<XEG/g+b?Ch4`!Df'H3DIm^-3ZrKXH=\4;Afu#$C1Ums
+DG^9@X3',Et&Hc$;No?+DG_:ATDm(A0>N*Dfp"A@;]TuF*22=AKYMlFC?;(Bl%?'@rH4'Df0-(
FE7lu8PW;V;GU:h;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/430$=AV[W8PT^%8PW;b<Cp.Y;a!/a
8PW;V;GU:h;[j'C$;No?+DG_:ATDm(A0>_t@rcK1@;]TuGAhM4+Cno&@3B/rCh4`!Df'H3DIm^-
Et&IJ:0((T6W-]Y4ZX]Q:.%]@;c>57:/Fqi6pXd@/430";FNlN8P`)46V^QO>"'u0:.88]9L26F
%15[%<``'p6rQ60+<X6N<_YkI;GU4#$4R>;67sBpDK]T3FCeu*FCfN8+Cno&@1<Q8:0(=_;cH[Y
3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:/a_f74^f$79EA[5tOfo%13OO:-pQUFE2)4+ED1/BQP@F
FE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,pA9;j+D*9pc+<u=X><3lY
/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(FDl)6F&#%S.V`m4
FDl)6F!+sE/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB
$;No?+A$HmATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5
E%c9TBlmo/+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat
@;TRs+Cf>,@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(
ARfh'+E)-?DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D
+ED%1Dg#\7GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-
E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3
De:+a:IH=D@VTIaFE7lu:-pQU+DPh*BOu"!+<Ve;Ble60@<iu6DJX$)AKXT@6m-/SCiCL>+<VdL
+<VdL+<VdL+<VdL+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD
@;BEsCi<`m+EM%5BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/
G]4cJ+<Y]9FEMVAF!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G
@<<W#Eb-A2Dfd+9DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL
+D58-F!,@/D.OhuDIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+
8l%ht@rH7.ASuU(Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9
EHPh8F)Q)@ARlp%@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL
+<VdL+<VdL+:SZQ67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4J
Ed8d@@;]V$+CT=6@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8
F)Q)@ARlp(AS,LoASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1Ums
F!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJ
DfTA2AU&01@;0UfFD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'F`V,)@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE
<(pF;@ps1i+EqaEA9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41
F)tc&ATJtBC2[X)Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcm
Eb$;:BPDR"F)YPtAIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!
C2[X*FD5Pd67sB1C2[X*FD5P6@kB8T@3B&uCi!ZmFD5Z2+E(j78l%htF`_>6BlnVCGAhM4F#kFT
G][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu&+EM+9+E(j7
BOPdhGp%6OBl%L*ATJu9BOQ!*F`V+:FD,5.@rHC!%15is/g+b7@qfanFD5<-+E(j78l%htFDi:@
ATDC$Ebuq@@<64*+E(j7B4YslEa`c,F`V+:FDi9o+E2@>B6%EtD.Ra//e&._67r]S:-pQU8T&W]
Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z@rH4'C*4WA+D#e>Eb0*!+Cf>,E,oN2F(oQ1+E(j7
A8,OqBl@ltEd8dODfTB0%15is/g)8ZA7Zl++<VdL+CoM2E$/_4Ec5t@@rGmh+D,Y4D'2GH6m-M]
F*2;@Et&IO67sB'+Co2-E$-8G+<Y3/F)Yr(Gp$X3@ruF'DIIR2+E(_(ARfh'%15is/g)8ZA8bs#
+<VdL+D,P4D..N/@rH4$ASuU2+DG^9GAhM4F!+n/A0>E$@s)X"DKKq/$;No?+<Ve<A0<!;+<VdL
ARoLs+E(_(ARfh'+D,Y4D'2GH6k'Ju67sB'+D#X;+<VdL+<Y6+BlkJ>AU&;+$;No?+<Ve>F<D\K
+<VdLB4Z0-FCf]=+E)CE+E(j7ARoLs+EqO;A8c[5%15is/g)8ZEb0E4+<VdL+Dbb5F<GU8@qBP"
Cj@.DAThd/ARlp%@VTIaFE7lu:-pQU+<Y]A+<VdL+<VeIF`&==@:O=rEt&IO67sB'+EDRG+<VdL
+<Y]IDBO%0F`_P<DeF><FCfN8Et&IO67sB'+DPh*BOu"!+<Y-6Dg-86+AbHq+E).6Bl7K)BOu"!
%15is/e&._67sBUDffQ33XlEk67sB'+D#S6DfQsI+E)$<D.Rd0@:s.m+=LuCA9E!.C`mb,DJ*N'
0JG7>0J+t41H@HE%13OO@rGjn@<6K4-Xgb.A9E!.CaTZ!@rH(!F(KB6+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,!F/KeS8E+NotASuT4GAhM4F!(o!%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4
+CT>4F_t]2%15C";cQO\;b]PU90G<`@<6L4D.RcL-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@<H[*DfQ9o5uglT:JsnQ;G0/6-Xh.>BQ%oP-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+
AoD]4@rc-hFCetl$:@][5u^9@9gMZM4ZXs#Eb/[$ARmhL%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt2H!t5+BQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f6s2fD9gMZM4ZXs$H!t5E-OgCl$;No?
+CoD#F_t]-FCB9*Df-\7@<--+AoD]4D/X<#A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15g*:-h9B
5uL?=3[\c_DII':-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4G%G]'@<?4#%16-);F3ZK
8PMoF;G0/6-[''A@UX@mD)s$R$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfC@Dfd+GDfTB0
%16!/:K1Ck;FFGX5uL?=3[\rdDfg2AEb'5P-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<-.)+>"^H
AT23uA9/l3DBNk>BOu3,D..I#Et&IE:IA,V78?fV5uL?S4ZX]O;c?[j78loH;G0);<E)Lb;GBGT
905L=76smA6qosF905OE5t"F5;G0)G:JO2D9gMZM4'"dJ6:"RB9hdoO906$I:K1Ck;FFGX5uL>b
$4R>;67sBjDf'?"DIal+Bl7K)EHQ2AATJti;]oU^E+NotASuTN+DPh*+<`-_.6T:+A7B@pF`2A5
+:SZtF?MZ-?!q2PCiOT9FCd]i8OccQ:(7O>$;No?.V3L.A7]^kDId<rFE7lu              ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.3+>P&q+>Pes2BXh8+?(E#1E\Y"1b^%3+>bks2]st6C2[X"@;0U%8l%htA8,OqBl@ltEd8d;
CghC+C2[WnDdm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3
D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3
F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u
+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a
:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2Bl@l3De:+?C2[W3                             ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 grplitBasic01 putNameTimestampsBasic00 restdBasic01''),(<(<''j'
zz=:zz,'odcrushtests''),<0$a:),(<(<''jodlargetests''),<0$a:),(<<;._1 '' jodsmok'
zz=:zz,'etests compjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00''),'
zz=:zz,'<(<''jodstresstests''),<0$a:                                         '
zz=:294{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o1E\D-1c9#dA7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>FCcS5AftPk
F(o,,8l%htFCfN8F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,OqBl@F#Gp"MW
ATMs.De(ON+CT.u+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7EbTK7F"Rn/
:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z
1+==oC2[X)ATMs)E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8,OqBl@lt
EbT*+3ZrKTAKZ)+F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sC$F`&=GBln#L
%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn:-pQU+<YT5+?MV3C2[WnATf22De'u5
FD5Q4-QjNS%15is/g)8Z1E^^[F<DrGDe*<cF(o-+ATMs7-OgDX67r]S:-pQU@rc-hFCeuD+>PW)
2f<PW1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@:Wn[A0<:<Dffo:AStIYF*)IW0JP"!FDi:CF_Pr/
%15is/g)i,A7]7*1*C"9A7]9o-tI439jqOPDcC:mFE8lRFDi:CF_Pr/+>"^878m/g5tt'B;E[&p
%15is/g)i,A7]7*3?T_\Bk0P=F(o,<0JP"!@:Wn[A.8l@67sB73,`;K0K1+rF`MA6DJ()1DBO.:
Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FGATMs7%15is/g)l'DJs\Q3$<?_A79RkA0>K&
EZdtM6m+093A*-=+EV19FD5W*%15is/g)l(C3=>H2'?UME,ol?AKZ#9DBNY2F*)GF@ruF'DK?6o
%15is/h1CCE+NotASuU2+>"^XATMr9De:+?B4PRmF"&5DDfQtAF_Pr/+D>=pA7]cj$<0Gm<)>kY
9e\:b3\V!M<(0_b=[>bV78c90<(0_b:dIuR0JO[m+<Ve%67sC%ATT&:D]gbWAoD]4@;Ka&D.Rd0
@:s.m%15is/h1FMA7T7jASu$iDKKq/$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''-u*[2FCfN8
ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I
%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>+0RGSuDe't<-QjNS+<VdL+<XEG/g+Y?Df]J4@;^?5
DfB9*+Co1rFD5Z2@<-'nEt&I?0RI_K+=D8BF*)/8A2#AR+<XEG/g,(OASrW3FCB&t@<,m$;FNl>
=&MUh73F"#ATMs.De(ON%13OO-oiG31bgF%0d%T667sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5
Bl@l3Df-!k%13OO                                                           ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o1E\M4+>GYp1c?I21E\P6+>GYp2)$.-1a"Y0C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7
+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7@rc^5BHVD.F*)IG
/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A8G[pB4Z0rF*)J>@<-!l+D,1nF(o*"
AKZ)+F*)IG/Kf.HF*)IGGA2/4+DbJ,B4W2pF`\a<ARTXo@VfTuA79RgC2[X(D/X3$FCfN8F)u2:
CLnW1ATMs7+>"^WD..6s+EV19F<G(%F(KD8@q]F`CM@[!+Cf>1AKZ28Eb'6+De*p2Eb0<5FCfN8
F)uGDATMo8FCfN8F!*%WFCfN8F!,[@FD)e5@<-!l+EVNEG%G]>+DbJ,B4W2r@<>o          ~>
)
showpass 3 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&n+>GZ41hpr>A7]p,/KdY]6m-#OG%GK.E,B0(F:AR?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>MC2[WnAThH(BlbD=BOr;Y:IH=9AThX$DfBQ)DKI!NE-67FA8,OqBl@ltEd98e>@'$i
%15[K+DGm>FD,5.Anc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+E(j78l%ha$=e!bAKYMt@ruF'
DIIR"ATKI5$4R=b+<VdL+<VdL+<Y3/A0<QK+:SZ#+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$6UH6+<VdL+FGnkC2[WnATiH9De+6<FD5Q4HjpE*+<VdL+<VdW/LrD)/M/P+.kN>).kN>)/M/I^
$4R>ABPDN1E+*j%+DGm>FEqh>@ps0rDe:+a:IH=9AThX$DfBQ)DKIKR:1\Vl@;]Tb$?g?(@<?4"
AKYK$A7ZltF!,OGDfTE"+DG^9@3@%=F`\a:ATfOGA8,OqBl@ltEd98H$;GGZAKZ&9@:F%a+EMgL
FCf;3@rGmh+DGm>AoDg0A0>T(+<k?-AT24$+s:<7@q]S"@;I%q$=mj\FD5Z2@<-'nF!+n/A0>Ju
DII?tGp$U8D/F3/+D58'ATDKp+E_d?Ch\!*ATJ:fFCfK0Bl7@$AKZ).AKYr#FD*99$4R>ABPDN1
@<-BsDJ*NtASuT4@WH1#B6,24@;^?5@V'FgAnc@./g*_t+F.mJ+D#(tF:ARc+EqaEA0>u-@<<W+
F!,")Anc-oA0>DoAT24$+E)-?FD,5.E+*j%+EV:.+:SZrEbT0#DII?(GAhM4+DGm>Eb0?$Bl7Km
+=_MO@q]:gB4YU+.Nh-%D/aPI+:SZe@:O(qE-!.1DIal1AM%q6An?!oDI[BuB-;,3ATD4$Bl@m1
+CT;%+Dl72BHUnqF*(u6%16Nb+EV:.Gp$O9AKZ28EbfB,B-;D4FD)e5ATMo8D..NtEbSru/g*Gt
A1Sj;AfqNiH#IgJF(KG9@;Ka&@Wcc8FD,5.E-67FA8,OqBl@ltEd8d8;FNl>:JOSd?n<FGDflKr
E,oN5ASuT4@:Ne]A7]Y#@;I&rBOPdkATJu9D]j+C@:F%a+Cf>#AM+E!%16'JAKYMt@ruF'DIIR2
+CoV3E-!.0C2[WnAThH4+CJr&A7-NgDIaktF`_>6F'oFaA8-+,EbT!*FCeu*@X0)<BOr;oC2[X(
Dfp)1ARHWhA7TUr+D>2,AKYo#C1Ums%172kD.Rd1@;Tt)+EVaHDIm?$De<T(FDi:BARopnAKYT!
Ch4`1BmO>C%16-IEcYr5DK?qEBln#2DdmHm@rri8Bl.F&FCB$*F!+n3AKYE)@;0Od@VfTu%17#k
+@g-f89JAaF(JoD%13OO0eOSQ?tsUjA7]pl>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl05Y-=FCfJGC2[WnATf\?C3(g5$4R=t/g+A+C2[Wj>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPL@Vfsl05Y-=FCfJGC2[W8Bkh]<%13OO1G0eS@!-R*Ci`ui
-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-![ACi<c9D..L-ATBGHFD5Q4/no'A
.1HUn$4R>H?85_H+B3#c+D,>.F*&O8Bk)7!Df0!(Gp%$C+CQBb:IH=E@<?0*BlbD,@;KakA0;<g
+<VdL+<Yc>AKWIAF`\a:Bk)7!Df0!(GqLQ                                        ~>
)
showpass 5 put >1{,".".'zz_',SOLOCALE,'_' [ cocurrent 'base'  NB.{*JOD*}
".soclear NB.{*JOD*}


cocurrent 'base' NB.{*JOD*}
0 0$(4!:55);:'sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_' NB.{*JOD*}
showpass 'NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''' ' NB.{*JOD*}
