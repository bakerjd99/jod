NB. JOD dictionary dump: 25 Feb 2017 17:03:59
NB. Generated with JOD version; 0.9.99; 11; 25 Feb 2017 16:44:27
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


DIGITS=:'0123456789'

EDCONSOLE=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.99';9;'25 Feb 2017 17:03:58'

JODVMD=:'0.9.99';12;'25 Feb 2017 17:03:58'

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

bnl=:3 : 0

NB.*bnl v-- list objects in put dictionary database backup files.
NB.
NB. monad:  dnl clStr | zlStr
NB.
NB.   bnl ''        NB. list all words in last backup
NB.   bnl '.'       NB. list backup suffixes
NB.   bnl 'pfx'     NB. list all words in last backup starting with 'pfx'
NB.   bnl 're.12'   NB. list all words in backup 12 starting with 're'
NB.
NB. dyad:  ilCodes bnl clStr | zlStr
NB.
NB.   4 2  bnl 'ex'     NB. macros with names containing 'ex' in last backup
NB.   2 3  bnl 'et.13'  NB. groups with names ending with 'et' in backup 13

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ((0{x) e. WORD,MACRO) *. -.(2{x) e. DEFAULT,MACROTYPE,i. 4 do. jderr ERR001 
elseif. ({. x) e. OBJECTNC do. x bnlsearch__ST y 
elseif.do. jderr ERR001 
end.
)

bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc bnlsearch clPattern

NB. at most one '.' character errmsg: invalid name pattern
if. 1 < +/ y e. NDOT do. jderr ERR010 return. end.

NB. maintains argument compatibility with (dnl)
bv=. DEFAULT ~: 2{x
if. bv *. (0{x) e. TEST,GROUP,SUITE do. jderr ERR001 return. end.

NB. put dictionary directory object
DL=. {:0{DPATH

NB. extant backup numbers errmsg: no backup(s) to restore or search
if. 0=#bn=. bnums BAK__DL do. jderr ERR103 return. end.

NB. search name pattern and requested backup
'pat rbk'=. (NDOT&beforestr ; NDOT&afterstr) y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

if. (,NDOT)-:alltrim y do.
  NB. return backup suffixes
  dot=. (0<#bn){'';NDOT
  ok dot ,&.> 'r<0>0.d' 8!:0 bn

elseif. bfile=. ({.x) dbakf__DL rbk
        NB. errmsg: jfile read failure
 
  badjr uv=. jread bfile;(1{CNDIR),CNCLASS do. (jderr ERR088,' ->'),<bfile 

elseif.
        ol=. uv{ol [ uv=. /: ol [ 'ol oc'=. uv 
        NB. reduce object list for words and macros if class specified
        if. bv *. (0{x) e. WORD,MACRO do. ol=. (oc = 2{x)#ol [ oc=. uv{oc end.

  isempty pat do. ok ol  NB. return sorted last backup name list

elseif. 0=#ol do. ok ol  NB. nothing left to match
elseif. do.              NB. match prefix, infix suffix
  select. 1{x
    case. 1 do. ok ol nlpfx pat 
    case. 2 do. ok ol nlctn pat
    case. 3 do. ok ol nlsfx pat
    case. do. jderr ERR010
  end.
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
u=. dewhitejcr y [ sy=. $y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.

NB. BUG: j 8.05 win64 can lose y shapes - sy$,y recovers y's shape

if. badrc m=. 1 namecats__MK sy$,y do. u return. end.
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

dbakf=:4 : 0

NB.*dbakf v-- fully qualified backup file path.
NB.
NB. dyad:  clPath =. iaObjectNc dbakf iaBackupNum
NB.
NB.  0 dbakf 17   NB. backup 17 of jwords.ijf
NB.  4 dbakf 5    NB. backup 5 of jmacros.ijf

NB. !(*)=. BAK
BAK,(":y),(;x{JDFILES),IJF
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

et=:3 : 0

NB.*et v-- edit text
NB.
NB. monad:  et clText
NB. dyad:  clFile et clText

EDTEMP et y  NB. default edit file
:
NB. write to J temp directory - created by J install
try.

  (toHOST y) write file=. jpath '~temp/' , x , IJS

  NB. open in various editors !(*)=. IFJ6 IFWIN IFJHS IFQT IFIOS IFGTK open
  if. */ wex ;:'IFJ6 IFWIN'  do. 
    if. IFJ6 * IFWIN do. smopen_jijs_ file return. end. NB. J 6.0x win systems
  end. 
  
  if. IFQT do. open file  NB. jqt ide
  elseif. IFJHS *. wex <'wwd_qjide_' do. 0 0$(1!:2&2) '$$$edit$$$',file  NB. qjide
  elseif. IFJHS do. open_jhs_ file  NB. JHS ide 

  NB. running in jconsole on Windows systems 
  NB. WARNING: there is no indication of fork failures 
  NB. testing the existence of (EDCONSOLE) and the alleged
  NB. (file) for every edit operation would slow down normal use
  elseif. IFWIN *. IFJHS +: IFQT do. fork_jtask_ EDCONSOLE,' ',file

  NB. remaining editors are marginal, deprecated or rarely used with JOD
  
  NB. iPhone/iPad  
  elseif. IFIOS do. je_z_ file     
  
  NB. GTK systems are deprecated
  elseif. wex <'IFGTK' do.
    if. IFGTK do. open_jgtk_ file  else. jderr ERR0255 end. NB. GTK 

  elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
  end. 
 
catch. jderr ERR0255  NB. errmsg: unable to open TEMP/*.ijs for editing
end.
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

od=:3 : 0

NB.*od v-- opens and closes dictionaries.
NB.
NB. monad: od clDictionary|blclDictionary
NB.
NB. dyad:  iaOption od clDictionary|blclDictionary
NB.
NB.   od 'test dictionary';'another test dictionary'  NB. open r/w
NB.   3 od 'test dictionary'                          NB. close

1 od y
:
msg=. ERR005 NB. errmsg: invalid or missing dictionary names

NB. list all registered dictionaries (short form)
if. badjr mdt=. jread JMASTER;CNMFTAB do.
  jderr ERR006 return.
end.
dl=. 0{>mdt

select. x
case. 1 do.   NB. HARDCODE: magic numbers read/write codes

  if. isempty y do. ok /:~ dl
  else.
    NB. open read/write
    y=. boxopen ,y
    NB. all dictionary names must be on master list
    if. *./y e. dl do. y opendict__ST 1;mdt else. jderr msg end.
  end.

case. 2 do.

  NB. open read/only
  y=. boxopen ,y
  if. *./y e. dl do. y opendict__ST 2;mdt else. jderr msg end.

case. 3 do.

  NB. close dictionaries
  if. badrc msg1=. checkopen__ST 0 do. msg1 return. end.
  if. isempty y do. y=. {."1 DPATH__ST else. y=.boxopen ,y end.
  if. *./y e. dl do. mdt closedict__ST y else. jderr msg end.

case. 4 do.

  NB. HARDCODE (mdt rows) display dictionary names and source paths
  mdt=. jpathsep&.> 0 2{>mdt
  ok <(/:0{mdt){ |: mdt

case. 5 do. 

  NB. return the currently registered dictionaries as a (regd) script
  mdt=. quote&.> 0 2{>mdt
  mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt
  NB. prefix command to close and unregister all current dictionaries
  mdt=. 'NB. require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,mdt
  ok 'NB. JOD registrations: ',(tstamp ''),LF,jpathsep mdt
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. insure dictionaries are open
if. badrc msg=. checkopen__ST 0 do. msg return. end.

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
0f:[.1,pC3+?:Q&2BXn#1,g=11a"\4+>P\p1,g=10H`/-+>Gbs1,C%-0d&8,+>t>t1*AS"2_uR:
+>Y_p3?U1>+?:Q#2'=V-+>Ybq1a"V0+?:Q'2BX_/+>bks3?U47+?:Q#0d&4o1,C%.+?:Q!0H`2-
+>P&p1E\\#1bp15+>ttt2BXe3+?1K"2BXat1,'h,+>GlF6pjaF;bp(UFCf]=+D#(tFDl1BFDi:E
F(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5&.@rH7+Deru-Df-\!Bl7I"GB4mJH#n(=D0&6:5t".>B6%p5
E$/S,A0>r9Blmo/BOtU_ATAo'De*ENH:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ
@:Wq[+DG_8D]gHBC2[W3+>"^WATT%CF(KH.De*R"FCfK)@:Njt8U=!)6tpO\ATDBk@qAS<5u'g6
;FGSJ@;]UaEb$;&DfTD38l%htBl8$(Eb8`iAP%2?:IK;CDesJe:IJ/X:J=\0-u!F7A18X8DKKH1
Amo1\+EqaEA9/k98U=!)7!3TcDKKH1Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f
9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&
APGHX;GU7p:do50@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R";Fs\a/5/?/79D*3<)$%;=A;I?
<(0ng/4*K=74_/!;G0DR=&(;H<(8iC6:OsR6U=[?Ddm=$F(8X#AKYf-@ps0rBk1dmFD5?$ATDi7
FCAfX6:OsR6UOUJDIIBn+E(_$F`V&$FD5Z2+Dbb/BlkIL+D>J%BOu3,G%#30ATJu1ATMo8Ch[Zr
Cj@.FD]iP+@<6*X6:OsR6Vp6SDdm=$F(8X#Bl@l3Ci<flC`mG&ASuU(Anbgs+E2@4AncKh78m/g
5tt'B;KQJkF<GF3F)tc&AKZ&<Blmiu+>"]j+E)-?0Hb:GAn#CaFE1r7EbT*.ATJu4@VTIaFE8R:
Ec5e;A8,OqBl@ltEd8d:@:O(qE-#K+Cia/rEard(ARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(q
E$0%,D.Oi+BleB;+D,P4+EM76E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,r.BOt[hDKKu/@P_M-
ARfLs+CT)&+EV:;ARuu4DIIBn/6cV#@<6Kq/9GHJF=A>S@:F%aF(9-*E,oN2F)#`,D/XT/F!+n-
C`mq8Blmo/F)YPtAKYT*Df$Uh+EqaEA9/l%DIal2BQ%p5ASuQ3Ci<flC`mV(D.RcuEb/[$ASQ-o
A8,OqBl@ltEd8dG@VTIaF<G(6ART[pDf-\@ATD6kA7]:cF<G+.@ruF'DIIR2+E(_(ARfh'ATVKo
BlkJ>AU&<0ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aQ4
B5M'mAKYE!A0>],@:UKQ:IH=<Ec6)>Ci<`mGAhM4F)5c'A9/l(Bk)7!Df0!(Gp%<LEb'56Bl8$2
+EV%4B4Z0-Ci<flCh7[*Dfor6Eb03"Df0`0Ecc@FDJsZ8F!,OGDfTE"+CT=6@VK^gEd8dLD]ik1
DIm6s+EV1>F<GU8E,oN2ASuTuFD5Z2F)PN0AU&<*F)to0@VfUs+CT.u+ED%8F`MA@+E(_(ARfg)
FCf]=E-682Ci"37E-68D+CT)&+EV=7ATMs%D/aP=/Kf+GAKWC6ATV?sCij_IEc#i>DK?pm+DkOs
Ec3(A@rc:&FE;JEFE2MAF!+'tFCfN8+EM%5BlJ08                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3AM^30d&4o0ea_)0fM'G+>GVo1,(O?+>GVo1,h-J+>GPm0ekF=+>GPm1,LaD+?:Q!2_d!/0f^@2
0K1m40f1"-0fD$70f1"-1GLR+0f:(.0f_$41,0n-0f^stDJW6gDeio<0MXqe.Um:3;f-GgAM>e\
F=f'e-t7(1.3N&>B6A'&DKI"BD/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is
/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#AmC2dU'
BHS[O8l%iS78m/=FCfN8C2[W:-OgDX67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JPG"F_iig%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+Bosu
De3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,4DG%De;D/X3$+Dbt)
A0>u*F*&OG@rc:&FE7luEap4r+=D2>+Dbt)A5d>`CLnkV3Zp."B4Z0-4$"a*Ddd0TD/X3$FCfN8
0Hb1M@:W;RDeip+ATMrJ-OgD2HS-Ks+Dbt)A5d>`CLnqX3Zrc1+u(3VDdd0TD/X3$%14L?+Z_J<
.3L]5-ZW]>Ci<`m;f-GgAL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc
;cFl<<'aD]I4Ym8%15is/g,.VDffPR3[Z:&-RLB0-nH\m-RU8j5U[k++?hhO-p8n)-RU8j.1HUn
$;No?+D58'ATD4$AKYDtC`m\8F)u&)Ch4`4@;KXg+=L]:CagK8EbBN3ASuT4E+*j1ATD[0%13OO
:-pQUF(8m'4ZX]L3b^2h1E[f867sC%ARTUhBHV;;@;KXiBk;=+%15is/g+nH@m)jq+<Ve@/g)tn
+AP6U+A*c#DfTA2DIIBn+Cf4rF)qct%15is/g,=GCh[E&Ch74#+=MI`+CT;'F_t]-FE7lu:-pQU
+<VdqCh[EkA0<!;6tp.QBl@ltEd:#jA7]g)+<VdL+<VdpBk)7!Df0!(GscL\ATLd]@<,jk+<VdL
+<Ve.DfTAeARTUhBM)$.D.Q(N@<6K4+<VdL+<VdL+AH9SEc4lf@<,jk9jqOPDfg8DAISuA67sBs
@<-!D3Zoh5BeD(g+=nW`4<cI%:I7ZB6W?fJ?X[\fA7$c./0H>lHRMZV8ju*H:.&AsC2[Wi.6DT\
BQ5ID/0H>lHRLFH:JsSf@;9^k?R\'X@q]jDBeCMb.3L/a-nK]n/58Dt;GUY.C2[Wi.6DT\BQ6+.
5snOG<*<$d?X[\fA7$bp$4R>;67sC(@;KXg+ED1/BQP@FGpskEEbBN3ASuT4E+*j1ATD[0%15is
/g)8Z+D#D/FEnuO@UWb^F`:i.F<D\K@;KaoDIR$aCNXS=+DkP/@q]mo@qBP"+<VeD@<?!mBl7Bg
@r$4+%15is/g,1CEb@Nr+=ANZ+?L\g-S?bh+<VdL+<W`g-SAnIF`):K+?L\g+=D&8D.P(;+<VdL
+?L\nDIIBn/n8gBDKI68$4R>;67sBmDfT]'FE8R5Cht5;@;KXg+=L]:CagK8EbBN3ASuT4E+*j1
ATD[0%15is/g)N:67sB.+=n]k+<W`i0d%Z$-8%J)0d&.m1*Cof0d%T&+=K?"+C]5)+=AT\/0IVI
+>Fui+F>4Z4D\GHB.4rS+?XXdDffP;/j:Cu@<,ui$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<
-OgCl$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4
>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBl
Eaa$#+CT/5+C\bhCNXT;+:SZG9KbEZHTHL++@K$l<(LA';cI+28l%in@VQ>Z0d&"u+=Jrf3]/cD
+>G!LBlY=_5tbQl6qf-Z.P>FMAg\#p%15is/g,7VGp%0>@<,jkBl7Q+GA(Q*+EV:.Eb-A%Eb-A2
D]iLt@r$4+F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-RT?1DImi2@W$!)-S?bU$>sEq+C]5)
+=Act-OgCl$;No?+CfG'@<?''FD,]+AKYGj@r$4+Et&Hc$;No?+D,>.F*&OC@VTIaF<G(3Ci!Zm
FD5Z2+>"^ID/aTB%159QHZ3D'CLeP8FCfN8C2[W:-OgCl$;No?+EM+(Df0).DdmHm@rri'Des6$
@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6lA0<7AATMs.
De(OL%143e$;No?+EV:2Eb$;2@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+
Ci<`m;f-GgATVL)F>4434tq>&@:O(`+=D8BF*)/8A2#A?$4R>;67sC%Df'&.@UX=l@j#K'G%#3$
A0><$B6A'&DKKqB/KeVLE+NO$ARlopEcQ)=%16uaEZeh/C`k)X@4)KkDImi21a$7FC`k)X/MSU^
$>sEq+>P'KDJUFC/hSL\$>sEq+C]5)+>=63DImi2@W$!)4=;Kc$4R>;67sC%Df'&.@UX=l@j#Jr
ASuU(FD5<-+:SZ+@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-Qij*-nlcQDJUFC-Rg/i3Zp+!@W$!)
4#)(9+C]5)+=Ach+:SZ+0d'qCC`k)Q.3L3'+>G!JDJUFW0mbVt@W$!)-S?bh%14L=+C]5)+=ANc
+>#Vs1*C%DC`keoHSQ^QDJUFC/ghbN$7I\Q@W$!)-RU>c/NP"1+C]5)+?M<)1E^.EC`k)X-Qij*
-o<&UDJUFC-Rg/i3Zp7%@W$!)4#)(=+C]5)+=Ach+:SYe$;No?+<Y-2C`k)X-OgDH0RI8HC`k)X
-Qij*1a"q(,@YP,-S?bU$4R>O@:X7uD*9p&-S?bh/0H,t+>GYp.j-#g+=K<+HX^l/+=Ach.3L2p
+=Ach%13OO:-pQUAn?'oBHUo-Df$U>DJsE(G\M5@ASuT4@UWb^F`8HT+D#S6DfQt3G]75(FCetl
$>sEq+C]5)+C\biDKTe*$>sEq+>=pIDJUG)@:X7uD%-hiATAnJ+C]5)+C\biDKTe*$>sEq+>P'K
DJUG)@:X7uD%-hiATAnL+C]5)+C\biDKTe*$>sEq+>b3MDJUG)@:X7uD%-g]$;No?+AH9^Gp%$;
+ED%1@;0UnDJ()6ATMs7+CfG+FD55nCi"A>A7]^kDIal.DBO%7AKYf-@:Wq[+E(_(ARfh'/e&._
67sBPAfu2/AKYf-@:UL%D/X3$+EV19F<GX7EbTK7F!+n3AKYJr@;]^hA0>;'Ci=D<De:,6BOu6r
+EV19FE7lu:-pQUD09oA+C\n)Eb0E.F(Jl7+:SYe$;No?+<Y-2C`k)Q%14LoDJUFC-Rg/i3ZqmL
C`k)Q%13OO:-pQU+C]5)+=AdODfor>-OgD2@W$!)-RU>c/NP"`DJUFW0mdAIC`k)X-OgCl$;No?
+<Y-2C`k*C@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq
.3L3'+C]5)+=BKO:J<,F$4R>;67sB'@W$!)-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4
<'`iE740N,/NP"`DJUFC8PW54/3>V6@W$!0/gh)8%15is/g)hj@W$!)-RT?1-nlcSDJUFC-Rg/i
3ZoP!+C]5)+=ANG$4R>;67sB7+C]5)+=Ach%14LmDJUFC/gi(j/NP".+C]5)+=Ach%13OO:-pQU
0HahBC`k)X@rHL-F=.M)-nlcSDJUFC-Rg/i3Zp+!@W$!)4#)(kDJUFC/gh)8%15is/g)hj@W$!)
-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP".
+C]5)+=BKO:J<,F$4R>;67sB7+C]5)+=D&8D.P>0Dfor>-OgD20fpaS:/jMY:JEMj4"!Tp<)c.M
9LU<X+>#Vs0HahBC`k)s:/iSl4#2.lDJU[Q-OgCl$;No?+>G!JDJUFC-OgD20fpb(D/X3$0N;V)
F>,((-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k)Q%13OO:-pQU0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs0d'qCC`k)X-OgCl$;No?+>G!JDJUFC/n8gBDKI68$7IVj-Za-CCLo2!
ATMrI-Rg/i3Zp."@W$!)4#2.lDJU[Q-OgCl$;No?+>G!JDJUFCDIIBn-OgD20fpb(D/X3$0iV_*
F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-Za-CCLo4J%13OO:-pQU0d'qCC`k*C@;TR.@rHL-
F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFCF)>i2AM>J_4#2.lDJU[Q-OgCl$;No?+>P'K
DJUFC-OgD20fpalDf9H5D/X3$0IJq0@W-1$F)>i2AMGPo-Y[I?F)>i2AM>Jn-Y[I?F)>i2AMGP]
+>#Vs1*C%DC`k)Q%13OO:-pQU1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*C%DC`k)X-OgCl$;No?
+>P'KDJUFC/n8gBDKI68$7I;b0e"Y90I1'f.3L3'+>P'KDJUFW1OESKCaUh_%13OO:-pQU1*C%D
C`k*C@;TR'%14L<4""`[FE;;;CLo4J.3L3'+>P'KDJUFCBl8$6D/X3$0ddD;%15is/g)nl@W$!)
-Z3@0AM.J2F`):K%14L<4""KUDesK3Deio<-Rg/i3Zp1#@W$!)-Xq"4CaUbq14*JJC`k)X-OgCl
$;No?+>Y-LDJUFC-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.ECaUS>$4R>;67sB:+C]5)+=Ach
%14LmDJUFC/gi(j/NP"1+C]5)+=Ach%13OO:-pQU1E^.EC`k)X@rHL-F=.M)-o!e2F*22=ATM^,
CLo4J.3L3'+>Y-LDJUFW0mdAICaUh_%13OO:-pQU1E^.EC`k*C@;TR'%14L<4"#)lBlmp-D/X3$
0deCm/NP"1+C]5)+=D5Q-OgCl$;No?+>Y-LDJUFCDIIBn/n8gBDKI68$7I;b0e"Y90I1'f.3L3'
+>Y-LDJUFCF*/i]4#2.lDJU[Q-OgCl$;No?+>b3MDJUFC-OgD20fpb(D/X3$0MPtcEc3WZ4"#)d
Deio<9jqOPD_WV$-Za-CCLo4p@:O=r0IJq0F)>i2AMHnf@rcKB-Rg/i3Zp7%@W$!)-RT?1%15is
/g)tn@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%@W$!)-S?bU$4R>;67sB;+C]5)+=AdODfor>-OgDX
67sB;+C]5)+=D&8D.P(($;No?+>b3MDJUFCDIIBn/n8gBDKI68$;No?+>=om+C]5)+=ANG$4R>;
67sB7+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+C]5)+=Ach%13OO:-pQU0H`(m@W$!)-SAnI
F`):K%15is/g)hj0d'qCC`k*C@;TR'%15is/g)hj0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n
@W$!)-RT?1%15is/g)hj1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n@W$!)-S?bU$4R>;67sB7
+>P'KDJUFC/n8gBDKI68$;No?+>=on+C]5)+=D&8D.P(($;No?+>=on+C]5)+=D&8D.P>0Dfor>
-OgDX67sB7+>Y-LDJUFC-OgCl$;No?+>=oo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y-LDJUFC
/gh)8%15is/g)hj1E^.EC`k)X@rHL-F=.M):-pQU0H`.o@W$!)-Z3@0AL@oo:-pQU0H`.o@W$!)
-Z3@0AM.J2F`):K%15is/g)kk0d'qCC`k)Q%13OO:-pQU0d&1n@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp."0d'qCC`k)X-OgCl$;No?+>Fun+C]5)+=AdODfor>-OgDX67sB8+>G!JDJUFCDIIBn-OgDX
67sB8+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Fuo+C]5)+=ANG$4R>;67sB8+>P'KDJUFC/gh)8
-t7(1+=Ach.3L3'+>Fuo+C]5)+=Ach%13OO:-pQU0d&4o@W$!)-SAnIF`):K%15is/g)kk1*C%D
C`k*C@;TR'%15is/g)kk1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0d&7p@W$!)-RT?1%15is/g)kk
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0d&7p@W$!)-S?bU$4R>;67sB8+>Y-LDJUFC/n8gBDKI68
$;No?+>Fup+C]5)+=D&8D.P(($;No?+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>G!JDJUFC
-OgCl$;No?+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>G!JDJUFC/gh)8%15is/g)nl0d'qC
C`k)X@rHL-F=.M):-pQU1*A:o@W$!)-Z3@0AL@oo:-pQU1*A:o@W$!)-Z3@0AM.J2F`):K%15is
/g)nl1*C%DC`k)Q%13OO:-pQU1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#1*C%DC`k)X-OgCl
$;No?+>P&p+C]5)+=AdODfor>-OgDX67sB9+>P'KDJUFCDIIBn-OgDX67sB9+>P'KDJUFCDIIBn
/n8gBDKI68$;No?+>P&q+C]5)+=ANG$4R>;67sB9+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>P&q
+C]5)+=Ach%13OO:-pQU1*A@q@W$!)-SAnIF`):K%15is/g)nl1E^.EC`k*C@;TR'%15is/g)nl
1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1E\Cp@W$!)-RT?1%15is/g)qm0d'qCC`k)X-OgD2@W$!)
-S?bq+>#Vs1E\Cp@W$!)-S?bU$4R>;67sB:+>G!JDJUFC/n8gBDKI68$;No?+>Y,p+C]5)+=D&8
D.P(($;No?+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB:+>P'KDJUFC-OgCl$;No?+>Y,q+C]5)
+=Ach%14LmDJUFC/gi(j/NP"1+>P'KDJUFC/gh)8%15is/g)qm1*C%DC`k)X@rHL-F=.M):-pQU
1E\Fq@W$!)-Z3@0AL@oo:-pQU1E\Fq@W$!)-Z3@0AM.J2F`):K%15is/g)qm1E^.EC`k)Q%13OO
:-pQU1E\Ir@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1E^.EC`k)X-OgCl$;No?+>Y,r+C]5)+=AdO
Dfor>-OgDX67sB:+>Y-LDJUFCDIIBn-OgDX67sB:+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q
+C]5)+=ANG$4R>;67sB;+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+C]5)+=Ach%13OO:-pQU
1a"Lq@W$!)-SAnIF`):K%15is/g)tn0d'qCC`k*C@;TR'%15is/g)tn0d'qCC`k*C@;TR.@rHL-
F=.M):-pQU1a"Or@W$!)-RT?1%15is/g)tn1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or@W$!)
-S?bU$4R>;67sB;+>P'KDJUFC/n8gBDKI68$;No?+>b2r+C]5)+=D&8D.P(($;No?+>b2r+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y-LDJUFC-OgCl$;No?+>b2s+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y-LDJUFC/gh)8%15is/g)tn1E^.EC`k)X@rHL-F=.M):-pQU1a"Rs@W$!)-Z3@0AL@oo
:-pQU1a"Rs@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&.m@W$!)-RT?1%15is/g)hj0d&.m@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&.m@W$!)-S?bU$4R>;67sB7+>Fum+C]5)+=AdODfor>-OgDX
67sB7+>Fum+C]5)+=D&8D.P(($;No?+>=om+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=om+>G!J
DJUFC-OgCl$;No?+>=om+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>G!JDJUFC/gh)8%15is
/g)hj0d&1n@W$!)-SAnIF`):K%15is/g)hj0d&1n@W$!)-Z3@0AL@oo:-pQU0H`(m0d'qCC`k*C
@;TR.@rHL-F=.M):-pQU0H`(m1*C%DC`k)Q%13OO:-pQU0H`(m1*C%DC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`(m1*C%DC`k)X-OgCl$;No?+>=om+>P'KDJUFC/n8gBDKI68$;No?+>=om+>P'KDJUFC
DIIBn-OgDX67sB7+>Fuo+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fup+C]5)+=ANG$4R>;67sB7
+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fup+C]5)+=Ach%13OO:-pQU0H`(m1E^.EC`k)X
@rHL-F=.M):-pQU0H`(m1E^.EC`k*C@;TR'%15is/g)hj0d&7p@W$!)-Z3@0AM.J2F`):K%15is
/g)hj1*A7n@W$!)-RT?1%15is/g)hj1*A7n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A7n@W$!)
-S?bU$4R>;67sB7+>P&n+C]5)+=AdODfor>-OgDX67sB7+>P&n+C]5)+=D&8D.P(($;No?+>=on
+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=on+>G!JDJUFC-OgCl$;No?+>=on+>G!JDJUFC/gh)8
-t7(1+=Ach.3L3'+>=on+>G!JDJUFC/gh)8%15is/g)hj1*A:o@W$!)-SAnIF`):K%15is/g)hj
1*A:o@W$!)-Z3@0AL@oo:-pQU0H`+n0d'qCC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1*C%DC`k)Q
%13OO:-pQU0H`+n1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1*C%DC`k)X-OgCl$;No?+>=on
+>P'KDJUFC/n8gBDKI68$;No?+>=on+>P'KDJUFCDIIBn-OgDX67sB7+>P&p+C]5)+=D&8D.P>0
Dfor>-OgDX67sB7+>P&q+C]5)+=ANG$4R>;67sB7+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>P&q+C]5)+=Ach%13OO:-pQU0H`+n1E^.EC`k)X@rHL-F=.M):-pQU0H`+n1E^.EC`k*C@;TR'
%15is/g)hj1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\@o@W$!)-RT?1%15is/g)hj1E\@o
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\@o@W$!)-S?bU$4R>;67sB7+>Y,o+C]5)+=AdODfor>
-OgDX67sB7+>Y,o+C]5)+=D&8D.P(($;No?+>=oo+>=pIDJUFCDIIBn/n8gBDKI68$;No?+>=oo
+>G!JDJUFC-OgCl$;No?+>=oo+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>G!JDJUFC/gh)8
%15is/g)hj1E\Cp@W$!)-SAnIF`):K%15is/g)hj1E\Cp@W$!)-Z3@0AL@oo:-pQU0H`.o0d'qC
C`k*C@;TR.@rHL-F=.M):-pQU0H`.o1*C%DC`k)Q%13OO:-pQU0H`.o1*C%DC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`.o1*C%DC`k)X-OgCl$;No?+>=oo+>P'KDJUFC/n8gBDKI68$;No?+>=oo+>P'K
DJUFCDIIBn-OgDX67sB7+>Y,q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,r+C]5)+=ANG$4R>;
67sB7+>Y,r+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,r+C]5)+=Ach%13OO:-pQU0H`.o1E^.E
C`k)X@rHL-F=.M):-pQU0H`.o1E^.EC`k*C@;TR'%15is/g)hj1E\Ir@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&5++C]5)+=ANG$4R>;67sB;+>Fuo0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,0n\DJUFC/gh)8%15is/g)tn0d&5++C]5)+=AdODfor>-OgDX67sB;+>Fuo0d'qCC`k*C@;TR'
%15is/g)tn0d&5++C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1*C%DC`k)Q%13OO:-pQU1a"Lq
1,9t]DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P\p@W$!)-S?bU$4R>;67sB;+>Fuo1*C%DC`k)X
@rHL-F=.M):-pQU1a"Lq1,9t]DJUFCDIIBn-OgDX67sB;+>Fuo1*C%DC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,C%^DJUFC-OgCl$;No?+>b2q+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5-
+C]5)+=Ach%13OO:-pQU1a"Lq1,C%^DJUFC/n8gBDKI68$;No?+>b2q+>P_q@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-RT?1%15is/g)tn0d&5.
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1a$7FC`k)X-OgCl$;No?+>b2q+>Pbr@W$!)-SAnI
F`):K%15is/g)tn0d&5.+C]5)+=D&8D.P(($;No?+>b2q+>Pbr@W$!)-Z3@0AM.J2F`):K%15is
/g)tn0d&5/+C]5)+=ANG$4R>;67sB;+>Fuo2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,U1`
DJUFC/gh)8%15is/g)tn0d&5/+C]5)+=AdODfor>-OgDX67sB;+>Fuo2'?@GC`k*C@;TR'%15is
/g)tn0d&5/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2BZIHC`k)Q%13OO:-pQU1a"Lq1,^7a
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pht@W$!)-S?bU$4R>;67sB;+>Fuo2BZIHC`k)X@rHL-
F=.M):-pQU1a"Lq1,^7aDJUFCDIIBn-OgDX67sB;+>Fuo2BZIHC`k*C@;TR.@rHL-F=.M):-pQU
1a"Lq1,g=bDJUFC-OgCl$;No?+>b2q+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&51+C]5)
+=Ach%13OO:-pQU1a"Lq1,g=bDJUFC/n8gBDKI68$;No?+>b2q+>Pku@W$!)-Z3@0AL@oo:-pQU
1a"Lq1,g=bDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Po!@W$!)-RT?1%15is/g)tn0d&52+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo3$;[JC`k)X-OgCl$;No?+>b2q+>Po!@W$!)-SAnIF`):K
%15is/g)tn0d&52+C]5)+=D&8D.P(($;No?+>b2q+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>,+C]5)+=ANG$4R>;67sB;+>P&p0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,0n\DJUFC
/gh)8%15is/g)tn1*A>,+C]5)+=AdODfor>-OgDX67sB;+>P&p0d'qCC`k*C@;TR'%15is/g)tn
1*A>,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1*C%DC`k)Q%13OO:-pQU1a"Or1,9t]DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>P\p@W$!)-S?bU$4R>;67sB;+>P&p1*C%DC`k)X@rHL-F=.M)
:-pQU1a"Or1,9t]DJUFCDIIBn-OgDX67sB;+>P&p1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,C%^DJUFC-OgCl$;No?+>b2r+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>.+C]5)+=Ach
%13OO:-pQU1a"Or1,C%^DJUFC/n8gBDKI68$;No?+>b2r+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Or
1,C%^DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-RT?1%15is/g)tn1*A>/+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>P&p1a$7FC`k)X-OgCl$;No?+>b2r+>Pbr@W$!)-SAnIF`):K%15is
/g)tn1*A>/+C]5)+=D&8D.P(($;No?+>b2r+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>0
+C]5)+=ANG$4R>;67sB;+>P&p2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,U1`DJUFC/gh)8
%15is/g)tn1*A>0+C]5)+=AdODfor>-OgDX67sB;+>P&p2'?@GC`k*C@;TR'%15is/g)tn1*A>0
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2BZIHC`k)Q%13OO:-pQU1a"Or1,^7aDJUFC/gh)8
-t7(1+=Ach.3L3'+>b2r+>Pht@W$!)-S?bU$4R>;67sB;+>P&p2BZIHC`k)X@rHL-F=.M):-pQU
1a"Or1,^7aDJUFCDIIBn-OgDX67sB;+>P&p2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,g=b
DJUFC-OgCl$;No?+>b2r+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>2+C]5)+=Ach%13OO
:-pQU1a"Or1,g=bDJUFC/n8gBDKI68$;No?+>b2r+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Or1,g=b
DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Po!@W$!)-RT?1%15is/g)tn1*A>3+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P&p3$;[JC`k)X-OgCl$;No?+>b2r+>Po!@W$!)-SAnIF`):K%15is/g)tn
1*A>3+C]5)+=D&8D.P(($;No?+>b2r+>Po!@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G-+C]5)
+=ANG$4R>;67sB;+>Y,q0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,0n\DJUFC/gh)8%15is
/g)tn1E\G-+C]5)+=AdODfor>-OgDX67sB;+>Y,q0d'qCC`k*C@;TR'%15is/g)tn1E\G-+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1*C%DC`k)Q%13OO:-pQU1a"Rs1,9t]DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>P\p@W$!)-S?bU$4R>;67sB;+>Y,q1*C%DC`k)X@rHL-F=.M):-pQU1a"Rs
1,9t]DJUFCDIIBn-OgDX67sB;+>Y,q1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,C%^DJUFC
-OgCl$;No?+>b2s+>P_q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G/+C]5)+=Ach%13OO:-pQU
1a"Rs1,C%^DJUFC/n8gBDKI68$;No?+>b2s+>P_q@W$!)-Z3@0AL@oo:-pQU1a"Rs1,C%^DJUFC
DIIBn/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-RT?1%15is/g)tn1E\G0+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Y,q1a$7FC`k)X-OgCl$;No?+>b2s+>Pbr@W$!)-SAnIF`):K%15is/g)tn1E\G0
+C]5)+=D&8D.P(($;No?+>b2s+>Pbr@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G1+C]5)+=ANG
$4R>;67sB;+>Y,q2'?@GC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,U1`DJUFC/gh)8%15is/g)tn
1E\G1+C]5)+=AdODfor>-OgDX67sB;+>Y,q2'?@GC`k*C@;TR'%15is/g)tn1E\G1+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Y,q2BZIHC`k)Q%13OO:-pQU1a"Rs1,^7aDJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+>Pht@W$!)-S?bU$4R>;67sB;+>Y,q2BZIHC`k)X@rHL-F=.M):-pQU1a"Rs1,^7a
DJUFCDIIBn-OgDX67sB;+>Y,q2BZIHC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,g=bDJUFC-OgCl
$;No?+>b2s+>Pku@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G3+C]5)+=Ach%13OO:-pQU1a"Rs
1,g=bDJUFC/n8gBDKI68$;No?+>b2s+>Pku@W$!)-Z3@0AL@oo:-pQU1a"Rs1,g=bDJUFCDIIBn
/n8gBDKI68$;No?+>b2s+>Po!@W$!)-RT?1%15is/g)tn1E\G4+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y,q3$;[JC`k)X-OgCl$;No?+>b2s+>Po!@W$!)-SAnIF`):K%15is/g)tn1E\G4+C]5)
+=D&8D.P(($;No?+>b2s+>Po!@W$!)-Z3@0AM.J2F`):K%13OO%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO-o!\)3]&9.4==THF(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?Xn"kE,&<gDeio<0MXqe.V!C6E,&<gDeio<0HbHh/Kf.HF*&NQ@rH4'C+19C@;TQuDdm=$
F(8X#Bl@lA%15is/e&._67sB^BOu'(FD,5.+EMXFBl7Q+-ndV14ZX].@;p0s@<-E3+DG^9+CQBb
+<YlHEb$:8-t@14E,$gEGA1l0%15is/g,(AAp&0)@<?''@;^?5+Dbt+@;I'(@;TRs/g*r!Ap&0)
@<?'k+DtV)ATJt:@V'1dDBL'GBln#2FD,4p$;No?+E2@4AncK4+=L#P7TEAS:e"P9+<Y*1A0<!;
ASu$$+EqOABHSF<@;]UoD'0s1@<6!&+AP3s76sUD83m[l:-pQUF*2),Bm=31+<Ve:Df0Z;Des6$
A0<"(Gp"4X:I7NN;aWoI<%0FB+<X3hB4tjs+<VeM@;L'tF!)TDAdo)B67sB/:I7NN;aWoI<%/r&
ASu("@<?''Ci=3(ATAo%DIal+ATMo8Ch[ZrCj@.FD]iP+@<6*)DIIBnF"Rn/:-pQB$;No?+Eh=:
@UX@mD)r+5:-pQB$;No?+<Vd].3N&?F*2>2F!,R9F*&O8Bk)7!Df0!(Gp"MWATMs.De(ON+D#e3
F*)I4$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC+
+EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2
-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc
;cFl<<'aD]I4Ym8%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<!B-OgCl$;No?+Cf(nEa`I"ATAo8
@:F%a+ED%4Eb0<'DKK</Bl@l3De:,,+EqaEA90:E@ps1i3ZoP[@r`\>G%G]'-OgDt@ra^n><3m4
4"akp+=JruHXSNU+=nX>3Zp:'3]/$B%13OO:-pQUA7]@eDIjr7DfTA2GA2/4+E(_$F`V&$FD5Z2
%17#_Ap&0)@<?'tAM?8.+>Y-$+>=63:-pQU-ndV14ZX^(@V0b(@psIj+Dbt+@;I'(@;TRs%14J!
De!3lF!,R<@<<W)ATT&=ASH0q-Ts()Gmt*mDfT3.Df90)/g,E^A8a(0$6UI-De!3lEt&I!+EqC2
Eb#Ud+<YA@4Y@j%Ci<flCi^$m+<YkN4Y@jk%16ZaA1e;u.1HUn$;No?+Dbt+@;I'*Cgh$q+DtV)
ATJ:fCi3ZuATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$
3B9*,-OgCl$;No?+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z<I+F`V&$FCf<#
0II;:%15is/g,1G@:UKi@:O'q@;]TuA7]@eDIjr7Bln#2Ddm=$F(8X#ARlp$@;TRs%14g4>9GUC
3\W6B+BosM0mdDKD/a54-Z<I+F`V&$FCf<#0II;:%15is/g+tK@ps0rDdm=$F(8X#ARlp$@;TRs
%17#k@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]CLoLd
3F=-C$4R=j,B%I.D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+E).+D.Rbt
$4R>`BQ%p5ASu?r0KhH>1E\_$0F\@:Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0
D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/
$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/
@WNY>F(fK4FCf?,AM@IW5s]R/DeioE3B:Fo%13OO:-pQUF*)>@AKY])+Co1rFD5Z2@<-W&$>"6#
FDYu5Ddso/F`\`RF(fK4FCf?,AM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7Jk$8EZ-+>=s"
0JG4(>9H!^HXgu2E,$LCF(fK4FCf?,AM>J@$4R>;67sBsDe!3l+EM47Ec`FA@;TRs%17/o@;TRs
4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$7I-?
DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&dDIIBnEt&Hc$4R>;67sB4
HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIV
FDYu5De!-?5s]R/DeioE3B:GVDf'H.;f-GgAM>i667s`tDf'H.;f-GgAM>h]F=f'e-t@14E,$gE
G%#3$A0><$B6A'&DKI"BD/X3$+EV19FE9&A:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3L$\
ATMs.De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$
ARmhE1,(C9F(K;E0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et+>>E./i5'c:-pQU
0f<]gCbd^fEb0,sD.R6#Ao_g,+=L`<D/a5V@<6-m.3N&:A0>;kC3=T>ARloqDfQsm+?1u-1^ZuE
/g)8Z+<VdL+<Y*1A0>c$G9A;TD/X3$/7N%/Bk&]1@<-!l/9>oRATMoD@rc^5BIP'GATMs-DJ()4
AS5^oAI8cSDe!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OO@%Bl8!'
Ec`EOBkhQs-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$4:?b+E(d5-Zip@FD>`)0II27:-pQUBl8!'Ec`FF
Df'&.F*(i.A79Lh+EqaEA9/l8D]iP.D/aN,F)q[^Df02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=X
3Zp4$3Zp*`$=[pl+?_>"Eb/ZqCjBi8DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to
+>=.@An?3u@qB_&Bm+'/FCB&t@<,n"+?_>"@W-/l$?TriFCB3$@<5sfD..'kDJ*C!DJsT<@;]Ua
Eb&U#@;Ka&4Y@jdDf6aJ+F+;$-WEN&8P`>b+Al-7<(01t:-hTC;]nA(73Fli;bnN';H6IZ84>oh
6r-lZ-QkQ)+C]8-$48.N9M[u@9N*'&=@5b^6q'Kk4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-VSGr
B22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@h*@j"tu-ZW]>FEhmT4ZX]qDf'H.+=Bj$DJ)^QD.RcS
Eb/-[@;Kb*87?OL<,Y`]E+LC(0d'[CF)>i<FDuAE+EVjM$4:ifDfTq_3Zp4$3Zp*`:-pQUDIIBn
F!+n-CiX)qA9f;9DIjr#BOPp(/KeqLF<G(,@;]^hA-ua./pReL4YC.c.NgJRH9Elh+=\LZ+=\LZ
$7Q;hATAo8D/a<0@j#`5F<DrPBQ%p5-OOm(+Bos9Eap56G]Y;r3b*)FE,$LCF(fK4F=.DM+Bot0
D/XQ=E-67FFEhm7$4:]\C1UmsEb/j(4ZX]A+?CW!$>Epc?XI_\C1Ums4Y@k&+AP6U+CoC5DJsV>
@rH4'Eb0<5+E(_(ARfh'$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4$4:<XEb/a&?[-g?
?Tg"aGp#jK/g+\C+Du+>+Cf>,E,oN2F!,:;@ps1bEsa?'$>"6#FDYu5Ddso/F`\`RDdmHm@rua&
Aof=,Eap4r+=D2>+EVjM-TsM#Df'H.+=D):C1UmsEb/j(-OMRN>9J!(Dfp/@F`\aJG]X9"B5DKq
@;KsqAog*r1E\_$0FDH/Ddm-kF!)qT@<,p%.NiVIF<E%U@rH4'Eb0<5ARlo5+F+;C$4:?b+EVI>
Ci<f+E-67F-YI76@UX(nAS-!2$?BW!>9G;6@j#l<F=044+Cf>,E,$LCB5DKq@;KsqAof=,0d'[C
F)>i<FDuAE+EVjM$47,NARfObEb/d&@rH<tF$2Q,1a"h%0FA.^67sBkARfObEb/c(F(9--ATJu&
Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,od:-pQUAU%^$F_#&o+D,Y4D'3q6AKYK$D/aN,F)u&6DBNn=
De!@"Es`7mG%G]7Bk1d<3bN8I@UX(o4ZX^1+<XEG/gr1u4Y@jqG%G]7Bk1ctB5DKq@;Kul$=[pl
4YCDdD`o^pDf7ck+>Fu]+<VdL:-pQU-n6Z/3ZqmMD]i_3D]j.?D[Hh`DfT3&@;TRs/g,E^A8a(-
+<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBpD/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT\
+<VdL-[0,EB4Z0-@rc^0@q]Fa+E)CE+E(j7AU%p1FCf?"ALAT`/g,%?D.Rc2.NiV;D.RbqASu$2
$4:HbD]gMPGmYu-$>"6#FDYu5Ddso/F`\`RA7]7e@<,piF(9--ATK4+Eap4r+=D2>+EVjM-TsL5
@rH4'C*4m7ARfObEb/d&@rH<tF!h;L+Bot0D/XQ=E-67FFEhm7$>jL%ARojlDfB9/4ZX]A+?CW!
$49Np/g+tK@ps0rBlbD*F)u&.DIm?$Ci<flC`m/(A0>N$Ddm-k$;No?+EqL1DBNA*Gp$s<G\(D.
F(9--ATJu&Eb-A(ATVKnFCeu*Df0B:$;No?+EqL5FCcS9E+*6f+DGm>Eb0*+G%G2,/KcHSCi<d(
.3NYBE,Tc=EsbZ//g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEs`7jDe!3l4Y@k&$>aWj@;J(f
+>P&h+Dbt+@;H9"$4:?b+EVI>Ci<f+E-67F-Z*RBARojlDfB9/-OOm(+Bos9Eap56G]Y;r3ZqpN
D/a54-Z*RBARojlDfB9/-OMRN>9J!(Dfp/@F`\aJG]X9"@rH6sF`V,)F(9--ATL!q+>Y-$+>=-0
:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V$:-pQUCh[Zr+Cf>-
Ap&0+A0>r'DfB9/+E).6Gp%<EBlmo/F)YPtAKY].+ED%1Dg#]&/db??/g,7LBlbD2F!,R<AKZ&&
An?%*+EV:2DJ()6D]iS//g)99BOr;7B5DKqF"%Gk67sC(ATD6&A7]jo@ruc7@;]TuEb03.Ecc@F
@rH6sF`V,)+Co%nCgh?mFD5Z2F"Re,:-pQU@W-0-BlbD-ARfObEb/c(Ci<flC`m/(A0>N$Ddm-k
+>"^KD]iY+B6A6+$4:6\D`r@g+<VdL+<VdL:-pQU-n6Z//g+VAD[L/rD`o^^Df6aJ+F,(P:-pQU
-n6Z/3ZqmMD[Ip#$>"6#FDYu5Ddso/F`\`R@rH6sF`V,)F(9--ATK4+Eap4r+=D2>+EVjM-TsL5
@rH4'C*4m6Df000F(Jm'@rH<tF!h;%:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.s
De!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8,RQD/X3$0JH6g/h1CG
A5d>`CLo1R+ET1e+=Lc7A18XBD/X3$+EV19F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?
+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3e
Ch4%_:-pQU+<WHh+AtWo6s!8X<(.pOATMr9A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8
A2#PWFCfN8C2[W;/0K%GF*)/8A2,bh+EV19FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.
ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQaFtks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+
C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,VEc5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdL
Ecl7BBl5&.F`(t;Ci<flCh4%_%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-
$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;
5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUFD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6
Eag.>A8,R'+DGJ+DfTE1+DGpFF!+n3B6A'&DKKqP%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/>?
%13OO:-pQUDKTf*ATAo3AftVu@ruF'DIIR"ATJu4DBNn,FD)e6F`VXID..NrBFP;'+?^hl+FPjb
A8,Qs0F\?u$>"6#De'tP3[]#\F*)/8A2,3KATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe
+Co1s+>=63%16Ze+E]h.+>=pKBk/>?%14s84Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\
EX`?b$>"6#1E^UH+?MV3FCfN8C2[W:+EV19FD>`)0eb:/%16Ze+E]h.+Co1s+FYFe%14m64Wksl
0d(FL@r!30%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,A8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R
+ET1e+=Lc<CagKJD/X3$+EV19FE9&D$;No?%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5
B6A'&DKI!D@psFiF!)TDAfr3EA8Z34/g)93F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;
G%#3$A0>AjF(KD8@<,p%@;L"'+EV19FCeu8%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(F?C3=>J0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9
@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!K
B5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBk
ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(
4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.
@ruF'DIIR2+DGm>Df-\>BOr<*@<?/l$8N_e+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/
FEn<&0H`M$,<d5)+F>4b+CoA++=ANG$8<Sc+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'M
DJUFC-OgD:+?^hl4s2R&HQY*eA8Z3+-RT?10H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0
F<GXCD.Oi5ATD7$%178r@;TRs4ZX]5@Wuj'0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp
$=\4"A2-5.+>"$0@Wuj'1-IZ@1E\_$-[6a`+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH
0RInYE,9H&+E2IF+?MW-DIIBnEt&Hc$;No?+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&N
Eb$jHDKg,30d(@XEb$pJDKg,31E^RZEb%!S%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu
-tt:V1*AA%4")g;5;=i@4"*'K+=/-p2'=Y"2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5
Ddso/F`\`f3c8hDD.Rbt$4R=O$7KG&C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f
-nlcSDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/
+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q
.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-N
DJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o
%14L;+>G!LDJUFC@Wui?.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;
+>P'MDJUFC1aa^p/NP"/+?L]-3[\fhEb%!S+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4G
C`k*90deCm/NP"/+?L]-3[\B\Eb$mIDKg,30de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pK
DJUFC-Ql/N/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q
%13OO-nlbu+>=pKDJUFC-Rg/i3Zp."4!6UGDJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%
Bm:aKDJsZ8F"%P*-nlbu+>=pKDJUFCDKg,31aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3
AS,Y$+=M,GF`)7L%14L;+>P&n+CoA++=D2?1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2
Bl7NsGT\DPDfor=.1HV40H`.o0HanDC`k*90deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4
+EM[;AncK4-uNsGDK@69$4R>[ATAnI+>b2p+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.
$>sEq+>=op+>Y-NDJUFCEb$O?+:SZqATAnI+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DAR
Df028%16uaEZd%Y0H`+nA8Z3+-XgXrBl5:-$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*
ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo
/NP"/+?L]-3[\B\Eb$sR+AP6U+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo
/NP"/+?L]-3[\B\Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm
/NP"/+?L]-3[\B\Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>
6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]R/DeioE3B:GXA5d>`CLo1R:-pQ_ARn_VDeio<0HbHh/Kf+ODeio,+EV19FE8RCAfrL5A18WL
DIIBn/6cV#@<6Kq/9GHJF=A=TFCAWpAISuA67sBlA8-."DJ(R2$;No?%15is/g)QRA18XCATMs7
+ED%5F_Pl-+Dl%;AKZ,:ATAo-DKKH1G%GQ5Bl@l3FD,*#+DkP)Gp%$IBOu3,8l%ha$;No?+EV19
FE9&W+@1&k+EV:.+<Yc;F*)IG+EDUB+<Yc>AU,C@F)YQ3DBL&EF`V,7+<YlBDId[0F!)SRDfQ9o
:-pQUBR+Q.EboH-CNCV4DBMPB;^ii2BOQ!*D09oA+C\n)AU%X#Bl7Km+CT.u+Cf5+F(Jl7%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdk
ATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>+0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OgCl$;No?+DG_7ATDl8-uX9?Ed)P<FCcmDGAhM4
F!,C5+Eh16BlA-8+EVmJATJ:f@W-1$@W-NT3Zp*c$>+*m@<??t4ZX]?3B&',+?pu)+>P&p+=&'g
2[p*cBOQ'q6YKnK@:OCjE]lH+-YRFB+Dl72BHVM;De'u7Dfol,+CQC:Df9//@q^!pCER,#F^o27
%16WaF^f/uE,9Z<F`(i1De)!l+=fJq5ThR<%16N\E+O'#Dfe-'+=8]M$?pArD.RcO3ZpLF-Xq"4
Cgq=.+D,G.@<??t+A$6TG%F$S@<,ddFCfJ8A8cU"Ch7R%F`V\CB5_^!+CT,+ATD="F=.M)4tq>*
D/a<0@j#`5F<GdF@;TRs%159QHZUr)3Zp+!0ea__ATT&=DIIBnEt&Hc$;No?+D#(tF<GdGEb$:@
DIIBn/7WL)F)rmSAU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsT+>"]`/3>P4
GA^i+ATJtu+D#(+4#))(0F\?u$;No?+DG_7ATDl8FCfN8F!+n/A0>;uA0>_t@rcL/%159QHSHX^
F`\`RFCfN8@;Kmr@5'A_4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'D`
4"!ci/g+kGDJs$'F`S[IAU&;E%159QHSHX^F`\`RFCfN8@;Kmr@5'Ga4"!ci/g+kGDJs$'F`S[I
AU&;E%159QHScjaF`\`RD.-ppDddI$BONSK-Ta(<4!ua*.j-Po%159QHScjaF`\`RD.-ppDddI$
BONSL-Ta(<4!ua*.j-Po%13OO4tq>*0g.Q?0d(+?F<G[C@;TRs4ZX^6/g)kkA8Z3+-Zip@FCB!)
BONSB%13OO:-pQUARoLs+EV19F=;$8D.P8?AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKu
ARoLsDfQsU+>"]`/3>P4FDbN(ATJtu+D#(+4#))(0b"I!$9g.jF>?!?+>b3RATT&3DIIBnF$2Q,
I4cX!+CoA++=D#7@rcKrCiF&r0II;:%15is/g+_9BlkJ7@:O=r+=M,9D.P8.De*E1FCf]=.3N_@
@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(tFDl1B1E\7l-S.>5HYmY/D.Rc2>9IKf+?M<)F>=:4
%13OO4tq=>+E(d5-Zip@FD>`)0II;:%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcdD/X3$
6$%*]B5TCW0MXqe.VER9@WPIbDeioMF)u&.DD3au+<VeK/M/(f+DG_(Bl[cpF<D]7F)u&.DJ`s&
F<D]EAfr3=B5DKq@;H9G67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>F`)7Q$;No?$;No?+@U<kDfQt2
Bldd&G%G]*A0>E*EbTE(+E_a:+E(j78l%i!+>>eu:LeJh1,(F?+>GW42)I?N0d&f$FD)"V67sBj
@<6"$+EM47F_kS2+ED%8F`M@B+Du*?+Dkh;ARlo+@<6L(B5VQtDKKqB+C]J8+<Yc>AKZ&*@rH6q
$;No?+D,%rCi_39:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?
De!lC3=8MJ/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+$4:9]@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$@rGjn@<6K4
FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I
$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi=:67sB4HW3F4<$5+=
5uL[1/IDh[67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DWDIdI%ARfgJF)u&.
DGP%23]%s?+>=-t67sB/9kAE[De).SB6A'&DKKqK4Y@j2$>+Eu@m)Fe-[K]RFC.sj@:rpp$7KM/
DIY+Y3ZqWL.j-Mg.Ni"(.1-DW67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,EscbuG\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0FB4&ATVU(A3k6KF_t]-FE8lo/g)hTAp&!$4Y@j)H>dqJ
?W2/WB4!"n-t[U>@jsQ%+Bos=+>=of+C,='$47,867sC$ATW'8DK?q1DfTl0@rri6ATN!1F:)T"
+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCF9Gr:-pQUEb03.Ecc@FATDg0DIma/F!,=6G\(D.
@<6L(B5VQtDKH4\67sC)Bl%T.FD,]5G9C=8F(KB6Bl@l3F`);8C`m>(G\(D./Kf.HF*)IGF(fK7
Ch+Z+@:opYEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M2$$;No?+>%q>78m/.;cQ1P
78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?YjXhA5d>`CLqU!F*'*267sa(Ddd0TD/X3$FCfN80H_K[/M/(fCi<`m+CQC6D..6s+Cf>+
Ch7*uBl@l3De:,1@VTIaFE8QIBl8$2$;No?+=M>CF*)/8A2#Gb$;No?$;No?+B3#gF!,R9F*&OG
@rc:&F<G:=+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%FD,6++EV19F<GX7EbTK7F"Rep67sBPF<GX<
Dfol,+Du+>+<Y*/FCfJ8+EV:.+<Y]IDJj0+B-;#/@ps1b+D>>(@q?csF<D]B@:O(o+EV:.$;No?
+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?+CT>4F_t]23XSVK/db??/g)8Z
0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn:-pQU
@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8A2#AR>9G^EDe't<-OL2U67sC)
DfTB0+E(j7G%#E*Dfp+DFEqh:Esb60:J=&R:JEN+3Zp*`6;LBN5u^WS0g.Q?0a^6C:J=GR;cGn@
+?qJ$0eb:+1($?D:J=_R6;0g23ZpX>+>k8r1E[qc1("@[:/jMY:JEN+3Zp-a8PW5a5se764ZX]M
/g*"o1F+\/0FA.V9M[rR9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/$49-k5uLBJ;cGn@+=B`'@;R-2
BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$49^79iODF4ZX]A+?)5%,Tq.h+=A:UAKYE%
AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$:7Nj;cHad7QidT-p0gl:J=GR;cG1s-p0sm:I.rR
8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.jFDYu5Ddso/F`\`M/gkOQ?U6tD
F)>i2AN;b2?Qa&81a`V;:-pQU@3BZ'F*%aQ0RGMsE-67F-Za-CCLo2!ATMrI-T`\1+?^i%+AP6U
+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN
5u^WS0H`\X:J=&R:JEPd6;LBN<'`iE74/F+0RIGQE$-NBDKKr:Deio<-T`G43[[Ko<'aJZ9e[\]
:/k1Y6;0fq$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AM?he@rcKA-Ta(<4""_p+>P`#
$9g.J1a$a[F<DrPD/X3$0MPtcEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+B-:Z+F<GL3@s)a9+EML1
@q@888K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dGE+NnoCi<`m;f-GgATVL)
F>6NW/h1[U@:W;RDeip+ATMrJ+ET1e+<YK=@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+<YT3C1Ums
F!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU<+oue+<Yc;F*&NIF(96)E-*3FCh[Zr+=M&E
@:W;RDeip+ATMrI.3KaIF!)TIH#RJ-@;Kb*+<Y]ID@0-*/g+kGF(o/r+E)@8ATAo8ATMr9+EM%5
BlJ08/g*`-+EM47F_kS2DJsV>+CT).ATAo8BOr;/Ecl8;Bl7Pj:-pQUCi<flCh4`&ASu!h+DGp?
CggghF!,R<AKZ,:F^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/db??/db??/g+SDF*2>2F#jY'
67rU?67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gm[;5/db??/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp$;No?+CfG'@<?'k3Zp130f<B^B.u4N:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:4tq>%A0<7AATMs.De(OL+BosE+E(d5
-RT6.:-pQUGAhM4F!,C5+Eh16BlA-8+EVmJATJ2fDf9GX<)64B4ZX]>$=[plCdD#r9eedl+>F44
Df9Gc8Q/SO3ZpX>+>GQ(,;KU8Df9Gk5se764ZX]M/g*"o0f'pt+>O92Bl8#Y<)64B4ZX]?$>FC"
<'`iE76N[S5;"'9+>Y8t0JEh@Ao)BoFA,8)<'<8b2`E?L3?TUj5;"'70JF_,1C=J!BOPpT8Q/SO
3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OL3%H#6MH69R@P1E\V8+=&(N
3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0$4:6\GZ.RA7RfO%+=K?=:JXYX8Q/S;
/1<VM9M[rR9M&/^.4dS[=\Vj]64+&p67sC%FDl22+Dbt+@;KKtGAhM4Esb)bHZX+DCi<f+E-67F
+tb6\CgTIo6$$m]CLoLd3F<nC/i4p_$;No?+EMI<AKZ)+F*)I14tq=<+E2IF+=D5IDeio=<+U,m
0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.DZ0RGMsE-67F-Za-CCLo5"ATMrJ-T`\2+?^i&+AP6U
+EV19F<GX7EbTK7-OL2U67sBh+D,2/+D5_5F`;C/4tq=rEc<-K@W-1$F)>i2AMGPo+?MV3@W-1$
5u^WS0HahCDeq^=:JEPd@W-1$<'`iE74/F+0RIGQE$-NBDKKr:Deio=-T`G43[\WZF?rl%9e[](
DKJiD6;0fq$49Np/g+RFF*22=AI:UTHSZdWEc<-KF*22=ATM^,CLo4J4!6UG-Za-CCLo5"ATMrI
+EMC<CLo5"ATMrJ-OL2U67sC%Df'&.D.-ppDfZ7L0O$@VE-67F-Za-CCLo4p@:O=r0IJq;0fpas
/g)o*-ON$k>;RIAF`\`RF)>i2AMHnf@rcKB-Ta(<4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#
Gp%0I@:Nk$+A!\aD'370Ch[?iEa`c--OL2U67sBsARTan+Co1rFD5Z2@<-W9DfB9*Ci<`mA9Da.
;f-GgAM>f567sa(Ddd0eF_u(rD/X3$0JFVk/M/)UF_u(?F(96)E-*4CASc9nA8,po+EMC<CLnW1
ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#GTA8,OqBl@lt
Ed8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#A?$;No?
+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH0Js:H:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%17,c+Bos9Eap5.
Ddd0TD/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$7L6R+u(3V
Ddd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT?1%15is
/g,7YEc*"<AnE0-Bl.F&FCB$*Et&I?0RI>LF(KG9-W3B45tOg;7n"de0F\?u$;No?+Co&"ATVK+
@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls
-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2
+EV19F<G+.@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C
-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUA9Da.+CfP7Eb0-1+CT.u+ED%0
Ddd/c$=ma33Zr9JCLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+EVaHDBNk8
+EV=7ATMs%D/aP=@;]TuA9Da.061W?Ddd/c$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$=ma33Zr9J
CLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R=j0fU=;1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,
F`:l"FCf3*A7TCqFE2))F`_>9DGEMN.Wo]@@<?'qDe*BmF*)G:@Wcd,Df-\=/M/)fE+EC!ATJu+
Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2/e&._67sAi$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/
+:SZQ67sBjEb/[$ARmhE:LeKb@V'R&1,(C>%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB73,N)L1,pCs
ASl@/ARlotDKBo.Cht5'@<?Q5@;]TuF(96)E--.D/Kf+KD/a<*Anbgt+A+pn+DkP$DKKH-@;]Rd
%15is/g)i-F(K;G1a$4;A7]9oBPDO0DfU+UFEhmMFDi:4BleB:Bju4,ARloqBl%@%%15is/g)l'
An>F+1a$:HBl8!'Ec`EOBkhQs-Qli.A7]:&C2[W8E+EQ'Eb0*+G%G2,Ao_g,+F7a@%15is/g)8Z
+<VdL+<Y<8DeElt04Sp2AT2HsGT^O2Eb/a&DfU+GF`:l"FCcS8ASl@/ARl5W:-pQU0em9O@PKea
C2[X%A7dH9G]Y'=Bl[cpFDl2F+E2.*@qB=lCh.*t+CSekARl5W:-pQU0emNRGqh9$C2[WnDdtG:
Bl8'<DJsW.F"VQZF<G"&A7]9\$;No?+>GWdF`&rg+=M;BFD>5pA8c@)@<?1(.3N&0A7]9oAoD]4
GA1qG+Dbb0Fa,G[D.-osE+*j%%15is/g)l(C3=DL1*C"9A7]9o-uEC&DJsW.F'hmK<%/q!$;No?
+>GWdF`&rl+D,P4@qfgn+Dbb0AKYQ%A9/kAFDjc#%15is/g)l(C3=>H2]uUKE-WR:BleA=H>.=@
FDi:4Ec5o+Dg3C:DerrqEX`@N67sB81hq/N1,U1pASl@/AKYN(DfB0(GT^U:Ch.*t+Cf>/Gmt*U
67sB82/QcB0fC.pASl@/AKZ;2Bl%@%+>"^JBl%@%+EVNE/hSb0C2[WnATf_8Ch[Hu06;5DFCd*X
/hS8WBl[cpFDl26ATJ:f:-pQU0f<]gCb[diEb0*+G%DdEC2[WsDId='?V"-j9IV*#@<-!l+E(_1
Des!,AKYo#C1Ums%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5
?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>;67sC$ASbpdF(HJ)Bk)7!Df0!(Bk;>p$=e4!E]lH+A8,Qs0F\@Q0RGSuDe't<-OgDH0RI_K
+?MV3C2[WnATf22De'u5FD5Q4-OgCl$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5
DBO%A@:O(eDJ()0Dfor=%159QHZX+DCi<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$>OKiG%G]8
Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU8l%htF*(i'Bl7Q+A8-'q@ruX0Gp%6IA7]d(E-67FA8,Oq
Bl@ltEbT*++CT)#ASrW$Bl[cpFDl2F%15^'6rR&N7n#g;;E[&`C2dU'BQIa(+=JEd-UCEt-S.>q
De!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1/15L\@:s.)C2[W9-OgCl
$;No?+EM%5BlJ08/0Jb;@WNZ#DIal!@<?Q"$?L#H3Zoe`BleB7Ed;D<A0>T(F*(i,Chdm!+ED%7
ATV[*A0>W*A8kstD0$h7De*g-De<^"AKYhuDJ<]oF*)/8A0>\s@V'dmD/a<&0JG4(C2[WsDKKo;
+DPh*A9Da.-OgE(Ccsg%F)3BT+A?3Q7!3?c+DPh*@V'V&+DG_7FCB!%C2[Wl@<<W4ATMF)C2[Wl
@<<W,De*g-C2G).De+!3ATD:!DJ!Tq@UX%"%17/m4ZX]I3ZrK[/12QTDe*ftAm\M><$6!kDKU2A
DffQ3?W:-,+DkOsDJsW.F'hmK<$r+^%17,c+Bos9Eap5,De*p!E[O"2+>b3RATT&9C^g^\$;No?
+EM+9+EM%5BlJ08%14M1/g<"mC2[X(@ra"]3Zrc1+u(3TDe*p!EX`?b$;No?+EDUB+A+pn+DkP)
BkCptF:AR*-nlf*0ek@2+?DP+0KLX*D..<rAn?%*C2[Vl$4R>;67sC'E+EC!AKYT!Ch7Ys$8=Rj
FDjboC2[X%@<-4+.3K`U+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*fqEc#kMBkh]:%14dO.!0B"
+DPh*E,ol/Bl%?0+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[X%Ec5Q(Ch555C3(a3$8=RjFDjbo
BPDO0DfU,<De(:>+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj2/BleB7Ed99ZG]Y;B$8=RjFDjboC2[X%
Ec5Q(Ch5%<+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@A8lR-Anc'm@UX%)Bkh]:%14dO
.!0B"+DPh*E+*d(F"&4S+<VdLAp890FCcRe:IJ,\5t=@38Q%)eC2[Wl@;@N2De*fqEc#l,@;@K0
C3(a3$8=RjFDjboC2[X*F(KB%Df00$B4>:b.3KaFGB.D>AKXT@6rR&N7n#g;;Cj21De*<cCG0F@
A9Ds)Eas$*Anbme@;@K0C3(a3$8=RjFDjboD..<rAn?%*C2[W3+<Ve=GB.D>AKXT@6rR&N7n#g;
;Cj24@;]dkATMrGBkh]:%14dO.!0B"+DbIqAU%X#E,9)>0JP"!Ap890FCcRe:IJ,\5t=@38Q%)e
C2[X!@:F:2CggdaG[YH.Ch5:S0eR0TF!hD(0K^b*Db;-G@:DWID/^pH+<VdL+<Y9?EbTW,+A,Et
;cH%Q779^F/151NA8G[`F"_?<@UsUuE%Yj>F!hD(0K^b*Db;-eDe*R"FE2:K+<VdL+<Y9?EbTW,
+A,Et;cH%Q779^F/151NA8G[`F"_9HA8,q'Ec3REC31g4$8=RjFDjboC2[WnF_u(H+<VdL+<Ve=
GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*C$D/_+AC31g4$8=RjFDjboC2[WlATMrB+<VdL
+<Ve=GB.D>AKXT@6rR&N7n#g;;Cj21De*Zm@WO2;De*<gF*'$KC31g4$4R>;67sBlG%GQ5F^]*&
Gp$O5DffZ(EZf=ADe`inF<GF/DII0hEZf1,@N]l/Cht5'AKYDlA7]9o%13OO:-pQUF*)>@AKYZ.
D/:>/DId='+>"^SFD,6++E).6Bl7K)Anc'mF!+n$@qB_&ARlp,Bji,uDKKH1DImo4Ch[d&Et&IO
67sB74=G;i8g%keA8,plAU%QQ<)$%8+D,h<Blmo/8l%iR<'a#C6qL9--YdR1A8bs2BQS*-A8bs2
C2[WsDId='/nf?DCaTZ!%15is/g,4WDfTD3C2[X%A7dH9G]Y'ICgggb+D>\0A7]d(AoD]4C2[W8
E+EQ'/KeJF@;0Od@VfTuDf0B*DIj7a0K^b*Db;-eDe*ftAm\M><%/r%GB.D>AKXT@6rR&N7n#g;
;Cj21De*Bs@kVe3An5gi05>E9E+EQ5FEhmT%13OO:-pQUF*)>@AKYf'DKU1WD.-osF)Y]#BkD'h
+Du+>ATJ:f0K^b*Db;-gBl8'<DJsW.F'hmK<%/r%GB.D>AKXT@6rR&N7n#g;;Cj21De*Bs@kVY4
DKU2ADffQ3/p)>[-OgD:4=G;i8g%tZ@r?4,ATM3X=B$^l+<Y9?EbTW,+A,Et;cH%Q779^F/151N
A7TUg05Y--DJsW.F"VQZF=.M)%15is/g,1GDfB9*%159QHSZd_A0<6I%159QHZ*F;I4f#PEcMTr
%17/nDfp/@F`\`RC2[W*F*(i'AKYMtEb/a&DfU+GF`:l"FCeu1%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&                                  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)$.4+>P&o0H`,/+>GVo1-$I31*AA0+>GPm0fC./0H`)/+?:Q%1E\D4+>ktu1,0n-1Lb6<;f-Gg
AM>ed@W$!2+CT;'F_t]-F<GXADeio,FCfN8F(9-*E,&<gDeio<0Q^lIF<DuADf'H..3NM:D.Oi.
@V0b(@psInDf0''D/a5gD/X3$0JOtcDf'H..3NeBCh[E&@<-"'D.RU,+EMC<CLnW1ATMs7A8,RQ
D/X3$0JFncBk/Y8F)>i2AKZ)+F*(r1Cf>1hCLo1R-tI43.3N\KDeio,FCfN8F(Jl\D/X3$0JIQb
Deio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3N_@@VfTuARoLsBl7QrCi<d(;f-Gg
AO1BYBkM<;0JI3YA8-'q@rri%F)u&.DJ`s&F<GL6+D5M/@UX'qF`)2ADffQ$+DtV)AKYf'F*&OB
Dfor=F`:l"FCf3*A7TCqFE2))F`_>9DKTo/@<?(%+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df, ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:^/0f:(0+>G_r1*AS:2)ud70H`+n3AN?K+>G\q1*AJ51cHO33$9t!1H@EM+>GSn1*A>+3&;[4
1E\Fq1,h'F+>GPm1*A;03&EW<0f'q-+>Pf.3?U%1+>P&r3&*-10fC.0+>G]50H`)/+>P'!3&Da4
2]sju2DR*30eje++>G]51*A;3+>P&s3AM^32]sju0f1^F8l%iA<CokP84c`Z:Jt=N2,6Ij+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,
3\`EO0f][M$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Fu]6t(1K
3Zp='8p+qm1,(F?+>GT31,M$I2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P<u+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QR$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2'>M6C`kJe0f:(-3BB#U3\iT#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp.7+A-cm+>PW*2'=V-
3\WBO1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Get8p+qm1,(F?+>GQ22)mWO1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=$+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`O$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2]t_8C`kJe0f:(.1-.6H3\iT#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.9+A-cm+>PW*2'=V1
3\iNQ1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A
+>Get8p+qm1,(F?+>Gf90JPUC1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>PYo8p+qm1,(F?+>GT30K2$J0a\6p:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PYo8p+qm1,(F?+>GT30f(jH0a\6p:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>P_q8p+qm1,(F?
+>GQ22)@9L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t1E[f.
@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3b
Ch+Y`F_tT!E]P<t1a!o/@<?'A+>P_q8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3!p!"
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>Pbr8p+qm
1,(F?+>G`71b^sH2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>Pbr8p+qm1,(F?+>G`71c[TS1C=Hr:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH
4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp17+A-cm+>PW*2'=V33\`HP0JWtB
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp1;+A-cm
+>PW*2'=V23]&fW0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
1,'gn6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp1<+A-cm+>PW*2'=V-3]/lX
1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Y-+
F_;gP0JPF-0K;*L1HI<O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Jj+D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK
+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWL$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqi+@1-_+>PW*2'=V.3\`WU1GfFG
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Y-+F_;gP
0JPF-0ek^F1-.*E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp='
+@KX[ANCqi+@1-_+>PW*2'=V.3]&]T0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKM$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi+@1-_+>PW*2'=V33]&TQ0K9CH$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>b3,F_;gP0JPF-
0KD0J2**TM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.2+<X'\
FCdKU2'>2-B-8r`0f:(.2EETP3]&]$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fB@G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp='6$6f_1,(F?+>>f:0K(sH0a\6p:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>t?.F_;gP0JPF-
0ebXF3BAlN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.6+<X'\
FCdKU2BY;.B-8r`0f:(.0fh$H3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)bjL$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp='6$6f_1,(F?+>Gc82)@9I3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>t?.F_;gP0JPF-
0fV3M1-.-J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.:+<X'\
FCdKU2]tD/B-8r`0f:(-3'&fN3\`Gu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1,fOI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3ZpF*6$6f_1,(F?+>GQ21,:mJ1C=Hr:-pQU
;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3ZpF*6$6f_1,(F?+>GQ21-%BL1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+?:Q1F_;gP0JPF-0ebXG1-.-F$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*2'=S43]&iX0es(C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K
1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Vm%6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
0H`Z(B-8r`0f:(.0KLsC3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>GSn6$6f_1,(F?+>>c91cIHN3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`0f:(.1cdHN3\WDu$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNN
3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3A;Qu6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg+B)ij
+>PW*2'=V33\rTR0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=#
+<X'\FCdKU0d'D+E$-ni0f:(.2EEZL3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.*L$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)P^J$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f1"I@<*JG0JPI.
0etdD2``]L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp."+@KX[
ANCqg1a#M$EZd+k0fC./1HI?M3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Jj+D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>PVn9jr&b1,(F@+>GT31GLpG2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,'hF@<*JG0JPI.
0ek^G2EEQQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp:&+@KX[
ANCqh0Ha(uEZd+k0fC./0fh0H3\WK"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gE3BB#Q$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3ZpF*8muT[1,(FA+>PZ41,CsG2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp4$+@KX[ANCqo+A-'[+>PW*2]sk13\rHN
0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,U1D
ARZc;0JPL/0f1pF0fh$F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,U1DARZc;0JPL/0f1pK0KLsI$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp18+@]pO+>PW*2]sh33]/cU2)P^J
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,U1DARZc;
0JPL/0f;!G0KLsL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe
6t(1K3Zp18+@]pO+>PW*2]sh53\i]V1H5^K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+>Pes7V-$O1,(FA+>Gc81GCjE0FA-o:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,U1DARZc;0JPL/0fD'L1cdBN$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>GVo+@KX[ANCqh2'>A"@N[E[
0fL402``WK3]/l(8l%iS:JXY_6<-TN6qBmJ<)6Cp1,Vfn/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY
0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI9F%13FL:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2)l^$6t(1K3Zp='8p+qm
1,(F?+>GT31,M$I2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS2)ud%6t(1K3Zp.7+A-cm+>PW*2'=S53]/cU1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tnr+@KX[ANCqg2'>M6C`kJe0f:(-3BB#U3\iW$$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=8+<X'\FCdKU0f:(G
F_i0U0JPF-0ebXB1cdEN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=$1*@]-@<?'A+>Get8p+qm1,(F?+>GQ22)mWO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DZHu6t(1K3Zp.9+A-cm+>PW*2'=V/3\r`V0K0=G
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u&!+@KX[ANCqg
2]t_8C`kJe0f:(.1-.6H3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp=<+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHM$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2BX,1@<?'A+>Get8p+qm1,(F?+>Gf90JPUC
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E)a$6t(1K
3Zp14+A-cm+>PW*2'=V.3\WKR1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>u2%+@KX[ANCqh0d')2C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=@+<X'\FCdKU1,C%FF_i0U0JPF-0ebXG
1HI<P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%0H_K+
@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2_cEt6t(1K3Zp16+A-cm+>PW*2'=V.3\iKP1GT:E$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)%u+@KX[ANCqh1a#D5C`kJe0f:(.
2**NQ3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@;
+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K0KM!L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P=%1a!o/@<?'A+>Pbr8p+qm1,(F?+>G`71c[TS1^XQs:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`2^#6t(1K3Zp1;+A-cm+>PW*
2'=V23]&fW0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+?)2$+@KX[ANCqh3$:h9C`kJe0f:(.2**TL3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp@?+<X'\FCdKU1-$ILF_i0U0JPF-0ebXB1-.0L$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%3$9>3@<?'A+>Pr"8p+qm
1,(F?+>GQ22)mWP2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>Y-+F_;gP0JPF-0K;*L1HI<O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E\u+B-8r`0f:(-3BAlR3\WDu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_+>PW*
2'=V-3\iTS1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@
+>b2`6t(1K3Zp4$6$6f_1,(F?+>GT30f_9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Y-+F_;gP0JPF-0ek^F1-.*F$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1E\u+B-8r`0f:(.
0fh-K3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(
+@KX[ANCqi+@1-_+>PW*2'=V23\WBO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp4$6$6f_1,(F?+>Gc81bq*G3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>b3,F_;gP0JPF-0KD0J
2**TN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>k9-F_;gP0JPF-0fD'J2``cR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-F_;gP0JPF-0fD'K3BAlR$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>t?.F_;gP0JPF-0KD0J
2EEQI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t1E[f.
@<?'A+>t?.F_;gP0JPF-0ebXF3BAlO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>t?.F_;gP0JPF-0ek^D2**KN$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-0ek^E
1cdKR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2BX,1
@<?'A+>t?.F_;gP0JPF-0fD'M1HI6E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>t?.F_;gP0JPF-0fV3M1-.-K$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+?(E/F_;gP0JPF-0K;*K
1HI6J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4
@<?'A+?(E/F_;gP0JPF-1,1gH1HI9O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+?:Q1F_;gP0JPF-0ebXD1-.9L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+?:Q1F_;gP0JPF-0ebXG
1-.-G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[
ANCqg0H`Z(B-8r`0f:(-3'&lV3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.2+@1-_+>PW*2'=S53\`EO1GfFG$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2BX,/F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*2'=V-3\iBM
1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>GSn6$6f_1,(F?+>>c91cIHN3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU0esk;F_;gP0JPF-0f1pJ2**EL$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*Al*B-8r`0f:(.1cdHQ3\iAr
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE0H_K)F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp."
;e9nj1,(F?+>Gc81Gh-H1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU0d'D+E$-ni0f:(.2EEZL3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp:&:LeJh1,(F?+>G]60etdE0FA-o:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0ea_>ARZc;
0JPI.0f1pG1HIBO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0f1"I@<*JG0JPI.0f(jI2``WM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/r?+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1,'hF@<*JG0JPI.0ek^F0fh'M$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1,'hF@<*JG
0JPI.0ek^G2EETI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,'hF@<*JG0JPI.0ek^H0fh!J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqo+A-'[+>PW*2]sk13\iBM0Js1E$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+?:Q:@;[2C0JPL/
1,1gF1HI6K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp4$
+@KX[ANCqo+A-'[+>PW*2]sk13\rHN0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Pes7V-$O1,(FA+>G]60JPUC2@9cu:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1DARZc;0JPL/0f1pJ
0fh0J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[
ANCqh2'>A"@N[E[0fL401cdKJ3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp18+@]pO+>PW*2]sh53\rHN1,TCG$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pes7V-$O1,(FA+>Gc81c.6K
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU
1,U1DARZc;0JPL/0fM-I1HIBQ$;Y,PATDs*A4:NZDfTnS2,6Ij.SjMpATDs*A4:NZDfTnAF"Jsd
@Wc<+Ci<r/@;]TuEb0<2Df0W-F"Rn/%13OO:-pQq4X`$6+CfG#F(dTWDf-\6AS5_!Bl.:#AKWC3
DJUaE@<-"'D.RU,+=LuCA1q[T0Jk3f$;No?+>Pr"9jr&b1,(C>+>GZ52)%'G1^sd$$6UH6+<WK`
1*C+FC`k*9FXIV*_R"8kDJLA+EcQ)=3Zr<V@ruSt$Gs+l+<YT<+D)`=+<VeEF^f6)@ruT2GqKO5
%15is/j2BH0e"5WBm;Z]D/Ws!Anbge+EV:.+Eh=:@N[(0DJXB*@<,jk.3N_N+DG_7F`M%&$;No?
+EV:*F<G"0Gp%!ICht58ARTUhBHV,*F*)IGE,ol9ATDU4+E)41DBO%>+Du=<C^g_H67sC&@:F%a
F"SS7BPDN1AncL$F!,R<AKZ#%DJLA+EcQ)=+>"^XBOr;rDe*Dg$;No?+EqaHCh+Z%@<Q3)AmoCi
ARlp%DBNk>BOu3,@<-"'D.RU,+E1b2FCfK1F"AGF/nZdZ1E\FqA8Z3+-Xq"4-Qij*:-pQUGA2/4
+Du*?F*22=ATJu<Dfol,+D>2,AKYSnBl%?k+:SZQ67sB'2]tD*EZd+k0Jst-1cd<I3\iE!$4R=O
$;No?4?Y)J.3N,@@<6*C+EqL1DBNA0FCf<.FD5W*+EVNEEb/ltF*(u6+CQC3Eb-@c+>kc*1^sde
67sBkBk)7!Df0!(GqL3^<+oi`AKY].+CQC6Df'&.@VK^gEd8dADI[U%E+*j&@VKXmFEn<&:-pQU
BOu3q+>"^HBk)7!Df0!(Bk;?.@rc-hFCeu*@X0(g+>kc*1a$=I+Du+>+EM47G7=mS67sC&BPDN1
ATDg0EZcqVBl7Hq@psIjF!,@3ARloqDfQt;DfTD3Ec5E0F*&O9EcQ)=%15is/g,7V@;p1"DJ()+
DBN@1An?0/Ec6)BBl7L'/e&._67sB93?V%)EZd+k0Jst-1cd<K3\rN#$4R=b+<Y]9B4N,4C3=E0
-T`\c3a?E.Eb&loFD5Z2@<-'nF'NToFDYH#DHppbEc,H1D..-r-OgF"ZXduk@;0U%ATDg0E]P=X
?ZK^dA.8m_ZQLA5Ao_Ho4Y@j"+<YE+Eb/Zi+D<iK%13OO:-pQr4t&08+D,>43ZrNXAKY`"Bl%@%
+Eh=:@WNZ#Eb-A2Dg*=6@;KakA0>u-Ec6)5BHU`$%15is/g+S5G%G]8AKX#p+EVX4E,]B!+DG_8
ATDBk@q?ckDIakuCht59Df?h8AThX$+Cf>1AISuA67sBQ:IH=LDfTB0+CT;%+CT)-D]j.B@;p0s
A1euI<+oue+D#S6DfQtEBl%T.F*),4C`mY+@s)f$$;No?+D,P4+DG_'Df'H%FD53#AKYGrDIIR2
+D,>(ATJu'F`\a?F!,@=G9CjFDfB9.Cj@.FEa`p+ARmD&$4R=O$;No?4?Y)K.3NhTDf02K+=Lc7
F)WQNA8c%#+Du+>+E2@>E+O'+Gp$X3F)Yr(Gp%6IBk)'lAKYMlFCB9:E+O)"$;No?+>b3,E,m'V
0JG@,0f(jH1HI?I%13OO+<VdLF_!Wr+E]^f-Zj$9F!,1<+E_R9@rGmh-OgD*+<V+#+<Ve;@<>q"
H#R=;F^tpgF`(o'De*Dg$6UH6%144#+E2IF+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\K#<8ZKYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[E-67FBl5%F5/OX@
F`)!3ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\J]!/YKYrJ\
KYs2e$6UH6ATD4#AKW@CA1%fn0b"I4+<Y<.F<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5BAS,XoARrZa%1:"'_h>pY_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq%144#+E_3($?TrqF!,1<+E_R9@rGmh%144#+Cno&
@<?d6AKZ,+%175qBk)'lAISth+<V+#+<Ve;Ble59-ZrrI+AP6U+EM47F_kS2A8-+(CghT3FD,5.
5uU-B8K`1fEcYr5DBNP0Ci"$6Bl7Q+8g%V^DK]T/FD5Z2Et&JoR_sfrK#<8ZKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,'_QtCX:IH=:
EcQ)=3ZqsEAnc-sFD5Z2+D,%rCisc0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq%13OO:-pQr4t&39+D,>43ZrWbEbf_=
Bl5&0@<?($+Eh=:F(oQ1F!,C5+A*b.+EV19F<G(%F(HJ)Ble5nDJ<U!A7[GK0b"I!$4R=O$;No?
4?Y)L.3N2BEc5tZ+EV:.Eb-A-F!+m6Ci=3(+EMX5DIdI!B-;/6DdmNoD'4%:FD)dFDIIBn@psJ#
.3N>B+EV:*F:ARP67sB'A7]7e@<,pi+EM%2E+O)5@<,p%DJsV>@;L-rH#k*KATW'8DIm?$@rHC.
ARfguGp!P'%15is/j2BH1asPZBm;Z]%13OO%13OO:-pQq4X`0:+D#S6DfRl]-uEC.ALSaG@<3Q'
@;0OlDJ()6D]i\(DImisFCcS-Ec6)>F!,[?ASrW4BOr;sAT23uA7]Y#%15is/g+tEF*&O9D/aT2
ARlp*BOr<!Ec6)>+Dbb5F=n[Y%13OO+<YT5+=D;RBl%i<+BosE+E(d5-RT?1%144#1*BpZ+DkP&
AKW@EDfTB#DfT]'FD5Z2-OgCl$;No?4[(8O.3N5:GWHsWBOPdkARlo3D..3kB6,LEFDi:8@;]Ul
AKZ).BlbD,@<6!4%13OO%15is/j)9F2CTb[D/aTB+D5_5F`;CE@<,p%DJsV>@rc-hFCeu*@X0):
F`))2DJ()&F_u)=@rc:&FE8R6ARf.kF(HJ,Ec<-KDIIBn-T`\'%15is/g+b7Bl%i5Df-\+DBNY2
G%#3$A0>buD.P=B%13OO:-pQr4t&<<+D,>43Zoh`F)>?$AT9.AD/Ws!Anbge+EVNEEb0*+G%De)
DL!@9D/aT2ATJu+Ec5e;DIIBnCh[s4+C\noDfTCu$;No?+CfG'@<?4$B-:i-Dfp#?+CT.u+EM[>
FCfM&$4R=O$;No?4?Y)O.3N2BEc5tZ+=LuCA79+^.3N>AE,ol9ATDU4+Co2-E,8s.F!,O<DJ*cs
+DtV)AKYJr@<,ddFCfJ8Ch[s4+CT;'F_t]-FE7lu:-pQU1-$IPDg!6Y0JGF.0ebXC3BAuS%13OO
%144#+DPh*@:s-o-Y.:?@<<k>+AP6U+CfP9F!,@/D.O.`ifoD]P^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#Ip
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXOQ)LV%1;*ZJfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:
6t(@^+D,Y4D'2;^EcZ=FE-69^P_);3FCcRg@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&S
P_'>Oifo$;ifo&SPap`tJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*Z
Jfs';K&W#HA0<!;ifo$M0JGF>3AE6@1a!n`+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G
0ek:;+<VfdP_(hS+<VdL+<VdL+<VdL+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX
[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXR,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDuf\%144#+:SYe$6V)H+DPh*@:s-o-Xq.=@<?Q<%1;*ZN8g(P
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufT%1;*ZJhc8LK&W#R
ifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>Oifo$;ifo&SP_)Y=D.V^k
Jja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K+A?3bF<GOFFQ/O:6t(@^
+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*?e+<][.Jhf#62_[6H0eP:;+<VfdP_(hS+<VdL+<VdL
+<VdL+<VdL+QAW;1,(C@0KCjB/i5:*+QAW;2`W!'+<VdL+<VdL+<VdL+<][.K&W#H%1;*ZJfs';
K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohiP_'>Oifo\eP^qbX[,R=#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme%16igA79+^+?MV3A92j$
F<GU8@OE9@:-pQUDegJ-DfQt:BleB;%13OO1E^FNA79+^+FPjb1E^4GC`k)Q%13OO%15is/j)9F
3%5t]EcQ)=3Zr6W@:X(iB-9fB6m-#_D/^V=@rc:&FE8R:@;0P!+EqL1DBNt2F*)>@Bl7Q+A9Da.
+EM%5BlJ08%15is/g,@PFD)e7ATo8=Bl.F&FCB$*F!*%WDJsV>@q]F`CM@[!+D,P4+E)41DBNJ(
@ruF'DIIR"ATJu&F<GXCD.Oi/DeX*2%15is/g)i*+AZKh+>PW*2'=S53\`?M1,04F%14d43\V[=
-Y#1jC2[W9C2[X%Ectu9D/aPLD.RZ=Bkh]:%13OO+>,9!/g,(LBlnH.A0>u*G]Y&\/hSac$4R=m
/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@FOT+\GNu+D#S6DfRl]DJpY.Bk)7!
Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$7d\Y/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i50RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'n
F!,C?ASul)$7d\Y/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5Ch7KsFD)e.EcQ)=
3ZqsO%17J*+<Y;[/jr9/:/+Yo?Y"(Z@6H4c+<Vdp:-hTC?XI>^%13OO:-pQr4t&B>+D,>43Zr<Y
G9CC/ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++DG^9E-682Ci"37%15is/g)i*+AZKh+>PW*
2'=V13\`TT1-#dN%15is/j)9F3@Q(^EcQ)=3Zoh`Ci<d(.3N>B@rHC.ARfguGp$^8@:sX(F)Po,
+Dbt+@;I&pF)u&.DJ`s&FE8RHD]j1?EHQ2AARl5W:-pQUBl7HqEb/a&+D5M/@UX(o+CT=6@3BE$
G\(D.@<6L(B5VQtDKIKR+@^9i+D#e+D/a<&3Znk=:-pQU0KC7O@rrhK0JPF-0etdI1cdHJ%13OO
:-pQUFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE8Q6$>jL%ARnAMA8-'q@rt"XF(o9)7<3Ee
E]lH?+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<
4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/
$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8R.3N5:GWH9@%15is/g+_C
A1__3/T5*>ATDs*A1_A5Ec5u>%13OO@WcC$A86$n@rH4'Eb0<5ARmPN:-pQ_@WcC$A86$n@rH4'
Eb0<5ARlo+F"Jsd@WcC$A9/l%+D,b4Cj@.5Df'H6ATMp(A0=K?6m-;a@:UL&ATMr9F(96)E-*]T
%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sBIF_PZ&F!+m6@rH4'Eb0<5ARloU:IH=ADdd0!
F(96)E-*]T;KZk"GA2/4+=M8I.1HVZ67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<VdL
+AP6U+E(_2@;0U%8l%ha$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4
@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<VdL:-pQU
DfB9*+Co1rFD5Z2@<-'nF!,RC+CSbiATMo8FD,B0+EM%5BlJ/'$;No?+:SZQ67sB'+>G!ZD'138
F_PZ&C2[WmDf'H6ATMp(A1&KB:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!
+DEKI.1HVZ67sAi$;No?+@BR\ART\%3XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU
;IsijBl[d++EMX5DId0rA0=JeE,ol/Bl%?5%15is/g*`'+CSekBln'-DBO%>+EMX5DId0rA0=K?
6m-#SEb/a&DfTQ'F!,R<BlbD<@rc:&F<G".F)N1AAT;j,Eb0;7%15is/g)8ZFD,5.F*(i'Bl7Q+
A8-'q@ruX0Grd'#/hSelDe*BiFt[9?Bk;08F*(i'AM7e:A1nB!:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>cl@<jUf+ED%2@;TR/Eb0'*@psIj+Cf>,E,oN2F(Jl)
F(96)E-*4ED]j(=Dfd+?Afti,A0>;kA8c>p$;No?+>GT_AR[>N+E_a:+=LuD@<?1(AT0(@FDi:C
BQ&);E,Tc=@:F%a+EMXMCh4`$Bl%?'E+*j%Et&IO67sB80kP!+0K:1bDeX*1ATDl8-Y[=6A1&L.
A7T7^+CSl(ATAo1Dg#i4B-9fB6m-2]FCfK)@:NjkFDi:9C2[Vl$;No?+>GTgDg!lm+EV19FCeu*
Df-\6Bl8'<%15is/g)l*DJs\Q1a$4;C3=T>ARloqDfQt8+?1u-1E\)dF`)7CDf-\ABl5^^+A*b9
/hf((/KeqLF<EIu+>"^RD]j@<Bl%@%.1HVZ67sB82/QcB0f:(oASl@/AKZ;2Bl%@%+>"^VARoLq
ARfg)@WcC$A0>u4+>,9!05>E9A7]p;@;KXhDD-'Q@:s.)/hSb!A8-'q@ruX0Bk;>p$;No?+>Gfi
@;[bZ+DG\3Ec6,4+Cei'ART['DJsW.F!,(5EZfCFDJj0+B-;,1+DPD)DKB`4AKZ/-EcYr5DK?*n
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&
3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu
+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?
%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<G=:A0>?(Bl%<&F`_>6
Bln'#F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!
A1%fn%15is/g,4HF<GaDA.8knC2[X+ATDj+Df-\4De*="Bl%<iDKI6h3\l%78l%iU9gfEtC2[Wl
F_PZ&A79Rk4ZX]oCi"36Bl+u7F*(i-E$m"B$>OKi@WcC$A7KM!4ZX]L3biSD@WcC$A7KM!%13OO
:-pQUBl7F$ASl!rF<G%8Bl%<&@;]TuF('6'+>"^QF`VXI@V$ZmDf0,/@V'.iEb-@&$;No?+EM%5
BlJ/:B4YslEaa'(Df-\>D]ib3F*2M7+D>=pA7]d(@;]Tu@r,RpF!+(N6rm#M+DkP/@qZ;Y8l%iU
9gh-*-u*[2@WcC$A7KM!4)/\E@WcC$A7T+jALS`M0d&5#I7d:'<_Ysk$?U-(Ci<f+E-67F-V@0&
<_Yt0%13OO:-pQUF(KG9Dfp/@F`\a<Bl%@%%15^'6q0aA76N[S-YdR1/no'A-OgCl$;No?+EqaE
CM@[!+A,Et+CSekDf-\=@rc:&F:ARL:IIK:6r-QI8PDQ93Zr0V@<?1(AT/c,E+*j%+=DVHA7TUr
F"_0;DImisCbKOAA1o;]8l%iE8PDP^$4R>;67sBi@:O(qE$0(2+A,Et+EM%5BlJ/:E,8rmARlot
DBNn@F<G+.@ruF'DIIR"ATJu8@rc:&F<G+.Eb/a&DfU+4$;+)^;aXGS:fKnU9LV**+DPk(FD,`,
E$-PQ/gjRb;C="WCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4e(e
6q0aA71BS5$;No?+A,Et+EMX5B5)6r+Co2,ARfh#Ed8dMDId=!+E2IF+Co1rFD5Z2@<-'nF!+n-
Bk;0)A8-'q@ruX0Gmt*Q:IJ,\5t=@38Q%]4+DPk(FD,`,E$-PQ/giqY8LH&NCi<g)Ap@Zi8l%i^
?V4*^DdmH(HS0Y++u(3.:dJ&O?XH`2?XHE$6uQOL.4cifFCAfn05>E90..298l%iR<'a#C7S-9B
4ZX]X:IJ,\5t=@38Q%*3:IIZD9LTBt%16c[@:VM^-Vcu\+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH33/5/MB$>=!ZA3DteART+#+=JU4
67sB]ATDj+Df.TY-S-Z\De+$&EcYr5DCI+a+<X!nBl%<&:3CD_ATBgS-S-Yi3biSD@WcC$A7KM!
.4chh+@KX[ANCq]/8B*6@WcC$A7T+jALT0(7L]]GD/XQ=E-67FBOtU_%13OO:-pQUFEMVA+E(k(
+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNJ4EbTE(+A,Et+Dbt)A.8lZ@m)kdART+#-R^tu3]&Q?
+>>/o9L]Hu%15is/g+e<F<GOCAT2[.@qB_&DfQtA@rc:&F<E.XCh7$uAKYo/Cj@.:ART+\EZek1
D/Ej%FE7luF$2Q,A7]suBlmp$F(96)E-*3N0fq'31+@Q23Zp7%B4Z0--YdR1E,oN/-OgCl$;No?
+DkP$DBMPI6m,uU@<6L$Et&Ih4ZX]I3ZoebDe*d(+DPh*+DPh*F*)>@AKY`+A7TUf+DPh*D..3k
+DPh*F`_>6-Qij*%15is/g+YBCi!ZmF<G4:Dfp"AA7]^kDId<rFE8Q6$=m^eF$2Q,B4PRmF!`M'
+D2,j%17/nDfp/@F`\`R@rH4'Eb0<5Bl7Q+/hSb!-OgDX67sBkATqg%FCcS-Ec6)>+D>=pA7]e&
+:SZk4ZX]rATqg%FCf3.@rc:&F=&V(+F?-n0d&Z,3Zp1#B4Z0-B+51W$;No?+Cf>,E,oN2F!+n-
C`mV6DId<tASu$iDKI"FDfTB0+DG^9ART(^+D5_5F`8HO@3B'#F`(]&ATB4/$=e!bAN`'s/0K?n
5WWCnD/a5:4s27%I4dcGB6%r?-8%J)B.4rT/g`27+Co&&Et&Hc$;No?+Cf>,@VK^k+D>=pA7]d(
@;]TuGAhM4+Co%qBl7X,Bl@m1+:S[!4ZX^,+=nWs+=nXK+=o,f@rGmh%13OO:-pQU@;p0sDIal/
Df^"CE,ol,ATMp2EZfF5EbTK7%17/>3ZrJp+Co&-BPDR"C3*m*BlJ/:-o!e;+>PBm3]\B?+D58-
+=CoBA8lI.F=.M)%15is/g,1GD/XT/+CQC)ATo8;ASkjiDJ=!$+ED%(F`(_uDKI"1Cgh3sF!+n'
FCfJ8%15is/g+SDF(o9)D.RU,F!*%WFD,6"EZf=AATMF#@q?ckDJjB<F!,=2+Und"4ZX^!@j!<F
-SHT*/h]@?0-ED=00M?D+Cf(nDJ*NuEHE=E%13OO:-pQUF('6'+Cf>,E,oN2F(Jl)Ci<`m+EM%5
BlJ08%17/nDfp/@F`\`RDfp/@F`\a<Bl%?'Ci<flFD5Z2F#kZX$7KsY3ZrN_8g&1(+Eqj?FCcS9
BQ&*6@<6K48l%i@6psgG7S-9B%17/nDfp/@F`\aI+<YlKBlmo/F(fK9E+*g/+A,Et;aXGS:fKnU
9LTBtF)>i<FDuAE+EJYJGB.D>AKZ&-Dg-//F)rHr:IJ,\5t=@58PDP^$?^;u@<?'Q:IJf/Ch7Z1
Et&Hc$;No?+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=+DkOsEc2Bo
8l%iA<CokP84c`Z:Jt=Y3Zoh*4"qd4.=4*:+>b3RATT%B8l%iA<CokP84c`Z:Jt=C%15^'6pamF
9LMEC;cHOj=Zneg8l%iA<CokP84c`Z:Jt=H-o*#@7O]m%ART*Y$8`lEF`\`R8l%iA<CokP84c`Z
:Jt=C4#/ZT8l%iA<CokP84c`Z:Jt=)$4R>;67u_mFCcS9BmO>5De:,)ASu("@<?'k+E2.*Bl8$(
G]Y'L@rc:&F:ARuD/XQ=E-67F-mC\sF"&Xf+EM%5BlJ/:@X3',F!hD(F)>i<FDuAE+=BcW6m,uX
D/aN,F)to'+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&Ip
A0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&
3B9*,%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*
A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu$;No?+Co2,ARfh#Ed98E:-pQ?:-pQUG%G]'@<?4#3XSVK
/db??/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2@;0U%8l%h^:-pQU+<WH_De't<
-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ2R67sB'+E(d5
4$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<BlbD<
@rc:&F:(c0/db??/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQUEcl7BC2[W*D.-ppD]gG_+EM[E
E,oN2F(KD8Bl.g*Bk(k!+DEKI.1/g:/db??/g+SDF*2>2F#jY'67rU?67sBUD]iV3Ec5t@@q]F`
CM@[!/db??/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AI;1!/db??/g+SFFD,T53ZoP;DeO#2
6nTTK@;BFp$;No?+CfG'@<?'k3Zp130emEcDD3gQ:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB80ktiK0K1+_A7T7^+DPh*
E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`CG'=9EsbZ//g)l+@;p6@1*CUK
D/XT/A0?21Bl%@%+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu$4:9]@s)g4
ASuT4-XpM*AL@gpDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$
Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2
@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>mDf9PW3Zri'+Co1s+>=.@A0<rp-YdR1A7]p,
C2[W*F`_>6F!i)7+>Y-YA1&`3$;No?+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A
@:O(eDJ()0Dfor=$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OOU,A9MO)F(oQ14ZX]:4tq=U
:IJ5X6ja8r67sBhCh[Hu+DPh*Bkh]3A8-'q@ruX0Gm[/>6q9gJ8l%iH8lJPP<(K/5+<iEc5tjit
/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+28l%in@VQ6B:II]E<(]qS8P2oX
5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@C2[WsC3)$U$49Np/g+e<DImis
FCcS)Df'?&DKKH#+A,Et+Cf4rF)rIF@rc:&FE7e(@r,RpF(KDU3ZpLF-YdR1+DPh*F*)>@AKY`+
A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!,49A8c?5$>OKiAnc'mF$2Q,-p07-?SNuPD..3k
-9`Pe@r,RpF(KD"$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quE"C1D'gF)to6+=nil4s2s8A79R-
.6T^7Eb/Zi-8%J)HTE?*+DPh*Anc'mEs`7L67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08
$7Bk(+EMR5-TsL51a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%@<-4++DPh*F`V,7@rH6sBkLm`CF9H;
HS-Ks+EMR5.6T^7HTE?*+EMR5$49Np/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%$:[T\78l?1+=Lu7
CghC+ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a07S-9B;a!/a-p1*t6q9gJ8l%iH8lJPP<(JG\
/1)u5+@\pr78jOI4DJeFA79R&+<VdL+D,h<Blmo/4"u"N8PDQO$8=SWDe*p2DfTE"@<<W(GB.D>
AKX&hHU^S#78jOI4DJeFA8bpf@<<V7+D,h<Blmo/4#2.P8PDQO$8=SWDe*]nCLq$bF<D]<GB.D>
AKX&jHU^S#78jOI4DJeFF`_>6A79R&+D,h<Blmo/4#D:R8PDQO$8=SWDe*s.DesK*@<<W(GB.D>
AKX&lHU^S#78jOI4DJeFDf0)oF<D\K+D,h<Blmo/4#VFT8PDQO$8=SWDe*g-De<^"AKW+-GB.D>
AKX&nHU^S#78jOI4DJeFE+*d(F!)SJ+D,h<Blmo/4#hRV8PDQO$8=SWDe+!3ATD:!DJ!Tq@UX$p
+D,h<Blmo/4#qXW8PDQO$4:ikDfp/@F`\`R@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+E_X6@<?'k
-OOp3Dfp/@F`\`u:II]E<(]qS8P2oX5u^A^$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ2s
A0>f/D]i7,1E^UH-RT6.@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5
?OC7bBl%<pDe*s.DesK)Df'H6ATMp(A25l767s`sF_PZ&C2[X)Df9H5@rH4'Eb0<5ARlp)/M/)S
F_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-*]A$;No?
%15is/g*MtDf0,s+D,Y4D'169F_PZ&C2[X)Df9H5.3NJ9@rcJs$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'An>F*3$;^LBl8!'Ec`EOBkhQs-Qli.A7]9o@:jUm
EZf4;G%ki,+A,Et+DG_8ATDBk@q?d)D]ib/De':a:-pQU0f!KdDDF'l@q]:gB4YTrCh[cu+D#G$
F!,RC+=M>M8gt2V:-pQU0f<fVE\TEoH=gl-ATJu7ASl@/ARlo8+C]J-Ch+Z/ARoLqARfgnA0>u4
+>,9!05>E9A7]p;@;KXhDD-'Q@:s.)/hSb!A8-'q@ruX0Bk;>p$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$a
FE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&
DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3C2[WnATf22De'u5
FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`Hn
Bl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;67sC%ATT&<D.F(_-YdR1
G%G]8Bl@l3C2[WlF_PZ&@r?B94ZY?F/kSo-<_Ysk$>OKi@WcC$A7T+jAN`'s@;Kb%EbTA5FE;P4
D/^jM%14ItDe*s.DesK<ATDj+Df-\4De*s.DesK(F_PZ&@r?B94ZY?F/kSo-<)6:`;cZU\%16ig
A9;a.Cia'.Bl%<iDKJ$&+?hi$De*s.DesK(F_PZ&@r?At$4R>;67sBpDI[]uD.RU,+C]J-Ch+Yu
Dfor>ATA4e8l%iS:JXY_<_YtF3ZohcDe*s.DesK(F_PZ&@r?BMC2[WlF_PZ&A79Rk.3L#n+>PBo
8l%iS:JXY_<_Ysk$?U-(Ci<f+E-67F-V@0&<)6:`;cZU\-OgCl$;No?+EM+9+E)CEE-67FAnc'm
Et&IK:IJ/X:J=\M/g)8Z+=CoBA9;a.Ci_4CC3(a3$;+)^5t"+::/k"b9N+DP9LV**+DPk(FD,`,
E$/n7@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9AU&<<0./;C:IJ/X:J=[r$4R>;67sBQ:IH=H
FCAfrDJ()&Bl[cpFDl2F+E_R4ATAo4F`\a:Bk)7!Df0!(Bk;?.@;KXhDBNJ(Eb/a&DfU+4$;+)^
;cH%Q779^F4ZX^#E+*j%F(K;5-mC8k5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l
<(LA';cI+28l%in@VR>C-ZaB<B4W`2De(LK%15^'6rR&N7n$BQ:J=\V8PDQ93Zq$j6rR&N7n#g;
;Cj21De*F(FE9)_/4r]+<)6:`;[j'C$;No?+C\bhCNXS=De:,6Df9H5+D,>(AKYr.@:NkZ+DG^9
E-67FA8,OqBl@ltEbT*++EM%5BlJ/:A8-'q@ruX0Gmt*Q:IJ,K;Fs\a<)6:`;as>P76N[SC2dU'
BQIa(+=JEd-W<B1-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmH1
/4r]+<)6:`;[j'C$?Trm@:VM^+=BoN/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D'oc"FD,5oA3Dsr+EV:.@:Uo_7P#r8:-pQU
<b6;mBl@lM+=A^TDe*s.DesK<ATDj+Df.*R+<X!nBl%<&:3CD_ATBgS-S-Yi3biSDFDl)6F(09+
Ch.$nF=Aag+<X'\FCdKU-S0"NA7B[qCh.'bFCcmP9L]HuF)>i<FDuAE+EV:.@:TfS%15is/g+e<
DImisFCcS:Df9H5+EM%5BlJ/:@;]TuF('6'%17/nDfp/@F`\`R@rH4'Eb0<5Bl7Q+C2[X)Df9H5
+>,9!-OgCl$;No?+D,2,@qZuuART+\EZee.A0>B#D/aN,F)qctBK[sjA7]suBlmp$F(96)E-*3N
0fq'30e%H13Zp1#B4Z0--YdR1FDl)6F!hD(%15is/g+YBD/aN,F)rIADf0)sE+NotASuT4B6%p5
E$0@CEb'5#$7Bj:F!j+'+Cf>,E,$LDB6%r6-YdR1FDl)6F!iCZ/M8/YA7]_$+=CoBA9;a.Ci^s5
$4R>;67sBmATVEq+CT.u+Cf>,E,oN2F!,F?F*)AADe!@"F)Q(.$?/-\+Co&-BPDR"C3*m*BlJ/:
-o!e;+>PBm3]\B?+D58-+=Bu];cI+=De*s.DesJB%13OOF$2,uFDjboFD,5oA1VCFF"D8>$?L'&
F`_SFF<DrLF`_SFF<G10Ch4`*De!3tBl@m13[Y@DF)>i<FDuAE+EJZLEbTW,+EM47GApu3F!+(N
6pX4/:JOkb:J=\V8PDP^$?L'&F`_SFF<GWIGB.D>AKZ&-Dg-//F)rHr:IJ,K;Fs\a<)6:`;as>P
71BTFD/XQ=E-67FF!,[IBlmo/F(fK9E+*g/+A,Et;cH%Q79!&Y9N+DP9LTBtF`:l"FCe'?6rZrX
9N,P;Ch7Z1Et&Hc$;No?+E_X6@<?''@WcC$A0>Q"F*)>@Gp"[]F*)>@ARlolF!,F<@;0U%FCf]=
+DkOsEc2Bo6<-TN6qBmJ<)6Cp4Y@j*0fq'31+@Q23Zp7%B4Z0--V@0&<)6:`;aOJU9LMEC;cHOj
=XOXc6<-TN6qBmJ<)6Cp4Y@jD<CokP84c`Z:Jt=H-o*#@7O]m1BOtU_%14p7E-67F-V@0&<)6:`
;aOJU9LMEC;cHOj=XQ9d2*4-)8PDNC8Q/Sa;HXG9%15is/n0*JAKZ&.H=\4;Aft_tDImisFCeu*
E,8rsDKKH7F<GX7EbTK7%17/nDfp/@F`\`S,!$ri.4chhF(96)E-*43H$!V=-OgE(D/XQ=E-67F
-V@0&<)6:`;]oRgD/aN,F)to'+C]J-Ch+YuDf'H0ATVK2%13OO:-pQUEb0<6DfTD3DfB9*+Co1r
FD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%16c_F*)>@H"q8.1,fXLB4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<P+>"^*AR]\&@<-W91,UU*
1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;
Bl7Q+8l%ha$6UH6+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b
/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe
$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4
AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1
+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c
:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g
.k<5`G\&'H%13OO+=\KVC2[W8E+EQ'F`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%
1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et
+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(
Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL
+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7
/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9
ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!
%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]
0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6
+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5d
A1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%
0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3l
AoD]4A7]jkBl%iC%13OO+=\LOATo8=ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1r
FD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b
.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9
AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"
DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>
E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'
Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)
Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUH
DBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBu
ATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#
AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>
9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7C
Eb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A
+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL
+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>
+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6+
+Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6
+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C
+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk
+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN
%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%q
Bl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6
+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBL
Gp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^
+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M
=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>
Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[K
ALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*
F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1
Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lB
CghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG
$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)Qd
FE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E
@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.
D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9
FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI
%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%
@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*
BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"
E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE
:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=
DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)
@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u
+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#
+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#
+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U
+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)
Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#
+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL
+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$
;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT
+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8
AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7
Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;
BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-
F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5
ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjI
F<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F
;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^C
E\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4
FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlop
EcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"
AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+
/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuul
C2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`i
DIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/
+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7B
Df-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg
+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b
.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*
BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>
F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7
F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=K
DId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,
%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*
+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(
ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE
$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'n
CggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd
+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.
@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9
$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$
A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'r
F!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J+
+ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.
F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/
%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNE
FE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*be
AS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3
@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*
@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2
ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0
ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*
+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE
0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a
+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:
@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*
GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*
F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\Cd
EbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lq
A0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#
De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTu
Df-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cq
D.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'
$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cq
D.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$
F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'
F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9
+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?
F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO
+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5
+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9
Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?
+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JAD
FD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#
+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8
Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH
@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4
De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6
Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6
ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5
?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")Np
A8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ
1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!
Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?8
3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',
+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1
+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<
De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/
+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1
$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=
Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.
F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4
+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?
F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8
?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI
+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD
+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:
Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"
?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%q
Bl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*
Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+Not
Bk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(
+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh
7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/
@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;
Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#
+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;
+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUp
ASuT4%144#+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE
8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImis
CbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l
$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k
+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImis
CbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A
+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3
De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jk
ARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?
Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.
EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa
+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!
%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ+
+E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+
0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp
+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:
@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIG
E-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6
+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe
$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6
Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'm
F!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'
+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)
AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@+
+Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;r
Df'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-
GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J+
+DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"
FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&
+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8
+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[Ws
DId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@
AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[
+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,
$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#
+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/
ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<Y
Ch4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(
+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu
+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'
%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8
Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).
F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%
%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5
%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F
$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-
%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6
>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3
Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$
+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$
Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.
FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8
Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5
+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO
+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm
8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB
+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo
2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,
Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4
F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3l
AM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#
BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=
FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1
%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&
A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55
@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)
Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("
@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6
%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1
%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmf
EZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4
+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.
De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;
F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+
BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;
D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&
A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr
+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17
+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'
@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3
ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7
AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"
FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)
3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(
@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%
De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)
0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl
@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+
/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>
A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*
F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>
A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*
Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUt
F*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=
/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm
1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^
$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo
+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&
De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpd
F(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!
FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3
@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo
@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2
BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6
+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o
+<VdL+<VdL+<Vd9$6Tcb+:SZkBleB7Ed;D<A7TUg1,3EQDImisCbKOAA7TUgF_t]-F<E.X@q]:g
B4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5%3
3B836+@]pOEckf2Gp"k"/0H]%0fBIJ%144#.Ni;5BlkJ*C2[X*F(KB%Df00$B4>:b/no'A?m&ls
E+NotBm:bBD]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.@rH7+Deru;AU%c/F(KE6
Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@+Dkh1DfQt3A8-.,%13OO
,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe@r$4++DtV)ATJu1BleB;
+EM+(FD5Z2+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m%$6UH@+Dtb7
+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk?m'$*@;Tt"AKYo'+D#(t
FD5W*+=M,9D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#+<W-VBl7HmGT^^;E,ol?
ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?%143e$6UH@
+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!F!;`8A7T7^%13OO+<W-V
?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04EE,]`9F:AQd$6UH@+DG\3
Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg%13OO,9nEU0J5@<3B&]9
/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9F<GC.@N]f4A79RkEt&Hc
$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'DfTl0@rri*Df9`8DffP5
Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LDBOPdkATJu9D]iG&De*Nm
CiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9/hhMmF*VhKASlK2@;]Tu
8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b+=\LGDfQt;DfTD3A7]jk
Bl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&oF(oQ1+>>E./ibj?>psB.
FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9/Tl#C@<?'4G%G]8Bl@l@
0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#.Nh>L9H\LiEcYr5DBNY2
@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4+A*b9/hhMmF*VhKASlJt
$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG@q]n$DJ=E.+CJr&A1hh3
Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e,9n<b/ibOE0H_qi8muU[
@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e$6Uf@G%G]8Bl@l3@rH7,
Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r+<XlYBllmg@U1BqFEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(+ED%4Df]W7DfU+U%144#
+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0+D#(tFE8QV+CIo0;G0DR
=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihHBlbD-De!p,ASuT4@rH7.
ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibCAn?!oDI[7!+EVNE9jqNS
G%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=),9SZm3A*6K+>"^.F`(b5
1,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9AnE0"DKKe>@3BW&E+*cq
FCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0@<?4,AScW7F*(i"Ch4_t
DIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!+A,Et+CSekDf.0M8TZ(g
@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6FDi:BARopnAKYN%GA_58
@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37
/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2tDfQtCF(KB5+EVNE
A8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*NmCiEc)A8-'q@ruX0Gp$R=
F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9+CT.u+A,Et+Eh=:F(oQ1
F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB+E_a:+A+pn+EVNEA8-+,
EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0+Dbt7CER>/+EV:2F!+n%
A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZmDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G/KdY]6m-#S
@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7
@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQU
GA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%cr
F`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD9
8TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!
+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)
DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*
@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m
+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'
DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^
F`_/4GA\OEASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)
F!)T7AS,k$AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB
$;No?+CTD7BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n
$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1
Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=
3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4
Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0f1R,1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5
AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%16WbF(KG9-W3B378uuM-OgCl$;No?
+A,Et+DG_8ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>
6m,oKA8c@,%16T`@r,RpF!)iEC2[W1%13OO:-pQU-u!F7A18X4EcQ)=0-G+CF)tc&AKZ)+G]XB%
78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(+Du+>+EM+9-OgDO;Gp(Y
:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>F(KG@%15m(8P2cH0JGXN
+<W%LD]in*FCSuqF!hD(%15is/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4D'3>2EcP`/F<G4:Dfp"A
DfQt1F`MM6DKI"BF_Pr/%16NV4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq
+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVmF$2Q,1E\_$0F\A'
AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N&0A7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JO\]DIb@/$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nI
A7m#qASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=n3@3Zp4$3Zp*c
$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H+D#A1AM,*?A7]e%?X[\f
A7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HV,+<V+#:-pQUEb/ioEb0,uARlp-DfTB0+Du+>+DG^9@s)g4
ASuT4B6%p5E"*.lGWe)11E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\f
A7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC
+D5R7Eb0?8Ec*KPASu$2%14LlCi"-'Aof(;I4cXTDCH\[/g+eE%14Nn$6UH6%15is/g,@VEb'56
Bl5&'F`MM6DKI"6Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'AhG2X/pClO?X[\fA7$HA
-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\f
A7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)@X0)E/g+eE%14Nn$6UH6
%15is/g+e<DImisFCcS)F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%@rc:&F:ARuB0A9u1E\_$
0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%F(HsHC1LmrEaN6iDe*2t78d#T
8l%i/0d(%FA1eu6$7QDk%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[DfTB0/0JSGDfp#?+DG^9
Eb0E.F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$QG&Ifs%15is/g,1WDBO%0F`_P<DeF><
@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4
$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)
+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E$0@CEb'5#$>='83ZqWf+D>S1DJUG"3Zri'
+D5_6%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1UmsF!,17+ED%:Bldir+E):2ATAo*Ec5e;
@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU+<VdLBQ>4N+<XEG/g+eIDfp#?%15is
/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s+>Y-$+>=63BkAt?@UWef@p`YZDe*2t
G<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`n-Y+En8%3XlF1AhG38@:XCg
?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+F##U/g,Qp+En8%
.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#A0>]&F*&OA@<?!mBl7Q+GAhM4
Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/DfTA2F(fK4F<G[:G]Y&;$;No?
+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IEBQ%p5+EV1>F:ARP67sB'1a!oS
F)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FGAU&;>%16ciF$2Q,1E\_$0F\@C
+D>h;+F+D'3XlF1AhG38@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35/g,?\Eb0?8Ec*KPASu$2
%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL+<VdL+<Ve;D_</NCL:Lb
De*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%Gpsjd/h\D'5Xd:JG9CF7
/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF$7QDk%15is/g,4LDJ*cs
+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL+<Ve%67sC)DfT@t$;No?
+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(ORAU#=FFD,B0FCfN8-QjNS
+<XEG/g,7IF*%iuF)5E44ZX]A+?CW!%14d3F)5E4+F+D'3XlF1AhG38@:Wka?X[\fA7$I#CcsBn
GT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($E-67FGroVPEcZ>4Df'?&DKK5m8l%is
Df9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1rFD5Z2@<-W9GAhM4+CfG1F)rIEAS,Lo
ASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?Qa5L/g,1GG&JKN-Qlr</g,$SEb0?8
Ec*KPASu$2%14M$/1tum+<u=X/M9+=HQk0eF$2-0+D5M/@WNk[+Ds=pI4fCH$7QDk%15is/g+h9
DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q
+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi
+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-
E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?G%#30AISufBQ&*6@<6KQ3aEk4+>G$#
1+"ac$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`
ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S?p$\,-o3V*5!UMP
+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4
-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@
1+#1M-o3#-0I\G"+C,E`%15is/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/%173!4ZZjk4!80X%16ro
4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=+AP6U+=]!XC3'gk
D.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD0S3)>p)3O1,:%\+?L]YF<D\K:-pQU
.P>gSGRXuh$;No?+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh
@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%W
F(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=r
Et&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9o
A8-+(CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs
+EMCBB-;>=Bl%i<%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$l)%%16igA9Ds)Eas$*Anbme
@;@VQ:-pQ_C2[X*F(KB%Df00$B4>:b+EK+d+D#e+D/a<&+A,Et+E_a:EZek1DJ!TqF`Lo4Bl@l3
F(96)E-*]A$;No?%15is/g+,,BlbC>F(96)E-*4:F!)T:G\(B-FCeu*@V'.iEb-@c:IH=D@VTIa
FE8QI@<,p%@rc-hFCeu8+A$Ya$;No?+Ceht+C\n)F`V,)+EVNEEb/cmAnc-o+CT.u+CfP8FDl#1
H=\4B@<-(#F`S[8CghC++Du+?DK@EQ<,W3Q:-pQUD..3k+<Yc>BlbD<@rc:&F<D]7@ruF.AKW+9
AStpnAKY]/+EVNEC2[X*F(KB%Df00$B.dn5F!+n/A.8l@67sBjDfBtEBlkmKGA2/4+F.mJEZeq(
BlnDI+EVNEFD,5.D..-r+DPh*+Co2,ARfh#Ed9\T$;No?%15is/g,UOA7TUrF'N?hDImisCg:^n
A.8l@67r]S:-pQU<+ohcDJsZ8F!,:5F*(u(+C\nuDg*=4Eb-A+Df9//@ps7cBk1XoATJu+DfQt@
ARo@aBl7X,Bl@lA%13OO:-pQUF)>i<FDuAE+=CoBA9Ds)Eas$*Anbm1Bkh]3AU%crF`_>8B-8fZ
/gh)8%15is/g*tY7Nc__@:Wqi+DG^9C2[X*FD5P6@r,RpF!*%W@s)g4ASuT4F(KH8Bl7Q+BlbD=
BOr;sAS,@nCige1Bl[cpFDl2F%15is/g+bEEZfI;AKY&gDId[0F!,X;EcYr5DBNk0+@0OV@V$Z[
ART+\E\8J4ATMF)+D,P4+E)@8ATAni6q/;>ART+\EcVZs:-pQU:ddcN76s=1;I<jIDe+!4Bl%->
3[[9U>YoHZB6%Et+@^']ATJtBGW7T1>X;n=@V&e1@rcKs@<<ViART+\EZdb;>Z,-AA7]dd6"=qR
;IhR=/nK9=-OgCl$;No?+ED%7ATT%e-Z^D,6q/;>ART+\EZfIB+DkP/@qZuW:IHRO+AbHq+ED%%
A7]d(/KeSB+D,P4+=Lu7Df0W7Ch551G\&<5$;No?+AbHq;Is9IATD-m?TgFm:ddcN76s=1;I<jI
De+!4Bl%,c$4R>;67sBhCij6/DIIX$G%DddBQ%s6F(96)E-*44Df'H%FD53#AKZ#)@:Wqi%15is
/g*tY7T)Z@6q(!\@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>XrIGF*)&;D-U^pG%kN3>\A,$
Bk;KE1+m-_AL@oo%15is/g*u2AS,LoEb/c(G@b5+@WHC2F(KA7Bl5&.De+!4Bl"o%CghC++>"^H
AS,@nCige$Bl7I"GB4lrBl[cSDg3C8Bl[cpFDl2F%15is/g+4s="muiC2[X*FD5Pu4ZXrX3a>L%
DeF*!D'2;^Ch7Zm9lG>lCi!N&7VQmSAoDp!Anc9sAoDoHAU%c6%13OO:-pQU;e9HWDId0rGp%<B
@N]-#Dg-86EZf(6+DPh*F`_>6+Cf4rF)rHU+Co%q@<HC.+BN8pA8c[5+Co2,ARfh#Ed8*$:-pQU
='&HX?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[MF'M:SFCfK1ATT%`G]7J;Eb08r8OZ`X9M\PT
/k&l2-OgCl$;No?+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4
AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&IO67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>
+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$:R?M:JOha9LW;sC2[X*FD5Pu
4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%16r\CLoh@
F(o,V:IJ/nF*)IY0ht%f.W&U0AO9gHBk'b26r[`=FE8RG/M/)^@;BEs8l%ht@UX=l@j#l)F*&OG
@rc:&F=n"0:-pQB$;No?+B3#gF!,O6EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9
+E):2ATD?m+A,Et+C\c#Bk%SZ:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2
AKW+9F`&`Q+EMX5Ecc#5B-:o++<Yc>AISuA67sB/@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>a
EZcba+Z_D.+EV19F<G16Eb/rtDK@E>$;No?%15is/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4Ysl
Eaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9Ch7-"+C]U*$;No?+=L2X;cH+[<DHLB/g)99ATMs7
+CT;%+<Y]9E+NI"ARlotAfr3E<(0_b6Vg]W<%/r$G[k;rA9/l8BOqV[:-pQUDKTf*ATAo3Afu2,
F*)IGBl5&8BOr;7C2[Wl@<6-mFCfN8F"&5QF_Pr//e&._67r]S:-pQU@<6L4D.RcL%15is/g)8Z
%15is/g)8Z0e"52+Cf>-Anbn#Eb/c(8g%YYEb/a&DfU+GIS*C(<(0_b%15is/e&._67sC(ATD6g
FD5SQ+EVNEF`V+:A8aL<$;No?%15is/g)8Z:-pQUB4YslEaa'$+EM%5BlJ/'$;No?+<VeFA0<rp
-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZEbupHD..3k6=FqL@nKNb<+U,mF!hD(
:-pQU%15is/g)8Z:-pQUEcl7BBljdk:-pQU+<W'd+Z_A-+?XCX@<?0*-[nZ`6rZTR<%gRHF(o,V
:IJ/nF*)IUBkh]:%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(F?C3=>H3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE!Ddd0!-YdR1FCfN8ATB.-$>j3e
AQ*GaCLp+66r[`=FE92l:-pQ_D..3k;f-GgAP,`d<+U,mF!,NU/Ken=CLnV\:IH=HD/X3$+EV19
F<GX7EbTK7/db??/db??/g+,,BlbD<@rc:&F<G4-DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$
Gp%$GA7]dmA0=K?6m-PfDeink:-pQUFCfN8F"SS7BOr<!ASu("@<?'k+<Y`8EbTK7+<Y0&DBL'2
AKW+9F`&`Q+EMX5Ecc#5B-:o++<Yc>AI;1!/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL
+=Joe3\r3-FCfN8+D,P4ASGdpF"Rep67rU?67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$
ARlo+F(96)E-*3F+DGm>+<Y04DKKo;Ci!Zn+<Y-=$;No?+=L2X;cH+[<DHLB/g)99ATMs7+CT;%
+<Y]9E+NI"ARlotAfr3E<(0_b6Vg]W<%/r$G[k;rA9/l8BOqNG67sBuF_tT!EZf:4+EV19FE8R=
DBO%7AKWC9De*p+Deip+ATMs7.3N\SBlmo=$;No?$;No?+CT>4F_t]23XSVK/db??/g,=KEaiI!
Bl,m<:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F?C3=>H3=8MJ
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+$4:9]@s)g4ASuT4-XpM*AL@h$Ddd0!-YdR1FCfN8ATB.*D..<rAn?%*C2[W<0ht%f+DkP)
BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`78d&U:JO&6
-SR/5/ibp>%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:@+<VdL+:SZO5sdq)<(0;Q;HZ.D
-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16igA1hS2Et&IkDe*fqEc#kMBkh\u$>OKiE,ol/Bl%?5
Bkh\u$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%C2[Wl@;@N2De*fqEc#l,@;@K0C3'gkC2[Wl
@;@N2De*g-De<^"AR](`/no'A%16igA7At_05>E9F`V,7@rH6sBkLm`CG'=9Et&IkDe*Bs@kVY4
DKU2ADffQ3/p)>[%16igA7TUg05Y--DJsW.F"VQZF:ARlDe*Bs@kVe3An5gi05>E9E+EQ5FEhm:
$>OKiAU&<<05>E9FDl)6F"V0AEt&IkDe*Zm@WO2;De*C$D/_+AC30mlC2[X!@:F:2C2[WsDKKo;
/no'B%16igA8G[`F"_9HA7B+kF=q9BF:ARlDe*Zm@WO2=@:Eem@;Tt"AM>em/no'A%16igA8G[`
F"_?<@UsUuE%Yj>Et&I*%16!%9LV6G76N[ZC,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El
0Jjne3&!3;%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!
+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>B6%EtD/!m#+EVO?Cb?i&:IH=>
F!(o!@3Bc4Eb$;2EbT*&FCeu*A79Rg@UX=h+D,P4+CT)&+EVmJATJu4Afs\gDdmHm@rucE+A,Et
+:S[!F`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+EVO?Ci^_2
DfQs0$=n'bF_t]-FD5W*+CT.u+EV19FD5W*+A*bdDe*E3+:SYe$;)F"/hhN'3%cn0+A,Et+ED%5
F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDCuA*:i^8gEZfO:EcYr5DK?q=Afs\gD..3k+=Lu:
Bl%@%.3N&B@;0Od@VfTuAo_g,+EMgLFCf;3F(96)E--.R%13OO8S0)jDfm1:DKBo.Cht4d:IH=>
F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.
8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*
Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,
-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et
+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9
AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__D
DBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-
D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%14Nn$>j3hBkCptFD>`)A8bt#
D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</
Bl@l:%16-);H$._:-CW\-SR/5/ibp>%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("
@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3
Ado(r%16!%9LV6G76N[S-YbOn0d(3h0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!03C,dn)-OgDN
78lQO8PiAX:JO&6+>=p!+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(
@s)X"DKKqBFD,5.8l%htF*VhKASj%/$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%ht
GA1i,+E1b%ATJ:f-qS;gD]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC
3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#
F_t]-F<GXCF`Lu'+DGm>@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[WnDds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\
DJ<]oF*)/8A92[3EarZ90ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$
@VTIaF<Etc@ruF'DIIR2+B*3$EarZ.%16-);H$._:-CWc0J5@<3B8Gr$;aD^<(9Y]9iF29-[09B
+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dk
ATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^mFEMOTBkh\u
$7QDk;FO8J5uU383[\Z#0JO\b2D?m/C,[h$+DNki0d(3j0JXbc3&!-2C,dn(+DNki2(&h?6q'p@
:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14LuDe*p-F`Lu'
.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2A7]p8C2[W6
F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%GF*&O7@<6"$
/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88@;]TuD..-r
FCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYetEbAr+8g&1b
EbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2@<-'nF!,[?
ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,+E(j7BQ&);
8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;)F"/hhN'3%cn0
+A,Et+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!&.EbTH4+:S[$ATDj+Df0V=De:+a
+DkP&AKWC9Anc'mF"&5?G%#*$@:F%a+D,Y4D'3nFF*(u1+EM%5BlJ08/e&-s$;+)^+EMIDEarZ'
A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)
E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#
+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:
@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(
Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5
+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.
9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0
A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/
+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(
/oPcC06Cl=/S]37/T>-2AM4K".1HU                                             ~>
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
zz=:zz,'TIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001 ERR002 ER'
zz=:zz,'R003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR011 ERR012'
zz=:zz,' ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 ERR021 ERR'
zz=:zz,'022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FREESPACE GRO'
zz=:zz,'UP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJODinterface'
zz=:zz,' JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JODVMD JSCRI'
zz=:zz,'PT JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAI'
zz=:zz,'N MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 O'
zz=:zz,'K007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PAT'
zz=:zz,'OPS PUTBLACK REFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8 WOR'
zz=:zz,'D XML afterstr alltrim badappend badblia badbu badcl badfl badil ba'
zz=:zz,'djr badlocn badobj badrc badreps badsts badunique beforestr bget bn'
zz=:zz,'l boxopen catrefs cd changestr checknames checknttab checknttab2 ch'
zz=:zz,'ecknttab3 createjod createmast ctl datefrnum dblquote decomm defzfa'
zz=:zz,'ce del destroyjod did didnum dnl dpset dptable empdnl fex firstone '
zz=:zz,'fod fopix gdeps get globals globs grp gsmakeq guids guidsx host hos'
zz=:zz,'tsep isempty islocref jappend jcr jcreate jderr jdmasterr jnfrblcl '
zz=:zz,'jodsystempath jpathsep jread jreplace justdrv justpath jvn lfcrtrim'
zz=:zz,' locsfx make makedir markmast mubmark nc newd nlargs now nowfd obid'
zz=:zz,'file od ok packd plt put quote read readnoun readobid regd remast r'
zz=:zz,'estd rv saveobid second tc trimnl tslash2 tstamp uses valdate wex w'
zz=:zz,'rep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRCN D'
zz=:zz,'IRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR20'
zz=:zz,'1 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 ER'
zz=:zz,'R211 ERR212 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum co'
zz=:zz,'pydirinv copyfile copyfiles createdl dbakf dfclose dfopen dfp dncn '
zz=:zz,'dnix dnnc dnnm dnrn dropall dropbakdir dropdir dropinv dropnc dropr'
zz=:zz,'ef gettstamps justdrvpath libstatus loadbakdir loaddir loadnc loadr'
zz=:zz,'ef loadstamps maxback movefile nummask packdict packspace puttstamp'
zz=:zz,'s renamefiles restdict restspace savedir saveref tmpdatfile tmpuses'
zz=:zz,'file volfree''),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG'
zz=:zz,'3 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 E'
zz=:zz,'RR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS '
zz=:zz,'HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SO'
zz=:zz,'PUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk dec8'
zz=:zz,'5 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamps dumptext dumpt'
zz=:zz,'m dumptrailer dumpwords extscopes fap fmtdumptext fromascii85 getal'
zz=:zz,'lts getascii85 halfbits htclip jnb jscript jscriptdefs makedump mak'
zz=:zz,'egs masknb namecats nlfrrle nounlrep opaqnames parsecode putallts r'
zz=:zz,'lefrnl sexpin sonl tabit toascii85 uqtsingle wraplinear wrdglobals '
zz=:zz,'writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CND'
zz=:zz,'ICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH'
zz=:zz,' CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ER'
zz=:zz,'R057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066'
zz=:zz,' ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR'
zz=:zz,'076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 '
zz=:zz,'ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR0'
zz=:zz,'96 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR103 INVGROUPS INVMA'
zz=:zz,'CROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK05'
zz=:zz,'4 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065'
zz=:zz,' PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable'
zz=:zz,' appwords badcn bnlsearch bnums checkntstamp checkopen checkpath ch'
zz=:zz,'eckput closedict createst defwords delstuff delwordrefs didstats dn'
zz=:zz,'lsearch freedisk freedisklinux freediskmac freediskwin fullmonty ge'
zz=:zz,'tdicdoc getdocument getexplain getgstext getntstamp getobjects getr'
zz=:zz,'efs gslistnl inputdict invappend invdelete invfetch invreplace isli'
zz=:zz,'b iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscrea'
zz=:zz,'te loadalldirs loadallrefs loadwords mainddir newdparms newregdict '
zz=:zz,'nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathre'
zz=:zz,'f putdicdoc putexplain putgs putntstamp puttable puttexts putwords '
zz=:zz,'putwordxrs rpdtrim rplctable rplcwords sortdnub''),(<<;._1 '' jodtool'
zz=:zz,'s AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR00403 ERR'
zz=:zz,'00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJODtools JO'
zz=:zz,'DLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 OK0040'
zz=:zz,'3 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 WORDTE'
zz=:zz,'STS addgrp addloadscript addloadscript1 allnames allrefs betweenidx'
zz=:zz,' createjodtools dayage delgrp firstcomment firstperiod fsen getrx h'
zz=:zz,'lpnl jodage lg locgrp mls noexp notgrp nt nw obnames onlycomments p'
zz=:zz,'r refnames revonex today todayno updatepublic usedby yyyymondd''),<<'
zz=:zz,';._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY DOCUMENTM'
zz=:zz,'ARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 ERR0253 ERR0'
zz=:zz,'254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterface MONADM'
zz=:zz,'ARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251 OK0252 OK'
zz=:zz,'0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRIPTDOCCHAR '
zz=:zz,'VERBATIMMARK blkaft changetok compclut compj compressj createut cti'
zz=:zz,'t de dewhitejcr dewhitejscript disp doc docct2 docfmt2 doctext docw'
zz=:zz,'ord ed et exobrefs gt jodfork jodhelp ljust obtext pdfreader qt reb'
zz=:zz,' revo rm rtt textform2''                                            '
zz=:5316{.zz
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
