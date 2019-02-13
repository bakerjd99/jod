NB. JOD dictionary dump: 12 Feb 2019 14:40:16
NB. Generated with JOD version; 0.9.998 - dev; 15; 12 Feb 2019 11:00:00
NB. J version: j807/j64/windows/release-b/commercial/www.jsoftware.com/2019-01-22T18:51:16
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|133248494607860607601639321371617972897|
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

DUMPMSG4=:'NB. J version: '

EDCONSOLE=:'"c:\Program Files\Microsoft VS Code\code.exe"'

EDCONSOLE_NPP=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR00407=:'ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot'

ERR103=:'no backup(s) to restore or search'

ERR104=:'no registered dictionaries'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.998 - dev';16;'12 Feb 2019 14:40:16'

JODVMD=:'0.9.998 - dev';16;'12 Feb 2019 14:40:15'

JSON=:31

MACROTYPE=:21+i.8

MIXEDOVER=:'(<:)=:'

OBFUSCATE=:'(/:)=:'

OBFUSCCNT=:100000

OBFUSCPFX=:'o_'

PYTHON=:29

SQL=:30

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

buildjodcompressed=:4 : 0

NB.*buildjodcompressed v-- builds a fully compressed JOD load test script.
NB.
NB. dyad:  blVersion buildjodcompressed blclDirs
NB.
NB. verbatim:
NB.
NB. Builds a compressed JOD load script.
NB. 
NB. Caveats:
NB.
NB. No error checking.
NB. Requires standard J profile.
NB. In addition to standard JOD directories this script also requires 
NB.   the staging directory: .../joddev/alien/stage/jod/
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 08may28 rename/relocate compressed script to root of jod addon
NB. 11feb05 use (jpathsep) to show portable style file paths
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 11nov24 tested on linux
NB. 14nov14 adjusted for j 8.03 (runs on win32 J 8.03 - not 64 - no zfiles)
NB. 15mar15 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17jan09 improve caveat notes for running on jconsole versions
NB. 17mar03 macro script converted to verb

'JODSTAGEDIR JODGITDIR JODADDONDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make, date
'jodversion jodbuildcnt'=.2{.x
jodbuilddate=. alltrim tstamp''
jodbuildcnt=. >:jodbuildcnt

NB. increment build and save - must be done before 
NB. script generation to insure header and class JODVMD match
JODVMD=.(jodbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODVMD';WORD_ajod_;wrep_ajodstore_ 'JODVMD'

NB. set output files
JODFILE=. 'jod.ijs'

NB. working JOD addon script
JODADDONFILE=. JODADDONDIR,JODFILE

NB. backup of JOD script placed in put dictionaries script directory
JODSCRIPTFILE=. JODSCRIPTDIR,JODFILE

NB. JOD staging directory under put dictionaries alien directory
JODSTAGEFILE=. JODSTAGEDIR,JODFILE

head=.'NB. System: JOD  Author: John D. Baker  Email: bakerjd99@gmail.com',LF
head=.head, ('NB. Version: ',(jodversion),'  Build Number: ',(":jodbuildcnt),'  Date: ',jodbuilddate),LF
smoutput head

NB. turn off white space preservation during JOD load
hc=.head,'(9!:41) 0',LF

NB. get preprocessor script - leave only header comments
s=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodprep'

NB. main JOD classes
g=. ;: 'jodon jod jodstore joddob jodmake jodutil' 

NB. collect group dependents 
deps=. gdeps&.> g

smoutput 'compressing ... '
NB. dewhite group headers 
h=. dewhitejscript&.> {:"1 >{: GROUP_ajod_ get g

NB. compress all nondependent words in each group (a cruncher)
code=. , }.@:compj&> ((}.@:grp)&.> g) -.&.> deps

NB. combine header and word definitions 
s=. s , ; , h ,. code

NB. append post processor script
s=. s, dewhitejscript (1;0 2){:: MACRO_ajod_ get 'jodpost'

NB. remove a few remaining redundant blanks after 
NB. assignments - their presence annoys me!
s=. hc , '/ =./=./ =:/=:' changenqt s

NB. save compressed load scripts
smoutput 'output file locations:'
(s=. toJ s) write showpass JODADDONFILE
smoutput s  write showpass JODSCRIPTFILE
smoutput s  write showpass JODSTAGEFILE
updateJODfiles s

NB. update build history - stored as plain text macro
JODBUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODBUILDHISTORY'
JODBUILDHISTORY=. JODBUILDHISTORY,(2#LF),head
assert. >0{MACRO_ajod_ put 'JODBUILDHISTORY';TEXT_ajod_;JODBUILDHISTORY

NB.byte size of generated plain text script
smoutput (":#s),' script bytes'
smoutput 'JOD compressed build complete'
)

buildjodtoolscompressed=:4 : 0

NB.*buildjodtoolscompressed v-- builds compressed version of the JOD tools class script.
NB.
NB. dyad: blVersion buildjodtoolscompressed blclDirs
NB.
NB. Cloned from (buildjodtools) macro
NB.
NB. author:  John D. Baker
NB. changes: -----------------------------------------------------
NB. 11feb08 coinsert 'ijod' added after moving JOD interface to ijod
NB. 12jun25 changed line ends to (toJ)
NB. 15mar15 zfiles removed - build redirected to .../joddev/alien/stage/... directories
NB. 17mar93 jod macro converted to verb

'JODSTAGEDIR JODEXTSDIR JODSCRIPTDIR'=. y

NB. set vmd - version, make. date
jodbuilddate=. alltrim tstamp''
'jodtoolsversion jodtoolsbuildcnt'=. 2{.x
jodtoolsbuildcnt=. >:jodtoolsbuildcnt

NB. increment build counter
JODTOOLSVMD=. (jodtoolsbuildcnt;jodbuilddate) (1 2)}x

NB. save incremented version, make, date in dictionary
assert. >0{(WORD_ajod_,NVTABLE_ajod_) put 'JODTOOLSVMD';WORD_ajod_;wrep_ajodstore_ 'JODTOOLSVMD'

NB. set output files
JODTOOLS=. 'jodtools.ijs'
JODADDONTOOLSFILE=. JODEXTSDIR,JODTOOLS

NB. JOD staging directory under put dictionaries alien directory
JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/',JODTOOLS

NB. backup of tools file placed in put dictionaries script directory
JODSCRIPTTOOLSFILE=. JODSCRIPTDIR,JODTOOLS

thead=. 'NB. System: jodtools  Author: John D. Baker  Email: bakerjd99@gmail.com'
thead=.  thead,LF,('NB. Version: ',jodtoolsversion,'  Build Number: ',(":jodtoolsbuildcnt),'  Date: ',jodbuilddate),LF
smoutput thead

NB. generate tools script and save
smoutput 'compressing jodtools ...'

NB. fetch header and compress
h=. dewhitejscript (1;0 1){:: GROUP_ajod_ get 'jodtools'

NB. compress nondependent group words
'r s'=. compj (grp 'jodtools') -. gdeps 'jodtools'

NB. fetch and compress postprocessor
p=. dewhitejscript (1;0 2){:: MACRO_ajod_ get 'POST_jodtools'

s=. toJ thead,h,s,p
smoutput 'output file locations:'
smoutput s write showpass JODADDONTOOLSFILE
smoutput s write showpass JODSCRIPTTOOLSFILE
smoutput s write showpass JODSTAGETOOLSFILE
updateJODTOOLSfiles s

NB. update build history - stored as plain text macro
BUILDHISTORY=. (1;0 2){:: MACRO_ajod_ get 'JODTOOLSBUILDHISTORY'
BUILDHISTORY=. BUILDHISTORY,(2#LF),thead
assert. >0{MACRO_ajod_ put 'JODTOOLSBUILDHISTORY';TEXT_ajod_;BUILDHISTORY

NB.byte size of generated plaintext script
smoutput (":#s),' script bytes'
smoutput 'JODTOOLS compressed build complete'
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

NB. BUG: j 8.05 win64 can lose y shapes - sy$,y recovers y's shape

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

dfclose=:3 : 0

NB.*dfclose v-- close dictionary file.
NB.
NB. monad:  dfclose clFilePfx
NB. 
NB.   dfclose__DL 'U'  NB. object noun file pointer prefix

NB. allow mixed assignments (<:)=:
fp=. y,'P'
(fp)=: ".y,'F' [ jclose_jfiles_ ".fp
)

dnl=:3 : 0

NB.*dnl v-- list objects in dictionary database files.
NB.
NB. monad:  dnl clStr|zlStr
NB.
NB.   dnl ''        NB. list all words on path
NB.   dnl 'pfx'     NB. list all words on path begining with 'pfx'
NB.
NB. dyad:  ilCodes dnl clStr|zlStr
NB.
NB.   4 2  dnl 'ex'  NB. macros with names containing 'ex'
NB.   0 _3 dnl 'ugh' NB. path order listing of words ending with 'ugh'

WORD dnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (dnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ({. x) e. OBJECTNC do. x dnlsearch__ST y else. jderr ERR001 end.
)

dpset=:3 : 0

NB.*dpset v-- set dictionary parameters.
NB.
NB. monad:  dpset zl | clCommand | (cllParm ; uuValue)
NB. dyad:  iaCode dpset (clParm ; uuValue)

NB. objects !(*)=. DL ST
NB. allow mixed assignments (<:)=:

NB. resets should always work - close any open dictionaries
if. y -: 'RESETME' do.
  3 od '' NB. HARDCODE 3 close code
  if. badrc msg=. markmast~0 do. msg else. ok OK004 [ remast 1 end.
elseif. y -: 'RESETALL' do.
  3 od '' NB. HARDCODE 3 close code
  if. badrc msg=. markmast~0 do. msg else. ok OK004 [ remast 0 end.
elseif.do.
  NB. other options require an open dictionary
  if. badrc msg=.checkopen__ST 0 do. msg return. end.
  DL=.  {:{.DPATH__ST

  if. isempty y do.
    NB. display settable parameters of put/first with current values
    ok <|:>{:>jread WF__DL;CNPARMS__ST

  elseif. -.badcl y do.
    NB. if we are resetting READWRITE status dictionary need only be open
    if. 'READWRITE'-:y do.

      NB. check attributes of READONLY dictionary to insure 
      NB. that it will allow read/write operations on all files
      dcfiles=. (WF__DL;TF__DL;GF__DL;SF__DL;MF__DL;UF__DL) ,&.> <IJF
      NB. err msg (JODstore errors): dictionary file attributes do not allow read/write
      if. 0 e. iswriteable__ST dcfiles do. (jderr ERR095__ST),<DNAME__DL return. end.

      if. badrc msg=.libstatus__DL 0 do. msg
      else.
        RW__DL=: -. LIBSTATUS__DL=: 0  NB. library off/read write
        ok OK008;DNAME__DL
      end.
      return.
    end.
    NB. other changes of dictionary parameters require a put dictionary
    if. badrc msg=. checkput__ST 0 do. msg return. end.
    select. y
    case. 'DEFAULTS' do.
      if. badjr dat=. jread JMASTER;CNMFPARMDEFS   do. jderr ERR088
      elseif. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088
      elseif. dpt=. <(}:>dpt),<|: 1 0 1#"1 dat=. >dat
              badreps dpt jreplace WF__DL;CNPARMS__ST  do. jderr ERR017
      elseif.do.
        NB. reset live object parameters
        (({."1 dat) ,&.> locsfx DL)=: {:"1 dat
        ok OK003;DNAME__DL
      end.
    case. 'CLEARPATH' do.
      RPATH__DL=. i.0
      if. badreps (i.0) jreplace UF__DL;CNRPATH__ST do.
        jderr ERR017
      else.
        ok OK005;DNAME__DL
      end.
    case. 'READONLY' do.
      if. badrc msg=.libstatus__DL 1 do. msg
      else.
        RW__DL=: -. LIBSTATUS__DL=: 1  NB. library on/read only
        ok OK007;DNAME__DL
      end.
    case.do. jderr ERR001
    end.

  elseif. -.badbu y do.
    NB. parameter changes only allowed for put dictionaries
    if. badrc msg=. checkput__ST 0 do. msg return. end.
    msg=. ERR019  NB. errmsg: invalid name/parameter
    if. -. (1=#$ y) *. 2=#y do. jderr msg return. end.  
    if. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088 return. end.
    usp=. >{:dpt=. >dpt
    if. ({:$usp) = pos=. ({.usp) i. {.y do. jderr msg return. end.
    if. (>pos{{:usp) badsts >{:y do. jderr msg return. end.
    NB. reset live object
    ('__DL' ,~ >pos{{.usp)=: >{:y
    dpt=. (}:dpt),<usp=. ({:y) (<1;pos)} usp
    if. badreps (<dpt) jreplace WF__DL;CNPARMS__ST do. jderr ERR017 else. ok OK006;y end.

  elseif.do. jderr ERR001
  end.
end.
)

dumpheader=:3 : 0

NB.*dumpheader  v--  creates  the  dumpfile  and  writes   header
NB. information.
NB.
NB. monad:  dumpheader clPathFile
NB.
NB.   dumpheader 'c:\go\ahead\dump\my\dictionary.ijs'

NB. error msg: unable to create dumpfile
if. _1 -: '' (write :: _1:) y do. (jderr ERR0156),<y return. end.

NB. make box characters portable
9!:7 , PORTCHARS [ curchars=. , 9!:6 ''

NB. format header text
head=. DUMPMSG0 , tstamp ''
head=. head,LF,DUMPMSG3 , ;(<'; ') ,&.> ":&.>JODVMD 
head=. head,LF,DUMPMSG4 , ": , 9!:14 ''
head=. head,LF,ctl 'NB. ',"1 ' ' , DUMPMSG1 , ": 0 1 {"1 DPATH__ST
head=. head,LF,LF

NB. reset box characters
9!:7 curchars

NB. set up J environment to process script - assumes that
NB. JOD is loaded and that a target put dictionary is open
tag=. DUMPTAG,LF

NB. retain white space 
head=. head,'9!:41 [ 1',tag

head=. head,'cocurrent ''base''',tag
head=. head,'sonl_z_=: ''sonl__MK__JODobj i.4''',tag
head=. head, (SOPASS-.' '),'_z_=:] [ 1!:2&2',tag
head=. head,'SOLOCALE_z_=:":>SO__JODobj',tag
head=. head,'soput_z_=:SOLOCALE&put',tag
head=. head,'soclear_z_=: ''0 0 $ clearso__MK__JODobj 0''',tag

NB. append header error msg: unable to append to dumpfile
if. _1 -: (toHOST head) fap <y do. (jderr ERR0155),<y else. OK end.
)

dupnames=:] #~ (0 {"1 ]) e. (0 {"1 ]) #~ [: -. [: ~: 0 {"1 ]

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

  NB. JHS on macs - not tested recently
  NB. elseif. IFJHS *. wex <'wwd_qjide_' do. 0 0$(1!:2&2) '$$$edit$$$',file  NB. qjide

  NB. JHS on win 
  elseif. IFJHS do. edit_jhs_ file  

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

get=:3 : 0

NB.*get v-- retrieves objects from dictionary database files.
NB.
NB. monad:  get blcl
NB.
NB.   get ;: 'us poor little words'
NB.
NB. dyad:  ilCodes get bluu
NB.
NB.   2 8 put 'GroupName';'Group documentation text ....'
NB.   2 8 get 'GroupName'  
NB.   4 get 'MacroText'

WORD get y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. loc defwords__ST y
    case. EXPLAIN  do. WORD getexplain__ST y
    case. DOCUMENT do. WORD getdocument__ST y
    case. NVTABLE  do. (WORD,0) getobjects__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. WORD getntstamp__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) getobjects__ST y
    case. EXPLAIN  do. TEST getexplain__ST y
    case. DOCUMENT do. TEST getdocument__ST y
    case. INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. TEST getntstamp__ST y
    case.do. jderr msg 
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. GROUP getgstext__ST y
    case. EXPLAIN  do. GROUP getexplain__ST y
    case. DOCUMENT do. GROUP getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case. -INPUT   do. GROUP getntstamp__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. SUITE getgstext__ST y
    case. EXPLAIN  do. SUITE getexplain__ST y
    case. DOCUMENT do. SUITE getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case. -INPUT   do. SUITE getntstamp__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) getobjects__ST y
    case. EXPLAIN  do. MACRO getexplain__ST y
    case. DOCUMENT do. MACRO getdocument__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. MACRO getntstamp__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. getdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
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
NB. j profile !(*)=. cocurrent
if. r do.
  curr=. 18!:5 ''   NB. current locale
  cocurrent 'base'  NB. run script from base
  try. 0!:0 s
  catchd.
    cocurrent curr  NB. restore locale
    NB. errmsg: J script error in group
    (jderr ERR00404),y;13!:12 ''
    return.
  end.
  cocurrent curr    NB. restore locale
  ok (y),msg
else.
  t
end.
)

loadbakdir=:4 : 0

NB.*loadbakdir v-- loads complete requested backup directory (y).
NB.
NB. result is 0 for success and 1 for failure.
NB.
NB. dyad: iaBn loadbakdir iaObject
NB.
NB.   NB. word directory from backup 25
NB.   25 loadbackdir WORD

NB. drop backup directory if backup has changed !(*)=. BAKNUM
if. BAKNUM~:x do. dropbakdir 0 end.

if. wex ix=. (<BAKPFX) ,&.> dnix y do. 0  NB. backup directory loaded
else.
  NB. depends on correspondence between (JDFILES) & object codes !(*)=. BAK
  fp=. BAK,(":x),;y{JDFILES  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. allow mixed assignments (<:)=:
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.>ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. reset backup number
    BAKNUM=: x
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)

loaddir=:3 : 0

NB.*loaddir  v-- loads  the  complete  requested  directory  (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loaddir iaObject
NB.
NB.   loaddir WORD  NB. code specifies directory

if. wex ix=. dnix y do. 0   NB. directory loaded
else.
  fp=. ". ({.ix=. >ix),'F'  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. allow mixed assignments (<:)=:
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)

loadnc=:3 : 0

NB.*loadnc v--  load name class for  (y) Result is 0 for success
NB. and 1 for failure. Currently only words and  macros have name
NB. or type class.
NB.
NB. monad: loadnc iaObject
NB.
NB.   loadnc WORD

NB. allow mixed assignments (<:)=:
if. wex dn=. dnnc y do. 0  NB. class/type loaded
else.
  fp=. ". ({.dn=. >dn),'F'  NB. path file name
  if. badjr dat=. jread fp;CNCLASS do.
    1  NB. cannot load
  else.
    (dn)=: >dat
    -. wex <dn
  end.
end.
)

loadref=:3 : 0

NB.*loadref v--  loads word and  test  reference lists from  uses
NB. file.
NB.
NB. Result is 0 for  success and 1  for failure.  Test references
NB. are not currently stored but the code providing this facility
NB. is  left  in  this  verb  and  (saveref)  to  allow for  easy
NB. expansion of reference types in the future.
NB.
NB. monad: loadref iaObject
NB.
NB.   loadref WORD

NB. allow mixed assignments (<:)=:
if. wex dn=. dnrn y do. 0  NB. references loaded
else.
  cn=. ((WORD,TEST) i. y){CNREF
  if. badjr dat=. jread UF;CNMARK,cn do. NB. object noun !(*)=. UF
    1  NB. cannot load
  else.
    dn=. >dn
    dn=. (<_2}.dn) ,&.> DTSIXCN
    (dn)=: dat
    -. *./ wex dn
  end.
end.
)

loadstamps=:3 : 0

NB.*loadstamps v-- loads directory time stamps (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loadstamps uuIgnore

NB. allow mixed assignments (<:)=:
ts=. DIRTS
if. *./b=. wex ts do. 0  NB. stamps loaded
else.
  ts=. (-.b)#ts          NB. load missing only
  for_st. ts do.
    fp=. ". ({.st=. >st),'F'   NB. path file name
    if. badjr dat=. jread fp;CNMARK do.
      1 return.
    else.
      (st)=: >dat
    end.
  end.
  -. *./ wex ts  NB. check loaded stamps
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

    NB. define nouns - override mixed assignments (<:)=: 
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)

mls=:3 : 0

NB.*mls v-- make load script.
NB.
NB. Generates a J (load) script from a JOD group and  an optional
NB. POST_ process macro script.
NB.
NB. monad:  mls clGroupName
NB.
NB.   NB. generate script and add to public scripts
NB.   mls 'JODaddon'
NB.
NB.   scripts 'e'       NB. JODaddon is now on scripts
NB.   load 'JODaddon'   NB. load's like any J load script
NB.
NB. dyad:  baPublic mls clGroupName
NB.
NB.   NB. make script but do not add to public scripts
NB.   0 mls 'JODaddon'
NB. 
NB.   NB. make script and return text
NB.   2 mls 'JODaddon'

1 mls y
:

NB. HARDCODE: option qualifier codes
NB. 2 _2 make assembles entire group script
NB. with preamble regardless of where the
NB. group appears on the JOD path
v=. 2 _2 make gn=. y -. ' '
'r s'=. 2{.v
if. r do.
  NB. group make succeeded - append any POST_ script
  postpfx=. POSTAMBLEPFX
  if. badrc sp=. 4 dnl postpfx do. sp return. end.
  if. (<ps=. postpfx , gn) e. }.sp do.
    v=. 4 get ps
    'r p'=. 2{.v
    if. r do. s=. s , (2#LF) , (<0;2) {:: p else. v return. end.
  end.
  if. 2-:x do. ok s
  else.
    pdo=. {:0{DPATH__ST__JODobj   NB. put dictionary directory object
    rf=. gf=. SCR__pdo            NB. default directory

    NB. redirect script output if ROOTFOLDER exists and is configured - standard profile !(*)=. jpath
    if. wex <'ROOTFOLDER__pdo' do.
      NB. errmsg: ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot
      if. badcl ROOTFOLDER__pdo do. jderr ERR00407 return. end.
      if. 0 < #rf=. alltrim ROOTFOLDER__pdo do. 
        if. '~' ~: {. rf do. jderr ERR00407 return. end.
        NB. do not expand relative path strings - relative paths must be configured
        if. rf -: gt=. jpath rf do. jderr ERR00407 return. else. gf=. tslash2 gt end. 
        rf=. tslash2 rf
      else.
        rf=. gf
      end. 
    end.

    lsn=. gf,gn,IJS__JODobj  NB. errmsg: unable to write load script 
    if. _1 -: (toHOST s) (write :: _1:) lsn do. (jderr ERR00408),<lsn return. end.
    NB. update scripts.ijs
    x addloadscript gn;rf,gn
    
  end.
else.
  v
end.
)

mnl=:3 : 0

NB.*mnl v-- list objects in all registered dictionaries.
NB.
NB. monad:  mnl clStr | zlStr
NB.
NB.   mnl ''     NB. list all words in all registered dictionaries
NB.   mnl 'pfx'  NB. list all words in all registered dictionaries starting with 'pfx'
NB.
NB. dyad:  ilCodes mnl clStr | zlStr
NB.
NB.   4 2  mnl 'ex'  NB. macros with names containing 'ex' in all registered dictionaries
NB.   2 3  mnl 'et'  NB. groups with names ending with 'et' in all registered dictionaries
NB.   4 3 25 mnl '_sql' NB. text macros with names ending '_sql'
NB.   0 _1 mnl 'se'  NB. duplicate words starting with 'se'

WORD mnl y
:

NB. (mnl) does not require open dictionaries 
if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
elseif. do.

  NB. format standard (mnl) (x) options and search
  x=. 3 {. x , (<:#x)}. 1 , DEFAULT
  
  NB. validate options
  if. -.((1{x) e. PATOPS) *. (0{x) e. OBJECTNC do. jderr ERR001 return. end.

  
  if. WORD = 0{x do.
 
    if. -.(2{x) e. (i. 4),DEFAULT     do. jderr ERR001 return. end.
    
  elseif. (0{x) e. TEST,GROUP,SUITE do.

    if. DEFAULT ~: 2{x                do. jderr ERR001 return. end.

  elseif. MACRO = 0{x  do.

    if. -.(2{x) e. MACROTYPE,DEFAULT  do. jderr ERR001 return. end.

  elseif. do. jderr ERR001 return.

  end.
  
  x mnlsearch__ST y
end.
)

mnlsearch=:4 : 0

NB.*mnlsearch v-- master name list search.
NB.
NB. dyad:  ilOpt mnlsearch clNamePattern

NB. ERR006 cannot read master
if. badjr d=. >jread (JMASTER,IJF);CNMFTAB do. jderr ERR006 return. end.

NB. ERR104 no registered dictionaries
if. 0 e. $d do. jderr ERR104 return. end.
if. fex f=. (tslash2&.> 2{d) ,&.> <(;(0{x){JDFILES),IJF do.
  r=. 0 2$<'' [ y=. ,y
  g=. (<: |1{x){nlpfx`nlctn`nlsfx

  NB. read class if not default and WORD or MACRO
  b=. ((0{x) e. WORD,MACRO) *. DEFAULT ~: 2{x

  for_i. i.#f do.
    o=. i{f [ n=. i{0{d

    NB. ERR088  jfile read failure
    if. badjr p=. >jread o;CNLIST do. jderr ERR088 return. end.
    if. b do.
      if. badjr s=. >jread o;CNCLASS do. jderr ERR088 return. end.
      p=. p #~ s = 2{x
    end.

    if. 0=#p do. continue. end.
    r=. r , (p (g `: 6) y) ,. n
  end.
  r=. /:~ r
  if. 0 > 1{x do. ok <dupnames r else. ok <r end. 
else.
  b=. (1:@(1!:4) ::0:) f
  (jderr ERR073) , f #~ -. b
end.
)

namecats=:4 : 0

NB.*namecats v-- extracts and classifies names in J code.
NB.
NB. dyad:  pa namecats ctJcode
NB.
NB. name classifications
NB.   global           global reference or assignment
NB.   local            local reference of assignment
NB.   declared global  names marked with global comment tag (*)=:
NB.   declared local   names marked with local command tag (*)=.
NB.   override mixed   allow mixed assignments (<:)=:
NB.   for. local       implicit for. locals
NB.
NB.  0 namecats jcr 'wordname' NB. only globals
NB.  1 namecats jcr 'wordname' NB. full classification

if. badrc parsed=. parsecode y do.
  parsed  NB. parse error
else.
  'dgbls dlocs parsed'=. }. parsed

  NB. handle quoted assignments and implicit for. locals
  'mgbls mlocs flocs'=. extscopes parsed

  NB. declarations override other scopes
  mgbls=. mgbls -. dlocs [ mlocs=. mlocs -. dgbls
  gbls=. dgbls,mgbls [ locs=. dlocs,mlocs

  NB. pick out assignments
  parsed=. parsed -. ;:')'
  uv0=. parsed #~ 1|.parsed = <'=.'
  uv1=. parsed #~ 1|.parsed = <'=:'

  NB. forbid names from being both local and global
  uv1=. uv0 -. uv0 -. uv1
  
  NB. errmsg: mixed scopes
  if. 0 < #uv1 do. 
    NB. check for mixed assignment override
    if. -.MIXEDOVER +./@E. ,y do. (jderr ERR0159),uv1 return. end.
  end.

  uv1=. parsed -. uv0
  gbls=. gbls , (jnfrblcl uv1) -. locs,JARGS

  if. x do.
    NB. complete name classification
    locs=. locs,jnfrblcl uv0
    uv1=. (<gbls),(<locs),(<dgbls),(<dlocs),<flocs
    ok <GLOBCATS ,. (/:~)@:~. &.> uv1
  else.
    NB. return only unique sorted globals
    ok /:~ ~. gbls
  end.
end.
)

nlctn=:([: I. [: +./"1 ([: ,: ]) E. [: > [) { [

nlpfx=:[ #~ ([: < [: , ]) -:&> ([: # [: , ]) {.&.> [

nlsfx=:[ #~ ([: < [: , ]) -:&> ([: - [: # [: , ]) {.&.> [

nounlrep=:4 : 0

NB.*nounlrep v-- converts nouns stored as binary  to linear  text
NB. representations. Uses  a  scratch locale to temporarily define
NB. nouns.
NB.
NB. dyad:  iaNoex nounlrep bt

NB. override mixed assignments (<:)=:
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

putjson=:3 : 0

NB.*putjson v-- store JSON as JOD text macros.
NB.
NB. monad:  putjson clFile
NB. dyad: clPath putjson clFile

NB. !(*)=. jpath
(jpath '~temp/') putjson y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'json file does not exist' assert fexist file
'file is not json' assert 'json' -: tolower justext file
jsonname=. (justfile winpathsep file),'_json'
json=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ JSON_ajod_
MACRO_ajod_ put jsonname;JSON_ajod_;json
)

putpy=:3 : 0

NB.*putpy v-- store Python code as JOD text macros.
NB.
NB. monad:  putpy clFile
NB. dyad: clPath putpy clFile

NB. !(*)=. jpath
(jpath '~temp/') putpy y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'py file does not exist' assert fexist file
'file is not python' assert 'py' -: tolower justext file
pyname=. (justfile winpathsep file),'_py'
py=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ PYTHON_ajod_
MACRO_ajod_ put pyname;PYTHON_ajod_;py
)

putsql=:3 : 0

NB.*putsql v-- store SQL as JOD text macros.
NB.
NB. monad:  putsql clFile
NB. dyad: clPath putsql clFile

NB. !(*)=. jpath
(jpath '~temp/') putsql y
:
file=. x,y
'JOD not available' assert 0=nc <'JODobj'
'sql file does not exist' assert fexist file
'file is not sql' assert 'sql' -: tolower justext file
sqlname=. (justfile winpathsep file),'_sql'
sql=. read file
NB. require 'general/jod' !(*)=. put MACRO_ajod_ SQL_ajod_
MACRO_ajod_ put sqlname;SQL_ajod_;sql
)

releasejod=:4 : 0

NB.*releasejod v-- final JOD replease steps.
NB.
NB. dyad:  blVersion releasejod blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 11feb14 coinsert 'ijod' for new locale
NB. 11may25 (IFWIN) excluded from some (gdeps) tests
NB. 12oct12 (IFWIN IFIOS UNAME) excluded from (gdeps) tests
NB. 15mar17 remove zfiles - redirect build to .../joddev/alien/stage/... directories
NB. 17mar03 jod macro converted to verb

'JODSTAGEDIR JODSTAGEPDFDIR JODSTAGEDOCDIR JODGITDOCDIR'=. y

NB. insure build dictionaries are open
assert. >0{od ;:'joddev jod utils' [ 3 od ''

jodversion=. ,>0{x

NB. JOD staging directory under put dictionaries alien directory
locsfx=. ;locsfx__JOD__JODobj {.{:"1 DPATH__ST__JODobj 
JODDOC=. (jpathsep ".'DOC',locsfx),'jod.pdf'

NB. check that all group dependents are in associated groups
NB. this is not necessary but highly recommended for groups
NB. that are used to form classes
JPROFILE=. ;:'IFIOS IFWIN UNAME'
assert. (a: -.~ (gdeps 'jod') -. JPROFILE) e. grp 'jod'
assert. (a: -.~ (gdeps 'jodstore') -. JPROFILE) e. grp 'jodstore'
assert. (a: -.~ (gdeps 'jodutil') -. JPROFILE) e. grp 'jodutil'
assert. (a: -.~ gdeps 'jodmake') e. grp 'jodmake'
assert. (a: -.~ gdeps 'joddob') e. grp 'joddob'
assert. (a: -.~ gdeps 'jodon') e. grp 'jodon'
assert. (a: -.~ gdeps 'jodtools') e. grp 'jodtools'

NB. !(*)=. manifestjoddocument historyjoddoc
sl=. ;: 'manifestjoddocument historyjoddoc'
assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests script
((0!:110) :: 0:) manifestjoddocument

NB. update document scripts
assert. 0<(toJ manifestjoddocument) fwrite showpass JODSTAGEDOCDIR,'manifest.ijs'
assert. 0<(toJ historyjoddoc) fwrite showpass JODSTAGEDOCDIR,'history.txt'
assert. 0<(toJ historyjoddoc) fwrite showpass JODGITDOCDIR,'history.md'

if. fexist JODDOC do.
  NB. copy jod.pdf to stage directory
  pdf=. read JODDOC
  pdf write showpass JODSTAGEPDFDIR,'jod.pdf'
  smoutput 'JODDOCUMENT updated'
else.
  smoutput 'JOD document not found -> ';JODDOC
end.

smoutput 'JOD distribution build complete'
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

rxs=:''&$: :(4 : 0)

NB.*rxs v-- regular expression search.
NB.
NB. monad:  rxs blclNames
NB.
NB.   NB. display all WORD regx search text
NB.   NB.  '' rxs }. dnl 're'
NB.
NB.   rxs }. dnl 're'  
NB.
NB. dyad:  (clPatten ; ilCodes) rxs blclNames
NB.        clPattern rxs blclNames


NB. do we have a dictionary open? 
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. (x) is either cl or (cl ; il)  errmsg: invalid option(s)
msg=. ERR001
if. 1 < L. x do. jderr msg return. end.
if. 0 = L. x do. x=. x ; WORD,DEFAULT,1
else.
  if. (1 ~: $$,x) *. 2 ~: #,x do. jderr msg return. end.
end.

NB. regular expression and object options
'pat opts'=. x
if. badcl pat  do. jderr msg return. end.
if. badil opts do. jderr msg return. end.

NB. format options HARDCODE: codes and positions
opts=. opts , (-3-#opts) {. DEFAULT , 1
if. -. 1 2 3 e.~ {: opts do. jderr msg return. end.

if. DICTIONARY=0{opts do.
  NB. no short and long texts for dictionary documents
  if. DEFAULT ~: 1{opts do. jderr msg return. end.
  NB. tolerate any (y) for dictionary text case
  uv=. opts rxsget 0
else.

  NB. are names valid?
  if. badrc y=.checknames y do. y return. else. y=. }.y end.

  NB. remove nouns - they are not searched for patterns
  NB. return nothing found if all names are nouns
  if. WORD = 0{opts do.
    if. badrc uv=. (WORD,INCLASS) invfetch__ST y do. uv return. end.
    if. 0 = #y=. y #~ 0 ~: >1{uv do. ok <0 2$<'' return. end.
  end.

  if. badrc uv=. opts rxsget y do. uv return. end.
end. 

NB. empty patterns mean return all nonempty text to be searched
NB. handy for complex pattern debugging and verification
if. #pat do. (pat;opts) rxssearch >1{uv else. uv  end.
)

rxsget=:4 : 0

NB.*rxsget v-- retrieves  text  objects from dictionary  database
NB. files.
NB.
NB. A  variation of (get) that only retrieves  text  objects from
NB. dictionary  database  files. (rxsget)  returns the texts that
NB. are searched for regular expression patterns by (rxs).
NB.
NB. Note:  binary objects (nouns)  are  eliminated from the  name
NB. list (y) by the caller of this verb.
NB.
NB. dyad:  ilCodes rxsget bluu
NB.
NB.   2 8 1 rxsget 'GroupName'
NB.   4 7 1 rxsget 'MacroText'

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. txt=. (WORD,0) getobjects__ST y
    case. EXPLAIN  do. txt=. WORD getexplain__ST y
    case. DOCUMENT do. txt=. WORD getdocument__ST y
    case.do. jderr msg return.
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. txt=. (TEST,0) getobjects__ST y
    case. EXPLAIN  do. txt=. TEST getexplain__ST y
    case. DOCUMENT do. txt=. TEST getdocument__ST y
    case.do. jderr msg  return.
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. txt=. GROUP getgstext__ST y
    case. EXPLAIN  do. txt=. GROUP getexplain__ST y
    case. DOCUMENT do. txt=. GROUP getdocument__ST y
    case.do. jderr msg return.
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. txt=. SUITE getgstext__ST y
    case. EXPLAIN  do. txt=. SUITE getexplain__ST y
    case. DOCUMENT do. txt=. SUITE getdocument__ST y
    case.do. jderr msg return.
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. txt=. (MACRO,0) getobjects__ST y
    case. EXPLAIN  do. txt=. MACRO getexplain__ST y
    case. DOCUMENT do. txt=. MACRO getdocument__ST y
    case.do. jderr msg return.
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. txt=. getdicdoc__ST 0
    case.do. jderr msg return.
  end.
case.do. jderr msg return.
end.

if. badrc txt do. txt
else.
  NB. form two column (name,text) table remove 0 length texts
  if. badcl txt=. >1{txt do.
    txt=. (0,<:{:$txt) {"1 txt
    ok <txt #~ 0 < #&> 1 {"1 txt
  else.
    NB. dictionary documentation case often empty - only unnamed text  
    ok <((0<#txt),2)$'';txt
  end.
end.
)

rxssearch=:4 : 0

NB.*rxssearch v-- search (name, text) table for regex matches.
NB.
NB. dyad:  (clPat ; ilOpts) rxssearch btNameText

NB. all arguments validated by callers
'pat opts'=. x

NB. require 'regex' !(*)=. rxfirst rxall rxmatches
NB. HARDCODE: option codes
select. {:opts
case. 1 do.
  h=. pat&rxfirst&.> 1 {"1 y
  ok  <((0 {"1 y) ,. h) #~ 0 < #&> h
case. 2 do.
  h=. pat&rxall&.> 1 {"1 y
  ok  <((0 {"1 y) ,. h) #~ 0 < #&> h
case. 3 do.
  h=. pat&rxmatches&.> 1 {"1 y
  b=. 0 < #&> h
  ok  <(b # 0 {"1 y) ,. (b # h) ,. b # 1 {"1 y
case.do. jderr ERR001
end.
)

setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore

locx=. locsfx__JOD__JODobj {.{:"1 DPATH__ST__JODobj
aliendir=. ".'ALI',;locx
JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath '~addons/general/jod/jodexts/'

NB. build directories
JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
)

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

updatejoddistribution=:4 : 0

NB.*updatejoddistribution v-- updates files in JOD distribution.
NB.
NB. dyad: blVersion updatejoddistribution blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 08may28 removed install bats and scripts - simplifies JAL maintenance
NB. 08sep24 added history.txt to distributed files
NB. 11feb14 coinsert 'ijod' added,jod.pdf removed from zip
NB.         google/codeplex directory update removed
NB. 11feb17 jodpdf.txt directory placeholder added
NB. 11may18 joddoc/linuxnotes.txt added
NB. 12jun20 (setjaddonpaths) added for win, linux, mac path
NB. 12jun22 added (macnotes_TXT) 
NB. 12jun25 forcing line ends (toJ)
NB. 12jul07 copy dist zip to dropbox folder
NB. 14jun25 remove dropbox folder copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/state/... directories
NB. 15jul15 remove (jodindex_HTML) large obsolete object
NB. 17mar14 converted to verb

'JODSTAGEDIR JODGITDIR'=. y
jodversion=. ,>0{x

NB. scripts, labs and bats
NB. !(*)=. historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump
NB. !(*)=. LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak jodpdf_TXT linuxnotes_TXT macnotes_TXT 
sl=. 'historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump'
sl=. sl,' LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak'
sl=. ;: sl,' jodpdf_TXT linuxnotes_TXT macnotes_TXT'

rc [ 'rc jodscr'=. 4 get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests manifest script 
((0!:110) :: 0:) manifestjod

NB. update files
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodparms.ijs'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodprofile.ijs'
assert. 0<(toJ historyjod)    fwrite showpass JODSTAGEDIR,'history.txt'
assert. 0<(toJ historyjod)    fwrite showpass JODGITDIR,'history.md'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodbak/jodprofilebak.ijs'
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodbak/jodparmsbak.ijs'
assert. 0<(toJ joduserconfigbak)  fwrite showpass JODSTAGEDIR,'jodbak/joduserconfigbak.ijs'
assert. 0<(toJ manifestjod)   fwrite showpass JODSTAGEDIR,'manifest.ijs'
assert. 0<(toJ labexample001) fwrite showpass JODSTAGEDIR,'jodlabs/labexample001.ijs'
assert. 0<(toJ LabDump)       fwrite showpass JODSTAGEDIR,'jodlabs/labdump.ijs'
assert. 0<(toJ jodintro)      fwrite showpass JODSTAGEDIR,'jodlabs/jodintro.ijt'
assert. 0<(toJ joddump)       fwrite showpass JODSTAGEDIR,'jodlabs/joddump.ijt'
assert. 0<(toJ jodbest)       fwrite showpass JODSTAGEDIR,'jodlabs/jodbest.ijt'

NB. store jodpdf.txt place holder for jod.pdf - available online
assert. 0<(toJ jodpdf_TXT) fwrite showpass JODSTAGEDIR,'joddoc/pdfdoc/jodpdf.txt'

NB. store linux/mac specific notes
assert. 0<(toJ linuxnotes_TXT) fwrite showpass JODSTAGEDIR,'joddoc/linuxnotes.txt'
assert. 0<(toJ macnotes_TXT)   fwrite showpass JODSTAGEDIR,'joddoc/macnotes.txt'

smoutput 'JOD staging directories updated'
)

updatejodmanifest=:3 : 0

NB.*updatejodmanifest v--  set  JOD  addons manifests to  current
NB. version.
NB.
NB. set  interface  lists  - looks for  JODOSHOST  noun  if found
NB. appropriate interface lists are set  otherwise the default or
NB. standard interface lists are used.
NB.
NB. monad: updatejodmanifest uuIgnore

assert. >0{setjodinterface 0

jodversion=. ,>0{JODVMD

NB. get manifest scripts
sl=. ;:'manifestjod manifestjodsource manifestjoddocument'
assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl

NB. set manifest scripts
({."1 jodscr)=. {:"1 jodscr

NB. set manifest versions from dictionary versions
jodstamp=. showpass '/VERSION=:''',( '''' beforestr 'VERSION=:''' afterstr manifestjod),'''/VERSION=:''',jodversion,''''
manifestjod=. toHOST jodstamp changestr manifestjod

scrver=. allwhitetrim LF beforestr 'VERSION=:' afterstr manifestjodsource
jodstamp=. showpass '/VERSION=:',scrver,'/VERSION=:''',jodversion,''''
manifestjodsource=. toHOST jodstamp changestr manifestjodsource

scrver=. allwhitetrim LF beforestr 'VERSION=:' afterstr manifestjoddocument
jodstamp=. showpass '/VERSION=:',scrver,'/VERSION=:''',jodversion,''''
manifestjoddocument=. toHOST jodstamp changestr manifestjoddocument

NB. update manifest scripts
assert. >0{MACRO_ajod_ put 'manifestjod';JSCRIPT_ajod_;manifestjod
assert. >0{MACRO_ajod_ put 'manifestjodsource';JSCRIPT_ajod_;manifestjodsource
assert. >0{MACRO_ajod_ put 'manifestjoddocument';JSCRIPT_ajod_;manifestjoddocument
smoutput 'JOD manifests updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


updatejodsourcedumps=:4 : 0

NB.*updatejodsourcedumps v-- update files in JODSOURCE distribution.
NB.
NB. monad:  blVersion updatejodsourcedumps blclDirectory 
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: -------------------------------------------------------------
NB. 07nov17 copies to JAL subversion directory
NB. 11feb14 coninsert 'ijod' added, google svn removed
NB.         plain *.ijs jod source directory added
NB. 11may18 jodsourcesetup.ijs added
NB. 11may26 copy of jodsourcesetup.ijs added to zip for backup
NB. 12jun20 add (setjaddonpaths, setjaddoncopy) to set paths/copy on win, linux, mac
NB. 12jun25 set all line ends (toJ)
NB. 12jul07 copy source zip to dropbox
NB. 14jun25 remove dropbox copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/stage... directories
NB. 15jun30 toggle RETAINAGE for jodsource dumps
NB. 17mar03 jod macro converted to verb

JODSOURCESTAGEDIR=. y
jodversion=. ,>0{x

NB. scripts, labs and bats !(*)=. manifestjodsource jodsourcesetup
sl=. 'manifestjodsource jodsourcesetup'
sl=. ;: sl

assert. rc [ 'rc jodscr'=. MACRO_ajod_ get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. update manifest 
assert. 0<(toJ manifestjodsource) fwrite showpass JODSOURCESTAGEDIR,'manifest.ijs'

assert. >0{3 od ''

assert. >0{od 'joddev'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0
assert. rc [ 'rc msg joddev'=. make ''
assert. >0{dpset 'RETAINAGE';1 
assert. >0{3 od ''

assert. >0{od 'jod'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0 
assert. rc [ 'rc msg jod'=. make ''
assert. >0{dpset 'READONLY' [ dpset 'RETAINAGE';1
assert. >0{3 od ''

assert. >0{od 'utils'
assert. >0{dpset 'READWRITE'
assert. >0{dpset 'ASCII85';1
assert. >0{dpset 'RETAINAGE';0 
assert. rc [ 'rc msg utils'=. make ''
assert. >0{dpset 'READONLY' [ dpset 'RETAINAGE';1
assert. >0{3 od ''

NB. read files
joddevdat=. read joddev
joddat=.    read jod
utilsdat=.  read utils

NB. update dump files 
FILES=. <;._1 ' joddev.ijs jod.ijs utils.ijs jodsourcesetup.ijs'
FILES=. (<JODSOURCESTAGEDIR) ,&.> FILES
assert. 0<(toJ joddevdat)  fwrite showpass ;0{FILES
assert. 0<(toJ joddat)     fwrite showpass ;1{FILES
assert. 0<(toJ utilsdat)   fwrite showpass ;2{FILES
assert. 0<(toJ jodsourcesetup)  fwrite showpass;3{FILES

smoutput 'JODSOURCE stage directory updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H.992_cF1+>t>s3$:1'1H$@9+>u,#0f'q-3$:+%1,g=11a"\4+>P\p2_lL10H`80+>Gbs1,C%-
0d&8,+>t>t1*ACr0fC.7+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt2BXb4+>Y,q1*A;*+>Ybq1a"V0
+>Y,t1*AS"2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!1GL"0+>Ybq2]sk1+>Y,s0d&=r1,U1/
0H`5,+?1K$3$9t!1,C%.+?:Q#+>c&#0ea_,1*AFs2)?@1+>P_q0ea_,2'=h#1bp13+>u)"2]st3
+>GPm1GL"4+>bhr1E\D1+>Y,s1E\\#1,C%4+>Z##2'=b5+>k9#0H`4q2)$.4+>ttt2BXe3+>P&p
3?U:(1H$@7+>Pr"2'=\5+>t>t3$9q0+>Pbr1*A>++>Y,p3?U+#1,U14+>kqt3?U.7+>GVo1Gg4/
2'=_8+>PYo1G^..2]sq5+>PVn1H7co7nHZYDKTf-Ea`c,@q]:k@:OCjEcXWK9i+P_7l3g\G%G]8
Bl@l3FD,*)+CfG'@<?'k+EV:2F!,"9D/a*$Ch6%'6VgHU:J=3!AU&;>ARoLsDfQtBD]j1DAKZ21
ASrW2F`))2DJ((a:IH=>DBN\(Df0W7Ch4`-DBN"pDId[0F!,OLF*(u1F%&Ja:JOha9LW;`:f)%J
FCfE"A1K/_AU%c/779L=:/aq^73HPXFD+365t".>B6%p5E$/S,A0>r9Blmo/BOtU_ATAo'De*EN
H:gt$Bl8$(Eb8`iARfY!AKXT@6m-2]FCfK)@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4
F(KH.De*R"FCfK)@:Njt8U=!)6tpO\ATDBk@qAS<5u'g6;FGSJ@;]UaEb$;&DfTD38l%htBl8$(
Eb8`iAKWQIF`V,)+C]U=.!&sAC2[WsDKKH1Amo1\.3N/DEbTE(+A,Et+C]J-Ch-+`8l%isDf9H5
8l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*A8,q'ATDBk
@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C<)6:`
;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk8lJM\8lJM\
+E(_(ARfg)@rGmh9gM-E:K1In7;ZICEc3(BAU&;>FEqh:F"AGEAT23uA90dS8lJ)T8PiA;9L2WH
==d!B9h[*?9h[*;79EM?6<R8V/58E.912QW:+TCE7Q=+6=@GVR<^fo'Bm=3"+CT>4BkM=#ASuT4
Dg#]4EbT&q+EV%):I7NN;aWiM7;lXIF`V&$FCcS2De!3l+DG@tDKKT)Bk;=++EV%):I7NN;aWoI
<,Q,]AKYo#Ap&0)@<?4%DBNb0D/")7/Ke_@B4tjs+Eh10F_,V:Ch7[/+Dbb-AScW7FDi:3CghBu
:I7NN;aXAN=DqY\F`V&$FD5Z2+Dbt+@;I'#A7]Y#BkD'jEZf=AAS,Y$:g$ag:JO_h<(Ke[+EM%5
BlJ/:DdmHm@rri'De*EX;+snc9H\CdEbTK7+E(_(ARfg)@rGmh<(0_b=[>bV78e5=F*&OAATMp$
B4W3,GA2//BHSlL0d(CP+>=pVAnGLbATVs(FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9
@UWb^F`;D2DJX-'F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj@r$4++D,>(
ATM<uCia/rEard(ARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;+D,P4+EM76
E,9).@q]:k@:OCjEZf14F*&OD@<?U&Ec,r-F_PZ&C2[WmDf'H6ATMp(A7B[qCh.T0@3B0)Ci"A>
@rH4'Eb0<5ARloU:IH=ADdd0!FCfN8+EM%5BlJ0'F_PZ&C2[X)Df9H5@rH4'Eb0<5ARo7mBl%=$
+Cf>,E,oN2F(Jl)G%G]8Bl@l3De:,6BOr;Y:IH=IDf9H5+Cf4rF)rIF@rc:&FCSuq@r#t(FCAW7
@q]F`CNCV,Cht59BQ@Zq+=M,9D.P8&@r,RpF'U>=AU&;G+EV%$Ch7ZtDf'H6ATMp-Eb0*+G%G_;
@;Ka&GA(]4AKZ&5@:NjkAo_g,+A*c#DfTB0+CT.u+EM47Ecbl1F!,:;@ps0rDIIBnF(96%@<?'q
De*Bm@ruF'DIIR2+E(_(ARfg)@rc-hFD5Z2+Eh=:@UrqVCM%1$Ci"A>EHP]+BkD'jA0>>i@r$4+
+D,>(AKYr#FD,2s@r-()ARfOpF(HJ)Bk)7!Df0!(Gp$^5Ch7-pCi!g,F<GL2C1UmsF!,17+Co1r
FD5Z2@<-W9A79Rg@UX=h+D,>(ATMC$F(KH7ATT&*Bk)7!Df0!(Gp%'7Ea`frFCfK6A9Da.BOtU_
ATD:$ART[lF!,R<AKYN+D/a*$Ch4_tDIal6EbTW,F!,.-@:Wqi+DG_*DfT]'FD5Z2A9Dj/@;TRs
F(K0!@rri3DJXS@A9Dj-Bk(RnAKYl!D.Rc2Bl5&8@:F%a+C\c#ARlp%DBNP*EcZ=F@rH1+D/Noq
ARoLs+Co1rFD5Z2@<-W9DdmHm@rud'FCeusF<G[:G][S0FE1r7EbT*.ATJu4@VTIaFE8R:Ec5e;
A8,OqBl@ltEd8d<@<>pe@<6!&Anc'mF(]'+DKKrA@;TsrATT&4@;TR,+CfG'@<?4%DBNA*A0>\s
F*&ODF`\aJBl.F&FCB$*F)#W(Df0Z>Ec*!l:IH=DDBNt2F*2;@+DGm>0d(1B+EM[8@qB_&Ap%o4
@;]Tu0Hb:UBOu4.Bldj%B5M'mAKYE!A0>],@:UKQ:IH=<Ec6)>Ci<`m@UX%_Bl\$.@:XF%@rH4'
Ch7^"+ED%5F_,W9ARlom@:O(qE$/\*Eb/a&DfU+G.![7XDdd0eBl\$.@:XF%FD,5.@rH4'Ch7^"
+ED%5F_,W9ARlooBl[cpFDl2F+=MLaCi<`mDI[L$@:UKu@;TQu@r,RpF!,(5EZccU.3MN"F*2;@
+DGm>0HatGEZfFG@q0(kF!+n/A0<TLAoD]4AmoCiF`M&0Ddd0sAS,as@:XF%GAhM4+CT.u+EV19
F<GU8An?!oDI[6#Ch[s4F!,(8Df$V>F(KD8Anc'mCi<`mF*(i-E-#i6@:XF%A8-'q@ruX0Gp%3C
D.Oi2FCB$*F!)lV.;Wp2A9Vs4A92R*@:XF%A8,OqBl@ltEd8dODfTB0+DG_8D]j.1EbAs*+Dbt+
@;KLrD/=91@;BEsCi<`m+EM%5BlJ02DJX-'F*&OC@VTIaFE8R=DBNA(C`mb0B5)F/ATD?m+Co1r
FD5Z2@<-'nF)>f2F(Jd#@q]^fF*(u6+DtV)AKYf'F*&OGARTUhBPq6qARf.jF(KT<Ea`I"F!+n/
A0>Au@<6L(Anbgt+DtV)ATJu.DBMOo@rGmhDJWg)DJim"ATJu(Df0Z*Bl7X&B-;8<@WQX3Bl7QE
+=K<4-Y$S,F!+q#FE8fY+Du"*FD`3K@<<l7CiF!2D..NrBHV87AS,Y$ATJtBDfBf4D/"<-+D,P4
+DbJ,B4W3%BleB;.68S"4$"a&AKYH#+C]7tF=/L[DJX9(GT\ACD^TF=F(TZ6@<?!m+DtV)AKZ&:
AnGb%ATKmT-p'I;H!t5l+F.C+@3Bi6-Rg0UCia35+=C].-Z3jFDJX?)E+<g(G%G]9F!,@=F`)7C
F*)>@ARlolF!+q+DIIR2+EVNECh[cu@<*K4AU&;>Eb031ATMF#FCB9*Df0W7@WZ1+FCB63ASkmm
ATJu&DIal1ATW'8DK?q=@VTIaF<G[:G][k7DfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nF)Z8D
@;Kb%F)Z8DF!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.<'EOC3+<2F*)>@AKXTD:JN$@
F!+(N6m-S_G]Y'F@:O=rF)Z8DE-ZMHDfTD3:jI.rDf-\-De*E%@<3P`:IH=IAU&;>D.-ppDf]l?
FE;G<F*)>@AKXoK9H[bb+A,Et+EV1>F<GF/@rcL/Eb0&u@<6!pDe*HoDII?(8l%htEb03+ARTXk
+EMX9E-$&:Ecl8@+A*bn@:O=r+EM%5BlJ08EccDDF`)7C8g&4eF*&OG@rc:&FE;JIF)ki)F_kK,
+D#e:Eb0<5Bl@l3F(Jd#@q]n-F(]'+Eb0?5Bk;I!F!,R9G]Y'H@VTIaFE8R:Ec5e;A8,OqBl@lt
Ed8d<@<>pe@<6!&Anc'mF)lMHF(Jd#@q]pp@<,jk+=M,9D.P7@FCf]=.3N_@@VfTuAoD]4Eb/lp
GT^j3FCSuqF)to7@WcC$A7TCpF)to7F!,F1FD,_<F`V,)+C]U=8l%ht@WcC$A0?)7Eb'65ATMs)
DK]`7Df0E'DKKr2FE8RIE$079AKWC8C2[W3+Dbt+@;KKtAoD]4Ecl8;Bl7Q+FCfN8+Cei$ATN!5
A79RkC2[WnBleB:Bju4,Bl@m3E+EC!ATJu+Bl%@%+DG^98l%htA8-+,EbT!*FD5Z2F`:l"FCf3*
A8PamBkCptFE;#8+A,Et+CSekDf0V=D..<rAn?%*F!,RC+CfP7Eb0-1+Eh=:F(oQ1F`:l"FCf3*
A92[3EarZkF_u)=F`:l"FCcS,Bl%@%+DG^98l%iR:K::[73H,TF*)G:@Wcd,Df,           ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GUd01bg+.+>GPm1,1XA+>GPm0ekXC3$9q2+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%9+>GZ+2'=V-+>Pf/1*A;2+>Gf72'=V/+>PW)0H`@u0fM*J+>GSn2`<H7
0f'q,0Jb[20f^@30f_-70f:(.0JkR.0ea_02`Mp71E\V41*A;1+?;/5+>G\q0f1U>+>G\q0f:gF
+>G_r0etXC+>PYo1,gmB+>PYo0f1^E+>PYo0fUpH+>PYo1,(^E+>PYo1G^^D+>PYo1,(O@+>GVo
3&NT:0ea_*2)[-20f1"-2_m*11,C%/1H@660fC./1H@660f'q21bg+.1a"P01H$@11*A;33&Da4
1E\G.0f'q,0H`>02`2^41E\J11,9t3+?;;9@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO+ET1e+C\c#
Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is
/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56FDi:=@<?!m
+DtV)ATKI5$;No?+<VdL+<W(SATMs.De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS+EDRG+=CuD
@:XIkF*')i0k>!.FD5Z2@<-W@%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F;A7]7+0F\@a67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2^!0Q
ANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0
>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO
:-pQUFD,6+AKYi4F*&O6AKYE!+E)41DBNJ(@ruF'DIIR2%16uaEZeh/C`k)Q%16uaEZeh/C`k)X
-OgE#ATAo&DJUFCEb/]40f16e$4R>REZf:2+EV..@rr.e:-pQUGAhM4F!,(8Df$V6Df^"C@s)g4
ASuT4@UWb^F`7csATAo&DJUFC-OgCl$;No?+EV19FE8R:Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS*
$>"6#0d'qCC`k)Q%13OO:-pQUATT&)ATVL(@1<QTEZd+[@W$!)-RT?1ATAnL+C]5)+=ANG$>"6#
1a$7FC`k)Q%13OO:-pQU@W$!)9i"\e9N`KTBl\64EcW@6DJUG-DfQtBBOr<'Df^"C@s)g4ASuT4
@UWb^F`8HT+D#e-AT2`#$;No?+C]5)+E).6Gp%0>@<,jkATJu&+EM77B5D-%E-67FA8,OqBl@lt
Ed8d:@:O(qE$079ATD?)BlbD7D]j"-FD)*j:-pQUBOu'kAKZ).ATD?)@<,p%DJpY:@<?0*DfTB"
EZfC6F*2;@F!,:5CLoOL+>=pF0d("EC`k)Q%16Ze+>b2s+C]5)+=CMa:K/\a+AP6U+DkOsEc6"A
ASu$mDJ()9Bln#2-XT8;<$rf&DBNG3EcP`/F<G%$@r$4+%16Ze+>P&p+C]5)+=D)<-QjNS+AP6U
+D5_5F`;CE@rH7,@;0UnDJ()5F^fE6EbTE(+=D)<-Qm,@+CfP7Eb0-1+C\bhCNXS*$4R>REZd%Y
0d&.m@W$!)-RU#Z+<XEG/g+S=C`mV6F`)7CBl5&'F`MM6DKI"1@:O(qE"*.cEZd%Y0d&1n@W$!)
-RU#Z+<XEG/g+S=C`m.sG%G]'F!,17+CfP7Eb0-1+C\bhCNXS*$4R=O$;No?+EqaEA9/l*Ec5e;
E+*d/Bk):%@<*K"@:O(qE,uHq:-pQU@VfOj+E(j7@UWb^F`8I@F_tT!EZen2FE8uUAS4%H4?G/M
+=Acs1G1C@/ho7:0f:R<1bLL=/ho+60Jk-d$;No?+D,P4D..O.ARlp)D]iJ)E+iZ&F)Q)@F!,=.
FCSu,DKTf-EbT#+F)Q)@Et&IfEZeh/F_u1_3ZqmLC`k)X-OgDlCHX^$4u%CnDKTf;4ZX^6/g+V@
F_u1/$4R>REZeh/C`m2&+<VdL+<VdL+<VdL+<XEG/g)9GDJUFC/ho:4+<VdL+AP6U+DkP/@q]Fp
+CT)&+EqaEA9/l-DBNS+G%GP6@UWb^F`7csATAo&DJUFCEb/]-/7NB;+<VdL+<Ve%67sB'@W$!)
-ZWd-/ho:4+<XEG/g,">FCSuqF!+n-C`mq?Eb'56F*(i2FD5W*+EqOABHS[CAR[#0Bl5&+Bm+'*
+C\bhCNXS*$>"6#0H`.o@W$!)-Y7NM/7NB;+<VdL:-pQU+>=oo+C]5)+=C`F/ho:4+<XEG/g,@V
Eb'56ASu$mDJ()9Bln#2-Y7NM+DG^9B5)O#DBNCs@r$4+%16Ze+>Fup+C]5)+=C`F-S/_B+<VdL
+AP6U+<WB]1E^.EC`k*:GV1^0-QjO,67sC&ATMs7+D#G$Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"
@:O(qE"*.cEZd+[1*C%DC`k*DA1&p;CEO`B+<XEG/g)8l+>P'KDJUFCDe(IT2^]^j:-pQUB6%p5
E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+-Z<NC+DG^9B5)O#DBNCs@r$4+%13OOATAnI+>Fun+C]5)
+=BK'/7NB;+<Ve%67sBhCht5&A9MO)@WNZ5FCB33Bl7Q+GA2/4+=BK'+DG^9B5)O#DBNCs@r$4+
%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?65Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n
@W$!2+CT;'F_t]-F<GXADeio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd]
.3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dE
IS*C(<(0_b06CcHFD>`)0JFj`$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/78M1GK=G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX)]F>5Nn@:X+qF*(u(+D,P4+>Gi!3]%sh
BOPdkAIStU$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RA
E,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6
@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj
0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>a
ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g)`m
<(0_b+B)6*;H/&r%13OO:-pQUEHQ2AAN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR
$4R>;67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o
%15is/g,4FBQ60r+?hi#/g)qm+AP6U+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN
1a!o967sBQ+EqaEA0>buD.Oi"CghC+%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is
/g)8Z+@U*\A7]9o+<X'd@ruF'DIIR26Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-
+<VdL+BNK%A5d&JEarcT:18!N6Yp1PF!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?
+DbJ,B0A9u-p22r0I\+q+=K>r0Ha.X8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cI
F(8m'.3L/a-nK]n/6>VF6sjA;De*3(4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'
4&&".;GU7p:dn`"C2[Wi.1HUn$;No?+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o
:-pQU+<Ve<D/aTB+<Y-%@r$4+@r?B2+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro
@UWb^F`7cs:-pQUEaa!$4ZX]5-QjNn+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS
+<Vdg+=D&8D.P>0Dfor>-OgCl$;No?+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2
FED)7DK?6o:-pQU-Vcu\+=A9_+u(2_4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a
9KF:N+=nX^+=K?g@<-!0+=nWtEHQ2AAL9#n+ECn2B+51W$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1
%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,
@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#
AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>f
A8-',6:"7O?URR=-Rp`_C1\h&$4R>;67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,
@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k)X
1FEV=%15is/g+YEART[l+EV:;ARuun@:O(qE,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'
DBLMRASlC.Gmt*E0RIbI@r#TtFC])qF:AQd$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-
+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*')F$9g.jE+*6lA0>u)Bk)5o$6Tcb:-pQU
FD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN8
0b"IR0RIbI@r#TtFC])qF:AQd$;No?+EMI<AKYGjF(o,,Bl8*&Ch[E&@<-"'D.RU,F!*%WAU&0*
@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT%16uaEZd1]@W$!)-S?u*-OgE#ATAnK+C]5)+=Aco-OgE#
ATAo&DJUFL%16uaEZeh/C`khf-OgCl$;No?+EMI<AKYGjF(o,,Bk1dmFD5i2ATJt'$7KA$C`k)Q
.3L3'+C]5)+?M<)@W$!)-S?bh%14L;+C]5)+=ANc+>#Vs0HahBC`keoHS?RODJUFC/ghbN$7IVO
@W$!)-RU>c/NP"/+C]5)+?M<)0d'qCC`k)X-Qij*-o)oSDJUFC-Rg/i3Zp1#@W$!)4#)(;+C]5)
+=Ach+:SZ+1E^.EC`k)Q.3L3'+>Y-LDJUFW0mb]!@W$!)-S?bh%14L?+C]5)+=ANc+>#Vs1a$7F
C`keoHScjSDJUFC/ghbN$4R>;67sB'@W$!)-S?bU$9g.j@W$!)-S?bh%14p74WktYDJU[Q-OgCl
$=[FSDKTeZ3Zoe&-Qjr_,!$i$1E\1j+taud4#)(kDJUFC/gi(j/M8.n/gh)8%15is/g+b;FCSu,
Ao_g,+<YQ?DIn',F*(u2F<G%$@r$4++>"^IEcQ)=+D#e:ARfgnA.8l`ATAo&DJUG)@:X7uD%-hi
ATAnI+C]5)+C\biDKTe*$>sEq+>G!JDJUG)@:X7uD%-hiATAnK+C]5)+C\biDKTe*$>sEq+>Y-L
DJUG)@:X7uD%-hiATAnM+C]5)+C\biDKTe*$4R>;67sBT@;^?5De:,4ASkjiDJ=!$+EV19FE8R7
EbTW0@ps1iGp$X/E+Not+E)-?FD,5.Ci<`mARlp%@VTIaFE9&D$;No?+A$/fFD,5.Ci<`m+EMC<
CLnW1ATMr9F(96)E--.D@<,p%@q]:gB4YTr@3BB)F<GL6+EV:.F(HJ9ATMs7%15is/g,"RF*&O6
AKZ#)G%l#/A1eu6$4R>;67sB'@W$!)-RT?1-tI43+=ANc+>#Vs@W$!)-RT?1%15is/g)9GDJUFC
/n8gBDKI68$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bU$4R>;67sB'@W$!)-Z3@0AL@oo-o!e+
4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXYX8Q/S26;LBN<'`iE740N,/NP"`DJUFC6;LBN-OgCl
$;No?+<Y-2C`k*C@;TR.@rHL-F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+C]5)+=B`U
<$s4Y14*JJCaUh_%13OO:-pQU0HahBC`k)Q%14L;+CoA++=ANc+>#Vs+>=pIDJUFC-OgCl$;No?
+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=pIDJUFC/gh)8%15is/g)hj@W$!)-SAnIF`):K%14L;
+CoA++=ANc+>#Vs0HahBC`keoHX^l/+=Ach%13OO:-pQU0HahBC`k*C@;TR'%14L<4!6UG-ULU)
9L2WR9e[\V:JXYM<)64C+@8k"9MA#V<$4M':J=_R6;0fq.3L3'+>=pIDJUFC6;LBN-OgCl$;No?
+>=pIDJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3Zp+!@W$!)-V7'4
-S.>7HX^l/-S?bU$4R>;67sB8+C]5)+=ANG$7IVj-Za-CCLo2!ATMrI-T`\sD/X3$0iV_*F>,((
-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)-RT?1%15is/g)kk@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."
@W$!)-S?bU$4R>;67sB8+C]5)+=AdODfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qCC`kep
HX^l/-S?bU$4R>;67sB8+C]5)+=D&8D.P(($7IVj-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l
+>#Vs0d'qCC`k*HD/X3$0ddD;%15is/g)kk@W$!)-Z3@0AM.J2F`):K%14L<4"#)dDeio<<+U,m
0IJ:l/NP"/+C]5)+=D5IDeio<-S.>7HX^l/-S?bU$4R>;67sB9+C]5)+=ANG$7IVj-Xq"4CiaH3
CLo1I4""KUDesK3Deio=-T`\iDKKr:Deio<-T`\iDKKr:Deio=-Rg/i3Zp1#@W$!)-RT?1%15is
/g)nl@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)+=AdODfor>-OgD2
-p045/3GU3@6,h[/NP"0+C]5)+?MB+@W$!0/gh)8%15is/g)nl@W$!)-Z3@0AL@oo-o!e2Bl8$6
D/X3$0deCm/NP"0+C]5)+=Cl@FE;;;CLo4J%13OO:-pQU1*C%DC`k*C@;TR.@rHL-F=.M)-o!e2
@W-1$F)>i2AM>J\+>#Vs1*C%DC`k*7Df9G>/3>V6@W$!)-S?bU$4R>;67sB:+C]5)+=ANG$7IVj
-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!0-OgCl$;No?+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Y-L
DJUFC/gh)8%15is/g)qm@W$!)-SAnIF`):K%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)+?M<)
@W$!0/gh)8%15is/g)qm@W$!)-Z3@0AL@oo-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJUFCF*/i>
$4R>;67sB:+C]5)+=D&8D.P>0Dfor>-OgD2-p045/3GU3@6,h[/NP"1+C]5)+=D5Q-S.>7HX^l/
-S?bU$4R>;67sB;+C]5)+=ANG$7IVj-Za-CCLo1o@:O=r0IJq0F)>i2AM?he@rcKB-T`\sD/X3$
0hl(dEc3WZ4"#)dDeio=9jqOPD_WUg+>#Vs1a$7FC`k)Q%13OO:-pQU1a$7FC`k)X-OgD2@W$!)
-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?+>b3MDJUFC/n8gBDKI68$;No?+>b3MDJUFCDIIBn-OgDX
67sB;+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>G!JDJUFC-OgCl$;No?+>=om+C]5)+=Ach%14Lm
DJUFC/gi(j/NP".+>G!JDJUFC/gh)8%15is/g)hj0d'qCC`k)X@rHL-F=.M):-pQU0H`(m@W$!)
-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*C%DC`k)Q%13OO:-pQU0H`+n
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*C%DC`k)X-OgCl$;No?+>=on+C]5)+=AdODfor>-OgDX
67sB7+>P'KDJUFCDIIBn-OgDX67sB7+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+C]5)+=ANG
$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+C]5)+=Ach%13OO:-pQU0H`.o@W$!)
-SAnIF`):K%15is/g)hj1E^.EC`k*C@;TR'%15is/g)hj1E^.EC`k*C@;TR.@rHL-F=.M):-pQU
0d&1n@W$!)-RT?1%15is/g)kk0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n@W$!)-S?bU$4R>;
67sB8+>G!JDJUFC/n8gBDKI68$;No?+>Fun+C]5)+=D&8D.P(($;No?+>Fun+C]5)+=D&8D.P>0
Dfor>-OgDX67sB8+>P'KDJUFC-OgCl$;No?+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>P'K
DJUFC/gh)8%15is/g)kk1*C%DC`k)X@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0AL@oo:-pQU0d&4o
@W$!)-Z3@0AM.J2F`):K%15is/g)kk1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?+>Fup+C]5)+=AdODfor>-OgDX67sB8+>Y-LDJUFCDIIBn
-OgDX67sB8+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>P&o+C]5)+=ANG$4R>;67sB9+>G!JDJUFC
/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)+=Ach%13OO:-pQU1*A:o@W$!)-SAnIF`):K%15is/g)nl
0d'qCC`k*C@;TR'%15is/g)nl0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1*A=p@W$!)-RT?1%15is
/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9+>P'KDJUFC/n8gB
DKI68$;No?+>P&p+C]5)+=D&8D.P(($;No?+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>Y-L
DJUFC-OgCl$;No?+>P&q+C]5)+=Ach%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC/gh)8%15is/g)nl
1E^.EC`k)X@rHL-F=.M):-pQU1*A@q@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)-Z3@0AM.J2F`):K
%15is/g)qm0d'qCC`k)Q%13OO:-pQU1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$0d'qCC`k)X
-OgCl$;No?+>Y,p+C]5)+=AdODfor>-OgDX67sB:+>G!JDJUFCDIIBn-OgDX67sB:+>G!JDJUFC
DIIBn/n8gBDKI68$;No?+>Y,q+C]5)+=ANG$4R>;67sB:+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'
+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq@W$!)-SAnIF`):K%15is/g)qm1*C%DC`k*C@;TR'%15is
/g)qm1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1E\Ir@W$!)-RT?1%15is/g)qm1E^.EC`k)X-OgD2
@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU$4R>;67sB:+>Y-LDJUFC/n8gBDKI68$;No?+>Y,r+C]5)
+=D&8D.P(($;No?+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>G!JDJUFC-OgCl$;No?+>b2q
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>G!JDJUFC/gh)8%15is/g)tn0d'qCC`k)X@rHL-F=.M)
:-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU1a"Lq@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*C%DC`k)Q
%13OO:-pQU1a"Or@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl$;No?+>b2r+C]5)
+=AdODfor>-OgDX67sB;+>P'KDJUFCDIIBn-OgDX67sB;+>P'KDJUFCDIIBn/n8gBDKI68$;No?
+>b2s+C]5)+=ANG$4R>;67sB;+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+C]5)+=Ach%13OO
:-pQU1a"Rs@W$!)-SAnIF`):K%15is/g)tn1E^.EC`k*C@;TR'%15is/g)tn1E^.EC`k*C@;TR.
@rHL-F=.M):-pQU0H`(m0HahBC`k)Q%13OO:-pQU0H`(m0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs
0H`(m0HahBC`k)X-OgCl$;No?+>=om+>=pIDJUFC/n8gBDKI68$;No?+>=om+>=pIDJUFCDIIBn
-OgDX67sB7+>Fum+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fun+C]5)+=ANG$4R>;67sB7+>Fun
+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fun+C]5)+=Ach%13OO:-pQU0H`(m0d'qCC`k)X@rHL-
F=.M):-pQU0H`(m0d'qCC`k*C@;TR'%15is/g)hj0d&1n@W$!)-Z3@0AM.J2F`):K%15is/g)hj
0d&4o@W$!)-RT?1%15is/g)hj0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&4o@W$!)-S?bU
$4R>;67sB7+>Fuo+C]5)+=AdODfor>-OgDX67sB7+>Fuo+C]5)+=D&8D.P(($;No?+>=om+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>=om+>Y-LDJUFC-OgCl$;No?+>=om+>Y-LDJUFC/gh)8-t7(1
+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8%15is/g)hj0d&7p@W$!)-SAnIF`):K%15is/g)hj0d&7p
@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`+n0HahBC`k)Q%13OO
:-pQU0H`+n0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl$;No?+>=on+>=pI
DJUFC/n8gBDKI68$;No?+>=on+>=pIDJUFCDIIBn-OgDX67sB7+>P&n+C]5)+=D&8D.P>0Dfor>
-OgDX67sB7+>P&o+C]5)+=ANG$4R>;67sB7+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&o
+C]5)+=Ach%13OO:-pQU0H`+n0d'qCC`k)X@rHL-F=.M):-pQU0H`+n0d'qCC`k*C@;TR'%15is
/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A=p@W$!)-RT?1%15is/g)hj1*A=p@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p@W$!)-S?bU$4R>;67sB7+>P&p+C]5)+=AdODfor>-OgDX
67sB7+>P&p+C]5)+=D&8D.P(($;No?+>=on+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=on+>Y-L
DJUFC-OgCl$;No?+>=on+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>Y-LDJUFC/gh)8%15is
/g)hj1*A@q@W$!)-SAnIF`):K%15is/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU0H`+n1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU0H`.o0HahBC`k)Q%13OO:-pQU0H`.o0HahBC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`.o0HahBC`k)X-OgCl$;No?+>=oo+>=pIDJUFC/n8gBDKI68$;No?+>=oo+>=pIDJUFC
DIIBn-OgDX67sB7+>Y,o+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)+=ANG$4R>;67sB7
+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,p+C]5)+=Ach%13OO:-pQU0H`.o0d'qCC`k)X
@rHL-F=.M):-pQU0H`.o0d'qCC`k*C@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0AM.J2F`):K%15is
/g)hj1E\Fq@W$!)-RT?1%15is/g)hj1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Fq@W$!)
-S?bU$4R>;67sB7+>Y,q+C]5)+=AdODfor>-OgDX67sB7+>Y,q+C]5)+=D&8D.P(($;No?+>=oo
+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo+>Y-LDJUFC/gh)8
-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC/gh)8%15is/g)hj1E\Ir@W$!)-SAnIF`):K%15is/g)hj
1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,0n\DJUFC
-OgCl$;No?+>b2q+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)+=Ach%13OO:-pQU
1a"Lq1,0n\DJUFC/n8gBDKI68$;No?+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Lq1,0n\DJUFC
DIIBn/n8gBDKI68$;No?+>b2q+>P\p@W$!)-RT?1%15is/g)tn0d&5,+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl$;No?+>b2q+>P\p@W$!)-SAnIF`):K%15is/g)tn0d&5,
+C]5)+=D&8D.P(($;No?+>b2q+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5-+C]5)+=ANG
$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC/gh)8%15is/g)tn
0d&5-+C]5)+=AdODfor>-OgDX67sB;+>Fuo1E^.EC`k*C@;TR'%15is/g)tn0d&5-+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Fuo1a$7FC`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC/gh)8-t7(1+=Ach
.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;67sB;+>Fuo1a$7FC`k)X@rHL-F=.M):-pQU1a"Lq1,L+_
DJUFCDIIBn-OgDX67sB;+>Fuo1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,U1`DJUFC-OgCl
$;No?+>b2q+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach%13OO:-pQU1a"Lq
1,U1`DJUFC/n8gBDKI68$;No?+>b2q+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq1,U1`DJUFCDIIBn
/n8gBDKI68$;No?+>b2q+>Pht@W$!)-RT?1%15is/g)tn0d&50+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?+>b2q+>Pht@W$!)-SAnIF`):K%15is/g)tn0d&50+C]5)
+=D&8D.P(($;No?+>b2q+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&51+C]5)+=ANG$4R>;
67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8%15is/g)tn0d&51
+C]5)+=AdODfor>-OgDX67sB;+>Fuo2]uRIC`k*C@;TR'%15is/g)tn0d&51+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'
+>b2q+>Po!@W$!)-S?bU$4R>;67sB;+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU1a"Lq1,pCcDJUFC
DIIBn-OgDX67sB;+>Fuo3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,0n\DJUFC-OgCl$;No?
+>b2r+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>,+C]5)+=Ach%13OO:-pQU1a"Or1,0n\
DJUFC/n8gBDKI68$;No?+>b2r+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Or1,0n\DJUFCDIIBn/n8gB
DKI68$;No?+>b2r+>P\p@W$!)-RT?1%15is/g)tn1*A>-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>P&p1*C%DC`k)X-OgCl$;No?+>b2r+>P\p@W$!)-SAnIF`):K%15is/g)tn1*A>-+C]5)+=D&8
D.P(($;No?+>b2r+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>.+C]5)+=ANG$4R>;67sB;
+>P&p1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,C%^DJUFC/gh)8%15is/g)tn1*A>.+C]5)
+=AdODfor>-OgDX67sB;+>P&p1E^.EC`k*C@;TR'%15is/g)tn1*A>.+C]5)+=D&8D.P>0Dfor>
-OgDX67sB;+>P&p1a$7FC`k)Q%13OO:-pQU1a"Or1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r
+>Pbr@W$!)-S?bU$4R>;67sB;+>P&p1a$7FC`k)X@rHL-F=.M):-pQU1a"Or1,L+_DJUFCDIIBn
-OgDX67sB;+>P&p1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,U1`DJUFC-OgCl$;No?+>b2r
+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>0+C]5)+=Ach%13OO:-pQU1a"Or1,U1`DJUFC
/n8gBDKI68$;No?+>b2r+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Or1,U1`DJUFCDIIBn/n8gBDKI68
$;No?+>b2r+>Pht@W$!)-RT?1%15is/g)tn1*A>1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p
2BZIHC`k)X-OgCl$;No?+>b2r+>Pht@W$!)-SAnIF`):K%15is/g)tn1*A>1+C]5)+=D&8D.P((
$;No?+>b2r+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>2+C]5)+=ANG$4R>;67sB;+>P&p
2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,g=bDJUFC/gh)8%15is/g)tn1*A>2+C]5)+=AdO
Dfor>-OgDX67sB;+>P&p2]uRIC`k*C@;TR'%15is/g)tn1*A>2+C]5)+=D&8D.P>0Dfor>-OgDX
67sB;+>P&p3$;[JC`k)Q%13OO:-pQU1a"Or1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Po!
@W$!)-S?bU$4R>;67sB;+>P&p3$;[JC`k)X@rHL-F=.M):-pQU1a"Or1,pCcDJUFCDIIBn-OgDX
67sB;+>P&p3$;[JC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,0n\DJUFC-OgCl$;No?+>b2s+>PYo
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G-+C]5)+=Ach%13OO:-pQU1a"Rs1,0n\DJUFC/n8gB
DKI68$;No?+>b2s+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Rs1,0n\DJUFCDIIBn/n8gBDKI68$;No?
+>b2s+>P\p@W$!)-RT?1%15is/g)tn1E\G.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q1*C%D
C`k)X-OgCl$;No?+>b2s+>P\p@W$!)-SAnIF`):K%15is/g)tn1E\G.+C]5)+=D&8D.P(($;No?
+>b2s+>P\p@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G/+C]5)+=ANG$4R>;67sB;+>Y,q1E^.E
C`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,C%^DJUFC/gh)8%15is/g)tn1E\G/+C]5)+=AdODfor>
-OgDX67sB;+>Y,q1E^.EC`k*C@;TR'%15is/g)tn1E\G/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;
+>Y,q1a$7FC`k)Q%13OO:-pQU1a"Rs1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pbr@W$!)
-S?bU$4R>;67sB;+>Y,q1a$7FC`k)X@rHL-F=.M):-pQU1a"Rs1,L+_DJUFCDIIBn-OgDX67sB;
+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC-OgCl$;No?+>b2s+>Pes@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G1+C]5)+=Ach%13OO:-pQU1a"Rs1,U1`DJUFC/n8gBDKI68
$;No?+>b2s+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Rs1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2s
+>Pht@W$!)-RT?1%15is/g)tn1E\G2+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2BZIHC`k)X
-OgCl$;No?+>b2s+>Pht@W$!)-SAnIF`):K%15is/g)tn1E\G2+C]5)+=D&8D.P(($;No?+>b2s
+>Pht@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G3+C]5)+=ANG$4R>;67sB;+>Y,q2]uRIC`k)X
-OgD2@W$!)-S?bq+>#Vs1a"Rs1,g=bDJUFC/gh)8%15is/g)tn1E\G3+C]5)+=AdODfor>-OgDX
67sB;+>Y,q2]uRIC`k*C@;TR'%15is/g)tn1E\G3+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q
3$;[JC`k)Q%13OO:-pQU1a"Rs1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Po!@W$!)-S?bU
$4R>;67sB;+>Y,q3$;[JC`k)X@rHL-F=.M):-pQU1a"Rs1,pCcDJUFCDIIBn-OgDX67sB;+>Y,q
3$;[JC`k*C@;TR.@rHL-F=.M)%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1R
:-pQ_@rH4'C/\tfCLo1R+ET1e+EV19F<DuADf'H..3NM:D.Oi.@V0b(@psInDf.0:$;No?%15is
/g+5/ASrW4BOr;/F*)G:DJ((?001OF3ZoPRE,]AsEcW?GBl5%9@3A/b+EqaEA0<!C@rH4'C+19L
Bl%Sp$;No?+E(_$F`V&$FCcS'DL!?ICi<flC`mV(D.Rc@+AZHYF`V&$FCeu*DIIBnF!)T7AS5^p
+<YlBFD)e=BOqV[:-pQUE,oN%Bm:aC-r30!<Du7]7T_)^+CT.u+<Ve<DIak4GA2/4+<Y]5DId[&
+<Y-%F(HI::-hTC5tk*G5n+/r67sC%F_56"G\(q=+<Y04DKKo;Ci!Zn+<Y-=+<W(.6:OsR6UOUJ
.4u_c+@p3ZBOu3,+<Yi9Cis<1+<YT7%15is/g)Q<6:OsR6UOUJ.3N87DImisFCcS2Df03!EZee.
A0>]"F)rI?Bkq9rGp%3I+Cf4rF(c\6@;TRs/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU
+<WBf+CT>4F_t]2+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.
D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj
5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1
ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$4R>;67sBj
BOPpi@ru:&+EV%$Ch4`0AT2[$F(K62@<?4%DBNk0+DN$CDfTB0/0JG2Chu-T+DPD,+=D>DEagC*
$>O'k4ZZe.+C.&]?SNZO0edr_/h%no+BplL2'G"<+?U)?%15is/g+\9Anc-o+EqaEA0?)1FD)e8
@V0b(@psInDf-!kDdm=$F(8X#ASl!44ZX]A+?CW!%15is/g)Pq3[m3Q+E(_$F`V&$FCcS2De!3l
+DtV)ATJ:f-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+
@;Kuo$6UI8ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l
+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#
0OI+36$$m]CLoLd3F=-C$4R>;67sC%FDl22+DG^9A8,OqBl@ltEd8*$ATAo8D/a<0@j#`5F<DrL
@V0b(@psIjD.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o+EqOABHV5&Ap&0)@<?'k+DtV)
ATJ:f0d'[C0HiJ20JO\S+?M<)@rH4'C*4mB@V0b(@psIjD.PCK%13OO:-pQUCi<flC`mY*Ap&0)
@<?'k+DtV)ATJ:fDf0!#ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.
5s[eXD/X3$3B9*,-OgCl$7I-;DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2
/1r&`DIIBnEt&Hc$?Km!Ecbl1D.PCa3Zp4$3Zp*c$7BY.@ps1p+EV:*F<G4-F<Gd=Bl[`34Y@k&
%16]cEaO!.De*c=+F,)?D_;J++<YK=@ps1p%144#G@bK/A.8kg+DDr]/g)BTDe!3lEt&I!+Enqk
/g+j;$>"*c/e&.:%13OO:-pQUCi<flC`m\5@;0U%DIIBnEt&ImDIIBnF$2Q,4"*3G4#&0,HQYBm
0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!
Df0!(Gmt*lEZfI@E,9H&+E2IF+=D5DDfTr2DJ`r=-OgCl$;No?+ED%%A0>>i@r!2qDIal#AS,Xo
AISu$+BosB+Z_;20d'[C4#)(lDf'H.+=D5DDfTr2DJ`r=-OgCl$;No?+Dbt+@;I'-BQ%p5+DtV)
ATJ:fF)GE'ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iOBQ%p5ASu?r0OI+36$$m]CLoLd
3F=-C$4R=j,BIa2D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+EMF/D.Rbt
$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.
$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn"kE,&<gDeio<0ht%f.V!C6E,&<gDeio<0d(Qi
/KcHODf'H..3NeBCh[E&@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is
/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k
+D,P4+A,Et+>>E./i5'f$;No?+>G`gF_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/DIaku
A867.FCeu*AoD]48g$)G0Jj4G:-pQU+<VdL+<VdL@;]TuDIn#7.!'6DCLo&+@<6-m/8Sa8B4WW8
FE1r6F"CgAF`V4F+EV19FD5W*+ED%+Bl.Dj$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/
DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]t
F_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE
3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0
D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b
%13OOATAo3A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56
FDi:3Df'H6ATMo%$;>AUB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AN`'s1E\_$0F\?u$=[pl+?_>"
Eb/ZqCjBi8DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to+>=63De<R*ARf:mF(of/
F*(i.A79LhF!*Uu+C]8-%13OOFD,*)@<,pfF(A]r@:s:lB45k!Df^#/DId0rA79RgCht4W/g+VA
D]gMPGmt)i$7AeA6qL0S;]nq;:K0bN+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VA
D[d$_$7A>;:I7?@;]nM26VLKJ778Ld3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr)Df02_@;TRs
6#pO7ARTCkGt;@aA5mJHH#R=B%17,c+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lPATL.XAQ!)J
Ci"Af@<,mXDcD"$AL@oo0d'[CF)>i<FDuAE+EVjM%13OOF(fK4F?MZ-1E\_$0F\@a67sBu@;TRs
+CT)&Eb/ZiGp%$CAKYJr@<*JB+Du+>+Cf(nDJ*Nk%16N,/pRm5Gs*cg+=\Kh%17DE/n#kP+F,(Z
+F+D'.1HUn$>"6#FDYu5Ddso/F`\`RF(fK4F=.M)Eap4r+=D2>+EVjM-TsM#Df'H.+=D5DDfTqI
%14g4>9J!(Dfp/@F`\aJG]XB%%13OODdmHm@rua&Aog*r+>Y-$+>=63Bjkjc?Z0CgARfgF/g,E^
:-pQUA8`T.Dfd+3Df'H6ATMo8DdmHm@ruc$$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4
%13OOA8-'q@ru(&G^*RY/g,E^:-pQUA8`T.Dfd+3Df'H6ATMo8Ci<flCh7Ys$7QDk%16Ze+EVI>
Ci<f+E-67F-Z<I/ARfh&AS-!2%17,c+Bos9Eap56G]Y;r3b*)FE,$LCDdmHm@rua&Aof=/$8EZ-
+EMC<F`_SFF<G[MF:AQd$>40n@UX(nAS-!H3\qm>+>=63B5DKq@;L!-.Ni/?AKWHFDJsV>.Ni5>
D/aN,F)to'+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(-OgE'@j"tu-ZW]>FEhmT
4ZX]qDf'H.+=Cf<Ddm-kEb/j(-OgD;+Bot0D/XQ=E-67FFEhm:$4R=O$=m^XCgh?qA927!E+O)R
3Zp7%3Zp*c$4R>;67sBkARfObEb/c(F(9--ATJu&Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,og$;No?
+D#e-Cis9"A0>K)Df$V=BOr;rDf'H6ATMp,Df-\:Ec5H!F)qct%17#sATDg*A7[nbB5DKq@;L!J
3ZrYi+AP6U-n6Z//g,(UATDg*A7ZlrCi<ckCi^$m%16Q_D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U
+=J]g4ZX]pDf6b3Df6b?Df6'l%16]cEaN]mD.Rc@+F,)?D_;J++<VdL@W-0-.NiV;D.RcqBl7Hm
GT\,(67sBpD/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT_$6UH6+=DAE+D58-+CfG7DI[?k
A0>f5F<GL6+D#e3F*(u2@q@#14Y@jp@;TRs+=\LO@;TRs%16ZaA1e;u%16ceD]gMPGmt*0%13OO
ATAo8D/a<0@j#`5F<DrAARfObEb/d&@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7ARfOb
Eb/d&@rH<tF!hD(0d'[CF)>i<FDuAE+EVjM%13OOD/"6+A927!E+O)R3Zp4$3Zp*c$4R>;67sBs
De!3l+DGm>@<6L(B5V9k+Dbt+@;I&pDIal&Ci<ckC^g_H67sC)BOu'(@;^?5D/"6+A0>r'DfB9/
+CT;%+Co&*ARfgnA0>f.Cj?Hs:-pQUGA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=Ddmc:+ED%4
DfTr@%15is/g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEt&Hc$>aWj@;J(Z+F+D'Ci<flCcsg%
1*A%hCi<flC^g_#%13OOATAo8D/a<0@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044
+Cf>,E,$LCD/"6+A927!E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A
+?CW!%13OO:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?
+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0
+DGm>FD,5.F(&ZlF*&OHBPD?s+EVNEA8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5
DIal1AT2R.FE8R7Df000F(Jl)A7]7e@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+
@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ce
D`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<t
F!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!hD(%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$$m]CLoLd3F?9:ART[lFCfN8A8,OqBl@ltEbT*+:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9
/M/)TEb/[$ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+&7DBL?<ATMs6
Dg?G9F*(r,@ruF'DIIR"ATK:CFCfN8+E2@8DfQtBD]j(CDJj0+B.aW#:-pQU+:SZQ67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;An>F+1^sde67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80l:?E
0f'qhDe*QoBk:ftFDi:BF`&=GBln#2DIn#7-u!F7A18X8DKKH1Amo1\+Dbt+@;KKa$;No?+>GTg
Dg!lj+=M8IEc5l<.3N&0A7]9o/KeJ4C3=T>ARlp*D]j(CDBNk8+C]82BHVM5DId[0+=84IBl8'<
%15is/g)l-C3=DL0HbIKF*&O8Bk)7!Df0!(Bk;?.@WGmpA7]9o/KenKEb-A%A7T7^%15is/g)l.
D..]F0d(1JF*2M7+FZpY6rZTR<$5^cEb/a&DfU+GAU%p1FE7lu:-pQU0fX#YGr%,s@:Wmk.!0E?
GUXbWATMr9A8,OqBl@ltEd8dF@;TQuE,oN%Bm:'o%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL
+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>;
67sC&ATMs)EZfLHBl%i5Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aCghC++EVI>Ci<fj5s[eY
Eaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8
-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&
-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?U6!GWe)1-Zip@FD>`)-OgCl$;No?+AQisANCrUBOr<8
8l%iS78m/.Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#
E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<Df9_,$;No?+A,Et<(0_b
;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P$4R=s+Bot*@;BFbBl[Qh
C2[Wi+?W7l6rZTR<)QLf<"00D$;No?+CSeqF`VXIF)59+BHUo*EZf14DKU1WD.-o`$;+)^<(0_b
;GU(f4ZX^-F)59+BJNq'C2[Wi+A,Et<(0_b;GU(f%13OO:-pQU@rc-hFCcS+D/aTB+EV19F<G+.
@ruF'DIIR"ATJtG+EM+9FD5W*+@K!m<D>nW<(';F<"01067sC&D]g_VE,oN2ATDs*F!,R<AKZ)/
D.Oi2FCB$*+C]A"DIb@/$=n$;3co=QGUt3r0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@Hqa
EZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL
+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,+-OgDoEZf72G@Vh,
DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj
:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&
E+X>G-SR;'%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&
-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL
:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0Jb'c$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r1a`_>ATAo2ATqZ-A8XJ$
:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@
A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:
/13,/-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o
-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM
8OHH)4"qcd$4R>QDEU%&E+X>G-SRG+%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\
F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#
+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0K1?g$>"6#DIn$&+Co@O8l%iS
78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@
>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r
3%#.BATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl
/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF
-Ta")%13OOA8XOkFDti:/13,3-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`S
FE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+
A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[;&%16Ze+Dtb7A0>E#4%`::<(0_b
;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,
A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0ek$b
$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m
/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]
+:SYe$=n$;3co=QGUt3s1+*M<ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13/.-OgDoEZf72G@Vh,DECHd6rZTR<)QLf
<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$
D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[G*%16Ze
+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc
6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3
%16W`4Z[\(Ap>jS0f:<f$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$;No?+E):2ATAo3Aftr!B5VF*F_#&+A8,OqBl@ltEbT*+%16W`
4Z[\(Ap>jS0eb:/%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$g
De*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ
6WHiL:/jVQ6W>Ep0H^f3%15is/g,7[D]it=A7]e&+E(j7D..'pBlnK.AKYMt@ruF'DIIR"ATJ:f
A8XOkFDti:/13/+0JFj`$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=m^a6=FqL@k]Sk
:-pQ_A7]RD@<6-m0JG4(F=f'e@UX=l@j#r'Ch[E&-tHn*.3N_DF*)IU%15is/g(T1:-pQU@<6L4
D.RcL%15is/e&._67sB'+>G;f@3AH:5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.4u&:
:-pQB$;No?+A,Et+CehrCi^_@D]j+4FEMOFFCfN8+D#G6Bl\-0D.RU,+>"^EF)uJ@ATJtd:IJ,W
<Dl1Q+:SZQ67sBhA7TUr+DG_7FCB!%ARlolDIak^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.
-u*[2A7]p;C2[W9F`_>6F"%P*:-pQB$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-Y
A0<6I%15is/g)8ZD/=89-YdR1FCfN8ATB.-$;No?+<VeCDdd0!-YdR1FCfN8ATB.@+:SZQ67sB'
+>G!ZFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4A+AP6U+CfG'@<?''FCfN8+Co1rFD5Z2@<-'n
Et&IO67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D
:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M.D=:-pQU0K3lfFtbWn@rH7.ATDm(A0>u4+DNee0JXb&+ED%2@;TRd%15is/g)l'D..]E
1E^gZA79RkA0>K&EZdt502-(tFa,$PATDj+Df-\9Afs]A6k'Ju67sB80l:?E1,'h!C2[X)ATMs)
E[`,OAT;j,Eb-V/%15is/g)l'DJs\R1E^1@@;]^hA0>u4+E_a:+EV13E,Tc*Ed8dDDe!3lAISuA
67sB83,N)L1,L+rE+*j"A0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8
De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]55s[eG@<6-m3B9)I+Bosu
De3rtF(HIV-UC$a@UX=l@lZP0-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrD
Df9/64"!Wr6miEN%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq%13OO:-pQUBl8!'
Ec`F4+EqaEA0>;uA0>DoCh7^"+DGp,$>EpcGAhM44ZX]A+?CW!%16N,/g)nl.j0*H$=P&,+>S0N
$7QDk%16odF`VXf3Zodm-RL*"+?CoV+FGdc?SR!PBeCSa-87\5>p*]2+Bp9D%13OOATAo8D/a<0
@j#`5F<DrF@;U4,Eb$O?+<XEG/g+kGFDi:4Bk)7!Df0!(Gmt*lEZen1C`k*>@;U4,Eb$O?+<XEG
/g+kL+DGp?Bl5&8BOr;sBk)7!Df0!(Gmt)i$>"6#A7]R"-Y["+GAhM4-QjNS:-pQUA7]RgFCcS=
DfT@t$>sEq+EVI>Ci<f+B4Z0--Y["+GAhM4-QjO,67sC)DfTA2BlbD-ASbq"ARlon@;]t$F<G4-
F:AQd$;No?+DG_7ATDl80eb:(GAhM4F!,17FDi:4Bk)7!Df0!(Gp$O5A0>DoCh7^"+EV:.D%-h#
GAhM4H#R\?F$2Q,4<cL&-[0KLA9i-4D^QYY+u(2_Che*6F<Dbg+=o,fBeCM_0JFpu4ZX]?0JFUo
+?Uc(+Z_J'4==iOD0Ko=A1%fnATAo8D/a<0@j#`5F<GdGEb'H7Df9\+$>"6#A7]R"GAhM4H#R\?
Et&Hc$;No?+EqO9C`mV6F<G%(+CS_qAKZ)5+D58-+CT/5+Co&"ATVKo+EqaEA9/1eDImi2FDYu5
Ddso&ATT%C0ebg:GAhM4H#R\?F")H[DfTB6E,TZ9%13OO:-pQUA7]RgFCcS'Cht57AS,LoASu!h
F!+n/A0>AqARfKuFD,62+CT;%+D5V1AISuXEZd(k+Co&"+EqaEA9i-4DfZ?pDImi2F`fi.+E_a:
F!,[FEb'H7Df9\+$4R>;67sC$AS5RlATD4$AKZ#)An?!oDI[7!%14g4>9GUBB5DKqF!a'nGAhM4
H#R\?Et&Hc$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p
$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,
%16WWF*)G@H$!V=FC])qFD5Z2@<-'nF&#%S.V*+3FE2;FFCfN8A8,OqBl@ltEbT*++ET1e+Co&)
FE2;FF!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?<%15is/e&._67sBhF)uJ@ATKmT-u*[2FCfN8ATB4B
BlbD*+Dbt)A0>r'EbTK7%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp130emNRGqh)a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lj+=M8IEc5l<.3N&0A7]9o/KeqLG9CpK
DK?q=DBN"pDId[0F!+n/A0=Q[DKU15$;No?+>GfiF`&rg+C\c#Bk&8qDf00$B-;;-F*&O5A7T7^
%15is/g)l.D..]G0H_ccE+X>D+EV19F<G+.@ruF'DIIR2+E2@4AncK4@:Wn[A.8kT$=e!aF`MM6
DKI!K@UX=h-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V
@<?0*-[nZ`6rZTR<$r+^%15is/g,7IF*&OIFD5Q4+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&
3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o
+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1
/I`$r$?U6!GWe)1-Zip@FD>`)-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,OqBl@lt
EbT*+%15:G/g*PR6W?uI3Zp7%De't<-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-+EM47
GApu3F!*kB6W?uI3Zoht/g<"m6qKaF;^ih6INU-n0-W+n-nIE$E+X>D+@Rn*5'nn+0d&kU6W?tn
$8EZ-+>Y-\AS5O#4s36b6W?tn$4R>;67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!
Df0!(Bk;>p$;No?+AQisANCrUBOr<8C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-
Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mE
ATW-7Ebce<Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?t
A9;C(F>5-P$4R=s+Bot/D/sQ5F<F1O6rZTR<)QLf<"00D$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5
?O[?QBk1.ZDeio<0MXqe.V*7(;f-GgAM>e\F=f'e-tI%&.3N\KDeio,FCfN8/e&._67r]S:-pQU
@<6L4D.RcL+:SZQ67r]S:-pQU+<WBf+EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$
F*(u6.3NeFEaj)4@<Q'nCggdhAISuA67sB'+>YGh;FNl>=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+
3XlEk67sB'+<VdL.!0$AFD>`)0JG%#FCfN8C2[W:0e=GhATMs.De(RV/0K%GF*)/8A2,bl.3K',
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>>`bARdGT+Cf>-G%G]9ARlp*D]idQ/hf%'8l%ha$;No?+>GTgDg!ip+E_X6@<?'k
+D,P4+A+RG9PJBeGRY!T67sB82/78M0KC7rAStpnARlo3A8,RQD/X3$0JFpuAo_g,+=Lc7A3s^G
Bk&hN0e"4S$;No?+<VdL+<VdL+EDUB+DG^9C3=E0+Dbt+@;KKa$;No?+>Gim@<jUa+E_X6@<?'k
+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G0
3Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp
+=D8BF*)/8A2#\b%13OO:-pQUFD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'
+DGJ+DfTE1+DGpFF!+n3B6A'&DKKqP%16Ze+E(d5FC])qF:ARgEZen,A0<Q8$4R>;67sBuF_tT!
EZf:4+Co1rFD5Z2@<-'nF!,C=+E1b2BHV/7F*&OA@<?!m%14g44WkslI4cXQBk/>?%13OOATAo3
A0<rp-Zip@FD>`)0JO\lATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63%16Ze
+E]h.+>=pKBk/>?%14s84Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#1E^UH
+?MW+A8,Oq/12Q^ATMs.De(RV0II;:ATAo94ZX]rBk/?8+>=631E\h',9S]`E+rft+E\,#%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<2F)Y&pDeioaDJ<U!A7[GK:-pQ_A8-+(;f-GgAQ<V^@rGmh
0JFVk/M/(nA8-+(.3N/8F)Yr(Gp%$;+E_R9@rGmh/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._
67sB'+>G;f@3AH:5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:0I\,QG%#*$@:F%a%15is
/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130K3TT@PBYK$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`bARdGM+>"]aFCfN8
E+*g/.3NYBE,8rmATJtBF)>i<FDuAE.1HVZ67sB80l:?E1,'h&+=M;EDg-//F)rcQEb03+@:Nki
+=M>CF*)A0F)rc>$;No?+>Gim@<jX`+>"^YE+EC!ARloqDfQsm+?1u-2[p*'$4R>;67s`V;Gp:g
4['u:A8-+(.3N/>ATJu3Dfd+@Ec5o.Ebp"DA8-+(CghT3F`(o'De*E%A79RgFEqh:Et&IO67sB;
+@0se+>PW)2'=V03\rQQ1bfFH%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-
$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;
5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>bA3DsrFZLWmFD,B0
+DGm>F`(o'De*E,%144#+:SZ*F`(o'De*E,+>#VsA79RgFEqh:+E_3;+AP6U+Cno&@<?d6AKY])
+EMX5DId0rA0=JeE,ol/Bl%>i$4R=s+BosE+E(d5-RT?1%16Ze+E(d5FC])qF<D]$67sBQ:IH=I
ATMr9A8,OqBl@ltEd8c:$4R>REZfI@E,9H&+E2IF+=D;B-QjO,67sC%FDl22+DG^9FCfN8+Co1r
FD5Z2@<-W&$4R>REaa$#+=D;B-QjNS+<VdL+<Vd9$4R>REZfI@E,9H&+D58-+=D;B-OgCl$7Bt6
Bk)'lALATP3ZqsAFCB9:E+L/7A0<!i67sBtF`VXID..NrBFP:X$7L$X+=D8EBlbD2F!,UCBk)'l
ALAoL/NP"sA0=W6/g,"RF*&OA@<?!m%13OO:-pQU.!''?GApu3F"&5BAS,XoARlotDBL?BDe*s$
F*(u6.3K',0d'[CF(fK9E+*g/+Co2-E$-NNA1&KB+<XEG/g,"RF*&O8Ble60@<iu>Bln$,F`\a;
EcQ)=%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&%15is/h0=^=?Shj@rHC.ARfgnA0>T(
+DbJ.ATAo:ATDj+Df0V=De:+a+:SYe$=n$j;f-GgAM>f567s`uDJW6gDeio<0HbHh/KcHPDJUaE
F)>i2AKZ)+F*)IU%15is/e&._67sBJBOt[hF!)T6Cht4:FD,5.G%#3$A0<"'EbBN3ASuT4+Cei$
ATJt:De:+7-tI43.4u_c:3CDbEc6)A%15is/g)?UARTUqGp$U8EcP`$F<ViADK]H)Bk/>r@<6"$
+CT;%+CT)-D]j.5F*(u(/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)
0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k
3Zp130f<]gCbd[R$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]
FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEo
ATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3
A0>u)Bk)5o$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-pp
DfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl
$;No?+E).6Gp%'KF<G+.@ruF'DIIR2+DGm>Df-\>BOr<*@<?/l$8N_e+<tE2A0<Q8$4R>;67sBk
Bk)7!Df0!(Gp$gB+D#D/FEn<&0H`M$,<d5)+F>4b+CoA++=ANG$8<Sc+<s&m0d(fc0d("EC`k)Q
%14d34Wkt5+>G!c+>P'MDJUFC-OgD:+?^hl4s2R&HQY*eA8Z3+-RT?10H`M$,<d5)+F>4f+CoA+
+=ANG$4R>;67sBpDKBB0F<GXCD.Oi5ATD7$%178r@;TRs4ZX]5@Wuj'0HahKEb$mI@Wuj'1*C%M
Eb$sR%16QgEb$je3ZpQp$=\4"A2-5.+>"$0@Wuj'1-IZ@1E\_$-[6a`+F,=D$=\4"A2?A0+>GYp
3Zoep+>"]k+=\LZ-OgDH0RInYE,9H&+E2IF+?MW-DIIBnEt&Hc$;No?+DG_7ATDl8F)Po,+Du+?
DK?6oDJim"ATL!q+=D&NEb$jHDKg,30d(@XEb$pJDKg,31E^RZEb%!S%14LF3c8hDD.Rc;4ZX]6
-Zs'<Gp$U8G@GK9F!iCu-tt:V1*AA%4")g;5;=i@4"*'K+=/-p2'=Y"2`E0I4EW\4F`(o'De*E%
D.Oi!Ec3<7$9g.jFDYu5Ddso/F`\`f3c8hDD.Rbt$4R=O$7KG&C`k)Q.3L3'+>G!#+=K<4G&C`*
ATK:C/0I#8DJim"ATJ:f-nlcSDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$4R=j
0H`(mA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+E2@4
AncK!$7ISN1*C+FC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<L
Eb$;,DJ!U-%14L;+>Y-NDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/
FEo!QDfTA2F*2),Bm:'o%14L;+>G!LDJUFC@Wui?.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL+AP6U
+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC1aa^p/NP"/+?L]-3[\fhEb%!S+<VdL+<VdL+AP6U+EqaE
A0>T(AncK!$7ISN1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mIDKg,30de(d:-pQUGAhM4+EM[;
AncK!$4R>[ATAnI+>=pKDJUFC-Ql/N/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1pA8Z3+-RT?1
DImi20H`%l0HanDC`k)Q%13OO-nlbu+>=pKDJUFC-Rg/i3Zp."4!6UGDJim"ATJt:+<VdL+AP6U
+D#D/FEo!QDfTA2E,oN%Bm:aKDJsZ8F"%P*-nlbu+>=pKDJUFCDKg,31aa^p/NP"/+?L]-3[\fh
Eb%!S+AP6U+EqaEA0>i3AS,Y$+=M,GF`)7L%14L;+>P&n+CoA++=D2?1FFUo/NP"/+?L]-3[\fh
Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DPDfor=.1HV40H`.o0HanDC`k*90deCm/NP"/+?L]-3[\fh
Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4-uNsGDK@69$4R>[ATAnI+>b2p+CoA++=D2?-QjO,67sC#
F^]*#Anbgs+D#S6DfTn.$>sEq+>=op+>Y-NDJUFCEb$O?+:SZqATAnI+>=oo+CoA++=D&F-OgE#
ATAnI+>=om+CoA++=DARDf028%16uaEZd%Y0H`+nA8Z3+-XgXrBl5:-$6Tcb-nlbu+>Y-NDJUFC
-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKG%G]'F"%P*-nlbu
+>Y-NDJUFC@Wuj'1FFUo/NP"/+?L]-3[\B\Eb$sR+AP6U+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;
+>P&q+CoA++=D2?1FFUo/NP"/+?L]-3[\B\Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DXATD7$.1HV4
0H`.o1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4.!B0B@WNt-
$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWDJW6gDeioY@:O=r<+U;rF&#%S.V*F5;f-GgAPHTC
Ec4ogG]\!L+ET1e+<Y0-ARfLs+<Yc>@<<W#Cht52@:O=r+EV1>FE8R7@;[21@V#mA67sC%@<Q3m
+CT.u+EM+*DBND6+=Lc<CagtD:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3MMW5t"dP8Q8,$
E-67FA8,OqBl@ltEd8cUFCfN8C2[W:0I[?(67sB'+>PAg-u*[2FCfN8ATB4BG%G]'F!+n7@;0Od
@VfT_:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(C9F(K;E0a^ZB
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+$;No?+>>`bARdGT+Cf>-G%G]9ARlp*D]idQ/hf%'8l%h^:-pQU0emQaFttirF`:l"FCeu*
AoD]48iJCsBl8'<$;No?+>Gim@<jX`+E_X6@<?'k+D,P4+A*b9/hf3k$=e!aF`MM6DKI!K@UX=h
-OL27+?^hq1a+n6.3L`#8l%iB9LV6F:J5&/C2[Wi-OMRN/NP!u/gj7e6pjX:5uLKO?YO7nA7$\k
@r,^bEZc_W$4:fbEHPu9AKW@8De*s$F*(u6-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;
:-pQU/ULGc;cFl<<'aD]I4Yd5FDti:4Y@j)FCfN8C2[W1$4:?b+E(d5FDti:/13,*-OL2U67sBk
ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ7?+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$$49Np/g,4WDfTD3G%#E*Dfp+D
D.-ppD]j.5G]Y'MH#R>9/g)93DffP58l%htA8c%#$;No?+BCd%8OPjD73G;j6W-]&<(0ng;_B18
8Q6g28PN#T=WgXB:JsV[+B1m#+B1d3<!lAe/g*GY+@94178k=18Q85'5u&Og;c?IZ8O6<E6m,H3
:dlKo:IIVo7Sco)76sjT+AtX-;Fs;X5tim<:-pQU8TZ(hF!,UE+EVNEFD,5.8l%htF`V,704SF,
Ch7W0FDi:F@;KXg@<?''FCf]=/db??/g*GrC`mh2G]Y'MH#R>9+CT;%+D#V8ASuU(@;Kb*+D#P8
Bm*p$ASuT4FDi:2H$!V=/d_qsEZd1]E-67F@5'hs-Yd^4EbTK7-Ta(<4!uX5/g+mOF(96)E-*4E
AU&;>/hSb($>"6#1a$a[F<G!H4YA*u@<?(*-Ta(=4!uX5/g+t=FCf\>FCf]=+>,9!-OOF*+>b3[
F`\a71-I6;BQS*--Ta(>4!uX5/g+hLD/:>:AU&;>/hSb($>"6#1a$a[F<G!J4YA+,D/:R]1,M'?
/hSb!G\q7>FCf]=+>,9!-OOF*+>b3[F`\a71d*H=FCf]=-Ta(@4!uX5/g,+L@;0U%Derr,FCf]=
+>,9!-OOF*+>b3[F`\a72*EQ>@X3',-Ta(A4!uX5/g+SC@VKq)@<-W9Ch[s4+E(j7@X3',F!*(f
/gh!;EZd1]E-67F@5^8$-Z*:4CLh@-DC7M$2`iB0/hSb!D..I#A8c[0+EV1>F<E1g/gh!;EZd1]
E-67F@5g>%+=D;RAiM/"1,q?C+>,9!+E_d<3$;[UFCfM9/hSb($48194""ca@rc:&F=/L[/NP"2
+>Fuo0d("EC`k*?F(96)E-*H7-o!e2CghEsGUFp_/NP"2+>Fuo1*C+FC`k*A@<?(*-OM7V4""]`
D/:RK+>#Vs1a"Lq1,C%`DJUFCBQS*--OM7V4"#8iCaUYS/NP"2+>Fuo1a$=HC`k*MD/:R,-o!e2
FCf]=-Rg/i3Zp7%0d&5/+CoA++=D8BG]Y;?-o!e2@X3',-Rg/i3Zp7%0d&50+CoA++=CWDFCcg,
-o!e2D..I#A8c[0-Rg/i3Zp7%0d&51+CoA++=D#7Ebf3(GA\c8-o!e2F`_4T-Rg/i3Zp7%0d&52
+CoA++=D;RAiM.F$8EZ-A79RC/g+RV/7C7a@59BB1Furk/7CCe@5]Yt@5eN#:-pQUA8`T4AU&<<
+DkP/@q\(6A79R&/NP"<HTE9++D58-+F>^b0d("8F:&@dEZd.\De't<-OO@"ARTU%-RT6.:-pQU
/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FD?0F(KG[@<6-m0JQ<h/h1CNF(KG[@<6-m0JO\l
/M/)S@<6-m+=Lc>F(KGB+E1b0@;TRtATAo7ATTS8BOPdkAKZ)+F*)IU%15is/e&._67sBhF)uJ@
ATKmA$;No?%15is/g)8Z0e"5eATMr9A8,OqBl@ltEd8cUFCfN8C2[W:0I\,UG\M5@F"Rn/:-pQB
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f!WbFtt`\$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+>Gim@<jU_+Au!2<(9YW6q'urFCfN8F!+n%A7]9\$;No?+>Gio@rsF]+EV19F<GI>DIn'3
@;^.#Df-\9AfsuI:K0eZ9LM<I+CSekARl5W%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1
FCfN8ATB.-$4R>;67sC)DfTV9Bl5&'Ch7$q+C\c#AKYo3+EVX4F(c\4De!3lAISuVCh7$q+=ANG
$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;
5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>REZd+[De'u4A8,Oq
+<VdL+<VdL+<XEG/g,(OASrVg76s=;:/"e"$>sEq+CoG4ATT%B5uU-B8N8RT4#%j#:-pQU@ps7m
Dfd+3BOPdkAKYr#Ea`frFCfJ%$4R>;67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(.6'ATAo3A0>u)
Bk)6->9G^EDe't<-OgDoEZen3F(KG9-W3B!6s!8X<(//D$>"6#A8lU$F<Dqs;aX,J3&N'F0b"J$
EZen3F(KG9-W3B45tOg;7n"de0b"I!$;No?+DkP&AKZ#)@:UL!DJXS@/KeP:@;]^h+EqO9C`m=u
Bl"4cATAo(E-#T4+=C&U5t"LD9N`_P$>sEq+CoG4ATT%B5uU-B8N8RT4#%0O%15is/g,1GDfB9*
+>"^HBk)7!Df0!(Gp$gB+AtWo6r-QO=Ub^LEZf:2+EV..@rrht+>Y-YA0<6I%16uaEZen3F(KG9
-UCZu8P(m!-Ta!k$4R>;67sBpDKBr@AKZ)+F*&O;Ec6)>+D#e3F*)I4$>"6#A8lU$F<Dr/76s=C
;FshV-OgD;+BosD+Co&"+=D8BF*)&8Dfp"H%13OO:-pQUEb0*+G%De)DL!@HATMr9B6%p5E$/b5
Df$V<ATMp,Df-\>@:F%a+:S["B6%p5E%jF9+=D8BF*)&8Dfp"Z3B:hsDJLU/$;bkSCh[BdC0s+b
+Ad2iCh[BdC0r).INU%$FD#W4F`9#`+FZ?o0Hb]d0d';8@Vfag?YWpW$4R>;67sC'F(oN)+EqaE
A9/l-DBNb6@:Wq[+DPh*+Cf4rF)qctATAn@@;9^kA8bp)+E2IF+Du"&@;9^kA8bpa+=ANG$>"6#
B6%r6FD#W4F`9#rDJWZgC2[WnDdm&r-RT?1%15is/g,1GCghF"G%De:Df9`=+C\npBl5&;Bln#2
-[mEP$>"6#A8lU$F<Dr/:JXqZ:J=/F;C=OR6:"";:JXq;%13OO:-pQU@<?U&D/aS>FDi:=@;BEs
B6%p5E$0@=Cht5+@;0O#@V'%XF`V+:De:,$@:UL$Df9_,$>sEq+Dkq9+EV7:Dfp"Q%13OO:-pQU
Eb0<'F<G[D+Eh10Bk/?,Df9_?@;]TuEb0)rCLnV?+DG_7F`M%9FCB3&ATT&,DerrqEZeq<BleB;
%14g4>9IckCLq$jEaN6iDe*2t4DJhDFD)dEIS*C(<(0_b06CcHFC]?3ATT:/$>"6#A8lU$F<Dr/
:JXqZ:J=/F;C=ORIS*C(<(0_b06CcHFC]?3ATT:/$>"6#D/=89FD#W4F`9#D$4R>;67sC'DIn'3
@;]UeA0>i"FD)e2F!+n%A7]9oFDi:C@rc:&FE8R6Gp"MPCi_$7$?L'&F`_SFF<GWI,CUaX@Qcap
0Hb]d0d%kq3co"TDfp"Q.3M&3+EK\,+EM%5BlJ08-[$jH$7d_^@LWYR$;No?+Cf(r@r!30DIn'3
@;]UeA0>i"FD)e9Eb/isGRY!6+F>4YIS*C(<(0_b06CcHFC]?3ATT:B74o]E-p/nL/g+UP4#&0,
HQZ.-@Vfag?YWpW$4R>;67sBjCh7$m+E_WGFCfN8+D5_5F`7cs:j$5`Bk(Lb?TgFm:j$5`Bk(Lb
?Q^SB+=K?oB6%p5E%i^`IQAT*+F>:e+Ad2iCh[BdC0qDW%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo
3F??.;f-GgAM>f567sa!A5d>`CLo1R+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJX
F)tV<FCf]=.3KaT@:F%a%15is/g+_9Bln',B.aW#:-pQB$;No?+=Lf3.3N_DF*)IGEb065Bl[c-
D/XH++E_a:EZf(6FCfK9ASuU(Df-\>BOPd$D..=-+E)@8ATAnc:IGX!:-pQUFCfN8F"SRX6$".k
FD,5.+EV19FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeLF(KA7+EqO;A8c[5+<W(NEX`@N67sBoH#R>8
Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&$;No?%15is/g+SD
F*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8
E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdkATKmT/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L
1,C%qE+EC!ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBpDKBB0
F<DuMG%G]<EbTW,.3NhQEb'56De:,8@<-(#F`S[IH#R>9%16Q_Derm$Gs+220F\A$Ci<a(D.Pjk
+>Gl8+=/-p+>Y,q+>P&b+?)4g$;"o>G%F$S@<,ddFCfJU3Zoe`Dg*=@F^o)-GAhD1+EqaHCh+Ys
+EqaBA0>AqF^o20@q^!pCF9PuA8cU"Ch7R%F`V\CB5_^!4ZX]93Zp[1.ln+H@;TspEb'*14ZX]4
/e&/3DIIBnF$2Q,4$"`uDf9H$Dg<I;Ci<a(D.Oh]BOQ'q6YKnK@:OCjEZen2F^f/uE,9Z<F`(i1
De'u!D/a',A8cQ;%159QHZX+DCi<f+E-67FGA^i+ATJ:f4tq>*0KhH>0H`)(+D58-+Eq^3D.Rbt
$4R>;67sBlA8--.GAhM4+=M,9D.P8.CghC+/9GHJF=A>S@:F%a%14g4>9J!#Dg-//F)rHO@q]F`
CER2!Bln96+>Fuj+=A^%0RJ"]@;TRs+Bot"A0<rgHZUqN$4R>;67sBpDKBB0F<G[:F*)IG@;]Tu
@;]TuD.-ppDfZ?p4tq=<+E2IF+=D8BF*(i,E+iZ60IJq0:-pQUBl7g,@rHL2+EV1>F=.M)4tq=<
+E2IF+=D8BF*(i,E+iZ60df%1:-pQUBl7g,@rHL2+EV1>F=.M)4tq=<+E2IF+=D8BF*(i,E+iZ6
1+,.2:-pQUBl7g,@rHL2+EV1>F=.M)4tq=?+E2IF+=D#7@rcKrCiF&r0JFk91,1j<0d%th0ddD;
4tq=?+E2IF+=D#7@rcKrCiF&r0JOq:1,1j<0d%th0ddD;%159QHZUu*3Zp."B4Z0-FDbN(ATL!q
+FPjb0d("EC`k*IATMs%CiF&r0II;:%15is/g+_9BlkJ>ATMrADIIBn/9GHJF=A>S@:F%a%14g4
>9J!#Dg-//F)rHO@q]F`CER2!Bln96+>P&k+=A^%0RInZ@;TRs+Bot"A0<rgHZUtO$4R>+0RIms
4ZX]B+D58-+Dl")D.RcO3Zri'+>b3ODJUFCD.-ppDddI$BONSB%13OO:-pQUARoLs+DkOsEc3'K
DIIBn/7WU/ALqq7G]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd.\/KcDl4"u"u
DIIBnF!+[0ARloF0me!t%13OO%16Ze+>Y-YA0>u)Bk)5o$4R>;67sB4HW3F4<$5+>6UO:@;asb\
I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE
3B:GZATUjmEb0<50JH6g/h1LFFAm:%ATMoH0HbHh/Ke\;F<G!7G%G]>+DbJ,B4W3'F_tT!EZf:4
+EqaEA90@4$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MW
ATMs.De(RV0JFpuAU%p1FE9&D$;No?+<Vd9$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hg0JPP*@rsF^%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4
ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0eb:8
-OgCl$>"6#De'u4A8,Oq+:SYe$;No?+B3#gF!,R9F*&OFAT;j,Eb0;7@;[2r@WQ[4A8HN6BPD*m
+EqaEA0>B#F`):R%14gD0JG17+?UbkA8Z3+-RU$@+EM47GApu3F!,"-A0?=D0F\?u$>"6#-UC$a
Ecki#BldrJ3B8H0B4Z0-I4cXQDJUFC-OgCl$8F4g0JG1'4<PkdCgTIo6#q*W@VKms3B9*,+DEGN
1^sd$$=e!cEaa$#+?V#;5s]O6@Ua%mBK8(5-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16Ze
AT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?Y=1n
@WOkEF(o,<0JQ<h/h1LMDdmcS@<6-m0JG4(F=f'e+C\c#Bk&86B5DKqF"&5RATMs7/e&._67r]S
:-pQU<+U,mF!+m6AmoCiF`M%9Bl5&:@;KXg+DtV)AKYQ/FE1f"FD5Z2+Co2-@rHO%Eb/c(GA(Q*
%15is/g+tK@:X(iB-;86D.Oi.AfsEY@N\!KEc,GuCO%:K+A*bdDe*E%Bl8$2+A+7/+:SZQ67r]S
:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFttirF`:l"FCeu*AoD]4
8iJCsBl8'<%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&
ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$4R>PDe!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;
5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&
%15is/g)`m<(0_b+B)6*;H/&r%13OO%15is/g+YEART[l+CQC9ATD6&GA2/4+Du*?B5DKq@;I'0
@<-'j@VfTuEb/ioEb0,uATKI5$;No?+CT)&+EV:.+CT>4BkM<pA0>buD.Rc2@<,p%G%#E*Dfp+D
8g%V^DKBo.DKKqB%15is/g,%MDIjr3BQ&$0A0><"E+NHu+CT=6DIIBnF!,[?ASrV=B5DKqF"&5G
F!+n1E,96"A1e;uFCfN8@rH7+FCB'/F$2Q,1E\_$0F\@t4Y@ja0krEP$=Z.N+C@'P2[p+(4Y@j4
1NG>^$=l:P+C?j72[p++4Y@ja0k)jr%16Z0/g)o*GRY!l4Y@j6E&\:6.1HUn$;No?+EM47F_kS2
@V$ZnD/aTB+D5M/@UX'qCh[s4+>"^VAS,Lo+EVNEDIIBn+DG^9FCf<.+Dbt+@;KKa$8=Uf5'o=5
B5DKqF!)iPATMs'Df0W<@;^1.?RICHD/a<0@k9!7-OgCl$>"6dF(HIAFCfN8@rH7+FCB'/F!hD(
%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F<4&B5DKqF&QpoCLoeQF(o9)0JG1U67sa#Ci<d(;f-Gg
AO1BYBkM<;0JFUl+ET1e+<Ve@DIdI%ARfg)+CT>4BkM=#ASuT4+E(j7+<Y<5Ddm-k%15is/g,:S
EHQ2AARlp$@;TQuCh[s4+Du+?DK@E>$;No?%15is/g*T'Ec5t@A8-*pDg#]4ARlooF`M26B-;><
AKYo'+A,Et+E)-?0KC7O@rrhK0JPF-0etdI1cdHJ%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EX`@N67sBjEb/[$ARmhE1,(F?De!lC3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB82f2uK0esk`Bl7?qCj@.8
Bm:bBBPDN1DKTZ7@;]Rd%15is/g)l-D..]E2'?=<A0>f6ATDg*A7Zm*@:p]2?90Mu3XlEk67sB8
3,N)L1,C%_BOPdkAKYo7ATDg*A7Zm*@:p^)D]gGj3[m3Q+>"^WAS!!%Dfoq?9hAGU6r-iP;@NsB
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=5uL[1
/I`$r$;No?+Du*?D/"6+A0><%F(o9)D.RU,Et&InBm=3"8T&'QEb/a&6$%*]B5UL\0KhHR+?CW!
%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@r$?Q/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=
+>=of+C,E`@6H4c3"64(4ZX]D2DuZe$7QDk%15is/g,%M+Dkh;ARlolF)u&.DJ`s&FE8R5DIal1
ARoq$A79@t+E1b0ASuU'ATMF(%16rdG\(DWDIdI%ARfgJF)u&.DGP%&4ZYDB3Zp*c$7I;sATVU(
A3k6KF_t]-FE8l[4Y@j2%16]iDI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+
$7I;N-t7=8Cage^.6T^7-Y%(=@W-N>%14Nn$4R>;67sBtBm=3"+CT>4BkM=#ASuU2+=LiEDIY+<
BlbD>F(Jl)@W-@%+Dbt+@;Kb*+CT.u+D5M/@UX(hGmt*tBm=3"8T&'QEb/a&6$%*]B5U.YEc5tP
4ZYDB3Zp*c$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sC&
BOu3q+CT;%+Dkh;ARlolF)u&.DJ`s&FE8R6ARf.kF(HIBAp&!$.3NM:D.O.`:-pQUBlbD+DffY8
Ci<flCi"A>@;]TuB5DKq@;Kb*+CT>4BkM<pA0>u-BlbD2F!,C:%15is/g+kG+A*bcF`\aICi=93
Gp%!5D.Oi4F(HJ&F!,('EZee3+A,Et+DGm>@rH6pATD["A.8l_Bm=3"8T&'QEb/a&6$%*]B5U.Y
Ec5tQ4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/
DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15mSATDg*A7\>MA8-'q@rt"XF(o9)0g.QS+?CW!%15is/g,(U
ATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2+=K?5.6T^$$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$
4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15is/g+eCDdmc1Ci=6-F!,(5
EZfREEb$;9@;L'tF!,17+C\c#AKYf-@ps1b+:SZQ67sBiGp$X/AmoguF<GC<DegJ0DBO%4F*&O@
De!3lAKYT'EZfI;BlbD=ATMr&$4R>;67sC$ATW'8DK?q1DfTl0@rri6ATN!1F:ARgEZf"2Ddmc1
-Z*RBARnAMA8-'q@rt"XF(o9):MVXk5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/@WNY>D/"6+A4^ZL
Bl[cpF?sthBkM<ZCG9*]5s]R/DeioE3B:Fo%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<Z
CGB0^5s]R/DeioE3B:Fo%16Ze+>GSnB5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0jd446$$m]
CLoLd3F=-C$4R>;67sBkATVKnF<GF7G\(D.Bl7HqEb/a&+CT>4BkM=#ASuT4DIIBn+E_a:%16ua
EZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE\Lid5s]R/DeioE3B:Fo%16uaEZf"2Ddmc1
-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE\Uoe5s]R/DeioE3B:Fo%13OO:-pQUDg#]4EbT&q+Dkh;
ARlolF)u&.DJ`s&FE7luATAo+Ci<d(+=Bs.ATDg*A7\>MA8-'q@rt"XF(o9)0jd446$$m]CLoLd
3F=-C$>"6#0eje`Ci<d(+=Bs.ATDg*A7\>MA8-'q@rt"XF(o9)0jd446$$m]CLoLd3F=-C$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]R/DeioE3B:GZCi<d(;f-GgAOLHH0JH6g/h1LMDdmcdD/X3$6uQQh0HbHh
/KcHSCi<d(.3N/>@s)X"DKI"5Ea`TtASuT4FCfN8/g(T1:-pQB$;No?+B2onFCeu*D..NtEbSru
+E(b"F`MOGBl5&.De(J>A7dG:8T&TlEb-A-F<GdGEbf_K%15is/e&._67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FBD..]F1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h
-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$a
F)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)
DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>ZBm=3"@<6L(B5VQt
DKJ$&+>Y-$+>=63:-pQU8K_\TG%De)+Dkh;ARlorCi<ckC`m/(A0>],@ps0r@<6L(B5VQtDKIKR
<HE:kCi"AJ+EV:2F!,1<%15is/g,+ODfQt<@;TQu@q]dp@q?clF`\aJBOu3q+CT;%+D5V2A0>o(
@<6@)F!,(5EZfFG@qZunF)u&.DJ`s&FE9&D$>s9hATL!e+?MV3G@_n*Eb-A+DeX*%+EVNE@V$Zp
Ci<ckCi^s5$7Ke#D.Rc;4ZX]J-Y$t$DId="FD5W(+D5M/@UX(#%14Nn$4R>PDf000F(oN)4ZX]A
+?CW!%15is/g+S=Ci=M?D/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%17/dDfB9(ATMoU/g*8(@qg!k
F(9--Bl7QjBldX&DdRX)?[$F(AL@oo.!&m:E+NisF)rcn3ZrKRDfB9(ATMo%$7QDk%15is/g,"F
G\(D.@<6L(B5VQtDKI"CEbT0!ATDi7ATDg0EX`@nATAo+Ci<d(+=D#?G\(DoF)u&.DJ`s&FC.="
6$$m]CLoLd3F=-C$4R>;67sC!G%G]7Bk1ctFCAf)@;KauGB4mDBm=3"+CT>4BkM=#ASuU2%16Ze
+D5M/@WNY>@rH6sF`V87B4!qj6$$m]CLoLd3F=-C$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2
?Y=Cu;f-GgAM>f567sa#Ec=roDeio<0HbHh/KcHSEc<HM@rc-hFCcS+D/aTB+D5_5F`;CS%15is
/e&._67sBhF)uJ@ATKmT%15is/e&._67sB'+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d
+D#e3F*)I4$;No?+<VdL1+=>D76s=C;FshV+E2IF+Co1rFD5Z2@<-W9DfB9*/e&._67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3,N)L1,B@H:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FC])qF?MZ--Zip@FD>`)0JFj`$4R>;67sC!E+No0@;]TuBl8!7Eb-@k76s=C;FshV%16Ze+E(d5
FC])qF<Fd11E^UH+<W$Z%16Ze+CoG4ATT%B;FNl>=&MUh74/NO%15is/g+YEART[l+D#D/FEo!A
Ec6)>%16Ze+D5_6+?V#aEc6)>DKTc30II;:%15is/g+YEART[l+D#D/FEo!AEc6)>+>"^XBPDN1
AoD^,+E(b"F`MOGA9Dp,DJ()&F_u(?Eb0<6DfTE1+E(j7ASlC.Gp$a?Dfp#?%16Ze+D5_6+=CfB
Dfp#:F_kkK-T`\'%13OO:-pQUD09Z:BlIm"+Du=<Ci^_@Des!*@<?'k%16Ze+D5_6+=CfBDfp#:
F_kkL-T`\'4!uC,@6,r%BeD(K$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB
$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y=CuCh[uX@<6-m
0JQ<h/h1LSE,9616=FqL@k]V[F=f'e@UX=l@j#l)F*&O:DfQt;@;0U%C2[X!Blmp,@<?''G%G]'
+=LlCE,961.4u&::-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBC2[X!Blmp,@<?'0+<Y*1A0<:8
De(:>BlbD5Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW*12gZE0KBRL:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA9;C(
FCfJ8C2[X!Blmp,@<?'.%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5
-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.
A8Gt%ATD4$AL@oo%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]
I4Ym8%14g4>9G^EDe't<-OgDoEZf:2+?MV3C2[WnATf22De'u5FD5Q4-OgDoEZfF7FD>`)Ch\!&
Eaa'$+=CY[06CcBE$l)%%15is/g+e<DImisFCcS2@<?(*+D,P4+CT)&+D5_5F`;CEDf-\:@<?0*
/KeIE@rc^0@q]Fo%151D/g<"mF(fK9E+*g/+D5_6Ch[u<4s58++D5_6-RT?1%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F?N>A79+^;f-GgAOKsPF"f:C67sa&De*9hAQ*GaCLonBH#kYn+ET1e+=LuC
A79+^.3N/0Gp$g=FCfK9@;I&r@;]t$F<G%(+Dtb'@<?4,AM+E!:-pQB$;No?+CfG'@<?'k3Zq4.
FDkW"EZd(p/0H]%0K0FJ:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_DJs_AF`V87B-8UEATMs.De(:+$;No?
+>GTgDg!lq+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-
2[p*'$;No?.Rd65:Js>>+=LuCA79+^.3NhCF!,L7FEMVABl7Q+?SN[8DfQt2@<iu0DKKH1G%#3.
/g(T1:-pQUA79Rk3Zp.8+AZKh+>PW)2]se73]/iW0Jj4G%16T`@s)g4ASuT4-XpM*AL@oo%14d3
4Wl.0+Z_;++?V#D:IIQD76sgI94)CJDe*3&%14g4/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$=dm`
@<*J<-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$>"6#De't<FCfN8C2[W:0II;:%15is/g+Y?ARTU%@;^?5.!fHFDdd9i.3NhQEb#Ud0d'[CA7]R"
I4cXQDJUFCH=_,8@:s.!%13OO:-pQUBl8!'Ec`F4+EqaEA0>c.G9D!G+DkP&AKY]/+>=pK@<lo:
Derqn$@69(Ddd9i4ZX]A+?CW!%16N,/g,EK$=P&,+>GPZ$7QDk%16Ze+E2IF+=DJHEc5B!AL@oo
%16NVAN`'sC2[WkB4W25H=_,8@:s.!%13OO:-pQUAnc:,F<G"0A0>\sF*&ODF`\a?DKKH1G%#3.
+EM47F_kS2@V$Z9%14d34Wl9u4")gF4>AoQ+>bNo3]\BlB4VMZ%15is/h0=^=?ShjEc6)<A7]9o
H$O[\D/Efo/nS]<A79RkF!,RC+DG_8AS5RpF!+q'AoD^$+CehrCh[d"+=Lc/H!t>s.3N>B+=LuC
A79+^.1HUn$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$>aWhA5d>`CLqU!F*'*2
67sa(Ddd0TD/X3$FCfN80H_K[/M/(fCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:,1@VTIaFE8QI
Bl8$2%15is/g)QaATMs.De(OU.4u&::-pQB$;No?+B3#gF!,R9F*&OG@rc:&F<G:=+<YcOE+rfj
Ci"A>Ecl7BBl8!+A7Zm%FD,6++EV19F<GX7EbTK7F"Rn/:-pQU8TZ(rBQ&$0A0>c.F<D]7Cij6/
+<Yc>AKW+9F`))2DJ().De!3lAKYYtDI[6#BlkI?CggghF!,R<AISuA67sC'F*1o-+EV19F<GX9
FEMOF@;]TuFCem$+CoD7DCuA*:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+=M>CF*)/8
A2#\d+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JPFnF_<Bd%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHb
F<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%159QHZ*F;-Zip@FD>`)0JFjs>9G^EDe't<-OgCl
$;No?+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$:7Na9L2WR9e\^k+>=636;LBN5u^WS0g.Q?0b"IV
:JXYX8Q/SO3ZpX>+>GQ(,;K]86;LBN<'`iE76N[S5;"'9+>GYp,TniO$4R>6:/jMY:JEN+3Zp-d
$;!ul<'`iE76N[S5;"'9+>Y8t0JEqC%15Qu:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>0
83p-I8Q/SO3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OgCl$<()%<'`i6
3Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*F<G:=+D,>*AL@oo%15Et=Ar1!7RfO%
+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^.4dS[=\Vj]64F82$;No?+EMXCEb-A0De!3lAKZ28Eb'56
BkAK,Eb0<'DKH<p-o2u,+>>5l-OgDsAhG2NDJWZG5s]R/DeioE3B:FhBeD4bA8a(0$6UHT0RG05
5s]R/DeioE3B8H0E-67FDJWZG5s]R/DeioE3B:FhBeD4O$>"$pASGa/+<tc?+DEGb+CoCC%144#
4tq>&F`\aDC`mFE1^se'Cia0%AhG3:D_;J++<W?\+:SZhDIb@/$7QDk%15is/g+RFFCfN8%159Q
HSHX^F`\`RF)>i2AM@(pF*')`4!ua*4WlI%:-pQUFCfN8+EM%5BlJ/A%13OO:-pQU@3B/nG9CO=
Dfp#?%159QHY7A<+=CW:DesK3Deio<-T`G43[[6i:J=&R:JEMc6;LBN5u^WS0d&eY:J=_R6;0fq
%159QHY7A<+=Cl@FE;;;CLo1I4!6UG-V7'45u^WS0H`q^<)c.M9LU<<$4R>;67sC%Df'&.D.-pp
DfZ?p4tq=?+E2IF+=D5IDeio<9jqOPD_NP#1,1j<BeCM`1FEV=4tq=?+E2IF+=D5IDeio<9jqOP
D_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8+E(b"F`;UKF)YPtAM,)s+CT+0@3BB#@V'RgC`t/8
$4R>;67sBsARTan+Co1rFD5Z2@<-W9DfB9*%16oi@:W;RDeip+ATMrJ:-pQ_Ci<`m;f-GgATVL)
F>4n[/M/(fCi<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:+7DdmHm@ruc7+DG_8D[d%K67sB/FCfN8
C2[W:0I\U`$;No?%15is/g+,,BlbC>FCfN8+<Y`8EbTK7+<YK7CLnV:Ci<`m;f-GgATVL)F>,-d
+DGm>+EVmJBk(RfCj@-GEcl7/$;No?+DG_7Bk1ctDffZ(EZfI8F*&NIF(96)E--.R+A$YtF(fK7
Ch+Z+Dfd*E@;L$sEZfI;AKW+9F`))2DJ'Cc:-pQUCi<flCh4`&ASu!h+DGp?CggghF!,R<AKZ,:
F^])/FCfN8+EM+9F`8I3DIal3ARTU%A8c[0/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130f<B^B.u4Q$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E_X6@<?''AoD]48g$)G
0K1+qAS!nFEccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO4tq>%A0<7AATMs.De(OU-QlV9
1E^UH+=ANG$4R>;67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IcDf9GX<)64B4ZX]>%16Q_Deq^=
:JEQ,3Zp-d$=[plCeRE!<'<8b5;"'50JF_,%16Q_DerB=6;0g23ZpX>+>k8r1E[qc1(=R"$>FC"
5u^WS0KhH>0b"J(DKJiD6;0g23ZpX>+>k8t,V^u,%13OOAo)BoFA,8)<'<8b2`E?L3?TUj5;"'7
0JF_,1CX[#$=daXE_K&'<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h)
$4R>`H#6MH69R@P1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0%13OO
@W-Ki<)lCW4ZX]64@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;67sC%FDl22+Dbt+
@;KKtGAhM4F!,1/+E2@4F(K62%14L>+?CW!.46JP$>F*)+<tc??U6tDF)>i2AN;b2?Qa&81a$=I
/e&.1+?hK+-UC$aF)>i2AN;b2-QmANF<GI;?U6tDF)>i2AN;b2?Qa&81^se'Cia0%AhG2NDJUG0
/i4\]D_;J++<Wj%HZ4+L+Du!<BeD4O$>"$pASGa/+CoCC%144#0H_JI$>"*c/e&.:%13OO:-pQU
F)Po,+EV19FE7lu4tq=<+E2IF+=D5IDeio=<+U,m0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.M)
4tq=<+E2IF+=D5IDeio=<+U,m0df%11*A_&1*B=Y/g,7IF*&OG@rc:&F=.M)%15is/g+RFAn?0/
B6%p5E,uHq4tq=rEc<-K@W-1$F)>i2AMGPo+?MV3@W-1$5u^WS0HahCDeq^=:JEPd@W-1$<'`iE
74/NO4tq=rEc<-KBl8$6D/X3$0df%*4$"a'DKJ0D:JEMcBl8#l5se76-OgCl$;No?+CQC6F_Pr/
%159QHSZdWEc<-KF*22=ATM^,CLo4J4!6UG-Za-CCLo5"ATMrI+EMC<CLo5"ATMrJ-OgCl$;No?
+EMI<AKYhu@rcL/%159QHScjaF`\`RF)>i2AMHnf@rcKA-Ta(<4""_p+>P`#%159QHScjaF`\`R
F)>i2AMHnf@rcKB-Ta(<4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#Gp%0I@:Nk$+A!\aD'370
Ch[?iEa`c--OgCl$;No?+DbUtG%De,Bk)7!Df0!(Gp%$EASu=&@:WnkD/`EjDeio<0MXqe.Vs$3
A7Th"E)UUlCLo1R+ET1e+CoV3E$043EbTK7+ED%0Ddd0jDJ()5D/X3$+EV19FE9&D$;No?%15is
/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL
+ED%+A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/g)8G$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<lZF>,Q]$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim
@<jUd+E_X6@<?'k+D,P4+A*b9/hf4,F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
F)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;R
Deio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;R
Deio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>+0RI_K+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,7Y
Ec*"<AnE0-Bl.F&FCB$*Et&I?0RI>LF(KG9-W3B45tOg;7n"de0F\?u$;No?+Co&"ATVK+@;Ka&
GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)
Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2+EV19
F<G+.@ruF'DIIR2%14g4>9G=B0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C-n$bm
3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrJ%13OO:-pQUA9Da.+CfP7Eb0-1+CT.u+ED%0Ddd/c
$=ma33Zr9JCLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+EVaHDBNk8+EV=7
ATMs%D/aP=@;]TuA9Da.061W?Ddd/c$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$=ma33Zr9JCLnV9
-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16Ze
AT)O!DBLVB$4R=j0fU=;1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,Ci<`m
FCfN80JG4lBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C'A8,OqBl@ltEd8dL/M/)]Ddd0!0mFg_ATMr9
A8,OqBl@ltEd98H$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'
D..]F0H_cXC2[W3+DG_8ATDBk@q?d!De!3lAKYDlA7]9oFDi:2@<6!&@UX@l+:SZQ67sB'+<VdL
+<VdTC2[X)ATMs)E[`,OAT;j,Eb-V0A.8l@67sB80lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z/ibO@
.h)h\67sB80lCoQ1,C%$BQ%s6F(K;>+ED%1Dg#]&/0H?_ATMrB+Co&"ATVKo+>"^WARuunASc:/
%15is/g)l+C3=DL2BZUCFCSuuDJ((?<+U,m6tp.QBl@ltEd:&qD/^pHAo_g,+=LuCA9;C(F=A>C
Bk)7!Df0!(Gmt*U67sB82emJQ1,'h_ATVEqBl7Q+-q\Dg;f?f!@qAJFFD+'bD/^pHAo_g,+=LuC
A9;C(F=A>CBk)7!Df0!(Gmt*U67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG
%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-U
F(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO:-pQU8l%htF)Q2A@q?d,DfTB0+>"^QATDEpF!,F1FD)e-Bk)7!Df0!(Bk;>p$;No?
+AZKW@<6.$DII?tGp%-=D..3k+EV:2F!,"9D/^V>D]j.B@:O'q@q]:gB4Z-,Bl5%c:IGX!:-pQU
4tq>#@;BEs8oJ6=Dfp)1APcfWBLHu[E'66)-u*^0FD)dEIS*C(<(0_b-RgSo05>E9E+*j%/no'A
-OgCl$;No?+D,2,@q[!,ATMr9A8,OqBl@ltEd8d;Df0Z.DKKqBF*)>@ARlolF!+m6%15is/g+\I
D/^V=@rc:&FE8R=DBO%7AKWC9De*s$F*&iRA7]pqCi=90ASuT4A8,OqBl@ltEd8*$4tq>%A0<rp
-YdR1FCfN8+DPh*A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14J'@j#i'@<<k[3Zp7%B4Z0--WFYu
F@9hQFD5Z2@<-W]F_u(F%14M1/g<"mF(A^$.6T^7HTE?*+EM(%F:AR)Eap55A79R-4ZX]B+D58-
+=Bd"A5dDhEarZW@<?0NF_u(F%14M1/g<"mF(A^$.6T^7HTE?*+EM(%F:AR@0RGSuDe't<C2[X)
ATMr@%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OOFC])qF?MZ--Zip@FD>`)0JOpa
$4R>REZf:2+EV..@rr.e%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/
F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##
,<R>$%13OO:-pQUCi<`m+EV19F<G+:D/^V=@rc:&F<D#"-n$bm3\`<B.3LZ4+>>i*+B2onF@9hQ
FD5Z2@<-W]F_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-UF(dQo3F<4&%15is/g,+A@r!2tBk)7!
Df0!(Gp%3I+ED%1Dg#\7,%P7nA0N..Bl%?'@rH4'Df0-(FE7luATAo4@:O(`+EV..@rr.e%15is
/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@FD..=-+EM77B5D-%Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfRE
Eb'56GA2/4Dfp.EA7]glEbTK7Bl@m1+:SZV4ZX]tF(K594s2O%0d&7pDJs*2E$-MU%16#s3Zq?D
,CUa`4>83,IQATu/g<"m;[j(FEZd%Y3$<0_F<DuY/g<"m;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$
;^ii9/g`27+F?-n0d'C($4R>;67sBtATDEp+DG^98l%htF)Q2A@q?)V-n$bm3\W!*3]\B;3[l1D
De)dbF`Lu':gnHZ7!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("
@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is
/g+SCAKYi(F)u&5B-:W#A0>_tDL!@5D.73lDfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?q
A1e;u0d'[C0Hb"EDdmc74s58++CoA++=ANG$4R>;67sBU:K0b*:.\/V3ZqsECh7^"+EV:.+EqaE
A0<:BATMrB+DGp?@rH3qF!,17+EhI-+=L3#F*'fa@ruF'DIIR27!3?c.1HVZ67sBhDIal+ART+j
+EVNED..3k+D,%rCisc0F!,17+EV:.+A>6l+>#/fFD,6+ALDOA@3A0<6m->TCLmq^:-pQU@Wc<+
FD,*)+E(b"F`MOGGA(Q*+EqaEA9/l;Bln#2FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn
%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,XfATD@"F<G+.@ruF'DIIR"ATJu4DBO%7AKXT@6m-GW
FD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9ATD64+A$Gn
%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+G%G_;FD,4p
$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k+EM[GAISuA
67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9A8,OqBl@lt
EbT*+/e&._67sBUDg!6Y1FsY(0JP9k$;No?+>G!C+Co&"+=D8BF*&c=$4R>;67sC"@:O(`+CT.u
+DkP&AKVEhATAo4@:O(`+EV..@rr.eATAo1@;BEs-RT?1%15is/g,4KDg*=6Dfor>Et&IfEZfF:
Dg-//F)rI7Bk/?8+>=63%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDFE1f2BK8(5?O[?YDdd0uATMrI0J[0Q@ruF'DIIR2:-pQ_Ci<`mFCfN80JG7mBk)7!
Df0!(Gp%2\/KekJ@:UK8GT\aaFCfN8+Co1rFD5Z2@<-WG$;No?$;No?+AcuqF_kK.ATJu9BOr<)
Eb&a%+>J*`1*C[MF*&NIA8,OqBl@ltEd98[:gnBd+E(j7FD,5.+DbJ,B4VEF67sBmARTXo@VfTu
FCfN8+Cei$AM+<b67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU+<WBf+D#G/F_>A1AU&<*DKI"3Bk)7!
Df0!(Bk;?.FDi:2F_PZ&+>GQ(0In8iDfTA2FCfN8+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F;DJs\R0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTgDg!ll+ED%1
Dg#]&+CT/5+=M/EA85On.3N/8@ruF'DIIR2$;No?+>G`gF`&rm+E_a:EZek1DJ!TqF`M&(+A,Et
<(0_b+D,P.A7]cg:-pQU0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0=G@rGk"EcP`/F<Dr?@<6!-
$?B]tF_Pl-+=CoBA9;C(FCfJ?$49Np/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG$8!kQ-[nZ`6rZTR
<$re?3Zr0V@<?0*-[nZ`6rZTR<$r"[@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5
@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6mi<KFC])qF?MZ--Zip@FD>`)0JY!_$;No?+E)41DBNA0+Dl%<F<E:r
+Co1rFD5Z2@<-'nEsb<,6W?uI3Zri'+E(d5-RT74EZf:2+=Js&4>%jH8OHHU.=3[88OHHU$49Np
/g+\ID/^V:@<?/iATAo1@;BEsAnc'm4ZX]6C2dU'BHS[O8l%iS78m/5.3L/h05>WICG'=9F!h<+
EZd.\De't<-OL2U67sBsDdd0!1*A;r+Co1rFD5Z2@<-W#ATAo3A0>u)Bk)5l$;No?+Co&"ATVK+
@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"VBlmp-/0Je<@rcL/$8EZ-+E(_1+Co&"-9`P,+FPjh
/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT6.:-pQUCi<`m+CoV3E$043EbTK7$7I;V
+Z_;++?DP+0KLX*4D&;DAI;pc@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FR$;No?+E1b!CER/%
@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-EscK!+E1b!CLeQ0A8,Oq$49Np
/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<L
Eb'4u:-pQU@<,p%D/"'4Bl7Q+@;]TuD..=-+CT+rBkM@,F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6
ARfObEb/c6$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q$49Np/g,+A@r#Tt@;]TuD..3k$>"6#E+*6l
A0>u)Bk)5lATAo1@;BEs-RT6.:-pQUF(fK9+Cf>4DKKq,ATAo(Bk/?8+>=-0ATD@#E+No00FA.s
De!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,$>aWhA9;C(F>,C)A8,Oq
Bl@ltEd:DH/h1[U@:XIkF*')i1Lt30FD5Z2@<-W9F=f'eCi<`m+>J*`1E^dNF*&O8Bk)7!Df0!(
GqKG!67rU?67sBWDfBi8@<?(%+<Yc>AKYo3A7]d(0mFfs+EV19F<D]:Bk)7!Df0!(GqL49@<-H4
De:,6BOr<&@<-!l$;No?+D,1nF(o*"AKZ)+F*&O7@<6!4$;No?$;No?+CT>4F*2>2F#jY'67rU?
67sB8.3L$\ATMs.De(OV/9GHEFD>`)0JY("@<,p%Ci<`mARl-C67rU?67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JP;"Dg!lj$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0f<]gDDF*mF`V,7+Cf>-
Anbn#Eb/c(8l%iS78m/.AoDKrATA,Q67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[Tn%De!p1
Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1FCfN8ATB.*$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"4
/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo
3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&
$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi<KFC])qF>?!?+=D8BF*)/8A2#bd$?Tfm@rsLi
3ZoelATMs.De(OX-OL2U67sC!E+No0FCfN8+>P'MBk)7!Df0!(Gp$^1FCSu,@;p1+Dg3C<@;KNu
GAhM4EscK!+E(d5FC])qF>=27EZeFZ;FFGH3ZqsNC`k)Q$<L#$6rQ60+FPkD:JsSZ$<L#$6rR#Q
9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%215V5#G,?IZ=6rPO!,?IZ=6rOF"9M\VN3Zp=70Ha+W/g+tK
F<GX=H=[EjEap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ$<L#$
6rQ60+=KoZ<'2cX=&2^^;^ii;/g+4k;FFFj0d'[C1E^UH-RT6.:-pQUDfB9*+CT.u+Cf5!@<*J=
FCfN8C2[W=.10X,+E(d5FC])qF>F7Y+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>
F$2-<+tt-R/g*##,<R>$$4:?b+>=om0Hb=WF<Et?7T0XK+BosE+E(d5-RT6.ATAo3A0>u)Bk)6?
$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[QT%;FFGH3ZohE
:K0G/,?IZ=6rPNWI4cXD:JsSZ$8EZ-+>Y-YA1&`3$>"6#De'u4A8,Oq1C@]6+>=om0Hb=WF<Et?
7T0XK+BosE+E(d5-RT6.:-pQUAn?'oBHU_+Ci=D<De:,7DKU#3A0<WMA8,Oq+EqaEA9/l%DIal1
@;]UoD/=J?Eb0,sD.O&cEZf:2+EV..@rsI5=&2^^;a!/a."*]jA8Z3+-RU>c/M8/I:JsSZ;aj@e
Eap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ$:I<P;a!/a-n$bl
HQk0e6q'RD.3L/g/j:C?+u(3RAn3#4,=Fsi;^jpcAN;1^-p1p!4"r+3+@JXf;[P6%>9G^EDe't<
-OL2lEZf:2+EV..@rsL6ATAnI+>GPmE-67F6q'RD$49Np/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%1
Dg#\7,%P7nA0N..Bl%?'@rH4'Df0-(FE7e#EZf=0@r#TtFC])qF>F72:-pQUB4YslEaa'$+CT)&
+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(+D#S6DfTnA@<3Q.@;^?5GAhM4EsbZ//g+SCAKYi(
F)u&5B-:W#A0>_tDL!@5D.73lDfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e3D+BosB
+D5M/@WNk[+FPjbA8Z3+-RT6.:-pQUE+*6lA0>;uA0>_tCLmiaEZf=0@r#TtFC])qF>F88EZf4-
CLnV9-OL2U67sC%BQ&);@rHL-FE7e#EZen,A0?=D0FA.uEb00.ASrVE$4:9]@s)g4ASuT4-XpM*
AL@gpDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FRCi<`mFCfN80JG=oBk)7!Df0!(Gtp[Y.Vs$3
A9;C(F>,C*A8,OqBl@ltEd8dL/M/)]Ddd0!0mFft+EV19F<G+.@ruF'DIIR2/e&._67sAi$;No?
+AcuqF_kK.ATJu9BOr<)Eb&a%+>J*`1a$mOF*&O8Bk)7!Df0!(GqL49@<-H4De:,6BOqV[:-pQU
Cgh?sAKYSr@<6-lCh4`2ATMr9@psFi/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf
+=MASBl%iAFCfN8C2[W:0e"5REb-A0Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@rc-hFCeuD+>PW*0lCoQ1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0f<]gDDF*mF`V,7+Cf>-Anbn#
Eb/c(8l%iS78m/.AoDKrATA4e:-pQU0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0FJ%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sBpF!+(N6rZTR<$5[hDJ!TqF`M&(
57IrO/g)Nj8l%iS78m/5+>#VsC2dU'BHS[O8l%iS78m/5%13OO@rGjn@<6K4FDYu5De!-?5s]U5
@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFg3ZoelATMs.De(OV
-OgE)A8,Oq1d*lB-Zip@FD>`)0Jk-d$4R>;67sBsDdd0!.!9WGCi_$JAo_g,+CoV3E"*.cEZf:2
+=D;RBl%i<%16Ze+DkP&AKYT!Ch5aj+=LuD@<?0*-[nZ`6rZTR<$s+G-SK4WDJLk=C3(a3$8EZ-
+>Y-YA0<6I%13OO:-pQUDfB9*+=M>CF*)/8A2G_X@;]Tu@r,^bEX`@eEZf:2+EV..@rsO:$8EZ-
+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1-n$bm3\W!*
3]\B;3[l16Anc'm%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$8EZ-+>Y-YA0<6I%13OO
:-pQUDfB9*+EV19F<E:\A8,OqBl@ltEd8d>ATVEq+CT5.Ec61FBOP^h+EqaEA9/1eATAo3A0>u)
Bk)6>%16Ze+BM?:6rQ60+CoA++=ANG$<L#$6rQ60+FPkD:JsSZ%1604;FFG^78,j*=&2^^;a!/a
=&2^^;]pF9+=JX#/jM!L.3hni;FFG459j6*;FFFm$4R>9:K0J<+>to-+AP6U+Dbt<+EM7CAIStU
$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]6
9M\VM/gFFn;FFG4+FPjb=&2^^;[j'g+BosE+E(d<-OgCl$>"6#De'u4A8,Oq1^se'EZd%Y0ea_h
F`\`o77L2b$8EZ-+>Y-YA0<6I%13OOATAo3A0>u)Bk)6>%17,c+Bos9Eap4[77L3'4ZX]>+>GPm
B4Z0--qmE94>%j[:JsSZ.3Nsi+BM?:6rOO%=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:6rOO%
0d'[C1E^UH-RT?1%16Ze+E(d5FC])qF>OF6ATAnI+>GPmE-67F6q'RD%14g4>9G^EDe't<-OgCl
$;No?+D,2,@qZun+Dbt<+E(j7F`)>CARlo<+Co1rF<GdGEb'56@;]TuEa`irDf'<9+ED%2@;TQb
$>"6#De'u4A8,Oq0b"Ik:JsSZ4ZX]6I4cXQDJUFC-Rg/i/g+4k;FFG^78+-tEap4r+=D2>+@JXf
;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ%15Kl7T2H2+=JWl+F>:e+@JXf;^ih?
-8%J)4<cL&BP(ct-mM,K7T1a#0kE?o+=K?\3]f#EI3:pH7T0a'0d'[C1E^UH+=ANG$4R>REZf:2
+EV..@rsO:$>"6#0H`)(+E2IF+@JXf;[j'C$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?
A7]1[+s:K3Ch4`!Df'H3DIm^-Et&IfEZf=0@r#TtFC])qF>OF6%15is/g+e<DImisFCcS'Cht5(
Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6
F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB
+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#TtFC])qF>OF6
ATAo1@;BEs-RT?1%15is/g,4KDg*=6Dfor>Et&IfEZen,A0?=D0F\?u$>"6hDfB9*+>=63%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16oi@:XIkF*')j0P"m-
FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P@ruF'DIIR2+ET1e+Dbt)A0<T\GT^U4EcZ=FDfTB"EZf:4
+DkP"DJ=38A7Zm*ATMr9A8,OqBl@ltEd98H$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd]
.3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OV.3N2HBleB;+CT.u+DGm>Ci<`mARmD&$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hf3B9*;Dg!fh%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l'DJs\R1*C^YA79RkA0>K&EZdtM6m+093A*-=%15is/g)l.De!lD0HbLWA79RkA0>K&EZdss
3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>
Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDm
DeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6>4ZX]5
FCfN8C2[W:0ddD;FC])qF>5Io4ZX]5FCfN8C2[W;0JFj`$4R>;67sC!E+No0.!0!6@rsFS+CT.u
+D5_'@N[B\0JFVnDfTB0+EqOABQ&$8+Co%qBl7X&B+52ZEZf:2+EV..@rsF7$9ieh+F&-U4ZX]>
+>GPmB4Z0--o!J20L$e1/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)FEDUf3Zp."B4Z0-
I4cWs+CoA++=ANZ+<VdL+<VdL+<VdL+<VdL:-pQUFCfN8Et&I?HS-FXD/DEs+>b3RATT&C/g)tn
A8Z3+-RU#Z+<VdL+<VdL+<VdL+<Ve%67sBt@:O=rEt&IhB4j@g+?V\-4!5b5B6%r</j:D+/g+eI
E$m"U+<VdL:-pQUF(or3+E(j7.!0!6@rsFS+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGRY"%FEBZ,
+>G!XBk(p$FEDUI%16rhD*9p&0d(FL@r!3(D/B^h%16Ze+>Y-YA0>u)Bk)6>%13OO:-pQUDfB9*
+=M>BBk)6>0R,#h@;]TuA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOs
Ec6".$>"6#De'u4A8,Oq0edh]$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN
/j(=3+DEGN2(9b4-RT?1ATAo(Bk/?8+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4
+Eq78FCeu*F)YPtAISuXEZf=0@r#TtFC])qF>5Io%13OO:-pQUF*)>@AKZ28Eb'5#$>"6#0H`)(
+E2IF+F&-U%13OO:-pQUF*)>@AKZ)+F*)I4$>"6#0d(FXF<G[IF:AQd$;No?+EMXCEb-A1@:O=r
Et&IfEZd1]E-67FD/F,!$4R>;67sC$AT23hFCf!!Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@
AISueAStpnAN`'s0f'q5+=ARa/g<"mGpsjf/g_qn+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd
+DEGN,C(XG$9ieh+EM47GApu3F!*.Z0ea_hF`\`S0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)
5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6
@<6K40H`)(+E2IF+=JufEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPm
E-67F-o2udAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gM
DIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^
+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3
+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oW8hAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh
+EM47GApu3F!*.Z0ea_hF`\`S3$<6QDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)%15is/g,1GDIIBn
+EV19F<G(3E+rm)+CT.u+EMXCEb,[e5'nn)F(fK9E+*g/+>G!XF`\`S0HbCIDIIBn+EV^I.3L$$
@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S0d(LJDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!
5'nn)F(fK9E+*g/+>G!XF`\`S1*CUKDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/
+>G!XF`\`S1E^^LDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S1a$gM
DIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S2'?pNDIIBn+EV^I.3L$$
@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S2B[$ODIIBn+EV^I.3L$$@6-J(.=E=\FE@s!
5'nn)F(fK9E+*g/+>G!XF`\`S2^!-PDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/
+>G!XF`\`S3$<6QDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!%15is/g+kGF(KB6+EV19F<GdGEb$;'
ATM@%BlJ0.Df0V*$<Ktg9gquD3ZqsNC`k)Q%16035tsdH4ZX^6/g+4j5tsdH%16$):Jt.[:IA&D
3[d3F-mMeg5tsdH.3gf+.3Kl_/j:C+,?IW+9gqu0,<R>qATMrJ0Hb">DImj&@j#W"@;]dsB5D.#
F!,R9F*&O8ATM@%BlJ0.Df0VD%16Ze+>=ot+E2IF+BM<(9gqu'/1r&D85E,_6r-0K%13OO:-pQU
B4YslEaa'$+CT;"BlnB(Ed8d?Ec6)>F!,LAF_>B(Gp%3?DBO%8D.Rc2Cgh?sATAo8BOPcf$;No?
+EV:.+D5_5F`;CEBl5&8BOr;7FCfN8C2[W:0e"5UBk)7!Df0!(Gmt*nB4j@g+?hh/5;"'50H_hf
0ea^p+D5>"%15fq=@Z7c;b:.]4ZX]1=&)%U78jX&B4kj?3Zq-_=@Z7c;b:.]+?V8!B4kid$:duj
9M&/^;a!/a-n%2%0Hb"@B.4rf-8%J)4AA+D7oE/^8QnP3+F>Ff4s2sh:-hTC;[j((;G^%Y;cH[Y
3Zoh5+tt-]EbTB.CgUUcDe*2t4<cL&-Zip@F>5I^Ec<BK/0Zek+Dbe8F*&NK3ZoOr/g+j\+<tN3
B.4rS-8%J)7oE/W8Q/Se%150>HS-Ks+D5_6-9`PB;G^%Y;cH[)$4R>;67sBnASu("@<?''@<,gk
FE1f1Gp%-9DId[&+EV19F<GXIBlmp-+:SZ>+F>^b0d'[C1E^=NE$?tY0d%km4=>2mBlmo6.3L/g
/j:C%3[QIC+?Ui%+DEGN0eb:1+=o,f-o3P"59_d(0d'[C0eb:(,9S4Z/hnJZDJUFC-Rg0b+FPjb
0d("EC`k)Q%13OO:-pQUB4YslEaa'$+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(+D#S6
DfTnA@<3Q.@;^?5GAhM4Et&IO67sBhEb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)ATJu&
Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD&$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q%13OO:-pQUF(fK9
+Co1rFD5Z2@<-W9F*(i4Et&IfEZen,A0?=D0F\?u$;No?+Cf5+F(HJ9ATMrJ0Han?@ruF'DIIR2
+CT.u+Cf5!@;[31E"*.cEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F?T@@:XIkF*',j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P@ruF'DIIR2
+ET1e+Dbt)A0<T\0R+]qDIal.Eb&a%+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(GqKO5:-pQB
$;No?+Eh=:@UX@mD)reJF)uJ@ATJtBFCfN8C2[W;0JFpuCi<`mARl5W:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTg
Dg!lk+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>Gio@rsFZ+E_X6@<?'k+D,P4+A*b9/hf3n
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFZGWe)1-Zip@
FD>`)0eb:/%172fBk)6>0JI`73ZoelATMs.De(RV0JFj`$4R>;67sC!E+No0.!0!6@rsFZGUXbD
DIal&ATT&'Ec6)<A0<T\0JG1'GAhM4F!,[@FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>0R+$6
5'nn)G^+Hr3Zp+!0ea__ATT%C0eb:90L$e1/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)
B4kj?3Zr'UE$-MU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+D5_5F`;C2$@$f?4ZX]?
+E2%)CERkHGT[G&B4kj?3Zri'+D5>"%16Ze+>Y-YA0>u)Bk)6>0R+$6%15is/g,(OASrV=FC])q
F>5I'GUXbDDIal#ASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p
ATAo3A0>u)Bk)6>0JI_\$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT?15'nn)F(fK9E+*g/+Co1s+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:B
ARfY%ATAo;@<6O%A0>r4@:NjX$>"6#E+*6lA0>u)Bk)6>0JI_\$4R>;67sC%FDl22+EqaEA9/1e
5'nn)F(fK9E+*g/+>=om0Hb=WF<GgQGRXuh$;No?+ED%4ART[lA8HN6@q]:gB4W30DfTA2DIIBn
F!+n/A0>r8DfTCu$?B]q@;TR=3Zp.5+?CVm.!mQj0d(`j+>#2m-RU#a-U940/j:C?+u(2a3Zot+
+=MIa+<u.\+=eRK/g)Ba-OgDHHS-F^BQ&*6@<6K40H`)(+E2IF+=JodEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-nuibAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1*CUKDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtf+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K&hEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oE,f
AStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2B[$ODIIBn+F&-U
.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtj+ED%2@;TQuG^+H^+=K?\3]f#E
I3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K2lEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%13OO
:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&I?HS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sBpDKBB0
F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1+=LfGFE1r0AKZ,:AKYo'+E2IF+Cf>,D..<m+D>>,ALS&q
5'nn9+?1K_F`\`SI4f&JC`k)Q.3L/o+?V#nATMrJ0JFVdDfTD3D.R-nBl7R"ATMo8FCfN8+Co&)
@rc:&FD5Z2F!,C5+CTG)Ea`Tl+DbV,B67f7%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&If
EZen,A0?=D0F\?u$;No?+Cf5+F(HIBFC])qF>5I'GUXbGBk)7!Df0!(Gp$O5A0>AuARTI!F`7cs
ATAnL+E(d5-RT?1%15is/g++^;cFl<<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,%16r\CLpFdEb0<50JH6g/h1^HCLpFd
Eb0<50JFVk/M/)UF_u(?G%G]>+DbJ,B4W2rBk)7!Df0!(GqKO5:-pQB$;No?+CT>4F_t]23XlEk
67r]S:-pQU+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2,bl0I\,UG\M5@F"Rn/:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX)]F>5T]$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>P
De!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-
$4R>aA8,Oq4ZX]5FCfN8C2[W;0JG1.%13OOATAo3A0>u)Bk)6-+AP6U+E)41DBMhG5t"LD9N_f3
%15is/g+,,BlbD=ATMr9Eb065Bl[d++CT.1@:F;#Eb'!3+D>J%BHVM;Eb$;&Dfor>/e&._67sBP
AfuA;FWb7=ATAo'Eb/[$AKYD(F*VhKASiQ6Bln#20eb:80JFVg@<-I2%15is/g,FXFWb@+G%De*
BkM'iEZf=ADdmNoD0$hABOPd$F*)>@@:s.(%14gD0JG17+?UbkA8Z3+-RU$@+EM47GApu3F!,"-
A0?=D0F\?u$;No?+CfG'@<?(%+CQC5Dfo]+Cj@-[0JI?Q+EM%5BlJ/'$>"6#D..3k+=ANG$4R=s
+Bot!BlY>2E+*j%+=DV1:IJ/N;cGCt/9GE:@rs7L04]3BE$l)%%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-U
F(dQo3F?W@CdMQOBk&hN:-pQ_D/O/V@<6-m0JFVk/M/)TBOt[h+=M)ECagK9@<6-m+D,b6@ruF'
DK@E>$;No?%15is/g)QZDJUaEBOPs)FE_XG+E_a:+Cei$ATKIH8TZ(oEc6,8A7]g)@3BW*D/a<&
+<YN4@;^-/FDi:C@ps6a$;No?+CT)&+ED%+BleB-Eb/c(+Co1rFD5Z2@<-'nF!,(5EZfF;D/a<&
+E2@4AncK@+Cf>-FCAm$F!)T6DIa1`:-pQUF*2),Bm:b<@;TQuE+*j1ATD[0+<Y*1A0>T.+DkP&
ATJu.F<D];@<6]:FDi:6Bl7H(A9Dj-Bk(RnAISuA67sBu@;TRs+<YB9+<Y]9B5)F/ATD?m+Co1r
FD5Z2@<-'nF"SRX8l%ht+DGm>+C]%nF(Jl)+EVOG@<,n"%15is/g+tEDIm6s+<YfEBlS9,+DtV)
ATJu&DIal#Bk)7!Df0!(Bk;?.+CT;%+<YN>Eb-A*Ch7j*@VfTu+DGEs$;No?+CoV6Ch[BfFCfM9
@<,p%CLqI,+EVNE@3BE$DJ<s1D(Z8):-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+@0g[
+EV19F<G+.@ruF'DIIR"ATJu-@<Q3)@V'+g+CfG'@<?'k+CT.u+Dbt)A7]:(%15is/g)8Z+<Ve*
AS!!+BOr<.ATMs7+=L`?ART[lFCfN8A8,OqBl@ltEbT*+.3N&:A.8l@67sB'+<VdL-u<g1A5d>`
CLqU!F*')e+Dbt)A5d>`CLqU!F*',f+Dbt)A7Th"E)UUlCLo1R/.Dq]67sB'+<VdL+Dbt)A9;C(
F>,C'A8,OqBl@ltEd92YCi<`mFCfN80JG7mBk)7!Df0!(Gq:(SDdd0uATMrI0Jd6R@ruF'DIIR2
%15is/g)8Z+<VdLCi<`mFCfN80JG=oBk)7!Df0!(Gq:(SDdd0uATMrI0ed-P@ruF'DIIR2/0JbI
@:XIkF*',j0P"m-FD5Z2@<-WB%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(FBDe!lD1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)
ATMs)E[M;'%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEo
ATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+ED%8F`MA@+EV%$Ch4`-AftMuC`mq?
Eb$^DA8,OqBl@ltEd8dF@;TQuE+*I$F!,17+CT)&%15is/g,1GB5)F/ATD?m+Co1rFD5Z2@<-'n
F!*%WGA(Q*+EV19F<G+.@ruF'DIIR"ATJu&Eb-A4Eb0<'DKH<p:-pQUFD,B0+EV%$Ch4`'F!,CE
ATAnJ0JG%30JEqC0eb:80JFV3+?hD2+<r3s+Dl"4+=ANG$4R>;67sBpA7]Y#BlnV0$7ISND/O/4
-RU>c/NP"kDJUFC-OgCl$;No?+EVO<ATD4$AKYr#FED)7DK?qBBOQ!*@<,p%DJsV>8g&"[D.Rc2
/KeqBARo@_+D,P4+EMI<AKYr#FED)7DK?6o0d&.m/NP"!-9`PhDJUFC.OlocDfdWc05b38AL@oo
%15is/g+S=C`m82E,95u@<?''DIIBnF!,17+CT)&+Co1rFD5Z2@<-'nEt&Is@j"tu-ZW]>DIIBn
F!j+3+>=pF0d(=NC`k)Q%13OO:-pQUA9Dj-Bk(RnAKYl!D.Rc2GA1l0+ELt5Bldm3%16r\F)*p"
+FZ?o0Hb]d0d(@BD.Rbt$7Kb"F))mC+>=pb+u(3X@;TRs.3L3'+?L]p/g`27+DkP.CEP#f4"`6:
+>=pb+u(3X@;TRs%13OO:-pQUE,oN%Bm:a0$?0Eq4ZX]5Eb/^%@Uj=m-OgE'@j"tu-ZW]>DIIBn
F!j+3+>=om+Dl"4+E1b2%14R;0-DqkHQk0e-nIDu@<<q@74o]H+>=pb+u(3X@;TRs%13OO:-pQU
@rH7,@;0V#+:SZs@<=Xn+=D8BG]Y;B$?BW!>9G;6@j#YtD.Rc94ZX]>+>P'VDJUG7@<;qc.P<@s
.kWJ!0d%kq3cJML.3M&3+?go%+F>:e+DtV)ATJ:f%15is/g,4XAnGb%%17&_F?MZ--Y7OA-OgE'
@j"tu-ZW]>DIIBnF!j+3+>=oo+Dl"4+E1b2%14R;0-DZ*E+*i;+?^hq/L,4CF=A>Z/g`27+>=pb
+u(3X@;TRs%13OO%15is/g,=GEbTH7F!+n%+D>\'+EV19FE8Q6$4R>;67sBkF`;/2@psIj+AG."
912QW:*=C^@rcK1DIIBnF!,17+CT)&+Co1rFD5Z2@<-'nEt&Is@j"tu-ZW]>DIIBnF!j+3+=K&h
0e?$b;G0DR=&*+2C2[Wi.3NJFC`k)Q%16r\F)*p"+FZ?o0Hb]d0d(@BD.Rbt$7Kb"F))mC+>=pb
+u(3X@;TRs.3L3'+?L]p/g`27+DkP.CEP#f4"`6:+>=pb+u(3X@;TRs%13OO:-pQUF*22=AKYl!
D.Rc2@rH7,@;0UnDJ(($$?0Eq4ZXs3D/X3$-OgE'@j"tu-ZW]>DIIBnF!j+3+>Y,q+Dl"4+E1b2
%14R;0-Dbt0-W+n-nIDu@<<q@74o]H+>=pb+u(3X@;TRs%13OO:-pQUFCfN8+DtV)ATJu*DIdI!
B-;D4FD)*jE+*iO3Zoe(0II;:Eap4r+=D2>+DtV)ATK4^3Zp."1E^OPC`m\*F:AR,/h\=q4E+_N
.3Lbr-nQZ_@<<q@HS-Wt4s2O%HQk0eDIIBnEt&Hc$;No?+D5_5F`8I@@;TRs+EMX5Ecc#5B-;D4
FD)*jE+*iO3ZoeZF_PZ&-OgE'@j"tu-ZW]>DIIBnF!j+3+>P&o+Dl"4+E1b2%14R;0-DqkHQk0e
-nIDu@<<q@74o]H+>=pb+u(3X@;TRs%13OO%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,D/O/g
D/X3$6#pUZ0JH6g/h1^UCf>1hCLoePB6,a\+ET1e+=M)ECagKJBl.g*AKZ/)Ch[E&@<-"'D.RU,
+Cf(r@r$-<%15is/e&._67sBJBOt[hF!+n-C`mn0Ch[E&@<-"'D.RU,+E1b2FCfK1F!,(5EZccI
DJUaS%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4t/hRS?:-pQB$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fWojDD3gT$;No?+Cf(nDJ*O%3Zp"+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1
+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G0
3Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl
$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp
+=D8BF*)/8A2#\b%13OO:-pQU-uEj<.3NbNCh[Zr+Dl%<F<F1O6m-\lEb'56A8c%#+Du+>+ED%5
F_Pl-+E)41DBNJ(@ruF'DIIR"ATKI5$;No?+AZld+E(j7FD,5.@UX=l@j#o8ATJu4AfrL=DJUaE
BlbD=D]j+2@;[2rCht57AS5^uFCfK(A0>Ds@ruF'DIIR"ATJ:f:-pQUAoD]4F(oK1Ch4`,@;TQu
E+*j1ATD[0/e&-s$>"6#D/O/4-RU#Z+<XEG/g,@PCht51BleA=@;Ka&GAhM4F!,17+CT)&+ED%+
BleB-Eb/c(A8,OqBl@ltEbT*+%13OO:-pQUF(oK1Ch4`'DK]H)Bk/>pEbBN3ASuU2%16uaEZc`R
Ec5i.-Qm8DC`k)Q%16uaEZf4:C`kSX+<V+#DImi2D/O/44$"a,D]iM-G\(q=AS>a)%13OOATAnI
+Dl"4+=ANZ+AP6U+CT)&+EqaEA9/kAD/X<#A17rpATAnJ+Dl"4+=ANZ+AP6U+CT)&+EV19FE7lu
ATAnK+Dl"4+=ANZ+AP6U+CT)&+D5_5F`;C2$>"6#1E^OPC`k)Q+<XEG/g+S=C`meABlmp-%16Ze
+>b3XDJUFC-QjO,67sBhCht52@:O=rEt&Hc$>sEq+>k9YDJUFC-QjO,67sC!DJXS@DIIBn+Dbb5
FE7lu%13OO:-pQU@;Ka&G%#3$A0>u<D]ib9ASiP<GUXbDEbBN3ASuU2/e&//Eb0;T3Zoh%+F>5,
6:s[6<),ef@;9^k?Q_EQ:dJ&V:fC_0C2[Wi.3NJFCaLbu+?V#!%13OO:-pQU@;Ka&FD,6,AKZ&*
@<,jkATJu8BQ&$0A0>r9@q0(]A0<HHF)Po,FD5T'F!,[@FD)e7DffZ,DJ()(Dfor.%159a-nlup
.3Ks$+EMR7Et&Hc$;No?+Eh10Bk/?.BQ@Zq+DGq/D'16O.3NMHDId<j@<HC.+CT;'F_t]-FE8Q6
$>ad*4ZX]:+F>54:JsSf@;9^k?Q_EQ:dJ&V:fC_0C2[Wi+?L][/g)t[$?L6!F$2Q,Cia\@D/O/:
/j:C?-RT?15!UMM-@70a-9`PnEb0;$$4R>YF*'Q++=nX^+AG-h;GUY.C2[Wi+?L]B5u^WV;dWsJ
De*2t4!76`6W-]Z=\qOo@;9^k?O[?`Eb/`D/g+tOF<GF<CaLbu+?V#!%159a-nlup.3Ks$+EMR7
@grbS$4R>;67sC%Df'&.@UX=l@j#`,@<HX*@VfTuATDg0EcVZsDImi20d&1n0d(=NC`k*=AU,XG
+<Ve%67sC&ATMs7/0JSGDfp#?/0K"VBlmp-+CoC5DJsV>BOQ'q+Cf4rF)qctDImi21*A@q0Hb4M
C`k*HD..I,ASrk)$>sEq+>Y,q+>P'VDJUFCF`8];$4R>;67sBi@:UL!E-,f4DK?6oDImi20d'g[
+>G!UDJUFCDJsW.G%GQ8Ec5i.-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No0
0F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GaATqZ`D/X3$
6=FCjEbBN3ASuU20JH6g/h1aMG@XWhDeioN@:VZEB6A'&DKKqR0HbHh/KebFG%#3$A0<:<ATqZ6
+CT;'F_t]-F<G[:F*)IU%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$
ARmhE9jr;i0f_6S+<V+#:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$;No?+>>`lDg!6G+E_X6@<?'k+EVNE8l%ht8g&:gEcYr5
DBLhi0JY-f$;No?+>>`bARdDO+D,P4D..Mq$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A+RG9PJBe
GRY!T67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[p*'$;No?+B3#c+D,P.Ci=N3DJ()+DK'`?
F!,O;Dfol,+ED%7F_l.BBl5&)EcQ)=+Dk\2F(&]mF!)lKATqZ6/e&.tDe!p1Eb0-1+=CW,F(H^.
$4R=r+?^hq1a+n6.3L`#8l%iB9LV6F:J5&/C2[Wi-OgD;+>#Vs+tb68:IIQD76sgI94)CJDe*3&
%16T]ARTU%-RT?1%17,eEHPu9AKW@8De*s$F*(u6-OgDX67sBlG]75(FD5W*+Du+>BPD?s+C]J8
+D#S6DfTn.$?Tj#FCf?5Bl\-0D.RU,+=CW,A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
:-pQU-uNU?A18X0@q0(hFE8RCDJXS@@VfOj+>#/f@W-L&A0>]&F*)IGDe:,%BOPpi@ru:&+Dbb5
FE7lu:-pQUAoDL%Dg,o5B-:W'B6A'&DKKqBF(fK7Ch+YtAKZ#)C1UmsARmD&$4R>;67sBuF_t]1
Bk&8oFDl#;%16Ze+Dtb7A0<Q8$>"6#DIn$&+>XH6ATAo2ATqZ-?S`,uATAo2ATqZ-1,COA%16Ze
+Dtb7A0<jH1^se'EZf72G@VgN/iYjM2J"X#%16Ze+Dtb7A0<UO0d%S]+<VdL:-pQUFD,5.DKTf*
ATAo)+DG^98du,=EZf72G@VgQ@<+16$>"6#DIn$&+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[
3B9)[3B9*E%16Ze+Dtb7A0<T]1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU
3&_9R%15is/g,4\D.7F"F"AGVDJ<U!A7Zkm$>"6#DIn$&+EKRk+Du+>@;]LjAL@ooATAo2ATqZ-
FZLWmDJsZ8Bk)'lAStpnATK4.$4R>;67sBuF_t]1Bk&8oEcPT6F!)lO@;]UoD'3n5@;oe!+CT.u
+EM7CATK:0$>"6#DIn$&+=KH&5;Xf61FXS'%16Ze+Dtb7A0<9b-pKO;,;Ubo1CX\&EZf72G@VgE
5:A`Q.3gVt,[W>:$>"6#DIn$&+=KH&5;Xf61FXS)1G1Tq$>"6#DIn$&+=KH&5;Xf61FXS/C,?A,
ATAo2ATqZ--pK+E1asY*.3pW#3&roUAMQ(O$>"6#DIn$&+=KH&5;Xf61FXS/3&ilW3&iiU2`EZS
3B9)[3B9)[3B9)[3B9)[3B9)[3Htu?ATAo2ATqZ--pK+E1asY*.3pW&1,:XA1c.'I2E!KQ3&ioY
E]5s:3&`fU3&`fU3&`fU3&`fU3&`fU3&_9R%15is/g+_BE-,f*Et&IfEZf72G@Vh1/hd_AATAo2
ATqZ--RT?1ATAo2ATqZ-@6+i)ATAo2ATqZ-1*^3g%16Ze+Dtb7A0<ZQ@6+i)ATAo2ATqZ-0I/D+
3"64+EZf72G@VgM+>>&p%16Ze+Dtb7A0<QK0I/"q-OgDoEZf72G@VgM+>kE,-YddFF<G[:F*),6
B.",qATAo2ATqZ-2'=Rq1F+k$1a"df$4R>;67sBiDfTB"EboH-AKYJkF(KD%$>"6#DIn$&+>>l)
-QjNS+<VdL+<Ve%67sBtBm=3"+Cei$ATJ:fATAo2ATqZ--RUu'-Ta!k$>"6#DIn$&+=ANu-p0U>
@W-04.6An)%16Ze+Dtb7A0<Zi-RUu'-OgDoEZf72G@VgD-T`\'+<VdL+<VdL+AP6U+CT)'Df^"C
@rHC.ARfg)DKTc3+DtV)ALnsAF_kk:Ci<flFD5Z2%16Ze+Dtb7A0<6I4!uC;-RU#Z+<VdL:-pQU
@;Ke!F*&O7DfTl0@rri2F_kk:DIIBn/0JbI@psInDf.*KA8bt#D.RU,@<?4%D@HqaEZf72G@VgD
@W-044!uBu+<VdL+AP6U+Eh10Bk/?(@;TR,+Du=<C`mP4@psInDf-!kATAo2ATqZ--RUu'@ldk>
G[bT0-QjNS:-pQUDKTc3+DtV)ALnsI@;KXg+Dbt+@<?4%D@HqaEZf72G@VgD-T`\'4""WYF`JUG
@rHC!+CT.u+>,9!-Ql/N/g,%SCht53@;TR,Ci<flFD5Z2+E)$<A8bt#D.RU,@<?4%D@HqaEZf72
G@VgD+=B5u+=A9S+<VdL+AP6U+C].qDJO;&$>"6#DIn$&+=A9S-T`[u-T`[u-OgCl$;No?+D#R9
DIn$&+=D8BF*&cP+<VdL+AP6U+Du*?Ci<flFD5Z2+>"^XBPDN1@psFi+DGm+$;No?+Du*?Ci=3(
ATAo%DBNM2Ec5t@@3B)p@ruF'DIIR2+DGm>DJs_A@rc-hFCeu*Bl5&%+Co%q@<HC.%15is/g+\=
Eb/a&DfU+GCi<flFD5Z2+<W()@;^3rEd8c_0JG10%13OOATAo2ATqZ--XpLp+Cf(nEcW@.-OgDo
EZf72G@VgD0IeFZ$4R>;67sBsBkq9rGp%3SE,Te,$>"6#DIn$&+=D8BF*&ck-X:tDFDl+G+<XEG
/g+\FBm+&1Ch7^1ATAo6AT;j,Eb/bj$>"6#DIn$&+=D8BF*&ck-YR(3ALATC+<XEG/g,+AFD)e6
F`VXI@V$[&Df9`/A1Sj7/nZdZ+<Xp&ATD>k$>"6#DIn$&+=D4X4"#(s+<VdL+<VdL+<XEG/g)8\
+<h7%ATAo2ATqZ--Zip@F=0-t@le:7Eb-U@+AP6U+<VjN+q4ljEZf72G@VgDFCfN8-T`\c3[Z$m
+<VdL:-pQU+<hpP%16Ze+Dtb7A0<7AATMr@4""N!>ULX:+<Ve%67sB'Ec5l<ARlomF`\aDD]iS)
Eb/a&DfU+GDIIBn%13OO:-pQUBl8*&Ch[E&A9)C-AKYl!D.Rc2-r3baA7]^kDId<rF=@Y+ATAo2
ATqZ--Zip@F=0-tCi=3(G&M2>D.Pb5G^++EFBia">\S(\GA1qT2(&h?ATAo2ATqZ--Zip@F=0-t
@lcYUG^+=K>]!neH!FitCi=34>UKsfATAo2ATqZ--Zip@F=0-t@pD'>G][k/FE1f-F)Z&=ARo%U
Des?0>]X^iF(cp1$>"6#DIn$&+=D8BF*&ck-X8]WG][k/FE1f-F)Z&=ARo%UDes?0>]X^iF(cp1
$4R>;67sBPDK]H)Bk/>rBOPpi@ru:&F!,17+DtV)ATJu&DIal/@<?1(/e&._67sBKBk)7!Df0!(
Gp%!5D.Rc2@<,p%AoD^,ARloqEc5e;-QlW%/UC],0J,:j><siE>pg'g:-pQU@;]TuE+*j%F!,17
@r-9uAKZ).AKYDlA8-."Df0!"+Cf(nEa`I"ATDi7-r<3/84,pG;^ih3FD,B0%15is/g+kL+CQB:
F(&Zl+s:rL@WQ+&+E(j7FD,5.@q]:k@:OCjEcW@EF`;;<Ecbl'+C]U=D/XK;+D>\7FE9&D$4R>R
EZf72G@VgE-Z3iFCh[cu+D#G$F!iM+;Cj27Ch7$rALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN
+Dbb0AKYQ%A90+L6W-TI/15CQARTXk-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE-Z3iFCh[cu+D#G$
F!iM47P#p+Ch7$rALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L<'`i%-ZEm5
@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7A0<9JDJpY=CghBuATJu!+DG^9DIIBnF!iCu-Y#2BH?s[O
E$l)%%16Ze+Dtb7A0<7/@:WhcH#k>p-Y#2BH?s[OE$m2(;Cj23ATMo?%16Ze+Dtb7A0<7/@:Whc
H#k>p-Y#2BH?s[OE$m2(;G9P2-Z!@8F!hD(ATAo2ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/6"o%
/157FF)r]<$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\A-A5d>`CLoePB1?<D
CbRP<67sa+A5d>`CLoePB1?<DCbROcF=f'e@UX=l@j!1<A18X8DK]H)Bk/>pEbBN3ASuT4FCfN8
F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq4.FDkW"EZd(s
3B7NU:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0emQaFtu$"F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]G0d(UX
A79RkA0>K&EZdss3%cmD%13OO:-pQU<+ohcAoDL%Dg,o5B-:o+E-68D+EM47F_kS2Eb0<7Cige6
DBNM2Ec5t@D.Rd0@:s.m+=M,=G@W-T%13OO@rGk"EcP`/F<Dr?@<6!-%13OO0H`M$-o<).0I\,,
-V@0&6VKp7;GTqmBkhQs?RH9i0d&&/+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDmCh7$q+=ANG$4R>_
AT;j,Eb-@@C2[X)ATMs)E[M;':-pQUAU&0*@ruF&B-:epBl%p4ATJ:fFCfN8ASu[*Ec5i4ASuT4
-XpLp-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sB/De(:>@:NeYE--.DDf0B:+Cf58
@VfOj+>#/f@q]:k@:OCjEZf14F*&O5DIal!Dg5i(+Dbb5FE8Q6$;No?+E(j7@q]:k@:OCjEZf14
F*)IU+<X]nCh[E&A8,OqBl@ltEd8dF@;TRs+Dl7BF<G".F)N14G\M5@+E)-,$;No?+EV:.+DkP.
FCfJ8A8,OqBl@ltEd8dD@<6NC+<X*rATE'<BPD?s+D#A1AKZ&-Dfol,+C\n)Ecko(Cj?Hs:-pQU
Eb/us@ru9m/e&-s$;No?+Du==ATDKp+CTA1D0$-nATAo3A0<Q8$>"6#De'tH%16Ze+E(d5?S`,u
ATAo3A0<W`/iO4HATAo3A0<jH1^se'EZf:2+>GK.3B&j-1,KFIATAo3A0<UO0d%S]+<VdL:-pQU
FD,5.DKTf*ATAo)+DG^98du,=EZf:2+>dMI1^se'EZf:2+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[
3B9)[3B9)[3B9*E%16Ze+E(d50ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU
3&`fU%13OO:-pQUDKTf-EbT#+@<-BsH#k)VDJsD8DKTc3+ECn.A8c<-F(f!$ATJu&DIal2BmO?3
.1HVqEZf:2+=KE75:A`Q.3gVt,VTZ7ATAo3A0<9a3^5#W1asY*.3p\Y$>"6#De't=4utnV5;Xf6
1FXSV1CX\&EZf:2+=KE75:A`Q.3gVt,Vh/.2[p+*EZf:2+=KE75:A`Q.3gVt,WKNq%16Ze+E(d5
-pB[V-pKO;,;Ubo0ePFG2`>5&1^se'EZf:2+=KE75:A`Q.3gVt,WIbC3&ilW2`EZS2`E`W3B9)[
3B9)[3B9)[3B9)[3B9*E%16Ze+E(d5-pB[V-pKO;,;Ubo0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU
3&`fU3&`fU3&`fU3&`fU3&`f+$4R>;67sC%H#7#/Ci^_-DIal4DJ<U!A7ZllEb-A*DfT<$A7T7h
%16Ze+E(d5F#lE2F)Q8CDf028%16Ze+E(d5FZLWm@W-04%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63E+*6lA5dSjATMoH0MXqe.WAg+CLg@cEb0<50JFVk/M/)a@:O'qG%G]>
+DbJ,B4W2rBk)7!Df0!(GqKO5:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+EV19F<G+.
@ruF'DIIR2+=M>CF*)/8A2,bl0I\,UG\M5@F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130fX)]F>5T]$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]t
F_Pl-+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W;
0JG1.%13OOATAo3A0>u)Bk)6-+AP6U+E)41DBMhG5t"LD9N_f3%15is/g+,,BlbD=ATMr9Eb065
Bl[d++CT.1@:F;#Eb'!3+D>J%BHVM;Eb$;&Dfor>/e&.B0JG170H`J#,@k\.+=ANZ>9J!#Dg-//
F)rI7Bk/?8+>=63%16Ze+E1b!CLeQ0A8,Oq%13OO0d'[CF(fK9E+*g/+Co2,+DPk(FD)dEIS*C(
<(0_b0./;mA8,Oq/13)[@:O(qE$l)%%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?`JFA?7]AQ3A\
ATMs%D/aP_@<6-m0JH6g/h1g_FA?7]AQ3A\ATMs%D/aP_@<6-m0JFVk/M/)S@<6-m+Eh10Bk/>7
E-67O+DtV)AKZ)/D.Rd1@;Tt)+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z
0e"5R+DPk(FD)eG8l%iS78m/.A8-'q@ruX0Gp$d/F!+q'ASrW3ATTO6$;No?+<V+#:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M0JX(E:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#Y
Gqq3!F`:l"FCeu*AoD]48g$)G0K0FJ%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8
ATB.-$4R>;67sC)AKYl%ARlol+Cf>-Anbn#Eb/c(A8-'q@ruX0Gp!P'/M8.o>p(^[+DPk(FD**G
-[nZ`6rZTR<$r+^%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0
>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+CfG'@<?''DIn#7FCfN8+Co1r
FD5Z2@<-W9%16WfDIIBn4ZX]5FCfN8C2[W:-S-Z#1-[KK.=37"A8,RlF_tJoC2[Wi-RT?1A9;d!
FD*fu+=M>QCghBu11+I)De*2tC2dU'BHS[O8l%iS78m/5.4f"ODIIBn+:SZA0RI\KG@Vh,FDbN(
ANOFEE+*j%%13OO4tq>%A0>E)DIIBn%13OO:-pQUF*)>@AKZ&4D.Oi6DfTB0+>"^YF(oN)+A+#&
+F5/HDe!3lAKYE&+E(_(ARfg)F)Q2A@q?)V4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq
+>=o\:-pQUDJsZ8Et&I?0RG0n-QmANF<Du;+F>_i+>GPm4>%a$.3NME?[?'%0d%T667sBhA9MO)
@WMtc4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>P&^:-pQU@rH7"F`(]2Bl@m1%159Q
HRF+e+E2IF+=LM<HS0ai0ea_4/g)Af+Du"&H=%dN+<XEG/g,=KEaj)!$4R>;67sB\<'qd=@<?''
@;]TuFD5T'+AQK^C`l#aD0'f>Df021F*(u4E+NQ&Df-\>BOr<'Df9M&$>j^"DKBo2E'66)DJs`2
A7&b[De*2t0f_-P+?(Du0d&4o2)ZR2/hd_A%15is/g,4HF<GdGEb$;7Bl.F&FCB$*F!,RC+D,>4
ARlp,@;L't%17,c+Bos9Eap50FE8fm3Zp+!?SOA[B4Z0-I4cXQDJUFC-OgE#FE9T++=K?#,Wd`-
DKKqK,].I<DKBo2E%)nX0e%MnDKKq/$9g.j0Ha^W1a$a[F<GICEt&Hc$;No?+CoC5FD5T'F*(i-
E-!.=@<?!m%14J'@j#Z2F!j+3+>=pF0f1"cATT&C/g+\BC`k)Q%16rjDf0W<AT/bT+=oT/HZ!qH
%13OO:-pQUF(KG9@rH7"F`(]2Bl@m1+DbJ-FDuAE+EVNEAncL$A0?&(Cis:u$?BW!>9G;6@j#Z2
F!j+3+>=pF0f1"cATT&C/g)hj0d&4oA8Z3+-RT?1:-pQUFD5T'F!+t$DBND"+Eh10Bk/>uF`_bH
AKYMlFCfM&$?'B^D..'qDIksl+Du+AAn57WC2[Wi+>PW*2]sgt1,'h)+>=ol/heCj%16upF$2Q,
-p/n3HTNs/DKKqK+=oPr.!n!#4#))"FE8lVDdm-l@:sLrALS`M0e%MnDKKq/$9g.j0Ha^W1a$a[
F<GICEt&IO67sC&Bl.F&FCB$*F!,=BF*&OA@<?!m%14LF0mde[F"&4`3Zoht3[?dAHZ!qH.3KiZ
0d(=ODf0W<AT01]Ddm-l@:sLrAIStU$;No?+ED%8@;0U%FD5T'F*(i-E-!.9DBNJ4D/aP*$9g.j
A8lU$F<Dr/78uQE:-hB=-Ta$l$9g.jA7dtc+DkP&AKW?J%159QHSZd_A0<6I%13OO:-pQUF(Jj"
DIal-ATo8=ATMr9A8,OqBl@ltEd8*$A9;]tD.PIc3ZoelATMs.De(OL/1<5.5;=oBHQkL]Bk2+(
D-p^dDe*3&-OgDnFDtZ1BJM_3+=M>QCghBu11+I)De*2tC2dU'BHS[O8l%iS78m/5.4f"ODIIBn
1*@#54tq>$ATqZ-A9;]tD.PIaA9;d!FD*E=$9g.jDe'u$FDbN(AMO]%%15is/g+tK@:UKkF_u(?
De:,(Bl\9:+Co1rFD5Z2@<-W&$7I;V+Z_;++?DP+0KLX*HTG\L%14g4>9IEo@s)g4ASuT4-UC$a
@UX=l@lZP0-OgCl$;No?+CT)&+EV=7ATMs%D/aP=Ao_g,+C]82BHUi"@ruF'DIIR"ATJu2F`VXI
D..NrBFP;jF##m>+D58-@;Kb%F'i9K94)$u:IK,1C*52>$9g.jDe'u$FDbN(AKY2"1E^UH+=ANG
$?U>D4ZX]uATV?sCij`*?VO1#?V4*^DdmH(0F\A2F"ndh3ZrNc1(=R"$;No?+Co&)FE2;F+EV19
F<G+.@ruF'DIIR"ATJ:f4tq=>+ED%+A0>E)DIIBn+BosE+E(d5-RT?14tq=>+ED%+A0>E)DIIBn
1*@#50d'[CEc#i8Dfd+4FDtZ1BHR`k0d'[CEc#i8Dfd+4FDtZ1BJL#(%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6"48DBk'.`3F?f<F*(qZ@<6-m0JQ<h/h1mQF*(qZ@<6-m0JO\l/M/)S@<6-m+=M8AF*(qA+EV19
FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.
De(OU.3N2HBleB;%15is/g)8Z1+==o8l%iS78m/7+D,P.A7]d(@rH6sBkMR/ARl5W:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C9%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%15is/g)l'DJs\R3?WH`A79RkA0>K&EZdt502-(tFa+?&:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3
DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(:-pQU0fX#YGqq9#ARoLs
+D,P4+EMgLFCf<1+EqOABHU;M6QgPjCisT+Et&IO67sB83,N)L1GBq[A867.FCeu*FDi:3Eb/[$
AKZ)+F*&O8Bk)7!Df0!(Bk;?.Bl5sSC2dU'BHS[O8l%iS78m/5%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^
%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\
6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>QBk)6J3ZoelATMs.De(OU-OgE)E+X>X3ZoelATMs.De(4)
$4R>;67sC!E+No0@3BZ'F*&O8Bk)7!Df0!(Gp$O5A0>i"@r!3$F=n"0ATAo3A0>Ds@rr.eATAo4
@:O(`+Co1rF:AQd$;No?+Du+A+DG_7ATDl8F)Po,+Dtb6ATAo&AS,k$AKZ&*ASrW*F`(t;GAhM4
%15is/g+kGFDi:DBOr<.ATMr9A8,OqBl@ltEd98H$7Ke'GA^i+AN`'s-XeAR+<iihA8,RlF_tJo
C2[Wi+>>5e4ZX]A+?CVm1*A%hGpa%.ATAo8D/a<0@j#`5F<GI4GA^i+AISuXEaa$#+Dtb7DIIBn
%16Ze+EVI>Ci<f+B4Z0-DIn$0@;TQb$>"6dF(HJ3ATr$#D.O.`%15is/g,1GF*)>@AKZ).AKYr4
AThd+F`S[7@:O(qE$-_TBlkJ.De3u4DJsV>@rH7,@;0Tg$;No?+EV:.+Dtb7DIIBn%16Ze+ED%7
FCZM)Bk)5o$>sEq+D58-+Dtb7DIIBn%16Ze+>Y-YA0<6I%13OO:-pQU@q]F`CERY/F*)>@ATJu+
Ec5e;@<<W.ARTY%+EVgG+Eh[>F_t]2%15is/g,:XBl7Q+F`(o5F_)\+Bl[cpFDl2F+CT.u+Co1r
FD5Z2@<-W9DIIBnEt&Hc$;No?+Eh[>F_t\4BlbD9@<-H4De:,@8l%iS78m.p$;No?+Eh[>0g.Q?
-Y#1b%13OO:-pQU<DGn(E+*j%F!+n3AKYl/F<G".G@>c<+E2@4F(K62%15is/g,=UCbe.7+=CE!
E,K**0J[6]10eL2D.QseDeO#D0JG1cFCf<.-OgCl$;No?+APL&:`sk(ART?sAoD]4Ch[d0GT^F4
A0?&6CisT++Cf>-Anble$>sF!A8,Oq4ZX^-E+X>G+<iihA8,RlF_tJoC2[Wi+>=63ATAo2ATqZ-
DIn$&Bk)6H-u*^0FD)dEIS*C(<(0_b0./2"DIn$&Bk)5o$>sF!ATD<q@rsjp+EVR7GUss]3ZqsI
A8ZO,?X[\fA7$H5%13OO:-pQU<DGn(E+*j%Et&IO67sBlEZf72G@Vh6ATq^+DIIBn4*GOY1+XeX
FCf<.>UM(?ATq^+DIIBn%13OO:-pQUG&M2>D.OhE%16Ze+E(d5DIn$&Bk)5o$>"6#E+*6lA0>c$
G@YDtF:ARgEZfI@E,9H&+E2IF+=D&<GA^i+AL@ooATAo6ATMs(+Dtb7A8,Oq%16uaEZf"+F<GI4
GA^i+AISuXEZd.\De't<-OgCl$;No?+Eh[>F_t\41*BRl6Qg>VFD,_)$;No?+D#R9De'u.ATq^+
A8,Oq%15is/g+_G+E1b!CLeQ*ATq^+A8,Oq%15is/g+_G+EVI>Ci<f+E-67F-Z3L>DIIBn-OgDX
67sBlEZfC6F*(q8DIn$'Eb&loF:ARP67sBuATAo+ATT&4ATr$#D.O.`:-pQUATAnL+E(d5-RT?1
%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?fOF$a;G;f-GgAM>f567sa.G]Q2[A5d>`CLo1R+ET1e
+=M8TF"&5GDK]H)Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?
+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3G)i30ej+E:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1
:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>_AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,Rp
F!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd
3@>7C@rH(!F(KB6+=Cl<De(4)$4R=O$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$;No?
+D,P.Ci=N3DJ()%De*E%Ao_<mD.RU,+D58'ATD4$ATJu&Cht4BEd2XS+Eh10Bk/?(Df0-'E--@J
@rGmh+E1b2FCfK1Et&IO67sB'+ETb!+<Wij-nHKf+=LqV+>kSj4!6I)3$:4(4!67#1*AA%+=nWd
+F>t-2`i`:1*A@^$;No?+<VdT4<cI%IP)`s+F>:e+ET%T/0H?'+u(3h/g)hj0d(fe0d(Qe+=nWt
+u(3^%13OO%172fBk)6J3ZoelATMs.De(OU-OgE)E+X>X3ZoelATMs.De(4)$4R>;67sC%ARTUh
BHV8&FED)7DK?6oE+*iB0KhH>-XgIg0J,:nASH(*?"55k$?0Eq0JP^O+=CAt3b2r;BllCA>q793
$?0Eq0JYdP+=CAt3b2r;BllCA>q793$4R=O$;No?+DG_:@;KXg+DtV)AKYf'F*)I4$>sEq+E1b2
0JFViG]OuT-OgE#ATAo4@<=1W+ED^J+>=63DImi2E+*iB0HbC\F!*4\1*eUa$>sEq+E1b20JFVi
G]OuTB5_^!-T`\gDf9/64!uU3@UWdp%16uaEZf=0F>,BkEd2XJ1*A=t4=>#b-T`\t@:F%aF!hD(
%13OO:-pQUBl8*&Ch[E&E+*j1ATD[0%16uaEZcbYBeD1j4"qd9+>G;fEd2XJ4$"a-CERM'D.Rc2
@rHR#Dg<]>$>sEq+=JUHDf7!b0d&Ct1asPfG]Ouh3[\?PD/XK;+Cf>1Eb/a&+E)4@Bl@m1-OgCl
$;No?+Du*?H=_,8+E)4@Bl@ku$>sEq+=JUNDf7!b1a"b#0I\,bG]Ouh3[\c_Eb-A%Ci+*3F<G(3
EcP`$F<GL@FD5Z2F!hD(DImi20H`=t0HbC\F!*P*-Za2KG%G]>+C\bi-OgCl$;No?+EV19F<G.*
B4W2q@<6!&G@bf++EV:.+Co1rFD5Z2@<-W9@rH7,@;0V#+Du+>BPD?s+C]J8+Du+?DK?6o:-pQU
-usQR.3N/>ATJu3Dfd+CARTUhBHV22F`)7CAThX&+DGF1FD,62+CT;%+Cf(nEa`I"ATAn&$4R>;
67sBUDffPO+EV:.+FZpY6rZTR<$64"Dfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$B6A6+%15^'
6rZTR<)QLf<'<8bC2dU'BHS[O8l%iS78m/5%14g4>9IckCLq$jEaN6iDe*2t4A&C;<(0_b;GU(f
%15^'6rZTR<)QLf<'<8bFE;8,F(d=9@;9^k?Q_s:6rZTR<)QLf<"00D$;No?+CfG'@<?''ASlC.
Gp%!9G9CF1@ruF'DIIR2+>"^HBk2+(D'3P1F*2M7F!,1=+CoD%F)E@I+D#e3F*%iuA8XOkFDti:
/0[,cBk2+(D-p^dDe*2t-RT?1ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZf:2+Co@!$4R>;
67sBpDKBB0F<GI>FD,B+B-:Z+F<GI>F`)70$>sd)DD447-[B93BHV#2+DGm>FCf]=+C]J8+DGp?
@;0V$+EM+&EarcoA0>>m@psM$AKYl/F`&<L%16ukF`&os3Zr,h+>jT8DJsZ81-IZ@4C1&s0eb%!
-YI??A7]=k-OgE#DfoqR4ZX]I3[\fVF*)[MDImm2Gp%3?F*)[MFCfN8Gpa%.DJsZ81d*lB2E!I.
0d%qgC+^WC/g)qm1*A=p+:SZqDfoqT4ZX]3+>GQ(5;=iG%16ukF`'*#3Zr<YF`&lpDJsZ80fs8k
F`&rD$4R>REZfI@E,9H&+E2IF+?MV3DJsZ80Hb7OF`&oVDJsZ81*CIQF`&uXDJsZ81a$[SF`'&Z
DJsZ82CAq@%15is/g,%MFD,B+B-:f)F`(_4%16Ze+DtUu@6HXo-ZWjE-QmGSF!,l`+CoA++=ANG
$8<SX+>#Vs,X*r0DII'a%13OO:-pQUFD,5.A8,OqBl@ltEd8d;@<6!&2'?FJATJu3Dfd+8@<Q3)
F(fK4F<G"0A0>],DJ()6AU&<<%16Ze+=M2;F>,C12'=h#0e"5cG]OuT-OgDoEZccL@<=1W4#J->
+>YGhEd2XJ-RT?1DImi2-u`U:0JGRG+?1Ju.3NYUF!)hX%16uaEZccL@<=1W4#J-@+>YGhEd2XJ
-RT?1%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,Ed2Y(D/X3$0JH6g/h1mdF&QpoCLo1R+ET1e
+=M8TF"&5?EbBN3ASuT4F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'
+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8c:$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%
+=DV1:IJ/N;cGDlATMs.De(OU-OgDX67r]S:-pQU+<WEg+=M>CF*)/8A2#\d+Cf>-FCB'.+CT5.
Ec5o;Bjl*p+DkP/@q[!(@<?U&Ec,q@%15is/g)8Z+<Ve=DfQtBATMs7/g*n\9i*knBl8!7Eb-A&
F_PZ&+E(j7FCfN8+Co1rFD5Z2@<-W&$;No?+<VdL+<YB9F(KB6F!,OH@q[!(@<?U&Ec,qL%15is
/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX&hFtboc$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$;No?+>Glk@;[bX+CSek+EM47Ec`sNDf021A8bt#D.RU,+EV1>F<G[:F*)I4$;No?+>Glg
AR[AL+CSek+D#D/FEo!J@<?U&Ec*!O+D#D/FEo!>Bk)7!Df0!(Gp%3?F*)I4$4R>PDe!p1Eb0-1
+=CW,F(H^.$4R>;67sBpF!+(N6rZTR<$5[hDJ!TqF`M&(57IrO/g)Nj8l%iS78m/5+>#VsC2dU'
BHS[O8l%iS78m/5%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OO:-pQUF('6'+EMC<CLnW)Ddd0!FCfN8+EM%5BlJ08%15is/g,1E+Bos9Eap5.Ddd0T
D/X3$-TsL50d(+?F<EY+-Z!^0A5d>`CLqU!F*')YCi<`m;f-GgATVL)F>5-P$;No?+=MRh+u(3V
Ddd0TD/X3$.6T^7HTE?*+Dbt)A5d>`CLmq^:-pQU-o<).2)Qg*4$"a0@j#T+@:W;RDeio3%13OO
%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%15is/g+bECi"$6Bl7Q+@rGmh+D,Y&B5M3t
F<G4-DImisFCfM9@;Ka&-usQR.3NeBCh[E&DJsE(D/aTB+Cf>#AKYr#FED)7DK?6o:-pQU+<Ybh
/g)9#+=Jc`HQX_N/g*##+?L])+?1K(+?L]#+>P&q.3L/a/0K9s4#]5U+>P&q%15is/g)8Z-p/\-
+FYpc0Hb]d0d(Qe+=nW`4<cL&IP)`s+>G!c+u(3^.3L/a4<cL&F:AQd$4R>aA8,Oq4ZX]5FCfN8
C2[W:0II;:FDti:4ZX]5FCfN8C2[W1%13OO:-pQU:2b5c3ZrNXAKZFo:IJ/N;cFl[Df9_?D09oA
+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AISu=:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgD;
+Bot*@;BFbBl[QhC2[Wi+?W7l6rZTR<)QLf<"01,:IJ/N;cHXj:K0J<+EV[@@<6*;?X[\fA7$HO
:IJ/N;cHXj:K.c1%15is/g+YEART[l+D#D/FEo!HATo8-Bk)7!Df0!(Gp"[]A8,RlF_r78DKBr@
ATJu.F<G+4ATM`:F<G.>BleA*$=n$;3co=QGUt%"A8,RlF_tJoC2[Wi+=ANG$>"6#DIn$&+Co@O
8l%iS78m/`:JXq@A8Vh`ATAo3A0>E#%13OO:-pQUF(Jd#@q[!(@<?U&Ec,q-$?0Eq0JGXN+=CT,
>;.Wh@:a.kF^8K)%17&_F>,F43ZoeS><6;/B5)HK?!Ss.%17&_F>,I53ZoeS><6;/B5)HK?!Ss.
%13OO%15is/g+_BE--@JE+*j1ATD[0+EqOABHUl'E--@JA8,OqBl@ltEbT*+%16Ze+E(d5A8WMo
+>Y-YA0<6I%13OO:-pQUDf0B:+D#D/FEo!>Bk)7!Df0!(Gp$U*F(HJ9BOQ!*Eb0?8Ec,q@FCf]=
%16Ze+=JTb4#JH0Ed2XJ-RT?1%15is/g,%?D.Oi+BleB;+Dl7BF<G%(+Du+8ASlC.Gmt*uATAo6
G]P!U/g+\BC`k)Q%16uaEZcbX-Ta"2+ED^J+FPjbA8Z3+-RT?1DImi2-mpB(0e"5cG]P!U/g)kk
A8Z3+-RT?1DImi2-mpB(1+=>dG]P!U/g)nlA8Z3+-RT?1DImi2-mpB(1FXGeG]P!U/g)qmA8Z3+
-RT?1DImi2-mpB(1asPfG]P!U/g)tnA8Z3+-RT?1%15is/g+kGF(KB6+E(_(ARfh'+EMHDDIIBn
+Dbb5FE8R5Eb-A2Dfd+5D/aTB%13OO:-pQUF('6'+CT)&+A*c&+Dbt+@;KKtDdmHm@ruc7Bl5&)
D/aTB+EV19F<G+.@ruF'DIIR2%16Ze+=DI_+E2IF+Du"&H=%e//g)tn+:SYe$>"6#Ed2XJI4cXQ
DJUFC-OgDoEZcbX-Ta"2+ED^J+FPjbA8Z3+-RT?1ATAnA-RUu0+?(E!.3NYUF!,l`+CoA++=D4X
+AP6U+DkP)Gp%<LEb'56Bl5%AH79tXFCB33+EqOABHS[D-OgCl$<0Gm<)ZR^7QidT-nlc)+>>5R
$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQU:N1DiDf-[P3ZrKT@<,jk+D,P4+CT.u+ED%8
F`M@BAnc:,F<GF/FCSu,Bl5&8AU&<<%13OO:-pQU@UX=l@j#i(@<,jk+E(j7DJsE%Bl7@"Gp%<L
Eb$;7AU&;+$;No?+=M8TF"&5MDJXS@F(Jd#@q[!,AU&<<+>"^MB5VX.AKYGrDIIR2+Cno&@1<Q=
67sBkAS,@nCige6F!,(/EcZ=FD..NrBHR`kATAo4@<=1W+ED^J+FPjbA8Z3+-RU#G$4R>;67sC%
@;TQu@<3Q1Eb0E.Dfp+1$>"6#-u`U:0JGRB.3NYUF!,l`+CoA++=ANZ%16Ze+=M2;F>,C10H`;'
+ED^J+FPjbA8Z3+-RU#G$>"6#-u`U:0JGRB+?(Dt.3NYUF!,l`+CoA++=ANZ%13OO:-pQUF(Jd#
@q[!'Afu;9Eb$;6BQ%p5+CT.u+Dbt6B-:`'@s)X"DKI"CAU&<<%16Ze+=M2;F>,C10H`>(+ED^J
+FPjbA8Z3+-RU#Z+<XEG/g+b?EcZ=FD..NrBHVA0DfTqBFCf]=%16Ze+=M2;F>,C10H`=t0e"5c
G]P!U/g+\BC`k)Q+<XEG/g+b?EcZ=FD..NrBHVA0DfTqBFCf]=%16Ze+=M2;F>,C10H`=t1+=>d
G]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSuqF!,O;DfTqBFCf]=%16Ze+=M2;F>,C10H`=t1FXGe
G]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSu,@<-BsGp$O5A0>r,DfTqBFCf]=%16Ze+=M2;F>,C1
0H`A)+ED^J+FPjbA8Z3+-RU#Z+<XEG/g+b?EcZ=FD..NrBHV,0DJ()6AU&;+$>"6#-u`U:0JGRB
+?:Q!.3NYUF!,l`+CoA++=ANZ+AP6U+D,>.F*&OA@<?!m+Dbt6B-;;-G]XB%ATAnAE+*iB0KUs2
3?U(++ED^J+FPjbA8Z3+-RU#Z:-pQU@;Ka&D..NrBOu6-Ci=3(+EV1>F:ARgEZccL@<=1W4"qd;
+>YGhEd2XJI4cXQDJUFC-QjO,67sBhCht52@<?!m+CT;2@<iu(DIal+Df021FCf]=%13OO:-pQU
F(Jd#@q[!,ATMr9FCf]=%16Ze+=M2;F>,C10e"5cG]P!U/g)kkA8Z3+-RT?1%15is/g,4DD.Ohu
F!,FBAThd+F`S!!ATAnAE+*iB0KV!32^okiG]P!U/g)kkA8Z3+-RT?1ATAnAE+*iB0KV!32]sh(
+ED^J+FPjb0d("EC`k)Q%13OO:-pQUF(Jd#@q[!'Afu2,F*&OGBQ%p5+CT.u+Dbt6B-:`'@s)X"
DKI"CAU&<<%16Ze+=M2;F>,C10d&G)+ED^J+FPjbA8Z3+-RU#Z+<XEG/g+b?EcZ=FD..NrBHVA0
DfTqBFCf]=%16Ze+=M2;F>,C10d&Fu0e"5cG]P!U/g+\BC`k)Q+<XEG/g+b?EcZ=FD..NrBHVA0
DfTqBFCf]=%16Ze+=M2;F>,C10d&Fu1+=>dG]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSuqF!,O;
DfTqBFCf]=%16Ze+=M2;F>,C10d&Fu1FXGeG]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSu,@<-Bs
Gp$O5A0>r,DfTqBFCf]=%16Ze+=M2;F>,C10d&J*+ED^J+FPjbA8Z3+-RU#Z+<XEG/g+b?EcZ=F
D..NrBHV,0DJ()6AU&;+$>"6#-u`U:0JGRC+?:Q!.3NYUF!,l`+CoA++=ANZ+AP6U+D,>.F*&OA
@<?!m+Dbt6B-;;-G]XB%ATAnAE+*iB0KV!33?U(++ED^J+FPjbA8Z3+-RU#Z:-pQU@;Ka&D..Nr
BOu6-Ci=3(+EV1>F:ARgEZccL@<=1W4#%j<+>YGhEd2XJI4cXQDJUFC-QjO,67sBhCht52@<?!m
+CT;2@<iu(DIal+Df021FCf]=%13OO:-pQUF(Jd#@qZutEc6)>+D>=pA7]d(FCf]=F!,(5EZet.
EcZ=FD..NrBFP;[EZccL@<=1W4#/6-Ed2XJI4cWt+CoA++=ANG$4R>;67sC%@;TQu@<3Q1Eb0E.
Dfp+1$>"6#-u`U:0JGRD+?(_lEd2XJI4cWt+CoA++=ANG$>"6#-u`U:0JGRD+?(Dt.3NYUF!,l`
+>P'MDJUFC-OgCl$;No?+EM+&Earc*De:,)Ec6)>+EM47Ec`F4DIal+Df021A8bt#D.RU,+EV1>
FE7luATAnAE+*iB0KV$43%5tjG]P!U/g+\BC`k)Q+<VdL:-pQUAnc:,F<GF/FCSu,F(fK4F<G[:
G]XB%ATAnAE+*iB0KV$43$9q)+ED^J+FPjbA8Z3+-RU#Z:-pQUAnc:,F<GF/FCSu,F(fK4F<G[:
G]XB%ATAnAE+*iB0KV$43$9t*+ED^J+FPjbA8Z3+-RU#Z:-pQU@;Ka&D..NrBOu6-F(fK4F<G[:
G]XB%ATAnAE+*iB0KV$43$:"++ED^J+FPjbA8Z3+-RU#Z:-pQU@;Ka&D..NrBHU`(Eaa59@;]Tu
F(fK4F<G[:G]XB%ATAnAE+*iB0KV$43@Q(kG]P!U/g+\BC`k)Q+<VdL:-pQUAnc:,F<GF/FCSu,
Ci=3(+EV1>F:ARgEZccL@<=1W4#.p=+>G;fEd2XJI4cXQDJUFC-QjO,67sBmBl\9:+DkP/@q[!$
Df021FCf]=%16Ze+=M2;F>,C11*AS"1+=>dG]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSuqF!,:;
DJ()6AU&;+$>"6#-u`U:0JGRD+?:Q#.3NYUF!,l`+CoA++=ANZ+AP6U+CT)&+DkP/@qZunEcPT6
+CT.u+Dbt6B-;;-G]XB%%15is/g,4H@<,jk+EM[>FCcS.ART+\EZfI8G]\!LAoD]4Anc:,F<GF/
FCStn$>"6#-u`U:0JGRE.3NYUF!,l`+>Y-NDJUFC-Qij*%15is/g,4DD.OhuF!,FBAThd+F`S!!
ATAnAE+*iB0KV'52^okiG]P!U/g)qmA8Z3+-RU#G$>"6#-u`U:0JGRE+?(Dt.3NYUF!,l`+>Y-N
DJUFC-Qij*%15is/g,4H@<,jk+E(j7F*22=AKZ&-DfTqB@;]TuCi=3(+CoD#F_t]-F<G[:G]\!9
$>"6#-u`U:0JGRE+?1emEd2XJI4cXQDJUFC-QjNS+AP6U+D,>.F*&OA@<?!m+EM47Ec`FGAU&;+
$>"6#-u`U:0JGRE+?1Ju.3NYUF!,l`+CoA++=ANZ+AP6U+D,>.F*&OA@<?!m+EM47Ec`FGAU&;+
$>"6#-u`U:0JGRE+?1K!.3NYUF!,l`+CoA++=ANZ+AP6U+CT)&+DkP/@q]Fp+EM47Ec`FGAU&;+
$>"6#-u`U:0JGRE+?1K".3NYUF!,l`+CoA++=ANZ+AP6U+CT)&+DkP/@qZunEcPT6+CT.u+EM47
Ec`FGAU&;+$>"6#-u`U:0JGRE+?:knEd2XJI4cXQDJUFC-QjNS+AP6U+D,>.F*&OA@<?!m+Dbt6
B-;;-G]XB%ATAnAE+*iB0KV'53?U%*+ED^J+FPjbA8Z3+-RU#Z:-pQUAnc:,F<GF/FCSu,Ci=3(
+EV1>F:ARgEZccL@<=1W4#8!>+>PAgEd2XJI4cXQDJUFC-QjO,67sBhCht52@<?!mATJu1Df021
FCf]=%16Ze+=M2;F>,C11E\\#1FXGeG]P!U/g+\BC`k)Q+<XEG/g+S=C`mS'FCSu,@<-BsGp$O5
A0>],DJ()6AU&;+$4R>;67sC%ARTUhBHV/#@rcK1FCf]=F!,(5EZet.EcZ=FD..NrBFP;[EZccL
@<=1W4#AB/Ed2XJI4cX!+CoA++=ANZ%13OO:-pQUF(&os+CT=6E,oN5BlA-8%16Ze+=M2;F>,C1
1a"_++ED^J+FPjb1a$=HC`k)Q+:SZhEZccL@<=1W4#A'=+>G;fEd2XJI4cX!+CoA++=ANZ%13OO
:-pQUD/XH++EM+&Earc*D.-ppD]j.5G]\!L%16Ze+=M2;F>,C11asPfG]P!U/g)tn0d&5/+CoA+
+=CVG+:SZhEZccL@<=1W4#A'=.3NYUF!,l`+>b2q+>PesA8Z3+-XnGG+<VdL+<VdL+<VdL+AP6U
+ELt.AKYE&+E2@4G%kl;Et&IfEZccL@<=1W4#AB/Ed2XJI4cWj1a"M(<(0ng?X[\fA18X3DJUFC
@OE9@+<VdL+AP6U+ELt.AKYE&+E2@4G%kl;Et&IfEZccL@<=1W4#A'=+>G;fEd2XJI4cX!+>Fuo
2'?FIC`k*7-QjNS+<VdL+<VdL+AP6U+ELt.AKYE&+E2@4G%kl;Et&IfEZccL@<=1W4#AB/Ed2XJ
I4cWj1a"M(;c-4q@;9^k?R[+.DJUFC@OE9@+<VdL+AP6U+D,>.F*&OA@<?!m+EMO=+DkOsEc6".
$>"6#-u`U:0JGRF+?(Du.3NYUF!,l`+=K&h1+Z*b<(0nr@;9^k?R[+.DJUFC-QjNS+<XEG/g+S=
C`mS'FCSuqF!,(8Df$V<ASbpfF<GC.FCf\>D.-ppDfZ?pATAnAE+*iB0KV*62]sn*+ED^J+FPjb
-o<&%/58E.912QW:1%FEDe*3(+CoA++=ANZ+AP6U+CT)&+DkP/@q]Fp+D,Y4D'3n2Ch7*u+DkP-
CLh@-DBNe)@rcL/%13OO:-pQUF(Jd#@q[!'Aftr!@rcK1F(fK4F<G"0A0>],DJ()&De!p,ASuT4
FCf]=Et&IfEZccL@<=1W4#A'>.3NYUF!,l`+CoA++=ANZ+<Ve%67sBmBl\9:+DkP/@q[!+BQ%p5
+EV1>F:ARgEZccL@<=1W4#A'>+>G;fEd2XJI4cXQDJUFC-QjO,67sBmBl\9:+DkP/@q[!+BQ%p5
+EV1>F:ARgEZccL@<=1W4#A'>+>PAgEd2XJI4cXQDJUFC-QjO,67sBhCht52@<?!mATJu8BQ%p5
+EV1>F:ARgEZccL@<=1W4#A'>+>YGhEd2XJI4cXQDJUFC-QjO,67sBhCht52@<?!m+CT;2@<iu(
DIal2BQ%p5+EV1>F:ARgEZccL@<=1W4#A'?.3NYUF!,l`+CoA++=ANZ+<Ve%67sBmBl\9:+DkP/
@q[!$Df021FCf]=%16Ze+=M2;F>,C11a"e$0e"5cG]P!U/g+\BC`k)Q+<XEG/g+b?EcZ=FD..Nr
BHV,0DJ()6AU&;+$>"6#-u`U:0JGRF+?:Q".3NYUF!,l`+CoA++=ANZ+AP6U+CT)&+DkP/@q]Fp
+Dbt6B-;;-G]XB%ATAnAE+*iB0KV*63?U+,+ED^J+FPjbA8Z3+-RU#Z:-pQU@;Ka&D..NrBHU`(
Eaa59@;]TuCi=3(+EV1>F:AQd$4R>;67sBI@<6-m+=M8TF"&5QARTUhBHV/#FCSuqF!,R<AKYT!
EcZ=FE+*j1ATDZ2Bl5&%+EV1>F=n"0:-pQU<+oue+DGm>FD,5.A7]@]F_l.BDfBf4Df-[P/g(T1
%15is/g,4H@<,jk+EM47Ec`F4DIal+Df021A8bt#D.RU,F!,C5+EqaEA90;DATMs7/8'!AF`;CQ
F*22=ATJ:f:-pQUGA(Q*+EV:2Eb$;&De*E%BlbD6Ble?0DJ()6BOr;sAS,@nCige6F!*1[/KeY>
DIal%Bl\9:+E(b"F`MM6DI[5e$>"6#-u`U:0JPXC+?1emEd2XJI4cXQDJUFC-OgDoEZccL@<=1X
4"qd;.3NYUF!,l`+CoA++=ANG$4R>REZccL@<=1X4#%j;.3NYUF!,l`+>G!LDJUFC-OgDoEZccL
@<=1W4#%j<.3NYUF!,l`+>G!LDJUFC-OgCl$>"6#-u`U:0JPXE+?1emEd2XJI4cWt+CoA++=ANG
$>"6#-u`U:0JPXE+?:knEd2XJI4cWt+CoA++=ANG$4R>REZccL@<=1X4#8!=.3NYUF!,l`+>Y-N
DJUFC-OgDoEZccL@<=1X4#8!>.3NYUF!,l`+>Y-NDJUFC-OgCl$>"6#-u`U:0JPXG+?1emEd2XJ
I4cX!+CoA++=ANG$>"6#-u`U:0JPXG+?:knEd2XJI4cX!+CoA++=ANG$4R=O$;No?+Co1rFD5Z2
@<-W9A8bt#D.RU,F!,"3+Du+>+D>2,AKZ&-DfTqB@;]TuCi=3(+EV1>F:ARP67sBhDBNM-E--@J
-usQR.3L$a.3N&>B6A'&DKI"8DIdHk@<?(%+>"^WARTUhBHUi"@ruF'DIIR2+CoD#F_t]-F:ARP
67sC)BOu'(FD,5.DdmHm@rri'De*E%BlbCS%16Ze+=M/:F>,C12(9YgG]OuT-OgDoEZccL@<=1Y
4#J->.3KaRG]OuT-OgDoEZccL@<=1Y4#J->+>G;f+ED^J+=ANZ+AP6U+D,>.F*&OA@<?!m%16Ze
+=M2;F>,I32'=h#1+==gEd2XJ-RU#Z:-pQU@;Ka&D..NrBOu5o$>"6#-u`U:0JY^I+?(E!.3KaR
G]OuT-QjO,67sBt@<?!m+CT;2@<iu(DIal3AU&;+$4R>;67sBVE-,f4DBL\WD..NrBOu6-@;Ka&
E+*j1ATD[0/e&._67sC)BPD9o+E)4@Bl@l31E^^LFEMVA+EV:.+DkP/@qZunEcPT6+CT.u+EV1>
F<GX5FD5f.H"h//+DkP/@q]Fp/e&-s$;No?+AZruBl@l31--P!ARTUhBHUo*EZee.A0>o(FEMVA
+CT)&+DkP/@q]Fp+DG^9FCf]=Et&Hc$;No?+EM+&Earc*D.-ppD]j.5G]\!L@;]TuEb0?8Ec*".
Cht52@<?!mATJtB@rGmh+?(EWF!+(N6m-#OAmoguF=@Y+ATAnAE+*iB0KV*62]sk)+ED^J+FPjb
1a"Lq1,U1bDJUFC@OE9-$>"6#-u`U:0JPXF+?1K!.3NYUF!,l`+>Y-NDJUFC-OgDoEZccL@<=1X
4#8!>+>PAgEd2XJI4cWu+CoA++=ANG$>"6#-u`U:0JY^I+?(Du.3NYUF!)hX%16Ze+=M2;F>,I3
0H`:s1+=>dG]P!U/g+\BC`k)Q+:SYe$;No?+AZruBl@l31HHY"ARTUhBHUo*EZee.A0>o(FEMVA
+E1b2FCfK1+CT;2@<iu(DIal3AU&<<%13OO:-pQUF(Jd#@q[!%@:O=r+EV1>FE8R5DIal1ATW'8
DBNn,FED)7@N]c$@VfTu@;]TuFCf]=+EqOABHV/#FCSuqEt&IfEZccL@<=1W4#A'=+>YGhEd2XJ
I4cX!+>Fuo2'?FIC`k*7-Qij*ATAnAE+*iB0fq063$:"++ED^J+FPjb1E^4GC`k)Q%16Ze+=M2;
F>,F21E\\#1FXGeG]P!U/g)qmA8Z3+-RT?1ATAnAE+*iB0KV-72]sn*+ED^J+=ANG$>"6#-u`U:
0JY^D+?(E!.3NYUF!,l`+CoA++=ANZ%14Nn$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16Ze
AT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?ZLC4
B4Z0`D/X3$0JH6g/h1mdF(]'+;f-GgAM>e\F=f'eFCfN8+=M8TF(]'+.4ts&67rU?67sB/Ed2Y<
ATT@DB45mqATDi7FD,5.FCf]=F!,O8@<,jkARlomGp"MUG]P;d+=M8TF(]'+.3N>G+Du+>$;No?
+CT.1Bl8$(Eb8`iAKZ28Eb$dF<+oiaAKZ)+F*)IG@<,p%Bl8$(Ec,<%+<Yc;F*)IG+D>>(@q?d)
BOqNG67sB/8l%in@VR>7F*2),Bm;6;:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3N5:EcZ=F
FCfN8+CT>4F_u)>Bl@kr:-pQU+<WEg+EM+(Df0).FCfN8+CT>4F_u)>Bl@kr:-pQU+<VdL+<VdL
+<W9h/hRK+67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JPS"AR[>Q
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OL2U67sBpF!+(N6rZTR<$5[hDJ!TqF`M&(57/tp+=DV1
:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+O$?B]tF_Pl-+=CoBA9;C(FCfJ?$4:9]@r,RpF!,RA
E,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>/D
DeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&$;No?+>%q>78m/.;cH%\
<.->*$?Tfm@rsjp+=D8BF*)/8A2#\b$?U6!GWe)1-Zip@FD>`)-OL2U67sBUDffPO+EV:.+FZpY
6rZTR<$64"Dfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$B6A6+$;+)^<(0_b;GU(f4ZX^#E+*j%
+=DV1:IJ/N;cG+O0d'[CD..3kA8-'k@;9^k?Q_I':IJ/N;cHXj:K.Zn:IJ/N;cHXj:K0J<+EV[@
@<6*;?X[\fA7$HO:IJ/N;cHXj:K.Z.:-pQU@rc-hFCcS+D/aTB+Dtb7+Co1rFD5Z2@<-W9/KeS<
A8ZO,+DG_7F`M&7+DGp?A8c%#DC9NKAU%p1F:)Pr4Z[\(Ap>jN3b2r8DKTf'@;9^k?Q^^D$>"6#
DIn$&+Co@O8l%iS78m/`:JXq@A8V`cEZf:2+Co?s$;No?+=M8TF(]'+.3N29FD,6++ED%8F`MA@
+CT.1ATDg0EZf:@+CQC3Df]u6@Vg<4ASlC.Gp%-9DJL@M+=M,9D.P8?AU&;G+EV%$Ch3q\:-pQU
A8,OqBl@ltEd8d<De!p,ASuT4BlbD.D/aTB+>"^VATN!1F<G[6@VfTuASlC.GmZ;L4Wo)4+=&'n
0mb<:8OHHK:JO2R=^PTPDe*3+2]sh(+ED^JB4Z0l?V4*^DdmH(-RT6.:-pQUDJpY9@VTIaFE8RG
FDl22A0<HHAU&0*@ru9m+D#S6DfTn+DImi20d&Ct0d(L]F(]'+?XHE$6uQOL+FPjbA8Z3+-RT7=
ATAnK+?(Dt+ED^JB4Z0l?V4*^DdmH(I4cXQDJUFC-OOa&EZd.\2]sgtEd2Y<ATV9d8l%in@VR$6
/g+\BC`k)Q$>sEq+>b3"+>G!ZG]RM/FC/BI:IK,1C*7pW+CoA++=ANDDImi21a"_"0d(L]F(]'+
?XHE$6uQOL+FPjbA8Z3+-RT7=ATAnJ+?1Ju+ED^JB4Z0l?V4*^DdmH(I4cXQDJUFC-OOa&EZd+[
3$9puEd2Y<ATV9d8l%in@VR$6/g+\BC`k)Q$>sEq+>Y-"+>G!ZG]RM/FC/BI:IK,1C*7pW+CoA+
+=ANDDImi21a"b#0d(L]F(]'+?XHE$6uQOL+FPjbA8Z3+-RT7=ATAnJ+?:Q!+ED^JB4Z0l?V4*^
DdmH(I4cXQDJUFC-OOa&EZd+[3?U("Ed2Y<ATV9d8l%in@VR$6/g+\BC`k)Q$>sEq+>Y-#+>Y-\
G]RM/FC/BI:IK,1C*7pW+CoA++=ANDDImi21a"e$0d(L]F(]'+?XHE$6uQOL+FPjbA8Z3+-RT6.
:-pQUF*)>@AKZ28Eb$;7AU&;FF"&4`+E_a>DJ()#+A,Et+Cf4rF)rI4F!,[FEb$;6Dfp)1AI<!h
+=CT4De(4<E-67FDJWZgC2[Wi+>X?3:-pQUF(fK7Ch+Z%@<Q3)GAhM4+EV1>FE8RHBOQ!*D..Nr
BF8<k+EVjM4ZX]>+?(Dt+ED^JB4Z0l?V4*^DdmH(I4cXQDJUFC-OMOM4WkstDJWZgC2[Wi+>YGh
/M;Jp0Hb]d0d&Y&0d(fcFEhm7$;No?+EM47Ec`F4DIal+Df021A8bt#D.RU,+EV1>FE8R5Eb-A%
Cht5*D/aTB+CT.u+=M8TF(]'+.3NYBD/XT/F!*.ZCh7KsFD)e=AU&<<$>"6#FEhmj3Zp+!3$9pu
Ed2Y<ATV9d8l%in@VR$6/g+\BC`k)Q$8<SX+>#Vs,To8n0me"eF:)T"+EVjM4ZX]>+?1K!+ED^J
B4Z0l?V4*^DdmH(I4cXQDJUFC-OMOM1*A/0+=&'n+>J4bG]X:(EZfIKF?MZ-0H`=t1E^^_F(]'+
?XHE$6uQOL+FPjbA8Z3+-RT6T+>P&k3Zo[j4s2S,FEhm7$;No?+EV:.Eb-A-F!,@=+>=pVE-,f4
D@0-*/g,%CEZd%Y3$9mtEd2Y<ATV9d8l%in@VR$6/g+\BC`k)Q$4:?b+EVjM4ZX]>+?:Q!+ED^J
B4Z0l?V4*^DdmH(I4cXQDJUFC-OMOM1*A/0+=&'n+>J4bG]X:(EZfIKF?MZ-0H`@u1*CU^F(]'+
?XHE$6uQOL+FPjbA8Z3+-RT6T+>P&k3Zo[j4s2S,FEhm7ATAo8G]Z)0+>=ou+>Y-\G]RM/FC/BI
:IK,1C*7pW+CoA++=AND0H`+n/NP""+?go&HZXLS$49Np/g+tK@:UL%Df'&.F(fK4F<G"0A0>],
DJ()&De!p,ASuT4FCf]=$>"6#FEhmj3ZqsNC`k)Q$?UN74ZX^6/g,7\F:)T"+>=ot+E2IF+=M;E
FEfr0+EVjM+FAP[+=K?)/NP+uG]YAWHS-F*INTkWG]YAW/1r&--Z!L4AKZ)5FCB!%Gp$R7B6A8<
F(fK4F<G+*F(96)E-,f4DK?q;@;[G"ATAnI+?:Q`F`\`SChIj74ZX^-G]Y'TINTa]4>&3H/NP+u
G]YAWHS-F*INTkWG]YAW/1r&-4!6C7+<r!k-UDQb+EqaECER&'A0>c.+E2.*Gp$s4CLqQ0C11Uf
+CQC'F_kk:@W-NE+=A^67LBJt67sBmATVEq+C\bhCC4Wn+EVjM4ZX]>+?1K!+ED^JB4Z0l?V4*^
DdmH(I4cXQDJUFC-OMOM4WktjBQSJA/M8/"+F>:e+?go&HZXLS$>"6#FEhmj3Zp+!3?U%!Ed2Y<
ATV9d8l%in@VR$6/g+\BC`k)Q$8<Sc+<t]8FEeo[/g)hjHQk0e4s2S,FEhm7$;No?+E2IF+DkOs
Ec6"ADe:,8@<-X-DJ()6H#R=%D.@I*4ZX]C0FDZ=H#R=X3ZpO/0H_c\@r?BQD.@I*.=31S@r?B6
8lJ)T8PiAn@;9^k?S#/F=B&X9C2[Wi/58E.912QW:1%FEDe*3+=A;Ir@;9^k?S#,Q9OD4CDe*2^
ATAnM+E2IF+=K>r0d%klD.-ppD^QYY+u(2a3Zot++DEGND.@I*.3L2p+u(2f+=AT\/1r&^FEqh:
+=o,f4=<lj/g+\C+Du+>BPD?s+DkOsEc3(BAU&<<-OL2U67sC%BQ%p5+CT.u+Dbt6B-;&"@rcK1
A8bt#D.RU,F!+n3AKYQ$E--@4:-pQUDJsW.+D>\;+EV:.+DtV)AKYf'F*&OIF(KD8D.-ppD]j.I
E+O(tATAnM+?(Dt+ED^JB4Z0l?V4*^DdmH(I4cWj9gM-E:L@OFDe*3+0e?7#9OD4CDe*3(+CoA+
+=ANDATAo8G]Z)0+>b3#+>G!ZG]RM/FC/BI:IK,1C*7pW+=KrM6W-]e@;9^k?S!o_;c-4q@;9^k
?R[+.DJUFC-OMOM1*A/0+=&'n+>J4bG]X:(EZfIKF?MZ-1a"e$0d(L]F(]'+?XHE$6uQOL+FPjb
-quup;GUY.C2[Wi/28\S;+t>*C2[Wi.3N/=C`k)Q$8<SX+>#Vs,To8n0me"eF:&?^:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK"ATD@#E+No00FA.sDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,FCfN8F*)P6:-pQ_H[\qCI3<V`/Kf.HF*&NQH[\qCI46:[FEM%F%15is/e&._
67sB[BPDN1FCfN8+>,9!/hS8YDfT]'FED))+EV1>F:ARP67r]S:-pQU@<6L4D.RcL%15is/e&._
67sB'+AP6U+EM+9+DQ%:CERG3@ps1b+DtV)AKZ)5+EV19F<G[NE+KIc:-pQU+<W$b5s[eYEaa$&
3B9)Q5s[eXD/X3$3B9)I+Du9D-Z3L>FCfN8-OgDX67r]S:-pQU+<WBf+D,>.F*&OHATMr9@<6L4
D/aT2Df-!k:-pQU+<WEg+EM+(Df0).FCfN8+CT>4F_u)>Bl@ku$;No?+<VdL+<VdL+<VdZ/hSac
$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(i[IRJX5%15is/g+Y;
@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?+EV19F<G:8+Cf5!
@<*K"@<6!&BkAK0BPDN1Ao(mg+DGm>E,oN2ASuT4@;]TuF(KG9FDi9V%15is/g)hj4Wl.0+Z_;+
+?V#D:IIQD76sgI94)CJDe*3&%15is/g)kk/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$;No?+Cf5!
@<*J<-OgCl$;No?+EV19F<G:8+EV13E,Tc*Ed8dBF`(t;Ci<flCh4_@+Du+>+CT)&+A,Et%15is
/g,7IF*)IG@ps6t@V$[$ATDC$Ec#Au+DG^9C3=E0+Dbt+@;KLr+EMI<AKYi4F*&OFF`&=9DBNCs
F(Gdf@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_
5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&
-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO%15is/g)`m<(0_b
+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F;                                                        ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,Ls51bg+.+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>Ghu
1,U1/0H`)/+>Ghu2)l^51*AD-+?:Q%1E\D,+>Ybq0f'q,3?U%:+>ktu0f:(00H`)(+>Pes0f'q/
2'=V4+>bbp0f1"10d&2-+>kkr0f:(01E\G-+>P_q1,0n,2'=Y/+>Pes1,0n,2'=Y/+>c)$1,0n.
3$9q2+>Pht0ea_*2]sh3+>Yhs1,C%.3?U%7+>Yer0f'q-2BXb3+>Z##0esk+3?U%4+>Yhs0ea_*
2BX_1+>GYp3$9q7@W$!K@<6-m0JR$FF(o,,-t7(1.3N).@r$4++DtV)AKYf'F*&OHATMs7@W$!\
D/X3$0JFnaDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7@rH4'C/\tfCLo1RFCfN8+=L`<D/a5=+DtV)
AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)J5
Eb/[$ATVL)FC])qFD5Z2@<-'nF(96%@<?(%+D#D/FEo!$:IH=IATMr9A8,OqBl@ltEbT*+A7]RD
@<6-m0JG4j@<6-m+Eh10Bk/>7A7]R++EV19FE:u(F*)G@H$!V=FC])qFD5Z2@<-'nF(Aj'FE2;F
F!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?rBk1.ZDeio<0IUIGA18XBD/X3$+EV19FC]*,E)UUlCLpL`
Bk)'lAM>edA8-+(.3N/8F)Yr(Gp%$;+E_R9@rGmhA8Z3^D/X3$0JFncDJUaEF)>i2AKZ)+F*)J6
DJW6gDeioY@:O=r<+U;rF(8lp@r$-.FD,*)+CT)&+DkOsEc3(BAU&<<+Ceht+C\n)F('6'A0>;u
A0>r)ASrW"Gp"MGDJUb4E-#T46=FqL@k]WH@<6-m+=Lc>F(KGB+E1b0@;TRtATAo7ATTS8BOPdk
AKZ)+F*)J7A5d>`CLo1RF)>i2AKZ)+F*)IGDe:+?ARm54-uNI1ALq%qCghC+>qC)/G]YAWFCAWp
AKYPpBln',B4kdt;fm%kF)s#hB4Z0-@3B`)Ed8dD@<-!l+Du==@V'R&De:,9DfTB0B5DKqF$a;V
Bk&hN0k+R4Bk&86B5DKqF"&5RATMs7B5DKqF&QpoCLoeQF(o9)0JG1pDIdI%ARfg)@<6L(B5VQt
DKI">Aft`&Ddm-k+E_RAF`2A5A0>buD.Oi+BleA=DJsZ8F(]<-@WPIbDeioPDdtIT-td@7@WNt@
A8bt#D.RU,+D,Y&B5M3tF<G[:F*)&8E)UUlCLo1R-tdR>.3N,@ART[l+D#D/FEo!AEc6)>F(]N4
Ch[uX@<6-m0JR$FF(o,,FCfN8+D,P4+DkP$DBN\4A8Gt%ATD4$AKZ/-Eag.>B6%s-Blke=De*9h
AQ*GaCLonBH#kYn-u*[2@:s.#+Cno++DG_8ATDs&C`m4rDJjB7+C\n)DImHhFD5o0Ci<`m;f-Gg
ATVL)F>.NL@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+E(_(ARfh'+DG_8D]gHMATMs.De(OU.;Wp2
A5d>`CLqU!F*'-QDdd0!@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!,17FDi9MFCfN8C2[W:
0I^gV@:WnkD/`EjDeio<0P#<CE$043EbTK7+ED%0Ddd0jDJ()5D/X3$+EV19FE;8:@:XIkF*')i
0k>!.FD5Z2@<-X0Ddd0!0mFg_ATMr9A8,OqBl@ltEd;J>@:XIkF*')i11Y*/FD5Z2@<-X0Ddd0!
0mFfr+EV19F<G+.@ruF'DIIR2Ci<`mFCfN80JG:nBk)7!Df0!(H#.D-A0<UO+>Y-^ATMr9A8,Oq
Bl@ltEd;J>@:XIkF*')i1h:<1FD5Z2@<-X0Ddd0!0mFft+EV19F<G+.@ruF'DIIR2Ci<`mFCfN8
0JP7lBk)7!Df0!(H#.D-A0<T\GT^U4EcZ=FDfTB"EZf:4+DkP"DJ=38A7Zm*ATMr9A8,OqBl@lt
Ed;J>@:XIkF*',j0P"m-FD5Z2@<-X0Ddd0!0eb;++>RhF+E):2ATAo3Aftr!B5VF*F_#&+FCfN8
+Co1rFD5Z2@<-X1@;BFQFE1r6F"f:YF_u(?G%G]>+DbJ,B4W2rBk)7!Df0!(H#7G86=FqL@k]TH
BOt[h+=M)ECagK9@<6-m+D,b6@ruF'DKBZ4Cf>1hCLoePB6,a\-uEj<.3N\GD/a<&+Eh10Bk/>p
EbBN3ASuT4@q]F`CNFB)G@XWhDeioN@:VZEB6A'&DKKqR0PPEJ@;KXg+=M,=G@W-F@<-"'D.RU,
+EV19FE;A2;f-GgAO1?L7U^"I0JHsEF(o,,-uWWF+DG_:@;KXg+CT;'F_t]-F<G[:F*)JB@:O(`
;fm%kF)s#hE+*6l+Eh=:Gp$p3EbAr+A8,OqBl@ltEd;VHFA?7]AQ3A\ATMs%D/aP_@<6-m0JHsE
F(o,,G%#3$A0<:>F`]&TDIIBn+EV=7ATMs%D/aP=FCfN8F)ki5FC[^HF(o,<0k+R4Bk&86Eb0<6
A18XCATMs7Ed2Xl@:W;RDeio<0IUsdF"&5GDK]H)Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)JDG]Qf#
Deio<0IUsdF"&5?EbBN3ASuT4F)>i2AKZ)+F*)JDG]RM/FAm$pCLo1RFCfN8+=M8TF(]'+.<K-B
FE;PH@WZ1&F<DuYIT1cE.3N\RF^b                                              ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A>13&NT:1,'h++>Pi53&2U21a"Or2E!NT+>PVn1*AS31*A;++>P&p1H705
0esk,+>PZ+1*A;*+>P&o3ANEH+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1cRE:
0ea_*+>u,73?U%7+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bpj00f^@3+>l,9+>Get
1*A;-2Dn*&6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`
F_tT!E]P=#2]s52@<?'A+>b35F_i0U0JPF-0JGOB1HI6N%13FL:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.7+A-cm+>PW*2'=S5
3]/cU1cPgL$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>G_r8p+qm1,(F?+>>f:2)[KN2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU0f:(GF_i0U0JPF-0ebXB1cdEL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp.9+A-cm+>PW*2'=V/
3\r`V0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2]s52@<?'A
+>Get8p+qm1,(F?+>GW41bh$H2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU0fL4IF_i0U0JPF-0f1pH1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Gu$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh0d')2C`kJe0f:(.
0fh!I3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh0d')2C`kJe0f:(.0fh$F3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>GVo+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\r`&$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh1E];4C`kJe
0f:(.0fh'G3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>G_r
+@KX[ANCqh1a#D5C`kJe0f:(.2**NQ3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh1a#D5C`kJe0f:(.2**QJ3\r]%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/]#
$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp.:
+<X'\FCdKU1,L+GF_i0U0JPF-0fD'I1cd<G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`L$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$F
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1-$IL
F_i0U0JPF-0ebXB1-.0L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's
3Zp15+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-0KD0K2``WL
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp4$+@KX[ANCqi+@1-_
+>PW*2'=V-3\iTS1GT:E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
1a!o/@<?'A+>Y-+F_;gP0JPF-0ek^D3BArQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0JWtB$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Y-+F_;gP0JPF-0ek^G2**HI$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp@(+@KX[ANCqi+@1-_+>PW*
2'=V23\WBO2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS3$9>3
@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)5LG$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>k9-F_;gP0JPF-
0fD'K3BAlQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\
FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f'.D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I2$sZt:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>t?.F_;gP0JPF-
0ek^E1cdKQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU2BY;.B-8r`0f:(.2EE]O3\WQ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fB@G$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp@(6$6f_1,(F?+>>c91,CsG1^XQs:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+?(E/F_;gP0JPF-
1,1gH1HI9M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp13+<X'\
FCdKU3?UV1B-8r`0f:(.0KLsE3]/]#$49Np/g+)<F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KLsL3\W>s$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqo+@1-_+>PW*2'=V-
3]/ZR0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
0ea_9F_;gP0JPF-0K;*M3BAlM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>P&^6t(1K3Zp.2+@1-_+>PW*2'=S53\`EO1G]@F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1("?q:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT
3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo
6$6f_1,(F?+>G]61c7<J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3Zp4$+@KX[ANCqg1*Al*B-8r`0f:(.1cdHQ3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<G
+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K1cd<G$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J1^XQs
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqk+AZKh+>PW*
2'=V13\`BN0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0ea_>ARZc;0JPI.0f1pG1HIBN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+?1Jd6t(1K3Zp.6+AH9b+>PW*2BX_03\WKR1,91D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmM+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(F@+>GZ51c7<N1C=Hr:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f1"I@<*JG0JPI.
0f(jI2``WL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqh0Ha(uEZd+k0fC./0fh*F3\iW$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&
+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U0f]RJ$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmM+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>PVn9jr&b1,(F@+>GT32).-G2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqo+A-'[+>PW*2]sk1
3\`WU2)5LG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
3?Uq&DBL\g0fL410fh'G3\`K!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp18+@]pO+>PW*2]sh33\W9L0f'.D$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,U1DARZc;0JPL/0f1pJ0fh*M
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp18+@]pO
+>PW*2]sh33]/TP1,]IH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%
+<X'\FCdKU1,U1DARZc;0JPL/0f1pK2**TP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp18+@]pO+>PW*2]sh43\W6K1-#[K$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1,U1DARZc;0JPL/0fD'J3BArU$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2'>A"@N[E[
0fL402EEWJ3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0ejdn
6t(1K3Zp18+@]pO+>PW*2]sh53]&ZS1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<t1*@]-@<?'A+>Pes7V-$O1,(FA+>Gf90JbaI3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Pku7V-$O1,(FA+>PW31c%0L1C=Hr
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>Pku7V-$O
1,(FA+>PW31c7<O2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`<L2)P^J$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[
0fL410fh$G3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`As$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU1E]D#EZd+k0fL403'&lR3\iQ"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0eskG@<*JG
0JPL/0f1pH0KLsC$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*B;"
EZd+k0fL401cdEP3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU0eskG@<*JG0JPL/0f1pJ1HI<L$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>GYp9jr&b1,(FA+>P`60JGOA3=6*#
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5
+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3ZpC)+@KX[ANCqg1E]D#EZd+k0fL411HI6K3]/]#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f'qH@<*JG0JPL/1,CsH0fh-O
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K
3Zp.5+AH9b+>PW*2]sk33\iQR1-#[K$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#T$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.5+AH9b+>PW*2]sk3
3]&WR0f'.D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU0f1"I@<*JG0JPL/1,1gE0fh!H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b+>PW*2]sk13\iQR1cPgL$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG
0JPL/1,1gF2``ZK$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0fC-s6t(1K3Zp.6+AH9b+>PW*2]sk13\rNP2)YdK$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU0f1"I@<*JG0JPL/1,1gG2``cU$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp.6
+AH9b+>PW*2]sk13]&NO1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI0fh$H$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp.6+AH9b+>PW*2]sk13]/ZR
1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\
FCdKU0f1"I@<*JG0JPL/1,1gI2```K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0ej"B$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0f:(J@<*JG0JPL/
1,1gF0fh$D$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
1,L*r6t(1K3Zp.4+AH9i+>PW*2]sk13]&]T1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0eskG@<itN0JPL/1,:mF1cdEI$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp.7+AH9i
+>PW*2]sh63]/lX0Js1E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3M1HI<K$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.8+AH9i+>PW*2]sh73]&]T1,0+C
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU
0fC.K@<itN0JPL/0fV3N3'&lP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1GBpo6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3$:h9DBL\g0fL410KLpF
3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-
@<?'A+>Pr";e9nj1,(FA+>PW30JPUD0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Yer+@KX[ANCqk+A-'[+>PW*3$9q83\iBM2)#@E$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp48+<X'\FCdKU1,^7I@;[2C0JPO0
1,:mI1HI<H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp19+A-'[+>PW*3$9t43\W?N2)5LG$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2]t_$DBL\g
0fU:11-.3O3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,g=J@;[2C0JPO00etdH3'&`O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgF3=6*#:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$9jr&b
1,(FB+>>f:2)I?O3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r
@V'R@+?(Dc6t(1K3Zp.7+AH9b+>PW*3$9q83\`KQ1cYmM$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*3$9q03]/iW2)GXI$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se
+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.2+<X'\FCdKU2]tD*EZd+k0fU:10fh$C3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+?(E/E,m'V0JPO00ek^D1-.*L$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp@(
6#^ie1,(FB+>GT30f;!K3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0ea_9E,m'V0JPO00fV3K0fh*F
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp.2+@0se+>PW*3$9q83\`HP2)>RH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f^@BE,m'V0JPO00fV3M1cd?G$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t4
3\`QS0KBII$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K
3Zp14+AH9i+>PW*3$9q93\rZT1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+<X!nBl%<&
:3CD_ATBgS0f^@!6t(1K3Zp14+AH9i+>PW*3$9t13\WHQ0Jj+D$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*3$9t13\iTS1cPgL$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB
+>PZ41c%0H0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,C%I@<itN0JPO01,:mE1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!Y
A0=WiD.7's3Zp4$+@KX[ANCqh1E]D#Gp"jr0fU:21-.-I3\r]%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp16+AH9i+>PW*3$9t33\iEN1,'%B$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB
+>P]51,h6J1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU1,L+J@<itN0JPO00fV3L2``cT$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!Y
A0=WiD.7's3Zp@(+@KX[ANCqh2BY_&Gp"jr0fU:12``WQ3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp19+AH9i+>PW*3$9q83\iHO0K'7F$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB
+>Gi:0fD'H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>Pku9jr;i1,(FB+>Gi:1,M$J2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8o=+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>Pku9jr;i1,(FB+>Gi:1H.?M0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i1,(FB+>Gl;2).-K0FA-o
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i
1,(FB+>>f:2)[KQ2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqh3?V%)Gp"jr0fU:13'&cJ3\iZ%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Y\o9jr;i1,(FB+>Gi:0ek^F0a\6p
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>G\q+@KX[ANCqi
0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3b
Ch+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i1,(FB+>Gl;0fD'H1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh+A-co+>PW*3$9q13]/oY
1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\
FCdKU1*B23DBL\g0fU:11-.*K3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,
+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>P'3F`&<W0JPO00etdE1cd<I$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-co+>PW*3$9q1
3\iKP0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU1,C%FF`&<W0JPO00ek^G1-.9O$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3
+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp19+A-co+>PW*3$9q83]/TP0fB@G$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp44+A-co
+>PW*3$9q23\W?N0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&
:3CD_ATBgS1,C$q6t(1K3ZpF*8p+qm1,(FB+>Gi:1c7<J3!p!":-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+?:Q:F_i0U0JPO00fV3O0KLmC
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/S6+J6?R!YA0=WiD.7's3Zp18+<X'\
FCdKU3?Uq:C`kJe0fU:13BAlK3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9
Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqo+A-cm+>PW*3$9q93\`WU0f]RJ$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*
3$9q73\rQQ1,91D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!nBl%<&:3CD_
ATBgS1,pC!6t(1K3Zp4$:LeJh1,(FB+>GZ51,CsH1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8u?/KeS8FtIJP+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Y-9@rrhK0JPO00f(jG2``fR$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's3Zp44+<X'\FCdKU
2BYe*F<E=m0fU:11HI6M3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`d
F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCql+AZKh+>PW*3$9q33\iHO1,'%B$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU3$;",F<E=m0fU:13'&iO
3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.
@<?'A+?:Q?@rrhK0JPO00f_9M0fh*G$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3ZpF*:LeJh1,(FB+>Gl;1,V*I2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqg1*BA&F<E=m0fU:1
2EEWR3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!
2BX,1@<?'A+>GVo:LeJh1,(FB+>Gf91c%0M2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yr!+@KX[ANCqg1*BA&F<E=m0fU:12``fU3]&Z#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!3$9>3@<?'A+>GVo:LeJh
1,(FB+>P`61c[TS1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P=!
3?TG4@<?'A+>GYp:LeJh1,(FB+>>c92)mWP1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?
+@:3bCh+Y`F_tT!E]P="0H_K+@<?'A+>G\q:LeJh1,(FB+>GT31,h6O2$sZt:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="0d%T,@<?'A+>G\q:LeJh1,(FB+>GT32)%'F
0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="1*@]-@<?'A+>G\q
:LeJh1,(FB+>G]60ebXD3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp1:+AZKh+>PW*3$9q53\iTS0K9CH$;No?+B*Q,FCf;M+A,Et+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCql+AQiu+>PW*3$9q33]&ZS1H>dL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqn
+A-'[+>PW*3?U"93\iWT1c5UI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!Y
A0=WiD.7's3Zp7%+@KX[ANCqg0d'(sDBL\g0f^@21HI3H3\WN#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0ejeC@;[2C0JPR10fD'K1-.0G
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A
+>P_q8muT[1,(FC+>Gc80JPUB2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%no
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp17+A-'[+>PW*3?U%43\`TT1,'%B$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh3$:h%DBL\g0f^@21cdEM
3\rW#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU1,pCK@;[2C0JPR10f1pK3BAlO$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,
+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1;+A-'[+>PW*3?U%63\W6K2)bjL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,pCK@;[2C0JPR1
0fD'H1HI3E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS
0esjo6t(1K3Zp1<+A-'[+>PW*3?U%93]/`T0f04E$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0eje?ARZc;0JPR10ek^G2**EL$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.3+@]pO
+>PW*3?U%73\`<L1,TCG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.7+<X'\FCdKU0esk@ARZc;0JPR10ek^C0KLmA$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.4+@]pO+>PW*3?U%53]&NO0f9;1
:IJ/X:J=\R<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp:=+<X'\FCdKU1a#D5C`kJe0f:(-0KLpE3\iAu$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3$9>3@<?'A+>t?7F_i0U0JPF-0ek^E1cdBM
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=#3?TG4@<?'A
+>G_r8p+qm1,(F?+>>f:2)REO3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2D?6r6t(1K3Zp.7+A-cm+>PW*2'=S53]/fV1,fOI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>tqs+@KX[ANCqg2'>M6C`kJe0f:(.0KLmE
3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=9+<X'\
FCdKU0fL4IF_i0U0JPF-0ebXG3'&cM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=$1E[f.@<?'A+>Get8p+qm1,(F?+>GW41H7EL2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DcO!6t(1K3Zp.9+A-cm+>PW*2'=V/
3]&QP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u)"
+@KX[ANCqg2]t_8C`kJe0f:(.1cdBK3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp==+<X'\FCdKU0fL4IF_i0U0JPF-0fM-I0fh$J$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2]s52@<?'A+>PYo8p+qm1,(F?
+>GT30K2$J1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2E2g%6t(1K3Zp14+A-cm+>PW*2'=V.3\`EO1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>u5&+@KX[ANCqh1E];4C`kJe0f:(.0KM'I3\rc'$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@8+<X'\FCdKU1,C%FF_i0U
0JPF-0ek^E0fh-N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=%0d%T,@<?'A+>P_q8p+qm1,(F?+>GT31,CsI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_lKu6t(1K3Zp17+A-cm+>PW*2'=V23\r`V1cYmM$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?))!+@KX[ANCqh1a#D5
C`kJe0f:(.2**QJ3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp@<+<X'\FCdKU1,L+GF_i0U0JPF-0f;!K3BB#S$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2'=#0@<?'A+>Po!8p+qm1,(F?+>G`71cRNM1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`;d$6t(1K3Zp1;
+A-cm+>PW*2'=V23]/WQ0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+?)5%+@KX[ANCqh3?Uq:C`kJe0f:(.0KLmC3\iW$$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@@+<X'\FCdKU1-$ILF_i0U0JPF-0ebXG3'&fP
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU
1E\u+B-8r`0f:(-3'&iO3\r`&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$6$6f_1,(F?+>GQ21,_0L1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>Y-+
F_;gP0JPF-0ek^D3BArR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU1E\u+B-8r`0f:(.0fh*G3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.3]&]T0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp4$6$6f_
1,(F?+>G`70JkgJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS3$9>3@<?'A+>Y-+F_;gP0JPF-0fD'L1-.*L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/l=+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1a#),B-8r`0f:(-3BAiO3]/]#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU2'>2-B-8r`
0f:(.2EETP3]&`%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU2'>2-B-8r`0f:(.2EEWS3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2BY;.B-8r`0f:(-3BAiP3\`>r$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU2BY;.B-8r`
0f:(.0KM$N3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp.6+<X'\FCdKU2BY;.B-8r`0f:(.0fh$H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU2BY;.B-8r`0f:(.0fh'H3]/l($49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU2BY;.B-8r`
0f:(.2EE]O3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU2BY;.B-8r`0f:(.3'&iN3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN3\`K!$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU2]tD/B-8r`
0f:(/0fh-I3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's
3Zp13+<X'\FCdKU3?UV1B-8r`0f:(.0KLsE3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp14+<X'\FCdKU3?UV1B-8r`0f:(.0KM'H3\`Dt$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*
2'=S43]&iX0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>GPm6$6f_1,(F?+>>f:0f(jH1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmL+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>GQ21,(aG1C=Hr:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0eje:F_;gP0JPF-
0K;*M2``]R$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqg1*Al*B-8r`0f:(.1cdHN3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+@1-_+>PW*2'=V13]&fW1,'%B$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<G+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>G!;AT/bI0JPF-0fD'K
1cd<H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[
ANCqg+B)ij+>PW*2'=V33]&QP1c5UI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.-D$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0H`hr@N[E[0fC./1cd?I3]/f&
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
1a#M$EZd+k0fC./1HI?O3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqh0Ha(uEZd+k0fC./0fh*F3\i]&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh0Ha(uEZd+k0fC./0fh-L3\iAr
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh
0Ha(uEZd+k0fC./0fh0H3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>Fu]6t(1K3ZpF*8muT[1,(FA+>PZ41,(aC2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU3?Uq&DBL\g0fL410fh'G3\`N"$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Y,_6t(1K3ZpF*8muT[
1,(FA+>PZ41GCjD2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1,U1DARZc;0JPL/0f1pF0fh$I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh2'>A"@N[E[0fL401cdHJ3]/]#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp18+@]pO+>PW*
2]sh33]/TP1GoLH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Pes7V-$O1,(FA+>Gc81GCjF2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibp7+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1,U1DARZc;0JPL/0fD'L1cdBN$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2'>A"@N[E[0fL40
2``WK3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,g=FARZc;0JPL/1,(aG1HI?M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8c9+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>Pku7V-$O1,(FA+>PW31c7<O2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1:+@]pO+>PW*
2]sk03]/WQ1H,XJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`
F_tT!E]P<t1E[f.@<?'A+>Po!7V-$O1,(FA+>PZ40ebXG2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh3$:\%@N[E[0fL410fh$G
3\rT"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS
1*@]-@<?'A+>Y-7@<*JG0JPL/0fV3M2EEQL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$9jr&b1,(FA+>Gi:1c7<L2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
1*B;"EZd+k0fL401cdBG3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo9jr&b1,(FA+>G]61Gh-K1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg1*B;"EZd+k
0fL401cdEN3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS1a!o/@<?'A+>GVo9jr&b1,(FA+>G]61H7EP1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqg1*B;"EZd+k0fL401cdHL
3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
2BX,1@<?'A+>GYp9jr&b1,(FA+>P`60JGOB0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg1E]D#EZd+k0fL411HI3K3]/`$$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A
+>GYp9jr&b1,(FA+>P`60fD'M1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1E]D#EZd+k0fL411HI9G3]&i($49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.5+AH9b
+>PW*2]sk33\iQR1GB.C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>GYp9jr&b1,(FA+>P`61H@KR2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f'qH@<*JG0JPL/
1,CsJ1HI6I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>GYp+@KX[ANCqg1a#M$EZd+k0fL410fh$D3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.6+AH9b+>PW*2]sk13\iQR
1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>G\q9jr&b1,(FA+>PZ41,h6K1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU0f1"I@<*JG0JPL/1,1gG1-.9N$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[
ANCqg1a#M$EZd+k0fL410fh*L3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp.6+AH9b+>PW*2]sk13]&NO1cYmM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>G\q
9jr&b1,(FA+>PZ42)73J1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI2```L$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqg1a#M$EZd+k
0fL411-.*E3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS1,9sp6t(1K3Zp.7+AH9b+>PW*2]sk13\iEN0es(C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>GVo9jr;i1,(FA+>PZ4
1c7<M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp17+<X'\FCdKU0eskG@<itN0JPL/1,:mF1cdEI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes+@KX[ANCqg2'>V%Gp"jr0fL402``fU3\WH!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t
6t(1K3Zp.8+AH9i+>PW*2]sh73\rQQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>Gbs9jr;i1,(FA+>Gi:1c7<L0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU
0fC.K@<itN0JPL/0fV3N3'&lQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqi+A-co+>PW*2]sh13]&`U1H>dL$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>Po!8p,"o
1,(FA+>PW30f1pJ1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp45+<X'\FCdKU1-$IUAT/bI0JPL/1,(aC0fh'E$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqk+A-'[+>PW*3$9q8
3\iBM2),FF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU1,^7I@;[2C0JPO01,:mI1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp19+A-'[+>PW*3$9t33]/ZR1G]@F
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,^7I@;[2C0JPO01,CsF1HIBL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp1:+A-'[+>PW*3$9q23\rcW0Jj+D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1,g=J
@;[2C0JPO00etdH3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp17+@]pO+>PW*3$9q03\WBO1,'%B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1E]D#EZd+k0fU:0
3BB#T3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS2]s52@<?'A+>G_r9jr&b1,(FB+>Gi:0f;!L0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqm+@0se+>PW*3$9q03]/iW2)P^J
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\
FCdKU2]tD*EZd+k0fU:10fh!G3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0
+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp@(6#^ie1,(FB+>GT30ebXE2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU2]tD*
EZd+k0fU:10fh$E3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS0esjo6t(1K3Zp@(6#^ie1,(FB+>GT30f;!K3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU2]tD*EZd+k0fU:1
0fh$I3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS0f1!q6t(1K3Zp.2+@0se+>PW*3$9q83\`?M1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>GPm6#^ie1,(FB+>Gi:0f1pK
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.8
+<X'\FCdKU0f^@BE,m'V0JPO00fV3M1cd?H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh1E\u&EZd+k0fU:21HI6L3\`;q$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nG
@<itN0JPO00f_9N2EEZN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`
F_tT!E]P<t3?TG4@<?'A+>PYo9jr;i1,(FB+>PW30K(sG2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AH9i+>PW*3$9t13\iTS1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp16
+AH9i+>PW*3$9t23]&WR0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&
+AR&r@V'R@+>P&^6t(1K3Zp16+AH9i+>PW*3$9t33\W?N1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp16+AH9i+>PW*3$9t33\`KQ1H,XJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp16
+AH9i+>PW*3$9t33\iEN1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp16+AH9i+>PW*3$9t33\iWT0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp17+AH9i+>PW*3$9q83\iWT1cYmM
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp19
+AH9i+>PW*3$9q73\WQT1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&
+AR&r@V'R@+?1Jd6t(1K3Zp19+AH9i+>PW*3$9q83\iHO0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp1:+AH9i+>PW*3$9q83\`NR0ej"B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh
2]th'Gp"jr0fU:13'&fO3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!Y
A0=WiD.7's3Zp.3+<X'\FCdKU1,g=M@<itN0JPO00fV3M2``]L$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8o=+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku9jr;i1,(FB+>Gl;2).-K
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpL+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K
3Zp1;+AH9i+>PW*3$9n83]/fV2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRo
A7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>Pr"9jr;i1,(FB+>Gi:0ebXD3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1GBqG
@<itN0JPO00fV3K0fh*G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%no
F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqi0d'2!Gp"jr0fU:13'&fQ3\WK"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp45+AH9i+>PW*
3$9q93\`NR0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`
F_tT!E]P<t2BX,1@<?'A+>P'3F`&<W0JPO00ek^H3BAoQ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Get+@KX[ANCqh+A-co+>PW*3$9q23\WNS
1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t
3$9>3@<?'A+>P'3F`&<W0JPO00etdE1cd<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh1E];4DBL\g0fU:10fh'G3\iAr$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K
3Zp16+A-co+>PW*3$9q13]&TQ2)bjL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRo
A7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>Pht8p,"o1,(FB+>Gi:2)%'G2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp44
+A-co+>PW*3$9q23\W?N0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9
Afr3_F_PZ&+AR&r@V'R@+>P_q+@KX[ANCqo+A-cm+>PW*3$9q83]&]T0KBII$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqo+A-cm
+>PW*3$9q83]/TP0JWtB$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_
F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqo+A-cm+>PW*3$9q93\`<L1GoLH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9Afr3_F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqo+A-cm+>PW*
3$9q93\`WU1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNbF_PZ&
+AR&r@V'R@+>Pku+@KX[ANCqh3?UV1B-8r`0fU:12```N3\iJu$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3Ar!3+Co&,/SQ=M6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU1E]J'F<E=m0fU:1
1HI9I3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=Wi
D.7's3Zp1<+<X'\FCdKU1E]J'F<E=m0fU:11HI9M3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's3Zp44+<X'\FCdKU2BYe*F<E=m0fU:11HI6M
3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,/ScIO6?R!YA0=WiD.7's
3Zp45+<X'\FCdKU2BYe*F<E=m0fU:11HI9H3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3ZpC):LeJh1,(FB+>Gi:1G_'H0a\6p
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\
FCdKU3?V+-F<E=m0fU:13BAoM3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3
+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3ZpF*:LeJh1,(FB+>Gl;1,V*I2@9cu:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's3Zp49+<X'\FCdKU0eskI
@rrhK0JPO00fD'K3'&lR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqg1*BA&F<E=m0fU:12``cO3]/i'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS1H-F!6t(1K3Zp.4+AZKh+>PW*
3$9q73]/lX1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`
F_tT!E]P=!3$9>3@<?'A+>GVo:LeJh1,(FB+>P`61c[TS1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpM+<X!nBl%<&:3CD_ATBgS1H?R#6t(1K3Zp.5+AZKh+>PW*3$9n73]/lX1,fOI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BX,/F_PZ&+AR&r@V'R@+>bbp+@KX[ANCqg
1a#S(F<E=m0fU:10fh'K3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!&6?R!Y
A0=WiD.7's3Zp76+<X'\FCdKU0f1"K@rrhK0JPO00ek^H0KLmB$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P="1*@]-@<?'A+>G\q:LeJh1,(FB+>G]60ebXE
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp."
+@KX[ANCqh2]tn+F<E=m0fU:12**KN3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>t?;Dg!6Y0JPO00f(jI1cdEQ$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3ZpC)
8muT[1,(FC+>>f:1,h6N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=
6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg0d'(sDBL\g0f^@21HI3H3\WQ$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>GSn8muT[1,(FC
+>Gc81GV!H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=Wi
D.7's3Zp='+@KX[ANCqh1E]:uDBL\g0f^@22EENH3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pbr8muT[1,(FC+>GZ50fV3L
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3ZpC)
+@KX[ANCqh3$:h%DBL\g0f^@21cdEM3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Po!8muT[1,(FC+>G]62*!]P2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU
1,pCK@;[2C0JPR10f;!G0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8
Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh3$:h%DBL\g0f^@22EENJ3\W8q$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp1<+A-'[
+>PW*3?U%93]/`T0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P3$9dqA7]p,+@:3b
Ch+Y`F_tT!E]P<t1E[f.@<?'A+>GSn7V-$O1,(FC+>GT31c7<J2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpO+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0eje?ARZc;0JPR1
0fD'I0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9&A/KeS8Fs%noF_PZ&+AR&r
@V'R@+>G_r+@KX[ANCqg1*B%t@N[E[0f^@20fh!B3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3B/-5+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.4+@]pO+>PW*3?U%53]&NO
0fBA7@WQ+$G%G2QEcQ)=F##UJ67s``@WQ+$G%G2QEcQ)=F!,NU/KeMFB-;#/B-:W#A0>o(F)Z&8
F(KDF%13OO%15is/j)9F0e"5TEaa$&3Zr?Y+DbV%Bln'+@<?''-tI43.3N&>B6A'&DKI!LC2[W9
C,I\%.1HVZ67sB93?V%)EZd+k0Jst-1HIBI3\`H#$4R=b+<VdL1a"OrA8Z3+-Y.?I%19tYEa`j$
+D#S6DfRl]DJWg)D@HriZQLA5DegJ-+<VdL+Du=2DJWg)DBO3W%13OO:-pQr4t&-7+D,>43Zr9X
A8,XiARlp*BOr<0ATD6&-tI43F(Jd#@q[;6FDi:9DKBr@AISuA67sC&BOQ!*@;^?5DKTc3+EM+&
Earc*Ch[s4F!,FBDfB9.Cj@.AE+No0FDi:>F_kk'$;No?+EV%$Ch7Z?+B3#gF!,(/G\(q=FD,5.
Ea`j$+D#S6DfQsP+EV:.+Cf>#AISuA67sC)Dfol,+D>2,AKYSnBl%?k+E)-?DffZ(EZee2B6A'&
DKI"?@<?U&Ec,qL+D!0</g)qm1*C+FC`k*7Df7!G%15is/g,@PFD)e7D]j+DBlmp-+EqaHCh+Z%
@<Q3)AmoCiARlnm$;No?+<WTc6#^ie1,(C>+>G]60JkgG0b"I!$4R>;67tA`-o*4o@rc"!BK@8[
BOu'(@<?U&D/aT2DJ()6D]j(3B5)F/ATAo%+E2@4+A*b6/hf*k$;No?+Co1rFD5Z2@<-WG+<XWs
ATD?)BlbD*+EMI<AKYGrDIIR2+DG_'Df'H%FD52uCh\!:%15is/g+h=Eb-@F+Co1rFD5Z2@<-'n
F!+t5ART[lA0>?,+A*b6/hf+)A8`T.Dfd+CBQ&)($;No?+EV:2F!,%7Ec5t@/KebFA8,O^FCfM9
DImBi+D,P4+Dl%;AKZ#3@Wca6+D#S6DfQ9o:-pQUFE1f/E+s3&+DG^9@3B/nG9CpEF`_>8ATKI5
$;No?+>Pr"9jr&b1,(C>+>G]60K(sJ1(=R"$6UH6Eb/lo+=CoHDJLU]-Y#2BC12-nBk)7!Df0!(
Bk;?jDImp,@;0UaC12.#ATVctBl5:-$Gs,[Df&osDBNM2Ec5tZ+DP8(ART*Y$Gs+l+<Y9:AS""W
+<VdLC0u!m@:UKo4(\p/%15is/j2BH1+=>XBm;Z]FD,5.C1_0rATJu;ATD7$+CT;%+Du+A+Cehr
Ch7-"FD,]5F_>A1@;ZM]:-pQU@:XOmEcYe73]\C*Ea`p+ARlotDKKH1Amo1\+CT.u+CT)&+EVO@
+DbV4AS`K!DfTCu$;No?+A,Et+EqaEA9/l%Eb-A%CiaM;FE1f/E+NQ4+<XWsBlbD.EcQ)=+EqO9
C`me@Bl%T.De!:"EX`@N67sBmDfQt7DI[U%E+*j&@VfTu@VK^gEd8d>Bl%@%+C]J8+DGm>DJs_A
E,ol9ATDU4+EVX4E,]B!/e&-s$4R>;67tA`-o3:pGB.V>B0%.`A8-+(.3N/>ATJu3Dfd+@Ec5o.
Ebp"DA8-+(CghT3F`(o'De*E%A79RgFEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%144#
+<Yf;4ZX^.3ZoelBPDN1BlbD>DJ<U!A7[+t$6UH6%144#+Cno&@<?d6AKZ,+%175qBk)'lAISth
+<V+#+<VeGF`\`RF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrDZKYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3NSPF<G:8+>#doZYFW#CVmCe$H%D3KYrAYKYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrAYKYrJ\KYrJ\R10KG+<Y69@<6!&-ZrrI
%14g!$6UH6B4Z0--ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA
%19tY0uC7O+EqaEA12LJ+Co%qBl7Km_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_jLr@+<VeLA.8lfBPDN1BlbD>DJ<U!A7Z2W+<Ve;@<>q"H#R=;F^tpgF`(o'De*Dg
$6UH6%144#+Co2-E$-NNA1&Kp67sC%BQ&$0A0>DsF)Yr(Gp%3BAKX9;6V0ilG%G]8Bl@l3AoDL%
Dg,o5B-9eh@rH7.ASuU(Df0V*$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZS98&+\GNu+D#S6DfRl]A7]@eDJ=3,Df-\0
@;0P#Eb3+o%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_jLr@%15is/j2BH1FXGYBm;Z]GAhM;F!,17+DbJ.ATAo:ATDj+Df0V=
De:+a+>"^XATMr9@psFi+Co2-E)gdi@rGmh0JG3j$4R=O$4R>;67tA`-o<@qATDg0E]P=bBOu3q
+DGm>@3BB)DJ()5FCB&tBl7Q+E,ol+Ch7H+GA2/4+=M,9D.R3cFE8lRBl5&8BOPul$;No?+<Y3+
@r,RoARlp)@rH<tF!+n3AKYl/F<G".G@>c<+ED%8F`MA2A0>B#EcP`$FDQ4F%13OO:-pQr4t&6:
+D,>43Znk=%13OO%15is/j)9F2(9YZEcQ)=3Zohf@;BF'+Eq78+D,%rCh[d"+EVNEB4YslEaa'$
+D5_5F`;CEGA(Q*+EV:.+Co&&ASu$iDKH<p:-pQUCh[s4+D#D/FD5;s+EV:.+D5_5F`8I>BleAK
+<V+#%144#De't<F`_>6F!i)7+>Y-YA0<6I%13OO+<WE^?SWa@@;BEs-[0KLA7fb#D..O#Df-p3
$4R>;67tDb-oEFrAncKN+Cf(nDJ*Nk+=M)8CLq.".3N_N+D>2$A8Gg"FD,B0+Cei$AM+E!%13OO
:-pQq4X`3;+D#D/FEo!AEc6)>F!+n3AKYl/F<G(6ART[lA0>?,+EDUBDJ=!$+CoV3E-#N0BlJ08
+C\nl@<HX&+D5_6+=D&8D.P(V-RT?1:-pQUAmoCiF!,C=+CT.1Bl8*&Ch[E&DIIBn/g(T1%15is
/j2BH2CTb\Bm;Z]-tdU<@;BFo.3NJGA8,XiARlp*D]j(3D/XT/+CT/5+D#D/FD5<-+D,Y4D'3_)
D.RNtF*&O6AS,k$AISuA67sBjEb/[$Bl7Q+B6%p5E-!.1DIal2F_Pr/Et&Hc$4R>;67tA`-oWRt
ATDg0E]P<kC2[WkB4WM7Bl.g0DfB9.Cj@.6Ble60@<lo:F(oN)Ch4`,@;TQu@q]:k@:OCjEZf14
F*&O5EbBN3ASuU2%15is/g)o0+AQiu+>PW)2]sh/3\`WU1c5^L%13OO+<VeADe*9hAKW@2F*(i4
-QjO,67sBjF`_[IDIIBn%1;*ZN8g(PifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufT%1;*ZJhc8LK&W#RifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifoPaP_'>Oifo$;ifo&SP_)Y=D.V^kJja$hAKXHVEcZ=FE-69^P_);3H#k*?Ec5e;7VQmaF<GOF
FQ/O:6t(1K+A?3bF<GOFFQ/O:6t(@^+D,Y4D'2M\F*&ODF`cW-K&W#H%1;*ZJfs';K&W#bifnuQ
P^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifp7uP_'>Oifo$;ifo&SP_*Eg+<][.Jhf#6
2_[6H0eP:*+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL+QAW;1,(C@0KCjB/i4[n+QAW;2`W!'+<VdL
+<VdL+<VdL+<][.K&W#H%1;*ZJfs';K&W#ZifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifohiP_'>Oifo\eP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPaDme+<Vd9$4R=b1*@]SDe*9hAKW@0F*(i4F!hD(ifoD]P^qbXXQ#IpifnuQP^qbXJDufD
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
Jfs';K&W#H@NZd9ifo$M0JGF>3AE6@1bg*q+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G
0ek:;0d%UuP_(hS+<VdL+<VdL+<VdL+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX
[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXR,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDuf\%13OOC2[WkB4W2I3[\HZFCB86Eb/]-+<XEG/g,(J+D,P4
+Dbb5FE7lu%14m6C2[WkB4W36/g)qmA8Z3+-RT?1%13OO:-pQq4X`9=+D#S6DfRl]Ci<`mBl7Q+
8l%htA9Da.+EM%5BlJ08+D,%rCi^_CBOu'(Eb0<6DfTQ0B-:`-D/^V=@rc:&FE7lu:-pQUGA2/4
+Dtb7+EV=7ATMs%D/aP=/KeqLF<G(,ARfLiDJ()(DfQt=E+No0A8,OqBl@ltEbT*++CT@7F)Po,
+E275DKH<p:-pQU0JstK@rrhK0JPF-0KD0K0fh'E%13OO0HiJ2+?V#]3\P5dA1q\9A8lR4A9Da.
F"_BAE%Yj>F!hD(%1441/hSb!Df'31FCeu*FCf]=+>,9!/e&-s$7d\Y/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+.h)i50RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)h9/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/I^$@FOT+\GNu+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*HjpE5/LrD)/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@HZ$DJ+')+D#S6DfRl]A8_naHlsOSB0@k88Q&;X
;dWmBDd-X5/g)8Z+@Jsj9grDrA8_na%15is/j2BH3%5t^Bm;Z]DJs_A@q]F`CM@[!+D,P4+E)41
DBNJ(@ruF'DIIR"ATJu.DBNn@FCB!%FE7lu:-pQU0JstK@rrhK0JPF-0f1pG3'&fT%13OO:-pQq
4X`<>+D#S6DfRl]-td@7@WNt@Bl7F!EcP`$FDQ4FAo(mgF!,OBD.Oi+De!3l+CT>4BkM=#ASuU2
+EVNEF`)2ADffQ$%15is/g+kGA8-'q@rri+Ci<ckCi^_-F!+m6D/"6+A0><%F(o9)D.RU,/g)9+
DfQt3G[YH.Ch5XM%15is/g)i.+AZKh+>PW*2'=V/3]/`T1bfFH%15is/g,7LATD?)@<,p%DJpY7
Bm=3"+CT>4BkM=#ASuU2+:SZpBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3]%s?+>=63-r"8pBQ%EI
EbBN3ASuU2.6T:+0F\@;Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUBl.g0DfB9.Cj@.DATW'8
DK?q;Bm=3"+CT>4BkM=#ASuU2%16`aDdmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3EeE[M;'%15is
/j2BH3@Q(_Bm;Z]D/"6+A0>T(A8-'q@rri%F)u&.DJ`s&F<G.8Ec5t@AncL$A0;<g:-pQU0eskG
@<itN0JPL/0f(jI1HIBP%13OO:-pQUASu$1De:S>@WQ+$G%G29ATDg0EcVZs@WcC$A86$nA8-+,
EbT!*FD5Z21,2Nj/h1=QBl%<pDe*BmF*)G:@Wcd,Df-\=/M/)WF_kk:8l%htA8-+,EbT!*FD5Z2
+C]J-Ch,.-$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eODe*="Bl%<?3B:G0
3Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$Eaa$#+?V#;5s]7(A7B[qCh,Od3@>7C@rH(!F(KB6+=Cl<
De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+A,Et+Co1rFD5Z2@<-'n
Et&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBn
ATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#Dq
F<Gua+D5_6+=CW@Bl%<pDe(4)$4R=i8l%iR<'a#C6qL9!8l%iF8Q8)L;BSS-6rQl];F<lO<'a#C
6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA;BSS-6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$['
:IJ,K;Fs\a6qL9!8l%iD=B&3e8Q$p!3ZrKTFCKB,Ch.'jEcW?W%13OOF`:l"FCf3*A8PamBkCpt
F<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::5t"+:
:..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU:IJ,\
5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*FD5Z2
+A,Et;cH%Q779^F4%`::7nHZJ8Q$!)8l%iU9gg+HE+EC!ASQ-oF)Q2A@qB1nD/aP=8l%iR:K::[
78m/O7n#g;;@Nt*:IJ5X6m-M]Ch7$rASQ-o+A,Et;cH%Q779^F4%`::;cH%Q78QBA6qL9<8l%iR
<'a#C6r-0<8Q%WB:II]E<('ML6qL8c$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&
?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)fE+EC!
ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu%15is/g+\=Eb/a&DfU+U%15is
/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(A
FCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&DL!@CE+No0
A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'
DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!ZD'138F_PZ&C2[WsC3(aF
+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQB$;No?+CT>4
F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5DId0rA0=Je
E,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JP:s
F`&lg%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+%15is/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555C3(M4De*fqEc#kMBkh]3
C2[X*F(KB%Df00$B4>:b/no'A%15is/g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SFF<G+.
Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu%15is/g)l.DJs\P3?VpJDII?(@q]F`CER_4@<<W9
EbTW;ASrW&Bl%@%+D#e3F*%iu%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5
@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(
Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?
+D,2,@q[!*AT;j,Eb/c(F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-
+FPjbB6%r6-Xq44Ch.:!A1%fnC2[X+ATDj+Df.^!+=o]1HV.(%<_Ysk$4R>;67sBhCh[Hu+DPh*
Bkh]3A8-'q@ruX0Gmt*Q:II]E<(]qS8P2oX5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in
@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGj$;+)^7nHZP:IIcH;c#bZ83K!VC2dU'BQIa(+A,Et
7nHZP:IIcH;c#bZ81Z-'De*KpF>%BIA8,e"0..29%15is/g+e<DImisFCcS)Df'?&DKKH#+A,Et
+Cf4rF)rIF@rc:&FE7luC1D'gF)to64ZX]I3[\Z\A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+
A9E!.C`mJ2A9;a.Ci^_6De*d(-OgDtDe*HoCh7ZN3Zoh51*BpY.3NJ9CLnhV+DPD&@<6L$Et&Hc
$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quM\-u*7.@<6L$F!*"\/j:C?-Y-Y--Rh2>+ED%%A0rom
+F?-n0d(4LA7fOlATJ:f%15is/g+YBCi!ZmF<Ga8EbTH7F!,=.@rcK1F(96)E--.1$7Bk(+EMR5
-TsL51a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%@<-4++DPh*F`V,7@rH6sBkLm`CF9Pu.!mQj0d(OX
@jsQ%+F?-n0d(OX@grbS$;No?+E_X6@<?''A8-'q@ruX0Gp$^5Ch7Ys$:[T\78l?1+=Lu7CghC+
ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a3$:[T\78l?1+=K?E:II]E<(]qS8P2oX5u^B(+=nil
4s3<d9LVkh$8=SWDe*BeF<D\K+<Ve=GB.D>AKX&gHU^S#78jX&0Ka)gA92j2Eb/ciF<G1>EbTW,
+?M<)7S-9B;[j'f4DJeFA8bpf@<<V7+D,h<Blmo/4#2.P8PDQO%14dOC2[X"@;BFb@<<V7Ap890
FCcRV1ODS_9LVkh$8=SWDe+!4Bl%<gF<D]<GB.D>AKX&kHU^S#78jX&0Ka)gA9;a.Cia,qF<G1>
EbTW,+?MH-7S-9B;[j'f4DJeFDf0)oF<D\K+D,h<Blmo/4#VFT8PDQO%14dOC2[X%Ec5Q(Ch4_3
Ap890FCcRV2g\"c9LVkh$8=SWDe*fqEc#k?+<Ve=GB.D>AKX&oHU^S#78jX&0Ka)gA9Ds)Eas$*
Anbme@;?u.Ap890FCcRV3I=4e9LVkh$4R>;67sBjBOt[h+EV:*F<G10Ch7Z1AU%p1F<G:8+D#e:
ARfgnA0>DsEb/a&DfU+4$7I\Q3Zp+*+@\pr78jX&BkAt?.P<A`4Y@jhAU%p1F<GiOA8a(0$6UI4
D/XQ=E-67F-Y%(3D.RU,ARlouDe*QsF!,O6EbTK7F!,UEA79RkA1%fn+<Y`BDfp/@F`\`u:II]E
<(]qS8P2oX5u^Aa$>"$pAM+E!+<Y`BDfp/@F`\`R78d#Z;BRP6D/"'4Bl7Q+@rH4$ASuU$A0>W*
A8,e"+EM%5BlJ08+>#c)+?L]k+<u=X/M:KA$>"*c/e&.:%13OO:-pQUEb0<6DfTD3DfB9*+Co1r
FD5Z2@<-'nEt&IpA0>f/D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eYEaa$&3B9*,%16QeBl%<pDe+!.Bll*b:-pQ_@WcC$A86$nF`(o8+EK+d+Eqj?FCcRe
:IH=JDJ=28FCfN8F!,RC+EMX5B5)6r+Co2,ARfh#EbT*+/e&._67r]S:-pQUG%G]'@<?4#3XlEk
67r]S:-pQU+<Y]9EHPu9AKW@5ASu("@;IT3De(4<+<Ve%67sC!@WZ$mDBMPI6k'Ju67sB'+>Y-Y
A0<6I+<VdL+<VdL+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&IO67sB'
+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(Bk;?.FDi:1@q0(kF!,R<
BlbD<@rc:&F:ARP67r]S:-pQU+<WB]EbupH@WcC$A86$nF`(o8-QjO,67sC$F`&=:De'u-@:O=r
+=JreF*2G@Eb0<5ATJu.D/a<*@qg$-BeOBR%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g*o-
+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AISuA67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*3,N)L1,9:G:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0fX#YGqq3!E,oN/@<,p%FCfN8F!+n%A7]9\$;No?+>Gim@<jX_+E2IDB4W3-ATMr9@:Wn[A.8kT
$=e!aF`MM6DKI!K@UX=h-OgDmDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo
3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2
E+No0A8,OqBl@ltEbT*++CT.u+E)41DBN\4A0>Ds@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQU@;KXhDBN\4A9Dd(F<G+.Eb/a&
DfU+4$;+)^7nHZP:IJ2X8Q8MP<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*
+@K$l<(LA';cI+28l%in@VQ>Z8l%iF8Q8;X6rcuR<)>k[83K!VC2dU'BQIa(+A,Et7nHZP:IJ2X
8Q8MP<(JPfC2[WqBll"CDe+!.Bll!U%13OOGB.D>ATVL)FE9T++>b3%+>=63BkAt?@UWef@p`YZ
De*2tFCfN8F$2,u;cQCg7:0J<De*2tB6%r6Gp$X9/g,4PDfp/@F`\aJATMs7+ED%8F`M@P+D#G$
/e&.8FEDeIAKYr#FD*$b/g,BJ$>F*)+=Js+-RU>c/NP"rATMs7+CoCC%144#F)>i<FDuAE+=Bp&
+=A^^FEqh:/12Q^ATMs7+>"^WBOPah+X[^+AScF!/e&.1+=D2>+EV19FE8fm/g)kkB4Z0-I4fVQ
F*)I4$6UI4D/XQ=E-67F-mC\sFCfN8F"&Xf+=A^^FEqh:/12Q^ATMs7-OgD*+D,P4?Z]k#F=n\X
ATMs7+CoCC%144#+<Y`BDfp/@F`\a<Bl%?D/g,+AFD)dJ+EV^NE+L.C+=Afi+=nW`4"u#'ATMrB
+=nW_/no'A-OgD*+<VdTFDj]G;cFl$0me"RF*&iRGB.D>ARAk\De*2tAnc'm%144#ASu$2%16Za
A1e;u.1HUn$;No?+Cf>+Ch7*u+CT.u+Eqj?FCcS<@<-(#F`S[IATMr9F*22=ATJ:f:-pQU-ms(Q
Deio34%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC3=T>GB.V>B.",q-ms(QDeio34%`::
7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[X(D/X3$FCfN8F!hD(-mrJ4F(o,34%`::7nHZP
:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[Wl@<6-mFCfN8F!hD(-mrh>EbAr24%`::7nHZP:IJ2X
8Q8MP<(JG\GB.D>ATVL)FE8QPC2[X!@<-!lFCfN8F!hD(-ms(XEb0<5-Tapr6q9gJ8l%iT:.\D]
5u^B(+Eqj?FCfQ*F*)IG-YdR1F*)G6F)uG7F*)IN%14L2@rc^5BI>l6:II]E<(]qS<DH+b:dJ&O
.3NhTBlmp.ATMs7+=CoBA7KY&F(fZ,F*)IN%14L2E,oN/@<,p,4%`::7nHZP:IJ2X8Q8MP<(JG\
GB.D>ATVL)FE8QPC2[X%Eb02uEb0?(F*)IN%14L2E-626ALBQ3:II]E<(]qS<DH+b:dJ&O.3NhT
Blmp.ATMs7+=CoBA8l[3B4Z0rF*)IN%14L2AU&<.DIb+V8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,
FCfN8F!)iFDe*F(FCf?2Bl@m2ATMs7-OgCl$?L'&F`_SFF<Dr>Cht5:DJ=28FCfN8F!,[IBlnH.
DC5l#%15is/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>p$?'GtDf9P:>9G^EDe(4C%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&BPDO0DfU,<De(U^%13OO
B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
%14=),9SZm0J5@G3$9dqA7]on$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*/Kf+GAKYAqDe(J>A7c8X
%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq
+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9
DJsW.@W-1#F"%P*%14=),9SZm0J5@G2BXRo:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3
Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/cr
F'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(n
DJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1W
AS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n
:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B
@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$
+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)
ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0
-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc
@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$r
AKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'
.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6
+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$
4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?
AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[
?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL
%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59
/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>
AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#
#mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNE
BQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H
@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;s
C`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b
.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN
%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#
+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"
8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63
+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.r
CjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7
Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq
+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7
Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#
+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm
$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0
+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4
+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-
+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(t
FD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuul
C2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+
Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$
+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7
;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//
G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmK
DffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm
3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+D
E,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWl
A8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/
ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8Ygm
AL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>
ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>
+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ
:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c-
-YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeI
AS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<
3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,
ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^
+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"
FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-
D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;
+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t
/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$
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
+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL+<V+#+:SZ#%16c_F*)>@H"q8.A8bs50kY'8ATD3q
05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$4R=e,9n<b/ibOE3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1
$4R=b+=\LTFCB33+E(j7Eb0E.F(oQ1+Cf\,Ch4`$DfQsm+Eh=:F(oQ1+?1u-2_-Ki$4R=b+=\L+
:IH=;DerrqEcW@3DIak^:IH=A@:F:#F(96%ASrW#@;p=2Eb0;7F`:l"FCetl$6UH6+D,P4+A*b9
/hf4,8l8P?%13OO+<W-VDIn#7@!-@$@rGmh1ghGJH#R=;@:Wn[A0>u4+@pWmB45gp@;[2rE,]B+
A8-9@%13OO%14=),9SZm3A*<P1E\7l9jr;i1,1=&1,(FB%13OO+<W-VAnc:,F<G(3D/F!/+EVNE
DIn#78ono_FE_/6AKXKWF@^O`+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm3A*<P0H_qi7V-%LF^]<9
+>Pl,+>PW*2[p*'$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(
FCfJ%$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7Ch551G\&"=ATMp,Df0VK%13OO,9nEU
0J5@<3B/r?/KdbrEarc*1,(7%1,(F@%13OO+<W-VD/!m+EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1
+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[
A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%13OO+<W-VDIn#7?t4+lE,&c'FCAf)
?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%q
CghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJDId='+DG\3Ec6,4D.RU,F!+n/A0>`'
DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI+
+<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2
FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%
AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%
0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8
/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b
/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8
@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57
@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;q
Ci<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e
,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD
?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J
+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;
FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l
$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92
Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K
+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=a
DIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[eh
CLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU
0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIakt
C2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b
.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c
+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14
+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/
ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5g
De(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?
@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu
%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh
+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-
FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/
Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#
EbT*+/e&.1%16igA7B+kF>>^I5seOB<(o_D3ZoeB:IH<R1FXG5ATMr9:i]uSFD55rF!hD(9L2!2
<E)Lb;E[&`0H`D!0F\@]DeO#26nBHI@;BFp+:SZe@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX5sdq7
9he&O<)Yq@+=BKeF*&ODEa`I"Bk(^q+D,P4+A,Et+>"^VAThd/ARloqDfQsm+?1u-GT]^hEarc*
1,(FB-OgDV5se%:6WI&J3Zp-d$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMMgFE2;1F^oN-Df-!k;f?8iG@>N'
+EVO?Ci^_-Eb-A0Bkq9&Ci<`mARlorF`)7]+E27CATDC*C`mq5@;p.&F!,(5EZfF>@<lR)B-;J<
F`JU7De*R"B-:_rD/X<5+C]J8+CT)-D]iS!DJ*O$Dfp+DGA(Q*+E_a:A0>T'E,ol9ATDU4/g)9-
@<Q3)H#IgJAThX*+EM47F<GjIF`MP7Ch=f(DBO%7AKYT'Dfe2d+A!\kDJs_A8LJ?tD/"'4Bl7Q+
@3B/nG9D!GATJu&DIak]+C\o(+F.mJ+CT;%+CT=6G@bT,/g(T1%16'JBlbD5@:C?tF`_G6DIml3
@3BH1D.7's+E(j7,%>,)F<GOC@:OCn@qB^*+E)9CB6@p!ASc'uATJu+DfQtCF(oN)+A,Et/g)9.
-['&DCh7$qDIm?$FD,5.BOPpl+Eq7>4!86L+F.mJ+EV%-AKYi8+CSf(Bk(]sFDi:8ARTV$+F.mJ
+Dkh*BQPA+AKZ&5@<,pi+Unc-%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMniF*&O:DfQsm:IH=JF(KA7A7]@eDIm?$AoDKrATDi$$<KMk:.\2N3ZqBm8Q-a*5sc\l78[&V
;FOM,5p/p&9gV9H+AYHL<Du=a+@JXf8PV]B+A,Et+@].#6q(!P/e&-s$<1\QF!,:-@N]]&EHPu9
ATJu&+Du==@V'R&De:+a:IH=;DerrqEcW@FD]j(CDD!&2BOr<(AU&;>F*(u4+EV19FE8R:DfQtB
BOr;tG\M5@ASu!h+E(j7FD,6,AKYT'Ch.*tF"Rn/%15[=+=L3#F*(#M6pta0ARfh#EbT*+.3NG@
F*)IG@;^?5F`(`$Anc-oA0=K?6m-#SEb/a&DfTQ'F!+t2DJ!TqF`M%9FD,6,AKYMtEb/a&DfTQ'
F!+q'AoD^$+EDUBDJ=!$+EV:2F!,:-@P/cpDKBo?F^oN-Df0V=Df-\2Dg*=GD]iS/+EV:2F!+t$
DBND"+D,P7DIal(DBL?BDe(J>A7d8C+A$HlFCB!%+EV:.+=LuCA7TUgF_t]-F=A>@A7TUr+EVNE
B4Z0--u*[2/oY?5.4u&:.1HV`ATMrc:IITbEb/a&DfTQ'F'iWrDe*3<3\qm>+>=63%15is/h0h3
F*(#M6pta0ARfh#EbT*++Ef=g+EV19F<G^IATAo'Df00$B6A6+A0=K?6m-#SEb/a&DfTQ'F"Rn/
:-pQB$;No?+B3#gF!)TKATD6&+Cf(r@r$-.+EV:*F<D]HAT;j,Eb/c(+A,Et+<YK/@N]2qEb/a&
DfTQ'F!)T6Eb,[e:-pQUA7]@eDIm?2+<j3bAnc-oA0N.,De3u4DJsV>D.R-n+EV:.+<Y3/Eb/a&
DfTQ'F!)T:G\M5@+E).6Gmt*U67sC&BOQ!*-u*^0FD**GAU&0&DIdf2FDi:CDf''-BPD?s+E)@8
ATAo8BOPd$BlnD=A7]@]F_l.P%15is/e&._67sBtDf/uo3ZoPTCe\t`+?_>"<+U,m8l%iCBl[cp
FDl26ATJu:F\-4`DfTCu$4R>;67sC)BOu'(@3BT%CghF"G%De,Bl[cpFDl2F+CoD%F!,@=F<G.>
BleA=-u*^0FD**GARfClATJu.FE8R5EbBN3ASuT!$>OKiF_#3,F!*Uu+=DUc-7gJr4s2pJ-V@0&
+A,Et6rcrX;]n\.6rQl];F<kq8l%iS78m/5%16igA9DEoAof(X/g+nJ@<?00/j:CmDe+!$Bl\8;
+AP6U+<`-_.6T:+C2dU'BFP;c@<63,4Y@jlDe+!$Bl\8;4WnKXA9DEoAoeCgBkAt?0d($[+DkP.
CER/+/e&.1+?gnqD/"'4Bl7Q+8l%htAoDKrATDi7/KeS8Anc-o+C\noDfTD3Ecl8;Bl7Q+8l%ht
Cggdo-QkJnD..L$+<r"DDe+!$Bl\8($>"$pAM+E!+<Wij-Xgh-+A,Et+D,P.A7]e&+CT;%+Co%q
Bl7Km-QkJnC2[X*A7]@o%16ZaA1e;u.1HUn$<1SXF@o=s6tp[Q@ruX0Bk;?.0F\?u$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l39OVBQ@r,^bDKTn-$<KMk:.\2N3Zpg^6W?WQ:-hcL78k<r;FNlN7787b=WgO=8P`5,
;H6Ij+AYHL9L1uf<(KSZ+BM-.9HZYj+@JXl78u]D+A#<N<(KG#:.88a+B)6.:bE1a%160MASrW4
BOr;QATMr9:i]uSFD55rF!,:-@N]]6DK?q7F<G(6ART[lF!+m6DKTf*ATAo3AftVu@ruF'DIIR"
ATJu.DBO%7AKWCM8l%iR:K::[74B?iBl[cpFDl2F/g+,,AKYl%G]Y'LFCfD6GA1l0+ED%1Dg#\7
@;^?5De:,6BOu6r+Co1rFD5Z2@<-'nF"SRX8Oah*:K8N)5uL,o5se@I<$5.28Q-a"5u^,m;cHOh
+AP^6/e&.:%16!ED/XT/9OVBsATMr]Bk)7!Df0!(Bk;?mBkhQs?TgFm1E\_$0F\A'AhG2t7TW/V
+CoCC%144#F(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[740N8-R'oI$6UI4D/XQ=
E-67F-VRrX+EV13E,Tc*Ed8d:ATMr9E,oAsFD55rF!)lTBl5@BA8,OqBl@ltEbT*++D#S%F(Jl0
%16Z_F(K&t/g*_T<DH+f+CoCC%144#:-pQU@<QR'A0>>t@;]k%+DG^99jqNS@;]Tu9PJBeGT^s6
FD,_)$6UI4BOu!r+=D2H+>%VG+=A^TE+*j%+=DV1:IJ,W<Dl1Q-OgD*+EMC<F`_SFF<Dr)@:C@$
ASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(-uEC&05P??Fa,>XA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_
F(K&t/nAlQ%144#F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5BlA-8+EV13E,Tc*Ed8d:ATMr9E,oAs
FD55rF!,"-@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!E
D/XT/+@9X\F<FD#@:OCn@qB^(CggcqA8,OqBl@ltEbT*+/e&.:%17,eEHPu9AKW@5ASu("@;IT3
De(4)$4R>;67sC'DK9<$BleB-EZen,@ruF'DIIR"ATJtG+A#'u:JsV(78d#Z;H"#30H`%l,Tnlc
Eb/lo-9`P63[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1%15is/g+\9Ch7^"+Co1rFD5Z2@<-W9
Anc'mEt&ISASl@/AP?NA6=k4[6tp.QBl@ltEbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A,Et+CoD%
F!,@=F<G%(Ci=3(+DG^9FD,5.8g&4rARu;X,"bX!+@K!o;]nh2<$4Lr9M\DR+A#<N<(KG#8g%)2
77AC0$4R>:Gp$^5EcZ=F@;]TuD/XK;+DG\3DfTr.DKI"1BlkJ9AftMmG%kGt+DGm>F(oK1CjA&N
$4R>;792iT+AP@+78b7'792iT+EMXCEb-A=Dfp(C8l%htA8,OqBl@ltEbT*++DG^98g%hcF*(i,
C`m8&Eb/a&DfTQ'F!1u"%15ZLGAhV?A0>;sF)N10G&M)*+CT/5+AYoYD..<jB4YTrA8-'q@ruX0
Bk;?.Ch[Zr+:SZ*>YoHZB45X"7VQ[MF'L(F%13OO6ZQaHFCcS'+A,Et+DkP.FCfJ8A8,OqBl@lt
Ed8d<Bl[cpFDl2F+EDC=F<G[=@<<W+F!+t2D/a<&FCf96+DG_(AT23uA7]Y#+E(j78hM5/8TZ>$
+CT)-D]iI2B5_^!+DG@t@3BZ1+Co%qBl7K)@3BW6@Us1nARfh#Ed8dKFE2M6FEMV8+EV:*F<GF7
EcQ)=F!+(&F!,X;EcYr5DK@EQ+A,Et+CfG'@<?(%+C]&&@<-W9C1_0rATKIH+B3#cF(HJ+Bl%@%
+CT;%+D,%rEbp"DF*(i"Ch4_uF`\a8Bl7@"Bk;?.@ps6t@q]:gB4W30BOu'(8g%VW@;]^hF"Rn/
.1HVZ67sBjEb/[$AKYD(D..L-ATAnc:IH=9Bl[cpFDl2F+EDC=F<GLEFE;/,AKYo'+A+#&+Co2,
ARfh#EbT*+/e&._67sB[BPDN1@rc-hFD5Z2+Co&&ASu$$Df-\++Cf>-Anbn#Eb/c(A8-'q@ruX0
Gp"Ma8l%iR:K::[74Bhu$>sF!A0<7/E-,Z4F=0-uC2dU'BHS[O8l%iR:K::[75&+hFCfN8-Rh,)
@V'V&+E2@0@ruEpATJu9ATMr9A8,OqBl@ltEd9#A$4R>;67sB[BPDN1BlbD*DBNM8@;Tt"AKWQI
F`V+:@;^"*BOu3,Ec5l<+D,P4+F.mJEZen,@ruF'DIIR"ATKI5$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk
@:UKs@:C?iBk)7!Df0!(Gp$^>Df$V-F_u(?F(96)E-)Nr<,WmnCi"68FE1f3AKYc"Gp$^1@<?X4
ATJu4Afs]A6m-\b+Dtb%A0>;'DJsE(D/aTB+Co1rFD5Z2@<-WG+B3#gF!,@3G]Y'LFCfD6Ci<`m
F!,R<AKWC1E-,Z4F=A>CBk)7!Df0!(Gp$^>Df$V*+CoV3E$043EbTK7+Co2-FE2))F`_2*+EqOA
BHToC6nSoU.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>\s@N]2q@ruF'DIIR2/e&.:%15is/g,(O
ASrW.ATo8-Bk)7!Df0!(Gmt+!A0<7/E-,Z4F=/28+>Y-YA0<6I%13OO:-pQUCi<`m+D,Y4D'3D7
@;Tt"AKYN+D/^V=@rc:&F:AR2+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F:2
Cggd`F_u(MBkh]:%13OO:-pQUEb/lpDImisFCcS'Cht57AS,LoASu!hF!*%WF(fK9+DbJ-F<G[=
Eb/f)D.Rd0@:s.m%16Gu+F>^`0Hb"EDdmc74s58++ED%:D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM8S
@r$4++C\bhCNXS=@UWb^F`7cs,!nR_93"e26:!t3<DXf)5sn:F:a->U%15[K+DGm>Ch\!&Ea`d#
Gp$N<F)GE*+EVNED..3k+CQC%@:O(qE$0@=FD)dh:IHfX+B*2$@UWb^F`8IAAoqU%+Unc-%15is
/g,(OASrW4BOr;qATMr9E,oAsFD55r+Co1rFD5Z2@<-W&$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1
%15is/g+V3@r!3$F<G^F%17&_@r#Tt-Xq%:ATMr@%13OO:-pQUEb0<6A0>o(@rHO%EcW@FBOr<'
Df^"C@s)g4ASuT4@UWb^F`7csEb0<6A0<7/E-,Z4F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B2cbAKYD(
F(96)E-*45F_u)>%14:Y5taWh5p0)n;Fs\a+@K4(:a->U%14M&@:O(`.3N).@r$-.F`8I4Bl7@"
Gp$j6Bl%@%+C]J8+DGpFF!+n-F)N10+D5V2A0>SsARQ^'D]g67F_u(A+F.mJEZen,@ruF'DIIR"
ATJu&F!,F<@;0U%FCf]=/g)9/:IH=8@;[2uF_u(?@;Ka&DfB9*+Co1rFD5Z2@<-'nF!+n4+CQC6
Bl7R"AKXSfF(96)E-*]T;e'i^E-*45F_u)=+CT;%+EV:.+Dl%<F<GXH@:F%a+Eq7>+EVNEF*)>@
AKXSfA8,OqBl@ltEbT*+/g)99BOr<$De*p-F`Lu'+CSekDf-\.BleB:Bju4,ATJu&Cht4d:IH=H
Dfp)1AKYK$A7ZltDBO%7BlbD/DfT\I%14Nn$;No?+CoV3E$0(:Cj@-O@W6F#F*&i?$?'Gt-Xq%:
ATMr@+BosE+E(d5-RT?1%15is/g)QZ@;BF'+CfG'@<?(%+CQC'Bk)7!Df0!(Gp$X?D/^V3DBO%7
AKYN+D/^V=F^elqEb/a&DfU+4$=[srATMs(F_u(\3ZrKWDg-//F)t\sC2[Wi+DkP&AKW?J%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[rDf'&.F`V,8+E(j7A9Da.+EM%5BlJ08%15^'6m-#_D/^V=@rc:&FE8R7
@;[2sAKZ,:ARlp*D]j(3Ci<`m/0JG@E-WR7DIal,ATDEp+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sC$
ASc9nA0>?#FCfN8%17#a+=CW;FCfN8-QlV91E^UH+=ANG$8<Va0Hb^'@W6F#F*(r8D/]pk%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%15I@E-WR7+Co1rFD5Z2@<-WG%14Nn$;No?+Cf>/GqX#GEbAr+@W6F#F*&O8
Bk)7!Df0!(Gmt*uATqZ--Xq%)DfBtL4)/_CFD)dEIS*C(;bpCk6U`Y;E+<g*Gpa%.De't<@W5gq
E-WfR>9G^EDe't<-OgD:+Z_;"HTGVTFCfN8A9Da.%13OO:-pQU@r,^bEZf=0FD)*jA8lU$F<Dqu
9LV6F:dJ&O-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgK+CQC0@<6O%EZfC6/TPE8BleB-EZfF5EbTK7
%14:R5taWh5p/lf;cH1`+AtW[;FO)I;cH1`+B(X*8PiA1%13OO8l%htDf0B:+EM+*F!,R<AKYMt
@ruF'DIIR"ATJu7AS5^uFCfK(A0>T(+EV:.+DPb%F*(u6/no'4+D,>(AKZ&4+DkP$DKK<$DJ=!$
+CQC/BleA=De:,4AS5^uFCfK(A0>Ds@ruF'DIIR"ATJu.F!+m6B5_^!+DG@t@4iZF8l%ht@ps6t
B4YslEaa'$+CQC5AM%q6B5)F/ATAo7@rc:&F<G[=@<<W;Dfm14@;[3!A8--<+<V+#%15U:DImis
FCcS'+ED$FEb/ltF*(u6+EM%5BlJ/:@;]TuE-67FBlkJ3DBO4CF`JUA@;0U%8l%htA8,OqBl@lt
Ed8d<Bl[cpFDl2F+EDC=F=n"0.1HVZ67sBnASu("@<?''Eb-hCAS5^uFCfJ8F(96)E-)NrEb09&
B0A9uF(fK9E+*g/?X[\fA7$H@HTE9,+E(d5-RT?1%15is/g,4DG%De1F<G:8+EV:.+DkP.FCfJ8
Ec5l<%17,eEb/l+GB.D>ARAk\De*2tC2dU'BHS[O8l%iR:K::[75&CoA9)6oBleB-E\;'@F!hD(
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+B)in+Dbb$Eaa!6+Co1rFD5Z2@<-W9FDi:BART+fDJXS-$6iD;<$4k+
6;g*I=Wg+(6W?WQ:-hcL78k=.:EWP(5t"LD9N`PK$4R><E+No08l%htA8,OqBl@ltEbT*++Co%q
Bl7K)@3BW&@<,jk+E1b2BJ(DM<+ohcAnc:,F<G+.@ruF'DIIR2+E)-?FD,5.E+*j%+DGm>FD,5.
Df0B:+Co1rFD5Z2@<-W9FD,*)+Ceht+C\n)@q]:gB4YU++<X6t+DGm>@ps1iARlp*BOr;1E-67H
+Co1rFD5Z2@<-WG+<X*rASrW4BQ&$+BHV22DK'`?+Co1rFD5Z2@<-'nF!+t$DJjB7+C\n)@q]:g
B4YTr@X0(g:IH=>F=2,P@3B3$De'u)A7]0lFDi:CATT&:BOu$';FNl>:JOSd+C\nl@<HX&3XlE*
$;s;Y6r-QO=Wh6h@ruF'DIIR"ATJu(@;[2sAKYDk@qB_&ARlomGp$O5Gp%!ID.7's+E(j78l%ht
FCB6+F"SS576s=C;FshV+Co1rFD5Z2@<-'nF!+t$DBNk8Cj@.4AKYDk@qB_&ARlomGp%$CAKZ)'
F)*BN+:SYe$;4rAE+s3&+Dbb$Eaa!&ATJtl76s=;:/"e5E,oN5ASuU2+CSbiBk1dmFCAu.E-67M
F!+n4+F.mJ+E)41DBNA*A0>AuDf]J4A8,OqBl@ltEbT*+/e&.:%15is/g,">CLnVtE-,Z4F<FIM
5t"LD9N_f3De't<@W6F#F*&cP>9G^EDe't<-OgDnE-#T4+=C&U5t"LD9N`_P$4R>;67sBiE+<g*
Gp$gB+Du+A+EV:.+E2IF+Co1rFD5Z2@<-W&$?'Gt4$"`uE+<g*Gp$R8FCfN8-QlV91E^UH+=ANG
$4R>;67sBmBl\9:+D5_5F`9!TF_Pr/+EM+9F!,F1FD)*jB6%r6-XgY.Dfp"H4!6UG-Y-Y-ARfCb
@r!34ARTUi@<?(%+EVO4@<iu:F`)56F(KE(F>,'O$4R>;67sBuDffP5A8,OqBl@ltEd8dH@<?/l
$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMS`AT/c4AS,LoASu!hF!,UEA79RkA.8ki91;9G+AtWt
78cQL6Uaor<DZ(L<(02!%13OO8l%htF*)>@ATJu<DfTA2Eb/ioEb0,uATKIH+Auc_ATD@"@qB^(
AStpcCh4`+@;^?5F`V,+F_i1=E+O&uFD5Z2F"SS5AS,LoASu!hF!+n-Ci=M?-td+5Ed0#UFDi:<
Ddd0!GAhM4F!,R<@<<W%@;Ka&DffZ(EZfREEb'56Bl5&2ATo8,Df0Z.G]\!Z%14Nn$;No?+E).6
Gp%'KF<G+.@ruF'DIIR2+ED%*ATD@"@qB^(DImBi+E_X6@<?4$B-8cKF(fK9+DbJ-F<G10G%De5
ATMp$B4Z,n$=>Y5HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>c@s)X"
DKI"3Bk)7!Df0!(Gp%$7C1UmsEt&I#6r-0M9gqfV+@Jdg<(Tk\5uLi.:I7ZB6W?u.%13OO6uQRX
D.RU,@<?4%DBNY7+CQC/Df021F*(i.A8,po+EMIAAKYr1Bl8#8AoD]4E,ol0Ea`g%ATDiE+<XBs
F*&OCAfu2/ASiQ'@<?''BlksM;f?Ma+Cf4rBl+u,F=2,PF`)).@qB_&@<-W9@;]TuAThX&+Co2-
FE1f"FD5W*/g)94FD,6+F!,FEF<G:8+D>2"AftPkCLq$!AS,OmEcc@T+A$GnD0[7BE+s3(Df-\>
BPDN1,&)+9-ZgJBG%GP6GB.V>B-AHA+@g?gA0>E$@s)X"DKK</Bl@l3ASbq$@<?(%+Cf>#AM,)s
DBMSiF`_:EF!,C?Bl7X'DBNY8+EM+5@<,duATJt<Ch\!&Eaa'$+E2@>B6%EtD/!m#+s:K<Df$V=
BOr;pCij6/DIIX$G%DdJ+<kN9Ch\!&Eaa'$+E2@>B6%EtD/!m#/g;D\+:SYe$;+)^+E2@>G%kJu
F!+m6DKTf*ATAo3AftYnF*SmP@<lo:FDi:4De!p,ASuT4@rGmh/g+;8FWb1&DBNM.FCfJ8@3BW*
DJ*cs+EM+3FCf?"AKYo3+CQC/@<-!l+Co2-F(KB6@<?4%DD!%S8K`4qF_kS2Eb/a!D/Ej%A0>u-
AKYT'Ec#B./g)98ARuuV:IH=9De!p,ASuTuFD5Z2+D,P4+Dl%;AKYN%@s)X"DKK</Bl@l3DfBf4
Df0VK%14Nn$;No?+D,P4+Dtb7+EqaEA9/l8Ed8d9+EM77B5D-%Ch[cu+E(j7A8bt#D.RU,@<?4%
DCuA*@:jUmEbo0*FE;PE4ZZjkI4fsk,=#HU.j-Pn-tt_k.6o:c+@Rn*>q$3iE-67F-XgV/ATDTq
F*)JFE[M;'%15is/g+kGF(KB6+EM+3FCf?"AISu#+?1K_F`\`R@:jUmEbo0*FE;PE-T`\rATV?p
DK?qAFE2)5B-8UJ.3N&2FCfJ8CghC,+E(b"F`MM6DI[6#De:+?GUY!L$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqF:IH=JF(KD8A8bt#D.RU,@<?4%DBNY2+Dtb7+Cf>-FCf]=F"Rn/.1HVZ67sBmDfQtB@:O"n
F!,R<AKYN%@r5dpF<GX9DKKH-@q?csF!,(+FCSuqA.8lVBle59-XgV/ATDTqF*)JFE[M;'%15is
/g+VDBk:mmGp$X/F(96)@V$['F`)&7Df-\1Ec6)>+<W6YFD,5.E++$$@:O'qAoD]4ASuU$EbTE(
+EV:8F(HJ8ASuU$DI[7!%16cbE,KJ7I4cXTEc<-KF*2A;Df9M@%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
6#IfVG[YH.Ch4`-Afto.DJ()&De!p,ASuTuFD5Z2/e&.:%15is/g+tKDJ()&De!p,ASuT!$8<S_
+Co2-E$-NLF`)56F(KE(F>,'O$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>YAnc-o+F.mJEZf:EDBMPI6m-Pa
DfTr0F`_[6$6hl,7S-?D+B_K?;BSb::*</)6m,E!:Jt.Z<E)m@%13OO8l%htGAhM4F!+t$DBND"
+E_a:A0?)1FD,B++CT;"BlnB(Ed8d"+E2@>B6%EtF"SRX8S0)jDfm15Df-qE+D,>*A0>;'8l%ht
E,oZ0Bln'4AKZ).@<<W/AS#t)+F.mJEZf72ARoj)A8`T!+Dbb6FDPM2E,ol0Ea`g%Bl7Q9%13OO
<+oi`AKYE%AKYhuDL!@9G[YH.Ch7Z1De:+a:IH=EEc5T2@;TjqDJ()+DBMPI6mm$uF)Q2A@q?cm
De*E3+A$HlFCB!%+EV:.+DPh*F)Q2A@q?ckA7TUr+EVNEB4Z0-8l%htF)Q2A@q?cmDe*E3%14Nn
$;No?+D#e+D/a<&F!,C5+E_a>DJ((a:IH=LDfTB0+EVNEA7]@eDIjr.ATo8/@:O"fBln'#Et&Hc
$;No?+Co&)@rc9mAKYD(8l%htB6%p5E"*.fB4#@fDe*3<3ZqWf+D>S1DJUG"3Zri'+D5_6%13OO
:-pQUEb-hCAS,LoASu!h+E2IF+Co1rFD5Z2@<-W9F(fK9+CT/5+D#S6DfTn.$?B]uAS,:`C2[Wi
4ZX]A+?CVm-uLRgF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9c<1/q#?mAThu>-RU8a>9J2=%13OO
:-pQUF(fK9+EqaEA9/l6AS,LoASu!hA0>?,+EqaEA9/l-DBN@1B6%p5E$079@<<W#Eb-A2Dfd+9
DBO%7AKYW+Dfp".$>OKiB4#@fDe*3<3ZoeYB6%p5E$l)%DKoN&C2[Wi4ZX]A+?CVm-t-q.Eb/j(
+<Z(b+D5R@+>#2gB5Tjb+D5_6+DPh*B.",q%15is/g,"FF)u&5B-:f,Df$UF@:sV!F`8c=$>t)2
-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C9mFDl#1H=\3k:IH=:A8--.Amo1`Ch\!*ATJ:f,"#@/<)64[
>"'Q+:IH<o6qL?#7R9C59M&2T78kB>$4R>ABOr<'@;0U%8l%htARoLs+EqaEA9/kADKdNP@;]Tu
-tQp<+Ceht+C\n)@s)j7Df'37ARlomGp$X/Anc-sDJ()#+@K!m<D>nW<'sGU9gMNB+EM%5BlJ/H
%14Nn$;No?+Co%qBl7K)A8bt#D.RU,+Cf>,D..<m+EM%5BlJ/:/KfCh:4@U6BlbD@DfTA2DIIBn
+E2.*@qB=lCh.*t%15L!6WHiL:/jSV9hdoK6sjYCDe*2t4ZX]>+?CW!%17/nDfp/@F`\aFEZc`V
ISP??-OgD3%13OO%15is/g+YEART[l+CQC1ATo8@DfTA2/KetNASuQ3ARoLs+EqO;A8cZ$$>t&1
-Xq%=DfTA9%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k7VQaN+EV:.+=L]<GAhM4.3N24BlkJABl7I"G9C=3
A0>c.FCcS.Dg*<l:IA,V78?fL:JFPL:.-4HAU&;>BOPs)@V'+g+Dl%-BkD'jA0>;uA0>T(F(KB6
/g)9<BOu'(FD,5.F(96)E-*4HBl7I"G9CU@+ELt7ARlp-Bln#26W-lW/QX&_:IA,V78?fL:JFPL
:.-4FF`)7Q%13OO;KZk"@;]Tu@r-()AKZ).AKWC1E-H5@A18X4A8--.GA1r*Dg*fC$7QDk%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%15O7BlkJ++EqaEA0>T(+EV:.+Co1rFD5Z2@<-WG+<X9P6m-2b+CT)1@<lo:
ARoLsBl7Q+@rH=#ATKIH:NC/^Bl7?qF!+t$DBNk8Cj@.4AKYJr@;]^hA0?)1FD)e.G]7J5@qg$-
E-67FDfB9.@<?4%DK@E>$7QDk:-pQUCi<`m+Co1rFD5Z2@<-W9GAhM4+DG_8D]iV%BlkJABl7I"
G7=mjA0<7@F`)56F(KE(F>,'O$4R>;67sBmBl7H(FD,5..!'NKEbTT+F(KGI.3N24BlkJABl7I"
G9C=3A0>c.F<EtI6WHiL:/jSV9hdoK6m)pG%15is/g+Y?Df]J4ARoLs+EqO;A8cZ$$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBM>YAnc-o+A,Et+E2@>C1Ums+DkOsEc6".$6hl,7S-?D+A,Et+Abs38ju*H+AG-h
;GU48%13OO=(l/_+E2@>B6%EtD/!m#+EqOABHToC6m-bnFWbdOE+rfjCi"A>DfB9*+CQC6ATT&5
AftVu@ruF'DIIR"ATKIH9Q+?M+EMI<AKZ&>F*(u1+EM%5BlJ08+CT.u+Co%qBl7K)F)Po,+D>2$
A9f;8Dfor=/g)99BPDN1@ps6t@V$ZmDf0,/Bl5&%+E2@>C1Ums+DkOsEc3(A@rc:&F=n"0.1HVZ
67sBkAS,XoAKYD(E,ol3ARfg)D.-ppD]gVS8K`.sAKZ).AKYr4AS,Y$+E2@9+D,P4+EM[8BHVA+
EbTK7Et&IqEb]Z<DJa<1DEU$'0H`D!0F\?u$;No?+EMX5DId0rA0>V0F(96)E--.1$?B]tF_Pl-
+=C]2@Wc<+FCB6+-OgCl$;No?+Dbt+@;I'-@rc:&F<GI>F`)7C%16igA7o7`C2[Wi4ZX]5F*2A;
Df9M@%16igA92*lC2[Wi4ZX]5F*2A;Df9N8ATMs7-OgCl$;No?+E2IF06hMKAdo)8:IA,V78?fL
:JFPL:./H8?Q_Km+=D5IDfp/@F`\aFEZc_WH[\_=I4$Bi%14Nn$4R>;67sC%FDl22+DkOsEc2Bo
1a$a[F<DrMEb]Z<DJa<1DC7M<;aXGS:fLe1C2[Wi4)f4TF*2A;Df9M&$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqKDI[6#E,ol3ARfg)D.-ppDf[%0Eb-A(AS,XoARlotF=2,PARTY*+EVNE@rH6sBkMR/AKZ8:
F`JTs+EM+8F(oQ1+>"^SE+No0FD,5.Eb065Bl[cq+Co1rFD5Z2@<-'nF!+n/A0>o8DBO.;FD)dF
Ec!6JFDi:CATW'6/e&.:%15is/g,4HFEMOFE,ol3ARffk$?Bu+-ZF*@F*2A;Df9M@+<Xl2De'tP
3[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@TgTF<GjIF`JU>De*g-
De<^"AM.\3Et&I#779^H+B_K?;BT^mA8lR-Anc'm/no'A+q4kg$<LnPDBMPI6m-;a@:XF%FD,5.
F(96)E-*4O@:WneDK@IDASu("@;IT3De(M9De*g-De<^"AM.\3F!,1<+D#e/@s)m)A1f!(BPDN1
F(96)E-*44@;[2sAKZ,:ARlp*D]j+4F<G^F+A,Et+EV:.+Eq7>+F.mJ+Eq73F=n\2DffP5BQ&);
H#IgJ@ps6tAU%crF`_1;E,ol3ARfg)D.-ppDf[%FBOu'(8l%htCi<`mF!,[@FD)e<ASuU$DI[7!
+Dbb-ANC8-%17,m+=D,KC3+N8D/X?1-QlV9De'tP3[\BU@rH=3+C];3ATMr@%13OO=$]_Z8PVc:
+EMXCEb-A=Dfp(CE,ol/Bl%?'Bl5&3DIjr/AfuA;F`JU8Bk)7!Df0!(Bk;?<+<XWsBlbD/Bl%?'
BlbD;ATMF)+EqL1DBMP;9H\IsA79RkF!,R<AKXT@6m,oKA8c?<%14Nn$;No?+Co2-E,8s.+DPh*
E,ol/Bl%?5Bkh\u$>"<%Eb/Zi?X[\fA7$HoE+*j%-[oK7A8c@,05"j6ATD3q05>E905>E9E,ol/
Bl%?5Bkh]:%13OO:-pQU@r-()AKZ).AKY`+A8lR-Anc'm/no'A+EqO;A8cZ$$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMqX73G2u6m,#h9Mcit:.-3m:IA,V78?fJ<(Tk\%14:Z;ahg$:IH<r78-N#5u'fj6r-0M
9gqfV5u^EO:*L,S%15[EF*(i,C`mh5AKWC6ASu("@;IT3De*Bs@s)X"DKI<M@:WneDBO%>+E_a:
+A,Et+AbHq+D>>&E%W7B$7QDk:-pQUCi<flFD5Z2+E(j7C2[W8E+EQ'/KebFF*(i,C`m.sA8c?.
-td+/ATD3q05>E9A8bt#D.RU,.3NhKFD)dh5th^pC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs
@s)X"DKIONA7f@j@kVS8A1hh3Ag\#p%15is/g,(OASuQ3C2[W8E+EQ'BkAJr+E1k'+ED%%A7]d(
BlbD*G%#*$@:F%a+E)-?H#IhG+EMgLFCf:u$>OKiBOu"!+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*E"
D..I1+CT.u+D,>*@;I',ASkjrCND*;$<1\M+D,P.Ci=N3DJ()2Ea`I"Bk(^q+DkP&AKXT@6m->b
Eb-A4Ec5K2@ruF.AKYE!A0?#9AS-($3XlE*$;+)^+@K!o;]nh2<$4Lr9M\DR+A#<N<(KG#8g%)2
77@Xm%15Ef6VCEU+@8@]93"e26:!t3<DX,3%16'#919sh+B(X*8PiA/6rcrX%13OO9gME@+@.,E
5uU`O;BSk+/Q,#-8Q/SW;BSn*;Fs\a%13OO;ajY.9M%QK5uLi.6qKaF8P`)I;Fs;U+B2,Z;FNl>
:JOSd%13OO91;9G+AtWt78cQL6Uaor<DZ(L<(01a$4R>1:IA,V78?f)6qKaF8P`)I;HY,<6:s[6
<)X55%15Kl7S-?D+B_K?;BSb::*</)6m,E!:Jt.Z<E)m+$4R>0<Dujm9hAMW+A,Et+@S[i<$4Xr
6V0sC<(TMW%13OO6q'R::.69t:IH=%;GTnR6W>1&5snOG;[j'C$:R?S<$5=><DjrSDe*g-De<^"
AM.\3Et&Hc$<:"n+A,Et+@npp:`r&!6m+ln6WHiL:/jMY8P`(j$4R=O$<1\MF(HJ&Eb-A.F`VXI
F)Po,+E(j7FD,5.8l%htE,oAsFD55rF!+$sBOQ'q+D,P7DIal4F(Js+Cb?hQ6$"/oDfm1FF(HId
:IH=NDfm1HBl%T.E,ol+@:F%u+D,>*A0?/9F`JUCGA\O?ATVU(A90@G+:SYe$;"hPH#IgJAnc-n
+CT.1@3B]6AS-($+Dk\3BQ%E(E,9)oF(HJ1ATT&3AKYc+Dg*fV+A!\c@;[2sAKZ#)@:Nt^A0><&
3XlE*$;,5MDBM8SCLqN/%15g<Earc*1,(FB%16QQCLqO$A2uY8B5M'kCbB49D%-h$%13OOC2[Wn
F_u(Q2,$;&<(U%_76N[S-V@0&+=Juo+B*3$EarZ'6Z6LH+@L?hE$/(hEbTK7F!hD(9L2!2<E)Lb
;E[&`0H`D!0F\@]DeO#26nTTK@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV
;a!/a-WFbnF!,:-@N]2mD/X<5FE1f3ATJu-Dg*=GD]ik7@:UKkF_u(?8l%htF(96)E--.D/Kf(F
G%l#/A0>K&EZdss3%cn0+AH9b@qZu?0JPO7%15cp6:Oa<<Du%A+>F<4%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+A$HmEc5K2@ruF'D@HqF:IH=HDfp)1AKYK$A7ZltF!,"-F*)G:@Wcd(A0>T(+EV:;ARuuV:IH=9
F_u(?F(96)E--.R+@L?hE$043EbTK7F!+n3AKYr.@;0U%5uU-B8K^VJF(96)E--.DFD,*)+Ceht
+C\n)Ci<`mARlp-Bln#28ge[&F*(i.A79Lh+EM%5BlJ/:E,ol,ATMp,DJ()8ATD7$/e&-s$<1\Q
F!,:-@N]*#F*2>2F!+(N6m,oUA0>r9E,]`9FD5W*+CSekDf0V=BOQ'q+C\nnDBNY2F*(i,Ch7-0
+A,Et+CT.u+EM[EE,Tc=Bl7Q+@:WneDK?q1@;[2sAKY])F*(i,Ch7-"GA2/4+EV:.+A*bq@:O(]
B4W3&@;]LdATBC4$7QDk:-pQUFDi:EF(HJ&+CoV3E$043EbTK7+A,Et+Dl7BF<G%(+CSc%Bm+%s
$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C'bAnbn#Eb-A%+F\'DA92[3
EarZ'A8-'q@ruX0Gmt*[D]j(CDBN@18l%htA9Da.+EM%5BlJ/:F(oK1Cj@.AE+No0@3BH!G9CF1
@ruF'DIIR2+CT.u+E_a:+=Joe3\W!8+:SYe$:\rS+EV:2F!,:-@N]c+AKZ&4F`Lu'+Co1rFD5Z2
@<-'nF!+n3AKYK'ART[lA0>T(+EV:.+=M\2:IJ,W<Dl1Q.3NYBCghF"G%De,Bl[cpFDl2F/g)9>
Dfm1HBl%T.DImBi+EVNE@rH6sBkMR/AKYD(8g%_aCh.*t+EVNEE,TH.F<G[D+CT.1@:OD%@;I&s
Bl[cpFDl2F/g*_.;cHXj:.Iu\+AtWq:JFPP:.-4IF(oN)+CQC'Bl[cpFDl2F+EV:*F<G:=+Du+>
+DG^9FD,5.8g&2#F*(u1+EVX8AK`1!Dfm15Df-qE+Eq73F<GjIF`JUDEb/`pDfp+DA8,OqBl@lt
Ed8d<@<>pe@<6"$+C\nrDJ()9BlIWo+C]U=Bl8!6@;KaoDJ()6BOr<(AU&;>8g&:gEcYr5DCuA*
%15F5AoD^$+E2@>@qB4^Bl7Q+@rH6sBkMR/AKYD(."4ca6rQl];F<l%+Co2,ARfh#Ed98[:Mq:I
3%cn0+A,L1+EMgLFCf<1+EV:.+@C'bAnbn#Eb-mnDerrqEcW@?ASuW5DfB9*F!,R<AKYMtEb/a&
DfU+GAoDKrATAo'Df00$B6A6'FD5Z2+D,>(AM+E!.1HVZ67sBjDf00$B6A6++CQCA8l%iR:K::[
73H,TEb/a&DfU+G@V'.iEb-A4Ec5H!ARoLmB-;;7+EV:.+Dtb8F<GXHAT072$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMhgD/XT/+E2@4G%kl;F!,:-@N]2q@ruF'DIIR"ATKI5$<KMk:.\2N3ZqBm73G>o=B$DA
<(0V+;FO;U<^fq06qKaF8P`)I;Fs;U+@B$q5u^9@+@93R:f9k\;BSk;:/`927NbZ$8Q-a*5sd1H
+B1m#+@Jdg<(Tk\5uL9C;]mK2FD5Q4Ci<`m/0J\GA8H0mA1Sj<De*BiG&2)*A18X&8PDf#6:E"b
78--L778aN+A#$F=\i$?6U=U=+@/=i<E()?84=Xg:JOkX:/k.7:IZI+84?HG+@Jdg<(Tk\5uL9C
;]nJ(+AP^3+@TC$6WI)S+B1m#+AP@-<$4k#66K3+78PTG$4R>ABPDN1F*(u4+Co%qBl7L'+CQC9
ATD6&FD,*)+ED%1Dg#]5+DbIq+EMIDEarZ'A8,OqBl@ltEbT*+/e&.:%16!ED/XT/9OVC/Dfp)1
AOL6BFD5Z2@<-'nF'iWrDe*3<3Zp4$3Zp*c$>F*)+=DV1:IJ,W<Dl1Q-Qk!%+EDC=F?M6!C2dU'
BHS[O8l%iR:K::[7403gD_;J++<Y`BDfp/@F`\`R5p/cq6rQl];F<kqA8-'q@ruX0Gp$gB+Du+>
+EM+9F`8HT+EM+9F`8I3DIal3Ed8d9B45Ll/gh)8AScF!BkAt?/M:XHG\M5@+DPk(FD)dEIUQbt
Df0VLB4YslEa`c;C2[X(Dfp)1AM7e:A1hS2F!i)@D_;J++<Y`BDfp/@F`\`R8l%iR:K::[73H#L
A8c?.BlbD7Dfd+9DKBo.Ci!Zn+>"^MDKBo.Cht5&DIal3Ed8d9B45Ll/gh)8AScF!BkAt?8OccQ
:*=(c/e&.1+AP6U+Cf5!@<*K/F`\a:Bk)7!Df0!(Gp$X3Eb/a&DfTQ'Et&I!+EM4-Cht4AEb$:G
F!*,U+<i0a-us6EF=\eEF`_>6F)5c'A1&fW-R'oI$6UI4BOu!r+=D2?+>7dY06&*Y-S-ZdDf9_K
-X:D)A8H0mA1&fW-R'oI$6UI4BOu!r+=D2?+>7dY06&*Y-S-ZdDf9_K-X:D)A7T7pCi<`m-RgSo
+t!g,+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MZBl5@BF)Q2A@q?cnBk)7!Df0!(Bk;?.ATD4#
ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd67sBhG&M)*+C].qDJO;9Bl5%c:IJ,W<Dl1Q+E1b2
BQG;7DBMVeDKU1H@;]Tu9jqNSF*VhKASlJt$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SKUaBl%j,
Ddd0(%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*[&@:U_p$6UI4BOu!r+=D2H+>%VG+=A^\
Df9_K-SK4QA7T7pCi<`m-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=M)8@kVY4DKU1Q+EMID
EarZ'A8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/nAlQ%144#F)>i<FDuAE+=BTu@<6!&@;^?5
E,oN5BlA-8+EV13E,Tc*Ed8dD@:C@#Dfp)1AKYMt@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/
$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!ED/XT/+CT/5+E2@4G%kl;F!,:;@:UKs@:C?iBk)7!Df0!(
Bk;?<%14Nn$;No?+E_RBAS5^uFCfJ8/Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+ED%+A0sJ_4$"a3
FD5Q4Ci<`m+DPh*Ci<`m+DPh*A7]q#Ddd0(+BosE+E(d5-RT?1%15is/g+Y?ARTU%Dfp.EA8,Oq
Bl@ltEd8d<Bl[cpFDl26ATJ:f;Is]`G%F?U@T.2fEarZKBk)7!Df0!(Bk;?.0F\?u$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l36ZQaHFCcS;FD5Q4Ci<`m+Co1rFD5Z2@<-W&$:K#RE$043EbTK7F!+n3AKYf-@:Wq[
+DG_8D]iS)@ruF'DIIR"ATKIH+@C0\@<?''@3?t@FD5Q4Ci<`m.3N/8@ruF'DIIR2/e&.:%15is
/g+YEART[l+CQC1ATo8>FD5Q4+Co2,ARfh#Ed8dADBL?V8l%iR:K::[74B?2+DGp?GA1l0+C\n)
Eb0,sD.R6#CghEsEX`@N67sB`Dfm1>F`VXI@rH6sBkMR/AKWCM8l%iR:K::[74B?fDIal/DeX*2
+EVNE@;[2r@ruj%C`m;+E--@JA8-'q@ruX0GqKO5%16uaG@VgDF`_>6F)5c'A1'GeC2dU'BHS[O
8l%iR:K::[75&e*Bl%j,Ddd0(.6Ano@;0U%F`_>6BlnVCA8,OqBl@ltEd9#A$4R>;67sBjCi=B+
+CT/5+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+Nnr$?'Gt-ZsNFCiaE2@:U`.>9G^EDe't<-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$<LnPDBMPI6m-#_D/^V=@rc:&FE8RFF`&=DBOuH3A8`T.Dfd+4BleB=
Eag/:Dfp(C@s)g4ASuT48g%\_G%ku8DJ`s&F=n[Y6#:?[GAhM4F!+n3AKYMpAnc-oA0>T(+CQC1
F_tT!Eb/c(F(96!FCSu,Ci<flCh4`2BOQ!*BlbD,Eb/[$ARlp-BOu'(8l%htCi<`mF"SRX8l%ht
A9Da.+EM%5BlJ08+Co2-E,8s.+Dk\2F(&]mF!+n'FCfJ8Ci<`mBl7Q+@UX@gBOu6-De:,1@VTIa
FE9&W+B3#c+Dtb8F<GC.@N]`6AT/c.Ddd0t+EV:.+E_d?Ch\!:+Co1rFD5Z2@<-WG%13OO=(-,e
Bl7QE+CoV3E$043EbTK7F!+t$DBND"+Eh=:Gp$p3EbAr+F)N18F=2,P@3B3$De'u)A7]0lFDi:E
F(HJ&Cj0<5F!,UHAKWBT+Zais/g)91Ddd0jDJ()#+CoV3E$043EbTK7+DG_8D]hXpF(KE6Bl@l3
ARoLsDfTnA@ps6t@rc"!BHTniAoD]4G%G]>+DbJ,B4W3,@rc:&FE9&D$7QDk%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2%15dI@:UL&BOr</FD5Q*FD5<-+Co1rFD5Z2@<-WG%14Nn$;No?+EDUB+EV:.+E_d?Ci^_0
F_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<9FD5Q4/no'A
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;IsKPDImisFCcS;FD5Q4+CfG1F)rIEAS,LoASu!hEt&IUBOr<&
@<6N5D.Rd0@:s-oA8-+(CghU#A0>?,+CQC'F_u(?F(96)E-*4:F!+m6Eb0*%DId=!+EVNEEb/lp
DImisFCcS)Ec6#?+ED%*ATD@"@qB^6+<X9P6m-#S@ruF'DIIR"ATJu2@;0V$@;0U%GAhM4+CfG1
F)rIEAS,LoASu!hF!,R<@<<W#Eb-A9F(Jl)Bl5&1@;^?5G@>c</g)99BOr;rEc6#?+ED%*ATD@"
@qB^(@<,p%DJsV>F*)>@ARlotDBNJ4D/aP=@;]TuD09oA+C\n)Eb/a$ART[lA0>;mFCfK:@<,n"
/e&.:%15is/g,1GB4YslEaa'$+E_d?Ch\!*ATJu(Ec6#?+ED%*ATD@"@qB^(@;]TuF(fK9+D,>.
F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D]gDT%13OO%15is/g,">CLnW2FD5Q*
FD5<-+CQC5ART*lDf0B:+Co1rFD5Z2@<-W&$=n*sATT%B;FNl>:JOSd-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l39Q+?M+DPh*%16'JAKZ,;Bl%L*Bk;?.A8,OqBl@ltEd8dAF!,@=G9C^?@:Wq[+CT.u+CfG1
F)rIEAS,LoASu!hF!,.)G%De*AS#a%F`:l"FCeu8+<XX%+Cf>,E,9*-AKZ).AKZ#)F*)>@@<?4%
DBNk0+A,Et+EMIDEarZ'@rGmh+EqB>DJs_A@rc-hFCcS'DIal+Ddd0!-u*[2Ci<`m.3N&:A0<:8
De*BiG&2)*A19,?$7QDk:-pQU@rc-hFCcS*Bk)7!Df0!(Bk;>p$>sF!A0<77De*[&@:U`I-u*^0
FD)dEIS*C(;bpCk6U`YCDe*[&@:U`74""c]A0>r3F`Lu'+Cf>#AKYMt@ruF'DIIR2-OgE#ATqZ-
-YdR1A7]q#Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+C2[WnAThm.@:U`74""c]A0>DoG%GK.E,B0(
F<GOFF<G+.@ruF'DIIR2-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^+EMIDEarZ'@rGmh+Co&&ASu%"
+E)-?DdmHm@ruc7Bl5&8BOr</FD5Q*FD5<-+Co1rFD5Z2@<-WG+<XWsBlbD;ASbdsBl@m1BPDE.
BlbD6@;0V$@;0UjA0>?,+EV:.+E1b2BHV56A7]d(De:,&Bk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+
F(HJ&DL!@CE+No0A8,OqBl@ltEbT*++:SZ6+E(d5-RT?1%15is/g,(OASrV=C2[X!Ddd0*+CT.u
+=MASBl%j,Ddd0*%17#a+?MV3C2[X!Ddd0!F`_>6F)5c'A1%fn%15is/g+\=F)Yr(Gp$X3@ruF'
DIIR2+DG_*DfT]'FD5Z2%16W[A:>XD0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0=K?6m-PhF`Lu'
+Cf>#AM,)J<+ohc8l%htA8,OqBl@ltEd8d<F_u(?BlbD5@<-!l+C\nl@<HX&+DGp?@rH7,@;0V#
+CQC6F^fE6@;^1$@;I&pD/XQ7F<GL6+CoD#F_t]-FCB9*Df-\+DIal3ATMr9A79Rg/g*`-+DkP4
+EV%-AKYD(An?0/D/X9&DKKqBFDi:<Ddd0/%14Nn$;No?+Dbt)A0>W*A.8l"+Z_;"4DJhDFD)dE
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A1hS2F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Auc`ASu("
@<?''C2[W*@rcL/F!,L7An?!oDI[7!%15F5AoD^$+ED%+ASu("@<?4$B-:r-A1)F@@rcL/F!,L7
An?!oDI[7!+Dbt7CER&-+EV:.+E)41DBNJ(@ruF'DIIR"ATKIH+B3#c+=LuCA8H0mA18X3Bk)7!
Df0!(Gp%!CG9CR-F!+m6Eb/ioEb0,uAKYr#FD)e=BOQ!*Bl7EsF_#')+=MASBl%j,Ddd0*/e&.:
%15is/g,%MFCcS:BOr;7C2[X!Ddd0*+E1b2BFP;ZBk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^
+CfG1F)rIEAS,LoASu!hF!,[@Cht5)AT23uA0>f.+E_d?Ch\!*ATKI5$7QDk:-pQUEb/lpDImis
FCcRCC2[X!Ddd0*+CfG1F)rIEAS,LoASu!hF!+n/A0>r,Dg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ
/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%15is/g,">CLnV:C2[X!Ddd0*+CQC5ART*lDf0B:+Co1r
FD5Z2@<-W&$=n*sATT%B;FNl>:JOSd-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39Q+?M+DPh*A7]on$;PM`
+DbV2-Z^DHDdd0!@;]Tu@rcL/F!,L7An?!oDI[6#-u*[2A7]q#Ddd0*/g)8bC2[WnAThm.@:Uf0
BlbD@BOQ!*8K_MOCht59BOr;1A7]p9CghU#E[!+Y+B3#c+Co&,/Snj@ATAo-F!+m6E-67FA8,Oq
Bl@ltEd8dLBOQ!*F(o`;+E)-?FDl+@De:,#+Du==@V'R&De:,5FCAWpAKYMt@ruF'DIIR"ATKIH
7!3NaDJ()&AThX$DfBQ)DKI">DJXS@FD,5.A7]p9CghU#EZek*@;]^hF"SRX=`8F*@ps6tARTXo
Cj@.DATi!-AKYD(A7]p9CghU#EZen,@ruF'DIIR2+C]U=@r-()Bl7Q+Blks:$7QDk:-pQU@r-()
AKYo1ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DG^9@rHC.ARfg)E+*j%+E):2ATA4e1E^UH+=ANG
$?'Gt4$"a(De*BiG&2)*A0>W*A8H0mA0?#:Bl%j,Ddd0(%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M
+CT.u+CfG1F)rIEAS,LoASu!h/e&.:%15is/g+tK@:UK/C2[WnAThm.@:Uer$8<Va0H`JmE+*j%
+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[WnATf\?C3(a3$4R>;67sBpDKBr@AKYE'+DbUt
F*&OCDIjr'Ec6)>+D#e3F*)IG/KeS8Anc-oF!,FEF<G+.@ruF'DIIR2+E1b2BFP;]Ec<-KC2[X$
DC7Mo/g+eIE$-NCDe*d(-OgCl$;No?+CfG1F)rIEAS,LoASu!h%14s8HS-Ep+D5M/@WNk[+FPjb
Eb0E4+=ANZ%13OO:-pQUA7]pqCi=90ASuT4E+*j%+Co1rFD5Z2@<-'nEt&IeBk2Z80F\?u$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l37qHRLEaa'$+D,b4Cj@.5Df'?&DKKH#+DPh*+EM%5BlJ08%16'JAKXT@6m-Ph
F`Lu'+Cf>#AKYMt@ruF'DIIR"ATJu-@<Q3)DJs_A@V'+g+ED%7FDl22A1eu6$4R>AD]i\(DImis
FCcS,F_kl>+Cf>,D.RU,ARlp*Ea`KmFD5Z2@;I&Y+EM%5BlJ/:Anc'mF!,(5EZfI;AKYK$D/aE2
ASuU2+E(j7FD,5.8l%htF*VhKASiQ8Dfm14@;[3.F`&=1+EM%5BlJ/:F*)>@ARlotDBO%7AKXT@
6m-#S@ruF'DIIR"ATKIH+B3#gF!,OGAT/c4F`)7CFD,B0+EM%5BlJ/H%14Nn$;No?+D58'ATD4$
AKXT@6m-P\EbTK7+D,>(ATJu.DBNP6Ci"A>@rH4$ASuU$A0>K&Ec!E<$?Bu+-Xq44Ch.:!A92[3
EarZ.%13OO:-pQU@r-()AKYMt@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhg
DIIBn+A,Et+Dbt)A0>Ds@ruF'DIIR"ATKI5$<1\M+A,Et+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'n
F!+n3AKYl!D.R6#-u*[2A7]p5+=LuCA18X0DIak<F`_>6F"&^a+AH9^Gp%3?F*&O5DIal!F_PZ&
+EM%5BlJ08+DG^9FD,6,AKYMt@ruF'DIIR"ATJu2@;BEsF`V+:De:,6BOu6r+DtV)ATKIH+B38%
A8-3u+DG_8D]hYJ6m,uXA7ZltF=2,P@3B3$De'u)A7]0lFDi:3DfBtE@;]TuEb0,sD.Oi3BOr<&
Ddd0!A8,OqBl@ltEbT*+/g+/3@rH4$ASuT4@;]TuEcl7BFD,5.AoDL%Dg,o5B-;#)DIml3FDi:3
DfBtE@;]TuEb0,sD.Oi3BOr<&Ddd0!A8,OqBl@ltEbT*+/g(T1%160&;GKeY7lhbm:.%fO9gqfV
+AYa+=Wg:*+B_K?+@K!J:/=h35tk0F5t"iu83p9F+=LuCA7T7p.3L$RDe(:>5u'fj.!9WGCi_$J
6qKaF8P`)I;Fs;U/e&.:%15is/g,:SEb/ltF*(u6%15is/g)qmEb/lo-9`P63[]&lBl%j,Ddd0!
C2[X!Ddd0!C2[WnAThm.@:UL'FD5Q4+DPh*+DPh*A7]p3%13OO:-pQU@r,^bEZee.Gp$j?A0>r3
F`Lu'+Co1rFD5Z2@<-'nEt&IO67sBUDffPO+Cf>,D..<mF!+n3AKY&gDId[0F!,CABk;1(ARmD9
7W3;iF`(o<+EMgLFCf<1%15is/g,1GD/XT/+CT.u+Cf>/Gp$X3Eb/a&DfTQ'F!,=.DKTB(Cj@WB
$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4-RgSo+t!g,:-pQU
F(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[79jSGA1&fW-R'oI$;No?+EM4-Cht4A
Eb$:GF!*,U+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiFse^i-R'oI$4R>;67sBjDfBtEA8,Oq
Bl@ltEbT*++>"]hAKYo1FD5Z2+Cf>/Bk;?.Eb065Bl[cq+D#D/FEo!MF^elqEb/a&DfTQ'F!(o!
:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4Ci<`m-RgSo+s8'W/1>7P
@<?0*-[nZ`6rQl];F<lXF`_>6F'L(A/12Va04c7ZGpa%.:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0
FD)dEIS*C(;bpCk6Ub6pDe*[&@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jSGA6^K2/12Va
04c7ZGpa%.:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*BiG&2)*A1&fW
-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]ph-RgSo+s8OM+>8!f%13OO:-pQUEb-hCAS5^u
FCfJ8GA2/4+Dtb7+DtV)ATJ:f:-pQUEb/lo+=D;RBl%i<4"+i_@<?0*-[nZ`6rQl];F<lXF`_>6
F!iCu-YI".ATD3q+E_d?Ch\!*ATK4.$;No?+ED%+A0<77De(4W-u*^0FD)dEIS*C(;bpCk6Ub6p
De(4E4""c]A0>r3F`Lu'+Cf>#AL@oo:-pQUEb/lo+=CoBA7T7p-T`_kE+*j%+=DV1:IJ,W<Dl1Q
>\\1fA7]p3.6AnlDe'u$AThX$DfBQ)DKI68$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMl#D/E^%Gmt*[BPDN1
CggcqF(fK9ARlosDg*=GD]ik7@:UKkF_u(?F(96)E--.R+<X9P6m-PhF`Lu'+Cf>#AKYMt@ruF'
DIIR"ATJu<ATD?)Ci<`mARmD9+B38%F`V+:FD,5.8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.D..3k
+EM[GAKZ).AU,D,Eb-A2@;TRd+=LuCA7T7p.4cSiC2[W3+CT.u+=MASBl%i>/e&-s$;,5MDBM8S
CLqMq$;FrL@qZu?0JPNr$=[FZATDNr3B9?;D..-p/n8g:%14Nn$4R>WDe*R"FE2:T2,$;&<(U%_
76N[S-V@0&+=Jrn+A$HmEc5K2@ruF'DC5l#9L2!2<E)Lb;E[&`0H`D!0F\@]DeO#26nTTK@;BFp
%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV;a!/a-WFbnF!,:-@N]B&FE2;1F^o!(
+EV:.+A,Et+EMgLFCf;3/Kf(FG%l#/A0>K&EZdss3%cn0+AH9b@qZu?0JPO7%15cp6:FdM:Jt+S
3Zp-d$;<`P7ScBO;a!/a0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3=(l#a+DGm>8l%i>%15^'6m-2b+CQBb
+EqaEA0>r8DfT9!AKYE!A0>o(FE2),G%#20F*VhKASj%/$4R>ABOr;q@<6-m+DG@t@3B#jBPD?p
+A,Et+DGm>FD,*)+A*bqEc5T2@;TjqDJ()+F!+q'F*&OJBk;L"A0><%+E):5@;]e*Bl7Q+@3B&u
Ci!ZmFD5Z2+E(j7GAhM4F!,RC+E1n4AoD^,+CQC7@<63:+A[#j@;]e*ARlonDes6$@ruF'DK?q=
Afu;9Eb'56BOQ'q+CQC%ATW$*EZf7.D.PaN6qKaF8P`)I;Fs;U+Unc-%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k8l%htBlbD*+A*bbA7TUr/g)9.F<G:=+DG_7FCB!%ARlotDBO%7AKWCM@:WneDKB&qASu("
@;K1`De(:>@WGmp@q[!'Afu2/AKYK*EcP`/F<F0uF*VhKASiQ%DerrqEZeh:+EV:.+E1b!CLLje
+DkP)@:s.l+E)9C@X0)=DL-#9E+s3&+EV:.+Co2-FE2))F`_>9DBO7>E$-QDDe(JHBlGLR+<XWs
AKYl%G]Y'E@:C@#FCfD6Bl7X,BjkglH=_.?FD,5.8l%htF*VhKASj%/$7QDk:-pQUF`V,)+C]U=
FD,B0+DbIq%17,eEHPu9AKW@4Bl%@%+Co2,+EV%5CF9Pu%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*AjEc`Er
:IGX!<+oue+EMX9E$04D@<-I2+EV:.+A,Et+EMgLFCf;A%14Nn$;No?+EMX5Ec`F=De'tB+CfG'
@<?(%+DkP.FCfJ8Anc'm+DGF1DIm<hF)tc1Gmt+$AT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[qASl@/AKYo-A0>\s@N]2q@ruF'DIIR"ATJ:f8l%htBlbD2DKBo.Ci!Zn+EqOA
BQ&$8+CT/5+Co1rFD5Z2@<-'nF"SRX+B38%F`V+:8l%htH#IgJD09oA+CfG'@<?''F)Po,+Co1r
FD5Z2@<-'nF"SRX<+oue+DbIq+E_a:F!,(5F`JU9G[YH.Ch4`"Bk)7!Df0!(Bk;?.-u<=$.4cSi
Cggd`ATfLR+=M>MGpskEDIak<E,8s.E+No9/g)9/:IH=9Bk)7!Df0!(Bk;?.@<,p%@rc-hFCeu*
GA2/4+EV:.+=M,=G@W-F,&Ut9+Co1rFD5Z2@<-W;+Eh=:@P/c4$4R>/AS,k$AKYK'ART[pDJ().
@:C?iBk)7!Df0!(Bk;?.Eb0*+G%De)DL!@DEbTH4+DbIq+Co1rFD5Z2@<-'nF"SS7BPDN1F*(u4
+Co%qBl7L'+CQC8FD5Q*FEo!NBOQ!*GA1l0+D#S%F(HJ)Bk)7!Df0!(Bk;?.Ao_g,+Co%q@<HC.
+Dbt+@<?4%DK@EQ8TZ(hF!,LGDBNY2+EV:.+Dtb8F<GXHAT07E%13OO=$]_Z8PVc:+A#$F<(KG#
<(0MX:JsJV=WgC(66JZf6W?WQ:-hcL78k<r:JOkT8PUC":.A#W9gM`M:JN$8:K8N)5uL,o5se@I
<$4S)+AP^3+@TC$6WI)S+B1m#+AP@-<$4k#66K3+78P-:$7QDk;Is]`G%F?U@ROp?FD5Z2@<-'n
F'iWrDe*3<3Zp4$3Zp*c$?C''F?M6!C2dU'BHS[OF`V,7-OgDsAhG2t7TW/V+CoCC%144#F(f-$
C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]'@:EbYFs8:C$6UI4BOu!r+=D2?+>7dY06&*Y
-S0:VDfdNX>\\1fA8,OqF'NNi@Nm0/$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX>\\1fA8,Oq
F'Ng*Gp4UF$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX>\\1fA8,OqF'N[#@<lg'DB^G;$6UI4
D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUGA1qD+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhG2t
7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>qCgh3sF!,17+E1b2BQG;7DBMVeDKU1H@;]Tu9jqNSF*VhK
ASlJt$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*O@:EbYFsd_++<Y`=ASc0*-ZX&H
/TPGG-S0:VDfdNX05>E9A8,OqF"_?<@ODTl+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A8,Oq
F"_WRGpa%.+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A8,OqF"_KK@<lg'DC5l#+<Y`BDfp/@
F`\`R9OVBQFCf<.DfT9,Gp"MP@:Ls,Bl8'<.3N/8@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.
D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+F`S[IASlC)Eaa!6+DbIq+Co1rFD5Z2@<-'n
F!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;tGPDg#\7@;^?5E,oZ2EZf1,
@N]2q@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp$X3@ruF'DIIR"ATJtG+DGJ+DfTD3ATDg0
EcVZs0H`%l,TnlcDe't<-OgCl$;No?+E_RBAS5^uFCfJ8@;^?5CggcqA8,OqBl@ltEbT*++>"^M
B5VX.AKYQ)Ec5u>%14d30H_V`1E^^LB4N>Q+?MV3Cggd`ATf24@:C@$Dg<IECghU.ASrk)$4R>;
67sC$ASl@/AKYMt@ruF'DIIR2+Co2,ARfh#EbT*++CT.u+CT)&+Cf>-FCf?3F!*%WBkM=%Eb-A)
EcQ)=Et&ISASl@/AP?NA6tp.QBl@ltEbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'JBlbD<FCfD6
@rc-hFCfM9FD,5.-u<=$.3N&:A0<::@:EbYFt"PEBk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+F(HJ&
DL!@CE+No0A8,OqBl@ltEbT*+%14m6De't<-OgCl$;No?+CfG'@<?''-u<=$.3N&:A0<!CCggd`
ATfLFA8,OqBl@ltEbT*+%16uaG@VgDCggd#%16uaG@VgDCggd`ATfF1$4R>;67sBsBleA=@<Q'n
CggdhAKYMt@ruF'DIIR"ATJ:fDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3:N0l_Bl7Q+@3B&rDf]W1
B-:`!@ruF'DIIR"ATKI5$<1\M+A,Et+Cf>,D..<m+D,P4+E)41DJ=!$+CT.u+Cf5+F(oN)+Co1r
FD5Z2@<-'nF!,1<+=M/=.3NPL+=M/IASrW$Bk)7!Df0!(Gpt?g8l%ht@rH4$@;]Us+CT;%+EM47
Ec`F4DIal$@<6]:FDi:DH#R=I%13OO-uWWF+Ceht+E)41DBNJ(@ruF'DIIR"ATJtl76s=C;FshV
+CT.u+AtWo6r-QO=Y:g_F!,aHFWbO8B4uB0AU&0*@rrhk76s=;:/"e5A8,OqBl@ltEbT*++Ceht
DJsV>@V$ZlBOPdkARlomGp#^T6m,uXD/E^!A90@4$7QDk:-pQUDfB9*+ED%%A1r.IBlmnq$?'Gt
-Z!4#A7]p3%13OO:-pQUDfB9*+ED%%A1qk=Cj?Hs1*CLG+=Cu6@ODTl%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+B*2qAKYK$D/E^!A0>o(FEMVA+Cf>#AKYGjF(o-*%15C;C`l>G6m,uXD/E^!A9/l6ATW'8DBND,
G\(D.Ch[s4+ED%7F_l/@/g+,,AKYT!EcZ=FBlmp'+DGm>@3BT%FEMVA+Cf>#ANCq^0e"5XDf9//
-nm(m@UWe"+<XQnD..-rBl7Q+Blmp'F!+n3AKYi$F)tc&ATJu&DIb:@F`V\6Ci"AJ+D#S6DfQt@
ASbdsARlotDJ!g-D..O#Df.0M+A,Et+Cf>,D..<mF!,F5Eb961D'3D7FCf?2Bm+&1@<-"'D.RU,
+Cf(r@r#drB.b;L8S0)jDfm13Eb/Zp+CQBb:IH=8Df'?"DIal/Ch7$rAKYQ$@;0O#D.Oh<@UX%`
Eb],F3C%4o@;0O1@rH35+CT.u+EV12C`mS++EqL-F<GjIFWb4/A1e;u.1HVZ67sC%Df'&.ATDg0
DIma/F!,C?ASrW#Df'?"DIdet$?'Gt-YX]3D'370D/"'4Bl7Q+A8,OqBl@ltEd9#A$4R>;67sBi
@:UL&H#R>9%17#a+?9l<%15is/g+V3A0>o$DJO;&$?'Gt1E\J!-Xq"4-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l3:Msu_DIjq_:IH=9De!p,ASuTuFD5Z2%15^'6m-/OF!,%=FCf?2Bm+&1-u`^/.3N/>@s)X"
DKK</Bl@lA+A,Et+CoD#F_t]-FCB9*Df-\-@;[2sAKYDk@qB_&ARlp-Bln#2FD,5.-u*[2BOu"!
.3NeFEagX1$4R=jC2[WrASc<7+EML1GA_IE@3AB77Nc__@:Wqi+EV%5CG$`%:IH=JF(HId-Z^D?
Df00$B6A6+A0=]:7Nc__@:Wqi+E)-?=(uP_Dg-7F@;]Tu9PJBeGT_'QF*(u1F!+n/A0>u-AKW18
E+No2+EM4-Cht5(Df'?"DIal.DBMY^@rj73$7QDk:-pQUA8-+(CghT38l%htA8bt#D.RU,@<?4%
D@HqfDe*NmCiCLN%13OO:-pQUCi<flFD5Z2+E(j7D..-r+A,Et+AbHq+CoD#F_t]-F:ARlE+*j%
+=DVHA7TUrF'N?hDImisCg:^nA7TUgF_t]-FBicqAn5gi-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tp.Q
Bl@ltEd8dH@<?1(%16'JAKYo1ASrW$Bk)7!Df0!(Bk;?.De:+a:IH=9AS,XoAKYD(F(Jd#@qZun
DIal%ATVEq+E1b2BJ(E,BOr;7A8,R'+=Lc7@ruF'DIIR2+DG@tDKKT)Bk(RnBl@l<+Eh=:@N]K$
F*)IGFD,5.E+*j%/e&.:%15is/g,4KDg*=C@<?/l$=mj]+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'J
AKYN/@:X(^+D,P4D'3b/+=Lc7A18XAATW'8DK?q2ATV?pCi^_-@W-C2+EV:.+Cf>-FCf?3F!,C5
+D"tkBHUi"@ruF'DIIR2+E)-?FD,5.E+*j%/e&.:%15is/g+\=@ruF'DIIR2+Co&*@;0P!%14d3
A8,Qs0F\?u$;No?+Co1s+FYFe+<Ve%67sBo@;]V$+DGA#Df#pj%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*2q
AKYo#C1Ums+E):7ASuTuFD5Z2%16'JAKXT@6m-PrF*(u1+DGm>@3B&uD/a<&FCcS'DIal#ATV?p
Ch7-"AU%X#E,9).De:,1@VTIaF<GLBBk;1(ARlp&Ec5T2@;TjqDJ()+DBMP(+<XWsAKZ&>F*(u1
+Cf>-F(o];F!,C5+CQC1F_tT!EZf:4+Cf4rF)to6+=M2LAS,Y$ARlp-Bln#2-Xgb.A1&fY+<Xa!
ASrW4BOr<-H#n(=D'3Y5@:XF%@3B`%EbT*,Gp%$;+E(_(ARfh'+CT;%+CfG'@<?'k/g)99BOr;q
@<6-m+CT;#BPDR"@ruj6AKY].+CQC0@;0U%A8,OqBl@ltEd8dG@VTIaF<G[=@<<W%Df0Z*Bl7u7
AoDg4+EM[7DdmHm@rucE+@T^KBHV54ASrW$Bk)7!Df0!(Gp$gB+CT)-D]iJ0F)PQ&@<?'k+EqOA
BHU_+A8-'q@ruX0Gp%$7C1Ums/g*PrEb/a&DfU+GDdmHm@ruc7@<,p%@rc-hFCeu*@;]TuA7]h(
Ec657A0><%+ED%5F_Pl-A1e;u.1HVZ67sC!@VTIaFE8R6AS5^pDJ=!$+EqOABHS[2C2[W1+CT;%
+EV:.+A,Et+Cf4rF)to6/e&.tDf0A60F\?u$;No?+A,Et+Cf>-F(o];F!,C5+EM7A+C\c#Bk&9(
@VTIaFE8R5DIakuEt&IO67sBt@;^?5A8-'q@ruX0Gp%$7C1UmsF!+n4+EV:.Eb-A%Eb-A4@<?0*
Blmp'F"Rn/@rH7$+>F<4%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B3#c+E2IF+Co1rFD5Z2@<-W9@rH6pAT2`#
$<1\M+D,>.F*&O8Bk)7!Df0!(Gp%$C+EV:.+E1b2BHV#1+EML5@qf@f/g)9.F<G:=+EV:.+E).6
Gp"5?Bk)7!Df0!(Gp%3B@<<W%@;[2sAKYi.A8,XiARlomGp#^T6m,uXD/E^!A90@G+@9XL@<HX&
+Dl%<F<G+.@ruF'DIIR2+Dl%-BkD'h@<?4%DK?q/Eb-A4F`]!P+A!\c@;Ka&FD,B0+Co1rFD5Z2
@<-W9FD,5.,&h[H+s:E1@ruF'DIIR2/e&-s$;#=eF!,16E,Tc=@;^00FDi:EDId=!F*(i.A0>u-
@<<W;Dfm14@;[31F(HJ9BOr;rDf0Z.DKKqBDe:,6BOr<)FD,6++Co1rFD5Z2@<-'nF!,C=+EV:.
+E1b2BHUc,F<GjIFWb1&DJjB7+Cf(nDJ*N'FD,6&+DG^9@;^?5G@>bL%14Nn$;No?+D,>.F*&OD
@<?0*A8,OqBl@ltEd8dAF!,R<AKYr7F<G+.@ruF'DIIR2%16W[A0<Q8$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM;eART[pDJ()0ATo8-Bk)7!Df0!(Bk;?<%15F5AoD^$+Dl%-BkDX)DJ()6BOr;rDf0Z.DKKqB
De:,#DL!@8Bk)7!Df0!(Gp$p7F=2,P@rc-hFCcS'+Dtb7+<koGGp4AABk)7!Df0!(Gp$O5A0>_t
CLnW&F<G[=AKYr7F<G+.@ruF'DIIR2/e&.:%15is/g+Y?Df]J4DfB9*+Co1rFD5Z2@<-'nEt&I4
+E(d5-RT?1%15is/g+YEART[l+=M>MGps10DIn$&+=D8LGpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15g<
CLnV:FDlFR+CQC3F`\a:Bk)7!Df0!(GqKO5.1HVZ67sC!E+No0FDlFU+DbIqA7]p,@;]TuCggcq
/Kf.RGp$gB+EV:.+E2IF+Co1rFD5Z2@<-W&$?'Gt4$"a2Dg<IA@:EbYFs(U0@ODTl%15is/g+kG
F*2M7+EVOI+DGm>Eb/Zi06_GNFCbmgA8lU$F<Dr/76s=C;FshV-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
7qHdaBl7Q+@;]TuE-68EBl7Q+GAhM4F"Rn/8T#YmBOr;uBl\9:+EM+(FD5Z2+A!\s@;06p8l%ht
BlbD*+EqaEA0>r8DfT9!AKYE!A0>o(FE2),G%#20F*VhKASj%B+AQj!+EqB>@<,p%Eb/ZiGp%3I
+=M2OF=A>@DIak<B4Z06+EMI<AKZ28Eb'5D%13OO7VQmaF<G(6ART[l+EMI<AKZ28Eb'56FDi:C
FDl22/e&.:%15is/g+YEART[l+EMI<AKZ28Eb'5#$?BQmA8c<J3ZpXA0H`)(,V^u,+<XEG/g,%S
D.Ra%@j#Z-F`%WqFCf]=4ZX]5FD,B0+DGm>@3BZ'F*&OCAfu2/AKYo/AKYr7Eb-A8BPD?s-OgDp
Ci<a(F$2Q,1*A(i,p4or0I&;+0F\A1H#7#/Ci_a#+EKRd-Qm>F@q?d"DfTD3GA2/4+D,1rCh[d"
-OgDlDg5i(4ZX]J+u(3S/g)nl1CX\3@<?4%DII@&4ZX]?0JFV"+=/-Y5!!C1+>GQp.3Mq>2)#IH
F`(o'De*EB3ZrQ++=D8EBlbD2F!,@=G9D$GBk)'lAL@ooART(^4ZX]4/j:C#+<VdL+<VdL+AP6U
+EV%%BlkJ+A9MO)@LWZUG]7J5@qg$J3Zp7%3Zp*c$;No?+D#e:Ch[BnF<Ga<EafIbGT\Lh+F+D'
.1HUn$?pE/A90mp+?MV3Ea`irDf$V=AU&;>Ao)BoFE8RGH#7#/Ci^_.Dg5i(+ECn4Bl@ltCi^_A
DJ<U!A7Zlp@:NsnAU&01Bk(k!-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kk9F=A>HF!,R<AKXT@6m,uX
D/E^!A0>u-@<<W5FDl22F!,[FEb'5D%13OO;dji\+CT.u+D#S%F(HJ9BOr<1DfTB0/g)99@;BEs
F)Po,+EV=7AKZ)5+Cf>-G%ki(AKZ8:F`MP7Ch=f3BOQ!*FD,5.GAhM4F!,.)G%De*AS#a%ATD4#
ARlomAS,k$AKYr4De!?iA8,po/e&.:%13OO:-pQUF('6'+EqaEA9/1eE-67FGAhM4Et&Hc$;No?
+D#S%F(HJ)AS,XoBln'-DK?6oATD4#AKZ28Eb'5#$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqJDg*=EATVs,
AThW-FD,5.F*)>@ARlp-DfTB0+CT.u+Cf(r@r!3/BOQ!*FD,62+CT;%+E2@>E+O'+Gp%-=F*)>@
ARmD&$7QDk:-pQUB4Z0-GAhM4Et&IhATT&=DfTB0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cDe!p,ASuTu
FD5Z2+>GQ)%15mKAKYo'+DlBHE+O,6E+NU(ATJu.F!,UCA8bt#D.RU,ARlonDe*E&%13OO88i\p
De=*&DBNV$G%DeADfm19@:UL&D]iY#@q?crF`(`1ARoj5+DkP4@V$[(BQ&$7@;]Us/0JkC+Dbb0
ATJu4AftT%A7Zm-Bln#2DIIR2+CQC&Df'?&DKI"8DBO"7B4uB>+@C'aD.RU,F!+n3AKYl/F<G16
EZfR?D/aP=@;]TuB5)C&GqElEDD!&2ASc0sDJ()%Df'?&DKKqB@<,p%@3B5lCi!rsEbce9Aft`)
De'u#De*E3%13OO8l%htE,ol?Bk1dr+CQC1F_tT!EZf:4+Eq7>F!,RC+CoD#F_t]-F<GdGEb'5D
+BN5fDBN@1GAhM4+DGm>Bl8$5De+!#ARlotF=2,P@3B3$De'u)A7]0lFDi:CFDl22+CQC6BQ%p5
+E)./+Dbb0AKYMpF(96)E-,f4DBNk0+EV:.+EqaEA1e;u.1HVZ67sC%FDl22+EM47Ec`FJDfTA2
A7]glEbTK7Bl@m1%14d33$<0_F<DrO@;]UoD'qCmEa`irDf$V2DKKH&ATAo8@:F%a-OgCl$8<S^
+E2IF+=C`/@q[5O-Xgt5Ch[I%+DbV$F<G"4B6A'&DKI"CD]iJ/Eaa59Blmp'F!hD(%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15mC+Cf>4EcYe7H#IgJ@ps6tG%kN3+F.mJEZfFFDfTE"+Co&)@rc:&FD5Z2F!,[@
FD)dFB4Z06/e&.:%15is/g+e<F<GX<DfTqBAU&01@;]LqBl@m1%14d33$;jFF<DrO@;]UoD'qCm
ART(^-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;GGZAKYMpFCAm"ARlooDe!p,ASuTuFD5Z2+Ceht+C\n)
F*)>@ARlolDIal1ATVs,AThWq/g+,,BlbD<FCfD6Ci<`mF!+m6Eb/ZqBleB1@j#?-@;Tt"AKYo'
+EqaEA0>E$@s)X"DKK</Bl@l3Bl8$2+EV:.+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W9@;]TuFD,6'
+Co2-E,8s.F!,[@FD)dFA8-+(.4u&:%14LoBle5B+DGm>@3A0<6m-VoBl%L*GqL3^8TZ(hF!,R<
AKYo/Cj@.HATD6&FD,*)+ED%8F`MA@%16Md@q]:k@:OCjEZf14F*&NQGA(Q*+EM[8@qB_&Ap%o=
+DG_7FCelk+E(j7FD,5.F`V\6C`m2*G\(D.-urfZG%#30ALS&q.1HVZ67sBsDdd0t+=L`5@;]^h
F*)FO+CT.u+=L`5@;]^hF*)FO+CoD#F_t]-FCB9*Df-\3DKKe>FD,5.@s)g4ASuT4E-67FA8,Oq
Bl@ltEd8*$F(96)E-*3MIUQbtDf0W$B4YslEa`chC2[WfC2[X!@:F:_CggdaG[YH.Ch5:S0eR0T
F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'JBlbD<FCfE4+Co2-E,8s.F!,R<AKYf-DJ()&De!p,ASuT4
Ci<`mARlotDBO%7AKYr4AThd+F`S[HFCfDD%14Nn$;No?+EM47G9C^?DJ()&De!p,ASuTuFD5Z2
%14d33?VjHF)W6L@q]:gB4Z.+E[M;'%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AHcpAKYr7FED57B-:W#A0>Mr
FED57B.aW#-ua<N.3N&:A0<:5ATT@D@<,p%EHPu;AKYT$AU%ouCh4_tDIal"@;[3/FDl22+D#G4
Bl[c-Ci<flCh7Z?+<XWsAKYf-@ps1bF!+t$DBND"+DtV)ARlp%EZf7BD.7'sARmD&$7QDk:-pQU
F('6'+EV:.+=LZ5De*]nCLnq;Ci<flCh580CghC++DG^9,'7aK+q4l,@;9^kD..3k-QmANF<GmU
4ZX^'CgUUcDe*]nCLpiqBeCMb%13OO:-pQUEb0?5Bk;I!+EV:.+=LZ5De*]nCLnq;GAhM4F!,17
FDi:1DBL<OG^(SYCi<flCh4%_-[9l\-Qm&5F<GmU%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rARTUhBPD?s
+D,P4+EqaEA9/1e9PJ9R+Dl%<F<GXHDfT9!AKZ&>F*(u1F!+(N6m-GhDg#i*ATJu+@:O"fBln'#
F!,(5EZfF7@<,jkBl7Q+FD,5.@rH7,ASuU2+E(j7BlnD=A79Rg@UX=h/e&-s$<1\M+DkP$DBO"3
@<,jk+Cf>,D..<m+DGm>-tI43.3L$LBk)7!Df0!(Gp%!5D.Oi+BleB;.4u&:.1HVZ67sBsBleA=
@;Ka&FD,5.GAhM4F!,C=+EV:.+E1b2BHUbqB5)7$Bl7Q+GA2/4+=C]B-OgE!BleA=I4cXQDJUFC
A9B7/$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$A8Z34+Ceht+EM+&Earc*AoD]4GAhM4F"AGUATMs7/0JSG
Dfp#?/0K"VBlmp-+CT.u+DkOsEc6"O+<XWsBlbD<FCfD6@rc-hFCfM9F)Po,+D5_5F`;CE@;]Tu
FD,6'+Dbb5FE8R5Cht59BOr<!Ec6)>F!,C=+EV:.+E1b2BHVD1@<<W$AS5^p+EqOABHSZp:IHQ>
$7QDk:-pQU@rc-hFCcS9Df'&.B6%p5E,uHqB6%r6-ZaBMBl7R)-T`\cBOPdkATMs6-OgDqEc<-K
Ci<g*ATMr@4)SkA@;9^kD..3k?Qa&81^sd$$;No?+D5_5F`;CE@V'1dDJj0+B-;D4FD)dECi<f2
%14j50d("EC`k*ADdt.($4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBN"o@<<W#Eb-A8BOu6r+D,b6DL!@5EbBN3
ASuT4DKTf*ATDiV%15FI+Du+A+F.mJ+D>2,AKYr4Ddm-aCj@.@Dff]'ARlp*BOQ!*D..=-+A,Et
+Cf>,D..<mF!,R5CLnW&DKKH&ATAo%EbBN3ASuU2/g)9/:IH=6EbBN3ASuT4@rGmhF!+n3AKYo'
+C\c#Bk(RfCj@.FBQ@Zq+EVmJATKCFDdmHm@rri'De*F#/0JkMFD5Z2+Cf>#ATJu&DIal0F^]*#
AnbgsF"Rn/%16'JAKYo#C1UmsF!+(N6m-PmDfTE1+CT.u+ED%8EbT*.ATJu&Cht5-@<Q3)DdmHm
@rri'De*F#/g)99BOr<(AU&;>FCAWpAKYMtF)Yr(H#k*#:IH=D@VTIaF<G(3A7]fk$7QDk:-pQU
8l%htDdmHm@rri'De*F#%14LG+tt-R/g*&$+=o,f4$"`j:JsS'<(0_b+@f=*<DXf:<Cp.Y+AG-h
;GSE'8OHHK:JO2R=XOXc%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15mMFD5Z2+CT.u+E;O4Ch[KqATAo'De*F#
+EM+1ARfg)@;]TuD/Ws!ApGM;E-,f4DK@EQ+B3#cGp$O9AKYDtC`mG0FCf)rEcWiU7W3;iD/XH+
+DG_*DfT]'FD5Z2+CS_tF`\a7EbBN3ASuT4@rGmhF!,L7@:UKQ:IHRO+E).6Bl7K)A8bt#D.RU,
@<?4%DCuA*%15jKG9C^?DegJ(F<GXCD.Oi,DfTD3-tI43.3N,=D/E^!A90@4$7QDk:-pQU-tdR=
F`8lSDfBf4Df-[P+>"^Q@<?!m+E2@4AncK=+>"^G@<6!&D..O.ATDi$$8N_Y+CoA++=CtQ%13OO
:-pQU-uEC&Ec3KODfBf4Df-[Q+>"^R@;TQu@rH7,@;0V#+EMXFBl7Q4+>"^RD]in*@rcL/+F.O?
%14p71*C+FC`k*6E[M;'%15is/g,">CLnVs+DkOsEc3(/DIal2ARTUhBHU_r@;0Tg$8`lEF`\`R
@<-C$BI>l6;aXGS:fLe1C2[Wi4"!ci/g,"V+CoC5DJsW1Bl7Q+8g%tZ@rcK8%13OO1a"OrA8Z3+
-Xh$C%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fEc6)>F!+n/A0>r9Blmp-%15^'6m-GhDg#i*ATJu&+EM76
E,9).G@>b>FDi:7Ec6)>+EqaEA9/l%DIal3ATMs7/g)9&+D5_5F`8I;F!+m6@rH1"ARfgrDf-\9
Afs\gGAhM4F"SRX5p15kBlmo/BlbD*+Cf>+Ch7*uBl@l3De:+a+EV19F<GX7EbTK7F"SRX=`8F*
@rc-hFCcS'DIal,De*QoGp$a?Dfp#?+CT.u+EM[>FCfM9GA2/4+EV:.+=LlCE%)oQATD64%14Nn
$;No?+CfG'@<?''@3B3'Dfp"ADe:,9DfTB0+EqOABHV2$D.Rc2@V'1dDJj0+B-;D4FD)dE@q[5!
$>4Bu+=D8BF*)&8Dfp"H+?L]o/g+\BC`k*8BI=5r%15is/g+YEART[l+CQC7ATMr&$8EZBF`\`R
BOu!rDg-,?Ch+nT-SZ`J+=AO/:IH=IATMs7+CT;%+A*bt@rc:&FE8RHBOQ!*Eb0?8Ec*!SF!i=_
%13OO:-pQU@rc-hFCcS'+EV19F<GXIBlmo//KeqLFCcS2AS-$,@<-"'D.RU,+Cf>#AISu&+D5_6
+=D8BF*)JGBlmo6+?L]o/g)kkA8Z3+-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%166VFWb1&DBNb0F*&OH
BOr;rDf0Z.DKKqBDe:,)Ec6)>F!,CA+EM[>FCfM9GA2/4+=LlCE%)5'.1HVZ67sBsBleA=@rH7,
ASuU2+E(j7FCfN8B6%p5E$/e6Dfp".$>4Bu+=D8BF*)&8Dfp"H%13OO:-pQU@rH7,ASuU2+E(j7
FCfN8F*22=ALnsADffP5F*22=AKYK$A7Zm"AS-$,@<-"'D.RU,%14m6B6%r6-Zip@FE;S=FCcg/
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMY^CM@[!+D5_5F`;CE@;]TuF*22=ATJ:f:Ms_dDe:,6BOr<'@;0U%
@:XOiDKK<"ATJu4Afu/:DfTQ0B-9eh@rGmh+DG^98l%htG&o8Y@3BN*@;0U%F(96)E-*4:F!,R<
@<<W;Dfm14@;[3)@;0V$@;0U%@3AK?:.IuH+Eh=:F(oQ1+E(j7@3Bc4Eb$^DFCfN8/0JSGDfp"A
DfQtAF_Pr/+CT.u+EV:.DBNS'DImisFCcS3@;^?58g%qg@:UL%@rc:&FE8RHBOQ!*F`V+:A8,Oq
Bl@ltEd8dG@VTIaFE9&W6t(1G@UX=h+Co&)BkM<pEcW@5@;Ka&FD,B0+<k`AAKZ/-EcYr5DBNk0
+EV:.+EVXHFD*9N%13OO<+ohcAoDL%Dg,o5B-:o+F(KB6F!+m6F(oN)Ch4`5DfTA2Bl5%AFDlFR
+D5_5F`;CE@;]TuFD,6'+D58'ATD4$ATJu8@rc:&FE9&D$7QDk:-pQUCh74#+DQ%?FD5?4+EV%$
Ch4`4ATD5h$>aI"F*'Q+-Qjc`,W[&/-s[sC/g=XWINW>W+u(Du5U]n\AM,*0.4G]5%15is/g,4W
DfTD3Bl5&4F`\a:Bk)7!Df0!(Gmt+"F`\`RChe*6F=.M)%15is/g+kGF(KB6+DG^9@;Ka&E-67F
A8,OqBl@ltEd8d?Ec6)>F!(o!."*]j1*CUKG&JKN-Rg0HA7T=nE$dak4==r[F`VXP%13OO:-pQU
Ci=6-F`8HOEb0E4.3N>B+DPh*/oY?5+EqOABHS^<De*NmCiCg4$4R>;67sBnASu("@<?''@;Ka&
E-67FA8,OqBl@ltEd8d?Ec6)>F!(o!0Hb4KF!a'nI4cWt+ED%:D^QnA$4R>;67sBpAfu2/AKYf#
Aoo/(EbBN3ASuT4BlbD.Ch[EkA0>u-AKYW+Dfp#?+CT;%+DkOtAKY])FDi9MCi<`m.3N\AEbTK7
Et&IO67sBtCi^pe+FPjb1*CUKG&J`U%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@:O=rEt&IU@<64*/0JbC
CLnW2E+EC!Bl7Q+B4YslEaa'$A0>r'EbTK7F"AGD@;[2sAKZ&.D/a<*Anbge+EqOABHToC6m->T
@rcL//g)9&+A,Et+DkOsEc3(7F!+n/+CT;"BlnB(Ed8d"+EM%5BlJ/:FD,*)+Ceht+C\n)An?'o
BOt]s@;]TuAU%crF`_2*+EqOABHS^DD(.(H$7QDk:-pQUD.-ppD]j.8@<<W)ASu("@<?(%+CT)&
+E2IF+Co1rFD5Z2@<-W9B6%p5E,uHqC2[X"@:O=r4ZX]5:-pQUB4YslEaa'$+CT)&+E2IF+Co1r
FD5Z2@<-W9B6%p5E-!BX9L^Q\0Hb4KF!a'nI4cWt+ED%:D^Qn[-QjcG$4R>;67sC%FDl22+DkOs
Ec3'P+Cf>#AKW`_+EV12Ci^^k:IH=IBPDN1BlbD*+A*bt@rc:&F:AR6+E2IF+=D#7CLqI-FD#W5
F!j%)0fs,gA8PabEc2Bo%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!UDJj0+B-:V*8l%htD.-ppD]ib8+CQC6
Bl.g*AKYhuFED)7+E(j7DfB9*Bl7Q+FD,5.@;p1+DfB`2@<?''A8,OqBl@ltEbT*++CT.u+E_a>
DJ((?Ec!6J/Kf(VDBNe)@rcK?%14Nn$;No?+D,2,@qZunDIal$G\(B-FCcR($?Bu+-Z*:-AT2d6
B6%s4-OgCl$;No?+D,2,@qZunDIal$G\(B-FCcS9Bl%?uFDQ4F/Kf7OCht54DJXS@A8-+(CghT3
AU&01Bk(k!Gp$U8A7Zm%F`_SFF:ARP67sB8+ED<A-Z*:-AT2d6B6%s4-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$;Fr=Ec6"A@<,p%DJsV>Eb0<6EbT$*ARlp*D]hXpF(96)E--.R+<Xg*FWb1&DBNA(F)N1B
FDl22+@oI+9Iq;[@8pf?/0J%h9Iq;c79EM?+AG."912QW:+RMf<(8hi@;]Tu6<R8V+EM%5BlJ08
+DG^98l%htA8,OqBl@ltEbT*+/g)94DJXS@8g&1bEbTK7F!+t$DBND"+EDUB+D>\;AThX*/e&.:
%15is/g,4WDfTD39OUn3=<K"I1+=>SDIak\<)$%/-o*S-+EV1>FE7lu1a$a[F<DrI@<?(*-Ta(=
4!uX5/g*hr<+T/S@rGmh+>,9!-OgCl$8`lEF`\`RBQS*--Ta(>4!u.'/hS8;<)$%/@rGmh+>,9!
-OgCl$;No?+EMXCEb-@q9hZ[<DIakuEaia)Eaa!6+B1d3<$3SuH$!V=.4u&:1a$a[F<DrUD/:R]
=A;Ir@;9^k?TTVtFCfN85'1IPF!,1<+DbJ'AKZ57Ccj@mATMrW-OgCl$;No?+@94173H;c+E_R9
DKKH1E,oN3ARlomH$!V=+CT.u+Ceht+EMXCEb-A&Bl7@"Bk;?./KeqLF<GU8@rH4$ASu$iA0>K&
EZf1,EbAr+Anc'mF"Rn/1a$a[F<Dqt8PUWp1,_47ART+V@;9^k?Qa*&@<?0*-[oK7A8c@,>\@Vc
ATD3q>\\1f>\\+aF*(u6/no'4-OgCl$;No?+C]V<AKZ&.H=\4;Aftr!@rcJs$8`k[2'?OCF<Dqt
8PUWB$4R>;67sBt@:O=r+EV1>F<G[NE+O)5@<,p%@rH7,@;^1.+DG^9FD,5.D..-r+A,Et+Cf4r
F)qct8lJ)T8PiAn@;9^k?S!<n5u^9T?X[\fA7$l185r;W?X[\fA7$l1=A;Ir@;9^k?S!=!79EMr
@;9^k?S!<d=]@gs@;9^k?S!<o5uL?D:KL:u@;9^k?S!="<(8iS@;9^k?S!<r=]@pf:1%FEDe*3+
+B)-2?X[\fA7$l18lJM\?X[\fA7#cQ%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A8,po+Co1rFD5Z2@<-W9
A9Da.+EM%5BlJ/'$<1pdA7]UrDKBo?@<?''DffZ(EZdtM6m-)Q@<?X4ATJu<AKYl%ARlp)Df'&.
GAhM4F!,17+E)CC+Co1rFD5Z2@<-WG+<XWsAKYl%G]Y'LFCfD6Ci<`mF!)lI@:EbiD/_+AC3(gV
%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!CggcqA8,OqBl@ltEd8d<F_u(?F(96)E-*]A$7QDk
:-pQUBl8!7Eb-A'DfTl0@rri4@<?/l$?'Gt4$"a2Dg<IA@:EbYFs(U0@OE:&+>Y-YA0<6I%13OO
:-pQUCi<`m+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm
@WO2=@:EbiD/_+AC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq@F_u(?F(96)E--.DA8`T.Dfd+CFDl22
+EqaEA0>o(An?!oDI[7!/g)99BOuH3D09oA+C\n)B4YslEaa'$A1e;u.1HVZ67sC'E+EC!AKZ28
Eb$;5AS,LoASu!hF!*%WF(fK9+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:
D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMGcDdm-k+ED%*ATD@"@qB]j$;+)^+D>2)+D,%lBl%L*Bk;?.
AoD]4@psCuH"h//+E)CE+EMX5FD55-DIIBn+CT.rCjC)9F!,C=+A*c#DfTB0+CT.u+EV19FE9&D
$4R>ABOr;7B5DKqF"&5?DIak<F`V,8.3NeFEaj)4@;]LiH$X$E@;]TuF*)>@AKYl!D.Oi1AS,Lo
ASu!hF"Rn/.1HVZ67sBhDII@,H=\4:@;TRs%16`ZF<DrAF*(i4-OgCl$;No?+Cf4rF)u&-Gp%!5
D.Oi4F(HJ.DBNCsF(HJ1De!3lAKZ28Eb#Ud0eje`Ci<d(+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k=`8F*@ps6tF`:l"FCcS-Ci<ckC`mq?Eb$;5AS,LoASu!hF"Rn/.1HVZ67sB7+DGm>FD,5.
GAhM4+Cf>#AKWQIF*)>@ATJu,Ci<ckC`mb0An?!oDI[7!%14d3B5DKqF!)i@F*(i4-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@ku$7L%<ATK:CEb0?5Bk;I!F!,OGDfTE"+ED%*ATD@"@qB^6%14Nn$;No?+D5M/
@UX'qEb/ioEb0,uATJu+DfQsKA92j$F=@Y+F`V,8+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
.!9TBF"&5@ARfXqATJu;ATE&=,'@s<Ap%o6+EqL1DBNA(C`mq?Eb'56BOQ'q+EMXCEb/c(Eb/io
Eb0,uATKI5$7QDk:-pQUBl8!7Eb-A8Dg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a+?MV3FDlFI
Cggd`ATf24@:CT,>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@ps6tEb0?8Ec*":
@;^?5Eb/ioEb0,uAKYf'F*)IG@<<W1DI[61+B3#c+ELt.AKYr#FD)e<ARTUhBHV/'@q]:gBle,6
BlbD>F(Jl)AoD]4Eb0?5Bk;I%DJ()4AS,LoASu!hF"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!
+E(j7GAhM4F!+q'B5)7$Bl7Q+GA2/4+=D"R%15is/g,:XATJuB/g+\BC`k*B-OgCl$;No?+D5M/
@UX'qEb/ioEb0,uATJu4Afu;9Eb'56ASu$mDJ()9Bln#2-Z^XE$?^E$F!,l`+>=oo+CoA+-Z^XE
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMnlAKZ,:ATJu:DJ=$,%15mMFD5Z2+>Y_pDe:+?F`V,8.3NYBFEMVA
F!,R<AKZ,:ATKGGDJ=$,+E(j7@3Bc4Eb$dF+B3#c+E_a:F"MNPBl@l3BlbD+@<6-m@;Kb*+CQC8
DJ=*5AKYf'F*&O5Cht59BOr<1DfTB0+E)-?FD,5.@ps1i+EVX8AKYo'+CQC:DfTA@%14Nn$;No?
+E_a:F!,UCBl@l3De:,6GAeUJDfTB0%14mG+E_a:F!*P*-Y$S$D/X?1F!,OHDK9H4ATMF)0II;:
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$Bl7Q+Ci<`m+EM%5BlJ08%15^'6m,uJDBNS'DImisFCcRe
+Dbt)A0>r'EbTK7F!,(8Df$V-Bk)7!Df0!(Gp$a?Dfp#?/g)99BOr<!ASu("@<?'k+EM%5BlJ08
+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+EM%5BlJ/:F*1r&Bl[cpFDl2F/e&.:
%15is/g+e<DImisFCcS2Ddd0!F(96)E-)NrD/=89-ZaEJD/X?1-QjNS:-pQUF*2@RD/X?1+ED1;
AKZ&*F:AQd$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$>jU#+CT5.ASu%"+D58'ATD4$ARlp)@rc:&FE8RHD]j.8
AKYK*EcP`/F<G^IATB/>+EMX5EccGC/no'A+D,>(AKZ&4+EV:.Gp$U*DBND"+Dbt)A7]9oBl7Hm
E+NotASuU+Gp%$;+A,Et/e&-s$;PM]ANCrNCi^_?@rc:&FE8R5Eb-A%A7T7^+EVNE:fThU8OHj"
?Qa9-+Ad2iCh[BdC0r)qDfQtBBOr;rF`MM6DKI"DF(KAE%14Nn$;No?+Dbt)A0>MrDImisFCeu*
F(96)E-)NrCi<`m+=D5QDJa<1DC5l#%16TRCi+*/DK?pU0JPF-+AP6U+D,b4C`k,\.3KaADIal-
ATo7F0I\,]Df9N7+DG^91,(F?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;8*EbTK7F!,C=
+Co&#@;]Tb$;+)^+Ceht+CT)-D]i\(DImisFCcS'DIal+Ddd0!F(96)E--.DGA2/4Dfp.E@rc-h
FD5W*+Dbt)A0>r'EbTK7F"Rn/.1HVZ67sBsDdd0!@UX=l@j#i7@<?4)FD56++D5_5F`7csChFk<
@WQX"FE8f=$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$B4Z1*GUXbODdd0t+CT)&+EV:.+EqaEA9/l'@;Kak
A0>?,+CQC*Bm+'*+EqaEA1e;u.1HVZ67sBsDdd0!@;Ka&GAhM4F!,@3ARlp*D]j(CDBL?<F*(i4
.1HVsATVs;+=C]@FCB8=%13OO%15is/g+tK@:UKpDKKe>@<,gkFE1f1Gp$pA@ps1bEt&IO67sB.
F*(i4Ci<f2+D58-Ed/]SA92j$F=.M):-pQU-TO17+D58-Ed/]SA92j$F=.M)%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+@9LHCM@[!+E_WG@;]TuEb0<6DfTQ0B-:`!@ruF'DIIR"ATJ:f8l%htBlbD-@<>pe@<6!&
AoD]48g&=rEb'5B+EM%5BlJ08+CT.u+E)@8ATAo4Eb/`pDfp+DE,ol0Ea`f-FCf]=F"SRX9lG)p
+Cno&@:EYdAKZ&>F*(u1F!,.)G%De5ARTIt+D,P4+C\bhCM@[!+E_WG@;]TuEb0<6DfTQ0B-:_n
FCAWeF(KD8@;]Tu8l%htA8c%#+CT=6G@bT,/g)99BOr;7E+*6lA18XEATD6&@UWb^F`;CEF`8I3
+Cno&@:EYdAM+E!.1HVZ67sC%@<Q3)@3B#f@r$4++E(j7FD,5.@s)g4ASuT4E-67FA8,OqBl@lt
Ed8*$E+*6lA0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$E+*6lA18X2DfBE%F!,R<AKYK*EcP`/
F<G+.@ruF'DIIR2+D,>(ATJu9D]j.8AKYGj@r$4++EM[7A8-'q@ruX0Gp$O5A0>i3AS,Y$ATJu&
Cht59BOr;uBl%@%+EqOABHU_+F`(o5F_)\,G%G\:Bl7F$ARTXoDJ()$@:O(qE$0%@D.7's/e&.:
%15is/g+tEF*&ODF`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATJ:f6:=CC4ZX^43dWJ%+@K$l<(LA'
;cI+28l%in@VR#.+AP6U+E2IF+Co2,ARfh#Ed8*$A8-',6:"7O?U@.P;Cj1F/no'4-QjNS+<VdL
+<VdL+AP6U+C\bhCNXS=Anc'mEt&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kq+F*(qA+ED%7FDl22F!,R<
AKYetF*&O6@:O(qE$/V8+EM+1ARfgrDJ()$@:O(qE$/b,Ch7Z1GA2/4+EV:.+D>J%BOu7,+E2@4
AncKB%14Nn$;No?+ED%7FDl22+DbJ-F<G%$@r$4+%17,eF*(q8-Zj9P-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l39jqgODJ()#+EM%5BlJ/:A9Da.%14M&@:O(`.3N,@ART[lF!+q+DIIR2+C\bhCNXT;/g)9>
Dfm14@;[2rCiaM;@UWb^F`8I6Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.R+<X'pD/^V=@rc:&
FE8R5Eb-A7Bl7R"AKXSfF(96)E--.DFD,*)+Ceht+C\n)F`V,)+EVNE@UWb^F`8lS@rH=3+CT.u
+Dk\1B4W2rBk)7!Df0!(Bk;?<%14Nn$;No?+CoV3E$/S*C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*
@<3Q"+EM77B5D-%A9Da.+EM%5BlJ/H%172qH";&7E'66)F(fK9E+*g/?X[\fA7$Hr@;BEs-RT?1
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%160MASrW7AKYf-@:UK/FDlG8F_u(H+DG_8D]iI2DIn#7A8,OqBl@lt
Ed8dG@WQ+$G%De0Dg*=GBOr<*@<?0*BlbD,BOPdkARmD9<+ohcA8,OqBl@ltEbT*++D>2,AKYGn
ASrW-ATDEpA1e;u.1HVZ67sBuATo8-Bk)7!Df0!(Gmt*uATqZ--ZEm1H#R>4-QlV91E^UH+=ANG
$4R>;67sC!E+Nnr$?'Gt-ZEm1H#R>4-OgCl$;No?+Dbt)A0<:BDg>l9D/^p5$8<Va0H`J#4*s"2
FDlG8F_u(,$4R>;67sBkBk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z80F\?u$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l37VQaKC`mq?Eb'5#$<_:i+Du+A+D>2,AKZ&4D.Oi(A7]0lDe:,9BOQ!*8l%htBlbD*Cht5&
@W-C2/g+,3+DbUtEc*":DfTD3Eb/Zi+A,Et-Z^D@De!p,ASuTuFD5Z2+CT.u+EDUB+EV:.+E)@8
ATAnc:IH=A@:F:1+A$/fH#IgJBOQ'q+CT/5+E2@>@VfUmF"AGRF_,W9Bl@m1+E)9C@rH4'Cgh$q
FE8RDCh7$rAKYQ$@;0O#D.OhuF<G%$CLqO$A2uY8B5M'kCbB49D%-g]$;,5MDBM8SCLqMq$=[FZ
ATDNr3B9?;D..-p/n8g:%15^9DKTu.Ed8c_0JPQs$7QDk:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!
Df0!(Bk;>p$8WfCA0<6I%13OOC2[X%Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!
Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\
+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOA
BHVD1AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)
A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt
+Ceht+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'
G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH+
+EV:*DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCn
G%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<
@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(
Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*o-FCcS:D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-
Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:
@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?%15is
/g+SFFD,T53Zq%5BPnq\/g*JhCLqMq$;No?+D#CuBl#gQ+C\bpATDNr3B9?;D..-p/n8g:%13OO
:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g,"FDJ<s1
D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+A79+^.1HVE+Z_>4
+BosJ%13OO:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+Deru-F(or3+>"^EF`_P=@<?3n+D,P4+Dbb0
Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6
F`))2DJ()/DfTD3FD,*#+E)./+A,Et+DG_7FCB&sAISuWE-#T4+=C&U;ajY[74/NO%15is/g*b^
6m-2]FCfK)@:NjkCi<flCh4_@+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6
A7TUrEt&IdDe!TlF)rHOBkhQs-OgCl$;No?+E)F7EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+
Deru;AU%c8+D#(tFDl1B/Kf1WAKYT-Cht55@<?/l$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha
9LU(<F!,[@DId[0F!,C=Cj@-T+EM+*+Eh=:@N[(1F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5
,%EZ=:i^JeEa`f-7VQ[MF'MFR@rcL/De=)6<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^
7:0J<De+!4Bl%->3Zodo@ldjkEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`
G\&'H%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(+?MV3BQ%a!+EqaE
CER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo%15is/g)QVC2[W3+D#S6DfRKRD.Rd0@:s-o
FCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs?R[+8Dfd+CATT:/
$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMHF<GX9F=.M):J48O
:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4
B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$
3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%
?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84
A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,
1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-+F,)@Cia/?+DPFu
EcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9
DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFu
EcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6
A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c.1HV,+<V+#:-pQU
GAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%Qj
C2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\bi
EarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6NARo7q+FPjbB5S.c
.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC
3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!/g+n>ATDfu@;9^k
?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:EB6%p5
E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u4ZX]A
-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8
Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.
F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>
F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7><3mT/g)qmB6%r6
>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2A7]d(Ao_g,+Cf>#
ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBnEc6)>Et&IO67sB'
0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Eot$
+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'BkAt?@UWef@p`YZ
De*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msFHS-Fh/g,?I$7QDk
%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e
:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l
+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;
-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>Y-$+>=630Hb%M
F!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u
4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi
+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</N
CL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'
DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n
+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%
67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUcDe*2tF)3ul+F##>
Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$ASuTs?V4*^FDl)6
F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&Df]tBEb/ioEb0,u
ATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$Hs4Y@jtAThu7-RU$ID_</M+ED%8F`M@P
+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4`+/q#?i%14Nn$4R>;67sBo@;]V$
+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uCN67sW5.3N/>
@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm@ruNo@;9^k?Q^aT
0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\%15is/g+\=F)Yr(
Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/4ZZjk>9GXD3\i$;
%13OO:-pQUE,Tc=@:F%a+C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?0p(FCSumEcXB)><3le+Z_P)
-S$\t.k<,#.k?!!-R)n?>9I2\$4R>;67sC)Bl7I"GB4mCF^o,r@3B&uDKB`4AKYH#GT^O;@<ZF'
B-:\t@<,ddFCfK6%17;nDJWfmBOPq&4ZZe.+?:T+2]sMW/pi%%2CiJo0ek+$?Q`Pq>n%,M$;No?
+D#(tF<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl
$;No?+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"
BlmoL3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2
-9a[C1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+
.4HBF%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A
@:XIj.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276
HXSNU+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G
0f+/b/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4
+B1Wn+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MAS
Bl%i>%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm
0RI4\.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>2
4XMO!-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+
3[QIC.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=rEt&IuF?MZj+?L]YF:ARoF?MZj+?L]$
2'QBM4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji
+>Pl"?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk
%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL
,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI
.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*l
DfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml
%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;F
H=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+EqL1Eb-A%D'2Cm
F`V,)+C]U=F)Po,+DkOsEc6"AG%#30ATJtAGAhM;-Qm>J+=Ci@D.P(($;No?+BM*&;FNlG8Nf*W
-[0KLCF9Pu%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>H
Afu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,
+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9
A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q
+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!
$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=
BOr;q@<6!&Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8
F(oQ1+EMX5Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:
Deio,E,ol3ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5
+A#?[+>=pVEZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=
E-67FDe'tP3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4
+E(d5-Z*F6-QlV91E^UH+=ANG$>OKiF`V,7@rH6sBkLm`CGIV>67sa&De+!3ATD:!DJ!Tq@UX$p
F"JsdAU%X#E,9).8l%htF`V,7+Cf>-Anbn#Eaa'(Df-\=@rc:&F=n"0:-pQB$;No?+B3#gF!)TH
@rc:&F<G:=+<Y6?ARfk)ARlomAS,k$AKXT@6m-DWC1UmsF!)T6Eb-A'Eb/[$ARmD98TYCK:-pQU
@ps6t@V$[)F(Jl)FDi:BARo@aBl7K)@;]Tu@s)j7Df'37AKZ/)EbTH7F!+t/@<6K4DJsZ8F"SS7
D[d%K67sBt@;BEs+EV:2F!,O6EbTK7+<Y*&FD5o0+<Y]9DIIBn+DGp?FDi::De+!3ATD:!DJ!Tq
/no'A+CT.u%15is/g+YBE-WR?F=\PYBln#2H#IhG+D#(tFE8uUFDi:DBOr<'@;0U%C2[W*A8-'q
@ruX0GrcBA:-pQB$;No?+F[a0A8c@,>\@VcATD3q>\\1f%15is/e&._67sB[BOr<(Dfor=+Dbb5
FCeu*@V'@oG9C=7AKYW(De'u#@;]UiA79RkF!,(5EZfC6A7]@eDJ=3,Df.0:$4R>;67sC%D/XQ=
E-67F-YdR1F`V,7@rH6sBkK&4C3(M/G\(B-FD5W*+>,9!-OgCl$;No?+AbHq+ED%%A7]d(Bl5&.
De+!4Bl"o%CghC++>"^GF`MM6DKI"BATW$.DJ()+F!,R<AKYMpAmoguF<G+.Eb/a&DfU+4$;No?
+D,P4+EV:.+BN8pA8c[5+Eh=:F(oQ1+E(j76"FnCAKXl^@:Wqi/g+&'F(KG9AoD]4DffZ(EZe1H
7Nc__@:WqiEt&IO67sBW6q1'C5t".>?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[MF!)lU3&W3j
6"FnCAR%N2Ec5DqF<FIm@:Wqi+@JS%;Is9IATD$A@rcKcA2>tnAU%c6%13OO:-pQUEb0<'F<F1'
F!+:I7Nc__@:Wqi+EVNED..NrBHToC6mm$u:ddbqEb/ZiATAnF+CoC5AoD]4-u*71DKB`4AM.P=
ALS&q:-pQU:ddcNART+\EaNQg4ZX]^6q1'C5t".>?X[\fA9E!.CgRVY%15is/g+S=FCfK1@<?4,
AKXKVDf^#A@rc:&F<G(3D/`p*Bjtmi+ED%%A7]cj$;No?+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX
3a>L%DeF*!D'2;^Ch7Zm7qcg^FD#`5>\A,$Bk;KnB6/61ATopc/nK9=-OgCl$;No?+Ad)iAn?"'
ARlp-ARZckEc6/CATAo-DBN\4A9E!.C`m5(@<6K4/KeS8AmoguF<FY!DId[0F!*qdEb.^YGT^O2
Eb/a&DfU+4$;No?+BMWG0OJ7'De+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*NDgH,6CgeGUBl[cs
Dg5N!Bl[csDg3mGG\&63$4R>;67sBZARfXrA79M(+EqC++C]A0GB7>9+DG^9C2[X*FD5P6@r,Rp
F!*%WA7]@]F_l.B=(uP_Dg-7FA8-'q@ruX0Gmt*U67sB^='%+`@;9^kF`_>6?TgFt6TSIKEc5T2
@;R,VBl%@%>Y/gTATD["F<F"sE,9H5ATD$I79EA[:JsV679Du+%13OO:-pQU<+U;r+D#(tFDl1B
FDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1
%15is/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4
-u*71DKB`4ALqD;ALS&q779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0
.9pb/FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$>j3eAO9gHBk'b26r[`=FE92l:-pQ_D..3k6=FqL
@nKNb<+U,mF!,NU/Ken=CLnV\:IH=7@<6-m+EV19F<GX7EbTK7/e&._67r]S:-pQU<+oue+EM%5
BlJ/:B4YslEaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%ht@UX=l@grc?67sC&
ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.
%15is/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4ASGdpF"Rn/
:-pQB$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,
Ec5c1ARlo+@X/Ci:-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q
:K:.h.3N2H@qB4^F!,R<AISuA67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*<cF(o-+ATMs7
.3N\SBlmo=%15is/e&._67sBhF)uJ@ATKmA$;No?+<Vd9$;No?+<Vd].3Lo!@rH6sBkMR/ARloU
+Co2,ARfh#Ed8dV8l%iS78m.p$;No?%15is/g,=KEaiI!Bl,mRFDi:EF(HJ)D`S=7:-pQB$;No?
+<Ve%67sBnASu("@<?''F(96)E-)Nr:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH
+=ANG$;No?+<VeID'13C@;BF@@<6-m8l%iSATMs7-OgDX67sAi$;No?+<Ve%67sC$F`&=9F:ARP
67sB'+=Joe3\i-,4DJhDFD)dEIS*C(<(0_b01')gBk'b26r[`=FE9'KC3(a3$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`l%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"
EcP`/F<Dr?@<6!-%16oi@:UK.C2[X)ATMs)E[M;'D..3k;f-GgAP,`d<+U,mF##IF67sa)@;BFQ
D/X3$8l%iSATMs7+EK+d+DkP&AKXT@6m-PfDeio,FCfN8+EM%5BlJ/H$;No?$;No?+B3#gF!,O6
EbTK7+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+EMC<CLmiJ67sC&
ATMs7/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.
$;No?+=L]-F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/db??
/db??/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9
Ch7-"+C]U':-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h
.3N2H@qB4^F!,R<AI;1!/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA92U+CLqU!F*)IP+EM[>
FCd'3:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBhF`_;8E]P<c8oJB\
+@Ih)6=FY@EXGQ./g+YEART[lA3(hg0JPG"F_i`l$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OO[.
@:UK.C2[X)ATMs)E[M32@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc
8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0J5@<3B9&A/KeS8Fsd_+7Sc]G78c90
-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C
:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-
Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u
$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[Wn
DdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG>A7f@j@kVS8A8l'k
/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9
Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&Ik
De*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-
Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*
+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARloo
Bk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,
ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5
Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9o
FD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV
+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH+
+DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.
Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKS
DImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7
AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:Wne
DK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>
BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*
FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9+<V+#.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV
%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE3Ai/n$:[fb6q(!:
3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q
-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi
$7QDk;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#
+=LuCA1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15RCEZf4;Eb-A-DJ!g-
D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@
6m,<7B4W2oF?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37
/T>-2AM4K"%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<
%16cjFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr
3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk
6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrE/ibOE
3B/-5+Co&,-OgDP:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$K
C3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^
78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>
+?CW!%14LuDe*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7
F!(o!-u*[2A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[
@rGmh/0K%GF*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/
A7]pqCi=88@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7
F!+n3AKYetEbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et
+Co1rFD5Z2@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//
AU%X#E,9*,+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1
/e&-s$;+)^+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt
@ruF'DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7
+:SYe$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+
BPDN1BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht
+EV%-AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$
EarZ'6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC
@:C?h@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT
@N]N!DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:Wne
DK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>
BOr;Y:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;
Eb@%IBOrc1De(G=@:s.)%14Nn$3                                               ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ebU10fU:2+>G_r1,pC30H`/-+>G\q1,0n,0H`,0+>GSn2)6:/1*AD0+>GPm1G^..1E\M/+?(E!
1*ALu1bp15+>Y\o0ea_*1*A;0+>Yr!0fL412BX_5+>Pht0eje+2BX_7+>Yhs0fL421.k>16<-TN
6qBmJ<)6CpEb/`lDKI!n:IH=7F_PZ&+D>J1FDl2F+Dbt/8l%iS:JXY_6<-TN6qBmJ<)6CpEb/`l
DKI!n:IJ/X:J=\0@WcC$A0>Q"F*)>@Gp$pAB2;uXATDs*A4:NZDfTo.F_;h5DeC2$DIal1ATMg/
DKBB1@WcC$A86$nA8-+,EbT!*FD5Z2Ap%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<hF_PZ&C2[Ws
C3+N:A79RkF!+t2D/Ej%FCeu*C2[WsC3(M=@rc:&FE8R=DBN\4A7oUu+Co2,ARfh#Ed;,:Bl%<p
De+!.BlnQ>Blmo/8l%htF`(o8+EV19FE8RHD]j+C@:s:lB-:`!Eb/a&DfTQ'F(f9/FDl2FC2[WT
:IH=6A7TUr+D>J1FDl2F/p)>[+DG^9D..I#A8c[0BPDO0DfU,<De*Bs@nKNb6r-0M9gqfV+CSek
Df-\2BleB7Ed99ZG]Y'BDBNe)Ebf3(GA_/6A7B+kFA+te<(U%_762P`:IH<R1FXG5ATMr9:i]uS
FD55rF)#W(A9Da.9L2!E8Q8AP3Zq$j6m*m5.3MQ-F`Lu'+@C'XAKXB`D/^Ur@rc:&FE;28A8,q'
Ec4W;6<$NU9LUub8l%ht-o!.n8T&WjDe+!#FD5Z2C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>
Anc'mC2[X*F(KB%Df00$B4>:bAU%X#E,9).8l%htF`V,7+Cf>-Anbn#Eaa'(Df-\=@rc:&FDYH%
AO9gHBk'b26r[`=FE;;-CLnV\:IH=7@<6-m+EV19F<GX7EbTK7D..3k;f-GgAP,`d<+U,mF)>?$
AKXT@6m-PfDeio,FCfN8+EM%5BlJ02@;]dkATMs.De)I+9H\1\DJ<]oF*&O:DfQsm:IH=6A7TUr
D..<rAn?%*C2[WnDe!p,ASuT^5tiD<@;]dkATMr9AoD]48l%iC:IA,V78?f)@:WneDJ`g"BkCpt
FD>`)F)Q2A@qA7u9H\1\DJ<]oF*&O:DfQsm:IJ,W<Dl1Q+CSekDf,                     ~>
)
showpass 4 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' buildjod CR CRLF JADDONJODPATH JADDONJODROOTlinux JADDONJ'
zz=:zz,'ODROOTmac JADDONJODROOTwin JADDONJODSOURCEPATH JODTOOLSBUILDCNT JOD'
zz=:zz,'TOOLSVERSION JODTOOLSVMD JODVMD LF TAB TEMPFILE0 afterstr alltrim a'
zz=:zz,'llwhitetrim beforestr betweenstrs blkaft buildjodcompressed buildjo'
zz=:zz,'dtoolscompressed changenqt changestr charsub ctl dblquote decomm de'
zz=:zz,'whitejscript fexist fwrite jodsystempath jpathsep justfileext lastj'
zz=:zz,'odhistoryversion md5fromstring md5manifest read releasejod setbuild'
zz=:zz,'dirs setjaddoncopy setjaddonpaths setjodinterface showpass smoutput'
zz=:zz,' timestamp toCRLF toHOST toJ tstamp updateJODTOOLSfiles updateJODfi'
zz=:zz,'les updatejoddistribution updatejodmanifest updatejodsourcedumps wi'
zz=:zz,'e write''),(<<;._1 '' jod ALPHA BYTE CNMFDLOG CNMFMARK CNMFPARMDEFS C'
zz=:zz,'NMFPARMS CNMFTAB CNMFTABBCK CR CRLF DEFAULT DEPENDENTSEND DEPENDENT'
zz=:zz,'SSTART DICTIONARY DIGITS DOCUMENT DODEPENDENTS DPATH DPLIMIT ERR001'
zz=:zz,' ERR002 ERR003 ERR004 ERR005 ERR006 ERR007 ERR008 ERR009 ERR010 ERR'
zz=:zz,'011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR017 ERR018 ERR019 ERR020 '
zz=:zz,'ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 ERR027 ERR028 EXPLAIN FRE'
zz=:zz,'ESPACE GROUP HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IzJO'
zz=:zz,'Dinterface JDFILES JDSDIRS JJODDIR JMASTER JNAME JODPROF JODUSER JO'
zz=:zz,'DVMD JSCRIPT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTER'
zz=:zz,'PARMS MAXEXPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK00'
zz=:zz,'4 OK005 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL '
zz=:zz,'PATHSHOWDEL PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TA'
zz=:zz,'B TEST TEXT UNION UTF8 WORD XML afterstr alltrim badappend badblia '
zz=:zz,'badbu badcl badfl badil badjr badlocn badobj badrc badreps badsts b'
zz=:zz,'adunique beforestr bget bnl boxopen catrefs cd changestr checknames'
zz=:zz,' checknttab checknttab2 checknttab3 createjod createmast ctl datefr'
zz=:zz,'num dblquote decomm defzface del destroyjod did didnum dnl dpset dp'
zz=:zz,'table empdnl fex firstone fod fopix gdeps get globals globs grp gsm'
zz=:zz,'akeq guids guidsx host hostsep isempty islocref jappend jcr jcreate'
zz=:zz,' jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace jus'
zz=:zz,'tdrv justpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark'
zz=:zz,' nc newd nlargs now nowfd obidfile od ok packd plt put quote read r'
zz=:zz,'eadnoun readobid regd remast restd rv rxs rxsget rxssearch saveobid'
zz=:zz,' second tc trimnl tslash2 tstamp uses valdate wex wrep write writen'
zz=:zz,'oun''),(<<;._1 '' joddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNM'
zz=:zz,'S DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 '
zz=:zz,'ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEAD'
zz=:zz,'NMS OK200 OK201 REFCN REFIX REFTS TEMPFX backnum copydirinv copyfil'
zz=:zz,'e copyfiles createdl dbakf dfclose dfopen dfp dncn dnix dnnc dnnm d'
zz=:zz,'nrn dropall dropbakdir dropdir dropinv dropnc dropref gettstamps ju'
zz=:zz,'stdrvpath libstatus loadbakdir loaddir loadnc loadref loadstamps ma'
zz=:zz,'xback movefile nummask packdict packspace puttstamps renamefiles re'
zz=:zz,'stdict restspace savedir saveref tmpdatfile tmpusesfile volfree''),('
zz=:zz,'<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPT'
zz=:zz,'AG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 '
zz=:zz,'ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND'
zz=:zz,' JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT'
zz=:zz,' SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk d'
zz=:zz,'ec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamps dumptext du'
zz=:zz,'mptm dumptrailer dumpwords extscopes fap fmtdumptext fromascii85 ge'
zz=:zz,'tallts getascii85 halfbits htclip jnb jscript jscriptdefs makedump '
zz=:zz,'makegs masknb namecats nlfrrle nounlrep opaqnames parsecode putallt'
zz=:zz,'s rlefrnl sexpin sonl tabit toascii85 uqtsingle wraplinear wrdgloba'
zz=:zz,'ls writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION '
zz=:zz,'CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRP'
zz=:zz,'ATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056'
zz=:zz,' ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR'
zz=:zz,'066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 '
zz=:zz,'ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR0'
zz=:zz,'86 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 E'
zz=:zz,'RR096 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR103 ERR104 INVGR'
zz=:zz,'OUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 '
zz=:zz,'OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 O'
zz=:zz,'K064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsf'
zz=:zz,'x apptable appwords badcn bnlsearch bnums checkntstamp checkopen ch'
zz=:zz,'eckpath checkput closedict createst defwords delstuff delwordrefs d'
zz=:zz,'idstats dnlsearch dupnames freedisk freedisklinux freediskmac freed'
zz=:zz,'iskwin fullmonty getdicdoc getdocument getexplain getgstext getntst'
zz=:zz,'amp getobjects getrefs gslistnl inputdict invappend invdelete invfe'
zz=:zz,'tch invreplace islib iswriteable iswriteablelinux iswriteablewin jd'
zz=:zz,'atcreate jwordscreate loadalldirs loadallrefs loadwords mainddir mn'
zz=:zz,'lsearch newdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nu'
zz=:zz,'bnlsfx opendict pathnl pathref putdicdoc putexplain putgs putntstam'
zz=:zz,'p puttable puttexts putwords putwordxrs rpdtrim rplctable rplcwords'
zz=:zz,' sortdnub''),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 E'
zz=:zz,'RR00401 ERR00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00'
zz=:zz,'408 GROUPSUITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF O'
zz=:zz,'K00400 OK00401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX'
zz=:zz,' TESTSTUB WARNING00400 WORDTESTS addgrp addloadscript addloadscript'
zz=:zz,'1 allnames allrefs betweenidx createjodtools dayage delgrp firstcom'
zz=:zz,'ment firstperiod fsen getrx hlpnl jodage lg locgrp mls noexp notgrp'
zz=:zz,' nt nw obnames onlycomments pr refnames revonex today todayno updat'
zz=:zz,'epublic usedby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK '
zz=:zz,'CREATEDMARK CWSONLY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250'
zz=:zz,' ERR0251 ERR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ER'
zz=:zz,'R0262 IzJODutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFU'
zz=:zz,'SCPFX OK0250 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC'
zz=:zz,' ROOTWORDSMARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok compclut'
zz=:zz,' compj compressj createut ctit de dewhitejcr dewhitejscript disp do'
zz=:zz,'c docct2 docfmt2 doctext docword ed et exobrefs gt jodfork jodhelp '
zz=:zz,'ljust obtext pdfreader qt reb revo rm rtt textform2''               '
zz=:6082{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`+0d&@s1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(
Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3
@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC
$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(
Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b
+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.
DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od
@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9B4Z0-+<Ve%8PN#B+D58-+E(_(ARfh'+D,Y4D'3e?
F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ67sB'+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;
E+*j1ATD[0%15is/g)8ZA7]R"+<VdLA7]RgFCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M
+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;+<Y3/@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;
DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:
FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6%15is/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/
+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;+<Ve>ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBan
Ea^)&Ec5e;A8,OqBl@ltEd8*$:-pQU+<Y<5Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQu
Eb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G+<Y07ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-
%15is/g)8ZD..3k+<VdLB4YslEaa'$+A*bt@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'
+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7
A0<!;+CfG'@<?''DIn#7A8,OqBl@ltEd8*$:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)
Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`+<VeG@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdL
E-67FGAhM4F"AGUATMs7/0Je<@rcL//0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeI
AS5Nr+<VeIAS5^uFCfJGF`)52B5)F/ATAo%+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3
Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.1HVZ67sB'+ED^J+<VdL+APL&:c]_>AS6.%
@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]Tu
FCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'
/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs-OgE'AT;j,Eb-@@C1_0rATJu7
AS5S!+EV%5CF9Pu%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlotDBO%7BlbD<ARfgr
Df-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h+F5/HDe!3lAKYl/
F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ:*<P35tscj8Oc9I
;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0AKYQ%A9/1e9L_0+
0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQUD.-ppD]j+2EbTK7
+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#AISuA67sBhDIal,
De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a;Fs\a4ZY>Q%15cp
<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK9gMZM6r-lZ4ZY>W
%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?+DkOsEc3(BAU&;>
FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B
<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/0F\@g78m/K3\_'N
7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dKASbs$Eb/ioEb0,u
AISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23uA90dS=&2^^/6#&:
<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/
%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl4ZZe.+>#2g><3lV
/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*@<,ddFCfJ8-6R89
FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI-OgDZ5u^BB85`AL
3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(nEcW@6AT23uA8,po
+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O-Rg00/jMH\+C-FE
.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloqBl%?'DIIBnEt&Ik
F`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z+=f&t>V7-q5u^BC
78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2Et&IO67sBqDe*p7
F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*F!,")Anc-oA0>T(
+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'6r6cW7QieIDe*p7
F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*BHS[;De+!3ATD:!
DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[WnDdlI./g)WYDe*Bs@N]/4/KeS<Eb/a&
DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.4u&::-pQB$;No?+@KpaARfh#
Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlp-BOu'(A8,OqBl@ltEbT*++CT;%+E)41DIm>f$;No?+CT.u
+Co&)FE2;FARlp-BOu'(FD,62+CT;%+Cf5+F(Jl7+<X'dEb/a&DfU+GDdmHm@ruc7@rH7,@;0Tg
$;No?+CQC6ATT&5Aftu0F`)7C@;]TuG%G]'F!,R<@<<W/@;]LdAKWHTBkh6&Anc'm+Co2,ARfh#
EbT*+/e&._67r]S:-pQU8T&W]Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z-uEC1Gp%!CF`)7C
@<,p%Bl7HqEb/a&Cj@.1?QaB#An?!oDI[6g.1HVZ67sB'+Co(oCi=B++<VdL+Cf5+F(HJ)Bk)7!
Df0!(Gp$^5Ch4%_:-pQU+<Y3,DfB9*+<VdL+<YTAASrW$Bk)7!Df0!(Gp$^5Ch4%_:-pQU+<Y3,
E$-8G+<VdL+<Y3/Eb/a&DfU+GAnc'm+E1b2BQFUi:-pQU+<Y34@r<D3+<VdL+<YQ1D.Oi.Aftr!
Bl5&(Bl[cpFDl2F+Cf>,E,TW*DKI"=Dfoq,$;No?+<Ve;DJ=><+<VdL+<VeE@;TQuDe:,/@;0U%
A8-'q@ruX0Gp$g=A7^!.DJsZ8%15is/g)8ZA8Z9p+<VdL+<VdLDIIBn+E(j7@r,RpF!,@=F`%Wq
:-pQU+<Y34DJ^L=+<VdL+<YiAF(o*"AKYo#C1Ums+DtV)ATJ:f:-pQU+<Y38DfB6$EZcJI+<Y69
@<6!&A8-'q@ruX0Gp%!CF`)70$;No?+<Ve;Ec5o7@ium:+<Ve<Eaa$#+Cf4rF)s!VH#R=;DJsZ8
Et&IO67sB'+CoM2E,oN%+<VdL+D#S%F(HJ7AS,LoASu!h+Du+?DK?6o:-pQU+<Y<.FEDSG@;Tt)
+<Y]9@:XF%@rc-hFD5Z2+CT.u+DbJ-FDuAE+Cno&AKZ)/D.Rd1@;Tt)%15is/g)8ZCi<`mA8-',
+<VdLCi<`m+Co2,ARfh#Ed8*$:-pQU+<YK=@:X7c+<VdL+<YK=@:UL)DfTA2@;]TuD.-ppD]iP+
@<6KCFEqh:Et&IO67sB'+Dbt)A9)6n+<VdL+Dbt)A0>o(An?!oDI[7!%15is/g)8ZCi<`mF*(i-
E-!-ECi<`m+EV=7AKZ&9@;Tt)%15is/g)8ZE+*6lA8,Oq+<VdLE+*6lF!,"-@ruF'DIIR2+CT.u
+ELt7ATJu4Ch+Z#Bl%@%+CT=6@3B#f@r$4+%15is/g)8ZE+*6lF)YPtAKW*<FCfN8F!,(5EZfFG
AnGaeBk;1(+C\bhCNXS=F)YPtAISuA67sB'+E2IFFE;P4D/aP=+E_X6@<?''Bl8**Ecbl'+CfG'
@<?4%DBNA*A0>\sF*)ADF<G[>D.Rd1@;Tt)%15is/g)8ZEb0<6A8,Oq+<VdLEb0<6DfTE1+Dl%<
F<GU8@qBP"+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA8,Oq.1HVZ67sB'+ED%7FE;D0@q?c*+EV19
FE8R:DfQtAF_56"@qfLlF<GU8F*)>@AKZ&5@:NjX$;No?+<VeJ@<Q3mBlY==+<VeJ@<Q3)A8-'q
@ruX0Gmt*U67sB'+ELt7ATD?o+<VdL+ELt7AKZ#)An?!oDI[7!%15is/e&._67sBUDffQ33XlEk
67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'A8bp"Ea`iuAKW`^0J,%:3@PCE%16T`@r,RpF!)i=C2[Wn
Ddk('$=e!gDKBB0F<Dr>C2[X(FDl22-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%icDdji"AT23u
A7]Y#+Co%qBl7X,Bl@m1%13OO:-pQUA8-'q@ruX0Gp%!CF`&=>@;TQuE,oN%Bm=31%15Kp;GKqb
4ZY\e/mg=U-QlJd;FDX,78m/.7oE,_:`r\:8Q8,$9gM-E:F?SY%15is/g+\=Eb/a&DfU+GDJsZ8
+EM[;AncL$F!*%WDfTB"EZf4-FED)7Et&IE<)Z@j6V]d*4?G0&0d%hd<)Xo2=<Kt+-OgCl$;No?
+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt$7Its-U^O(<)Xo-
8Q&,^+@Je!6V]!X4ZX]J+u(3f3Zpg^;GKqb+=nil4te$H<)Z@j6V\'t%15is/g,%?D.Oi"CghC+
+CT.u+DkOsEc3(BH#R=;DJsZ8+DtV)ATJ:f6qL9O6TmIm4"akp+=A:5:JsSU6Qf)h6W-]T6RN<M
%15is/g,1GAn?!oDI[6#DdmHm@ruc$$:IH`;FXDE3]oJV?SNZN+BM?:6rHHC+B1d.<)Q.S-OgCl
$;No?+ED%*ATD@"@q?d)Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*DKI"=Dfoq?DIIBn
Et&I)4$"`e77L6T+AtWt8Q[*577KX>-Rh2>+?Ui&+FH3m6qL9S7SY'W-8%J8+@K1-8Q\>T%13OO
:-pQ_ASu$hAT23uA7]Y#F)#W(D..3k:-pQU.V`m4D..3k+CcuT+EM%5BlJ/:D..3oDJ((=+Cf>#
AKYhuDJ='4CghF"Df.TYAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g+,,BlbD<F^eis@<6K4
A7]@eDIml3F`_>6Bln'#F!,(5EZf4-CM@[!+EM%5BlJ08+D,Y4D'08p:-pQUB6%p5E-!.1DIal2
F_Pr/F"SRX8TZ(`CiaM;@rH7,@;0V#+Cf>#AKYT'EZee.@;L48Bl7Q+%15is/g,%?D.Oi1AS,Lo
ASu!hF!,17+A*c#DfTB0/g(T1:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84SATD7$3XlEk67sB'
+D58-@;Kb%F!)SJ+<Ve>ATVu9@;Ka&FD5T'F*(i-E,uHq:-pQU+<YN0CLq%!D/^U?+<VdLA9Da.
F!,C1C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD@;BFeF!)SJ+<VdL
+DkP&AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+DtV)ARf.jF!)SJ+<Ve:CghC+BkD'j
F!,@/D.Rc2Bl5%c+Cf>#AISuA67sB'+E2IF@;Kb%F!)SJ+<VeGF`_[I@;Ka&FD5T'F*(i-E-!-R
+EM+*+=Ll6FCB!%FE8l?$;No?+<VeNFED)=F<D\K+<VdL+EqaEA0>;uA0>u*F*&OHAU&;+$;No?
+<VeNEb&g!Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^A7Z2W:-pQB$;No?
+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*]nCLnW/@;]^h+>G`-/MT7G.1HUn$=e!a
CghC++=CT4De*]nCLnk&$=e!gDKBB0F<D\R@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(KiDdmHm
@ruc7GA2/4+Co%qBl7X,Bl@l3A7]^kDId<r@qfLq%13OO:-pQUFCAg'+A,Et+CoV3E$043EbTK7
+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\-OgCl$;No?+DbJ,B4W3-AU&;>
GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo$<L+k:fL.c=%PeC3[]6"-Ta4F
%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'@VTIaF:ARU:I@fE5uKj,-R(0a
De!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4AR]drCh.T0B6%p5E-!.1DIal2
F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5B6%r<4s2%%+<iE\-RU8m-pDu1
=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3F(H^H-S.Yc9i+eT
7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17+EV:.+EM%5@<?!m+E(_(ARfg)
Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7/12fP+DEGb-RU$@+Cf>"F`MM6
DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@ATJtBDIIBn/9GHJ
F=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE-QmANF<Db[+<iEc-RUGn5'nn`
;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N
%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*ATD?m+EM%5@<?!m+Dbt+@;KKa
$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT7h#e7$;No?.V3L.A7]^kDId<r
FE7lu%16igA92j2Eb/!4/h1USA92j2Eb-A'/M/)dFDl2.B4W3(@VTIaF<G(0@<6KN+D#e>ASuR'
Df-\9AfrL:De(:L%15is/e&._67sBOBk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg@UX=h04np7AKZ&>
F*(u1+E_a:A0>u4+EMXCEb,[e:-pQUA8,OqBl@ltEd8dG@VTIaFE9&W;Isf`@:O"hB-;;0BlbD,
CghC++DGm>@;Ka&FD,*)-Z]_(:-pQUEb065Bl[cq+EVNE@q]:gB4W3-BOr;sBk)7!Df0!(Gp%0M
DfT9!AKZ&>F*(u1/e&._67r]S:-pQU<b6;\+DG_8ATDBk@q@\1$;No?+<Ve:BOt[hDfB9*+<VdL
@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.
@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r
@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()
ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3
+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"
F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4
BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<
@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ
67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+
FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8G
B4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'
+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3
BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19
F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(
DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'
+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk
+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,
@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.
+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIa
F<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f
:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%
D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEE
G]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*
A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeG
F`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk
67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4
De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&
ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-
F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$
DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r
+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4
Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(
AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=
67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+
1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp
6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S
9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P
<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ
7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U
+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*
+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3
FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_
5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3
FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU
/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG
;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\
/43028QnP66V^'P:eX/H:*9uQ%15is/g,7VBl+u5BkM+$+=M>P@;0OlDJ(C@E+*j%+Co&"Bl.R+
ATDi7+Xefh4Y@jR5u^BC78+-tEc>Q2EbTAR3aEjQINViU+>#2g><3lV/h^H^+Ab@'845m?,$uHU
+C,E`%15is/h1FMA7T7jASu$iDKKr7De*s.DesJi67sa&De*s.DesJ;@kB8TA7]dqG%G2,FDl)6
F!+t/@<6KN+D#e>ASuR'Df-\9AfrL:De+!4Bl#4N%15is/e&._67sBPDKKH1Amo1\+EqaEA90d@
$;No?+<Y*'A7oq%+<Ve8A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=AKW*<+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y*/Ci3ZuATJu(Df&rtDIml3DIIBnF!,(8
Df$UFEb/j#@;TRs.3N&:A0<:=@W#UkATK:C+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?
+<Y*/CiX*!F!)T6Cht53@;TRs+ED%*ATD@"@qB0n@X0)7@VTIaFE8RCDBNh*D.Oi+BleA=+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y3+ChId-+<VeIASl@/AKZ28Eb'5EFCfN8F!,(8
Df$V0Ec6)>F"_TWBlmp-+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y<.
FE2UK+<Ve>ATT&8AT;j,Eb/c(FDi:5G\(B-FCcR;+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y?6E,KJ7+<Ve;Ble60@<lo:F(fK4F<G+*F(96)E-,f4
DK?q=Afu#$C1UmsF!,C=+=MLa+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+DPh*@:s-o
+<Y3'H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u+CfG'@<?4%DBNk0+A,Et+E(_(ARfh'%15is/g)9O
De*NmCiCL>+Co2-E,8s.+E).6Bl7K)8l%htBOu"!+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
ChFk5+<VdL+DkP&AKYE!A0>],@:UKQ:IH=<Ec6)>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D/=89+<VdL+DkP&AKYf-@:UL%@rc:&F<D\K+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9SDe404+<VdLEb0?8Ec,q@@3BB#F*&OC
Afu#$C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is
/g)9SDffW4E$-8GGAhM4F!,CA+EV19FE8R:Ec5e;.![6aFD,*)+CT;%+Du+>+DG^9B6%p5E-!.?
EZfFGBlmp-+<VdL+<VdL+<VdL+<Vd9$;No?+<YQD+<VdL+<Ve>ATVu9DIIBn+CT.u+EV1>F<G19
Df$V.A8--.GA1r*Dg-7F+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YQG
+<VdL+<Ve<A8--.@3BH!G9CIAE,95uBlkJADfTA2F`V87B-9fB6m,uXDK]T/FD5Z2F!)SJ+<VdL
+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YT3DIIBnF!)TJDJ=*5AKZ&4Ecbl'+E(_(ARfg)@;]Tu
Ci<flCh4`,@;TRs+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<Vd9$;No?+<YWD+<VdL
+<VeGF`\a7DIal"Ec6#?+ED%*ATD@"@q?ck+EqaEA0<HHG%G]>+D>2$A9f;+F!+n/+D#(tFDl1B
6r-0M9gqfV6VgEN5u'fW$;No?+<Y]9Ao;$oATJu:DJ=*5AKZ&4Ecbl'+ED%*ATD@"@q?d#@;TRs
+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y]9G&M80GT\,L
ATW'8DK?q/+Dbb5F<GL6+E2IF+Co1rFD5Z2@<-W9DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1
+<VdL+<VdL+<Vd9$;No?+<Y`LAU#=?+<VeJATT&9BQ%p5+EqaEA0>H.E,8rsDIIX$Df-\0Ec5e;
-tI7+.3N;8@:Wqi+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YfJARo7q+<VeIATW'8
DK?q/+Dbb5F<GL6+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<DfTB0+E)-?.!R0`
+<VdL+:SZQ67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuCA9;a.Ci^_>@;]^h
+>>K+0JG(40JP780I[G<%14LD+Z_G7.3L;e+AP6U+Co2-@psCg+EqL5FCfN4@:NjX$4R>PDe!Tl
F)rHO@;9^kFDl)6F!hD(@rH(!F(KB6+<W%?C2[X*FD5P=%16igA9E!.Ced;L+=_,EA9E!.C`m4>
/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'Df-\9AfrL:De(:L%15is
/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8F`_>6Blmp-+EV:*F<G^I
AKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,+EV%5CNCV:Aft_tDImis
C`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:NjkDJsZ8F!)ePG%G]'F#ja;
:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'DIIR2+EqaEA9/1e:-pQU
+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-$;No?+<Ve;Ble59+<VdL
A8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=DfT]'F<G(3D/Ej%FE8R=
DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9@VTIaFE8R:Ec5e;8l%ha
$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.F<G[:G]Y'HF`\aEAftYq
BlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:Bldir+E(_(ARfh'%15is
/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7BFCB<6Des?)Gp%3?F*)I4
$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;;DJX$)AKYYtCiBgj:-pQB$;No?+AQisATKmA$;No?
+<Ve<EcQ)=+=84LCERJ*F)tc&ATJtBC2[X*FD5P6Ea`iuAKWZ\1,Ua;0JG:C3@PCE%16T`@r,Rp
F!)i=C2[X*FD5P=%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBA1]AUA7]^kDId<r
F<GdGEb'56%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F)uJ@ATJ:f5uU]^9gquT5uL?=
3[\?WF*2>2F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZee5FD,T5%15C$<(Ke_9gMZM
4ZXs!F`_;8E]PQW$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZek4ART[lA.8l5;FNlN779j9
;G0/6-Y%1.@<?'k3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+Cob+A0>Q.DJ*BuBjkm%
@;]TuAU%X#E,9*,%15L+5t"F5;G0/6-Y.L2A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-
EZf4;DII&uBQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f9i"MM6qosF90G<`D/X<#A3)(I$4R>;67sBk
De!p,ASuTuFD5Z2+DkP-CER5-EZfO:EaiI!Bl+:d<^fnQ5u^EM9gMZM4ZXs6ATD6gFD5SQ-OgCl
$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4Ec5l<+EqaEA9/1e;GU(f=&2^^;b]PU90G<`Ec5l<
GAhM4F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CNCUM+Co&&ASu%"+E)-?DffZ(EZf4-Ebf_*
$:IZW<D>nW<)#YV92du7+@/q)<D>n\9gMZM4$ckG85E,X5uL?;6W-?=<(02L5uL?;6s2fD9gMZM
4&&LG5t"F5;G0)P78cH<<(TeY5uL?;;GU(f=&2^^;b]PU9+;4;$;No?+Cf>,D..<m+Dbb0AKYu8
DffQ3+AYoYA7]^kDId<rF?1OZDe't6-n6Z//g+\6CiOT9FCcR($?:/N3Zq^9A7B@pF`2A55V>Vt
=%Q-r$4R>;67sa!DId9hE+NotASuU2%13                                         ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L9+>P'!+>P_q1E\G1+>t?!2]t%%2)?@7+>bbp3$:%6+?(E#1LbK@Ch.:!A9E!.Ci^_AF(Jl)
FDi:2F_PZ&+A,EtC2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[WnDdm6kEb/a&DfU+GDdmHm
@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3D..3kF(96)E-*4>@;BRpB-8ND@rGmh
+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7-u*[2.;Ed3F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,Rp
F#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FDl)6F(Aj&Bm+&u+EVO?Ci^_/CghC+3Zr!YFCf?2Bl@l3
De:+?C2[X*FD5P?C2[X*FD5Q"+Cf>+Ch7*uBl@l3De:+a:IH=JFD5Q*FEo!QDfTB03Zr!YFCf?2
Bl@l3De:+?C2[W3                                                           ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 mnlBasic00 putNameTimestampsBasic00 restdBasic01''),(<(<''jodc'
zz=:zz,'rushtests''),<0$a:),(<<;._1 '' jodextensiontests grplitBasic01''),(<(<'
zz=:zz,'''jodlargetests''),<0$a:),(<<;._1 '' jodpreparetests createtestdiction'
zz=:zz,'aries loadSmoketest0 loadSmoketest1 loaddumpSmoke00 loadtest001dict'
zz=:zz,'ionary loadtest002dictionary loadtest003dictionary loadtest004dicti'
zz=:zz,'onary''),(<<;._1 '' jodpurgetests destroytestdictionaries''),(<<;._1 '''
zz=:zz,' jodsmoketests compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicod'
zz=:zz,'e00 dnlSmoke00 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 glo'
zz=:zz,'bsSmokeDoc00 grpSmoke00 jodageSmokeDays00 mnlSmokeArgs00 newdSmokeB'
zz=:zz,'adArguments00 odSmokeArgFail00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke'
zz=:zz,'00''),(<<;._1 '' jodstresstests getStress00 makeStress00 packdStress0'
zz=:zz,'0''),<<;._1 '' loadlargefeasiblecase loadtest001dictionary loadtest00'
zz=:zz,'2dictionary loadtest003dictionary loadtest004dictionary testdiction'
zz=:zz,'arypaths''                                                          '
zz=:947{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f^@3+>P&o1E\D-1c6C20d&2)2E5GiA7AtgBk)6rF*)Iu67sa&De*<cF(o-+ATMs7+EK+d+EM[>
FCcS5AftPkF(o,,8l%htFCfN8F"Rn/:-pQB$;No?+AZrfDK?q/+AtWo6s!8X<(.pOATMr9A8,Oq
Bl@F#Gp"MWATMs.De(ON+CT.u+EDUBF!+m6F(KB+ATJ:f:-pQUDe:,$@<6-m+A,Et+EV19F<GX7
EbTK7F"Rn/:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm
%15is/g)8Z1+==oC2[X)ATMs)E[`,IDdd0!F(96)E-)Nr:-pQU+<WHh+AtWo6s!8X<(.pOATMr9
A8,OqBl@ltEbT*+3ZrKTAKZ)+F*&NQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK:C%15is/e&._67sC$
F`&=GBln#L%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn:-pQU+<YT5+?MV3C2[Wn
ATf22De'u5FD5Q4-QjNS%15is/g)8Z1E^^[F<DrGDe*<cF(o-+ATMs7-OgDX67r]S:-pQU@rc-h
FCeuD+>PW)2f<PW1,fXL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@k]b_@:Wn[A0<:<Dffo:AStIYF*)IW0JP"!
FDi:CF_Pr/%15is/g)i,A7]7*1*C"9A7]9o-tI439jqOPDcC:mFE8lRFDi:CF_Pr/+>"^878m/g
5tt'B;E[&p%15is/g)i,A7]7*3?T_\Bk0P=F(o,<0JP"!@:Wn[A.8l@67sB73,`;K0K1+rF`MA6
DJ()1DBO.:Blmo/F)YPtAKYr4ATMF'G%#K2DBO%>+EMX5Ec`FGATMs7%15is/g)l'DJs\Q3$<?_
A79RkA0>K&EZdtM6m+093A*-=+EV19FD5W*%15is/g)l(C3=>H2'?UME,ol?AKZ#9DBNY2F*)GF
@ruF'DK?6o%15is/h1CCE+NotASuU2+>"^XATMr9De:+?B4PRmF"&5DDfQtAF_Pr/+D>=pA7]cj
$<0Gm<)>kY9e\:b3\V!M<(0_b=[>bV78c90<(0_b:dIuR0JO[m+<Ve%67sC%ATT&:D]gbWAoD]4
@;Ka&D.Rd0@:s.m%15is/h1FMA7T7jASu$iDKKq/$4R>;67sBt@<iu5AS#BpFDi:7ASu("@<?''
-u*[2FCfN8ATB4/$;No?+Dkq9+=CoBA9;C(FCfJ?+Bot,A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7
+>Y-YA0<6I%13OOEb065Bl[c--YdR1FCfN8ATB.-$4R>+0RGSuDe't<-QjNS+<VdL+<XEG/g+Y?
Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I?0RI_K+=D8BF*)/8A2#AR+<XEG/g,(OASrW3FCB&t
@<,m$;FNl>=&MUh73F"#ATMs.De(ON%13OO-oiG31bgF%0d%T667sC%ATT&=BPDR"+EML1@q?d%
Eb0<'Ectl5Bl@l3Df-!k%13OOCi<`mCgh?sAS,L^F(o*"ARf.iAPPQE.Vs$3A8G[pB4Y[d@<6-l
Ch7*bF(HJ9/M/)SF_PZ&F!*2^+Co1rFD5Z2@<-'nF!,(5EZfI;AKXZ96S8^@67rU?67sBJEb/[$
ATJu&DIal+Ddd0t+EV:.+Co1rFD5Z2@<-'nF!,UHARlotDBO%7AKYetEbAr+An>ClBjtmi$;No?
+EV19F<G(%F(HIB9L_Au/g+,,AKXZ96Qg)a+DG_8ASu$iA0>u4+C\n)@3B&uD/a<&FCcS+G[YH.
Ch3rK67sB)Eb/[#Df0!"@V$`+FCfN8+Cei$AM,*)BOr;/9L_Al+D>2)+<Y97F`JU8Bk)7!Df0!(
Bk;?.GA2/4$;No?+>GQ(0H`/*0JFVnDfTB0+E)-?@3BMtFD*9L<+oue+DGm>D09?%+DbJ,B4Z*+
+EV:*DBL'DH#RJ-@;H9G67sBQ:IH=EEc5](@ruc7FD,*)+E_aJ@;Kb*+D>2,AKW`N+E)9C+>Y-N
Bk)7!Df0!(Bk;?.+E(j7+EV:.$;No?+E1b2BHVM5FD)e5ATMo8FD,*#+>ki,+EqaEA9/l4ATAo(
Bk)7!Df0!(GqKG!67rU?67sC(ATD6gFD5SQ$;No?$;No?+B3#c+EV19F<G+.@ruF'DIIR2+CfG'
@<?4%DD,gE@:UL%@rc:&FE9JM:-pQ?:-pQU+<Ve:Eb/[$ATVL)FC])qFD5Z2@<-'nEsbZ//g)8Z
+Dbt)A9;C(F>,C'A8,OqBl@ltEd8!e67sB'+<YK=@:XIkF*')i11Y*/FD5Z2@<-W#:-pQU+<VeC
Ddd0uATMrI0Jd6R@ruF'DIIR2$;No?+<VdLCi<`mFCfN80JG=oBk)7!Df0!(Gm[;5/g)8Z+EV19
FC])qFD5Z2@<-X4@<?1($;No?$;No?+<VdLCi<`mFCfN80JP7lBk)7!Df0!(Gp#jK/g,%MF<GO2
Ec`FBAfsc:6OHRT/g)8Z+Dbt)A9;C(F>5I'A8,OqBl@ltEd8d&67sBuDfd+@@<-H4De:+c7RIMX
67rU?67sBtF`VXI@V$[&F`&=9DBNk<A7]d6+<XWsAKYl!D.Rc2@<,p%@rH7+FE2M6FCeu*F)N1C
BOQ!*A7]@]F_l.,:-pQU8g%PYE+iZhATVWr+EMIAFD5W*+E2IFF!,R<ASiQ(DBNG-EcP`$F<GLB
A7]cg:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F;DJs\R1($cC
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+$4:fbEHPu9AKW@5ASu("@;IT3De(4&$3                                     ~>
)
showpass 3 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2)cX<+>P&o1E\M4+>GYp1c?I22]sq4+>GYp2)cX42'=\/+>GYp1,pC21E\P/+>G\q2)$..0d&>-
C2[Wl@<6-mFCfN8F(/R!Bk&9-ATMs7+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-
De*?uF`V5<ATMs7@rc^5BHVD.F*)IG/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$
A7^"-ASuR'Df0Z.F*)J7G][M7F(oQ1+EV19FE8QV+EV19FE8R:DfQsm:IH=:G][M7F(oQ1F)#W(
Cgh?sATVL)FE;8,EbAr+An>ClBjtmi+EV19FE8QV+EV19FE8RKBln#2Cgh?sAKYH)F<G1,@<6-l
Ch4`"@<>pmDe*g-AT2'uATVL)FE;8:@:UL(@<-(#F`S[IATMr9A8,OqBl@ltEbT*+C2[X%F`M,+
FCfN8F(B!+E,Tf/+E(j7FCfN8+Co1rFD5Z2@<-'nF)#W(F)>i2ATVL)FE;M?Deio,FCfN8F!*%W
F)>?%C`mh2F*&O7@<6"$+Cf(r@r#drB-:]&Eb-A;DfTB0C2[X(FE1r6F*(u7FE;MFEb0<5+EV19
FE8QV+EV19FE8RKBln#2Cgh?sAKZ)5+Eh=:Gp$p3EbAr+A79RgCi<`mCgh?sAS,L^F(o*"ARf.i
AT2[$E+*cu+EV19F<G+.@ruF'DIIR"ATJu+DfQt:@<-!l+D,1nF(o*"AKZ)+F*)I          ~>
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
