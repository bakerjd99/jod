NB. JOD dictionary dump: 14 Oct 2018 11:50:01
NB. Generated with JOD version; 0.9.996; 40; 14 Oct 2018 11:27:55
NB. J version: j807/j64/windows/release/commercial/www.jsoftware.com/2018-10-05T10:39:42
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

JODTOOLSVMD=:'0.9.996';41;'14 Oct 2018 11:50:01'

JODVMD=:'0.9.996';41;'14 Oct 2018 11:50:00'

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

rxs=:3 : 0

NB.*rxs v-- regular expression search.
NB.
NB. monad:  rxs ??
NB. dyad:  ?? rxs ??

ok 'NIMP rxs'
:
ok 'NIMP rxs'
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
1H%$32E2g7+>t>s3$:1'1H$@9+>u,#0f'q-3$:+%1,g=11a"\4+>P\p2_lL10H`80+>Gbs1,C%-
0d&8,+>t>t1*ACr0fC.7+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt2BXb4+>Y,q1*A;*+>Ybq1a"V0
+>Y,t1*AS"2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!1GL"0+>Ybq2]sk1+>Y,s0d&=r1,U1/
0H`5,+?1K$3$9t!1,C%.+?:Q!0H`2-+>k9!1E\Fq1,C%-0H`20+?(E"1*AIt2DlU9+>khq0ea_+
0d&J!1bp10+>Gbs1E\M1+?:Q"1E\Y"1H?R8+>ktu2'=h3+>k9!0H`=t2DQC5+>Yer1*A>4+?1K"
2BXq$1-$I7+>Ynu2BXb7+>GPm1,L+/+>PVn1E\D4+>Y,q2'=V/+>Yhs0f:(13$9t2+>Yer0fL43
1E\G,+>YuF8Ol?O;f6_pATD3q+Cf(nEa`I"ATDi[<D?:a;b&Z:+Eh=:F(oQ1+EV:*F<G(6ART[l
A0>u-BlbD-F_u)0Bl%?L6pjaF;bp(UFCf]=+D#(tFDl1BFDi:EF(HJ<BOu'(Ecl8;Bl7Q+8l%ht
Bl5&.@rH7+Deru-Df-\!Bl7I"GB4mJH#n(=D0&-66VgHU:J=2a:/Fc)DffQ0@:Ul=/nK9=+@S[c
:JOha9LU(C@<?0R76s=1;J1#gF`8I3DIal2F_Pr/+D>=pA7]d(@rGmh8U=!)6tpO\ATDBk@qB.g
Eb-@c:IH=>DKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[WsDKKH1Amo1\
.7nhX:IJo7FCfK)@:NkI<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et+DG_8ATDBk@q?c7+E_a:A0>?,
+=M;BFD>`)Bl8$(Eb8`iALSa4F`M26B-9fB6m,r]Bl%<OH:gt$FDl)6F%T4r<)6:`;]odlFCfK)
@:Njk/KekJ@:Wq[+DG_8D]gHBC2[W3+>"^WARuu4F(KH.De*R"FCfK)@:Njt8U=!)7!3TcDKKH1
Amo1\C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k
+CT.u+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&AP,ls:.eG\:*=IaC1Ums+Cf>#APGHX
;GU7p:do50@rcK1FCf]=+EVmJATKCFA7]^kDIdfL+A,R";Fs\a/5/?/79D*3<)$%;=A;I?<(0ng
/4*K=74_/!;G0DR=&(;H<(8iA8Q\DL:KBn^D/"6+A0><%F(o9)D.RU,+E)F7EcPl)AKZ)'B2:i`
<Du7N<(1_7Ap&0)@<?''Ci<flC`mG&ASuU(AnbgsF!,R5B2:i`<Du7P:/l+>D.Oi.@V0b(@psIn
Df-\6Bl.R++>"^LBkM*jEZfO6Cis<1+DbV1F!,:5CLq=-+EVNE@r,RpBMUra<Du7]7TaS<Ap&0)
@<?4%DBNb6@ps0rBk1dmFD5?$ATAo4Eb/isGYhOB85DuW=]@pf:*=UfEbTK7+E(_(ARfg)@rGmh
;c-4e;+r*R@rc:&F<GL2C1Ums+Cf>#AQ2)s<*;L]9gqs%ATMr9D.Rd0@:s-oF*D>?@qZu:+>G!W
DBLVUDe<TjB4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+C\bhCNXT;@W$!uBleA=
DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(qE$/b,Ch7ZsDJXB*@<,jkF(Jd#
@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5EZfF;D/a<&+Cf(nEa`I"ATAo0
BleA=E+*j1ATD[0@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)F_kl>+Cf>,E,oN2F(Jl)8l%ht
Ci<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(JlkF_PZ&F!+t2D/aN,F)to'+Eh=:
F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'ARfLnFECr#1Lk*0@r$-.@;Ka&FD,]+
AKWC=@;TR,>@VJXF)tV<FCf]=.3N_@@VfUs@rH4'Eb0<5C3!m&Dg#]5+CT)&+EqL5FCcS9E+*6f
+D,Y4D'2FnGAhM4F!+n/A0>r,DfTr2DK?q:De!3l+DtV)ATM@%ART[lC2[WnBk)7!Df0!(Gp%$7
C1Ums+CfG'@<?4%DBO+6EaiQg@;BIeF_kl>+E;O4Ch[KqARlom@:O(qE$/b,Ch4`.@<?0nAn,Xq
F(JitDf]J4A8,OqBl@ltEd8d>Bl%?kDJX-'F*&OC@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYd
AKYT!Ch7ZuE-#T4F(KG9A8,OqBl@ltEd8dH@<,dnATVL(F(BE1E+ifkA7]dkEb/[$ATJu9BOr;s
F_u)0Bl%?'@;]TuGB.D>ATJu-ART+\EZf(6AoD^,@<?4%DIdm/DIIBnF)to/ARfg)Df0B:+CoV6
Ch[BfFCcS4@;TRs+DG^9FCAWpAKYGjF(Jl)Df-\0Bl\9:+Cf>+F_u#-A7]:cF<G+.@ruF'DIIR2
+E(_(ARfh'ATVKoBlkJ>AU&<0ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF
+EV=7ATMs%D/aQ2De*d(FEMVA+A,Et+E)-?Eb0<7Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QK
DffZ(Ed)5=ASc!r@;BEs@;]TuCi<`m+A,Et+D5_5F`;/8@:WhUCLh."Ci<`mF!+t2D/a<&FCcS8
AT;j(F*(u(+C\bhCNXS=A8-'q@ruX0Gp"M\.;Wp2A7TCpCi<`mF!,R<AKYK$D/a<&FCcS8AT;j(
F*(u(+Co2,ARfh#Ed8cUGq!QJ@:X7cCi<`m+DtV)AKYK!@<6K4AoD]4.![6a;IsolCige6F!*.Z
AoD]4F*1u&ATMo8@;]Tu0d((HEZet&Bl%p4ASc9nA9)6nCi<`mF!,[FEb$;$DIal3ATMr9Eb/io
Eb0,uAKYf'F*)IGAo_g,+E_a:F!,(/Ch7F$@:XG$@;Tt)Ci<`mF!,"-Eb/a&DfU+GFD5T'+EMX5
D/aP=.![7XDdd1#DfTB0Ci<`mF!,"-@ruF'DIIR2+EqaEA9/l-DKKe>FCB3&ATT&2De!3lATM^)
F)>?$AKYf-@:UL%@rc:&FDYo3Ch[s4+E(_(ARfh'+DG^9@;Ka&Eb/ltF*(u6ARlooBk)7!Df0!(
Bk;@&DJXB*@<,jkD..L-ATAo2@;TQuCh[s4+EM+&Eard#@;TRc@<?R%G][t7@ruc7@;]Tu@r,Rp
F(o6#ATJu3@;TRs+DG^98g%V^A7]Xp@ruU+@;TRs+Cf>-FCAm$Bl7Q+F*1r5FE2)5B0%.`4$"a!
@<?Q5@UXA"-Rg0UCh%R)+=CT>-Z3a>ApA0$FCSu,E,oN%Bm=31+=M/IFD5T+H=\42DfQt:@<-!l
+Dbb5FE8ll+=K<4-YR'6@W*AuDdd`8.3NMEE+X>;-Xq!ADJXB+G\pl2@q[!&@;TQuF*2),Bm=31
3Zoh43[]2]A76U+@:WdhH#G&Z+Du":Ap>FGA76j'Dfor6Eb03"Df0`0Ecc@FDJsZ8F!,OGDfTE"
+CT=6@VK^gEd8dLD]ik1DIm6s+EV1>F<GU8E,oN2ASuTuFD5Z2F)PN0AU&<*F)to0@VfUs+CT.u
+ED%8F`MA@+E(_(ARfg)FCf]=De*d*ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;@)F`_&.Cij`;
F`_[I@;Ka&FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mMF`_A>Df0W<DfTD38lJM\+CT=68l%ht
FCf]=+DkOsEc6#<F`_SJF*)>@AKXfpFD,T1+Cf>#AKYE&+A,Et+EV1>F<GF/@rcL/E-68DEGT]<
DfTD3;c-42@<3P`:IH=IAU&;>D.-ppDf]r1Ch7$rASQ-oAnc-kC`l>G6m-M]E,9)oF(HJ8FCfE4
Ec#i>DK?pm+DkOsEc3(A@rc:&FE;JEFE2MAF!+'tFCfN8+EM%5BlJ08Ed2YGAS6.%@<*K%G]7\7
F)u&6DBO"3@<,jkF(KH&F_PZ&A8-(*F(KH7+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaEA92j(
F*(u2G%ku8DJ`s&FE;#8F!,UE+EV:.+=Lr=De(:>Ci<flCh4`$DfQt@F`))2DJ()6ATMr9@psFi
F*2G4@<?'qDe*BmF*)G:@Wcd,Df0]:A79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:Bju4,Bl@m3E+EC!
ASQ-oD..<rAn?%*F(KG98l%ht@:WneDK?q;@;]dkATMs7+EVNE@s)g4ASuT4G%G]8Bl@m3E+EC!
ASQ-oF)Q2A@qB1nD/aQ=E+EC!AKYT!Ch7Z1Bl5%c:IJ,W<Dl1Q+Co2-FE2))F`_>9D?       ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GCL*1H6L4+>GPm1,1XA+>GPm0ekXC3$9q2+>PZ,3?U%3+>Pr83?U(4+>Z#:2]sh0+>Gi01*A>.
+>GW-3$9q0+>GW*3?U%9+>GZ+2'=V-+>Pf/1*A;2+>Gf72'=V/+>PW)0H`@u0fM*J+>GSn2`<H7
0f'q,0Jb[20f^@30f_-70f:(.0JkR.0ea_02`Mp71E\V41*A;1+?;/5+>G\q0f1U>+>G\q0f:gF
+>G_r0etXC+>PYo1,gmB+>PYo0f1^E+>PYo0fUpH+>PYo1,(^E+>PYo1G^^D+>PYo1,(O@+>GVo
3&NT:0ea_*2)[-20f1"-2_m*11,C%/1H@660fC./1H@660f'q21bg+.1a"P01H$@11*A;33&Da;
+?;;9@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn+Dbb5
F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S@:O(q
E-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(SATMs.
De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'
DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4
FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4
<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO:-pQUFD,6+AKYi4F*&O6AKYE!+E)41
DBNJ(@ruF'DIIR2%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFCEb/]40f16e$4R>R
EZf:2+EV..@rr.e:-pQUGAhM4F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAo&DJUFC-OgCl
$;No?+EV19FE8R:Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS*$>"6#0d'qCC`k)Q%13OO:-pQUATT&)
ATVL(@1<QTEZd+[@W$!)-RT?1ATAnL+C]5)+=ANG$>"6#1a$7FC`k)Q%13OO:-pQU@W$!)9i"\e
9N`KTBl\64EcW@6DJUG-DfQtBBOr<'Df^"C@s)g4ASuT4@UWb^F`8HT+D#e-AT2`#$;No?+C]5)
+E).6Gp%0>@<,jkATJu&+EM77B5D-%E-67FA8,OqBl@ltEd8d:@:O(qE$079ATD?)BlbD7D]j"-
FD)*j:-pQUBOu'kAKZ).ATD?)@<,p%DJpY:@<?0*DfTB"EZfC6F*2;@F!,:5CLoOL+>=pF0d("E
C`k)Q%16Ze+>b2s+C]5)+=CMa:K/\a+AP6U+DkOsEc6"AASu$mDJ()9Bln#2-XT8;<$rf&DBNG3
EcP`/F<G%$@r$4+%16Ze+>P&p+C]5)+=D)<-QjNS+AP6U+D5_5F`;CE@rH7,@;0UnDJ()5F^fE6
EbTE(+=D)<-Qm,@+CfP7Eb0-1+C\bhCNXS*$4R>REZd%Y0d&.m@W$!)-RU#Z+<XEG/g+S=C`mV6
F`)7CBl5&'F`MM6DKI"1@:O(qE"*.cEZd%Y0d&1n@W$!)-RU#Z+<XEG/g+S=C`m.sG%G]'F!,17
+CfP7Eb0-1+C\bhCNXS*$4R=O$;No?+EqaEA9/l*Ec5e;E+*d/Bk):%@<*K"@:O(qE,uHq:-pQU
@VfOj+E(j7@UWb^F`8I@F_tT!EZen2FE8uUAS4%H4?G/M+=Acs1G1C@/ho7:0f:R<1bLL=/ho+6
0Jk-d$;No?+D,P4D..O.ARlp)D]iJ)E+iZ&F)Q)@F!,=.FCSu,DKTf-EbT#+F)Q)@Et&IfEZeh/
F_u1_3ZqmLC`k)X-OgDlCHX^$4u%CnDKTf;4ZX^6/g+V@F_u1/$4R>REZeh/C`m2&+<VdL+<VdL
+<VdL+<XEG/g)9GDJUFC/ho:4+<VdL+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l-DBNS+G%GP6@UWb^
F`7csATAo&DJUFCEb/]-/7NB;+<VdL+<Ve%67sB'@W$!)-ZWd-/ho:4+<XEG/g,">FCSuqF!+n-
C`mq?Eb'56F*(i2FD5W*+EqOABHS[CAR[#0Bl5&+Bm+'*+C\bhCNXS*$>"6#0H`.o@W$!)-Y7NM
/7NB;+<VdL:-pQU+>=oo+C]5)+=C`F/ho:4+<XEG/g,@VEb'56ASu$mDJ()9Bln#2-Y7NM+DG^9
B5)O#DBNCs@r$4+%16Ze+>Fup+C]5)+=C`F-S/_B+<VdL+AP6U+<WB]1E^.EC`k*:GV1^0-QjO,
67sC&ATMs7+D#G$Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"@:O(qE"*.cEZd+[1*C%DC`k*DA1&p;
CEO`B+<XEG/g)8l+>P'KDJUFCDe(IT2^]^j:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3Bl7Q+
-Z<NC+DG^9B5)O#DBNCs@r$4+%13OOATAnI+>Fun+C]5)+=BK'/7NB;+<Ve%67sBhCht5&A9MO)
@WNZ5FCB33Bl7Q+GA2/4+=BK'+DG^9B5)O#DBNCs@r$4+%13OO%15is/g)`m<(0_b+B)9-6UapP
7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48D
Bk'.`3F?65Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n@W$!2+CT;'F_t]-F<GXADeio,FCfN8
F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2
+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?
+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M1GK=G:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=:-pQU0fX)]F>5Nn@:X+qF*(u(+D,P4+>Gi!3]%shBOPdkAIStU$=e!aF`MM6DKI!K@UX=h
-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$a
F)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%
@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3
Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m
;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQUEHQ2A
AN`(%-RU8g/3kU7-7:/g-Rh;/,CUb!3^>)V-7:/g-RgJR$4R>;67sBnASu("@<?''@;Ka&E,Tf=
Bjtmi+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o%15is/g,4FBQ60r+?hi#/g)qm+AP6U
+EM+&Earc*EHP]+BkD'jEcVZs:-pQUC2RNE3ZoOf+DEGN1a!o967sBQ+EqaEA0>buD.Oi"CghC+
%13OO:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2%15is/g)8Z+@U*\A7]9o+<X'd@ruF'DIIR2
6Z6LHF!)SJ+<VdL+@KpRFD5Z2@<-W\De*F#;e9BX@qZu-+<VdL+BNK%A5d&JEarcT:18!N6Yp1P
F!)SJ+<VdL+<Ve$@:O=r;e9BX@q\SF@rcL0H#R=($;No?+DbJ,B0A9u-p22r0I\+q+=K>r0Ha.X
8ju*H:.&AsC2[Wi.3L/a-nK]n:I7ZB6W?fJ?X[\fA7$cIF(8m'.3L/a-nK]n/6>VF6sjA;De*3(
4*+nFEB@ke+>bMi/0H>lHRLF>5snOG?X[\fA7$cIF(8m'4&&".;GU7p:dn`"C2[Wi.1HUn$;No?
+Eh10Bk/?,BkM+$+=MLa+CT;'F_t]-F<GO2FED)7DK?6o:-pQU+<Ve<D/aTB+<Y-%@r$4+@r?B2
+<Y*/Ch[cr@:O(qE$-9?@<?!mEb/`lDKI!D+DkP/@q]Ro@UWb^F`7cs:-pQUEaa!$4ZX]5-QjNn
+<W$a-QjNS+<VdL4!5n'@rHL-F=/1m+<VdSDIIBn-QjNS+<Vdg+=D&8D.P>0Dfor>-OgCl$;No?
+D,P4D..O-+CT)&+Eh10Bk/>7@W$!2+CT;'F_t]-F<GO2FED)7DK?6o:-pQU-Vcu\+=A9_+u(2_
4!HC%,!%&'4s2R&0H`+nHQk0e+?gnr4=;7\DJUFC.3L/a9KF:N+=nX^+=K?g@<-!0+=nWtEHQ2A
AL9#n+ECn2B+51W$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:E
B6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+
-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r
/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&$4R>;
67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-
$>sEq+C]5)+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k)X1FEV=%15is/g+YEART[l+EV:;ARuun
@:O(qE,uHq%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#TtFC])q
F:AQd$;No?+EM+(Df0).DdmHm@rri'Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)
A5d>`CLqU!F*')F$9g.jE+*6lA0>u)Bk)5o$6Tcb:-pQUFD,B/A0>f"C1Ums+Cf>+Ch7*uBl@ku
$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#TtFC])qF:AQd$;No?
+EMI<AKYGjF(o,,Bl8*&Ch[E&@<-"'D.RU,F!*%WAU&0*@ru9m+D#S6DfQ9oDImi2@W$!)-SAgT
%16uaEZd1]@W$!)-S?u*-OgE#ATAnK+C]5)+=Aco-OgE#ATAo&DJUFL%16uaEZeh/C`khf-OgCl
$;No?+EMI<AKYGjF(o,,Bk1dmFD5i2ATJt'$7KA$C`k)Q.3L3'+C]5)+?M<)@W$!)-S?bh%14L;
+C]5)+=ANc+>#Vs0HahBC`keoHS?RODJUFC/ghbN$7IVO@W$!)-RU>c/NP"/+C]5)+?M<)0d'qC
C`k)X-Qij*-o)oSDJUFC-Rg/i3Zp1#@W$!)4#)(;+C]5)+=Ach+:SZ+1E^.EC`k)Q.3L3'+>Y-L
DJUFW0mb]!@W$!)-S?bh%14L?+C]5)+=ANc+>#Vs1a$7FC`keoHScjSDJUFC/ghbN$4R>;67sB'
@W$!)-S?bU$9g.j@W$!)-S?bh%14p74WktYDJU[Q-OgCl$=[FSDKTeZ3Zoe&-Qjr_,!$i$1E\1j
+taud4#)(kDJUFC/gi(j/M8.n/gh)8%15is/g+b;FCSu,Ao_g,+<YQ?DIn',F*(u2F<G%$@r$4+
+>"^IEcQ)=+D#e:ARfgnA.8l`ATAo&DJUG)@:X7uD%-hiATAnI+C]5)+C\biDKTe*$>sEq+>G!J
DJUG)@:X7uD%-hiATAnK+C]5)+C\biDKTe*$>sEq+>Y-LDJUG)@:X7uD%-hiATAnM+C]5)+C\bi
DKTe*$4R>;67sBT@;^?5De:,4ASkjiDJ=!$+EV19FE8R7EbTW0@ps1iGp$X/E+Not+E)-?FD,5.
Ci<`mARlp%@VTIaFE9&D$;No?+A$/fFD,5.Ci<`m+EMC<CLnW1ATMr9F(96)E--.D@<,p%@q]:g
B4YTr@3BB)F<GL6+EV:.F(HJ9ATMs7%15is/g,"RF*&O6AKZ#)G%l#/A1eu6$4R>;67sB'@W$!)
-RT?1-tI43+=ANc+>#Vs@W$!)-RT?1%15is/g)9GDJUFC/n8gBDKI68$7KA$C`k)Q.3L3'+C]5)
+?M<)@W$!)-S?bU$4R>;67sB'@W$!)-Z3@0AL@oo-o!e+4$"`U:JXYM<)64B+@8k"9L2WR9edbW
:JXYX8Q/S26;LBN<'`iE740N,/NP"`DJUFC6;LBN-OgCl$;No?+<Y-2C`k*C@;TR.@rHL-F=.M)
-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+C]5)+=B`U<$s4Y14*JJCaUh_%13OO:-pQU0HahB
C`k)Q%14L;+CoA++=ANc+>#Vs+>=pIDJUFC-OgCl$;No?+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'
+>=pIDJUFC/gh)8%15is/g)hj@W$!)-SAnIF`):K%14L;+CoA++=ANc+>#Vs0HahBC`keoHX^l/
+=Ach%13OO:-pQU0HahBC`k*C@;TR'%14L<4!6UG-ULU)9L2WR9e[\V:JXYM<)64C+@8k"9MA#V
<$4M':J=_R6;0fq.3L3'+>=pIDJUFC6;LBN-OgCl$;No?+>=pIDJUFCDIIBn/n8gBDKI68$7IVj
-V7'45u^WS0IJq08PW5a5se76-Rg/i3Zp+!@W$!)-V7'4-S.>7HX^l/-S?bU$4R>;67sB8+C]5)
+=ANG$7IVj-Za-CCLo2!ATMrI-T`\sD/X3$0iV_*F>,((-Za-CCLo5"ATMrJ-Rg/i3Zp."@W$!)
-RT?1%15is/g)kk@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."@W$!)-S?bU$4R>;67sB8+C]5)+=AdO
Dfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs0d'qCC`kepHX^l/-S?bU$4R>;67sB8+C]5)+=D&8
D.P(($7IVj-Za-CCLo5"ATMrI-T`\sD/X3$0iV_*F>5-l+>#Vs0d'qCC`k*HD/X3$0ddD;%15is
/g)kk@W$!)-Z3@0AM.J2F`):K%14L<4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+=D5IDeio<-S.>7
HX^l/-S?bU$4R>;67sB9+C]5)+=ANG$7IVj-Xq"4CiaH3CLo1I4""KUDesK3Deio=-T`\iDKKr:
Deio<-T`\iDKKr:Deio=-Rg/i3Zp1#@W$!)-RT?1%15is/g)nl@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp1#@W$!)-S?bU$4R>;67sB9+C]5)+=AdODfor>-OgD2-p045/3GU3@6,h[/NP"0+C]5)+?MB+
@W$!0/gh)8%15is/g)nl@W$!)-Z3@0AL@oo-o!e2Bl8$6D/X3$0deCm/NP"0+C]5)+=Cl@FE;;;
CLo4J%13OO:-pQU1*C%DC`k*C@;TR.@rHL-F=.M)-o!e2@W-1$F)>i2AM>J\+>#Vs1*C%DC`k*7
Df9G>/3>V6@W$!)-S?bU$4R>;67sB:+C]5)+=ANG$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!0
-OgCl$;No?+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Y-LDJUFC/gh)8%15is/g)qm@W$!)-SAnI
F`):K%14L<4"#)lBlmp-D/X3$0deCm/NP"1+C]5)+?M<)@W$!0/gh)8%15is/g)qm@W$!)-Z3@0
AL@oo-o!e2F*22=ATM^,CLo4J.3L3'+>Y-LDJUFCF*/i>$4R>;67sB:+C]5)+=D&8D.P>0Dfor>
-OgD2-p045/3GU3@6,h[/NP"1+C]5)+=D5Q-S.>7HX^l/-S?bU$4R>;67sB;+C]5)+=ANG$7IVj
-Za-CCLo1o@:O=r0IJq0F)>i2AM?he@rcKB-T`\sD/X3$0hl(dEc3WZ4"#)dDeio=9jqOPD_WUg
+>#Vs1a$7FC`k)Q%13OO:-pQU1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a$7FC`k)X-OgCl$;No?
+>b3MDJUFC/n8gBDKI68$;No?+>b3MDJUFCDIIBn-OgDX67sB;+C]5)+=D&8D.P>0Dfor>-OgDX
67sB7+>G!JDJUFC-OgCl$;No?+>=om+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>G!JDJUFC/gh)8
%15is/g)hj0d'qCC`k)X@rHL-F=.M):-pQU0H`(m@W$!)-Z3@0AL@oo:-pQU0H`(m@W$!)-Z3@0
AM.J2F`):K%15is/g)hj1*C%DC`k)Q%13OO:-pQU0H`+n@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!
1*C%DC`k)X-OgCl$;No?+>=on+C]5)+=AdODfor>-OgDX67sB7+>P'KDJUFCDIIBn-OgDX67sB7
+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=oo+C]5)+=ANG$4R>;67sB7+>Y-LDJUFC/gh)8-t7(1
+=Ach.3L3'+>=oo+C]5)+=Ach%13OO:-pQU0H`.o@W$!)-SAnIF`):K%15is/g)hj1E^.EC`k*C
@;TR'%15is/g)hj1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0d&1n@W$!)-RT?1%15is/g)kk0d'qC
C`k)X-OgD2@W$!)-S?bq+>#Vs0d&1n@W$!)-S?bU$4R>;67sB8+>G!JDJUFC/n8gBDKI68$;No?
+>Fun+C]5)+=D&8D.P(($;No?+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>P'KDJUFC-OgCl
$;No?+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>P'KDJUFC/gh)8%15is/g)kk1*C%DC`k)X
@rHL-F=.M):-pQU0d&4o@W$!)-Z3@0AL@oo:-pQU0d&4o@W$!)-Z3@0AM.J2F`):K%15is/g)kk
1E^.EC`k)Q%13OO:-pQU0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."1E^.EC`k)X-OgCl$;No?
+>Fup+C]5)+=AdODfor>-OgDX67sB8+>Y-LDJUFCDIIBn-OgDX67sB8+>Y-LDJUFCDIIBn/n8gB
DKI68$;No?+>P&o+C]5)+=ANG$4R>;67sB9+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>P&o+C]5)
+=Ach%13OO:-pQU1*A:o@W$!)-SAnIF`):K%15is/g)nl0d'qCC`k*C@;TR'%15is/g)nl0d'qC
C`k*C@;TR.@rHL-F=.M):-pQU1*A=p@W$!)-RT?1%15is/g)nl1*C%DC`k)X-OgD2@W$!)-S?bq
+>#Vs1*A=p@W$!)-S?bU$4R>;67sB9+>P'KDJUFC/n8gBDKI68$;No?+>P&p+C]5)+=D&8D.P((
$;No?+>P&p+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>Y-LDJUFC-OgCl$;No?+>P&q+C]5)+=Ach
%14LmDJUFC/gi(j/NP"0+>Y-LDJUFC/gh)8%15is/g)nl1E^.EC`k)X@rHL-F=.M):-pQU1*A@q
@W$!)-Z3@0AL@oo:-pQU1*A@q@W$!)-Z3@0AM.J2F`):K%15is/g)qm0d'qCC`k)Q%13OO:-pQU
1E\Cp@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$0d'qCC`k)X-OgCl$;No?+>Y,p+C]5)+=AdODfor>
-OgDX67sB:+>G!JDJUFCDIIBn-OgDX67sB:+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>Y,q+C]5)
+=ANG$4R>;67sB:+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,q+C]5)+=Ach%13OO:-pQU1E\Fq
@W$!)-SAnIF`):K%15is/g)qm1*C%DC`k*C@;TR'%15is/g)qm1*C%DC`k*C@;TR.@rHL-F=.M)
:-pQU1E\Ir@W$!)-RT?1%15is/g)qm1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E\Ir@W$!)-S?bU
$4R>;67sB:+>Y-LDJUFC/n8gBDKI68$;No?+>Y,r+C]5)+=D&8D.P(($;No?+>Y,r+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>G!JDJUFC-OgCl$;No?+>b2q+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>G!JDJUFC/gh)8%15is/g)tn0d'qCC`k)X@rHL-F=.M):-pQU1a"Lq@W$!)-Z3@0AL@oo:-pQU
1a"Lq@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*C%DC`k)Q%13OO:-pQU1a"Or@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp7%1*C%DC`k)X-OgCl$;No?+>b2r+C]5)+=AdODfor>-OgDX67sB;+>P'KDJUFC
DIIBn-OgDX67sB;+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>b2s+C]5)+=ANG$4R>;67sB;+>Y-L
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+C]5)+=Ach%13OO:-pQU1a"Rs@W$!)-SAnIF`):K%15is
/g)tn1E^.EC`k*C@;TR'%15is/g)tn1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0HahBC`k)Q
%13OO:-pQU0H`(m0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m0HahBC`k)X-OgCl$;No?+>=om
+>=pIDJUFC/n8gBDKI68$;No?+>=om+>=pIDJUFCDIIBn-OgDX67sB7+>Fum+C]5)+=D&8D.P>0
Dfor>-OgDX67sB7+>Fun+C]5)+=ANG$4R>;67sB7+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP".
+>Fun+C]5)+=Ach%13OO:-pQU0H`(m0d'qCC`k)X@rHL-F=.M):-pQU0H`(m0d'qCC`k*C@;TR'
%15is/g)hj0d&1n@W$!)-Z3@0AM.J2F`):K%15is/g)hj0d&4o@W$!)-RT?1%15is/g)hj0d&4o
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d&4o@W$!)-S?bU$4R>;67sB7+>Fuo+C]5)+=AdODfor>
-OgDX67sB7+>Fuo+C]5)+=D&8D.P(($;No?+>=om+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=om
+>Y-LDJUFC-OgCl$;No?+>=om+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>Y-LDJUFC/gh)8
%15is/g)hj0d&7p@W$!)-SAnIF`):K%15is/g)hj0d&7p@W$!)-Z3@0AL@oo:-pQU0H`(m1E^.E
C`k*C@;TR.@rHL-F=.M):-pQU0H`+n0HahBC`k)Q%13OO:-pQU0H`+n0HahBC`k)X-OgD2@W$!)
-S?bq+>#Vs0H`+n0HahBC`k)X-OgCl$;No?+>=on+>=pIDJUFC/n8gBDKI68$;No?+>=on+>=pI
DJUFCDIIBn-OgDX67sB7+>P&n+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&o+C]5)+=ANG$4R>;
67sB7+>P&o+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>P&o+C]5)+=Ach%13OO:-pQU0H`+n0d'qC
C`k)X@rHL-F=.M):-pQU0H`+n0d'qCC`k*C@;TR'%15is/g)hj1*A:o@W$!)-Z3@0AM.J2F`):K
%15is/g)hj1*A=p@W$!)-RT?1%15is/g)hj1*A=p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A=p
@W$!)-S?bU$4R>;67sB7+>P&p+C]5)+=AdODfor>-OgDX67sB7+>P&p+C]5)+=D&8D.P(($;No?
+>=on+>P'KDJUFCDIIBn/n8gBDKI68$;No?+>=on+>Y-LDJUFC-OgCl$;No?+>=on+>Y-LDJUFC
/gh)8-t7(1+=Ach.3L3'+>=on+>Y-LDJUFC/gh)8%15is/g)hj1*A@q@W$!)-SAnIF`):K%15is
/g)hj1*A@q@W$!)-Z3@0AL@oo:-pQU0H`+n1E^.EC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0HahB
C`k)Q%13OO:-pQU0H`.o0HahBC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o0HahBC`k)X-OgCl$;No?
+>=oo+>=pIDJUFC/n8gBDKI68$;No?+>=oo+>=pIDJUFCDIIBn-OgDX67sB7+>Y,o+C]5)+=D&8
D.P>0Dfor>-OgDX67sB7+>Y,p+C]5)+=ANG$4R>;67sB7+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j
/NP".+>Y,p+C]5)+=Ach%13OO:-pQU0H`.o0d'qCC`k)X@rHL-F=.M):-pQU0H`.o0d'qCC`k*C
@;TR'%15is/g)hj1E\Cp@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\Fq@W$!)-RT?1%15is/g)hj
1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E\Fq@W$!)-S?bU$4R>;67sB7+>Y,q+C]5)+=AdO
Dfor>-OgDX67sB7+>Y,q+C]5)+=D&8D.P(($;No?+>=oo+>P'KDJUFCDIIBn/n8gBDKI68$;No?
+>=oo+>Y-LDJUFC-OgCl$;No?+>=oo+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>Y-LDJUFC
/gh)8%15is/g)hj1E\Ir@W$!)-SAnIF`):K%15is/g)hj1E\Ir@W$!)-Z3@0AL@oo:-pQU0H`.o
1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,0n\DJUFC-OgCl$;No?+>b2q+>PYo@W$!)-S?bU
$7KA$C`k)X-Rg/i3Zp7%0d&5++C]5)+=Ach%13OO:-pQU1a"Lq1,0n\DJUFC/n8gBDKI68$;No?
+>b2q+>PYo@W$!)-Z3@0AL@oo:-pQU1a"Lq1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P\p
@W$!)-RT?1%15is/g)tn0d&5,+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1*C%DC`k)X-OgCl
$;No?+>b2q+>P\p@W$!)-SAnIF`):K%15is/g)tn0d&5,+C]5)+=D&8D.P(($;No?+>b2q+>P\p
@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&5-+C]5)+=ANG$4R>;67sB;+>Fuo1E^.EC`k)X-OgD2
@W$!)-S?bq+>#Vs1a"Lq1,C%^DJUFC/gh)8%15is/g)tn0d&5-+C]5)+=AdODfor>-OgDX67sB;
+>Fuo1E^.EC`k*C@;TR'%15is/g)tn0d&5-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1a$7F
C`k)Q%13OO:-pQU1a"Lq1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pbr@W$!)-S?bU$4R>;
67sB;+>Fuo1a$7FC`k)X@rHL-F=.M):-pQU1a"Lq1,L+_DJUFCDIIBn-OgDX67sB;+>Fuo1a$7F
C`k*C@;TR.@rHL-F=.M):-pQU1a"Lq1,U1`DJUFC-OgCl$;No?+>b2q+>Pes@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp7%0d&5/+C]5)+=Ach%13OO:-pQU1a"Lq1,U1`DJUFC/n8gBDKI68$;No?+>b2q
+>Pes@W$!)-Z3@0AL@oo:-pQU1a"Lq1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pht@W$!)
-RT?1%15is/g)tn0d&50+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2BZIHC`k)X-OgCl$;No?
+>b2q+>Pht@W$!)-SAnIF`):K%15is/g)tn0d&50+C]5)+=D&8D.P(($;No?+>b2q+>Pht@W$!)
-Z3@0AM.J2F`):K%15is/g)tn0d&51+C]5)+=ANG$4R>;67sB;+>Fuo2]uRIC`k)X-OgD2@W$!)
-S?bq+>#Vs1a"Lq1,g=bDJUFC/gh)8%15is/g)tn0d&51+C]5)+=AdODfor>-OgDX67sB;+>Fuo
2]uRIC`k*C@;TR'%15is/g)tn0d&51+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo3$;[JC`k)Q
%13OO:-pQU1a"Lq1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Po!@W$!)-S?bU$4R>;67sB;
+>Fuo3$;[JC`k)X@rHL-F=.M):-pQU1a"Lq1,pCcDJUFCDIIBn-OgDX67sB;+>Fuo3$;[JC`k*C
@;TR.@rHL-F=.M):-pQU1a"Or1,0n\DJUFC-OgCl$;No?+>b2r+>PYo@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp7%1*A>,+C]5)+=Ach%13OO:-pQU1a"Or1,0n\DJUFC/n8gBDKI68$;No?+>b2r+>PYo
@W$!)-Z3@0AL@oo:-pQU1a"Or1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>P\p@W$!)-RT?1
%15is/g)tn1*A>-+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p1*C%DC`k)X-OgCl$;No?+>b2r
+>P\p@W$!)-SAnIF`):K%15is/g)tn1*A>-+C]5)+=D&8D.P(($;No?+>b2r+>P\p@W$!)-Z3@0
AM.J2F`):K%15is/g)tn1*A>.+C]5)+=ANG$4R>;67sB;+>P&p1E^.EC`k)X-OgD2@W$!)-S?bq
+>#Vs1a"Or1,C%^DJUFC/gh)8%15is/g)tn1*A>.+C]5)+=AdODfor>-OgDX67sB;+>P&p1E^.E
C`k*C@;TR'%15is/g)tn1*A>.+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1a$7FC`k)Q%13OO
:-pQU1a"Or1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Pbr@W$!)-S?bU$4R>;67sB;+>P&p
1a$7FC`k)X@rHL-F=.M):-pQU1a"Or1,L+_DJUFCDIIBn-OgDX67sB;+>P&p1a$7FC`k*C@;TR.
@rHL-F=.M):-pQU1a"Or1,U1`DJUFC-OgCl$;No?+>b2r+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp7%1*A>0+C]5)+=Ach%13OO:-pQU1a"Or1,U1`DJUFC/n8gBDKI68$;No?+>b2r+>Pes@W$!)
-Z3@0AL@oo:-pQU1a"Or1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pht@W$!)-RT?1%15is
/g)tn1*A>1+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2BZIHC`k)X-OgCl$;No?+>b2r+>Pht
@W$!)-SAnIF`):K%15is/g)tn1*A>1+C]5)+=D&8D.P(($;No?+>b2r+>Pht@W$!)-Z3@0AM.J2
F`):K%15is/g)tn1*A>2+C]5)+=ANG$4R>;67sB;+>P&p2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Or1,g=bDJUFC/gh)8%15is/g)tn1*A>2+C]5)+=AdODfor>-OgDX67sB;+>P&p2]uRIC`k*C
@;TR'%15is/g)tn1*A>2+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p3$;[JC`k)Q%13OO:-pQU
1a"Or1,pCcDJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>Po!@W$!)-S?bU$4R>;67sB;+>P&p3$;[J
C`k)X@rHL-F=.M):-pQU1a"Or1,pCcDJUFCDIIBn-OgDX67sB;+>P&p3$;[JC`k*C@;TR.@rHL-
F=.M):-pQU1a"Rs1,0n\DJUFC-OgCl$;No?+>b2s+>PYo@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
1E\G-+C]5)+=Ach%13OO:-pQU1a"Rs1,0n\DJUFC/n8gBDKI68$;No?+>b2s+>PYo@W$!)-Z3@0
AL@oo:-pQU1a"Rs1,0n\DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>P\p@W$!)-RT?1%15is/g)tn
1E\G.+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q1*C%DC`k)X-OgCl$;No?+>b2s+>P\p@W$!)
-SAnIF`):K%15is/g)tn1E\G.+C]5)+=D&8D.P(($;No?+>b2s+>P\p@W$!)-Z3@0AM.J2F`):K
%15is/g)tn1E\G/+C]5)+=ANG$4R>;67sB;+>Y,q1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs
1,C%^DJUFC/gh)8%15is/g)tn1E\G/+C]5)+=AdODfor>-OgDX67sB;+>Y,q1E^.EC`k*C@;TR'
%15is/g)tn1E\G/+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1a$7FC`k)Q%13OO:-pQU1a"Rs
1,L+_DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Pbr@W$!)-S?bU$4R>;67sB;+>Y,q1a$7FC`k)X
@rHL-F=.M):-pQU1a"Rs1,L+_DJUFCDIIBn-OgDX67sB;+>Y,q1a$7FC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Rs1,U1`DJUFC-OgCl$;No?+>b2s+>Pes@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G1
+C]5)+=Ach%13OO:-pQU1a"Rs1,U1`DJUFC/n8gBDKI68$;No?+>b2s+>Pes@W$!)-Z3@0AL@oo
:-pQU1a"Rs1,U1`DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pht@W$!)-RT?1%15is/g)tn1E\G2
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Y,q2BZIHC`k)X-OgCl$;No?+>b2s+>Pht@W$!)-SAnI
F`):K%15is/g)tn1E\G2+C]5)+=D&8D.P(($;No?+>b2s+>Pht@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1E\G3+C]5)+=ANG$4R>;67sB;+>Y,q2]uRIC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,g=b
DJUFC/gh)8%15is/g)tn1E\G3+C]5)+=AdODfor>-OgDX67sB;+>Y,q2]uRIC`k*C@;TR'%15is
/g)tn1E\G3+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q3$;[JC`k)Q%13OO:-pQU1a"Rs1,pCc
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2s+>Po!@W$!)-S?bU$4R>;67sB;+>Y,q3$;[JC`k)X@rHL-
F=.M):-pQU1a"Rs1,pCcDJUFCDIIBn-OgDX67sB;+>Y,q3$;[JC`k*C@;TR.@rHL-F=.M)%13OO
:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1R:-pQ_@rH4'C/\tfCLo1R+ET1e+EV19
F<DuADf'H..3NM:D.Oi.@V0b(@psInDf.0:$;No?%15is/g+5/ASrW4BOr;/F*)G:DJ((?001OF
3ZoPRE,]AsEcW?GBl5%9@3A/b+EqaEA0<!C@rH4'C+19LBl%Sp$;No?+E(_$F`V&$FCcS'DL!?I
Ci<flC`mV(D.Rc@+AZHYF`V&$FCeu*DIIBnF!)T7AS5^p+<YlBFD)e=BOqV[:-pQUE,oN%Bm:aC
-r30!<Du7]7T_)^+CT.u+<Ve<DIak4GA2/4+<Y]5DId[&+<Y-%F(HI::-hTC5tk*G5n+/r67sC%
F_56"G\(q=+<Y04DKKo;Ci!Zn+<Y-=+<W(.6:OsR6UOUJ.4u_c+@p3ZBOu3,+<Yi9Cis<1+<YT7
%15is/g)Q<6:OsR6UOUJ.3N87DImisFCcS2Df03!EZee.A0>]"F)rI?Bkq9rGp%3I+Cf4rF(c\6
@;TRs/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU+<WBf+CT>4F_t]2+EV19F<G+.@ruF'
DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is
/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2
Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,e
EHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$
3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU
-OgCl$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$4R>;67sBjBOPpi@ru:&+EV%$Ch4`0AT2[$F(K62
@<?4%DBNk0+DN$CDfTB0/0JG2Chu-T+DPD,+=D>DEagC*$>O'k4ZZe.+C.&]?SNZO0edr_/h%no
+BplL2'G"<+?U)?%15is/g+\9Anc-o+EqaEA0?)1FD)e8@V0b(@psInDf-!kDdm=$F(8X#ASl!4
4ZX]A+?CW!%15is/g)Pq3[m3Q+E(_$F`V&$FCcS2De!3l+DtV)ATJ:f-Z!^2@;L!-FD,*)+D58-
+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk+<t]@
@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs4ZX]I
-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]CLoLd3F=-C$4R>;67sC%
FDl22+DG^9A8,OqBl@ltEd8*$ATAo8D/a<0@j#`5F<DrL@V0b(@psIjD.PCK%13OO:-pQUEb/Zi
+C\bhCER&'A0>DoAnc-o+EqOABHV5&Ap&0)@<?'k+DtV)ATJ:f0d'[C0HiJ20JO\S+?M<)@rH4'
C*4mB@V0b(@psIjD.PCK%13OO:-pQUCi<flC`mY*Ap&0)@<?'k+DtV)ATJ:fDf0!#ATL!q+?Lu6
0fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$3B9*,-OgCl$7I-;DIIBn
F"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&`DIIBnEt&Hc$?Km!Ecbl1D.PCa
3Zp4$3Zp*c$7BY.@ps1p+EV:*F<G4-F<Gd=Bl[`34Y@k&%16]cEaO!.De*c=+F,)?D_;J++<YK=
@ps1p%144#G@bK/A.8kg+DDr]/g)BTDe!3lEt&I!+Enqk/g+j;$>"*c/e&.:%13OO:-pQUCi<fl
C`m\5@;0U%DIIBnEt&ImDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2DJ`r=
?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*lEZfI@E,9H&+E2IF+=D5D
DfTr2DJ`r=-OgCl$;No?+ED%%A0>>i@r!2qDIal#AS,XoAISu$+BosB+Z_;20d'[C4#)(lDf'H.
+=D5DDfTr2DJ`r=-OgCl$;No?+Dbt+@;I'-BQ%p5+DtV)ATJ:fF)GE'ATL!q+?Lu60fq*=+F>4m
+>G!c+>GSnB5DKqF!)iOBQ%p5ASu?r0OI+36$$m]CLoLd3F=-C$4R=j,BIa2D.Rc;+?^hlCi3Zu
ATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+EMF/D.Rbt$4R=O$;No?+>%q>78m/.;cQ1P78m,S
<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2
AN;b2?Xn"kE,&<gDeio<0ht%f.V!C6E,&<gDeio<0d(Qi/KcHODf'H..3NeBCh[E&@<-"'D.RU,
+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpu
A8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp13
0JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et+>>E./i5'f$;No?+>G`g
F_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/DIakuA867.FCeu*AoD]48g$)G0Jj4G:-pQU
+<VdL+<VdL@;]TuDIn#7.!'6DCLo&+@<6-m/8Sa8B4WW8FE1r6F"CgAF`V4F+EV19FD5W*+ED%+
Bl.Dj$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)6->9G^EDe't<
-OgCl$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56FDi:3Df'H6ATMo%$;>AUB22lPATL.X
AQ!)JCi"Af@<,mXDcD"$AN`'s1E\_$0F\?u$=[pl+?_>"Eb/ZqCjBi8DJ*iqD.RcsDJjB<D.OhQ
/g,7LAU.^)ARTY*D/aT8D'1to+>=63De<R*ARf:mF(of/F*(i.A79LhF!*Uu+C]8-%13OOFD,*)
@<,pfF(A]r@:s:lB45k!Df^#/DId0rA79RgCht4W/g+VAD]gMPGmt)i$7AeA6qL0S;]nq;:K0bN
+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[d$_$7A>;:I7?@;]nM26VLKJ778Ld
3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr)Df02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B%17,c
+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AL@oo0d'[CF)>i<
FDuAE+EVjM%13OOF(fK4F?MZ-1E\_$0F\@a67sBu@;TRs+CT)&Eb/ZiGp%$CAKYJr@<*JB+Du+>
+Cf(nDJ*Nk%16N,/pRm5Gs*cg+=\Kh%17DE/n#kP+F,(Z+F+D'.1HUn$>"6#FDYu5Ddso/F`\`R
F(fK4F=.M)Eap4r+=D2>+EVjM-TsM#Df'H.+=D5DDfTqI%14g4>9J!(Dfp/@F`\aJG]XB%%13OO
DdmHm@rua&Aog*r+>Y-$+>=63Bjkjc?Z0CgARfgF/g,E^:-pQUA8`T.Dfd+3Df'H6ATMo8DdmHm
@ruc$$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4%13OOA8-'q@ru(&G^*RY/g,E^:-pQU
A8`T.Dfd+3Df'H6ATMo8Ci<flCh7Ys$7QDk%16Ze+EVI>Ci<f+E-67F-Z<I/ARfh&AS-!2%17,c
+Bos9Eap56G]Y;r3b*)FE,$LCDdmHm@rua&Aof=/$8EZ-+EMC<F`_SFF<G[MF:AQd$>40n@UX(n
AS-!H3\qm>+>=63B5DKq@;L!-.Ni/?AKWHFDJsV>.Ni5>D/aN,F)to'+=\LZ%14Nn$4R>REZfI@
E,9H&+E2IF+=Cf<Ddm-kEb/j(-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.+=Cf<Ddm-kEb/j(-OgD;
+Bot0D/XQ=E-67FFEhm:$4R=O$=m^XCgh?qA927!E+O)R3Zp7%3Zp*c$4R>;67sBkARfObEb/c(
F(9--ATJu&Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,og$;No?+D#e-Cis9"A0>K)Df$V=BOr;rDf'H6
ATMp,Df-\:Ec5H!F)qct%17#sATDg*A7[nbB5DKq@;L!J3ZrYi+AP6U-n6Z//g,(UATDg*A7Zlr
Ci<ckCi^$m%16Q_D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U+=J]g4ZX]pDf6b3Df6b?Df6'l%16]c
EaN]mD.Rc@+F,)?D_;J++<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBpD/a<*@qg$-AoD]B+Dbt+
@;L!-DJsV>@q]:gB4YT_$6UH6+=DAE+D58-+CfG7DI[?kA0>f5F<GL6+D#e3F*(u2@q@#14Y@jp
@;TRs+=\LO@;TRs%16ZaA1e;u%16ceD]gMPGmt*0%13OOATAo8D/a<0@j#`5F<DrAARfObEb/d&
@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7ARfObEb/d&@rH<tF!hD(0d'[CF)>i<FDuAE
+EVjM%13OOD/"6+A927!E+O)R3Zp4$3Zp*c$4R>;67sBsDe!3l+DGm>@<6L(B5V9k+Dbt+@;I&p
DIal&Ci<ckC^g_H67sC)BOu'(@;^?5D/"6+A0>r'DfB9/+CT;%+Co&*ARfgnA0>f.Cj?Hs:-pQU
GA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=Ddmc:+ED%4DfTr@%15is/g+S?A0>SsASuU(Anbgt
+Dkh;ARlp)@rH<tEt&Hc$>aWj@;J(Z+F+D'Ci<flCcsg%1*A%hCi<flC^g_#%13OOATAo8D/a<0
@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044+Cf>,E,$LCD/"6+A927!E+O)<%14g4
>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A+?CW!%13OO:-pQUBkAK0BOu3q+CT;%
+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=
Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0+DGm>FD,5.F(&ZlF*&OHBPD?s+EVNE
A8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5DIal1AT2R.FE8R7Df000F(Jl)A7]7e
@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/
AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ceD`o^^Df6aJ+F,(P:-pQU-n6Z/3ZqmM
D[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'
C*4m6Df000F(Jm'@rH<tF!hD(%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?9:ART[lFCfN8A8,Oq
Bl@ltEbT*+:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9/M/)TEb/[$ATJu*D/aTB+A,Et+EV19
F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+&7DBL?<ATMs6Dg?G9F*(r,@ruF'DIIR"ATK:CFCfN8
+E2@8DfQtBD]j(CDJj0+B.aW#:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F;An>F+1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80l:?E0f'qhDe*QoBk:ftFDi:BF`&=GBln#2
DIn#7-u!F7A18X8DKKH1Amo1\+Dbt+@;KKa$;No?+>GTgDg!lj+=M8IEc5l<.3N&0A7]9o/KeJ4
C3=T>ARlp*D]j(CDBNk8+C]82BHVM5DId[0+=84IBl8'<%15is/g)l-C3=DL0HbIKF*&O8Bk)7!
Df0!(Bk;?.@WGmpA7]9o/KenKEb-A%A7T7^%15is/g)l.D..]F0d(1JF*2M7+FZpY6rZTR<$5^c
Eb/a&DfU+GAU%p1FE7lu:-pQU0fX#YGr%,s@:Wmk.!0E?GUXbWATMr9A8,OqBl@ltEd8dF@;TQu
E,oN%Bm:'o%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>
+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>;67sC&ATMs)EZfLHBl%i5Ci<`m+DG_8
D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO:-pQU@rc-hFCcS:ASlC)Eaa!6
+EqaECM@[!+Dbt+@;KKa$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I
+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19
F<G^JBl%i"$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r
$?U6!GWe)1-Zip@FD>`)-OgCl$;No?+AQisANCrUBOr<88l%iS78m/.Ec5l<+Dl7BF<G%(+EM+9
+>"^YF(HId+Cf>-Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\
:.$.JBl7I"GB4mEATW-7Ebce<Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7
F'NHj@UX%`Ea3?tA9;C(F>5-P$4R=s+Bot*@;BFbBl[QhC2[Wi+?W7l6rZTR<)QLf<"00D$;No?
+CSeqF`VXIF)59+BHUo*EZf14DKU1WD.-o`$;+)^<(0_b;GU(f4ZX^-F)59+BJNq'C2[Wi+A,Et
<(0_b;GU(f%13OO:-pQU@rc-hFCcS+D/aTB+EV19F<G+.@ruF'DIIR"ATJtG+EM+9FD5W*+@K!m
<D>nW<(';F<"01067sC&D]g_VE,oN2ATDs*F!,R<AKZ)/D.Oi2FCB$*+C]A"DIb@/$=n$;3co=Q
GUt3r0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M
/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV
6qKaF-Ta")%13OOA8XOkFDti:/13,+-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\
F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$
DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SR;'%16Ze+Dtb7A0>E#4%`::
<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt
+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS
0Jb'c$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh
/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F
<$sa]+:SYe$=n$;3co=QGUt3r1a`_>ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F
.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo
+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,/-OgDoEZf72G@Vh,DECHd6rZTR
<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+
De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-SRG+
%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f
-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep
0H^f3%16W`4Z[\(Ap>jS0K1?g$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>Q
FCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHq
F(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3r3%#.BATAo2ATqZ-A8XJ$:IJ/N;cHXj
:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5
A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOkFDti:/13,3-OgDo
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4
:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd
$4R>QDEU%&E+X>G-S[;&%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-
E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4
+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0ek$b$>"6#DIn$&+Co@O8l%iS78m/`:JXq@
A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!
$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3co=QGUt3s1+*M<ATAo2
ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
A8XOkFDti:/13/.-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ij
C2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!
:IA,V78?fM8OHH)4"qcd$4R>QDEU%&E+X>G-S[G*%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-
$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze
+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4Z[\(Ap>jS0f:<f$>"6#DIn$&
+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b
;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$;No?
+E):2ATAo3Aftr!B5VF*F_#&+A8,OqBl@ltEbT*+%16W`4Z[\(Ap>jS0eb:/%16Ze+Dtb7A0>E#
4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf
<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%15is/g,7[
D]it=A7]e&+E(j7D..'pBlnK.AKYMt@ruF'DIIR"ATJ:fA8XOkFDti:/13/+0JFj`$>"6#DIn$&
+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b
;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FU$=m^a6=FqL@k]Sk:-pQ_A7]RD@<6-m0JG4(F=f'e@UX=l
@j#r'Ch[E&-tHn*.3N_DF*)IU%15is/g(T1:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f@3AH:
5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:.4u&::-pQB$;No?+A,Et+CehrCi^_@D]j+4
FEMOFFCfN8+D#G6Bl\-0D.RU,+>"^EF)uJ@ATJtd:IJ,W<Dl1Q+:SZQ67sBhA7TUr+DG_7FCB!%
ARlolDIak^:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.-u*[2A7]p;C2[W9F`_>6F"%P*:-pQB
$;No?+<VeFA0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZD/=89-YdR1FCfN8
ATB.-$;No?+<VeCDdd0!-YdR1FCfN8ATB.@+:SZQ67sB'+>G!ZFEAWQ@rc-hFCfQ*F*(r,@ruF'
DIIR"ATK4A+AP6U+CfG'@<?''FCfN8+Co1rFD5Z2@<-'nEt&IO67r]S:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3lfFtbWn@rH7.
ATDm(A0>u4+DNee0JXb&+ED%2@;TRd%15is/g)l'D..]E1E^gZA79RkA0>K&EZdt502-(tFa,$P
ATDj+Df-\9Afs]A6k'Ju67sB80l:?E1,'h!C2[X)ATMs)E[`,OAT;j,Eb-V/%15is/g)l'DJs\R
1E^1@@;]^hA0>u4+E_a:+EV13E,Tc*Ed8dDDe!3lAISuA67sB83,N)L1,L+rE+*j"A0>K&EZdss
3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>
Ci<fj5s[eG@<6-m3B9*,4ZX]55s[eG@<6-m3B9)I+BosuDe3rtF(HIV-UC$a@UX=l@lZP0-OgDm
DeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6J3Zoel
ATMs.De(OU-OgCl$>"6#De'u4A8,Oq%13OO:-pQUBl8!'Ec`F4+EqaEA0>;uA0>DoCh7^"+DGp,
$>EpcGAhM44ZX]A+?CW!%16N,/g)nl.j0*H$=P&,+>S0N$7QDk%16odF`VXf3Zodm-RL*"+?CoV
+FGdc?SR!PBeCSa-87\5>p*]2+Bp9D%13OOATAo8D/a<0@j#`5F<DrF@;U4,Eb$O?+<XEG/g+kG
FDi:4Bk)7!Df0!(Gmt*lEZen1C`k*>@;U4,Eb$O?+<XEG/g+kL+DGp?Bl5&8BOr;sBk)7!Df0!(
Gmt)i$>"6#A7]R"-Y["+GAhM4-QjNS:-pQUA7]RgFCcS=DfT@t$>sEq+EVI>Ci<f+B4Z0--Y["+
GAhM4-QjO,67sC)DfTA2BlbD-ASbq"ARlon@;]t$F<G4-F:AQd$;No?+DG_7ATDl80eb:(GAhM4
F!,17FDi:4Bk)7!Df0!(Gp$O5A0>DoCh7^"+EV:.D%-h#GAhM4H#R\?F$2Q,4<cL&-[0KLA9i-4
D^QYY+u(2_Che*6F<Dbg+=o,fBeCM_0JFpu4ZX]?0JFUo+?Uc(+Z_J'4==iOD0Ko=A1%fnATAo8
D/a<0@j#`5F<GdGEb'H7Df9\+$>"6#A7]R"GAhM4H#R\?Et&Hc$;No?+EqO9C`mV6F<G%(+CS_q
AKZ)5+D58-+CT/5+Co&"ATVKo+EqaEA9/1eDImi2FDYu5Ddso&ATT%C0ebg:GAhM4H#R\?F")H[
DfTB6E,TZ9%13OO:-pQUA7]RgFCcS'Cht57AS,LoASu!hF!+n/A0>AqARfKuFD,62+CT;%+D5V1
AISuXEZd(k+Co&"+EqaEA9i-4DfZ?pDImi2F`fi.+E_a:F!,[FEb'H7Df9\+$4R>;67sC$AS5Rl
ATD4$AKZ#)An?!oDI[7!%14g4>9GUBB5DKqF!a'nGAhM4H#R\?Et&Hc$;No?+B1d.<$5+>6UO:@
;asb\%13OO:-pQUEb00.ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63%16T`@s)g4ASuT4
-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m3B9*,%16WWF*)G@H$!V=FC])qFD5Z2@<-'n
F&#%S.V*+3FE2;FFCfN8A8,OqBl@ltEbT*++ET1e+Co&)FE2;FF!+(N6m-S_F*&O8Bk)7!Df0!(
Bk;?<%15is/e&._67sBhF)uJ@ATKmT-u*[2FCfN8ATB4BBlbD*+Dbt)A0>r'EbTK7%15is/g)8G
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emNRGqh)a$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$;No?+>GTgDg!lj+=M8IEc5l<.3N&0A7]9o/KeqLG9CpKDK?q=DBN"pDId[0F!+n/A0=Q[DKU15
$;No?+>GfiF`&rg+C\c#Bk&8qDf00$B-;;-F*&O5A7T7^%15is/g)l.D..]G0H_ccE+X>D+EV19
F<G+.@ruF'DIIR2+E2@4AncK4@:Wn[A.8kT$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+DGm>8l%iS
78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g,7I
F*&OIFD5Q4+Dbt)A0>T(FDi9MBkhQs.3NGF@ps1b%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!a
CghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2
BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g+\9Anc-o+EV19F<G^JBl%i"$?Tj#FCf?5Bl\-0
D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?U6!GWe)1-Zip@FD>`)-OgCl
$;No?+E_RBAS5^uFCfJ8@;^?5FCfN8C2[W*A8,OqBl@ltEbT*+%15:G/g*PR6W?uI3Zp7%De't<
-OgD;+BosV8OHHU4ZX]?+E2%)CEQ#:6W?tn$8EZ-+EM47GApu3F!*kB6W?uI3Zoht/g<"m6qKaF
;^ih6INU-n0-W+n-nIE$E+X>D+@Rn*5'nn+0d&kU6W?tn$8EZ-+>Y-\AS5O#4s36b6W?tn$4R>;
67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!Df0!(Bk;>p$;No?+AQisANCrUBOr<8
C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&$;+)^<(0_b;GU(f4ZX^#
E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<Df9_,$;No?+A,Et<(0_b
;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P$4R=s+Bot/D/sQ5F<F1O
6rZTR<)QLf<"00D$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?QBk1.ZDeio<0MXqe.V*7(;f-Gg
AM>e\F=f'e-tI%&.3N\KDeio,FCfN8/e&._67r]S:-pQU@<6L4D.RcL+:SZQ67r]S:-pQU+<WBf
+EMX5DId0rA0=JeE,ol/Bl%>i$;No?+<Vd^.3L$RDe*s$F*(u6.3NeFEaj)4@<Q'nCggdhAISuA
67sB'+>YGh;FNl>=&MUh73H\`F*&O8Bldd+Bl@ltEbT*+3XlEk67sB'+<VdL.!0$AFD>`)0JG%#
FCfN8C2[W:0e=GhATMs.De(RV/0K%GF*)/8A2,bl.3K',:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>>`bARdGT+Cf>-G%G]9
ARlp*D]idQ/hf%'8l%ha$;No?+>GTgDg!ip+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB82/78M
0KC7rAStpnARlo3A8,RQD/X3$0JFpuAo_g,+=Lc7A3s^GBk&hN0e"4S$;No?+<VdL+<VdL+EDUB
+DG^9C3=E0+Dbt+@;KKa$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ
@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#
AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO:-pQUFD,5.
A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'+DGJ+DfTE1+DGpFF!+n3B6A'&DKKqP
%16Ze+E(d5FC])qF:ARgEZen,A0<Q8$4R>;67sBuF_tT!EZf:4+Co1rFD5Z2@<-'nF!,C=+E1b2
BHV/7F*&OA@<?!m%14g44WkslI4cXQBk/>?%13OOATAo3A0<rp-Zip@FD>`)0JO\lATMs.De(RV
+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63%16Ze+E]h.+>=pKBk/>?%14s84Wksl0d(FL
@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#1E^UH+?MW+A8,Oq/12Q^ATMs.De(RV0II;:
ATAo94ZX]rBk/?8+>=631E\h',9S]`E+rft+E\,#%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%u
Eb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?<2
F)Y&pDeioaDJ<U!A7[GK:-pQ_A8-+(;f-GgAQ<V^@rGmh0JFVk/M/(nA8-+(.3N/8F)Yr(Gp%$;
+E_R9@rGmh/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f@3AH:5t"dP8Q8,$E-67F
A8,OqBl@ltEd8cUFCfN8C2[W:0I\,QG%#*$@:F%a%15is/g)8Z1+==oC2[X)ATMs)E[`,SATD7$
+CTG%Bl%3eCh4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp13
0K3TT@PBYK$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>>`bARdGM+>"]aFCfN8E+*g/.3NYBE,8rmATJtBF)>i<FDuAE
.1HVZ67sB80l:?E1,'h&+=M;EDg-//F)rcQEb03+@:Nki+=M>CF*)A0F)rc>$;No?+>Gim@<jX`
+>"^YE+EC!ARloqDfQsm+?1u-2[p*'$4R>;67s`V;Gp:g4['u:A8-+(.3N/>ATJu3Dfd+@Ec5o.
Ebp"DA8-+(CghT3F`(o'De*E%A79RgFEqh:Et&IO67sB;+@0se+>PW)2'=V03\rQQ1bfFH%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]
CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FC])qF?MZ--Zip@FD>`)0JFj`$4R>bA3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ*F`(o'
De*E,+>#VsA79RgFEqh:+E_3;+AP6U+Cno&@<?d6AKY])+EMX5DId0rA0=JeE,ol/Bl%>i$4R=s
+BosE+E(d5-RT?1%16Ze+E(d5FC])qF<D]$67sBQ:IH=IATMr9A8,OqBl@ltEd8c:$4R>REZfI@
E,9H&+E2IF+=D;B-QjO,67sC%FDl22+DG^9FCfN8+Co1rFD5Z2@<-W&$4R>REaa$#+=D;B-QjNS
+<VdL+<Vd9$4R>REZfI@E,9H&+D58-+=D;B-OgCl$7Bt6Bk)'lALATP3ZqsAFCB9:E+L/7A0<!i
67sBtF`VXID..NrBFP:X$7L$X+=D8EBlbD2F!,UCBk)'lALAoL/NP"sA0=W6/g,"RF*&OA@<?!m
%13OO:-pQU.!''?GApu3F"&5BAS,XoARlotDBL?BDe*s$F*(u6.3K',0d'[CF(fK9E+*g/+Co2-
E$-NNA1&KB+<XEG/g,"RF*&O8Ble60@<iu>Bln$,F`\a;EcQ)=%13OO%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$$m]CLoLd3F<4&%15is/h0=^=?Shj@rHC.ARfgnA0>T(+DbJ.ATAo:ATDj+Df0V=De:+a+:SYe
$=n$j;f-GgAM>f567s`uDJW6gDeio<0HbHh/KcHPDJUaEF)>i2AKZ)+F*)IU%15is/e&._67sBJ
BOt[hF!)T6Cht4:FD,5.G%#3$A0<"'EbBN3ASuT4+Cei$ATJt:De:+7-tI43.4u_c:3CDbEc6)A
%15is/g)?UARTUqGp$U8EcP`$F<ViADK]H)Bk/>r@<6"$+CT;%+CT)-D]j.5F*(u(/e&._67r]S
:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?
+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbd[R$;No?+Cf(nDJ*O%
3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?
+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"
ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=
5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3A0>u)Bk)5o$4R>;67sBkASbq"AKYDt
C`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!
4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.@ruF'DIIR2
+DGm>Df-\>BOr<*@<?/l$8N_e+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/FEn<&0H`M$
,<d5)+F>4b+CoA++=ANG$8<Sc+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'MDJUFC-OgD:
+?^hl4s2R&HQY*eA8Z3+-RT?10H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0F<GXCD.Oi5
ATD7$%178r@;TRs4ZX]5@Wuj'0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp$=\4"A2-5.
+>"$0@Wuj'1-IZ@1E\_$-[6a`+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH0RInYE,9H&
+E2IF+?MW-DIIBnEt&Hc$;No?+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&NEb$jHDKg,3
0d(@XEb$pJDKg,31E^RZEb%!S%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu-tt:V1*AA%
4")g;5;=i@4"*'K+=/-p2'=Y"2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5Ddso/F`\`f
3c8hDD.Rbt$4R=O$7KG&C`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f-nlcSDJUFC
-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/+?L\o4$%P&
@;TRs.3L/a4$%7s@;TRs+<XEG/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q.3L3'+>G!#
+=K<4G&C`*ATK:C/0I#8DJim"ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-NDJUFC-Rg/i
3Zp."4!5q53d,CLD.Rc;+=nWs3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o%14L;+>G!L
DJUFC@Wui?.3L3'+>G!#+?MW-DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC
1aa^p/NP"/+?L]-3[\fhEb%!S+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4GC`k*90deCm
/NP"/+?L]-3[\B\Eb$mIDKg,30de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pKDJUFC-Ql/N
/g,.V@;KXiBk;<-ATDg0EcVZsDImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q%13OO-nlbu
+>=pKDJUFC-Rg/i3Zp."4!6UGDJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKDJsZ8
F"%P*-nlbu+>=pKDJUFCDKg,31aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3AS,Y$+=M,G
F`)7L%14L;+>P&n+CoA++=D2?1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2Bl7NsGT\DP
Dfor=.1HV40H`.o0HanDC`k*90deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4+EM[;AncK4
-uNsGDK@69$4R>[ATAnI+>b2p+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.$>sEq+>=op
+>Y-NDJUFCEb$O?+:SZqATAnI+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DARDf028%16ua
EZd%Y0H`+nA8Z3+-XgXrBl5:-$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL
+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo/NP"/+?L]-
3[\B\Eb$sR+AP6U+EqaEA0>i3AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo/NP"/+?L]-
3[\B\Eb$sR+<Ve%67sC)DfTA2Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm/NP"/+?L]-
3[\B\Eb$mP+<VdL:-pQUGAhM4+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>6UO:@;asb\
I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE
3B:GWDJW6gDeioY@:O=r<+U;rF&#%S.V*F5;f-GgAPHTCEc4ogG]\!L+ET1e+<Y0-ARfLs+<Yc>
@<<W#Cht52@:O=r+EV1>FE8R7@;[21@V#mA67sC%@<Q3m+CT.u+EM+*DBND6+=Lc<CagtD:-pQ?
:-pQU@<6L4D.RcL$;No?$;No?+<Vd].3MMW5t"dP8Q8,$E-67FA8,OqBl@ltEd8cUFCfN8C2[W:
0I[?(67sB'+>PAg-u*[2FCfN8ATB4BG%G]'F!+n7@;0Od@VfT_:-pQ?:-pQU@<H[*DfRl]+A-Qc
DBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(C9F(K;E0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>>`bARdGT+Cf>-G%G]9
ARlp*D]idQ/hf%'8l%h^:-pQU0emQaFttirF`:l"FCeu*AoD]48iJCsBl8'<$;No?+>Gim@<jX`
+E_X6@<?'k+D,P4+A*b9/hf3k$=e!aF`MM6DKI!K@UX=h-OL27+?^hq1a+n6.3L`#8l%iB9LV6F
:J5&/C2[Wi-OMRN/NP!u/gj7e6pjX:5uLKO?YO7nA7$\k@r,^bEZc_W$4:fbEHPu9AKW@8De*s$
F*(u6-OL3&ATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ;:-pQU/ULGc;cFl<<'aD]I4Yd5FDti:
4Y@j)FCfN8C2[W1$4:?b+E(d5FDti:/13,*-OL2U67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ
+EV19FE8uUF*22=ATKCFD.-ppDfZ7?+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>
F$2-<+tt-R/g*##,<R>$$49Np/g,4WDfTD3G%#E*Dfp+DD.-ppD]j.5G]Y'MH#R>9/g)93DffP5
8l%htA8c%#$;No?+BCd%8OPjD73G;j6W-]&<(0ng;_B188Q6g28PN#T=WgXB:JsV[+B1m#+B1d3
<!lAe/g*GY+@94178k=18Q85'5u&Og;c?IZ8O6<E6m,H3:dlKo:IIVo7Sco)76sjT+AtX-;Fs;X
5tim<:-pQU8TZ(hF!,UE+EVNEFD,5.8l%htF`V,704SF,Ch7W0FDi:F@;KXg@<?''FCf]=/db??
/g*GrC`mh2G]Y'MH#R>9+CT;%+D#V8ASuU(@;Kb*+D#P8Bm*p$ASuT4FDi:2H$!V=/d_qsEZd1]
E-67F@5'hs-Yd^4EbTK7-Ta(<4!uX5/g+mOF(96)E-*4EAU&;>/hSb($>"6#1a$a[F<G!H4YA*u
@<?(*-Ta(=4!uX5/g+t=FCf\>FCf]=+>,9!-OOF*+>b3[F`\a71-I6;BQS*--Ta(>4!uX5/g+hL
D/:>:AU&;>/hSb($>"6#1a$a[F<G!J4YA+,D/:R]1,M'?/hSb!G\q7>FCf]=+>,9!-OOF*+>b3[
F`\a71d*H=FCf]=-Ta(@4!uX5/g,+L@;0U%Derr,FCf]=+>,9!-OOF*+>b3[F`\a72*EQ>@X3',
-Ta(A4!uX5/g+SC@VKq)@<-W9Ch[s4+E(j7@X3',F!*(f/gh!;EZd1]E-67F@5^8$-Z*:4CLh@-
DC7M$2`iB0/hSb!D..I#A8c[0+EV1>F<E1g/gh!;EZd1]E-67F@5g>%+=D;RAiM/"1,q?C+>,9!
+E_d<3$;[UFCfM9/hSb($48194""ca@rc:&F=/L[/NP"2+>Fuo0d("EC`k*?F(96)E-*H7-o!e2
CghEsGUFp_/NP"2+>Fuo1*C+FC`k*A@<?(*-OM7V4""]`D/:RK+>#Vs1a"Lq1,C%`DJUFCBQS*-
-OM7V4"#8iCaUYS/NP"2+>Fuo1a$=HC`k*MD/:R,-o!e2FCf]=-Rg/i3Zp7%0d&5/+CoA++=D8B
G]Y;?-o!e2@X3',-Rg/i3Zp7%0d&50+CoA++=CWDFCcg,-o!e2D..I#A8c[0-Rg/i3Zp7%0d&51
+CoA++=D#7Ebf3(GA\c8-o!e2F`_4T-Rg/i3Zp7%0d&52+CoA++=D;RAiM.F$8EZ-A79RC/g+RV
/7C7a@59BB1Furk/7CCe@5]Yt@5eN#:-pQUA8`T4AU&<<+DkP/@q\(6A79R&/NP"<HTE9++D58-
+F>^b0d("8F:&@dEZd.\De't<-OO@"ARTU%-RT6.:-pQU/ULGc;cFl<<C9,B;c?.c9RSK"ATD@#
E+No00FD?0F(KG[@<6-m0JQ<h/h1CNF(KG[@<6-m0JO\l/M/)S@<6-m+=Lc>F(KGB+E1b0@;TRt
ATAo7ATTS8BOPdkAKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"5eATMr9
A8,OqBl@ltEd8cUFCfN8C2[W:0I\,UG\M5@F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130f!WbFtt`\$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jU_+Au!2<(9YW6q'ur
FCfN8F!+n%A7]9\$;No?+>Gio@rsF]+EV19F<GI>DIn'3@;^.#Df-\9AfsuI:K0eZ9LM<I+CSek
ARl5W%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC)DfTV9Bl5&'
Ch7$q+C\c#AKYo3+EVX4F(c\4De!3lAISuVCh7$q+=ANG$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-U
F(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
FC])qF?MZ--Zip@FD>`)0JFj`$4R>REZd+[De'u4A8,Oq+<VdL+<VdL+<XEG/g,(OASrVg76s=;
:/"e"$>sEq+CoG4ATT%B5uU-B8N8RT4#%j#:-pQU@ps7mDfd+3BOPdkAKYr#Ea`frFCfJ%$4R>;
67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(.6'ATAo3A0>u)Bk)6->9G^EDe't<-OgDoEZen3F(KG9
-W3B!6s!8X<(//D$>"6#A8lU$F<Dqs;aX,J3&N'F0b"J$EZen3F(KG9-W3B45tOg;7n"de0b"I!
$;No?+DkP&AKZ#)@:UL!DJXS@/KeP:@;]^h+EqO9C`m=uBl"4cATAo(E-#T4+=C&U5t"LD9N`_P
$>sEq+CoG4ATT%B5uU-B8N8RT4#%0O%15is/g,1GDfB9*+>"^HBk)7!Df0!(Gp$gB+AtWo6r-QO
=Ub^LEZf:2+EV..@rrht+>Y-YA0<6I%16uaEZen3F(KG9-UCZu8P(m!-Ta!k$4R>;67sBpDKBr@
AKZ)+F*&O;Ec6)>+D#e3F*)I4$>"6#A8lU$F<Dr/76s=C;FshV-OgD;+BosD+Co&"+=D8BF*)&8
Dfp"H%13OO:-pQUEb0*+G%De)DL!@HATMr9B6%p5E$/b5Df$V<ATMp,Df-\>@:F%a+:S["B6%p5
E%jF9+=D8BF*)&8Dfp"Z3B:hsDJLU/$;bkSCh[BdC0s+b+Ad2iCh[BdC0r).INU%$FD#W4F`9#`
+FZ?o0Hb]d0d';8@Vfag?YWpW$4R>;67sC'F(oN)+EqaEA9/l-DBNb6@:Wq[+DPh*+Cf4rF)qct
ATAn@@;9^kA8bp)+E2IF+Du"&@;9^kA8bpa+=ANG$>"6#B6%r6FD#W4F`9#rDJWZgC2[WnDdm&r
-RT?1%15is/g,1GCghF"G%De:Df9`=+C\npBl5&;Bln#2-[mEP$>"6#A8lU$F<Dr/:JXqZ:J=/F
;C=OR6:"";:JXq;%13OO:-pQU@<?U&D/aS>FDi:=@;BEsB6%p5E$0@=Cht5+@;0O#@V'%XF`V+:
De:,$@:UL$Df9_,$>sEq+Dkq9+EV7:Dfp"Q%13OO:-pQUEb0<'F<G[D+Eh10Bk/?,Df9_?@;]Tu
Eb0)rCLnV?+DG_7F`M%9FCB3&ATT&,DerrqEZeq<BleB;%14g4>9IckCLq$jEaN6iDe*2t4DJhD
FD)dEIS*C(<(0_b06CcHFC]?3ATT:/$>"6#A8lU$F<Dr/:JXqZ:J=/F;C=ORIS*C(<(0_b06CcH
FC]?3ATT:/$>"6#D/=89FD#W4F`9#D$4R>;67sC'DIn'3@;]UeA0>i"FD)e2F!+n%A7]9oFDi:C
@rc:&FE8R6Gp"MPCi_$7$?L'&F`_SFF<GWI,CUaX@Qcap0Hb]d0d%kq3co"TDfp"Q.3M&3+EK\,
+EM%5BlJ08-[$jH$7d_^@LWYR$;No?+Cf(r@r!30DIn'3@;]UeA0>i"FD)e9Eb/isGRY!6+F>4Y
IS*C(<(0_b06CcHFC]?3ATT:B74o]E-p/nL/g+UP4#&0,HQZ.-@Vfag?YWpW$4R>;67sBjCh7$m
+E_WGFCfN8+D5_5F`7cs:j$5`Bk(Lb?TgFm:j$5`Bk(Lb?Q^SB+=K?oB6%p5E%i^`IQAT*+F>:e
+Ad2iCh[BdC0qDW%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F??.;f-GgAM>f567sa!A5d>`CLo1R
+ET1e+EMC<CLnV2FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3KaT@:F%a%15is/g+_9
Bln',B.aW#:-pQB$;No?+=Lf3.3N_DF*)IGEb065Bl[c-D/XH++E_a:EZf(6FCfK9ASuU(Df-\>
BOPd$D..=-+E)@8ATAnc:IGX!:-pQUFCfN8F"SRX6$".kFD,5.+EV19FE8QIEcl7B+EV:.Gp"5N
E+*s.+<VeLF(KA7+EqO;A8c[5+<W(NEX`@N67sBoH#R>8Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI
@V$ZnG[YH'DIm?$@;]Tu@r-()ARmD&$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\
ATMs.De(OU.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F?C3=>J3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,C%qE+EC!ARlp*D]iP.EcP`4E,TW)
+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2
-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:
%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBpDKBB0F<DuMG%G]<EbTW,.3NhQEb'56De:,8
@<-(#F`S[IH#R>9%16Q_Derm$Gs+220F\A$Ci<a(D.Pjk+>Gl8+=/-p+>Y,q+>P&b+?)4g$;"o>
G%F$S@<,ddFCfJU3Zoe`Dg*=@F^o)-GAhD1+EqaHCh+Ys+EqaBA0>AqF^o20@q^!pCF9PuA8cU"
Ch7R%F`V\CB5_^!4ZX]93Zp[1.ln+H@;TspEb'*14ZX]4/e&/3DIIBnF$2Q,4$"`uDf9H$Dg<I;
Ci<a(D.Oh]BOQ'q6YKnK@:OCjEZen2F^f/uE,9Z<F`(i1De'u!D/a',A8cQ;%159QHZX+DCi<f+
E-67FGA^i+ATJ:f4tq>*0KhH>0H`)(+D58-+Eq^3D.Rbt$4R>;67sBlA8--.GAhM4+=M,9D.P8.
CghC+/9GHJF=A>S@:F%a%14g4>9J!#Dg-//F)rHO@q]F`CER2!Bln96+>Fuj+=A^%0RJ"]@;TRs
+Bot"A0<rgHZUqN$4R>;67sBpDKBB0F<G[:F*)IG@;]Tu@;]TuD.-ppDfZ?p4tq=<+E2IF+=D8B
F*(i,E+iZ60IJq0:-pQUBl7g,@rHL2+EV1>F=.M)4tq=<+E2IF+=D8BF*(i,E+iZ60df%1:-pQU
Bl7g,@rHL2+EV1>F=.M)4tq=<+E2IF+=D8BF*(i,E+iZ61+,.2:-pQUBl7g,@rHL2+EV1>F=.M)
4tq=?+E2IF+=D#7@rcKrCiF&r0JFk91,1j<0d%th0ddD;4tq=?+E2IF+=D#7@rcKrCiF&r0JOq:
1,1j<0d%th0ddD;%159QHZUu*3Zp."B4Z0-FDbN(ATL!q+FPjb0d("EC`k*IATMs%CiF&r0II;:
%15is/g+_9BlkJ>ATMrADIIBn/9GHJF=A>S@:F%a%14g4>9J!#Dg-//F)rHO@q]F`CER2!Bln96
+>P&k+=A^%0RInZ@;TRs+Bot"A0<rgHZUtO$4R>+0RIms4ZX]B+D58-+Dl")D.RcO3Zri'+>b3O
DJUFCD.-ppDddI$BONSB%13OO:-pQUARoLs+DkOsEc3'KDIIBn/7WU/ALqq7G]YAWFCAWpAISu$
+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd.\/KcDl4"u"uDIIBnF!+[0ARloF0me!t%13OO%16Ze
+>Y-YA0>u)Bk)5o$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GZATUjmEb0<50JH6g/h1LFFAm:%
ATMoH0HbHh/Ke\;F<G!7G%G]>+DbJ,B4W3'F_tT!EZf:4+EqaEA90@4$;No?%15is/g+SDF*2>2
F#ja;:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(RV0JFpuAU%p1FE9&D$;No?
+<Vd9$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPP*@rsF^
%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0eb:8-OgCl$>"6#De'u4A8,Oq+:SYe$;No?
+B3#gF!,R9F*&OFAT;j,Eb0;7@;[2r@WQ[4A8HN6BPD*m+EqaEA0>B#F`):R%14gD0JG17+?Ubk
A8Z3+-RU$@+EM47GApu3F!,"-A0?=D0F\?u$>"6#-UC$aEcki#BldrJ3B8H0B4Z0-I4cXQDJUFC
-OgCl$8F4g0JG1'4<PkdCgTIo6#q*W@VKms3B9*,+DEGN1^sd$$=e!cEaa$#+?V#;5s]O6@Ua%m
BK8(5-OgCl$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,
F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?Y=1n@WOkEF(o,<0JQ<h/h1LMDdmcS@<6-m
0JG4(F=f'e+C\c#Bk&86B5DKqF"&5RATMs7/e&._67r]S:-pQU<+U,mF!+m6AmoCiF`M%9Bl5&:
@;KXg+DtV)AKYQ/FE1f"FD5Z2+Co2-@rHO%Eb/c(GA(Q*%15is/g+tK@:X(iB-;86D.Oi.AfsEY
@N\!KEc,GuCO%:K+A*bdDe*E%Bl8$2+A+7/+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LP
ATA4e:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0emQaFttirF`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]F1E^gZ
A79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$4R>PDe!TlF)rIGD/a<0@p_Mf6"48D
Bk'.`3F=p1+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrF
C2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO
%15is/g+YEART[l+CQC9ATD6&GA2/4+Du*?B5DKq@;I'0@<-'j@VfTuEb/ioEb0,uATKI5$;No?
+CT)&+EV:.+CT>4BkM<pA0>buD.Rc2@<,p%G%#E*Dfp+D8g%V^DKBo.DKKqB%15is/g,%MDIjr3
BQ&$0A0><"E+NHu+CT=6DIIBnF!,[?ASrV=B5DKqF"&5GF!+n1E,96"A1e;uFCfN8@rH7+FCB'/
F$2Q,1E\_$0F\@t4Y@ja0krEP$=Z.N+C@'P2[p+(4Y@j41NG>^$=l:P+C?j72[p++4Y@ja0k)jr
%16Z0/g)o*GRY!l4Y@j6E&\:6.1HUn$;No?+EM47F_kS2@V$ZnD/aTB+D5M/@UX'qCh[s4+>"^V
AS,Lo+EVNEDIIBn+DG^9FCf<.+Dbt+@;KKa$8=Uf5'o=5B5DKqF!)iPATMs'Df0W<@;^1.?RICH
D/a<0@k9!7-OgCl$>"6dF(HIAFCfN8@rH7+FCB'/F!hD(%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`
3F<4&B5DKqF&QpoCLoeQF(o9)0JG1U67sa#Ci<d(;f-GgAO1BYBkM<;0JFUl+ET1e+<Ve@DIdI%
ARfg)+CT>4BkM=#ASuT4+E(j7+<Y<5Ddm-k%15is/g,:SEHQ2AARlp$@;TQuCh[s4+Du+?DK@E>
$;No?%15is/g*T'Ec5t@A8-*pDg#]4ARlooF`M26B-;><AKYo'+A,Et+E)-?0KC7O@rrhK0JPF-
0etdI1cdHJ%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?
De!lC3=Q<j67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB82f2uK0esk`Bl7?qCj@.8Bm:bBBPDN1DKTZ7@;]Rd%15is/g)l-
D..]E2'?=<A0>f6ATDg*A7Zm*@:p]2?90Mu3XlEk67sB83,N)L1,C%_BOPdkAKYo7ATDg*A7Zm*
@:p^)D]gGj3[m3Q+>"^WAS!!%Dfoq?9hAGU6r-iP;@NsB$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2
-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQl0b"Ib67sB4HW3F4<$5+=5uL[1/I`$r$;No?+Du*?D/"6+A0><%F(o9)
D.RU,Et&InBm=3"8T&'QEb/a&6$%*]B5UL\0KhHR+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW
$>+Eu@r$?Q/g)NfDfp//;g2Y_?RH9i-t[U>@jsQ%+Bos=+>=of+C,E`@6H4c3"64(4ZX]D2DuZe
$7QDk%15is/g,%M+Dkh;ARlolF)u&.DJ`s&FE8R5DIal1ARoq$A79@t+E1b0ASuU'ATMF(%16rd
G\(DWDIdI%ARfgJF)u&.DGP%&4ZYDB3Zp*c$7I;sATVU(A3k6KF_t]-FE8l[4Y@j2%16]iDI[I-
4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7I;N-t7=8Cage^.6T^7-Y%(=@W-N>
%14Nn$4R>;67sBtBm=3"+CT>4BkM=#ASuU2+=LiEDIY+<BlbD>F(Jl)@W-@%+Dbt+@;Kb*+CT.u
+D5M/@UX(hGmt*tBm=3"8T&'QEb/a&6$%*]B5U.YEc5tP4ZYDB3Zp*c$>+Eu@m)Fe-[K]RFC.sj
@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sC&BOu3q+CT;%+Dkh;ARlolF)u&.DJ`s&
FE8R6ARf.kF(HIBAp&!$.3NM:D.O.`:-pQUBlbD+DffY8Ci<flCi"A>@;]TuB5DKq@;Kb*+CT>4
BkM<pA0>u-BlbD2F!,C:%15is/g+kG+A*bcF`\aICi=93Gp%!5D.Oi4F(HJ&F!,('EZee3+A,Et
+DGm>@rH6pATD["A.8l_Bm=3"8T&'QEb/a&6$%*]B5U.YEc5tQ4ZYDB3Zp*c$7JV[FD,T'6#pU\
D.RU,F"'7)+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15mS
ATDg*A7\>MA8-'q@rt"XF(o9)0g.QS+?CW!%15is/g,(UATDg*A7Zm#Bm=3"+CT>4BkM=#ASuU2
+=K?5.6T^$$7JV[FD,T'6#pU\D.RU,F"'7)+>=63Ap&!$4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y
3ZqWL.j-Mg.Ni"+$7QDk%15is/g+eCDdmc1Ci=6-F!,(5EZfREEb$;9@;L'tF!,17+C\c#AKYf-
@ps1b+:SZQ67sBiGp$X/AmoguF<GC<DegJ0DBO%4F*&O@De!3lAKYT'EZfI;BlbD=ATMr&$4R>;
67sC$ATW'8DK?q1DfTl0@rri6ATN!1F:ARgEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9):MVXk
5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCG9*]5s]R/DeioE
3B:Fo%16Ze+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCGB0^5s]R/DeioE3B:Fo%16Ze+>GSn
B5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5UL\0jd446$$m]CLoLd3F=-C$4R>;67sBkATVKnF<GF7
G\(D.Bl7HqEb/a&+CT>4BkM=#ASuT4DIIBn+E_a:%16uaEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"X
F(o9)7<3EeE\Lid5s]R/DeioE3B:Fo%16uaEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9)7<3Ee
E\Uoe5s]R/DeioE3B:Fo%13OO:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE7luATAo+Ci<d(
+=Bs.ATDg*A7\>MA8-'q@rt"XF(o9)0jd446$$m]CLoLd3F=-C$>"6#0eje`Ci<d(+=Bs.ATDg*
A7\>MA8-'q@rt"XF(o9)0jd446$$m]CLoLd3F=-C$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8
ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GZ
Ci<d(;f-GgAOLHH0JH6g/h1LMDdmcdD/X3$6uQQh0HbHh/KcHSCi<d(.3N/>@s)X"DKI"5Ea`Tt
ASuT4FCfN8/g(T1:-pQB$;No?+B2onFCeu*D..NtEbSru+E(b"F`MOGBl5&.De(J>A7dG:8T&Tl
Eb-A-F<GdGEbf_K%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE
1,(FBD..]F1^sde67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'
%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\
6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>
$;No?+>%q>78m/.;cH%\<.->-$4R>ZBm=3"@<6L(B5VQtDKJ$&+>Y-$+>=63:-pQU8K_\TG%De)
+Dkh;ARlorCi<ckC`m/(A0>],@ps0r@<6L(B5VQtDKIKR<HE:kCi"AJ+EV:2F!,1<%15is/g,+O
DfQt<@;TQu@q]dp@q?clF`\aJBOu3q+CT;%+D5V2A0>o(@<6@)F!,(5EZfFG@qZunF)u&.DJ`s&
FE9&D$>s9hATL!e+?MV3G@_n*Eb-A+DeX*%+EVNE@V$ZpCi<ckCi^s5$7Ke#D.Rc;4ZX]J-Y$t$
DId="FD5W(+D5M/@UX(#%14Nn$4R>PDf000F(oN)4ZX]A+?CW!%15is/g+S=Ci=M?D/"6+A0><%
F(o9)D.RU,F!)kn3[m3Q%17/dDfB9(ATMoU/g*8(@qg!kF(9--Bl7QjBldX&DdRX)?[$F(AL@oo
.!&m:E+NisF)rcn3ZrKRDfB9(ATMo%$7QDk%15is/g,"FG\(D.@<6L(B5VQtDKI"CEbT0!ATDi7
ATDg0EX`@nATAo+Ci<d(+=D#?G\(DoF)u&.DJ`s&FC.="6$$m]CLoLd3F=-C$4R>;67sC!G%G]7
Bk1ctFCAf)@;KauGB4mDBm=3"+CT>4BkM=#ASuU2%16Ze+D5M/@WNY>@rH6sF`V87B4!qj6$$m]
CLoLd3F=-C$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y=Cu;f-GgAM>f567sa#Ec=roDeio<
0HbHh/KcHSEc<HM@rc-hFCcS+D/aTB+D5_5F`;CS%15is/e&._67sBhF)uJ@ATKmT%15is/e&._
67sB'+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?+<VdL1+=>D76s=C
;FshV+E2IF+Co1rFD5Z2@<-W9DfB9*/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e
:-pQU@rc-hFCeuD+>PW*3,N)L1,B@H:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>;
67sC!E+No0@;]TuBl8!7Eb-@k76s=C;FshV%16Ze+E(d5FC])qF<Fd11E^UH+<W$Z%16Ze+CoG4
ATT%B;FNl>=&MUh74/NO%15is/g+YEART[l+D#D/FEo!AEc6)>%16Ze+D5_6+?V#aEc6)>DKTc3
0II;:%15is/g+YEART[l+D#D/FEo!AEc6)>+>"^XBPDN1AoD^,+E(b"F`MOGA9Dp,DJ()&F_u(?
Eb0<6DfTE1+E(j7ASlC.Gp$a?Dfp#?%16Ze+D5_6+=CfBDfp#:F_kkK-T`\'%13OO:-pQUD09Z:
BlIm"+Du=<Ci^_@Des!*@<?'k%16Ze+D5_6+=CfBDfp#:F_kkL-T`\'4!uC,@6,r%BeD(K$4R=O
$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!c
Eaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y=CuCh[uX@<6-m0JQ<h/h1LSE,9616=FqL@k]V[F=f'e
@UX=l@j#l)F*&O:DfQt;@;0U%C2[X!Blmp,@<?''G%G]'+=LlCE,961.4u&::-pQB$;No?+Eh=:
@UX@mD)reJF)uJ@ATJtBC2[X!Blmp,@<?'0+<Y*1A0<:8De(:>BlbD5Ddd0fA.8l@67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*12gZE0KBRL:-pQU/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r
$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@9+=CoBA9;C(FCfJ8C2[X!Blmp,@<?'.%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+<W%GC2[W1%16T`Bl8!'Ec`EH-Xgb.A8Gt%ATD4$AL@oo%172gF*(u2G%ku8
DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%14g4>9G^EDe't<-OgDoEZf:2
+?MV3C2[WnATf22De'u5FD5Q4-OgDoEZfF7FD>`)Ch\!&Eaa'$+=CY[06CcBE$l)%%15is/g+e<
DImisFCcS2@<?(*+D,P4+CT)&+D5_5F`;CEDf-\:@<?0*/KeIE@rc^0@q]Fo%151D/g<"mF(fK9
E+*g/+D5_6Ch[u<4s58++D5_6-RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?N>A79+^;f-Gg
AOKsPF"f:C67sa&De*9hAQ*GaCLonBH#kYn+ET1e+=LuCA79+^.3N/0Gp$g=FCfK9@;I&r@;]t$
F<G%(+Dtb'@<?4,AM+E!:-pQB$;No?+CfG'@<?'k3Zq4.FDkW"EZd(p/0H]%0K0FJ:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=
:-pQU0K3NR@k]b_DJs_AF`V87B-8UEATMs.De(:+$;No?+>GTgDg!lq+E_X6@<?'k+D,P4+A+RG
9PJBeGRY!T67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[p*'$;No?.Rd65:Js>>+=LuCA79+^
.3NhCF!,L7FEMVABl7Q+?SN[8DfQt2@<iu0DKKH1G%#3./g(T1:-pQUA79Rk3Zp.8+AZKh+>PW)
2]se73]/iW0Jj4G%16T`@s)g4ASuT4-XpM*AL@oo%14d34Wl.0+Z_;++?V#D:IIQD76sgI94)CJ
De*3&%14g4/NP!u/gj7e6pjX:5uLKO?YO7nA7$\n$=dm`@<*J<-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$>"6#De't<FCfN8C2[W:0II;:%15is
/g+Y?ARTU%@;^?5.!fHFDdd9i.3NhQEb#Ud0d'[CA7]R"I4cXQDJUFCH=_,8@:s.!%13OO:-pQU
Bl8!'Ec`F4+EqaEA0>c.G9D!G+DkP&AKY]/+>=pK@<lo:Derqn$@69(Ddd9i4ZX]A+?CW!%16N,
/g,EK$=P&,+>GPZ$7QDk%16Ze+E2IF+=DJHEc5B!AL@oo%16NVAN`'sC2[WkB4W25H=_,8@:s.!
%13OO:-pQUAnc:,F<G"0A0>\sF*&ODF`\a?DKKH1G%#3.+EM47F_kS2@V$Z9%14d34Wl9u4")gF
4>AoQ+>bNo3]\BlB4VMZ%15is/h0=^=?ShjEc6)<A7]9oH$O[\D/Efo/nS]<A79RkF!,RC+DG_8
AS5RpF!+q'AoD^$+CehrCh[d"+=Lc/H!t>s.3N>B+=LuCA79+^.1HUn$;No?+>%q>78m/.;cQ1P
78m,S<D7fm%16ZeAT)O!DBLVB$>aWhA5d>`CLqU!F*'*267sa(Ddd0TD/X3$FCfN80H_K[/M/(f
Ci<`m+CQC6D..6s+Cf>+Ch7*uBl@l3De:,1@VTIaFE8QIBl8$2%15is/g)QaATMs.De(OU.4u&:
:-pQB$;No?+B3#gF!,R9F*&OG@rc:&F<G:=+<YcOE+rfjCi"A>Ecl7BBl8!+A7Zm%FD,6++EV19
F<GX7EbTK7F"Rn/:-pQU8TZ(rBQ&$0A0>c.F<D]7Cij6/+<Yc>AKW+9F`))2DJ().De!3lAKYYt
DI[6#BlkI?CggghF!,R<AISuA67sC'F*1o-+EV19F<GX9FEMOF@;]TuFCem$+CoD7DCuA*:-pQB
$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W&$;No?%15is
/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPFnF_<Bd%15is/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is
/g)l.D..]F1a$p[A79RkA0>K&EZdss3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'n
F!hD(%159QHZ*F;-Zip@FD>`)0JFjs>9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7F!,RM
E+O)"$:7Na9L2WR9e\^k+>=636;LBN5u^WS0g.Q?0b"IV:JXYX8Q/SO3ZpX>+>GQ(,;K]86;LBN
<'`iE76N[S5;"'9+>GYp,TniO$4R>6:/jMY:JEN+3Zp-d$;!ul<'`iE76N[S5;"'9+>Y8t0JEqC
%15Qu:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%a$4R>083p-I8Q/SO3ZoeA+CT+0GA(E,+A!\a
D'3;!@psM$AKXPeA8`T7BOQ!*8K_P^-OgCl$<()%<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF
@W-((+CT.u+EV:*F<G:=+D,>*AL@oo%15Et=Ar1!7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^
.4dS[=\Vj]64F82$;No?+EMXCEb-A0De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgDs
AhG2NDJWZG5s]R/DeioE3B:FhBeD4bA8a(0$6UHT0RG055s]R/DeioE3B8H0E-67FDJWZG5s]R/
DeioE3B:FhBeD4O$>"$pASGa/+<tc?+DEGb+CoCC%144#4tq>&F`\aDC`mFE1^se'Cia0%AhG3:
D_;J++<W?\+:SZhDIb@/$7QDk%15is/g+RFFCfN8%159QHSHX^F`\`RF)>i2AM@(pF*')`4!ua*
4WlI%:-pQUFCfN8+EM%5BlJ/A%13OO:-pQU@3B/nG9CO=Dfp#?%159QHY7A<+=CW:DesK3Deio<
-T`G43[[6i:J=&R:JEMc6;LBN5u^WS0d&eY:J=_R6;0fq%159QHY7A<+=Cl@FE;;;CLo1I4!6UG
-V7'45u^WS0H`q^<)c.M9LU<<$4R>;67sC%Df'&.D.-ppDfZ?p4tq=?+E2IF+=D5IDeio<9jqOP
D_NP#1,1j<BeCM`1FEV=4tq=?+E2IF+=D5IDeio<9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s
+C]J8+E(b"F`;UKF)YPtAM,)s+CT+0@3BB#@V'RgC`t/8$4R>;67sBsARTan+Co1rFD5Z2@<-W9
DfB9*%16oi@:W;RDeip+ATMrJ:-pQ_Ci<`m;f-GgATVL)F>4n[/M/(fCi<`m+CQC6D..6s+Cf>+
Ch7*uBl@l3De:+7DdmHm@ruc7+DG_8D[d%K67sB/FCfN8C2[W:0I\U`$;No?%15is/g+,,BlbC>
FCfN8+<Y`8EbTK7+<YK7CLnV:Ci<`m;f-GgATVL)F>,-d+DGm>+EVmJBk(RfCj@-GEcl7/$;No?
+DG_7Bk1ctDffZ(EZfI8F*&NIF(96)E--.R+A$YtF(fK7Ch+Z+Dfd*E@;L$sEZfI;AKW+9F`))2
DJ'Cc:-pQUCi<flCh4`&ASu!h+DGp?CggghF!,R<AKZ,:F^])/FCfN8+EM+9F`8I3DIal3ARTU%
A8c[0/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@lt
Ed8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<B^B.u4Q
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>Gim@<jUb+E_X6@<?''AoD]48g$)G0K1+qAS!nFEccCG-Y%1.@<?(&ATMs(
Bk)7!Df0!(Bk;?5%13OO4tq>%A0<7AATMs.De(OU-QlV91E^UH+=ANG$4R>;67sC)DfTB0+E(j7
G%#E*Dfp+DFEqh:Et&IcDf9GX<)64B4ZX]>%16Q_Deq^=:JEQ,3Zp-d$=[plCeRE!<'<8b5;"'5
0JF_,%16Q_DerB=6;0g23ZpX>+>k8r1E[qc1(=R"$>FC"5u^WS0KhH>0b"J(DKJiD6;0g23ZpX>
+>k8t,V^u,%13OOAo)BoFA,8)<'<8b2`E?L3?TUj5;"'70JF_,1CX[#$=daXE_K&'<'<8b-V5Fh
D'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h)$4R>`H#6MH69R@P1E\V8+=&(N3Zodm
G@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0%13OO@W-Ki<)lCW4ZX]64@2h>9MA#V<%0@H
4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;67sC%FDl22+Dbt+@;KKtGAhM4F!,1/+E2@4F(K62%14L>
+?CW!.46JP$>F*)+<tc??U6tDF)>i2AN;b2?Qa&81a$=I/e&.1+?hK+-UC$aF)>i2AN;b2-QmAN
F<GI;?U6tDF)>i2AN;b2?Qa&81^se'Cia0%AhG2NDJUG0/i4\]D_;J++<Wj%HZ4+L+Du!<BeD4O
$>"$pASGa/+CoCC%144#0H_JI$>"*c/e&.:%13OO:-pQUF)Po,+EV19FE7lu4tq=<+E2IF+=D5I
Deio=<+U,m0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.M)4tq=<+E2IF+=D5IDeio=<+U,m0df%1
1*A_&1*B=Y/g,7IF*&OG@rc:&F=.M)%15is/g+RFAn?0/B6%p5E,uHq4tq=rEc<-K@W-1$F)>i2
AMGPo+?MV3@W-1$5u^WS0HahCDeq^=:JEPd@W-1$<'`iE74/NO4tq=rEc<-KBl8$6D/X3$0df%*
4$"a'DKJ0D:JEMcBl8#l5se76-OgCl$;No?+CQC6F_Pr/%159QHSZdWEc<-KF*22=ATM^,CLo4J
4!6UG-Za-CCLo5"ATMrI+EMC<CLo5"ATMrJ-OgCl$;No?+EMI<AKYhu@rcL/%159QHScjaF`\`R
F)>i2AMHnf@rcKA-Ta(<4""_p+>P`#%159QHScjaF`\`RF)>i2AMHnf@rcKB-Ta(<4"!ci/g*_.
A8`T.DffZ,DJ()$F`\aE@q0Y#Gp%0I@:Nk$+A!\aD'370Ch[?iEa`c--OgCl$;No?+DbUtG%De,
Bk)7!Df0!(Gp%$EASu=&@:WnkD/`EjDeio<0MXqe.Vs$3A7Th"E)UUlCLo1R+ET1e+CoV3E$043
EbTK7+ED%0Ddd0jDJ()5D/X3$+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z
0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OU-Tc'^@<?0*
-[nZ`6rZTR<%i?)F*)/8A2#\b%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zp130f<lZF>,Q]$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUd+E_X6@<?'k+D,P4+A*b9/hf4,
F(JoD+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2
-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2
AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-Gg
ATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp
1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>+
0RI_K+=D8BF*)/8A2#\b+BosE+E(d5-RT?1%15is/g,7YEc*"<AnE0-Bl.F&FCB$*Et&I?0RI>L
F(KG9-W3B45tOg;7n"de0F\?u$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7/0K"V
Blmp-/0Je<@rcL/%14g4>9IinF!,")CaM=g0d(ls-8%J)Ddmc1A8Z31/j:C+,B%%44YAi@0Hb'^
+>kSm4=;Kc$4R>;67sBsDdd0!DdmHm@ruc7Bl8$2+EV19F<G+.@ruF'DIIR2%14g4>9G=B0HiJ3
0JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>+.20d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+
ATMrJ%13OO:-pQUA9Da.+CfP7Eb0-1+CT.u+ED%0Ddd/c$=ma33Zr9JCLnV9-QjN@$8EZ-+=JWl
+Z_;++?DP+?SOSj+F?.[Ado(V$;No?+EVaHDBNk8+EV=7ATMs%D/aP=@;]TuA9Da.061W?Ddd/c
$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$=ma33Zr9JCLnV9-QjN@$8EZ-+=JWl+Z_;++?DP+?SOSj
+F?.[Ado(V$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R=j0fU=;1asP0-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,Ci<`mFCfN80JG4lBk)7!Df0!(Gtp[Y.Vs$3
A9;C(F>,C'A8,OqBl@ltEd8dL/M/)]Ddd0!0mFg_ATMr9A8,OqBl@ltEd98H$;No?%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'D..]F0H_cXC2[W3+DG_8ATDBk@q?d!
De!3lAKYDlA7]9oFDi:2@<6!&@UX@l+:SZQ67sB'+<VdL+<VdTC2[X)ATMs)E[`,OAT;j,Eb-V0
A.8l@67sB80lCoQ1,9tpE+EC!ARloqDfQsm:IH<Z/ibO@.h)h\67sB80lCoQ1,C%$BQ%s6F(K;>
+ED%1Dg#]&/0H?_ATMrB+Co&"ATVKo+>"^WARuunASc:/%15is/g)l+C3=DL2BZUCFCSuuDJ((?
<+U,m6tp.QBl@ltEd:&qD/^pHAo_g,+=LuCA9;C(F=A>CBk)7!Df0!(Gmt*U67sB82emJQ1,'h_
ATVEqBl7Q+-q\Dg;f?f!@qAJFFD+'bD/^pHAo_g,+=LuCA9;C(F=A>CBk)7!Df0!(Gmt*U67sB8
3,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[p*'$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)
ATMs)E[M;'%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%
+=DV1:IJ/N;cG+R$4R>PDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR
+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQU8l%htF)Q2A@q?d,
DfTB0+>"^QATDEpF!,F1FD)e-Bk)7!Df0!(Bk;>p$;No?+AZKW@<6.$DII?tGp%-=D..3k+EV:2
F!,"9D/^V>D]j.B@:O'q@q]:gB4Z-,Bl5%c:IGX!:-pQU4tq>#@;BEs8oJ6=Dfp)1APcfWBLHu[
E'66)-u*^0FD)dEIS*C(<(0_b-RgSo05>E9E+*j%/no'A-OgCl$;No?+D,2,@q[!,ATMr9A8,Oq
Bl@ltEd8d;Df0Z.DKKqBF*)>@ARlolF!+m6%15is/g+\ID/^V=@rc:&FE8R=DBO%7AKWC9De*s$
F*&iRA7]pqCi=90ASuT4A8,OqBl@ltEd8*$4tq>%A0<rp-YdR1FCfN8+DPh*A7]p,C2[W*F`_>6
F!i)7+>Y-YA0<6I%14J'@j#i'@<<k[3Zp7%B4Z0--WFYuF@9hQFD5Z2@<-W]F_u(F%14M1/g<"m
F(A^$.6T^7HTE?*+EM(%F:AR)Eap55A79R-4ZX]B+D58-+=Bd"A5dDhEarZW@<?0NF_u(F%14M1
/g<"mF(A^$.6T^7HTE?*+EM(%F:AR@0RGSuDe't<C2[X)ATMr@%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&%13OOFC])qF?MZ--Zip@FD>`)0JOpa$4R>REZf:2+EV..@rr.e%15is/g+\9
Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W
+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUCi<`m+EV19F<G+:
D/^V=@rc:&F<D#"-n$bm3\`<B.3LZ4+>>i*+B2onF@9hQFD5Z2@<-W]F_u(,$=e!aF`MM6DKI"C
D/a<0@p_Mf6$.-UF(dQo3F<4&%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%1Dg#\7,%P7nA0N..
Bl%?'@rH4'Df0-(FE7luATAo4@:O(`+EV..@rr.e%15is/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@F
D..=-+EM77B5D-%Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfREEb'56GA2/4Dfp.EA7]glEbTK7Bl@m1
+:SZV4ZX]tF(K594s2O%0d&7pDJs*2E$-MU%16#s3Zq?D,CUa`4>83,IQATu/g<"m;[j(FEZd%Y
3$<0_F<DuY/g<"m;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$;^ii9/g`27+F?-n0d'C($4R>;67sBt
ATDEp+DG^98l%htF)Q2A@q?)V-n$bm3\W!*3]\B;3[l1DDe)dbF`Lu':gnHZ7!3?c%16T`@s)g4
ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!
+>"^MB5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is/g+SCAKYi(F)u&5B-:W#A0>_tDL!@5
D.73lDfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e;u0d'[C0Hb"EDdmc74s58++CoA+
+=ANG$4R>;67sBU:K0b*:.\/V3ZqsECh7^"+EV:.+EqaEA0<:BATMrB+DGp?@rH3qF!,17+EhI-
+=L3#F*'fa@ruF'DIIR27!3?c.1HVZ67sBhDIal+ART+j+EVNED..3k+D,%rCisc0F!,17+EV:.
+A>6l+>#/fFD,6+ALDOA@3A0<6m->TCLmq^:-pQU@Wc<+FD,*)+E(b"F`MOGGA(Q*+EqaEA9/l;
Bln#2FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9
A8,XfATD@"F<G+.@ruF'DIIR"ATJu4DBO%7AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2
@<-W9.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*
+Du+?DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_
+A!r(AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#
FCeu*Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k
$;No?+>G!C+Co&"+=D8BF*&c=$4R>;67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+EV..@rr.e
ATAo1@;BEs-RT?1%15is/g,4KDg*=6Dfor>Et&IfEZfF:Dg-//F)rI7Bk/?8+>=63%16ZeAT)O!
DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?YDdd0u
ATMrI0J[0Q@ruF'DIIR2:-pQ_Ci<`mFCfN80JG7mBk)7!Df0!(Gp%2\/KekJ@:UK8GT\aaFCfN8
+Co1rFD5Z2@<-WG$;No?$;No?+AcuqF_kK.ATJu9BOr<)Eb&a%+>J*`1*C[MF*&NIA8,OqBl@lt
Ed98[:gnBd+E(j7FD,5.+DbJ,B4VEF67sBmARTXo@VfTuFCfN8+Cei$AM+<b67rU?67sBhF)uJ@
ATKm>:-pQ?:-pQU+<WBf+D#G/F_>A1AU&<*DKI"3Bk)7!Df0!(Bk;?.FDi:2F_PZ&+>GQ(0In8i
DfTA2FCfN8+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$
ARmhE1,(F;DJs\R0a^ZB/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+$;No?+>GTgDg!ll+ED%1Dg#]&+CT/5+=M/EA85On.3N/8@ruF'
DIIR2$;No?+>G`gF`&rm+E_a:EZek1DJ!TqF`M&(+A,Et<(0_b+D,P.A7]cg:-pQU0fX#YGr%/t
F`:l"FCeu*AoD]48g$)G0K0=G@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=CoBA9;C(FCfJ?$49Np
/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r"[
@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eY
Eaa$&3B9)I$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6mi<KFC])q
F?MZ--Zip@FD>`)0JY!_$;No?+E)41DBNA0+Dl%<F<E:r+Co1rFD5Z2@<-'nEsb<,6W?uI3Zri'
+E(d5-RT74EZf:2+=Js&4>%jH8OHHU.=3[88OHHU$49Np/g+\ID/^V:@<?/iATAo1@;BEsAnc'm
4ZX]6C2dU'BHS[O8l%iS78m/5.3L/h05>WICG'=9F!h<+EZd.\De't<-OL2U67sBsDdd0!1*A;r
+Co1rFD5Z2@<-W#ATAo3A0>u)Bk)5l$;No?+Co&"ATVK+@;Ka&GAhM4F"AGHEc6)>F"AGUATMs7
/0K"VBlmp-/0Je<@rcL/$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3
+DEGN2(9b4-RT6.:-pQUCi<`m+CoV3E$043EbTK7$7I;V+Z_;++?DP+0KLX*4D&;DAI;pc@s)g4
ASuT4FDYu5De!-?5s]U5@<6*B3B:FR$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[
+s:K3Ch4`!Df'H3DIm^-EscK!+E1b!CLeQ0A8,Oq$49Np/g+e<DImisFCcS'Cht5(Ec6#?+ED%*
ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'4u:-pQU@<,p%D/"'4Bl7Q+@;]Tu
D..=-+CT+rBkM@,F!,@/D.Rc2@<,p%Bl.g0DfB9.Cj@.6ARfObEb/c6$8EZ-+>=pNCi<d(-9`Q#
/g+\BC`k)Q$49Np/g,+A@r#Tt@;]TuD..3k$>"6#E+*6lA0>u)Bk)5lATAo1@;BEs-RT6.:-pQU
F(fK9+Cf>4DKKq,ATAo(Bk/?8+>=-0ATD@#E+No00FA.sDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,$>aWhA9;C(F>,C)A8,OqBl@ltEd:DH/h1[U@:XIkF*')i1Lt30
FD5Z2@<-W9F=f'eCi<`m+>J*`1E^dNF*&O8Bk)7!Df0!(GqKG!67rU?67sBWDfBi8@<?(%+<Yc>
AKYo3A7]d(0mFfs+EV19F<D]:Bk)7!Df0!(GqL49@<-H4De:,6BOr<&@<-!l$;No?+D,1nF(o*"
AKZ)+F*&O7@<6!4$;No?$;No?+CT>4F*2>2F#jY'67rU?67sB8.3L$\ATMs.De(OV/9GHEFD>`)
0JY("@<,p%Ci<`mARl-C67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg
0JP;"Dg!lj$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O]:-pQU0f<]gDDF*mF`V,7+Cf>-Anbn#Eb/c(8l%iS78m/.AoDKrATA,Q
67sB83,N)L1GL"pE+EC!ARloqDfQsm+?1u-2[Tn%De!p1Eb0-1+=CW,F(H^+Eb065Bl[c--YdR1
FCfN8ATB.*$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"4/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dE
IS*C(<(0_b-OL2jDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$
Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/6
4"!Wr6mi<KFC])qF>?!?+=D8BF*)/8A2#bd$?Tfm@rsLi3ZoelATMs.De(OX-OL2U67sC!E+No0
FCfN8+>P'MBk)7!Df0!(Gp$^1FCSu,@;p1+Dg3C<@;KNuGAhM4EscK!+E(d5FC])qF>=27EZeFZ
;FFGH3ZqsNC`k)Q$<L#$6rQ60+FPkD:JsSZ$<L#$6rR#Q9KbF<:JsSZ4ZX]e:JsSZ+FAP[-n%21
5V5#G,?IZ=6rPO!,?IZ=6rOF"9M\VN3Zp=70Ha+W/g+tKF<GX=H=[EjEap4r+=D2>+@JXf;^X^h
+>=om0Hb">F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ$<L#$6rQ60+=KoZ<'2cX=&2^^;^ii;/g+4k
;FFFj0d'[C1E^UH-RT6.:-pQUDfB9*+CT.u+Cf5!@<*J=FCfN8C2[W=.10X,+E(d5FC])qF>F7Y
+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$$4:?b+>=om
0Hb=WF<Et?7T0XK+BosE+E(d5-RT6.ATAo3A0>u)Bk)6?$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__
ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[QT%;FFGH3ZohE:K0G/,?IZ=6rPNWI4cXD:JsSZ$8EZ-
+>Y-YA1&`3$>"6#De'u4A8,Oq1C@]6+>=om0Hb=WF<Et?7T0XK+BosE+E(d5-RT6.:-pQUAn?'o
BHU_+Ci=D<De:,7DKU#3A0<WMA8,Oq+EqaEA9/l%DIal1@;]UoD/=J?Eb0,sD.O&cEZf:2+EV..
@rsI5=&2^^;a!/a."*]jA8Z3+-RU>c/M8/I:JsSZ;aj@eEap4r+=D2>+@JXf;^X^h+>=om0Hb">
F<Du*:K0G/,?IZ=6rPNWHS-FB:JsSZ$:I<P;a!/a-n$blHQk0e6q'RD.3L/g/j:C?+u(3RAn3#4
,=Fsi;^jpcAN;1^-p1p!4"r+3+@JXf;[P6%>9G^EDe't<-OL2lEZf:2+EV..@rsL6ATAnI+>GPm
E-67F6q'RD$49Np/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%1Dg#\7,%P7nA0N..Bl%?'@rH4'Df0-(
FE7e#EZf=0@r#TtFC])qF>F72:-pQUB4YslEaa'$+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%
EbTE(+D#S6DfTnA@<3Q.@;^?5GAhM4EsbZ//g+SCAKYi(F)u&5B-:W#A0>_tDL!@5D.73lDfp+D
DIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e3D+BosB+D5M/@WNk[+FPjbA8Z3+-RT6.:-pQU
E+*6lA0>;uA0>_tCLmiaEZf=0@r#TtFC])qF>F88EZf4-CLnV9-OL2U67sC%BQ&);@rHL-FE7e#
EZen,A0?=D0FA.uEb00.ASrVE$4:9]@s)g4ASuT4-XpM*AL@gpDe3rtF(HIVFDYu5De!-?5s]U5
@<6*B3B:FRCi<`mFCfN80JG=oBk)7!Df0!(Gtp[Y.Vs$3A9;C(F>,C*A8,OqBl@ltEd8dL/M/)]
Ddd0!0mFft+EV19F<G+.@ruF'DIIR2/e&._67sAi$;No?+AcuqF_kK.ATJu9BOr<)Eb&a%+>J*`
1a$mOF*&O8Bk)7!Df0!(GqL49@<-H4De:,6BOqV[:-pQUCgh?sAKYSr@<6-lCh4`2ATMr9@psFi
/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=MASBl%iAFCfN8C2[W:0e"5REb-A0
Ddd0fA.8l@67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*0lCoQ
1,9:G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0f<]gDDF*mF`V,7+Cf>-Anbn#Eb/c(8l%iS78m/.AoDKrATA4e:-pQU
0fX#YGr%/tF`:l"FCeu*AoD]48g$)G0K0FJ%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1
FCfN8ATB.-$4R>;67sBpF!+(N6rZTR<$5[hDJ!TqF`M&(57IrO/g)Nj8l%iS78m/5+>#VsC2dU'
BHS[O8l%iS78m/5%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0
>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFg3ZoelATMs.De(OV-OgE)A8,Oq1d*lB-Zip@FD>`)0Jk-d
$4R>;67sBsDdd0!.!9WGCi_$JAo_g,+CoV3E"*.cEZf:2+=D;RBl%i<%16Ze+DkP&AKYT!Ch5aj
+=LuD@<?0*-[nZ`6rZTR<$s+G-SK4WDJLk=C3(a3$8EZ-+>Y-YA0<6I%13OO:-pQUDfB9*+=M>C
F*)/8A2G_X@;]Tu@r,^bEX`@eEZf:2+EV..@rsO:$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&
DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1-n$bm3\W!*3]\B;3[l16Anc'm%16T`@s)g4ASuT4
FDYu5De!-?5s]U5@<6*B3B:FU$8EZ-+>Y-YA0<6I%13OO:-pQUDfB9*+EV19F<E:\A8,OqBl@lt
Ed8d>ATVEq+CT5.Ec61FBOP^h+EqaEA9/1eATAo3A0>u)Bk)6>%16Ze+BM?:6rQ60+CoA++=ANG
$<L#$6rQ60+FPkD:JsSZ%1604;FFG^78,j*=&2^^;a!/a=&2^^;]pF9+=JX#/jM!L.3hni;FFG4
59j6*;FFFm$4R>9:K0J<+>to-+AP6U+Dbt<+EM7CAIStU$?BW!>9G;6@j"0.7T1Zt3Zp+!0ea__
ATT%C9M\VM/gFFn;FFG4+F>^`=&2^^;[j(8:JsSZ4ZX]69M\VM/gFFn;FFG4+FPjb=&2^^;[j'g
+BosE+E(d<-OgCl$>"6#De'u4A8,Oq1^se'EZd%Y0ea_hF`\`o77L2b$8EZ-+>Y-YA0<6I%13OO
ATAo3A0>u)Bk)6>%17,c+Bos9Eap4[77L3'4ZX]>+>GPmB4Z0--qmE94>%j[:JsSZ.3Nsi+BM?:
6rOO%=&2^^;a!/a-qmE94>%j[:JsSZ.3O$k+BM?:6rOO%0d'[C1E^UH-RT?1%16Ze+E(d5FC])q
F>OF6ATAnI+>GPmE-67F6q'RD%14g4>9G^EDe't<-OgCl$;No?+D,2,@qZun+Dbt<+E(j7F`)>C
ARlo<+Co1rF<GdGEb'56@;]TuEa`irDf'<9+ED%2@;TQb$>"6#De'u4A8,Oq0b"Ik:JsSZ4ZX]6
I4cXQDJUFC-Rg/i/g+4k;FFG^78+-tEap4r+=D2>+@JXf;^X^h+>=om0Hb">F<Du*:K0G/,?IZ=
6rPNWHS-FB:JsSZ%15Kl7T2H2+=JWl+F>:e+@JXf;^ih?-8%J)4<cL&BP(ct-mM,K7T1a#0kE?o
+=K?\3]f#EI3:pH7T0a'0d'[C1E^UH+=ANG$4R>REZf:2+EV..@rsO:$>"6#0H`)(+E2IF+@JXf
;[j'C$;No?+E1b!CER/%@ruF'DIIR2+EVNEEb0*+G%Dd?A7]1[+s:K3Ch4`!Df'H3DIm^-Et&If
EZf=0@r#TtFC])qF>OF6%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0
DJ()'EcQ)=F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C
@;TRs+CT;%+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is
/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#TtFC])qF>OF6ATAo1@;BEs-RT?1%15is/g,4KDg*=6
Dfor>Et&IfEZen,A0?=D0F\?u$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%16oi@:XIkF*')j0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P
@ruF'DIIR2+ET1e+Dbt)A0<T\GT^U4EcZ=FDfTB"EZf:4+DkP"DJ=38A7Zm*ATMr9A8,OqBl@lt
Ed98H$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.
De(OV.3N2HBleB;+CT.u+DGm>Ci<`mARmD&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
%15is/g+YEART[lA3(hf3B9*;Dg!fh%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R1*C^YA79RkA0>K&EZdtM
6m+093A*-=%15is/g)l.De!lD0HbLWA79RkA0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eY
Eaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2
G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6>4ZX]5FCfN8C2[W:0ddD;FC])qF>5Io4ZX]5
FCfN8C2[W;0JFj`$4R>;67sC!E+No0.!0!6@rsFS+CT.u+D5_'@N[B\0JFVnDfTB0+EqOABQ&$8
+Co%qBl7X&B+52ZEZf:2+EV..@rsF7$9ieh+F&-U4ZX]>+>GPmB4Z0--o!J20L$e1/nAj9-RU?i
I4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)FEDUf3Zp."B4Z0-I4cWs+CoA++=ANZ+<VdL+<VdL+<VdL
+<VdL:-pQUFCfN8Et&I?HS-FXD/DEs+>b3RATT&C/g)tnA8Z3+-RU#Z+<VdL+<VdL+<VdL+<Ve%
67sBt@:O=rEt&IhB4j@g+?V\-4!5b5B6%r</j:D+/g+eIE$m"U+<VdL:-pQUF(or3+E(j7.!0!6
@rsFS+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGRY"%FEBZ,+>G!XBk(p$FEDUI%16rhD*9p&0d(FL
@r!3(D/B^h%16Ze+>Y-YA0>u)Bk)6>%13OO:-pQUDfB9*+=M>BBk)6>0R,#h@;]TuA7]RgFCcS'
Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$>"6#De'u4A8,Oq0edh]$8EZ-
+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1ATAo(Bk/?8
+>=63%15is/g,+A@r!2tBk)7!Df0!(Gp%3I+ED%'Dg#]4+Eq78FCeu*F)YPtAISuXEZf=0@r#Tt
FC])qF>5Io%13OO:-pQUF*)>@AKZ28Eb'5#$>"6#0H`)(+E2IF+F&-U%13OO:-pQUF*)>@AKZ)+
F*)I4$>"6#0d(FXF<G[IF:AQd$;No?+EMXCEb-A1@:O=rEt&IfEZd1]E-67FD/F,!$4R>;67sC$
AT23hFCf!!Gp$U1@;]^h+EqaEA0>buD.Rc2@;]TuF*)>@AISueAStpnAN`'s0f'q5+=ARa/g<"m
Gpsjf/g_qn+=AO%/1)u5+?Ui&+<iih/1r%nGUag\Gpsjd+DEGN,C(XG$9ieh+EM47GApu3F!*.Z
0ea_hF`\`S0HbCIDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtd
+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=JufEb0,sD.Oi7
G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-o2udAStpnAKZ5BGUXa`4CL94
0I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S1a$gMDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)
5'nn)F(fK9E+*g/+>=om0Hb=WF<Dth+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6
@<6K40H`)(+E2IF+=K,jEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPm
E-67F-oW8hAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S3$<6Q
DIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)%15is/g,1GDIIBn+EV19F<G(3E+rm)+CT.u+EMXCEb,[e
5'nn)F(fK9E+*g/+>G!XF`\`S0HbCIDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/
+>G!XF`\`S0d(LJDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S1*CUK
DIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S1E^^LDIIBn+EV^I.3L$$
@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S1a$gMDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!
5'nn)F(fK9E+*g/+>G!XF`\`S2'?pNDIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/
+>G!XF`\`S2B[$ODIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S2^!-P
DIIBn+EV^I.3L$$@6-J(.=E=\FE@s!5'nn)F(fK9E+*g/+>G!XF`\`S3$<6QDIIBn+EV^I.3L$$
@6-J(.=E=\FE@s!%15is/g+kGF(KB6+EV19F<GdGEb$;'ATM@%BlJ0.Df0V*$<Ktg9gquD3ZqsN
C`k)Q%16035tsdH4ZX^6/g+4j5tsdH%16$):Jt.[:IA&D3[d3F-mMeg5tsdH.3gf+.3Kl_/j:C+
,?IW+9gqu0,<R>qATMrJ0Hb">DImj&@j#W"@;]dsB5D.#F!,R9F*&O8ATM@%BlJ0.Df0VD%16Ze
+>=ot+E2IF+BM<(9gqu'/1r&D85E,_6r-0K%13OO:-pQUB4YslEaa'$+CT;"BlnB(Ed8d?Ec6)>
F!,LAF_>B(Gp%3?DBO%8D.Rc2Cgh?sATAo8BOPcf$;No?+EV:.+D5_5F`;CEBl5&8BOr;7FCfN8
C2[W:0e"5UBk)7!Df0!(Gmt*nB4j@g+?hh/5;"'50H_hf0ea^p+D5>"%15fq=@Z7c;b:.]4ZX]1
=&)%U78jX&B4kj?3Zq-_=@Z7c;b:.]+?V8!B4kid$:duj9M&/^;a!/a-n%2%0Hb"@B.4rf-8%J)
4AA+D7oE/^8QnP3+F>Ff4s2sh:-hTC;[j((;G^%Y;cH[Y3Zoh5+tt-]EbTB.CgUUcDe*2t4<cL&
-Zip@F>5I^Ec<BK/0Zek+Dbe8F*&NK3ZoOr/g+j\+<tN3B.4rS-8%J)7oE/W8Q/Se%150>HS-Ks
+D5_6-9`PB;G^%Y;cH[)$4R>;67sBnASu("@<?''@<,gkFE1f1Gp%-9DId[&+EV19F<GXIBlmp-
+:SZ>+F>^b0d'[C1E^=NE$?tY0d%km4=>2mBlmo6.3L/g/j:C%3[QIC+?Ui%+DEGN0eb:1+=o,f
-o3P"59_d(0d'[C0eb:(,9S4Z/hnJZDJUFC-Rg0b+FPjb0d("EC`k)Q%13OO:-pQUB4YslEaa'$
+CT)&+CfG1F)rIEAS,LoASu!hF!*%WBkM=%EbTE(+D#S6DfTnA@<3Q.@;^?5GAhM4Et&IO67sBh
Eb-A1Ble?0DJ()#DIal,@;^?5@;TIfB5_p6+DtV)ATJu&Eb-A-D/aN6E+O'+Gp$X/@r,RoARmD&
$8EZ-+>=pNCi<d(-9`Q#/g+\BC`k)Q%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZen,
A0?=D0F\?u$;No?+Cf5+F(HJ9ATMrJ0Han?@ruF'DIIR2+CT.u+Cf5!@;[31E"*.cEb00.ASrVE
%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?T@@:XIkF*',j
0P"m-FD5Z2@<-Wg67sa(Ddd0uATMrI0ed-P@ruF'DIIR2+ET1e+Dbt)A0<T\0R+]qDIal.Eb&a%
+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+Eh=:@UX@mD)reJF)uJ@ATJtB
FCfN8C2[W;0JFpuCi<`mARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zq19G%GN"ATAnJ3B9)/$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et+>>E.
/i5'f$;No?+>Gio@rsFZ+E_X6@<?'k+D,P4+A*b9/hf3n$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]t
F_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B
3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0
D.RU,+=Cf?De(4W-V@0&-OgCl$?Tfm@rsFZGWe)1-Zip@FD>`)0eb:/%172fBk)6>0JI`73Zoel
ATMs.De(RV0JFj`$4R>;67sC!E+No0.!0!6@rsFZGUXbDDIal&ATT&'Ec6)<A0<T\0JG1'GAhM4
F!,[@FD,T8F<G+*Anc-sDJ'CcATAo3A0>u)Bk)6>0R+$65'nn)G^+Hr3Zp+!0ea__ATT%C0eb:9
0L$e1/nAj9-RU?iI4f&JCaUSQ+AP6U+EqaEA9/1e5'nn)B4kj?3Zr'UE$-MU+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+AP6U+D5_5F`;C2$@$f?4ZX]?+E2%)CERkHGT[G&B4kj?3Zri'+D5>"
%16Ze+>Y-YA0>u)Bk)6>0R+$6%15is/g,(OASrV=FC])qF>5I'GUXbDDIal#ASbq"AKYDtC`mq?
Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?pATAo3A0>u)Bk)6>0JI_\$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?15'nn)F(fK9E+*g/
+Co1s+FYFe%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BARfY%ATAo;@<6O%A0>r4@:NjX$>"6#
E+*6lA0>u)Bk)6>0JI_\$4R>;67sC%FDl22+EqaEA9/1e5'nn)F(fK9E+*g/+>=om0Hb=WF<GgQ
GRXuh$;No?+ED%4ART[lA8HN6@q]:gB4W30DfTA2DIIBnF!+n/A0>r8DfTCu$?B]q@;TR=3Zp.5
+?CVm.!mQj0d(`j+>#2m-RU#a-U940/j:C?+u(2a3Zot++=MIa+<u.\+=eRK/g)Ba-OgDHHS-F^
BQ&*6@<6K40H`)(+E2IF+=JodEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%15:G/g,4KDg-//F)rHX
+>GPmE-67F-nuibAStpnAKZ5BGUXa`4CL940I_DmG^+HB$9ieh+EM47GApu3F!*.Z0ea_hF`\`S
1*CUKDIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9E+*g/+>=om0Hb=WF<Dtf+ED%2@;TQu
G^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(+E2IF+=K&hEb0,sD.Oi7G^(Y[-p1p!
4"r+3+F&-U%15:G/g,4KDg-//F)rHX+>GPmE-67F-oE,fAStpnAKZ5BGUXa`4CL940I_DmG^+HB
$9ieh+EM47GApu3F!*.Z0ea_hF`\`S2B[$ODIIBn+F&-U.3L$$@6-J(.=E=`G^'Z)5'nn)F(fK9
E+*g/+>=om0Hb=WF<Dtj+ED%2@;TQuG^+H^+=K?\3]f#EI3<cZGRY!DHS-F^BQ&*6@<6K40H`)(
+E2IF+=K2lEb0,sD.Oi7G^(Y[-p1p!4"r+3+F&-U%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4
Et&I?HS-F^BQ&*6@<6K4A8,QsINU<R$4R>;67sBpDKBB0F<G[:F*&OKDfTA2A7]glEbTK7Bl@m1
+=LfGFE1r0AKZ,:AKYo'+E2IF+Cf>,D..<m+D>>,ALS&q5'nn9+?1K_F`\`SI4f&JC`k)Q.3L/o
+?V#nATMrJ0JFVdDfTD3D.R-nBl7R"ATMo8FCfN8+Co&)@rc:&FD5Z2F!,C5+CTG)Ea`Tl+DbV,
B67f7%13OO:-pQUF(fK9+Co1rFD5Z2@<-W9F*(i4Et&IfEZen,A0?=D0F\?u$;No?+Cf5+F(HIB
FC])qF>5I'GUXbGBk)7!Df0!(Gp$O5A0>AuARTI!F`7csATAnL+E(d5-RT?1%15is/g++^;cFl<
<C9,B;c?.c9FV=<$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eYEaa$&3B9*,%16r\CLpFdEb0<50JH6g/h1^HCLpFdEb0<50JFVk/M/)UF_u(?G%G]>+DbJ,
B4W2rBk)7!Df0!(GqKO5:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+EV19F<G+.@ruF'
DIIR2+=M>CF*)/8A2,bl0I\,UG\M5@F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130fX)]F>5T]$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-
+=CoBA9;C(FCfJ?%13OO%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5
-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W;0JG1.
%13OOATAo3A0>u)Bk)6-+AP6U+E)41DBMhG5t"LD9N_f3%15is/g+,,BlbD=ATMr9Eb065Bl[d+
+CT.1@:F;#Eb'!3+D>J%BHVM;Eb$;&Dfor>/e&._67sBPAfuA;FWb7=ATAo'Eb/[$AKYD(F*VhK
ASiQ6Bln#20eb:80JFVg@<-I2%15is/g,FXFWb@+G%De*BkM'iEZf=ADdmNoD0$hABOPd$F*)>@
@:s.(%14gD0JG17+?UbkA8Z3+-RU$@+EM47GApu3F!,"-A0?=D0F\?u$;No?+CfG'@<?(%+CQC5
Dfo]+Cj@-[0JI?Q+EM%5BlJ/'$>"6#D..3k+=ANG$4R=s+Bot!BlY>2E+*j%+=DV1:IJ/N;cGCt
/9GE:@rs7L04]3BE$l)%%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?W@CdMQOBk&hN:-pQ_D/O/V
@<6-m0JFVk/M/)TBOt[h+=M)ECagK9@<6-m+D,b6@ruF'DK@E>$;No?%15is/g)QZDJUaEBOPs)
FE_XG+E_a:+Cei$ATKIH8TZ(oEc6,8A7]g)@3BW*D/a<&+<YN4@;^-/FDi:C@ps6a$;No?+CT)&
+ED%+BleB-Eb/c(+Co1rFD5Z2@<-'nF!,(5EZfF;D/a<&+E2@4AncK@+Cf>-FCAm$F!)T6DIa1`
:-pQUF*2),Bm:b<@;TQuE+*j1ATD[0+<Y*1A0>T.+DkP&ATJu.F<D];@<6]:FDi:6Bl7H(A9Dj-
Bk(RnAISuA67sBu@;TRs+<YB9+<Y]9B5)F/ATD?m+Co1rFD5Z2@<-'nF"SRX8l%ht+DGm>+C]%n
F(Jl)+EVOG@<,n"%15is/g+tEDIm6s+<YfEBlS9,+DtV)ATJu&DIal#Bk)7!Df0!(Bk;?.+CT;%
+<YN>Eb-A*Ch7j*@VfTu+DGEs$;No?+CoV6Ch[BfFCfM9@<,p%CLqI,+EVNE@3BE$DJ<s1D(Z8)
:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+@0g[+EV19F<G+.@ruF'DIIR"ATJu-@<Q3)
@V'+g+CfG'@<?'k+CT.u+Dbt)A7]:(%15is/g)8Z+<Ve*AS!!+BOr<.ATMs7+=L`?ART[lFCfN8
A8,OqBl@ltEbT*+.3N&:A.8l@67sB'+<VdL-u<g1A5d>`CLqU!F*')e+Dbt)A5d>`CLqU!F*',f
+Dbt)A7Th"E)UUlCLo1R/.Dq]67sB'+<VdL+Dbt)A9;C(F>,C'A8,OqBl@ltEd92YCi<`mFCfN8
0JG7mBk)7!Df0!(Gq:(SDdd0uATMrI0Jd6R@ruF'DIIR2%15is/g)8Z+<VdLCi<`mFCfN80JG=o
Bk)7!Df0!(Gq:(SDdd0uATMrI0ed-P@ruF'DIIR2/0JbI@:XIkF*',j0P"m-FD5Z2@<-WB%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(FBDe!lD1^sde67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%13OO@rGjn@<6K4FDYu5
De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=
5uL[1/I`$r$;No?+ED%8F`MA@+EV%$Ch4`-AftMuC`mq?Eb$^DA8,OqBl@ltEd8dF@;TQuE+*I$
F!,17+CT)&%15is/g,1GB5)F/ATD?m+Co1rFD5Z2@<-'nF!*%WGA(Q*+EV19F<G+.@ruF'DIIR"
ATJu&Eb-A4Eb0<'DKH<p:-pQUFD,B0+EV%$Ch4`'F!,CEATAnJ0JG%30JEqC0eb:80JFV3+?hD2
+<r3s+Dl"4+=ANG$4R>;67sBpA7]Y#BlnV0$7ISND/O/4-RU>c/NP"kDJUFC-OgCl$;No?+EVO<
ATD4$AKYr#FED)7DK?qBBOQ!*@<,p%DJsV>8g&"[D.Rc2/KeqBARo@_+D,P4+EMI<AKYr#FED)7
DK?6o0d&.m/NP"!-9`PhDJUFC.OlocDfdWc05b38AL@oo%15is/g+S=C`m82E,95u@<?''DIIBn
F!,17+CT)&+Co1rFD5Z2@<-'nEt&Is@j"tu-ZW]>DIIBnF!j+3+>=pF0d(=NC`k)Q%13OO:-pQU
A9Dj-Bk(RnAKYl!D.Rc2GA1l0+ELt5Bldm3%16r\F)*p"+FZ?o0Hb]d0d(@BD.Rbt$7Kb"F))mC
+>=pb+u(3X@;TRs.3L3'+?L]p/g`27+DkP.CEP#f4"`6:+>=pb+u(3X@;TRs%13OO:-pQUE,oN%
Bm:a0$?0Eq4ZX]5Eb/^%@Uj=m-OgE'@j"tu-ZW]>DIIBnF!j+3+>=om+Dl"4+E1b2%14R;0-Dqk
HQk0e-nIDu@<<q@74o]H+>=pb+u(3X@;TRs%13OO:-pQU@rH7,@;0V#+:SZs@<=Xn+=D8BG]Y;B
$?BW!>9G;6@j#YtD.Rc94ZX]>+>P'VDJUG7@<;qc.P<@s.kWJ!0d%kq3cJML.3M&3+?go%+F>:e
+DtV)ATJ:f%15is/g,4XAnGb%%17&_F?MZ--Y7OA-OgE'@j"tu-ZW]>DIIBnF!j+3+>=oo+Dl"4
+E1b2%14R;0-DZ*E+*i;+?^hq/L,4CF=A>Z/g`27+>=pb+u(3X@;TRs%13OO%15is/g,=GEbTH7
F!+n%+D>\'+EV19FE8Q6$4R>;67sBkF`;/2@psIj+AG."912QW:*=C^@rcK1DIIBnF!,17+CT)&
+Co1rFD5Z2@<-'nEt&Is@j"tu-ZW]>DIIBnF!j+3+=K&h0e?$b;G0DR=&*+2C2[Wi.3NJFC`k)Q
%16r\F)*p"+FZ?o0Hb]d0d(@BD.Rbt$7Kb"F))mC+>=pb+u(3X@;TRs.3L3'+?L]p/g`27+DkP.
CEP#f4"`6:+>=pb+u(3X@;TRs%13OO:-pQUF*22=AKYl!D.Rc2@rH7,@;0UnDJ(($$?0Eq4ZXs3
D/X3$-OgE'@j"tu-ZW]>DIIBnF!j+3+>Y,q+Dl"4+E1b2%14R;0-Dbt0-W+n-nIDu@<<q@74o]H
+>=pb+u(3X@;TRs%13OO:-pQUFCfN8+DtV)ATJu*DIdI!B-;D4FD)*jE+*iO3Zoe(0II;:Eap4r
+=D2>+DtV)ATK4^3Zp."1E^OPC`m\*F:AR,/h\=q4E+_N.3Lbr-nQZ_@<<q@HS-Wt4s2O%HQk0e
DIIBnEt&Hc$;No?+D5_5F`8I@@;TRs+EMX5Ecc#5B-;D4FD)*jE+*iO3ZoeZF_PZ&-OgE'@j"tu
-ZW]>DIIBnF!j+3+>P&o+Dl"4+E1b2%14R;0-DqkHQk0e-nIDu@<<q@74o]H+>=pb+u(3X@;TRs
%13OO%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*
AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,D/O/gD/X3$6#pUZ0JH6g/h1^UCf>1hCLoeP
B6,a\+ET1e+=M)ECagKJBl.g*AKZ/)Ch[E&@<-"'D.RU,+Cf(r@r$-<%15is/e&._67sBJBOt[h
F!+n-C`mn0Ch[E&@<-"'D.RU,+E1b2FCfK1F!,(5EZccIDJUaS%15is/e&._67sBhF)uJ@ATKmA
$;No?%15is/g)8Z0e"4t/hRS?:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp130fWojDD3gT$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#
AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W
-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO:-pQU-uEj<
.3NbNCh[Zr+Dl%<F<F1O6m-\lEb'56A8c%#+Du+>+ED%5F_Pl-+E)41DBNJ(@ruF'DIIR"ATKI5
$;No?+AZld+E(j7FD,5.@UX=l@j#o8ATJu4AfrL=DJUaEBlbD=D]j+2@;[2rCht57AS5^uFCfK(
A0>Ds@ruF'DIIR"ATJ:f:-pQUAoD]4F(oK1Ch4`,@;TQuE+*j1ATD[0/e&-s$>"6#D/O/4-RU#Z
+<XEG/g,@PCht51BleA=@;Ka&GAhM4F!,17+CT)&+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+%13OO
:-pQUF(oK1Ch4`'DK]H)Bk/>pEbBN3ASuU2%16uaEZc`REc5i.-Qm8DC`k)Q%16uaEZf4:C`kSX
+<V+#DImi2D/O/44$"a,D]iM-G\(q=AS>a)%13OOATAnI+Dl"4+=ANZ+AP6U+CT)&+EqaEA9/kA
D/X<#A17rpATAnJ+Dl"4+=ANZ+AP6U+CT)&+EV19FE7luATAnK+Dl"4+=ANZ+AP6U+CT)&+D5_5
F`;C2$>"6#1E^OPC`k)Q+<XEG/g+S=C`meABlmp-%16Ze+>b3XDJUFC-QjO,67sBhCht52@:O=r
Et&Hc$>sEq+>k9YDJUFC-QjO,67sC!DJXS@DIIBn+Dbb5FE7lu%13OO:-pQU@;Ka&G%#3$A0>u<
D]ib9ASiP<GUXbDEbBN3ASuU2/e&//Eb0;T3Zoh%+F>5,6:s[6<),ef@;9^k?Q_EQ:dJ&V:fC_0
C2[Wi.3NJFCaLbu+?V#!%13OO:-pQU@;Ka&FD,6,AKZ&*@<,jkATJu8BQ&$0A0>r9@q0(]A0<HH
F)Po,FD5T'F!,[@FD)e7DffZ,DJ()(Dfor.%159a-nlup.3Ks$+EMR7Et&Hc$;No?+Eh10Bk/?.
BQ@Zq+DGq/D'16O.3NMHDId<j@<HC.+CT;'F_t]-FE8Q6$>ad*4ZX]:+F>54:JsSf@;9^k?Q_EQ
:dJ&V:fC_0C2[Wi+?L][/g)t[$?L6!F$2Q,Cia\@D/O/:/j:C?-RT?15!UMM-@70a-9`PnEb0;$
$4R>YF*'Q++=nX^+AG-h;GUY.C2[Wi+?L]B5u^WV;dWsJDe*2t4!76`6W-]Z=\qOo@;9^k?O[?`
Eb/`D/g+tOF<GF<CaLbu+?V#!%159a-nlup.3Ks$+EMR7@grbS$4R>;67sC%Df'&.@UX=l@j#`,
@<HX*@VfTuATDg0EcVZsDImi20d&1n0d(=NC`k*=AU,XG+<Ve%67sC&ATMs7/0JSGDfp#?/0K"V
Blmp-+CoC5DJsV>BOQ'q+Cf4rF)qctDImi21*A@q0Hb4MC`k*HD..I,ASrk)$>sEq+>Y,q+>P'V
DJUFCF`8];$4R>;67sBi@:UL!E-,f4DK?6oDImi20d'g[+>G!UDJUFCDJsW.G%GQ8Ec5i.-OgCl
$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDm
De3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GaATqZ`D/X3$6=FCjEbBN3ASuU20JH6g/h1aMG@XWh
DeioN@:VZEB6A'&DKKqR0HbHh/KebFG%#3$A0<:<ATqZ6+CT;'F_t]-F<G[:F*)IU%15is/e&._
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE9jr;i0f_6S+<V+#:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S
$;No?+>>`lDg!6G+E_X6@<?'k+EVNE8l%ht8g&:gEcYr5DBLhi0JY-f$;No?+>>`bARdDO+D,P4
D..Mq$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB83,N)L1GL"pE+EC!ARloq
DfQsm+?1u-2[p*'$;No?+B3#c+D,P.Ci=N3DJ()+DK'`?F!,O;Dfol,+ED%7F_l.BBl5&)EcQ)=
+Dk\2F(&]mF!)lKATqZ6/e&.tDe!p1Eb0-1+=CW,F(H^.$4R=r+?^hq1a+n6.3L`#8l%iB9LV6F
:J5&/C2[Wi-OgD;+>#Vs+tb68:IIQD76sgI94)CJDe*3&%16T]ARTU%-RT?1%17,eEHPu9AKW@8
De*s$F*(u6-OgDX67sBlG]75(FD5W*+Du+>BPD?s+C]J8+D#S6DfTn.$?Tj#FCf?5Bl\-0D.RU,
+=CW,A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQU-uNU?A18X0@q0(hFE8RCDJXS@
@VfOj+>#/f@W-L&A0>]&F*)IGDe:,%BOPpi@ru:&+Dbb5FE7lu:-pQUAoDL%Dg,o5B-:W'B6A'&
DKKqBF(fK7Ch+YtAKZ#)C1UmsARmD&$4R>;67sBuF_t]1Bk&8oFDl#;%16Ze+Dtb7A0<Q8$>"6#
DIn$&+>XH6ATAo2ATqZ-?S`,uATAo2ATqZ-1,COA%16Ze+Dtb7A0<jH1^se'EZf72G@VgN/iYjM
2J"X#%16Ze+Dtb7A0<UO0d%S]+<VdL:-pQUFD,5.DKTf*ATAo)+DG^98du,=EZf72G@VgQ@<+16
$>"6#DIn$&+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+Dtb7A0<T]1,:XA
1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU3&_9R%15is/g,4\D.7F"F"AGVDJ<U!
A7Zkm$>"6#DIn$&+EKRk+Du+>@;]LjAL@ooATAo2ATqZ-FZLWmDJsZ8Bk)'lAStpnATK4.$4R>;
67sBuF_t]1Bk&8oEcPT6F!)lO@;]UoD'3n5@;oe!+CT.u+EM7CATK:0$>"6#DIn$&+=KH&5;Xf6
1FXS'%16Ze+Dtb7A0<9b-pKO;,;Ubo1CX\&EZf72G@VgE5:A`Q.3gVt,[W>:$>"6#DIn$&+=KH&
5;Xf61FXS)1G1Tq$>"6#DIn$&+=KH&5;Xf61FXS/C,?A,ATAo2ATqZ--pK+E1asY*.3pW#3&roU
AMQ(O$>"6#DIn$&+=KH&5;Xf61FXS/3&ilW3&iiU2`EZS3B9)[3B9)[3B9)[3B9)[3B9)[3Htu?
ATAo2ATqZ--pK+E1asY*.3pW&1,:XA1c.'I2E!KQ3&ioYE]5s:3&`fU3&`fU3&`fU3&`fU3&`fU
3&_9R%15is/g+_BE-,f*Et&IfEZf72G@Vh1/hd_AATAo2ATqZ--RT?1ATAo2ATqZ-@6+i)ATAo2
ATqZ-1*^3g%16Ze+Dtb7A0<ZQ@6+i)ATAo2ATqZ-0I/D+3"64+EZf72G@VgM+>>&p%16Ze+Dtb7
A0<QK0I/"q-OgDoEZf72G@VgM+>kE,-YddFF<G[:F*),6B.",qATAo2ATqZ-2'=Rq1F+k$1a"df
$4R>;67sBiDfTB"EboH-AKYJkF(KD%$>"6#DIn$&+>>l)-QjNS+<VdL+<Ve%67sBtBm=3"+Cei$
ATJ:fATAo2ATqZ--RUu'-Ta!k$>"6#DIn$&+=ANu-p0U>@W-04.6An)%16Ze+Dtb7A0<Zi-RUu'
-OgDoEZf72G@VgD-T`\'+<VdL+<VdL+AP6U+CT)'Df^"C@rHC.ARfg)DKTc3+DtV)ALnsAF_kk:
Ci<flFD5Z2%16Ze+Dtb7A0<6I4!uC;-RU#Z+<VdL:-pQU@;Ke!F*&O7DfTl0@rri2F_kk:DIIBn
/0JbI@psInDf.*KA8bt#D.RU,@<?4%D@HqaEZf72G@VgD@W-044!uBu+<VdL+AP6U+Eh10Bk/?(
@;TR,+Du=<C`mP4@psInDf-!kATAo2ATqZ--RUu'@ldk>G[bT0-QjNS:-pQUDKTc3+DtV)ALnsI
@;KXg+Dbt+@<?4%D@HqaEZf72G@VgD-T`\'4""WYF`JUG@rHC!+CT.u+>,9!-Ql/N/g,%SCht53
@;TR,Ci<flFD5Z2+E)$<A8bt#D.RU,@<?4%D@HqaEZf72G@VgD+=B5u+=A9S+<VdL+AP6U+C].q
DJO;&$>"6#DIn$&+=A9S-T`[u-T`[u-OgCl$;No?+D#R9DIn$&+=D8BF*&cP+<VdL+AP6U+Du*?
Ci<flFD5Z2+>"^XBPDN1@psFi+DGm+$;No?+Du*?Ci=3(ATAo%DBNM2Ec5t@@3B)p@ruF'DIIR2
+DGm>DJs_A@rc-hFCeu*Bl5&%+Co%q@<HC.%15is/g+\=Eb/a&DfU+GCi<flFD5Z2+<W()@;^3r
Ed8c_0JG10%13OOATAo2ATqZ--XpLp+Cf(nEcW@.-OgDoEZf72G@VgD0IeFZ$4R>;67sBsBkq9r
Gp%3SE,Te,$>"6#DIn$&+=D8BF*&ck-X:tDFDl+G+<XEG/g+\FBm+&1Ch7^1ATAo6AT;j,Eb/bj
$>"6#DIn$&+=D8BF*&ck-YR(3ALATC+<XEG/g,+AFD)e6F`VXI@V$[&Df9`/A1Sj7/nZdZ+<Xp&
ATD>k$>"6#DIn$&+=D4X4"#(s+<VdL+<VdL+<XEG/g)8\+<h7%ATAo2ATqZ--Zip@F=0-t@le:7
Eb-U@+AP6U+<VjN+q4ljEZf72G@VgDFCfN8-T`\c3[Z$m+<VdL:-pQU+<hpP%16Ze+Dtb7A0<7A
ATMr@4""N!>ULX:+<Ve%67sB'Ec5l<ARlomF`\aDD]iS)Eb/a&DfU+GDIIBn%13OO:-pQUBl8*&
Ch[E&A9)C-AKYl!D.Rc2-r3baA7]^kDId<rF=@Y+ATAo2ATqZ--Zip@F=0-tCi=3(G&M2>D.Pb5
G^++EFBia">\S(\GA1qT2(&h?ATAo2ATqZ--Zip@F=0-t@lcYUG^+=K>]!neH!FitCi=34>UKsf
ATAo2ATqZ--Zip@F=0-t@pD'>G][k/FE1f-F)Z&=ARo%UDes?0>]X^iF(cp1$>"6#DIn$&+=D8B
F*&ck-X8]WG][k/FE1f-F)Z&=ARo%UDes?0>]X^iF(cp1$4R>;67sBPDK]H)Bk/>rBOPpi@ru:&
F!,17+DtV)ATJu&DIal/@<?1(/e&._67sBKBk)7!Df0!(Gp%!5D.Rc2@<,p%AoD^,ARloqEc5e;
-QlW%/UC],0J,:j><siE>pg'g:-pQU@;]TuE+*j%F!,17@r-9uAKZ).AKYDlA8-."Df0!"+Cf(n
Ea`I"ATDi7-r<3/84,pG;^ih3FD,B0%15is/g+kL+CQB:F(&Zl+s:rL@WQ+&+E(j7FD,5.@q]:k
@:OCjEcW@EF`;;<Ecbl'+C]U=D/XK;+D>\7FE9&D$4R>REZf72G@VgE-Z3iFCh[cu+D#G$F!iM+
;Cj27Ch7$rALAog-Y#2BH?s[OE$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L6W-TI/15CQARTXk
-Rh,)@ldk@H?=(E-OgDoEZf72G@VgE-Z3iFCh[cu+D#G$F!iM47P#p+Ch7$rALAog-Y#2BH?s[O
E$l)%ATAo2ATqZ--mrnN+Dbb0AKYQ%A90+L<'`i%-ZEm5@<6!-.6Ane3a?uWFDl+G%16Ze+Dtb7
A0<9JDJpY=CghBuATJu!+DG^9DIIBnF!iCu-Y#2BH?s[OE$l)%%16Ze+Dtb7A0<7/@:WhcH#k>p
-Y#2BH?s[OE$m2(;Cj23ATMo?%16Ze+Dtb7A0<7/@:WhcH#k>p-Y#2BH?s[OE$m2(;G9P2-Z!@8
F!hD(ATAo2ATqZ--XpLp@W-O5-T`\c3a?uWFDl+G/6"o%/157FF)r]<$4R>;67sB4HW3F4<$5+>
6UO:@;asb\I4Ym8ATD@#E+No00F\A-A5d>`CLoePB1?<DCbRP<67sa+A5d>`CLoePB1?<DCbROc
F=f'e@UX=l@j!1<A18X8DK]H)Bk/>pEbBN3ASuT4FCfN8F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq4.FDkW"EZd(s3B7NU:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0emQaFtu$"
F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l.D..]G0d(UXA79RkA0>K&EZdss3%cmD%13OO:-pQU
<+ohcAoDL%Dg,o5B-:o+E-68D+EM47F_kS2Eb0<7Cige6DBNM2Ec5t@D.Rd0@:s.m+=M,=G@W-T
%13OO@rGk"EcP`/F<Dr?@<6!-%13OO0H`M$-o<).0I\,,-V@0&6VKp7;GTqmBkhQs?RH9i0d&&/
+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDmCh7$q+=ANG$4R>_AT;j,Eb-@@C2[X)ATMs)E[M;':-pQU
AU&0*@ruF&B-:epBl%p4ATJ:fFCfN8ASu[*Ec5i4ASuT4-XpLp-T`\J:IHQ>$;No?+>%q>78m/.
;cH%\<.->-$4R>;67sB/De(:>@:NeYE--.DDf0B:+Cf58@VfOj+>#/f@q]:k@:OCjEZf14F*&O5
DIal!Dg5i(+Dbb5FE8Q6$;No?+E(j7@q]:k@:OCjEZf14F*)IU+<X]nCh[E&A8,OqBl@ltEd8dF
@;TRs+Dl7BF<G".F)N14G\M5@+E)-,$;No?+EV:.+DkP.FCfJ8A8,OqBl@ltEd8dD@<6NC+<X*r
ATE'<BPD?s+D#A1AKZ&-Dfol,+C\n)Ecko(Cj?Hs:-pQUEb/us@ru9m/e&-s$;No?+Du==ATDKp
+CTA1D0$-nATAo3A0<Q8$>"6#De'tH%16Ze+E(d5?S`,uATAo3A0<W`/iO4HATAo3A0<jH1^se'
EZf:2+>GK.3B&j-1,KFIATAo3A0<UO0d%S]+<VdL:-pQUFD,5.DKTf*ATAo)+DG^98du,=EZf:2
+>dMI1^se'EZf:2+?2>?3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+E(d50ekF=
1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`fU%13OO:-pQUDKTf-EbT#+@<-Bs
H#k)VDJsD8DKTc3+ECn.A8c<-F(f!$ATJu&DIal2BmO?3.1HVqEZf:2+=KE75:A`Q.3gVt,VTZ7
ATAo3A0<9a3^5#W1asY*.3p\Y$>"6#De't=4utnV5;Xf61FXSV1CX\&EZf:2+=KE75:A`Q.3gVt
,Vh/.2[p+*EZf:2+=KE75:A`Q.3gVt,WKNq%16Ze+E(d5-pB[V-pKO;,;Ubo0ePFG2`>5&1^se'
EZf:2+=KE75:A`Q.3gVt,WIbC3&ilW2`EZS2`E`W3B9)[3B9)[3B9)[3B9)[3B9*E%16Ze+E(d5
-pB[V-pKO;,;Ubo0ekF=1G^jE2)R9M2`E]U3B;+=3&`fU3&`fU3&`fU3&`fU3&`fU3&`f+$4R>;
67sC%H#7#/Ci^_-DIal4DJ<U!A7ZllEb-A*DfT<$A7T7h%16Ze+E(d5F#lE2F)Q8CDf028%16Ze
+E(d5FZLWm@W-04%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63E+*6lA5dSj
ATMoH0MXqe.WAg+CLg@cEb0<50JFVk/M/)a@:O'qG%G]>+DbJ,B4W2rBk)7!Df0!(GqKO5:-pQB
$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2,bl0I\,U
G\M5@F"Rn/:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130fX)]
F>5T]$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO%16T`
@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-U
F(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?
+>%q>78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W;0JG1.%13OOATAo3A0>u)Bk)6-+AP6U
+E)41DBMhG5t"LD9N_f3%15is/g+,,BlbD=ATMr9Eb065Bl[d++CT.1@:F;#Eb'!3+D>J%BHVM;
Eb$;&Dfor>/e&.B0JG170H`J#,@k\.+=ANZ>9J!#Dg-//F)rI7Bk/?8+>=63%16Ze+E1b!CLeQ0
A8,Oq%13OO0d'[CF(fK9E+*g/+Co2,+DPk(FD)dEIS*C(<(0_b0./;mA8,Oq/13)[@:O(qE$l)%
%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`
ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F?`JFA?7]AQ3A\ATMs%D/aP_@<6-m0JH6g/h1g_FA?7]
AQ3A\ATMs%D/aP_@<6-m0JFVk/M/)S@<6-m+Eh10Bk/>7E-67O+DtV)AKZ)/D.Rd1@;Tt)+EV19
FE9&D$;No?%15is/g+SDF*2>2F#ja;:-pQU%15is/g)8Z0e"5R+DPk(FD)eG8l%iS78m/.A8-'q
@ruX0Gp$d/F!+q'ASrW3ATTO6$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU
@rc-hFCeuD+>PW*2/78M0JX(E:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCeu*AoD]48g$)G0K0FJ
%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC)AKYl%ARlol+Cf>-
Anbn#Eb/c(A8-'q@ruX0Gp!P'/M8.o>p(^[+DPk(FD**G-[nZ`6rZTR<$r+^%13OO@rGjn@<6K4
FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I
%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4
<$5+=5uL[1/I`$r$;No?+CfG'@<?''DIn#7FCfN8+Co1rFD5Z2@<-W9%16WfDIIBn4ZX]5FCfN8
C2[W:-S-Z#1-[KK.=37"A8,RlF_tJoC2[Wi-RT?1A9;d!FD*fu+=M>QCghBu11+I)De*2tC2dU'
BHS[O8l%iS78m/5.4f"ODIIBn+:SZA0RI\KG@Vh,FDbN(ANOFEE+*j%%13OO4tq>%A0>E)DIIBn
%13OO:-pQUF*)>@AKZ&4D.Oi6DfTB0+>"^YF(oN)+A+#&+F5/HDe!3lAKYE&+E(_(ARfg)F)Q2A
@q?)V4tq=2H7'hSF`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>=o\:-pQUDJsZ8Et&I?0RG0n-QmAN
F<Du;+F>_i+>GPm4>%a$.3NME?[?'%0d%T667sBhA9MO)@WMtc4tq=2H7'hSF`\`S>p+JHINU@!
+?V8!,:OaQCgVKq+>P&^:-pQU@rH7"F`(]2Bl@m1%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af
+Du"&H=%dN+<XEG/g,=KEaj)!$4R>;67sB\<'qd=@<?''@;]TuFD5T'+AQK^C`l#aD0'f>Df021
F*(u4E+NQ&Df-\>BOr<'Df9M&$>j^"DKBo2E'66)DJs`2A7&b[De*2t0f_-P+?(Du0d&4o2)ZR2
/hd_A%15is/g,4HF<GdGEb$;7Bl.F&FCB$*F!,RC+D,>4ARlp,@;L't%17,c+Bos9Eap50FE8fm
3Zp+!?SOA[B4Z0-I4cXQDJUFC-OgE#FE9T++=K?#,Wd`-DKKqK,].I<DKBo2E%)nX0e%MnDKKq/
$9g.j0Ha^W1a$a[F<GICEt&Hc$;No?+CoC5FD5T'F*(i-E-!.=@<?!m%14J'@j#Z2F!j+3+>=pF
0f1"cATT&C/g+\BC`k)Q%16rjDf0W<AT/bT+=oT/HZ!qH%13OO:-pQUF(KG9@rH7"F`(]2Bl@m1
+DbJ-FDuAE+EVNEAncL$A0?&(Cis:u$?BW!>9G;6@j#Z2F!j+3+>=pF0f1"cATT&C/g)hj0d&4o
A8Z3+-RT?1:-pQUFD5T'F!+t$DBND"+Eh10Bk/>uF`_bHAKYMlFCfM&$?'B^D..'qDIksl+Du+A
An57WC2[Wi+>PW*2]sgt1,'h)+>=ol/heCj%16upF$2Q,-p/n3HTNs/DKKqK+=oPr.!n!#4#))"
FE8lVDdm-l@:sLrALS`M0e%MnDKKq/$9g.j0Ha^W1a$a[F<GICEt&IO67sC&Bl.F&FCB$*F!,=B
F*&OA@<?!m%14LF0mde[F"&4`3Zoht3[?dAHZ!qH.3KiZ0d(=ODf0W<AT01]Ddm-l@:sLrAIStU
$;No?+ED%8@;0U%FD5T'F*(i-E-!.9DBNJ4D/aP*$9g.jA8lU$F<Dr/78uQE:-hB=-Ta$l$9g.j
A7dtc+DkP&AKW?J%159QHSZd_A0<6I%13OO:-pQUF(Jj"DIal-ATo8=ATMr9A8,OqBl@ltEd8*$
A9;]tD.PIc3ZoelATMs.De(OL/1<5.5;=oBHQkL]Bk2+(D-p^dDe*3&-OgDnFDtZ1BJM_3+=M>Q
CghBu11+I)De*2tC2dU'BHS[O8l%iS78m/5.4f"ODIIBn1*@#54tq>$ATqZ-A9;]tD.PIaA9;d!
FD*E=$9g.jDe'u$FDbN(AMO]%%15is/g+tK@:UKkF_u(?De:,(Bl\9:+Co1rFD5Z2@<-W&$7I;V
+Z_;++?DP+0KLX*HTG\L%14g4>9IEo@s)g4ASuT4-UC$a@UX=l@lZP0-OgCl$;No?+CT)&+EV=7
ATMs%D/aP=Ao_g,+C]82BHUi"@ruF'DIIR"ATJu2F`VXID..NrBFP;jF##m>+D58-@;Kb%F'i9K
94)$u:IK,1C*52>$9g.jDe'u$FDbN(AKY2"1E^UH+=ANG$?U>D4ZX]uATV?sCij`*?VO1#?V4*^
DdmH(0F\A2F"ndh3ZrNc1(=R"$;No?+Co&)FE2;F+EV19F<G+.@ruF'DIIR"ATJ:f4tq=>+ED%+
A0>E)DIIBn+BosE+E(d5-RT?14tq=>+ED%+A0>E)DIIBn1*@#50d'[CEc#i8Dfd+4FDtZ1BHR`k
0d'[CEc#i8Dfd+4FDtZ1BJL#(%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`3F?f<F*(qZ@<6-m0JQ<h
/h1mQF*(qZ@<6-m0JO\l/M/)S@<6-m+=M8AF*(qA+EV19FE9&D$;No?%15is/g+SDF*2>2F#ja;
:-pQB$;No?+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;%15is/g)8Z1+==o
8l%iS78m/7+D,P.A7]d(@rH6sBkMR/ARl5W:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zq@4E-,Z.@V'R&1,(C9%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R3?WH`A79RkA0>K&
EZdt502-(tFa+?&:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$
ATVL)FC])qFD5Z2@<-'nF!hD(:-pQU0fX#YGqq9#ARoLs+D,P4+EMgLFCf<1+EqOABHU;M6QgPj
CisT+Et&IO67sB83,N)L1GBq[A867.FCeu*FDi:3Eb/[$AKZ)+F*&O8Bk)7!Df0!(Bk;?.Bl5sS
C2dU'BHS[O8l%iS78m/5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tD@UX=l
@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<
De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>Q
Bk)6J3ZoelATMs.De(OU-OgE)E+X>X3ZoelATMs.De(4)$4R>;67sC!E+No0@3BZ'F*&O8Bk)7!
Df0!(Gp$O5A0>i"@r!3$F=n"0ATAo3A0>Ds@rr.eATAo4@:O(`+Co1rF:AQd$;No?+Du+A+DG_7
ATDl8F)Po,+Dtb6ATAo&AS,k$AKZ&*ASrW*F`(t;GAhM4%15is/g+kGFDi:DBOr<.ATMr9A8,Oq
Bl@ltEd98H$7Ke'GA^i+AN`'s-XeAR+<iihA8,RlF_tJoC2[Wi+>>5e4ZX]A+?CVm1*A%hGpa%.
ATAo8D/a<0@j#`5F<GI4GA^i+AISuXEaa$#+Dtb7DIIBn%16Ze+EVI>Ci<f+B4Z0-DIn$0@;TQb
$>"6dF(HJ3ATr$#D.O.`%15is/g,1GF*)>@AKZ).AKYr4AThd+F`S[7@:O(qE$-_TBlkJ.De3u4
DJsV>@rH7,@;0Tg$;No?+EV:.+Dtb7DIIBn%16Ze+ED%7FCZM)Bk)5o$>sEq+D58-+Dtb7DIIBn
%16Ze+>Y-YA0<6I%13OO:-pQU@q]F`CERY/F*)>@ATJu+Ec5e;@<<W.ARTY%+EVgG+Eh[>F_t]2
%15is/g,:XBl7Q+F`(o5F_)\+Bl[cpFDl2F+CT.u+Co1rFD5Z2@<-W9DIIBnEt&Hc$;No?+Eh[>
F_t\4BlbD9@<-H4De:,@8l%iS78m.p$;No?+Eh[>0g.Q?-Y#1b%13OO:-pQU<DGn(E+*j%F!+n3
AKYl/F<G".G@>c<+E2@4F(K62%15is/g,=UCbe.7+=CE!E,K**0J[6]10eL2D.QseDeO#D0JG1c
FCf<.-OgCl$;No?+APL&:`sk(ART?sAoD]4Ch[d0GT^F4A0?&6CisT++Cf>-Anble$>sF!A8,Oq
4ZX^-E+X>G+<iihA8,RlF_tJoC2[Wi+>=63ATAo2ATqZ-DIn$&Bk)6H-u*^0FD)dEIS*C(<(0_b
0./2"DIn$&Bk)5o$>sF!ATD<q@rsjp+EVR7GUss]3ZqsIA8ZO,?X[\fA7$H5%13OO:-pQU<DGn(
E+*j%Et&IO67sBlEZf72G@Vh6ATq^+DIIBn4*GOY1+XeXFCf<.>UM(?ATq^+DIIBn%13OO:-pQU
G&M2>D.OhE%16Ze+E(d5DIn$&Bk)5o$>"6#E+*6lA0>c$G@YDtF:ARgEZfI@E,9H&+E2IF+=D&<
GA^i+AL@ooATAo6ATMs(+Dtb7A8,Oq%16uaEZf"+F<GI4GA^i+AISuXEZd.\De't<-OgCl$;No?
+Eh[>F_t\41*BRl6Qg>VFD,_)$;No?+D#R9De'u.ATq^+A8,Oq%15is/g+_G+E1b!CLeQ*ATq^+
A8,Oq%15is/g+_G+EVI>Ci<f+E-67F-Z3L>DIIBn-OgDX67sBlEZfC6F*(q8DIn$'Eb&loF:ARP
67sBuATAo+ATT&4ATr$#D.O.`:-pQUATAnL+E(d5-RT?1%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6"48DBk'.`
3F?l>F*)JFF^e*4/h23s<.96<F=f'eFCfN8+=MSc<.96E+EMXI@P/)s:-pQB$;No?+B3#gF!,R9
F*&NW/hSb/+D,P4D..O.ARlp*AU&;+$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Ve%67sC%
ATT&0F`(t;Ci<flCh4`,@;TQuFDi:DATMr9FEqh:%15is/g)8Z-SIbO6$.-UF(dQo3A3Za6$$m]
CLoLd3@>qeF<DrKATr6-F*&c=$;No?%15is/g)8Z0e"5WBl\9:+EV19F<G"5F*2>=FD5Z2%15is
/g)8Z1+=>eARfXrA0>u*F*&O5F)uJ@E-,f4D@HqJ67sB'+<VdL+<VdL+>,9!/e&._67r]S:-pQU
@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+FAQ*IXMY4:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>;67sC&ATMr9Bl5&'Ch7$q+C\c#AKY]!
+EV:2F!,(2@:p]sF!,FBATMF#F<G"0A0>r)F<G[D+>F<4:-pQU0H`M$-o<).0I\,,-V@0&6VKp7
;GTqmBkhQs?RH9i:-pQU0d&&/+<iEc8l%iB9LV6F:J5&/C2[Wi-OgDX67sBjCh7$q+=ANG$4R>;
67sC&ATMr9Bl5&8ASlC)Eaa!6+DQ%:CERG3@ps1b+>"^RDfd+1Cht4d:IGX!:-pQUFCfN8F!+t$
DBND"+E1n4AoD^,ARlotDBN\:DJLA2De!3lATJu8Df'&.D09oA+EDUB+DG^9@UX=h%16T`@r,Rp
F!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo
3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>
78m/.;cH%\<.->-$4R>aA8,Oq4ZX]5FCfN8C2[W:0II;:%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&
3B9*,                                                                     ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,CU,1H6L4+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>Ghu
1,U1/0H`)/+>Ghu2)l^51*AD-+?:Q%1E\D,+>Ybq0f'q,3?U%:+>ktu0f:(00H`)(+>Pes0f'q/
2'=V4+>bbp0f1"10d&2-+>kkr0f:(01E\G-+>P_q1,0n,2'=Y/+>Pes1,0n,2'=Y/+>c)$1,0n.
3$9q2+>Pht0ea_*2]sh3+>Yhs1,C%.3?U%7+>Yer0f'q-2BXb3+>Z##0esk+3?U:(0fNQZCdMQO
Bk&hO@UX=l@j!1/DJUaE@UWb^F`8I@@;TQuCh[s4+EV19FE:o/Cf>1hCLo1R-t7(1.3N&>B6A'&
DKI"BD/X3$+EV19FE:r1D/a5gD/X3$0JIT[F*&NQ@rH4'C+19C@;TQuDdm=$F(8X#Bl@m!Df'H.
;f-GgAM>he@rH4'C+19K@;KXg+CT;'F_t]-F<GXADeio,FCfN8F(96%@<?(&ATMs(Bk)7!Df0!(
Bk;?qEb/[$ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"ATMBnCdMQOBk&hN0k+R4Bk&9/@;KXg
+=Lc3CagKKATMs7A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?rATMs6Dg?CH8l%htFCfN8+Co1rFD5Z2
@<-'nF(Auq;f-GgAM>edA8,R'+EMC<CLnW1ATMs(Ble5lD/X3$<GlM\De*E50IUIGF)WQNA8-+(
CghT3De:,7DJ<U!A7]:hCf>1hCLo1R-tI43.3N\KDeio,FCfN8F(B0);f-GgAPHTCEc4ogG]\":
BOt[hF!,R<@<<W#Cht52@:O=r+EV1>FE8R7@;[2sAKZ&&G%G2,@;]TuF(Jp#+C]U=-tI43.:dC=
ATU7IF(o,<0k+R4Bk&86A8lU$F=A>O@<,dnATVL(+EM+904S[(DJ*N'FCfN8F(Jl\D/X3$0JIQb
Deio,FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3N_@@VfTuARoLsBl7QrATUjmEb0<5
0JI-NF<G!7G%G]>+DbJ,B4W3'F_tT!EZf:4+EqaEA92C"DdmcS@<6-m0JG4j@<6-m+=Ll=Ddmc:
+EV19FE;)2DdmcdD/X3$6$%*]B5TCW0PPE8Bl[cpF<G"5F(o9)D.RU,+E(j7B5DKq@;I'/DK0f;
FCeu*DIIBn+Dbb5F<GI>F`)85Ci<d(;f-GgAOLHH0JFnfCi<d(.3N/>@s)X"DKI"5Ea`TtASuT4
FCfN8B6%riD/X3$0JFnfEc<HM@rc-hFCcS+D/aTB+D5_5F`;D7Ec>i/F@'DWBk&hO@UX=l@j#l)
F*&O:DfQt;@;0U%C2[X!Blmp,@<?''G%G]'+=LlCE,961.;Ed3@:s.MD/X3$6t(@^0JFniDe*9h
ALSa4@<iu0DKKH1G%#20@ps7mDfd+2AKYl%B45mrG%GK.@:W;RDeip+ATMrICi<`m+CQC6D..6s
+Cf>+Ch7*uBl@l3De:,1@VTIaFE8R=DKKe>.!0$AFD>`)0JFqlDdd0TD/X3$FCfN80l1c:A0>;'
F)>?%C`m5+Ci!ZmFD5Z2+E(j7DdmHm@ruc7Bl8$2+=M>CF*)/8A2#\dCi<`mA9Da.;f-GgAM>fK
F_u(?F(96)E-*4CASc9nA8,po+EMC<CLnW1ATMs7Ci<`mFCfN80JG4lBk)7!Df0!(H#.D-A0<UO
+EV19F<G+.@ruF'DIIR2Ci<`mFCfN80JG7mBk)7!Df0!(H#.D-A0<UO+>P']ATMr9A8,OqBl@lt
Ed;J>@:XIkF*')i1Lt30FD5Z2@<-X0Ddd0!0mFfs+EV19F<G+.@ruF'DIIR2Ci<`mFCfN80JG=o
Bk)7!Df0!(H#.D-A0<UO+>b3_ATMr9A8,OqBl@ltEd;J>@:XIkF*')j0P"m-FD5Z2@<-X0Ddd0!
0edhpAnc:,F<GLBA7]d(De:,/@:sIlFEM,*+EV19F<G+.@ruF'DIIR2Ci<`mFCfN80eb:lBk)7!
Df0!(H#.D-A0<T\0R+]qDIal.Eb&a%+E(j7D..'pBlnK.AKZ)+F*&O8Bk)7!Df0!(H#6u*AQ*\k
ATMoH0P#<CE$0=8Ed8dD@<-!l+Co1rFD5Z2@<-X1DJVXJF(o,<0Ond-@r!28D/O/=+C\c#Bk&8t
F`(]2Bl@m1D/O/gD/X3$6#pUZ0JFnlDJUaEF(oK1Ch4`4@;KXg+CT;'F_t]-F<G(,ARfLsDIn$&
;f-GgAO9g96#pU\D.RU,F"f:^DK]H)Bk/>7DIn$&.3N&>B6A'&DKI"CATMs7De)d`DeioMEb@jM
Bl#IW@UX=l@j!1<A18X8DK]H)Bk/>pEbBN3ASuT4FCfN8F)YPtCLg@cEb0<50JIHS@r!31ATE&=
Cgh?sAKYMt@ruF'DIIR2E-67t@;TRTBl.F&FCB$*F$a;VBk&hN@UX=l@j#r'Ch[E&-ua<N.3NM:
D.Oi3Bl.F&FCB$*F!,R9F*)JDATMs(6=FqL@k]WH@<6-m+=M8AF*(qA+EV19FE;P8F*)JFF^fH(
F*&NQH[\qCI46:[FEM$                                                       ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A>/1c7991,'h++>Pc/0JFV(1a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PZ+1*A;*+>P&o3A<<E+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>u#90d&2/+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bgp30f^@3+>l,9+>Get
1*A;-2*"9)6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
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
0FCEJ6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,
F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H
3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\
FCdKU0f:(GF_i0U0JPF-0KD0O2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=$0H_K+@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-
3\WBO1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt
+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?
+>GW41bh$H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2DlU"6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U
0JPF-0ek^C2``]L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=$3$9>3@<?'A+>PYo8p+qm1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4
C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17
+A-cm+>PW*2'=V23]&NO1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+?),"+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A
+>Po!8p+qm1,(F?+>G`72).-H1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N
3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[
ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
1E\u+B-8r`0f:(.0fh$L3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!Y
A0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+
F_;gP0JPF-0f;!G1cdKN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_
+>PW*2'=V33\iWT1c>[J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_
+>PW*2'=V-3]&iX0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_
+>PW*2'=V33]/]S0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_
+>PW*2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_
1,(F?+>>c91c[TO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`
0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.
2EEWN3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a
6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO
2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K
3Zp.6+AH9b+>PW*2BX_13]&cV0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U
1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp13+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:
@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=Wi
D.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O
1,(FA+>G]62)%'I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*
2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@
+>GPm+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O
1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.5+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk1
3\`HP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!
E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K
3Zp.4+AH9b+>PW*2]sh33\iBM1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b
+>PW*2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh3
3]&WR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=$+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\
FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp
9jr&b1,(FA+>P`61,V*K0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k
0fL411HI?K3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ4
1,V*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp.7+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t
6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU
0f1"I@<*JG0JPL/1,1gI1-.0H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b
+>PW*2]sk23\W<M0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/
1,1gH2**NI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX
0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
2BX,1@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[
ANCqg2BY_&Gp"jr0fL403'&lU3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCK
F`&<W0JPL/1,(aD1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB
+>Gi:1,(aH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=Wi
D.7's3Zp."+@KX[ANCqh2BYV#DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K
1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#
+@KX[ANCqh2BYV#DBL\g0fU:21HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh
2]t_$DBL\g0fU:11-.6O3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*
3$9n83]/cU0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P=%+<X'\FCdKU0f:(J@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*
+@KX[ANCqm+@0se+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm
+@0se+>PW*3$9q13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,
+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*
3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`
F_tT!E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K
1cdKM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@
+>Gbs+@KX[ANCqg3?UV,EZd+k0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh
0d'2!Gp"jr0fU:13BArS3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!Y
A0=WiD.7's3Zp.;+<X'\FCdKU1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+>P_q9jr;i1,(FB+>PZ41c%0H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS1*@]-@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A
+>P_q9jr;i1,(FB+>P]51,1gF0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A
+>Pht9jr;i1,(FB+>Gf90KD0L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS3$9>3@<?'A+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K
3Zp1:+AH9i+>PW*3$9q83\iNQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-
F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh2]th'Gp"jr0fU:13'&iS3\iGt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,g=M@<itN0JPO00f_9P
0fh-G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`F_tT!E]P<t1E[f.
@<?'A+>Po!9jr;i1,(FB+>>f:2)[KQ2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1-$IO@<itN0JPO00fV3K0KLsL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqi
0Ha(uGp"jr0fU:13'&cK3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp45+AH9i+>PW*3$9q83\iTS0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Y_p9jr;i
1,(FB+>Gl;0fD'H1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.8+<X'\FCdKU1*B23DBL\g0fU:10fh0P3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp1#8p,"o1,(FB+>GW4
0K;*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!YA0=WiD.7's
3Zp.:+<X'\FCdKU1*B23DBL\g0fU:11-.-H3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3Ar!3+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K3Zp16+A-co+>PW*3$9q13\iKP1,'%B
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+
@<?'A+>P_q8p,"o1,(FB+>GT31bq*L2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM
+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,^7IF`&<W0JPO00fV3O0KLpI$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8FtI;K+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A
+>Y\o8p,"o1,(FB+>GW40JbaD2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^H
ATfY;+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3ZpF*8p+qm1,(FB+>Gi:1c7<J3=6*#:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3ZpF*
8p+qm1,(FB+>Gi:2)%'F1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;
+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3ZpF*8p+qm1,(FB+>Gl;0ebXE2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY;+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3ZpF*8p+qm
1,(FB+>Gl;0f_9M0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATfY>+<X!n
Bl%<&:3CD_ATBgS1,g<u6t(1K3Zp1<+@1-_+>PW*3$9q73\rQQ1,B7E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9BcnNbF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqi+AZKh+>PW*
3$9q33\iKP1,B7E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&
+AR&r@V'R@+>Pr"+@KX[ANCqi+AZKh+>PW*3$9q33\iWT2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCql+AZKh+>PW*3$9q3
3\`TT1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p9CEO`dF_PZ&+AR&r
@V'R@+>Y_p+@KX[ANCql+AZKh+>PW*3$9q33\iHO1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+?1K>@rrhK0JPO00fV3M1HI6F
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Yer
+@KX[ANCqo+AZKh+>PW*3$9q93\iEN1G]@F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!1a!o/@<?'A+?:Q?@rrhK0JPO00f_9M2**HM$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8u?/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqg
1*BA&F<E=m0fU:12EEWR3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3Ar!3+Co&,
+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp.4+AZKh+>PW*3$9q73]&WR2)bjL$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P2BXRoA7]p,+@:3bCh+Y`F_tT!E]P=!2]s52@<?'A+>GVo:LeJh
1,(FB+>Gf92)mWR1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+>"^HATf1=6?R!Y
A0=WiD.7's3Zp4<+<X'\FCdKU0eskI@rrhK0JPO01,CsJ3BB#S$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8u?+@:3bCh+Y`F_tT!E]P=!3?TG4@<?'A+>GYp:LeJh1,(FB+>>c92)mWP
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpM+<X!nBl%<&:3CD_ATBgS1b^$p6t(1K
3Zp.6+AZKh+>PW*3$9q13\iWT2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P2BX,/
F_PZ&+AR&r@V'R@+>beq+@KX[ANCqg1a#S(F<E=m0fU:10fh0G3\W8q:L\BVEcu#)7<3EeEcWun
:-pQ_:L\BVEcu#)7<3EeEcW@E/M/)SF_;h5DeC2$DIal1ATMg/DKBB1/e&-s$4R>;67tA`-o!.n
@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8EbBN3ASuT4-u*[205<?u1ark@:-pQU1-$IO@<*JG
0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-
+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<
Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)+CT/5+Du=<C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"D
DfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$
A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_
+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"%15is/g)8q
+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:B
AS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=@ruF'DIIR2/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"
Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)/KeS<@ruF'DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>
+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1
F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)ATo8;Dfp/9DImlA%15is/g)o0+AH9b+>PW)2'=V1
3\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!>\[\fA8,OqBl@ltEbT*+>]++pD..-r>\[\fDImp,
@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;
67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?
+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!%15is/g*b^
6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"F`Iou:-pQU
AoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u
%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?De3u4DJsV>E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh
+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>
F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A
_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6
ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;%144#+D58-+=D;B-OgF#
R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4
Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpg
FD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB
:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1
%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/Y
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e
$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8+Cei$AKYMt
F)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9+D#S6DfRl]FD,6+AKY].+CQC/Df021F*(i.A8,po
+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9FD,*)%15is/g)9IARfObEb/c(F(9--ATJu&Eb-A2
Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4+:SYe$;No?4[(8N.3N5:GWHrV$4R=O$4R>;67tA`
-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMp
E+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5-ZsNFCi^sH
>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAOEb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG
@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=E--@JB6%p5
E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+E$-NG@;TR'
4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg+DtV)AM,)7$4R>;67tDb-oNLsAncKN+=LlDD..3k
E@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRlBleA=@V'.iEb,[e:-pQU
@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f%13OO:-pQq4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3
Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,Et&IO67sB9
3?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6C2[WkB4W25A92j$F=/1R:-pQU@s)m7+DtV)AIT"+
P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XL
P_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i
@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-
Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%*+<VfdP_(YE0K1[G0ek:;+<VdLifo$R3?TFe
+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(H
P_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQ
PdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$6UH6%13OO+>P&^
C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IF
ifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbX
JDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@
0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1bg*qifo$R3?TFe+<VdL
+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&-QjO,67sC!CER5-EZf14F*)I4$4R=u+DPh*@:s-o
I4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et+CoV3E$043EbTK7F!,('
Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)E--.1$;No?+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^R
Dfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh
1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8XDe(M9De*g-G%>`4E-![LAT089C3(a3$4R=b/hSb/
+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;
Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X
6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT
?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4
F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:
+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC+E_RAF`2A5A.8l@67sBp
DIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB7
3?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F!(o!
D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63-t[U>
@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%F(o9)D.RU,
Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfR37$4R>;67tDb-oi_!AncKN+Dkh;ARlot
DIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'
$;No?+D#G$/T55QDdmd!Ecu#)/S/sCDfTn.$=\-lCh.:!A7TCqFE2))F`_>9DDEqA67s`sF_PZ&
C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDC2[WlF_PZ&3B9*,4ZX]55s[eODe*="Bl%<?3B8H0
>9IEoATD4#AKX)_5s[eODe*="Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2
E+No0A8,OqBl@ltEbT*++CT.u+E)41DBMPI6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63
De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C%13OO:-pQUB4Z0-8l%ht@WcC$A0?#:Bl%L*
Bk;?.@;]TuG%G]8Bl@l3FE1f"CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1
%13OO-V@0&;cH%Q779^F+A,Et7nHZJ8Q$[':IJ,W<Dl1Q;cH%Q779^F+A,Et;cH%Q78QBA6qL9!
8l%iR<'a#C6r-0<8Q$[':II]E<('ML6qL9!8l%i@6psgG6qL9!8l%iR6W-KP<(';U+A,Et79EMf
6qL9(4ZX^,ATVC(Bl%<jBl\8;0F\?u$?^;u@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!
A7KOpE,oN2F(Jl)8l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)
8l%iS:JXY_<_Yt)@WcC$A86$nFDl)6F(9-*E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB
:IJ,K;Fs\a6qL8c$;+)^<_Yt)F`:l"FCf3*A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ
6qL8c$;+)^<_Yt)F`:l"FCf3*A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+E
ASbpdF(K*)A0=K?6rR&N7n#g;;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R
6UXLD%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1?O[>O
$4R>OF_PZ&C2[WsC3)-b:-pQ_@WcC$A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlouDe*Qs
F!,O6EbTK7F!)T>DBL':De*KpF:(c0/g+\=Eb/a&DfU+U$;No?$;No?+Eh=:@UX@mD)r#!67rU?
67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB+<XEG/g,(AFCAm$+A,Et$;No?+<Vd_+E(d5-RU#Z
+<VdL+<VdL+<VdL+<VdL:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>m:-pQU+<YT5+?MV3
C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)
E-)F^67rU?67sB'+>G!ZD'138F_PZ&C2[WsC3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/
F)to6+DG\3Ch[BnF<G9ND^c#g67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU:2_7dEcQ)=+Cf(r@r#dr
B.aNd67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch3rK67rU?67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EXGQ./g+YEART[lA3(hg0JP:sF`&lg$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU0emEcDD4!l@:Wn[A0>W*A8lR-
Anc'm/no'A+DPh*E+*d(F"V0AF!,49A9Ds)Eas$*Anbme@;@K0C3'_W67sB82.:HE0JXbkASl@/
ARlp0Anc'mF!*%WDfp/@F`\a:Bl[cpFCeu*FDi::De*KpF<G^DA7]d(@;KXhD@-_\De!p1Eb0-1
+=CW,F(H^+@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#
AKX)_5s[eYEaa$&3B9)I$=e!gDKBB0F<DrFC2[W1$49Np/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"
ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+$?'j$4ZX^6/g+\=A0<Q5De'tP3[\Z\A7T7p+DPh*
+E_d?Ci^sH>9G^EDe(4C$49Np/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`Hn
Bl7Q+DJsZ8Esd#+E,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%_!De+$&EcYr5DEU$'/3Yb78l%iU
9gf<q:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#Ed8!a:II]E<(]qS8P2oX5u^B<3ZoV!-UCEt-S.>q
De!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGg8l%iF8Q8;X6qL!L:dJ&O
4ZX^#E+*j%F(K;58l%iF8Q8;X6qL!L:dJ&O/151NA7oUu05>E9Bkh]B-OL2U67sBnASu("@<?''
@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--..C1D'gF)to64ZX]I3[\Z\A0>W*A92j2Eb-A.De*Bs
@N]E(A8PajAKY`+A9E!.C`mJ2A9;a.Ci^_6De*d(-OOU,A7fOlATL!q+=K?-+C?iP+DkP&AL9S`
C1D'gF)to6$49Np/g,1G@:UKjCghC++D,>(ATJu'@:O'[-u*7.@<6L$F!*"\/j:C?-Y-Y--Rh2>
+ED%%A0rom+F?-n0d(4LA7fOlATJ1c:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2EbTK7Esa:8
@j#i5@jaE#+>b3RATT%V3[\Z\A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@4t.!mQj
0d(OX@jsQ%+F?-n0d(OX@gWQ<67sC'E+EC!AKYMtEb/a&DfU+GAnc'mEsbB.9LVlC3Zohc@r,Rp
F(KD8/0K9l+u(3]EapO@/1)u5+?V#(Bkh]:$:[T\78l?1+=K?E:II]E<(]qS8P2oX5u^B(+=nil
4s3<d9LVke0Ka)gA7T+j+<VdL+<Y9?EbTW,+?M9(7S-9B;[P3@C2[X(FDl22A79R&Ap890FCcRV
0mcA]9LVke0Ka)gA7TUfA79R&+<Y9?EbTW,+?M?*7S-9B;[P3@C2[X"@;BFb@<<V7Ap890FCcRV
1ODS_9LVke0Ka)gA9E!.Ch-sr+<Y9?EbTW,+?ME,7S-9B;[P3@C2[X)Df9H5A79R&Ap890FCcRV
21%ea9LVke0Ka)gA8c?r@<<V7+<Y9?EbTW,+?MK.7S-9B;[P3@C2[X%Ec5Q(Ch4_3Ap890FCcRV
2g\"c9LVke0Ka)gA8kstD0$gB+<Y9?EbTW,+?MQ07S-9B;[P3@C2[X*F(KB%Df00$B4>:b+<Y9?
EbTW,+?MT17S-9B;[NkQD/XQ=E-67F-Y%(3D.RU,ARlouDe*QsF!,O6EbTK7F!,UEA79RkA1%_*
D/XQ=E-67F8l%iF8Q8;X6qL!L:dJ&O$49Np/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>mDe'u/
Df6b&+>Y-YA1&`3$=e!aF`MM6DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,&
F_PZ&C2[X*DJ=2J0ht%f.UmO7Ch.:!A9Dd(F<GWV/Kf7XBlmo/8l%htF`(o8+EV19FE8RHD]j+C
@:s:lB-:`!Eb/a&DfTQ'F"Rn/:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+<VeIAT;j,Eb-@@
B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL
+<Ve%67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22De'u5
FD5Q4-QjO,67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr:-pQB$;No?
+<Vd]+ED<A-Xq44Ch.:!A9Dd(F=/1R:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*
Bk(k!+DEKI.1HVZ67r]S:-pQU@<6L4D.RcL%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._
67sBYAT;j,Eb0;7F*(i.A79Lh+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130fX#YGqq,a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E2@4E+*cu+EV19
FE8R5A7T7^%15is/g)l.D..]G0Hb=WEbAr+FCfN8+CSekARl5W%16T`@s)g4ASuT4-XpM*AL@oo
@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eY
Eaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/
A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:
Bl%i<+BosE+E(d<-OgCl$;No?+CT)#ASrW*De+!.BlkJ.Bl[cpFDl2F%15^'6q9gJ8l%iT:.\D]
5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4/pfW'0d&k\5u^B^?W0p2?V4*^DdmGj
$;+)^7nHZP:IJ2X8Q8MP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iT:.\D]5u^B+-YdR1B5)H@C2[X*
DJ=2G-OgCl$?pN)FCfQ*F*)Id3Zp7%3Zp*c$>F*)+C\biEarHbC2[Wi+EV19FE9St+B)93<(1/&
C2[Wi+D5_6+F,)?D_</RD/XQ=E-67FFCfN8F!,L7FEMVA/g+_CA1e;u-ZjHUE+L/2@<?014Y@k%
%16f]/g)Ps4!uC)+>#VsFCfN8F!,"3/e&.1+EMC<F`_SFF<Dr+D]gDYFEDeIALo2OFCfN8F!*%W
F(f!!AK`E1$>"$pAM+E!+<W%P@j#l)F*)IN4Y@j3+D58-+FPkaATMs7%144#F)>i<FDuAE+=JEp
,BRL<FE8l^-QjcfFEDeIALo2OFCfN8F!hD(+<Y97EaNp"F*'#WFCfN8F!,"3/e&.1+<VeJD/XQ=
E-67FAnc'm4Y@jr@<?0*/0K%VH#R=;/0H;n-Qjr_-p',0FCfN8.3L/a-SB+JF!hD(+<VdL.!0Au
:K(484#))(ATMrB+Eqj?FCeffC2[Wi+D,>(AISth+D#G$/e&/!DIb@/$7QDk%15is/g+YBCi!Zm
F<G"0A0?):Blmo/G%#E*Dfp+DFCfN8+EM[>FCfM&$;No?+=JUYD/X3$-Tapr6q9gJ8l%iT:.\D]
5u^B(+Eqj?FCfQ*F*)IG-YddFFE_bDDJ(=+$7I9CD/X3$-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?
FCfQ*F*)IG-YdR1F)>i2ATVL)FE8f=$7I92@<6-m-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*
F*)IG-YdR1@UX=l@ru:'FE8f=$7I9<@<-!l-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG
-YdR1Cgh?sATVL)FE8f=$7I9CFE1r6F!j%A:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoB
A92j5ATMp7ATMs7-OgD2-Y%1>F(cp_8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFDe*?u
F`V5<ATMs7-OgD2-ZF*;E+*cu-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1E,oN/
@<,q$ATMs7-OgD2-ZF3KB4WGP8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFDe*g0EbAs*
ATMs7-OgD2-Y7OEASu$+4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>ATVL)FE8QPC2[WoG][M7F(oQ1
FCfN8F!hD(%17/nDfp/@F`\`R@;Ka&F`(o8+EV19FE8RKEbTW;ASrk)$4R>;67sC$ATMs3Eb-A3
E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>=-pFDl2FC2[W<2[p*'$>3pfATD3q05>E9+>"^GBOPdk
AKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<b/hen<3Ar!3+AZKh
Ddm9u+>G](+>PW*3"63($6Uf@?u9dt?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@
?tFFf+CSeqF`VY9A0>u4+E_a:+CJbkBlm]sBQINg+E_R4ATAo$8k;lg/e&-s$6Uf@+Cf(nDJ*Nk
+CK"u?n<F.C2[X$DI=T/D]j+DE,]`9F<G(,@;]^hF!,RC+CHo`+Z_Gf/e&-s$6Uf@?q!IN:JOha
9LW>3F(KG9Bl5&$E,ol/Bl%?5Bkh]s+>"^YF(Js+C`m>.EZfF7FED57B-;/6AS,LoEb/c(?ts1i
DKB`4AM.P=ARHWlA8-.(E\7e.%144-+CIf?:JP:K+CJ#K<(Ke[?n<F.;c-4r+DkOsEc3(=E-,f4
DBO%4G]Y'<De*F#+CSekARmD96#:?[8l%htD.-ppD[d$r+<VeKAU&;>BlbD<FDl22A0><%+C]V<
ATKIH<+ohc@rGmh+DGm>@3BAp@V'@.+A$Z&F!,UHAS-($+EVNE@;p1%Gmt*'+<VeKBOr<&@:Eea
F!+n4+CIf?6W-KP<+$hjAU&;>BlbD.G\(B-FCeu*GA(],AKYo5BOu3,FEqh:F!+n3AKYl/F=n"0
%14=),9SZm0J5@G2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144-+CSek
ARlok9hAGU6r-iP;ICVbDfoq?FDi:0DIIBn@psJ#?m%$DD/"6+A0><%F(o9)D.RU,+E)F7EcPl)
AKZ)'B.aW#%144-+D,>.F*&Ns:IH=GASbpdF(HJ9D]j.8AKYl%G9C*^F)PZ4G@>N'+@g-f89JBI
-tm^EE-"&n05#!@BQ[c:@rH3;C3+<*FE_/6ALSa1A7TUr+ED%4Df]W7DfTQ'F"Rn/%14=),9SZm
3A*<P1E\7l9jr;i1,1=&1,(FB+=M>CF*&OCAfs]eDe=*8@<,p%7nHZ&Eb03.F"%P*%144-+@9XQ
@<Q@'F`JUCAftJlE-#T4+=C&_:K0eZ9LM<I-T`])6;10F-X\',BOPdkARmD9%144#+Ad)mDfQtB
D]j.8BlbD;ASbpdF(HJ7ASbdsBm+&1Ec5l<+D,P.A7]e&+EqC;AKYQ/E+*WpARl5W+<Ve8DIal3
BOu'(@:Wn[A0>u4+EV:.+CK8#EbTK7F!)iR-X\'5BleAK+B3#gF!,L7F*2;@ARlotD@Hpq+<Y'5
@rc:&FE:h4Ch[cuF!,:5CLoO9$6UH6+<VdL+:SYa#ukJ<Ao^slG\q7>+@A1C<HD_lF"_9HBPoRZ
0JG.pDe(M3De!iAF(96)E-*a4AQWPb=)`D$CbBF:Et&I!+<VdL+<Vd9$6UH6:2b>!?tsXhFD,&)
.V!C7Anbn#Eb/c2+EMXFBl7R)+CT;%+Du+>+D#e:@;]UeA0>o(F*2;@Bl7Q+Bl5%&$6UH6?uogu
BlJ08?m'9"DIml3Ch[Zr3XlE=+<VdL+<Vd9$4.#<AQWPb=)`D$C`jjL6;10F02uLbAo^slG\q7L
Bkh\u$4."J$6UH6<+oue+Cf>-AoD^,F!,RC+D>\;+CK8#EbTK7F'p,(@;]UlATJu&A7TUrF"Rn/
+<VdL+<VdL%13CJE,9H7+<VeU@:WneDK@IDEa`p#Bk)3;E,9H705t`GF=q9BEt&I!+:SZ#.NhZ4
E,]`9F<G16EZdss2D-[<+D#G$ARlolDIakuCht5;ATDj+Df0V=E,oZ2EZfIB+A*b9/hf4,@<,og
$6UH6DJs_ADf-\6BkCp!F*2G@DfTqP%13OO+=\LADIIBn@psJ#?m&rm@;]^hA0>u4+D,>4+DG_(
Bl[cpF<GF7G\(D.@<6L(B5VQtDKI"4EcQ)=/e&.1%144#+<VdL+<XEG/g)QTCi<d(.3NhCF!,('
Bl%L$B-;,1+Eh=:@WNZ.Bkq9&FD,B0+:SZ#+<VdL+<Ve%67sB4+EV:.Eb-A%Eb-A2D]in2G\(D.
@<6L(B5VQtDKKqP#mh%J+<VdL+<VdLD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZX]B+?CW!%144#
+<VdL+<W(,ATVU(A3k6KF_t]-FE8lo/g)hW$6UH6+<VdL+=LiEDIY+Y3ZqWL.j-Mg.Ni"+$6UH6
+<VdL+=Ra,#mh%J+=\L"+Dtb7+DtV)AKYE!@;L41BlbD=@:p]j-p0O>4ZZsnBOPs)@V'+g+CSek
ARlp*D]iG*@;TRc@<?Qu+EVN2$6UH6Dg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohcAoDL%
Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!/$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a:IH=L
DfTB0/e&.1+<V+#+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ4?=oS3XlE=
+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6+<VdL
+Co@Q/g)Q)?S[$^Bm;'L/1)u5+@K1-8Q\>T%144#+<VdL+<W(CDCI_0+Cno&%13CJ%144#+B3#c
+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)AKYK$
D/Ej%FE7lu+<Ve?@<Q3)@V'+g+CSekARlp*D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&Ec*KP
#mh%J+<VdL+<VdL+<V+#,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1FC65"
A867.FCeu*FDi:2ATW$*EZfFGE,]`9F<G.*Bln',B-;D3ASrW2F`))2DJ((a:IGX!+<VdLBl5&$
C1D1"F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'oFa+<VdLFDi:C
ARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(T1%144#+<VdL+<XEG/g+,)
G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"
GB4mJH#n(=D0$-n+<VdL+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&
@<-'uGp$O7E,96"A0>K&EZccF@rH7+Deru9AU%c8%144#+<VdL+<X*@6VgHU:J=2a@;9^kF`_>6
?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$6Uf@
+CJr&A1hh3Amca(E+EC!ARmD&$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPI..!'<CBleB1
@q@(u$4R=b.Ni,1FC65"A867.FCeu*FDi:CF`;;<Ec`F3EGB2uARI,58l%htB4YslEaa'$A0>u*
G]Y'GDg)Wt+<VeFE+Np.+DG^9?u]pqA7]-kARoLsDfQtEBl7I"GB5AZ?u]pqA7]-kD09oA+C\n)
F`:l"FCetl$6UH6FDi:CF`;;<Ec`FGBPDN1An>CmF`M%G%144#+:SZ#+<VdL+<Ve%67sBlA8--.
Bl5&5C2%3i%144#+<VdL+<Y6++=DAOEb'&rD.P(($6UH6%13OO,9nEU3A*<E3B/o>/Kd?%B6A9;
+>GQ$+>PW*2%9m%$6Uf@?uKR`+ED%%A867.FCeu*/KeJ4A7]9o?ufguF_Pl-?m&rtD/Ej%FCeu*
Dfp.E@<3Q!Eb065Bl[cm%144#+<YN0Gp%!CF<G".G@>c<+D#e/@s)m)/e&-s$6UH6+<VdL+<VdL
0d(FL@r!2E+E(d5-RT?1+<VdL+<VdL:-pQU8l%htEb/ltF*)G2FD5Z2F#kEu0H`Z(B-8r`0f:(.
1-.*G3]&Z&$6UH6+<VdL+AP6U+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdL1E^^LB4N>Q
+FPjbDe(4C+BosE+E(d5-RT?1+<VdL+<VdLEb/lo+=D;RBl%i<4""N!05>E906MANCi_6W%144#
+<VdL+<VdL+<VdL+>,9!/e&-s$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*2%9m%$6Uf@?t+"i
?m&oe@r$4++DtV)AKYf'F*)IGBl.g*ASl!rFCeuD+EM+*+CJr&A1hh3Amc`nDfQt2ATV?pCi_3<
$4R=b.NfjOATo8=ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5
EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.
FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3
De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh
.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6
Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$
ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA
+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/
EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,
ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*
FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,
+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,
+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9
D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o
+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL
+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2
-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$
@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6+
+Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>Go
Bljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt
$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%
%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lq
A0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'
ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm
@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'
D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLEC
F=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%
EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'
F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>
+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%
@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL
+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9
FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2
$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#
+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-
FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>
F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5
D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1
ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"
ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):
ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&
Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMp
FCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/
F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.
@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC
+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\I
D/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl
$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG
%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(
%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"
Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!Tq
F`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5
DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0
@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$
+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2
+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-
Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)
%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.
A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8Gst
B-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b
.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!
+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555
C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1
+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZe
F*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_
+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqB
Cggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(n
DJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#
+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#
+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,Xi
ARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5
Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5
+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4
D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+
E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQ
FD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f
89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
F_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#
D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"
+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3
/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlor
ATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9
?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(
+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>
%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J
+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/
EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7
Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU
%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV
+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(i
B-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu
@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#
AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W9
0f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI
-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG
+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,
AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,
ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,
Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*
+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#
+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4
$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-
@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)
Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#
+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F
0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2
+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/Q
E$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6
?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.
CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe
?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H
+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>I
IR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC
@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%
H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:
DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tm
E$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c
%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4
E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LA
D.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(t
F<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q
05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b
.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc
+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?p
Ci^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FD
F)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2
/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(
DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE
>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#
+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<
%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*
+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&L
E-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0A
F'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV
-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=
/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(
CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;
@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4
+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7
F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nn
DBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$
F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(
Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9
BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3
Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaG
A8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/
+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbi
ATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR
:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-
F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F
9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;7
8g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg
05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*
+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q
$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0
De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1
+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#
.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM
@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&
A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa
0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6
De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6
Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'
Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,
@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B
-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(
+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3
De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)
Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5
H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2
E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNE
Df0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j
-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#
,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@
A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#
+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lY
FCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^
/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-
D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=f
ARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQu
DIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%
/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?
+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7
A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2
+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!I
Aft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*
Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0
/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX
<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6
+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)
A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nn
DBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.
ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9
Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3Amemm
BQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBe
GT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2
+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.t
F<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr
3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1
Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu
8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4
+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/
%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,
0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1
/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs
?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoF
De*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(
EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0n
Df-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'
A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3
Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN
@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj
/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8
Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs
@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)
8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cu
D.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K
7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p
%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s
+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UH
AKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!
AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8
+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:
F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).
AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T
%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<
Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-
+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq
$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5
?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+
G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!
F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(F
A9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibC
An?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]S
Ciq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,
+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;
E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5
F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU
0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm
$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>
+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0
F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt
/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)
+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/
$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)
A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#
+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhK
ASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2s
AKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'Y
BPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-
+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,
A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9
$6Tcb+:SZkBleB7Ed;D<A7TUg1,3EQDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B8r>/KdbrGp"k%
/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7@r,^!
AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5AS#a%
@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'lAMdd;
FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0sDIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&
+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3FDl26
ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*F(KB%
Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%htBl5&.
@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&$6UH@
+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i?m&oe
@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@+CJbk
?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W+<V+#
+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l8p+rq
+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%EbT$!
F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-E$04E
E,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8E+EQg
%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+DE,]`9
F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4+DG_'
DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b+=\LD
BOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4+A*b9
/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl$4R=b
+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A+BE&o
F(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=05>E9
/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H%144#
.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#+D,P4
+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@+EMgG
@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@$4R=e
,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8%143e
$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)D[d$r
+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$D/aQ(
+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LNBl7j0
+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#.NihH
BlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:
F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b.NibC
An?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g%14=)
,9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<BlkJ9
AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)+ED%0
@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.@rHC!
+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p$6UH6
FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9DfTB-
Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7
B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+De*Nm
CiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEtDfT]9
+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-oEZfIB
+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!?m'Q0
+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZmDe*<gF*'/p9L2!E8Q8AP4ZX]5
8l%ht-o3:p6=k4[+Ad)e@ruEpATK4.$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ib'6=FY@EZbeu
@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3Zoe:ATMr9E,oAsFD55rF!,(5EZdtM
6m+'(Eb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\4ZX]?%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[hDKKo;A9DC(Bl@ku$<(kTFE_/6AKZ)5DesJ;@<,p%Ch[Zr+Dbt)A7]9oB6A*53ZrB[
G@bf,F_i1EARTOrDK?q4DfQtACghU'DJ();Dfp(C@rGmlDJ()&ASl@'F!+q7F<G".F)N13@;]^h
Ec6)A+EqL1DBO(CARlotD/aN6E+O'+GqL3^87?[Q+F.mJ+D#_-EZfF:Dfd+IDfp)AASbs$Bl5&8
BOr;uDf9_^+<X5uCMn'7+A!qt+Dkh6F(oN)+CQC)ATo8=De3u4@;]Tu8K_JRF<GjIFWb+5AKYE&
+EqC5Cb?h>$4R>ABPDN1CggcqDfp/<Bl7L'+CQC1F_tT!EZf:4+<k9+F*&ODEa`I"Bk(^q+s:fE
+D5h2A7]RkDIml3AoD]4F`V87B-9fB6nTT)8LJ[m+DbUtEc,H!+EV:.+D>2(A0?))Grm-_AfuA;
FWbd7CLnW*Gp$O+G%kGt+EVNEBOtUmF<GjIFWbO8B4uB0@V$['E+*cuA0DBh.1HW)AT;j,Eb-@@
B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sATMr9AoD]48l%htF`V,7+Co%qBl7Km+D,P.
A7]e&%160&;GKeY7lhbl84c`&9L1uf;FOG_8Q%uU+@.,F<D>eK;BSb)+B;?/;BS@r7S-?D6m,)t
6m+rp9LM<I;_ALd%16'JBlbD5@:C@"AT;j,Eb0;7@3BH1D.7's+E(j78l%htAoDKrATDi7FDi:B
F`&fS<+ohcDIn'7+EMX9E$076F*)IGAoD]4FD,5.AU%p1FCf?"AKYo'+EV:.F(HJ+DerrqEcWiB
$4R>6AfrL$ATMrc:IITbEb/a&DfTQ'F"&5JBleB;+CT/5+E_R4AS,XoARloU:IH=9Bl[cpFDl26
ATJu(Df00$B6A6++EV:.F(HJ)Bl[cpFDl26ATJu'AS,k$AKZ#9DJj0+B-;;0BlbD5@:Ci38T&Tk
Eckl6Bl@m1+E)-?BQ&);FDi:4D]j.8BlbD,@;[2sAKYT'F`(_4Bl5%AC2[W8E+EQ0/g*`'F*(i,
C`mh5AKWC9De*Bs@s)X"DKI<M@:WneDBO%>+D58-+=LuCA1hh3Ago>A$7QDk<+U,m8l%iCBl[cp
FDl26ATM3mC2[Wi4ZYAA3Zp*c$4R>;67s`eATMrc:IITbEb/a&DfTQ'F!,WX/Kf.HF*&OIF(KA7
@rH6sBkMR/ARloU:IH=9Bl[cpFDl26ATKI5$;No?%15is/g+,,BlbC>G%G]'+<Y0-ARfLs+<Yc>
@<<V7Eb065Bl[cq+<X9P6m*Ug@:C?iBl[cpFDl26ATJt:@<,og$;No?+Co%qBl7Km/g)?+AS,Xo
ARlu-A8c%#+Du+>+Dk[uDBO%7AKW++Bl[cpFDl26ATJt:AU%p1F<GL>Cj?Hs:-pQUFD,*)+=LuD
@<?03+D#e:@;]Us+EVNEF)Po,FD,B+B-;,7BOu3,FD,*#+DGq=+Co%q@<HC./e&._67r]S:-pQU
D/X<#A3(hU@r+k\B-9>i+B2onF@o=s6tp[Q@ruX0Bk;?.F`g8gDJsQ,%13OO:-pQUGA(Q*+CQC5
ASbdsBm+&1A8-'q@ruX0Gp$X9ATJu3Dfd+5G\M5@+=LuD@<?03+D#%rDe3u4BlnD=@<-"'D.RU,
%16igA9DEsEcW?d/g)Nj-RLAk/j:C>3[[Nq6m,)t6pt$L:fAK/:IJ,W<Dl1Q+A,Et<(0_b-OgDt
De+!$AS-!+4Y@jlE+*j%-8%J)C2[X*A8-(*+<XEG/g);c.OdM5+DPk(FD)*jD..L$+?_>"C2[X*
A8-(*+?^i^De+!$AS,um$>F*)+>G!M/g,">F))n/D_;J++<Wij-Z*R=F(oN)+A,Et+D,P.A7]e&
+>"^HAS,XoAKYGnAoD^$+EDUBDJ=!$+A,Et+DbIqF!i(l+DkP.CEOiEC2[X*A8-(*%16Z_F(Hs5
$6UHT+=CT6C`l>G6m-)[Ch.*tF!+n3AKYMpAnc-oA1&K]+DPh*F_#&qEt&IfDIb@/$7QDk%16'G
F*(#M6pta0ARfh#EbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?3Q+Cf5!@;^4,%160&;GKeY7lhb\
8OHHK:JO2R8OZQ#6W-?=<(01t6<PF-;FsY^+Au37;]nk*+A>'f+B1m';]o.59M?Qq73Fue9LVoL
6m,&r+B1m#+AP@-<$5+=78PTG$4R>DBOu'(FD,5.6=k4[+Ad)e@ruEpATJu1@:C@"F`)7CBlkJ-
Eb/[$ATJu&+Du==@V'R&De:,&Bk)7!Df0!(Bk;?.Bl5&8BOr;7IS*C(;bpCk6U`FHA8-'q@ruX0
GqL4=BOr<(AU&;>F*(u4+EqO9C`mb0D/XT/+CT/5+E(j7FD,6,AKYMt@ruF'DIIR"ATKIH+A#$F
=\i$?6U=U=+@/=i<E()?84c`&6pXd<+B)68:`rM/="Xph.1HV^ASl@/AP?NA6=k4[6tp.QBl@lt
EbT*+?YO7nA7%J\+>Y-$+>=63BkAt?8OccQ:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0
FD)dEIS*C(;bpCk6U`@O/12Vh%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9@V'V&+E2@0@ruEp
ATJtBGA1qD+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3
Bk/>qCgh3sF!,17+AH9S+CT.u+A?KeFa,$J@<?1(%144#F(f-$C`k*GD'1ENAfrHPC2dU'BHS[O
8l%iR:K::[74/NO+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+=M)8@kVY4
DKU1Q+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5
+E2@4G%kl;F!,R9D/aE6@<-W9@V'V&+E2@0@ruEpATJu)Bk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8
ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/AKX<NF*&O$Ea`I"Bk(^q+DbIq+Co1rFD5Z2
@<-'nF"Rn/.1HW)AT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQUF`)52B5)F/ATAo(Bk)7!Df0!(
Bk;?./KdVT:/=bV+@T1+:Jt+#$8<SV+=&'c+ED%+A0sJ_4$"`uE+<g*Gp$R8FCfN8-QlV91E^UH
+=ANG$4R>;67sBkASbq"AKYMt@ruF'DIIR2+D,>(ATJ:f;Is]`G%F?U@R=XIF@9hQFD5Z2@<-'n
F!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMPI6m-#YATJu3Dfd+2ASc:&B-:o++EV:.+A*buEb/ek$6i)<
6m+ln78k=(:K/H'78-KP7j(Au+B1m#+A*bU;FO"u%13OO9mIjnBl\9:+CT.u+Dl%<F<G:7E,Tc=
@;^00@VKp,De:,#A9MZsAKY].+EM76E,9e\%13OO:.82P;BS_'<^fn/:.82P;BU%&DfTD3H#IhG
+A,Et+Co1rFD5Z2@<-'nF!,17+A*bjDKBo.Cht5)Bl[cpFDl26ATK"($4R>6+EqaHCh+YsCiaM;
@<QR'A0>;uGp#m]+DkP)@:s.^+Co2,ARfh#EbT*++Dbb-AKVEh-X9JgDeEKq+@^']ATM*(/e&-s
$:AiF@<?''@3A0<6m->TF*(u6+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfd+DBOQ!*BlbD,Df'H0
ATVL"Gp$g=A7]^kDId<rF<GL6+A+7/+A$Z&F!+n-F)N10+D5V2A0>SsARQ^'D]iS%Anc-o+CQC6
F^elqEb/a&DfU+GF*)GF@ruj6AKZ).@<<W/Bl\64EcW?q-Z^DRATDj+Df0VK+<X9P6m,u[ART[l
F!+q+DIIR2+DPM&Ch7Z?+<XWsATME*Anc'mF!+n3AKYSnBl\$8+EMX5@VfTu@Wcc8@VK^gEbT*+
+Ceht+Cf(nDJ*N'GA(Q*+A*bdBOPdkATKI5$7QDk:-pQU@rc-hFCcS'+DkP.FCfJ88l%htA8-'q
@ruX0Gp%-GDfd+?F`_\=A7Zm%Afs\nF!,"-Eb/a&DfTQ'F"Rn/:-pQU<+oue+CfG'@<?4%DBNJ$
E+Not+E)-?@3B&uDJ!TqF`M&(+Co2,ARfh#Ed8cUIS*C(;bpCk6U`FV%16uaG@VgD@W6F#F*&ck
-u*^0FD)dEIS*C(;bpCk6U`Y;E-,Z4F=/M!-XpY.F<GOC@:OCn@qB^(FCfN8+Co1rFD5Z2@<-W@
%13OO:-pQU<+oue+DGm>@;[3!G[YH.Ch4_@+E_a:+CT/+FD,6++EDC=F<G16EZfXGF`JU8Bk)7!
Df0!(Bk;?<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!CggcqA8,OqBl@ltEd8d>Ec5e;A9Da.+EM%5
BlJ/'$<1pdBl%U.F*)G2FCcS1AU,D1ART\'Eb0;7De:+a:IH=LAKYl%ARlol+Du+8ASlC.Gp$X3
@ruF'DIIR2/g+,,BlbD7AU&;>F*(u4+Dbt)A9/l8BOr;7@W6F#F*&iRA8,OqBl@ltEd8d>Ec5e;
@3B*'D/^V=@rc:&F<G+.F*)G:@Wcd(A0?)1FD)dh:IHfE$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15dI
@:UKs@:C?iBk)7!Df0!(GqKO5.1HVZ67sC!E+No0DIn#7A8,OqBl@ltEd8*$De't<@W6F#F*&cP
>9G^EDe't<-OgCl$;No?+Dbt)A0>K)Df$V.G[YH.Ch4`"F_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*
-[oK7A8c@,05"j6ATD3q05>E905>E9Cggdo05P'+A9Da./no'A-OgCl$;No?+ED%+ASu("@<?''
@;Ka&Eb/ioEb0,uATJtG+EM47G9C^1F*&OHBQ@Zq+Dk\2F(&]mEt&I`1E_#s+>=pNCi<d(-9`Q#
/g,1GG&J`U%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[a@:O(qE$/Uu@r$4++C\bhCNXS*$6hf&6VCEU+@8@]
93"e26:!t3<DXkK$4R>6F<G:=+Dbb6ATD3qCj@.3+EMF/E$07@+DkP&AKYD(@UWb^F`8IIBln#2
8l%i-+<XU$+C\bhCNXS=De=*&DBTGr.1HVZ67sC!E+No0FD,5.@V'V&+E2@0@ruEpAKYMt@ruF'
DIIR2%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sBi@:O'qBlkJ?E"*.n@:O(`+=CW;FCfN8
-OgCl$;No?+ED%7FCZM7ARfY%ATDi7FD,5.D/XK;+CfP7Eb0-1+C\bhCNXS*$?B^!FCZLA@W6F#
F*&c=$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMneCLnVs+EM%5BlJ/:A9Da.F:AR$<'a/G+@.,K6W-KP<$4S/
9i*#C$4R=jE+*6lA18X1@:O(o+E_WG@VK^gEd8dBAnc'mF!+q7F<G:>-Z^D=CiaM;@3B3$De'u)
A7]0lFDi9GA9Da.+s;/LF`JU8Bk)7!Df0!(Bk;?.@<3Q1Cgh$q+EV1>F=n[Y8l%ht@ps6tA9Da.
+CT)&+E)41DBNJ(@ruF'DIIR"ATJu&F!+m6F(oN)Ch4_]+EM%5BlJ/H+B)cjBlJ/:A9Da.F!+n3
AKZ).AKYi.F*&OGFCAWpAKZ2*Gp%3I+EMXCEb-@c+Co1rFD5Z2@<-'nF"SRX<+ohcC2[X(Dfp)1
AKYDlA8c?.A8-+,EbT!*FCfM9@;Ka&8l%htF)Q2A@q?cmDe*E%Bl5&8BPDN1AoD^,/e&.:%15is
/g+\ID/^V9DJXS@-t7.;ATMrB%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sB/D..3k.3N,@
ART[lF!+m6A8,OqBl@ltEd8d<F_u(?Bl5&8BOr;sF_u(?F*1r&Bl[cpFDl2F%16Q`FCfN8A9Da.
4ZX^,BQ&*6@<6Ks@;9^k?Qa2oCLnV9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+E_a:F!,C5+CoV3
E$043EbTK7Et&IK:IH=9F_u(?F(96)E--.D@ps6t@V$[)F(Jl)FDi:BASc9nA1Sj5DfBtE@;]Tu
D.Ra#AKYMt@ruF'DIIR"ATKI5$7QDk:-pQUEb0'*@:UKiE-,Z4F:ARqA0<7/E-,Z4F=/28+>Y-Y
A0<6I%14d43\V\'3b!&MATMs(F_u(,$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq?DfBtE@3B)p@ruF'DIIR2
/e&.:%15is/g+YBE-X*RATDEp+C];3ATMr9A8,OqBl@ltEd8*$DIn$&+=CW;@rH=3-Tc'^@<?0*
-[nZ`6rQl];F<l+@W5gqE-Wf?$?'Gt-Xq%)DfBtL+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4FC]N2
E"*-`$;No?+Cf5!@<*K0@<?/l$=n*sATT%B6VKp7;G]YY81+iR%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[
AKYD(D..L-ATAo6AM%q6B5)F/ATAo7@rc:&F:AR$9gME@+@.,E5uU`O;BSk+/Q,#-8Q/SW;BSn*
;Fs\a+q4kg$;+)^+E).6Gp%0>ATJu9BOr;sBk)7!Df0!(Bk;?.Eb/ltF*(u6ARlotDBO%7AKY`)
@<6O%E\;'@Aft]"Ch4`1D]in*Bl8$$Bl7X&B-:V*Ch[s4+E(j7Eb/ltF*(u6ARlooBk)7!Df0!(
Bk;?.BlbD*+D5V2A0>SsARR26+A,Et+Ceht+D58'ATD4$AKYD(Eb-hCAS5^uFCfJ8F(96)E-*4E
BOQ!*H#IgJ@ps6tARoLs/g)8G$4R>4ASu("@<?''@3BT%/TPE8BleB-EZfF5EbTK7+CT.u+E2IF
+DGp?Bl5&=Dfp(CD..-r+A,Et+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfdT@$7QDk:-pQUB4Ysl
Eaa'$+ED$FEb/ltF*(u6+EM%5BlJ/'$?B]uAS4.e+EM47GApu3F'i?jDe*2t4*s"22'?gJ+=ANG
$4R>;67sC%@<Q3)BlkJ3DBO%7AKYhuF*(u6+EDC=F:ARtATD?p+Eqj?FCeffC2[Wi+DPk(FD)dE
IS*C(;bpCk6U`YCDe*m"B5)F/ATBD;C3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkhF<GC6@WGmtGp$X3
@ruF'DIIR2+EVNEEb/ZiDf0B:%14:X78tC'8O?<@;HY,18OHHK:JO2R8OZQ#<)4W776s=;:/"e7
%13OO:N0l_+A,Et+Co1rFD5Z2@<-'nF!,")Anc-o+CQC6ARTUhBHV8&FD*9L+B3#c+D,>.F*&O8
Bk)7!Df0!(Gp%$C+EV:.+E1b2BHV#1+EV:.+E).6Gp$X3@ruF'DIIR2+EV:*F<G(%DBND"+Cf(n
DJ*Nk/g)9.F<G:=+CehrCh7-"FD,5.,&h[H+s:E1@ruF'DIIR2/g)9*G%GP6FD,T8B4rE*Df0N:
F<G+.@ruF'DIIR"ATJu(@;]t$F<G%(+Cf(nDJ*Nk+C]U=8l%htBlk_D+CQC*Df9//Bk1d`+EVNE
F(KG9FD,6&+AtWo6r-QO=Wh0b@psM$ANC8-%16!%5t"LD9N`KKBk)7!Df0!(Bk;?.@ps6t@V$Zj
@q0(kF(Jl)@X0))DL!@BF_tT!EZf:4+A,Et+EV%5CND*N;FNl>=&MUh73H,T@ruF'DIIR"ATJu(
@;[3+DJXS@@V$Zj@q0(kF(Jl)@X0)7DIjr4@<63:+<V+#%15a>AT2@$B-;#)@WGmtBk;?.;FNl>
:JOSd+E2@4G%GQ5F!+n$@qfIbDKK<'+E2IF-Z^D=F!,aHFWbUAASrW!DIal"Ci=B++Co1rFD5Z2
@<-'nF"Rn/.1HVZ67sBt@;BEs@W6F#F*&O&76s=;:/"e"$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1
A8lU$F<Dr/76s=;:/"e<%13OO:-pQU@W5gqE-WR?F!,@=G9D!@AKYr7F<G+.@ruF'DIIR2%17#a
+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQUAnc:,F<G4:Dfp"PF*22=AKZ&*FE8RD
@<?/l$>4Bu+=CT1Ec6)>-T`G43[\HHFCerqARfKuH"CE)A79RkF!,RCA79a+F*2A@Bldj,ATTUR
%13OO:-pQUDJsW.+Co1rFD5Z2@<-W9E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[jAS#g'
Eb/ioEb0,uATJu:E+EC!ARl5W,"k?n:`rY)7R^3D:.%HK+B;6+5u^9@+q4kg$;+)^+EMXCEb0;7
GAhM4+ED%*ATD@"@qB^6+<XQnAn?!oDI[7!+D#G!@VfTuD..=-+E_a:Ap%o4DfB9.@<?4%DK@EQ
;IsHOEb0,uATJu&Ci"$6+=Ll6FE2UT+EVNECi<`m+EqaEA9/l8BOQ!*@ps1i+E)@8ATAo;DfTB0
+DG^9DIn#7@rH7,AU&<</e&.:%15is/g,(MCj@.BF`\a:Bk)7!Df0!(Gp%-=An?!oDI[7!+Dtb%
A0?#6A79RoDJ((D+EM47G9C^1F*&O:Bm+&1D.Rd0@:s.m%16H"+F>^`0Hb"EDdmc74s58++ED%:
D]gDT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cDe!p,ASuT4A8,OqBl@ltEd8dG@VTIaFE7lu,",3o<D>nW
<$4S#6W?WQ:-hc\+AY<r771$Q+q4kg$:JfBF_t]-FCB9*Df-\3F!+m6Ci=3(+EMX5DIdI!B-;86
Eb-A4DeX*2+D,P4+E2@>B6%EtD.Ra//g)92Df^"CDe:,6BOu$'BOQ!o+DGpM+B*2qAKYK!@;0R$
Blk_D+E_R>ARf:mF('*7+CT.u+D#_-DBNJ(F*)G2@ruF&B.b;L:NU8]EcW@BF`\a?DBNV$Ch=f!
@;BFb+D#.sDfTr@/g*`'+DlBHDfBE.Bl@l3FD,B0+<kN@DC9NKAThX&+EqjEDJ(+:+<X0mDe'u$
De!p,ASuTuFD5Z2+D#A#G%#K(F!+t2A7[A98T#YDDKU&7-Z^DKE+s3(Df-\3F<GX9E+*cqFCfM9
,&Ct8ATD4$AKYr4DeF*!D/F!)B-JI1Ec5e;FD,5.@;L$sEc,<-Bm+&1/Kc6OCi!g-ATD4$AKYr4
DeF*!D/F!)B.bAN+<V+#%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,'@<6]:G@>c<+EVNEA8bt#
D.RU,+Cf>#AM,*.Dfm14@;[3!DKKH1+CQC6Bl7R"AKZ&*DKKH-@q?d$EZed5Cgh?sAKYMtF)to5
FCB9*Df.0M+A!]"Dfol,+ED%'Df'?&DIal3BOr;uDfT]+E\8IW;e9M_8l%htA8bt#D.RU,@<?4%
DBNP0EZf4;Eb-A(De!p,ASuTuFD5Z2+E)4@Bl@m1/e&.:%15is/g+bEEZf72G9D*JEb'56FE2XL
@3BW*DJ*cs+Dbb0AKYo'+CoD#F_t]-FCB9*Df.0:$=ROgATDTqF*)JFE]lHh+FPkk+<s-U+=eQh
-7ERhIORN1>9H?e+C-E*$?1-0+=CT0FCfK/@<6O3FE/`<$4R>;67sBpDKBB0F<GX9DKKH-@q?)V
0H`=tE-67F-XgV/ATDTqF*)JFE[NprEb0?$Bl7u7F*)G:DJ((?GpskEAoqU)+DbJ-F<GL3@s)g4
ASu!h+E(j7.!R0g%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%htF`V,8+CoD#F_t]-FCB9*Df-\3DBNh.
G9CC6DKKH7FE9&D$7QDk:-pQUAoD]4FCAZnFE8RHBOr;sDe!WqDKI"BASuU$DI[6#BlbD/ATVEq
ARl5WA8-+(+=CT0FCfK/@<6O3FE/`<$4R>;67sBiEbT)sCj@.6ATM@%BjtWrF*2A;Df9M9B6%p5
E$-8T+EV:.+E1b7@UWb^+D,P4+D#G4ATDL&B-;;0Df]J4F(K62ASu!hEt&IiCiF9.+FPjbB6%r6
-ZaEJD/X?1-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:/PPAU%X#E,9).De:,.Df021A8bt#D.RU,@<?4%
DCuA*.1HVZ67sBsDf021A8bt#D.RU,%14d33?VjHF)W6LF*2A@Bldj,ATTUR%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[cAS,XoAKZ8:F`JUCGA\Nq:IH=HBQ%p5@s)m7%14:I77KjD73G`/<Djr8=&'l1:IH=(
85E,_6WI)a+q4kg$;+)^+EqaEA9/l'@;[2sAKZ,:ARlp-Bln$&DBNA.@VKq)@<-W98g&(nDeF*!
D0%<P+A$/fH#IgJA8c?5F<G10DIaku+A,Et+E2@8D/"*+G%De<BOQ!*D.R:#F!,aHF`JUBAS#Cn
+CoC5@3BB#FED>1+E2@>B6%EtD/!m#/e&-s$<1\MEb-A%Eb-A1@;^?5AU%X#E,9*,+E(j78l%ht
E,ol0Ea`g%Bl7Q+Bl5%c:IHRO+EMIDEarZ'@rGmh/g*`'F*(i,C`mh5AKY`+A92[3EarZ'@:Wne
DBO%>+D58-+A,Et+EMIDEarZ'@rGmh/e&.:%15is/g+_M@;Tt"ATJu4Afu5;Bl7Q+8l%htGAhM4
F!,RC+Co%qBl7K)DIn#7Amo1`Ch\!*ATJ:f%15is/g+\9F(96)@V$Zj+A,Et+D5_5F`7csBP1[d
C2[Wi4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*-`$;No?+ED$FEb/ioEb0,uAKYr7F<G+.@ruF'DIIR2
+EM47G9C=3Gp$[=Ec5u>%17,eEb/iiBkhQs?TgFm1E\_$-R`j`/orHa,CUae/itb6+u(3]4YAE2
B5DKqF!a(g4YD.8Eb0E4-RU8h+Bot6-OgCl$;No?+EM47G9D*JEb'56Eb/ioEb0,uARlomGp%<L
Eb'56Bl5&%+D5_5F`8IFBOQ!*@<,p%DJsV>Bl5&8BOr<!Ec6)>%16igA7o7`C2[Wi4ZX]5@:sV!
F`8];$>t)qBkhQs?TgFm1E\_$-R`D>CiX*!F!)TR/g+eE.3L2p+D5RT/g+eIE$/n6A7m8!$4R>;
67sBtBle?0DJ()(Ec5e;-t-b/Dfp"J%16ut+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;hF*)>;BmO>5
8l%htARoLs+D,%lBl%L*Bk;>p$6hi;;cHOe8QnP*8l%ht779^H+@\Xa8PD]T8OZQ%%13OO<+ohc
D..-r+A,Et+D#(tF<GdGEb'56-uO5X+CT.u+=Lf3.3N,/DBND"+CfP8FDl#1H=^V0@X0),AS,Xo
Bl7Q+@3@s66WHiL:/jSV9hdoK6m-P\EbTK7/e&.:%15is/g+\9Anc-o+CoD#F_t]-F<G(3D/E^!
A0>r'EbTK7+>"^_ISP??+DGm>GAhM4+DtV)AKYr.@:Nk^DerrqEX`@D:IA,V78?fL:JFPL:./H'
C2[Wi+?_b.0H`D!0F\A1D/XQ=E-67FE,m'KH[\_=I4#I2.1HUn$4R>;67sBjEb/[$AKYD(DIn#7
GAhM4+>"^SE+Np.+D#(tF<GdADId[0%16us+=CW;GAhM4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:\`I
A0>u-AKWC1E-H5@A18X4A8--.GA1r*Dg*=4DIal-DffP5BQ&);6r-0M9gqfV6VgEN5u'fjFCf]=
+D>2)+C\nnDBNe7A8,XiARlolDIal(DKBB0F=n[Y=(l/_+EV:.+EM%5BlJ/:GA1r*Dg*=<F!,O4
G%G2,GA2/4+@B%+9J'<g6r-0M9gqfV6VgEN5u'fjEcl8@/e&-s$;u"a+CT.u+Cf5+F(HJ9BOr;7
@W6O0Eb$UAARoLs+EqO;A8cZE%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqAA8--.@3Bc4Eb$;,DBO%7
AKYMt@ruF'DIIR2/g)9/:IH=>F!+n-G@>c<+D#(tFD5W*+Cf>/Bk;?<+A[#lB5)6lCi^_/@;[3+
DJXS@@V$ZlBOPdkARlp-Bln#2AU&01Bk(k!+E2IF+E)41Eaa'(Df0VK%14Nn$;No?+Dbt)A0>Ds
@ruF'DIIR2+EqaEA0>T(FDi:5A8--.GA1r*Dg)WtARlo2F*2A@Bldj,ATTUR%13OO:-pQUAnc-n
+EV:.+=M;RDK9H4ATMF)0I\,UA8--.GA1r*Dg*=4DIal-Dfd*i:IA,V78?fL:JFPL:.-36$4R>;
67sBjCi=B++D#(tF<GdADId[0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cAS,XoAKXT@6m-GhDe`inF<GF/
@rcL/%14:I77KjD73G2u6m,<(:J+&C<$4n$6W-]Y+q4kg$<LnPDBNn=DeF*!D/F!)B-;D4FD)dh
:IH=NDfm1EH#RJ-@;Kb*+E)41DBN@1F(KG9De:,&Bk)7!Df0!(Bk;?<+A?]^A0>r3D.Oi2H#n(=
D'3n0EbTK7F!+n/A0>DoAnc-o+EMI<AKYYpDIe#8DJsZ8F"SRX<+oue+Ceht+C\n)A8c?s+DG^9
@3BN0De`inF<GF/@rcK1F(96)E-*]A$7QDk:-pQUA7]@eDIjr!+E2@>C1Ums+DkOsEc3'P+A!\u
F(HJ9BOr<*Eb/isGT^sGC*7,,EZfFG@q[!+@rc:&FE7luE,o]7F`)&7Df.^!+>=p!+>=63%15is
/g,4W@;]UaEb$;-+EM%5BlJ08%17,eEHPu9AKW@2AR]dp+EV%5CF9Pu%15is/g+tK@ps0rF(96)
E-*4?Dfor=+:SZmDe*KfBkhQs?TgFm-ZaEJD/X?1-OgDtDe*orBkhQs?TgFm-ZaEJD/X?1FCfN8
F!hD(%15is/g,+UF>%lZAS)AY6r-0M9gqfV6VgEN5u'gTH=%dX3ZoekD/XQ=E-67FE,m'K-[U;;
IXNRk-OgD3%13OO:-pQUF*)>@AKYhu@rcJs$8`lEF`\`RE,o]7F`)&7Df-pa8lJ)T8PiAn@;9^k
?TW4IC3+N8D/X?1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:MsZR+E2@>C1Ums+DkOsEc6"A@<,p%A7]@e
DIm?$Blk_D+D"u&Gp%3I+Cf>-Anbn#Eb-A=Dfp(C8g&1dF)u&6DBLMRDfB9*+EV:.+ED%5F_Pl-
A0>Ds@ruF'DIIR"ATJu&DIal1F`&=GBln#2-us/R+EVNEF(KH9E%VS,.1HVZ67sC%ATW'6+E2@>
C1Ums%17,m+=D,KC3+N8D/X?1-QjO9+E(d54$"`uE+<g*Gp$R8FCfN8-QlV91E^UH+=ANG$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMAYBlkJCDfp(CC2[X%Ec5Q(Ch555C3'gk,"4mk<$5=><DjrSDe*g-De<^"
AM.\3F!;&#%160MASrV_:IH=ADdd0t+EV:.+EM%5BlJ/:IUQbtDf0VLB4YslEa`c;C2[W9C2[X%
Ec5Q(Ch555C3(M3F!,%=ARfk)ARmD9<+oue+EM%5BlJ/:@ps6t@V$[)F(Jl)FDi:CATT&;E$.bK
6m-SbAKZ2*Gp%BNFWbm:DKIKR:2b5c+D>\;+F.mJ+Ceht+D#e/@s)m)+E2@>C1Ums+DkOsEc6"A
GA(Q*+A,Et+Dbt)A9/l;Bln#2F(K62ASu!hF!,:5CLoO9$4R>_D'13FEb]Z<DJa<1DC6Q2+E(d5
4$"`uE+<g*Gp$R8FCfN8-OgCl$<KMk:.\2N3ZrKcDfTD3H#IhG+E2@>Anc'm+DG^9Df0,/De:,;
Dfp(CA8,OqBl@ltEbT*+/g)99BPDN1Anc'm+DGm>Eb0<'F<Gd@ASrV_5tiDDE+EC!ATJu9BOr;Y
:IH=6A7TUr/e&.:%15is/g+\=F)Yr(Gp$j?A8lR-Anc'm/no'A%16Zg+ED%%A7&b[De*2tC2dU'
BIA7;A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A-OgCl$;No?+Cf5+F(HJ9BOr<$De*g-
De<^"AM.\3F!,[@DId[0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[t;ahg$:IH<r78-N#5u'fj6r-0M9gqfV
5u^EO:(7OS<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JN)C$4R>6DKBo.Cht59BOr;7B4Ysl
Ea`c;C2[WnDe!p,ASuT=+CSekDf-\>D]j1DAKXT@6m,;o7NcAUCiD!L%14Nn$;No?+Dbt+@<?4%
DBNk0+DPh*/oY?5+>"^MDKBo.Cht5&A7TUr+=Ll6DImisCbKOAA7TUgF_t]-F=A>VBln#28jQ,[
$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7d1u$4R>;67sC!
E+Np.+DPh*/oY?5+DGF1@3BN"Afu,*@:Wqi+DGm>@<Q'nCggdhAKYo/+F.mJEZfFKF*(u1%16ig
A8#OjE$-hD$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMl#D/E^%Gp$O5A0>JuDII?(Eb0)rEbf_K%16'JAKYT'
Ci"$6Bl7Q+E,oAsFD55rF!,=.CLnV\:IH=BDfTD3E,ol-F^oN-G%De)DIal4F(Js+CcW"4%15^'
6m+ln78k=(:K/H'78-KP7j(Au+B1m#+A*bU;FO"`$4R>/5sn:F:`r(j6VCEU+@8@]93"dt$4R>A
5taWh5p0)n;Fs\a+@K4(:^ma@$;EfZ73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<"00D$<'Am
+A>?n;F+2`+@Jdg<(Tk\5uL9C;]o%8+AtWo6r-QO=Ub]I$;3fV:`rY)7R^3D:.%HK+B;6+5u^9@
%13OO6r-0M9gqfV+@Jdg<(Tk\5uLi.:I7ZB6W?tn$4R>177KjD73G`/<Djr8=&'l1:IH=(85E,_
6WI)a%13OO6WI&a:JFDa73G2u6m+od8Q6g%5sn4;8Q88M;[j'C$:I<P8PV\s8l%ht:f:(]771#s
9gM-E:K%]0%15Nl8Q6g8:K::8C2[X%Ec5Q(Ch555C3'gk%16*673G2u6m,#h9Mcit:.-3m:IA,V
78?fJ<(Tk\%13OO%16'JATME*@<,p%C3=T>+EMI<AKYo'+EV:.+A,Et+E2@0@ruEpATJtc+D>2,
AKYT'F`(_4F`V,+F_iZQ+@1&kH#IgJF`V+:8l%htH#IgJGA1l0+E2@>@UW_^Gp$^5DIal8Dfp(C
Dg-(AD.Rg&De*oA+<V+#%15[=+F.mJ+D,>*A0>;u+CQC8F(Js+C`mS+FD,T'+E2..@<6!&Ch7]2
D.Oi*DJs_O+<X5u@ps6t@V$[&ART(^ARlolF?0j<%15^GBPnqZ@;BFp+:SZP@<,jk+>PW*3"64(
@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKiA9Da.1,V`k6<$NU9LV**+=BcW6m*m5.3MQ-F`Lu'
+@C'XAKXB`D/^Ur@rc:&FE8f=$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@EX`@b@;BFp
C1K=b5\FqBBl#D3Df#pj.1HVX5sdq79he&O<)Yq@+=C-%BlbD5@:C?iASl@'F*)G2FCfM9BQ&);
FDi:<Ddd0!A9Da.+A,Et+EM%5BlJ08+>"^VAThd/ARloqDfQsm+?1u-GT]^hEarc*1,(FB-OgDV
5se%:6WI&J3Zp-d$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMMgFE2;1F^oN-Df-!k8l%htF)Q2A@q?cmDe*E%
BlbD-BleB:Bju4,ARlotDBO%7Eb/f)8l%htA9Da.+EM%5BlJ08/g*Q)D/^V=@rc:&FE8R5Eb-A4
Cgh$q+@/pn8P($s+EM%5BlJ08+EV:*F<G(%DBND"+Dbt)A7]9oGA2/4+A+#&+EMX5DId0rA0>r'
EbTK7+E2@>@qB_&Bl7Q+G%G]'F"Rn/%16'JBlbD5@:C?fF)uJ@ATJtd:IH=6DIal2F`;;<Ecc#5
B-:VnA8c@,+D>2,AKYGnASrW)DKBo.Ci!Zn/g*b^6m,oUA0>r9E,]`9FD5W*+CSekDf0V=@ps6t
@V$ZrDKBo.Ci!Zn+EqOABHVD1AKXSfE+*6l@:s-oD..<jB4Z*9%14Nn$;No?+EVNEF`V+:@3B*'
D/^V=@rc:&F<F1O6m->hF*&O6AKYDkFD5o0%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBM;bDJ!TqF`M%9@3C#6De*p-F`Lu'+Co2,ARfh#Ed8*$<,Wn"F`&=1+A,Et+CoV3
E$043EbTK7+EM76E,9eBDfB9*+CQC1ATo8-Bk)7!Df0!(Gp$O5A0?#9AKWBT+Z_;+/g(T1%15RC
EZfI;BlbD5@:C@$BOr<-Dfp)1AKYMt@ruF'DIIR"ATJu&Eb-A'Eb/[$ARlotDBO%7AKWCM8l%iR
:K::[74B@"ASbdsBm+&1A8-'q@ruX0GqL3^=`8F*GA1l0+Dtb%A0>u4+Cf>-Anbn#Eb-A%+A*bg
DerrqEZfIB+E275DKI"CD]iJ++CSc%F^])/A8-'q@ruX0GqL42+B)6;:JODR=WgU26VgEN78?5n
F`V87B-:V*A8-'q@ruX0Gp%3B@<<W+F!,@=F<G:8+EV:.+A*btH#n(=D'3q@AS!#-=`8F*A8c?5
F<Gd9DKI"HDfp(CE,oN"BlA-8+Co1rFD5Z2@<-W9A79Rg@UX=hF!+q'Bl7Q+GA2#-A0>?,+DG_7
FCB!%Bl7Q+FD,5.DIn'7+A*c"ATDj+Df.0:$4R>/AS,k$AKYr4De!?iA8,po+Cf>-Anbn#Eb-A%
+=M\2:IJ,W<Dl1Q.3N/8Eb/a&DfU+U+AZkt8iSFWGT]UU<$67-F*(u1F!,R<AKX?YDJ!TqF`M%H
7W3*RATDi7D.RU-+E)41DK?qBBOr;sBl[cpFDl2F+D,P.A7]d(@rH6sBkMR/@<?4%DBNP*Ch54.
$7QDk:-pQU@rH6sBkMR/AKYD(IS*C(;bpCk6U`,.Bl[cpFDl2F+C\noDfTD3E,ol,AS#CdDJ()6
D]j.8AKYl%G]Y'LFCfDD%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qASl@/AKYr4AThd+F`S[A@:C?iBk)7!
Df0!(Bk;?<%160&;GKeY7lhbl84=Xr79EM3;cH1^+AtX&:KBn_+@Jdg<(Tk\5uL9C;]nG*76smA
6m+g!+Abs-:Jr<5<DHI8:IZI+84c`&9L1ut+<XWS73Fui6W?WQ:-hcL78k<WF`_>6F)5c'A1Sj<
De*[&@:Uo3C2[WnAThm.@:Uf0=%Q(Z+@8L>6q'd<<(02-+<X6F+B_K?+@AFm73Fl_:K:@:<(KG#
6VgHV78?f\+AYHL<(KGV73Fui6W?WQ:-hcL78k<s:EWD.<$4V3771'S73GQ#73G>o=B$D:5sc\m
<(0V9%13OO<+oue+EMX9E$/\&Anc-oF!+m6G%G]'+EV:*F<GU8D/XT/F!,:-@N]`1F`Lu'+Co1r
FD5Z2@<-'nF"Rn/.1HV^ASl@/AP?NA;f?f!@qA&B@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%16f]
/g)Nj8l%iR:K::[740303ZrH]Dfe,p+DPk(FD)dEIS*C(;bpCk6U`@FA8a(0$6UI4D/XQ=E-67F
-UAkI:IJ,W<Dl1Q+Co2,ARfh#Ed8dAF!,@=F<GX9FEMOF/Kf+GFEMOF@;]TuFE2XL@:s"_DD!:G
$>"$pASGa/+>#3XAU%p1F<G=;@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De(J7C3(aF
A8a(0$6UI4D/XQ=E-67F-V@0&;bpCk6U`,+A7TUr+DGm>DJsV>Bl8!6@;KakA0<HHBl8!6@;Ka&
@;]TuFE2XL@:s"_DD!:G$>"$pASGa/+A#%(8PUC=D_;J++<XEG/g+Y?ARTU%Dfp.EA8,OqBl@lt
Ed8d<Bl[cpFDl26ATJ:f+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>]k.&CiaE2@:U`7/12Vh
%144#F(f-$C`k*GA0<OH+>7^W+t"oiEc5l</14\;De*[&@:U`7/12Vh%144#F(f-$C`k*GA0<OH
+>7^W+t"oiEc5l</14\;De*BiG&2)*A1&fW-R'oI$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cU
GA1qD+EMIDEarZ'A8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC%144#:-pQU
@<QR'A0>>t@;]k%+DG^98l%iR:K::[73HPXFD,_<Df-[kBl8'<+CT.u+AH9S+EMgLFCf<1%144#
F(f-$C`k*GD'1ENAfrHPEc5l</13)nFD5Q4Ci<`m-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dm
C2[X!Ddd0(%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*BiG&2)*A1%fn+<Y`BDfp/@F`\`R
9OVBQFCf<.DfT9,Gp"MP@:Ls,Bl8'<.3N\MF`Lu'+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%
AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9CggcqF)Q2A@q?cn
Bk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/AKYE!
Gp%'HAThd+F`S[ADdd0!CggcqA8,OqBl@ltEbT*+/e&.:%15is/g,:SEb/ltF*(u6+>"^MB5VX.
AKYQ)Ec5u>%14d30H_V`1E^^LB4N>Q+?MV3F`_>6F)5c'A0>W*A8H0mA0>W*A7T7pCi<`m-QlV9
1E^UH+=ANG$4R>;67sBjCh7$q+E)CE+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$;tGPDg#\c@:E/R
F`Lu'6tp.QBl@ltEbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C0\@<?''F`_>6F)5c'A0>Ds@ruF'
DIIR2%15LGD/^V=@rc:&FE8R5Eb-A0Ddd0fA0>T(FDi:4Bk)7!Df0!(Bk;?<+<X$lART[l+CQB@
F`_>6F)5c'A18X3Bk)7!Df0!(GqKO5.1HVZ67sBjEb/[$AKYD(DIn#7F`_>6F!,"-Eb/a&DfU+G
Bl5%AIS*C(;bpCk6U`FH/KebL+EqO9C`m1u+ED%2@;TRd+DbJ.ATA4e:-pQU=`8F*D09oA+Cf>-
Anbn#Eb-@AIS*C(;bpCk6U`FH@;]TuE,TH.F<G[D+CT.1@:OD%@;I&tD/aTB+Co2,ARfh#Ed98H
$4R>[ATqZ--ZsNFCiaE2@:U`I-u*^0FD)dEIS*C(;bpCk6U`YNFD5Q4Ci<`m-Rh,)D..-r+E_d?
Ch\!:+Co1rFD5Z2@<-W@%13OO:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*
%17#a+=D;RBl%j,Ddd0(+BosE+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%160MASrV_:IH=9F_u(?
F(96)E--.DEcl7BFD,62+CoC5DJsV>A8-+,F`Lq6H#IhG+CfP7Eb0-1+A*bfDK]`7Df0E'DKIKR
+@0g[+EqaEA9/l%Eb-A(AS,XoARlotDBN@1DKTf*ATD?m+EM%5@<?!m+Dbt+@;KKtFD,*)+DGm>
@rc-hFCeu*GA(Q*+A,Et+Dbt)A90@G+A,Et+CoV3E$043EbTK7F!,"-F)Yr(Gp$s8F)tc&ATJu&
AoqU)+Dbt)A8,po+C\c$@q]Fp+E(j7DdmHm@rucE+<XWsAKYl%G]Y'E@:C@#FCfD6Ci<`mF!,R<
AKZ,;Bl%L*Gp$X3@ruF'DIIR2/e&-s$<LYVDJ=!$3ZqsUD/^V=@rc:&FE8R7@;[2sAKZ/-Ed8dD
@<-!l+EMHDBlk_D+CQC*Df9//Bk1d`+EVNEF`V+:@;L-rH#k*NF(HIB0HiK%.4u_c9Q+?MBl7Q+
@3B*'D/^V=@rc:&F<G:8FDi9o+EM+8F(oQ1+D#(tFDl2@+Ceht+CfG#F(c[g+D,P4+Eh=:Gp$p3
EbAr+F(96)E--.R%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!FD,5.F`_>6Bln'#F!,"-@ruF'
DIIR2/e&.:%15is/g,1WDBO%7AKZ,;Bl%i5A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUr
F"_0;DImisCbKOAA92[3EarZ6F`_>6F"V0AF!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Auc`ASu("@<?''
F`_>6F!+t5Df]tBEb/ioEb0,uATJ:f<+ohcCghC,+Dk\2F(&]m+Co2-E,8s.ARlomGp$N<A9Da.
+EM%5BlJ/:BlbD*+ED%1Bl7HmEZfIB+ED%+ASu("@<?''@rcL/F!,L7An?!oDI[7!/g)9/:IH=9
Bk)7!Df0!(Bk;?.D..-rFCAm$+EqaEA0>B&Df]tBEb/ioEb0,uATJu9BOQ!*@<,p%F`V,)+DG^9
D..=-+Eq7>F"SRX<+ohc@rcL/F!,L7An?!oDI[7!+CT;%+Du+>+EMXCEb/c(Bl5&(F_u)=+CT.u
+Dl7BF<G%(+ED%'Eb/[$ARlolAoqU)G@>N&F"Rn/.1HVZ67sC$AS5RlATD4$AKZ,;Bl%L*Bk;?.
@rcL/F!,L7An?!oDI[7!+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(-9`Q#
/g,1GG&JKN-OgCl$4R>;67sBt@;BEsF`_>6Bln'#F!+m6Eb/Zi+E).6Gp$X3@ruF'DIIR2%16Wb
F(KG9-W3B!6r-QO=XOXc%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>W*A.8lFBOr</FD5Q*FD5<-+Co1r
FD5Z2@<-W9BlbD7Dg*=?Ddd0fA0>;uA0>B&Df]tBEb/ioEb0,uATJu-@<Q3)@V'+g+E_X6@<?'k
/g)99D]iP.D/a<&FCcS:BOr<,ATMs3Eaa'(Df-\9Afs]A6m-PhF`Lu'+Cf>#AKZ2.+Du+A+CfG'
@<?''@;]TuCi<`m+=LuCA8H0mA18X0DIak<C2[WnAThm.@:Uf>%14Nn$;No?+CfG'@<?''A8,Oq
Bl@ltEbT*+%16uaG@VgDC2[X!Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+C2[X!Ddd0(.6AnlDe'u3
Dfp)1AKYK$A7ZloBk)7!Df0!(Gpa%.DIn$&+=CoBA7T7pCi<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q
05>E9A7]q#Ddd0(.6AnlDe'u$AThX$DfBQ)DKI"?F`\a:Bk)7!Df0!(Gpa%.%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2%15^'6m-PhF`Lu'+Cf>#AKYMpE+NotF!,C=+E(_(ARfh'+DG^9FD,5.F`_>6Bln'#F!,"-
@ruF'DIIR2/g)99BPDN1Eb0&qFD5Z2F(f9,+DGm>D..-rFCAm$ARlomGp%3BAKYr#FD)e8Eb&a%
+E(j7A8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nF!(o!1E^UH
+=ANG$4R>;67sC!E+No0-u*[2Ci<`m.3N&:A0<:CFD5Q4Ci<`m.1HW&A0<rp-YdR1Ci<`m+E_d?
CiaE2@:U_p$4R>;67sBkBle60@<iu+Bk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z8+>=63%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%15dI@:UKQ:IH=HDfp)1AKYK$A7[A9+B3#c+A,Et+Co1rFD5Z2@<-W9A9Da.
+DGm>Cgh?sAKYGn@psM$AKY]/+Cf>-FCAm$F!+m6F*1r5FCB'/Bjkg#@;Tq*DKI">AftW&@s)X"
DKK</Bl@l3@;]TuFCfN8+Cno&@4iZoF<GF/Gp%3;CLnVs+D,2/+Dl%6ASuU2+EVNECi<`m/e&.:
%15is/g+tK@:UKqDe':a0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De(J7
C3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgB4YslEaa'$+DPh*+CfG1F)rIEAS,LoASu!hEt&ICAS,k$
AKZ#)B4YslEaa'(DJ(),De(5:+CfG1F)rIEAS,LoASu!hF!,:;DegJ(F<G[=AKYo1ASrW$Bk)7!
Df0!(Bk;?<+<XWsAKWC9De*[&@:Uf0A8,OqBl@ltEd8dFDg*=;@<3Q"+ED%*ATD@"@q?d%@<?0*
FD,*)+DG_'Cis9"F!)lRFD5Q4Ci<`m.4u&:.1HVZ67sBuDffP5FD,5.-u*[2Ci<`m.3NS<FD)*j
A8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m,u[Df]tBEb/ioEb0,uATJu<Bl%T.A7]^kDIal.
DBO(DBl%L*Bk;?<%14Nn$;No?+ED%+ASu("@<?''-u*[2Ci<`m.3N,@Df]tBEb/ioEb0,uATJu&
DIal2BQ&);Anc:,F<EF`D.Rd0@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R>;67sBt
@;BEs-u*[2Ci<`m.3N%AEb/Zi+E).6Gp$X3@ruF'DIIR2%16WbF(KG9-W3B!6r-QO=XOXc%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+A?]^A0>W*A7T7p%15jKG9C^5F=2,PCi<`m+CT.u+CfG1F)rIEAS,LoASu!h
+=LuCA7T7pCi<`m.4u_c-u*[2A7]q#Ddd0*+DGm>GA(E,+A!\c@;Ka&FD,5.,%P8./Snj@ATAtI
+<XWsAKYMpFtIN=H"D"=BlbD*+E2IF+Co1rFD5Z2@<-W9FD,*)+EM7=F!,C=+EVO@+E(j7@3BH1
D.7's+E(j7F*(i"Ch4`"Bk)7!Df0!(Bk;?<+@L?mBl7Q+A7]pqCi=90ASuT4Df0B:+EV:.+Co&,
/Snj@ATAo'BOPdkATKIH+B`W*+Ceht+D"u&Bl&&;Eb0E4CLnVs+Co&,/Snj@ATAo(Bk)7!Df0!(
Gp$RA+Cf5+F(oN)+DGpM%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@ltEbT*++CT.u+E)41DBNY2
+Cf>1Eb/a&+E1b2BHV56A7]cj$8WfCA0<6I%17#a+?MV3C2[WnAThm.@:UKqDe*[&@:UL'FD5Q4
Ci<`m-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>;uA0>B&Df]tBEb/ioEb0,uAM+E!.1HVZ67sBs
Ddd0!-u*[2A7]q#Ddd0*%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9
A7]p:Bkh]:%13OO:-pQUBl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/_:BleB;+>"^HAS,XoATJu5
F`\a:Bk)7!Df0!(Gp%'7FD)*jB6%r6-YdR1Df-paI4cXTEc<-KC2[X$DC5l#%15is/g+YEDf]tB
Eb/ioEb0,uAISu(+F>^`0Hb"EDdmc74s58++ED%:D]gDT+:SYe$;No?+Co&,ASc:(D.RU,+E1b2
BHUi"@ruF'DIIR"ATJ:fA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$AKYT-Ci"A>@rH4$
ASuU$A0>W*A0>r'EbTK7Et&IUBOr;Y:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.BOQ'q+Du+A
+C\nnDBNt2F*)>@ARmD9%13OO<,WmlASu("@<?''Ap%p+Gp$U8D/Ej%FCeu*FE1f#Bln'-DII?(
8g&1bEbTK7+D,>(ATJu+DfQtBBOr;rDf'H3DIm^-F!,C5+EV:.+A,Et+EMgLFCf;3H#IgJ@ps6t
Ecl7B@3BW$EbTK7+EMXCEb/c(Bl5&8BOr;Y:IH=9Bk)7!Df0!(Bk;?<+<XWsBlbD<FCfD6Ecl8@
+EV:2F!,O6EbTK7/e&.:%15is/g+e<DImisFCcRe:IH=H@rc:&F<G10Ch7Z1Bl5&*F_kl>+Cf>,
D.RU,ARloqDfT\I%17,m+=CW@Bl%<pDe*p-F`Lu'-OgCl$;No?+Cf5+F(HJ)Bk)7!Df0!(Bk;>p
$8WfCA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qAStpnAKXT@6m-;a@:UKkBk)7!Df0!(Bk;?<%16'J
AKXT@6m-PhF`Lu'+Cf>#AKYMt@ruF'DIIR"ATJu&Eb-A2@;TRd+=LuCA7T7p.3L$RDe(:>@;]Tu
.!9WGCi_$X+<XBeDL!@HATMr9@;]Tu@WcC$A0>r'EbTK7F!,17+EV:.F(HJ)Bk)7!Df0!(Bk;?.
D..3k+E_a:+E(j7FD,6,AKYl!D.Rc@+<XX%+Co20AKY])FDi9o:IH=8De*E%Blk_D+CQC*Df9//
Bk1d`+EVNE@rH=3+CT.u+ED%2@;TQuFD,5.Ci<`m+Co1rFD5Z2@<-'nF"SS8DI[U%D.RU,+CT.u
+EDUB+EV:.+D,P.Ci=N3DJ().Bl7L'+EVNE@rH=3+CT.u+ED%2@;TQuFD,5.Ci<`m+Co1rFD5Z2
@<-'nF"SRE$4R>D5uLHL:.I>f<DGnW9he&O<$4t39N`K07Nbi0<?O\*+AP^3+@/\!76s=E+@ne!
73F!nDe*BiFt"O^C2[W3+@/aj+=MASBl%i>+@Jdg<(Tk\5uL9C;_ALd.1HVZ67sC'DK9<$BleB-
EX`@N67sB:+ED%+A0sJ_4$"a3FD5Q4Ci<`m+DPh*Ci<`m+DPh*A7]q#Ddd0!F`_>6F!,49A0>W*
A7T7p-OgCl$;No?+Cf5!@<*K!DL!@>De'u3Dfp)1AKYMt@ruF'DIIR"ATJ:f:-pQU:2b5c3ZqpN
D/E^!A9/l%Eb-@pBl7I"GB4mFEbT*&FCeu8+@^9i+E_R9GT_'QF*(u1Et&IO67sC$ASl@/AKYE!
A0>B#E-WR:Bl[cpFDl26ATJu2@;^3rCi"AL%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*
-[nZ`6rQl];F<lXF`_>6F!iCf-R'oI$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(
;bpCk6Ub6pDe(4E/12Vh%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl];F<lX
C2[WnATfFM/12Vh%13OO:-pQU@rH=3+Co1rFD5Z2@<-'nF!*%W04c8EE-,f4DBNG-E+rm)+ED%5
F_Pl-A0>H#E--@JF*1r&Bl[cpFDl26ATJt'$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*-[nZ`
6rQl];F<lXF`_>6F)5c'A1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci`i/.4chj+>7:K
06noS$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*-[nZ`6rQl];F<lXC2[X!Ddd0(.4chj+<i0a
-u*^0FD)dEIS*C(;bpCk6Ub6pDe**#.4chj+>7:K06noS$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P
@<?0*-[nZ`6rQl];F<lXC2[WnAThm.@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7p
>ULsO-R'ZdAKWXO-OgCl$;No?+ED$FEb/ltF*(u6+EqOABHV2(G9Cd3D.Rbt$;No?+ED%+A0<7B
FD5Q4-T`_kE+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci^sQ4""ZPDImisC`mkBBl%L*Bk;?5%15is/g,1G
B4N,4C2[W14"+i_@<?0*-[nZ`6rQl];F<lXC2[W1.6AnlDe'u3Dfp)1AKYK$A7[+t$;No?+ED%+
A0<77De*BiFsf@"C2dU'BHS[O8l%iR:K::[79jSGA7T7p-Rh,)C2[W*A7]pqCi=90ASuT;%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[rF_tu(Ed8*$<+oue+DbIq+EM47G@b;-BQ&);FDi:<Ddd0!A9Da.+EM%5
BlJ08/g)9/:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.G@bf++Dbt)A7]:(+<XX%+E_a:+EV:.
+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++DkP&AKZ&:Eb-A8BOuH3@<,p%DIIBnA0<:8De*BiFt"sb
-u*[2.3N&:A0<:CFD5Q4.4u&:%15^GBPnqZ@;BFp%15g<Earc*1,(FB%16QQCLqO$A2uY8B5M'k
CbB49D%-h$%13OOC2[WsDKKo;1,V`k6<$NU9LV**+=BcW6m*m4.3M3"FE2;1F^oN-Df-p3$;<`P
5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX5sdq7
9he&O<)Yq@+=C-%BlbD5@:C?nDKKo;A9DBnF!,R<AKXT@6m-PrF*(u1+>"^VAThd/ARloqDfQsm
+?1u-GT]^hEarc*1,(FB-OgDV5se"<;GU1h4ZX]?%15cp6:Oa<<Du%A+>=63%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+BN5bF<G:=+A,Et57Irl:IH=>F!+m68g&=rEb$;6FDl2.B4W2oDIal1ATVs,AThKu+EMgL
FCf;A%13OO<+ohc@UX=l@j#JrARQ]jAS>dqA0=K?6m-2b+EV:*F<F0uE,ol0Ea`g%Bl7Q+BlbD+
ATMr9G%kN3ARlolF!,CAB45[lH>.80+CQC&Des6$@ruF'DBNk0+EqaEA9/l8D]j"1Eb961D'370
FCB6+/g*r1B45[lH=^V0@rH1"ARfgrDf0V=De:,9DfTB0+D>2,AKYD(@V'Y'ATAo2@;TR:+@Jdg
<(Tk\5uL9C;]uSW.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^+DGm>@3A/b@:WneDD!%S8TZ(hF!,17
F*(i,Ch7-"Bl5&8BOr;7IUQbtDf0W$B4YslEa`chC2[W3+C]A"DI[?&De:,6BOr;rF`MM6DKI!n
+EMgLFCf;3AoDKrATAo&Gp%3BAKYr#@r#LcAKYhuDII0hEZf:@+C]U=F`)M>E,]N/B-;;0AKYMt
F*)G:@Wcd,Df-\DBlG1CC2[W8H>.=I/g)99BOr<(AU&;>CggcqF*(u4+DG_-FD50"BmO?3+EV:.
+A,Et+EMgLFCf;A%14Nn$;No?+E_a:A0>?,+EV:2F!,:-@LWZbAT;j,Eb-@@Anc'mF!,"-EZfI4
F)*-4$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMl"@<-H48l%ha$<1\QF!,OGAT/c5FCB33F!,R<AKXT@6m-Pr
F*(u1/e&.:%15is/g,4W@<-H4C2[W*/KePDART[lF!,=.F*(u6+D,>(AKY]!+Dtb#ATMp$Ed8*$
Eb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is]`G%De7Ch+Z)@:C?iBk)7!
Df0!(Bk;>p$;+)^+DGm>Bl8!6@;KakA0?)1FD,T8F<G"0Gp$X3@ruF'DIIR"ATKIH+<XX%+E_a:
+A,Et+F.mJ+Dl7BF<G(6ART[l+EMI<AKYMt@ruF'DIIR"ATKIH+B3#gF!,:-@N]f7ATJu+Dfp(C
AU%X#E,9).A8,OqBl@ltEbT*++=M&7@OWiN-u<=$A7]p5/0H?_Dg<cS@;]Tu-ua!2H#R>4.4u_c
8l%htA8,OqBl@ltEbT*++CT;%+CfG'@<?'k+EqOABHVD1AKWC=ATqZ6+<k]7G9CF1@ruF'DIIR2
+s;&?EagXD%13OO6=jbIEb-A'Eb/[$Bl7Q+CggcqA8,OqBl@ltEbT*++ED%1Dg#\7@;^?5E,oZ2
EZf1,@N]2q@ruF'DIIR"ATKIH<+oue+EMX9E$/\&Anc-oF!+m6F`_>6BlnVCFD,*)+EqO9C`m;0
@<6!&A8,OqBl@ltEbT*++D,Y4D'3A#AmoguF<GC<@psInDf0VK+A$YtBlbD;F`&=9DBO%7AKYl%
G]Y'LFCfDD+:SYe$<KMk:.\2N3Zq!`+B1m#+B1d(:estT;HY,95sc\^8OHHK:JO2R8OZQ#6VgHV
5tOfo8PV`N;GBGV8P`)(=\i$?6U=U=+@/=i<E()/:EWD.<$4V3771'S73GQ#73G>o=B$D:5sc\m
<(0V,%14Nn$;tGPDg#\c@:DW=@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%17,oDfe,p+DPk(FD)dE
IW]^CE[M;'BkAt?8OccQ:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm@rucs
Cggd`ATf7F%144#F(f-$C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]'@:CE.%144#F(f-$
C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]/Dg<NS%144#F(f-$C`k*GA0<OH+>7^W+t"p^
Df9_K-X:D)A7TCaFE:]+CghU.ASr\>%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC.3N/8
@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIjCNCV4
DBNn,FD,_<Df-[kBl8'<+CT.u+AH9S+EMgLFCf<1%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)c
De*Bm@rucFCggd`ATfF1$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*O@:CSn$6UI4
BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*WDg<]>$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K
-SK4QA7TCaFE9*SCghU.ASrk)$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUD.-p-Ch[d0GUXbG
Bk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.
Dfp+DFCf<.DfT9,Gp$p3@N]2q@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/$7QDk%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%16!ED/XT/+CT/5+E2@8DfQt:@:C?iBk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+F(HJ&
DL!@8Bk)7!Df0!(Bk;?./Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+E(d5-RT?1%15is/g,:SEb/lt
F*(u6+CT/5+DbIq+Co1rFD5Z2@<-'nF!*%WBkM=%Eb-A)EcQ)=Et&I1+>=o`+>Y-\AS5O#4s2pJ
-Z!4#A7]p,CggcqFDlFIE,8s.E+No7%13OO:-pQUEb0*+G%De,Bk)7!Df0!(Gp$X3Eb/a&DfTQ'
F!+n/A0>;sC`m5+DKKH-FE8QV+DGJ+DfTD3ATDg0EcVZs;Is]`G%F?U@ROp?FD5Z2@<-'nF!*.G
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqPBPDN1F*(u4+CfG'@<?(%+EV:.+=M&7@OWF.DIak<Cggd`ATfLF
A8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1
%15is/g+YEART[l+=M&7@OWF.DIak4-u<=$A7]p5+Co1rFD5Z2@<-'nEt&IoATqZ--Z!4#-OgE#
ATqZ--Z!4#A7]p3%13OO:-pQUCh[s4+CTG%Bl%3eCh4`"Bk)7!Df0!(Bk;>p$?'Gt-RT?1%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+AZrfDJ=!$+CQC&Ci=B/DJ()&Bk)7!Df0!(Bk;?<%16'JAKXT@6m,uXD/E^!
A0>K&EZf:>ASu4"B-:W#A0>AuDf]W1B-:`!@ruF'DIIR"ATJu.F!)lLA18X>EZccKE+No0A8,Oq
Bl@ltEd9)d+A,Et+Cf>,D..<mF!+n3AKZ&-DfTqB@;]TuARTY*+EVNEFEqh:/e&-s$7Kh'.3N,/
DBNk:ASrW$Bk)7!Df0!(Bk;?.;FNl>=&MUh73H#VA0=c=5t"LD9N`tj6$"/oDfm1>BkM+$+D#e:
ARfg);FNl>:JOSd+Co1rFD5Z2@<-'nF!+t$DJjB7+C\n)@q]:gB4YTr@X0(g:IH=8Df'?"DIdf@
%14Nn$;No?+E)41DBNt2@:V$8EbTW,%17#a+=Cu6@Us%n-OgCl$;No?+E)41DBNt2@:V$0DJXS-
$8N`BA0<79@:CSn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi"Df'?"DIal1ATW'8DBNG-A7Zlm@<6-m
Et&IBCht4d:IH=8Df'?"DIdf2Eb0?8Ec*"/Dg5i(+Dbb5F<GU8F*2;@F"SS7BOr;uBl\9:+DGq/
D'3P6+CQC5ATW'8DBNG-A7[eE-o!.nB5_^!+=Jom+C\bi/g)97ASkjiDJ=!$+DGq/D0$h.Eb-A1
ATMp$B4Z-,@;]U,+E_aJ@;Kb*/0JMEEc5t@Eb0&qFCeu*Bl7O$Ec#6,Bl@lA+<X9P6m,uXD/E^!
A9/l4ATDC$Ebuq1G][M7F(of/+CT;'F_t]-F<G(,ARfLiDJ(RE+A$/fH#IgJ@WH$gCER%.8l%ht
@rH4$@;]TuE,9)oF(HJ*D..-p+Dk[4-t6V#ATDNr3B9?;D..-p/n8g:.3N&:A0>u*Cht52AKZ21
@<<W;Dfm15Bk/h*$7QDk:-pQUF)Po,+D#S6Df0-)F`S[DE+No0@rH4$@;]Us%17#a+=CkG@;R,q
+Dkh6F(oN)+Co1rFD5Z2@<-W@%13OO:-pQU@UWdiFEqh:Et&IpA0<lA$4R>;67sBi@:UL$@;]k%
%17#a+>Y,r,U[&>D^Pu$%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AZlkBl7K)8l%htA8bt#D.RU,@<?4%D@HqF
:IH==@<3Q&G][M7F(of/+=M2>Agnj5De!p,ASuTuFD5Z2/g*b^6m-#Y@s)X"DKK</Bl@l3@ps6t
@V$Zj@q0(kF(Jl)GA2/4+EV:.+=LuCA8#OjE%)oQATD64%13OO-u*[2BOu"!.3N\N@<ZU1+CQBh
6q/;>ART+\EZfI4F)*BN8l%htF`V+:8ge[&@rH6sBkMR/ARlo[6q/;>ART+\EZf:<+BN8pA8c[5
+CT.u+A?KeFa,$MH#n(=D0$h.DIal3BOr;1DfB9*+s:r?ASc0*@rH4$@;]TuDf-[l@:O@2%14Nn
$;No?+Co2-E,8s.+A,Et+CoD#F_t]-FCB9*Df-!kC2[WrASc<.0F\?u$;No?+Dbt+@<?4%DBNk0
+DkP$DBMPI6m,;o7Nc5[@s)X"DKH<pC2dU'BHS[O@:WneDKB&qASu("@;K1`De*Bs@s)X"DKK-&
A7f@j@j_]m%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@KpRFD5Z2@<-W9E+*j%Et&IUBOr<)E+No0A8,OqBl@lt
EbT*++E(j78l%htA7]@eDIjr!+EM+&Earc*@;]TuAn?'oBHV8&FD*9L<+ohc-tI%&.3L$LBk)7!
Df0!(Gp$g3ASuU(Anba`FD5Z2.3NeFEag/-BleB;+EV:.+E1b2BJ'`$.1HVZ67sC%BQ&);E+*j%
%16W[A0<Q8$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBOr;sH!t5t@j#B%Ebuq;AfrL4Bk/Y8Eb0?8Ec,q@
A7]jkBl%i5@:F.tF<G[=AKYK$DKKH-FE8RCAftYn@qZuqBk)7!Df0!(Gp%$C+EV:.+E1b2BJ'`$
.1HVZ67sBkBk)7!Df0!(Gp$X/FCAm"Et&I1+Co1s+>=63%15is/g+\=A0?=D0H_J\:-pQUBOPdh
Gp$g3Bl@ht$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi.@VTIaF<GLBBk;1(@<?4%D@HqPBOr;Y:IH=H
H#n(=D'3P6+CQC&Df'H0ATVK+@;]TuA7]jkBl%?k+D#e+D/a<&+E(j7DdmHm@rri3EbT*&FCeu*
E,ol0Ea`g%Bl7Q+Bl5%c/g)99BOr<-H#n(=D'3>,DKBN5FE8RCAftM)DKTf*ATAo3AftT"@<6L$
F!)lMEb/isG\(D.GA2/4+=CT4De(4E/g)9<BOu'(FD,5.F*VhKASiQ+Ddd0t+CQC9@<-'nFEo!I
Afu#$C1UmsF!+n3AKYK'ART[lA1euI<+ohc@UX=l@j#3#@q]RuARfh)Eb-A-F!+m6D..-r+Co1r
FD5Z2@<-W9DdmHm@rri8BOQ!*@rH7,@;0V#+D,P7EZfFG@W,^jARfh'/g*Sk@q[!'E+No0A8,Oq
Bl@ltEd8dAF!+n-F)N10F)u80Bjl*pA0?)1FD)e*+Co2,ARfh#Ed8dG@VTIaF=n\(Bl[cpFDl2F
+E(_(ARfh'+CT;%+CfG'@<?'k+CT.u+Co&)FE2;FARlolF!,L7EHPu9ARmD&$7QDk:-pQUDdmHm
@ruc7@V'1dDJj0+B-;D4FD)dE@;9^k-Qli<AKZ).AKXT@6m,uU@<6L$F"Rn/@rH7$+>=63%15is
/g*b^6m,uXDKBN5FE8RCAfu//GT^I(F(o,,DdmHm@ruc7@;]Tu@<2kb:-pQUD..=-+Co2,ARfh#
Ed8dG@VTIaFE8R5F!,R<ATD?)@<,p%E+*j%+DGq/D0%<=$=e!lC`kGA$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMnlAKYr7F<G+.@ruF'DIIR2+Cf>-@qBV$%16'JAKYT!EcZ=FA8,OqBl@ltEd8dGDBO%7AKYr#
FD)e2F!,OCARfF_Cb?hQ8TZ(hF!,R<AKYo/Cj@-GA8,OqBl@ltEd8dLBOQ!*@ps6t@V$[!De*Qo
Bk:ft@X0(g:IH=8Df'?"DIdf@+<X!^@psM$AKYi.F*&O8Bk)7!Df0!(Gp$sBA8,Xi@psInDf0V=
@<,p%E-67MF!+$s@ps1i+EV:2F!,"-@ruF'DIIR2+EV:.+<kcIF<Vi<Bk)7!Df0!(GqKO5%15[K
-Z^DED/aE6FCB'/+EVNEF`(`$EcZ>2DIal3BOQ!*H#IgJ@ps6tF`V+:FD,5.@rH7,ASuU2+E(j7
FD,5.DffZ(EZen,@ruF'DIIR"ATJu4DBO%7AKYr#FD)e+F`\aODfm14@;]t$F<G(,@;]^h+EV:.
D'3P1+CT/5+Eq7>/e&.:%15is/g+b?EcZ=FE+*j%+Co1rFD5Z2@<-W9BlbD=BOr<*F`\a:Bk)7!
Df0!(Gmt*kBk/>?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bEb/[$Bl7Q+DIn#7A8,OqBl@ltEbT*+/e&.S
AS,k$AKYi.A8,Y$Bl7Q+FD,5.@rH7,ASuU2+E(j7@;^?5A8,OqBl@ltEd8dDATT;@+CfG'@<?''
@3BH!G9A)ODg<NLA8,OqBl@ltEd8d9DIal,@;BEsBlkJ>BOr<*F`\a:Bk)7!Df0!(GqKO5.1HVZ
67sBjCi=B++E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBjEb/[$AKWCCDg<c@$>sF!
A0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqI@;BEs.!0BQ.3N%AE-67FA8,OqBl@ltEd98H$7QDk
:-pQUDfB9*+EVOI/0Jb;@Us%n+CT.u+DbIq+>"^XDg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a
+?MV3FDlFICggd`ATf24@:CSn$4R>;67sBpDKBr@AKZ)5Gp$gB+ED%%A1r.IBlmnq$=n*sATT%B
;FNl>=&MUh74/NO%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!bFD5W*+CT.u+E2IFFD5W*+EqaEA90@4$;#+X
FD,5.Anc:,F<GX9@ruF'DBMLnF(&cn+A,Et+DGm>@3Bc4Eb$;6FDl2.B4W2oDIal1ATVs,AThKu
+EMgLFCf;A+<XEtG9D*@+CT;%+ED%%A9f;>D]gHIF`]&T@;]Tu-td+5.3N\MD.Oi6DfTB0/e&-s
$:\`MF*&O7Eb/[$AKZ&4D.Oi6DfTB0+EVNEF*)>@AM+E!.1HVZ67sBjEb/[$AKZ&4D.Oi6DfTB0
%17,aDId[&4ZX]M0ea_)0I/A,0H_K567sBuF_t]1Bk&9'Dfoq,$?Tj(F?MZ--Zj$9F!,1<+CQC7
ATMr9De:,6BOr<)DIjr0F`M%9FD,B+B.",qAo)BoFE9T++>P&i+=/-b0JF_+0JEqCF*VV3DesJX
3ZrK)+=A:MDI[6#D/XH++EqOABHUnuASc'uB.",q@W-L&A3Dsr4<cL&BeCM`+>XH6Eaa'(Df0!"
F$2Q,0eb:(.j-,\-pB\+/g)l&GUXbA+>kh^$?^6#@rGmh4ZX^.3ZoelBPDN1BlbD7Dg*=HDJ<U!
A7[+t$>!XUBK\C!-8%J)+<VdL+<VdL+<XEG/g,7E@qg$-@:XOmEafIbAU&01Bk(k!4ZX]B+?CW!
%15is/g+_ME,95uBlkJ@ATD5h$@![D/g,EK$7QDk%17;tEb'5S3ZpLF-ZWX5A8c<-FCf]=+D,G.
@<?Q5F*VV3DesJ;@W-L&A0>o$FD5Z2@;L!-F`(o'De*E%ART(^+D#e:Ch[BnF=.M)%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%14M&F`]&TBlbD=BOr;Y:IH=8Df'?"DIal3BOQ!*F*)>@ATJu<DfTB0/e&-s$<(AV
AKYE!A0>H(@<6!&FD,5.GAhM4F"SRX<+0QR+EMI<AKZ)/D.Oi3D]iP.DK]`3@q?d.Dfp)AASbs$
FD,*)+EV:.+EqaEA9/l,@<Q3)@V'+g+D#S%F(Jl)@V'.iEb-A4Ec5H!ARoLmB.aW#.1HUn$;No?
+ELt7AKZ28Eb'5#$?1-0+EqaEA9/1e%15is/g+_G@<6!&A7]@eDJ=3,Df0V*$>"6dF(HJ<DfTB0
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k:2b>!Eb0?5Bk;I!+EV:.+EMXCEb/c(GAhM4F!+n/A0>AqARfKu
FD,*)+EV:.Gp$O9AKYr4DfB9.Cj@.DATMs3Eb/c6%14Nn$;No?+D58-+EqaEA9/1eB4Z0-GAhM4
Et&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l36uQRXD.RU,@<?4%DBLYf0b"IcDIjr/Aftr9+E1n6+E1n'G%G_;
BlbD>DIdZqF_t]-FCeu*@rGmh+Unbf$:o)Z+E(k6ASrW(@<Q3)H#IgJBOPEoFDi:6@:NjkBQ\3'
Eb/d&/0Je<H"(>-FD,T8F(&rsF"AGPAfto(DIml3De:,%De*E%GA2/4+DtV.Gp$N<@rH4$ASuT4
Bl5&7BkM+$/g*N"D/Ej%FE8R5Eb-A2Dfd+6DfQtEBl.g1+CT.u+D5D/Cj@ULASs+C<+Tl^Bl7Q+
@rH4$ASuU2+CT;%+CQC+@;Kas@<--+De:,)Df9//@rGmh/e&-s$;+)^+E2@>G%kJuF!+m6DKTf*
ATAo3Afu;+H#k*MD]iS/@s)X"DKI"FDfTB0/g+5/ASrW!+EqaEA0>T-+DG_8Ec5K2@qB0nBlk_D
+CQC*Df9//Bk1d`+EVNEF*)>@AKYD(F(fK4F<GL>AKYf'DIjr$ATM@%BlJ0.Df-\9Afu2/AKZ28
Eb$d3$7QDk:-pQUF*)>@AKZ&-DfTqBGAhM4+Co&)@rc:&FD5Z2Et&I1+?1K_F`\`REa`irDf$j`
-ZWX5A8c<-Bl8$(B4Z*+FCAWpAL@oo%14d33$<0_F<DrB@:Nsu4""HUE,96"F!,:1Aoo/(EbBN3
ASuT4FDi:1EcPT6+DGq/D0%'6$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqKAftT%F`MP7+F.mJ+Ceht+EhI1
G9D0LF`JUGFDl22A0>DoF(96)E-,f4DK?qEBln#2-td+5.4u&:.1HVZ67sBnATT&9BQ%p5+D#e:
Cgh3iFD5Z2Et&I1+?1KVATT%BEa`irDf$j`-Y6^rBI=5r%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15gJEb-A(
ATV?pCh7-"A8bt#D.RU,@<?4%DBNFtDBND"+EMXCEb/c(@;]TuEb0?5Bk;I!A1f!(BPDN1F*(u4
+Dbt)A9/l%+ED%%Ch[s4Bk&8sG[YH.Ch4`-Afu;9Eb$;'De!p,ASuTuFD5Z2+DG_8D]j.8AKYK*
EcP`/F<GOFF<G+.@ruF'DIIR2+CT.u+EV:.DBNJ(F)Yr(H#k*PBln#2-tI%5E%*CK$4R=jA8-+(
.3N>G+CQBb:IH=JFD5Q*FEoJ]+A$YtBlbD=BOr<)DJXS@G%G]'+EV:*F<GU8FEMVAEt&Ib+Cf(n
Ea`I"ATAo0BleA=.!K?9DBO"C@q0(kF(TQ2.3N>BF*(u%A0>f&+EV:.+E_aJ@;I&qDg5i(+=M8?
4*G%KF_*!2$7QDk:-pQUCi<`mF!)l@BOPdkATMs6.3N&:A0<:1BOPdkATMs6.3N/>@s)X"DKK</
Bl@l3Bl8$2+EV:.+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W&$?K]tBlJ/:-[oK7A8c@,>\@VcATD3q
>\\1f>\\1fCggdo>\mhXAU%X#E,9)>0JP1oC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBPDN1F*(u4
F!,"-F)Yr(H#k*MBOr<&Df021A8bt#D.RU,+Dbt)A7]9oBl5&8BOr<*Eb0E.Dfp+DF*(u4/e&.:
%15is/g,4KDg*=?Df021A8bt#D.RU,@<?4%D@Hq,+?:QTBle59-Y$guDJ*O%FE/`<$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMYlEb-A4F`__>DJ()#DIal&ATW$.DJ(R2$7Kk9F=A>@DIak<B4Z06+CT;%+E;O<
FCcS,Ch7j*@VfTu@;]Tu@ps6tF*)>@AKYQ%FD5c,+Dbt+@;KLr/g)99BOr<&De!3lATJu(@;[2s
AKYl!D.R6#DfQt<F_tT!Eb/c6%14Nn$;No?+ELt7AKZ).AKWC0C2[X"@;BF'+Dbt+@;KL.@r,Rp
F!,17+<koGGp3\)-Xgb.A8PajALAU>F`\aPH9F;3DJWZgC2[X"@;BF]+DEGN1^sd$$;No?+ED%8
EbT*.AKZ).AKWC0C2[X"@;BF'+EqaEA9/l-DKKe>@;[28G^+H\+Dbt+@;KKa$7C(CGUFVHATT&@
H4:2j$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;e9BX@q]RoB-:f)EZfREEb'5#$;>/LAKYi.F*&OGFDl2.B4W3,
H#n(=D0$gl:IH=EEc6,8A7]g)Amo1`Ch\!*ATJu+DfQtAARTUhBPD?s+EV:.+Cf>-FCf?3F!,C5
+DGq=+Cno&@:EYdAM+E!%16'JAKYhuBl5&7ARTUhBHUf'D/E^!A0>T-+=Lc<CagJTA8,OqBl@lt
Ed8dF@;TQuCh[s4F"&^N$7QDk:-pQUCh[s4+CT)&+EV:.+EqaEA9/l3DBO%7AKYr#FD)e+AS5^p
DJ=!$+EqOABHS[5FXIV*Ch[s4+FPjbA8Z3+-Y.?I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-tI43.3N,/
DBO"3@<,jk+D,P4+EqaEA90:EFCfN8F"AGHEc6)>F"AGTF_Pr/F!+n/A0>_t@rcL//g)99BPDN1
F*(u4+CfG'@<?(%+EMI<AKYW+Dfp#?+CT.u+EV:.DBNb0F*)IG@;Ka&FD,5.B6%p5E-!.?DBO%7
AKYr#FD)e=BOQ!*@V'1dDBO.;FD)dE8l%i&%14Nn$;No?+CfG'@<?''F)Po,+D5_5F`;C2$>4Bu
+=D5PEbTE(F!j$s@q]:gB4Z.+E[M;'B6%r6-Z!^2FCfN8-Tc3^?X[\fA8PajAR?Qo/i4"E%15is
/g+eIDfp#?+C\npBl7g&DJ()9Bln#2-Z!^2-OgD<+>G!LDJUFCCi<f2%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-\!BOQ!*@<,p%FD,6,AKYT-DJj_B@<-"'D.RU,+Du==@V'S$57IrdGp%!CG9D0LFWb@+G%De8
Ec5Dq@Vg<4DJsW2@qB0nFD,*)+DkP)Gp#^T6m,uXD/E^!A9/l8@;BEsBl8$(B4Z*+@<-"'D.RU,
F"SRX8l%ht@<-"'D.RU,+Cf>#ATJu&Eb-A3AftPkF(o,mCi"A>FD,]+AKZ)?E+O)A+E(_(ARfg)
@rGmhF"AGPE-,f4DBNG-A7]g)@;]TuEHP]+BkD'jEcWiB$4R>ABOr<)@VTIaFE8Qs:IH=HFDl22
F!+n/A0>o(FE2),G%G_;@;Ka&BOQ'q+E(_(ARfg)@rGmhF"SRX<+ohcDIn'7+EV%$Ch4`"Ble60
@<lo:8l%htDdmHm@rri'De*F#%14Nn$;No?+A,Et+E(_(ARfg)@rGmhEt&I)4<cI%BeCMd.3L/o
+?MV3=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]&6qKaF8P`)I;HY@V$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqKE-,f4DBNA*A0>l7@;KXiBk;<-@rGmhF!,O8Ch7*u+CT.u+Dl%-BkDW5DfBf4Df0VK+<XWs
AU,D,Eb-A%Cht5.DKKH&ATDiE+@^9i+Dl%;AKY])AoD^,@<?4%DBN@sDfp.E@<-"'D.RU,+Cf>#
ATJu7ART*l8l%i&F!,C=Ch[cu+CoD#F_t]-FCB9*Df.0:$4R>;Dg*=?Df9D6@<<W5Df'&.D/XH+
+=Lc<CagK:Df'?"DIdf@%14Nn$;No?+=LlCDfp"M+E)4@Bl@l30d&%jD..NrBHV87AS,Y$.3L2b
@psFi+DkP/FCfK6%14j50d("EC`k*A-OgCl$;No?+=M)8@rcK=+E)4@Bl@l31*A.kDIIBn+Cf>-
FCAm$F!,OGEbTE(.3L2bDJpY7@:O=rF!,a>F:AR6+>P'MDJUFC@<*_)$4R>;67sBt@;BEs@3BDq
@rcK1@;]TuF(Jd#@qZunB45Ll%14p7E-67F-Xh%9B4rYS8lJ)T8PiAn@;9^k?TTW167sBtGp$X9
+Du+>BPD?s+A*bn@:O=r-OgCl$8`k\+CoA++=CT<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37riNjE-!.1
DIal2F_Pr/Et&IK:IH=EEc6,8A7]g)@3BW*D/a<&+Eq7>+EVNEB6%p5E$0@CEb'56@;]TuFCfN8
F"SRX5p0f\Dfp"ABlbD*+Cf>+Ch7*uBl@l3De:+a+EqaEA90@G+@.,kF_Pr/+DGm>@3B&uCi!Zm
FD5Z2+E(j78g&4eF*&OG@rc:&FE9&W+B`W*+CfG'@<?''@;]TuD/Ws!ApGM3Ec6)>F!+n/A0>r9
Blmp-+EqOABHVD1AKWC6Ec<HMG%G]'/e&.:%15is/g+YEART[l+CQC*Ec6)>+E(j7GAhM4F!,[@
FD)e7@;TRs+C\npBl7g&DJ()9Bln#2-Y$g;%16`gE$-NMATMs+Ec6)>-QkJnI4cXQDJUFC@q[5!
$4R>;67sBjEb/[$AKYD(FCfN8%14g4E-67F-YR(-Ci=N9Ebo864!ua*>9G:@8l%htFCfN8F!+n3
AKXSfF(96)E--.DFD,*)+ED%8F`M@B0ln]i-OgCl$;No?+CfG'@<?''@3BZ'F*&OGF_Pr/+>"^R
DffP5Ch74#+CT;'F_t]-F<G(3A7Z2W1E^=NE$-NMATMs7F_Pr/-QkJnI4cWs+CoA++=ANG$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'D@HqUDfm14@;[3(BleA=FD,5.@rH7,ASuU2+E(j7B6%p5E-!.?EZfFGBlmp-
+EqOABHS^9Ec<H:$7QDk:-pQUCh[s4+Cf>-FCf?3F!,C5+EV19FD#W4F`8I9Ec6)>%16`gE$-NM
ATMs+Ec6)>-OgCl$;No?+Cf>-FCf?3F!,C5+EV19FE;S=FCd!GDJsW.+EM[>FCcS)De*E%Ch74#
+CT;'F_t]-F:AR5+D5_6+=D8BF*)JGBlmo6%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@;BRpB-:i-Dfp#?
+CT.u+EM[>FCfM&$;YPN+E(j7FD,5.D..-r+CSf(@;^0qB4Z-,De:,5FDl26DJ((a+Cf>#AKY])
+A,Et+EhfY+CQC3Cgh$q+EM%5BlJ/:BlbD=BOQ!*H#IgJ@ps6tD..-rFCAm$+CQBk8PVcL73Hbb
EcYr5DBNk0+CQC:DfTA>+EV19F=\PIEc6)>+E)9CF*22=AKYE!A0>u-ASrW'ASu("@<?''D..=-
+A*bmDdd0!F(96)E--.DFD,*)+E_a:+Co1rFD5Z2@<-W9DdmHm@rucE+@KX[@:EYdAKYMpF(o9)
ATDi7@ps1i+EV:2F!)ZFDIjr6ATDj+Df-\9Afu2/AKZ)8F`_:L+q4kg$<1\M+D,P.Ci=N3DJ()+
DKBB0FE8R5+EM77B5D-%GAhM4+DG^9.!0BQ.3N8DDfp#?+CT.u+EV:.DBNS'DImisFCfM9F(96)
E--.R%14Nn$;No?+DbV$F<G=@F*),.Gp%3;@VfTuG%G]'%16odF`VXf3[Z$t-6tVp3[e8VHnHUM
0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>;67sC%FDl22+DG^9E-67FA8,OqBl@ltEd8*$E-67F-Z!O?
F*&c=$4R>;67sBpDKBB0F<G:8+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$7L<T+>P'[AThu7
-RU>c@:Wn]Ec<?h+?V#fC3=T>-OgCl$;No?+Dbt7CNXS=-urmBD^cfCDBN\4A1hh3Afu;3FD)dF
C2[WrASc<7%13OO:-pQUB4YslEaa'$+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$8<T>Ci^pe
+FPjb1*CUKG&J`U%13OO:-pQUBkAK0BOr<&AS-$,@<-"'D.RU,+DGm>ASc'kARlp*BOr<!Ec6)>
F!+n3AKYhuA7ZltDKKe>-u<g1A18XB@rc:&FE7lu:-pQUD/=8?4s58++>P'[AThu>-OgCl$;No?
+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
9OVBQ;e9H\Bl@l39jqOPDfZ?p<+0i`F"AGMBkq9&F`:l"FD5W*+D58'ATD4$ARlp)@rc:&FE8uU
@ps6t@V$['Bl.g*BkD'jA0?)1FD)dh:IH=B@:O=rF"SRX5p/cq6m->T@rcK1BlbD*DBNA.@VKq)
@<-W98g&1bEbTK7+EV:*F<G(%DBND"+D,2,@q]Fa+CT.u+D#e/@s)m)A0?)1FD)dFEc!6X%14Nn
$;No?+DkOsEc3(BBOQ!*B4YslEaa'$F!+n-C`m\>F<G+.@ruF'DIIR2+D5_5F`;C2$>OKiD.-pp
D`p-(-Vcu\+D58'ATD4$AKYDtC`m\>F<G+.@ruF'DIIR2+D5_5F`;CL/5/Ma-SQZ[Ci^pe+FPjb
1*CUKG&J`U-RU#a%13OO:-pQUF*)>@AKYhu@rcK1/KePAA7Zl=0d(RLCi"/88l%htFD,B0+DGm>
@3A/bF(96)E-)Nr1a$a[F<DrJ@;BFnF`_8:E-!Bg1,1k*De*]n@rcJs$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqNF`))2DJ()#+A,Et+DkOsEc3(7F!+m6F(oK1Ch4`+@<?U&EZf:4+E)41DJ=!$+EV:.+CT5.
Ec5o;Bjl*p+Co1rFD5Z2@<-'nF!+n/A0?#9Bl7Q+-us/R+>"^VF`&==@:O=r/e&.:%15is/g+b;
FCSu,@;]TuAU%crF`_1;%17,m+=D#7CLqI-FD#W5F!hD(%15is/g+b;FCSu,@;]TuAU%crF`_1;
F(oH%DKK]?+>"^[Bl%T.Df0B:+Co2-E,8s.+D#e:Ch[BnFEo!=De*E%Dfp/@F`\'":-pQU0d(LR
+=D#7CLqI-FD#W5F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15g<@rcL/+CT;%+Du+>+ED%7FE2)*FCeu*
FDi9o+EM%5BlJ08/g)9>Dfm14@;[2rCiaM;F*)>@AKXNC9h[)\9OUn3==bRs9h[)\<(0ng/0IYQ
;G0DR=&(:h<E)FI+CT.u+@94173HY]EbTK7F!,17+A,Et+Co1rFD5Z2@<-'nF"SRX:Msuo+A*bt
@rc:&FE8R7@;[2sAKZ#9DBNV2G@br/E\7e..1HVZ67sC%FDl22+A?3CAQU''1,::$@;]Tu85r;W
+=K!$.3N_DG]\!9$8`lEF`\`RCghEsGUGR.1-6j9/hS8?@8pf?+Cf>#AKWTX/gh)8%14p7E-67F
-YRU=CaV;"1HQs,/hSb!85r;W+Cf>#AKWTX/gh)8%15is/g,4WDfTD3=A;I3@;]Tu@<,gkFE1f1
Gp$'T=B$Ck@X3',F"&^N$8`lEF`\`RG\q7E4'53N?X[\fA7%DG4EP.UF?Xe[BlbD2F!,:-D.Oi7
D/;<fFCfN84spdH%15is/g*J`<(.pDF!,UCBl8$(Ec?&1FCeu*@X3',F!+n/A0>AjDBO"BDfTD3
@VK^gEbT*++>"^RDfd+BARfXqD.RTqARloqDfQt:@<-!l+D,>(ATKI5$8`lEF`\`R6:jp"4#/]U
Eb/Zi?X[\fA7$HoE+*j%+=DVHA7TUrF'N?hDImisCg:^nA6`kd@<6O%E\;'@Ag\#p%15is/g+VK
FCcS9BmO>5De:,/@:O=r%14p70f:(dATT%B6:jp"%13OO:-pQUD.-ppD]j.5G]Y'MH#R>9+CT;%
+Cf>-FCB'/F!,17+EV:.+DkP$DBMPI6m,uU@<6K!$;+5a;Fs\a?X[\fA7$l19L2WH=C5KODe*3+
+@oI+9OD4CDe*3++BV?3?X[\fA7$l1<(0ng?X[\fA7$l16<R8V?X[\fA7$l19gMZM6r-lZ?X[\f
A7$l1<E)FI?X[\fA7#cQ%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A8,po+Co1rFD5Z2@<-W9A9Da.+EM%5
BlJ/'$<1pdA7]UrDKBo?@<?''DffZ(EZdtM6m-)Q@<?X4ATJu<AKYl%ARlp)Df'&.GAhM4F!,17
+E)CC+Co1rFD5Z2@<-WG+<XWsAKYl%G]Y'LFCfD6Ci<`mF!)lI@:EbiD/_+AC3(gV%14Nn$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'D@HqHDdd0!CggcqA8,OqBl@ltEd8d<F_u(?F(96)E-*]A$7QDk:-pQUBl8!7
Eb-A'DfTl0@rri4@<?/l$?'Gt4$"a2Dg<IA@:EbYFs(U0@OE:&+>Y-YA0<6I%13OO:-pQUCi<`m
+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm@WO2=@:Ebi
D/_+AC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq@F_u(?F(96)E--.DA8`T.Dfd+CFDl22+EqaEA0>o(
An?!oDI[7!/g)99BOuH3D09oA+C\n)B4YslEaa'$A1e;u.1HVZ67sC'E+EC!AKZ28Eb$;5AS,Lo
ASu!hF!*%WF(fK9+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D^QnA$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMGcDdm-k+ED%*ATD@"@qB]j$;+)^+D>2)+D,%lBl%L*Bk;?.AoD]4@psCu
H"h//+E)CE+EMX5FD55-DIIBn+CT.rCjC)9F!,C=+A*c#DfTB0+CT.u+EV19FE9&D$4R>ABOr;7
B5DKqF"&5?DIak<F`V,8.3NeFEaj)4@;]LiH$X$E@;]TuF*)>@AKYl!D.Oi1AS,LoASu!hF"Rn/
.1HVZ67sBhDII@,H=\4:@;TRs%16`ZF<DrAF*(i4-OgCl$;No?+Cf4rF)u&-Gp%!5D.Oi4F(HJ.
DBNCsF(HJ1De!3lAKZ28Eb#Ud0eje`Ci<d(+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=`8F*
@ps6tF`:l"FCcS-Ci<ckC`mq?Eb$;5AS,LoASu!hF"Rn/.1HVZ67sB7+DGm>FD,5.GAhM4+Cf>#
AKWQIF*)>@ATJu,Ci<ckC`mb0An?!oDI[7!%14d3B5DKqF!)i@F*(i4-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$7L%<ATK:CEb0?5Bk;I!F!,OGDfTE"+ED%*ATD@"@qB^6%14Nn$;No?+D5M/@UX'qEb/io
Eb0,uATJu+DfQsKA92j$F=@Y+F`V,8+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k.!9TBF"&5@
ARfXqATJu;ATE&=,'@s<Ap%o6+EqL1DBNA(C`mq?Eb'56BOQ'q+EMXCEb/c(Eb/ioEb0,uATKI5
$7QDk:-pQUBl8!7Eb-A8Dg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a+?MV3FDlFICggd`ATf24
@:CT,>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@ps6tEb0?8Ec*":@;^?5Eb/io
Eb0,uAKYf'F*)IG@<<W1DI[61+B3#c+ELt.AKYr#FD)e<ARTUhBHV/'@q]:gBle,6BlbD>F(Jl)
AoD]4Eb0?5Bk;I%DJ()4AS,LoASu!hF"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!+E(j7GAhM4
F!+q'B5)7$Bl7Q+GA2/4+=D"R%15is/g,:XATJuB/g+\BC`k*B-OgCl$;No?+D5M/@UX'qEb/io
Eb0,uATJu4Afu;9Eb'56ASu$mDJ()9Bln#2-Z^XE$?^E$F!,l`+>=oo+CoA+-Z^XE$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMnlAKZ,:ATJu:DJ=$,%15mMFD5Z2+>Y_pDe:+?F`V,8.3NYBFEMVAF!,R<AKZ,:
ATKGGDJ=$,+E(j7@3Bc4Eb$dF+B3#c+E_a:F"MNPBl@l3BlbD+@<6-m@;Kb*+CQC8DJ=*5AKYf'
F*&O5Cht59BOr<1DfTB0+E)-?FD,5.@ps1i+EVX8AKYo'+CQC:DfTA@%14Nn$;No?+E_a:F!,UC
Bl@l3De:,6GAeUJDfTB0%14mG+E_a:F!*P*-Y$S$D/X?1F!,OHDK9H4ATMF)0II;:%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@g!\ATD4$Bl7Q+Ci<`m+EM%5BlJ08%15^'6m,uJDBNS'DImisFCcRe+Dbt)A0>r'
EbTK7F!,(8Df$V-Bk)7!Df0!(Gp$a?Dfp#?/g)99BOr<!ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?
FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+EM%5BlJ/:F*1r&Bl[cpFDl2F/e&.:%15is/g+e<
DImisFCcS2Ddd0!F(96)E-)NrD/=89-ZaEJD/X?1-QjNS:-pQUF*2@RD/X?1+ED1;AKZ&*F:AQd
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@ku$>jU#+CT5.ASu%"+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYK*EcP`/
F<G^IATB/>+EMX5EccGC/no'A+D,>(AKZ&4+EV:.Gp$U*DBND"+Dbt)A7]9oBl7HmE+NotASuU+
Gp%$;+A,Et/e&-s$;PM]ANCrNCi^_?@rc:&FE8R5Eb-A%A7T7^+EVNE:fThU8OHj"?Qa9-+Ad2i
Ch[BdC0r)qDfQtBBOr;rF`MM6DKI"DF(KAE%14Nn$;No?+Dbt)A0>MrDImisFCeu*F(96)E-)Nr
Ci<`m+=D5QDJa<1DC5l#%16TRCi+*/DK?pU0JPF-+AP6U+D,b4C`k,\.3KaADIal-ATo7F0I\,]
Df9N7+DG^91,(F?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;8*EbTK7F!,C=+Co&#@;]Tb
$;+)^+Ceht+CT)-D]i\(DImisFCcS'DIal+Ddd0!F(96)E--.DGA2/4Dfp.E@rc-hFD5W*+Dbt)
A0>r'EbTK7F"Rn/.1HVZ67sBsDdd0!@UX=l@j#i7@<?4)FD56++D5_5F`7csChFk<@WQX"FE8f=
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@Hq$B4Z1*GUXbODdd0t+CT)&+EV:.+EqaEA9/l'@;KakA0>?,+CQC*
Bm+'*+EqaEA1e;u.1HVZ67sBsDdd0!@;Ka&GAhM4F!,@3ARlp*D]j(CDBL?<F*(i4.1HVsATVs;
+=C]@FCB8=%13OO%15is/g+tK@:UKpDKKe>@<,gkFE1f1Gp$pA@ps1bEt&IO67sB.F*(i4Ci<f2
+D58-Ed/]SA92j$F=.M):-pQU-TO17+D58-Ed/]SA92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@9LH
CM@[!+E_WG@;]TuEb0<6DfTQ0B-:`!@ruF'DIIR"ATJ:f8l%htBlbD-@<>pe@<6!&AoD]48g&=r
Eb'5B+EM%5BlJ08+CT.u+E)@8ATAo4Eb/`pDfp+DE,ol0Ea`f-FCf]=F"SRX9lG)p+Cno&@:EYd
AKZ&>F*(u1F!,.)G%De5ARTIt+D,P4+C\bhCM@[!+E_WG@;]TuEb0<6DfTQ0B-:_nFCAWeF(KD8
@;]Tu8l%htA8c%#+CT=6G@bT,/g)99BOr;7E+*6lA18XEATD6&@UWb^F`;CEF`8I3+Cno&@:EYd
AM+E!.1HVZ67sC%@<Q3)@3B#f@r$4++E(j7FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8*$E+*6l
A0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$E+*6lA18X2DfBE%F!,R<AKYK*EcP`/F<G+.@ruF'
DIIR2+D,>(ATJu9D]j.8AKYGj@r$4++EM[7A8-'q@ruX0Gp$O5A0>i3AS,Y$ATJu&Cht59BOr;u
Bl%@%+EqOABHU_+F`(o5F_)\,G%G\:Bl7F$ARTXoDJ()$@:O(qE$0%@D.7's/e&.:%15is/g+tE
F*&ODF`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATJ:f6:=CC4ZX^43dWJ%+@K$l<(LA';cI+28l%in
@VR#.+AP6U+E2IF+Co2,ARfh#Ed8*$A8-',6:"7O?U@.P;Cj1F/no'4-QjNS+<VdL+<VdL+AP6U
+C\bhCNXS=Anc'mEt&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kq+F*(qA+ED%7FDl22F!,R<AKYetF*&O6
@:O(qE$/V8+EM+1ARfgrDJ()$@:O(qE$/b,Ch7Z1GA2/4+EV:.+D>J%BOu7,+E2@4AncKB%14Nn
$;No?+ED%7FDl22+DbJ-F<G%$@r$4+%17,eF*(q8-Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgO
DJ()#+EM%5BlJ/:A9Da.%14M&@:O(`.3N,@ART[lF!+q+DIIR2+C\bhCNXT;/g)9>Dfm14@;[2r
CiaM;@UWb^F`8I6Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.R+<X'pD/^V=@rc:&FE8R5Eb-A7
Bl7R"AKXSfF(96)E--.DFD,*)+Ceht+C\n)F`V,)+EVNE@UWb^F`8lS@rH=3+CT.u+Dk\1B4W2r
Bk)7!Df0!(Bk;?<%14Nn$;No?+CoV3E$/S*C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*@<3Q"+EM77
B5D-%A9Da.+EM%5BlJ/H%172qH";&7E'66)F(fK9E+*g/?X[\fA7$Hr@;BEs-RT?1%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%160MASrW7AKYf-@:UK/FDlG8F_u(H+DG_8D]iI2DIn#7A8,OqBl@ltEd8dG@WQ+$
G%De0Dg*=GBOr<*@<?0*BlbD,BOPdkARmD9<+ohcA8,OqBl@ltEbT*++D>2,AKYGnASrW-ATDEp
A1e;u.1HVZ67sBuATo8-Bk)7!Df0!(Gmt*uATqZ--ZEm1H#R>4-QlV91E^UH+=ANG$4R>;67sC!
E+Nnr$?'Gt-ZEm1H#R>4-OgCl$;No?+Dbt)A0<:BDg>l9D/^p5$8<Va0H`J#4*s"2FDlG8F_u(,
$4R>;67sBkBk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37VQaK
C`mq?Eb'5#$<_:i+Du+A+D>2,AKZ&4D.Oi(A7]0lDe:,9BOQ!*8l%htBlbD*Cht5&@W-C2/g+,3
+DbUtEc*":DfTD3Eb/Zi+A,Et-Z^D@De!p,ASuTuFD5Z2+CT.u+EDUB+EV:.+E)@8ATAnc:IH=A
@:F:1+A$/fH#IgJBOQ'q+CT/5+E2@>@VfUmF"AGRF_,W9Bl@m1+E)9C@rH4'Cgh$qFE8RDCh7$r
AKYQ$@;0O#D.OhuF<G%$CLqO$A2uY8B5M'kCbB49D%-g]$;,5MDBM8SCLqMq$=[FZATDNr3B9?;
D..-p/n8g:%15g<Earc*1,(FB%14Nn$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%14m6
De't<-OgCl$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dHEc5Q(
Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<@rc:&
F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(@;TQu
C2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUmEZee,
C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2AKZ,:
ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'DKIK?
$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+DIjq5
8l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ<)#e/
F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&F_,H4
Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XADBNM8
Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"
AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;
Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8E]P=8
DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9+EqL5
FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%F_r7?EbTE5+E2@4
@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<0d'[C3"63($;No?
+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14DKU1WD.-p-BlA&%
$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+D/XH+
+EV:*DBNk8AKXT@6m-2]F*(i.@q?)VA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\
+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn
@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24
Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"
GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et
+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu
4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?
+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%15is
/g+4d78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y
:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y
3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d8l%i/0KhH>+=D&F
+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7
EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]
Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@L
G[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T
8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_r
ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?
G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6
Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8
;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4
ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3
EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq
-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!
4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?
+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]
/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk
+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9
Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is
/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^HDe3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7
Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&==@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95u
F<GXADfp/@F`\'"EcXB)+>G3`D%-g]$;No?+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&Ii
B0A9u><3m?CiF9.+BplLI4cXTEc;HpBQH<t+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4K
DfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL
+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG
/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZ
A8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)M
AThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUh
BHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]TuCh[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;
+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaEA0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*
Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL
+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)
+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNSA8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7
I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFVi
ATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%
8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]Lq
Bl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'
AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/m
AU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</R
C`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<GijAnc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO
:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d
+>Y-$+>=63BkAt?@UWef@p`YZDe*2tDETTpEb0E4+=ANZA8a(CDBNt2FEMVA/g+_CA1e;u-uLRg
F"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pi4YD.8D@Hq%%13OO:-pQUBOPdhGp$U5+CoD#+D>>&
E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!)
:IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j
+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=
@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+D#(t
F<G(3D/E^!A0;<g6r-0M9gqfV6VgEN5u'g23ZoekBQ&*6@<6K4E,m'K-[U;;IXNRk-OgCl$;No?
+ED%%A0<3AGB.D>AKYT!Ch7Ys$?B]dA3Dt.+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL
3\_d=1*Bk14?tMI1GU:@5U\E33\W!3%17,e@:X7oF`'?'1Eee75U\?13\_s0?!oc[/grM2-9a[C
1Eee5.4H\p%17<"Blmp(Dfoq\3[e2n+>Y0%0d'[L+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+.4HBF
%13OO:-pQUEb/Zi+B1Wn+Co&"Bl.R+ARlp*@:F%a+D,>(ATJtG+D,&'FCfJ8FD,*#+=M8A@:XIj
.3L2bF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>%17,e@:XIj1-I[&3ZpOH/mg@\4s276HXSNU
+=nil5(4VY3ZpOH/mg@V><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[*G0f+/b
/h%np/q+ot+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%13OO:-pQUGB.D>ATJu9@:F%aF!+n4+B1Wn
+Co&"Bl.R+ARloW7NceaEc#N.@<?'k+EV1>F<E.XF(Jo*Ci=3(+CoD#F_t]-F<G:8+=MASBl%i>
%17<"Blmp.A26;/>p(OM+Z_A$?!oc[/grM2-9a[C1Eee5.4H]p+BplL-sJ_T-s[rH+=JWm0RI4\
.3`+A4Wo)4.3O$k+=JruHXSNU,$ucA><3mT/jLg95U\?6-nHPs.6o:5/jLg7/h^H^+u)>24XMO!
-U:rd.4H\g,9SO&-n$f(HXSNU-7CDh0e#@n.4HBD3Zri'+u(3E3ZpL.0d%l)HXSNU-7hD+3[QIC
.3Mh($4R>;67sBmATVEq+D#(tF<G[:G]YTU@:O=rEt&IuF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM
4!80X+<Ve%67sB1/p)>[%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"
?Q_EQB657=+AP6U+=]!\@<--oDg-(.$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is
/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/
+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,
%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p
+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is
/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<
F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?0F\?u$;No?+CoV3E$/\3Bm+&1/Kf1W
ARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5
BK@LM$4R>;67sBkF_u(?E+*j%F!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,
Eb0<'DKH<p:-pQU6rcrX:dJ&O4ZX]505>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]5
05>E905>E9E,p,4F_u)=0..29%15is/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6
F"&5K@:O=r+=L`9ARTUuF`]&TBkAK,Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?
+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh@rGk"EcP`/F<Dr?
@<6!-%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%WF(fK9Et&IO67sBo
Dg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=rEt&Hc$;No?+EM+9
+E_WG@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9oA8-+(CghT<%15is
/g)kkEbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs+EMCBB-;>=Bl%i<
+BosE+E(d5-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5-RT?1C2[X*F(KB%
Df00$B4>:b1,2Nj/h1USA9Ds)Eas$*Anbme@;@!,/M/)VG[YH.Ch4_]:IH=JF(KA7@rH6sBkMR/
@<?4%DBO"1EbTK7/e&._67r]S:-pQU<+oue+<Y`8EbTK7+DGm>+D#e/@s)m)A0>>mAoD^$+A,Et
+E(_(ARfh'+<Y*5AKYK'ART[lA1eurF:ARP67sBj@;[2sAKZ,:ARlp*D]j(3A7]@eDIjr!DIal"
F`VYCD/"<-+Eh16BlA-8+Cf4rF)rIADfor=/g+,3%15is/g,">CLnV2FD,B0+EM%5BlJ/:+CSc%
Bm+&1+ED%2@;TQuBlkJ>D]ie5A9Ds)Eas$*Anbm1Bkh]3@;]Tb$;No?+Cf>/Gp$gC/0K.NFD)eB
Dfp(CARoLsF"AGUD]j.8AKYhuBl5&.De'u$Bl[cpFDl2F3XlEk67r]S:-pQUIUQbtDf0W$B4Ysl
Ea`chC2[Vl$;No?%15is/g+,,AKYl/F`)7CCh[s4ARlomASc:/+CT;%+D5V2A0>AjDIdHl@<?(%
+D,P4+ED%(AS,XoBln'-DCuA*%15is/g,4PDfp/@F`\`RC2[X*F(KB%Df00$B.dn5F!,%=ARfk)
Bl7Q+/hSb(%13OO:-pQU:ddbqEb/ZiATAo-DBN\4A9E!.C`m5(@<6K4/KePGEcP`/F<GX9FED57
B-:o0+EV:.+Co%q@<HC.+Co2,ARfh#Ed8*$:-pQUAoD]4FD,5.=(uP_Dg-7FG%G]8Bl@l3De:+X
A8bpg+AucZA7]d6+AuclATT&,DfQt=FD,6++AbHq+ED%%A7]e&%15is/g*tY7T)Z@6q(!\@;9^k
F`_>6?TgFt6TSIKEc5T2@;R,VBl%@%+=MIo2CVlsA8bpg>X;k?Ddm-s+AucZA7]d(6pk3WART+\
Ea1n?Ec4id1GURoG\&63$4R>;67sC$ATMF)+A+#&+AbHq+ED%%A7]d(FDi:=@<?!m+A,Et-Z^D,
6q/;>ART+\EZcqVA8`T&DfQsKC1D1"F)Pl+/nK9=.1HVZ67sBW6q1'c@:Wqi?YWq23Zq6e7T)Z@
6q(!\@;9^kF`_>6?O[>O$;No?+CT).ATDZsFD5o0+@g*`F*)J5EbTK7+Cf>,E+*j&@VfTuEb/Zi
ATA4e:-pQU:ddcN76s=1;I<jIDe+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*HBQ%s6B6A&rB6/61
ATqBlF*;8/G;D!,AU%c6%13OO:-pQU:i^,ZATDg&A0?)-@N]-#Dg-86EZf(6+DPh*F`_>6+Cf4r
F)rHU+Co%q@<HC.+BN8pA8c[5+@^'cAO^T_+Co2,ARfh#Ed8*$:-pQU='&HW?X[\fA9E!.CgT=d
-UTq":i^JeEa`f-7VQ[MF'MFXH>.23@3A$REb/j$G[+ipEb/j$GV3QPAL@oo%15is/g+)(@rH6q
@<-W9G@b5+@WHC2F(KA7Bl5&.De+!4Bl"o%CghC++>"^HAS,@nCige$Bl7I"GB4m;Bl[cpFDl2F
%15is/g+4s=#"&jC2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Zm8T&W]Ec,H1+@UNoCi=?*Ea21)
=AV[e;FN3,=@FSH$4R>;67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B
@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$;No?+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/
Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HVQ6pjaF;bp(U?X[\f
A9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,
D..3k6=FqL@nKNb<+U,mF##IF67sa)@;BF@@<6-m8l%iSATMs7+EK+d+DkP&AKXT@6m,rIF(o,,
FCfN8+EM%5BlJ/H%15is/e&._67sB[BPDN1F(96)E-*48ASu("@<?(%+CQC6@rc:&F<D]EAfu,&
DId[&Cj@.AEb&a%ARloU:IH=7@<6-m%15is/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)E-*3F
@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4p$;No?+=L]-F(HdCCi<flCh4`5Bln#28g#N9
+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/e&._67r]S:-pQU<+ohc+EM7CAKW*<De:+7+EV:.
+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(Gmt*U67sB/<(0_b6Vg]W<%0FB
+B2onFE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.%15is/g,%SD.7's
+E(j7FCfN8F!,17+EV:.+=LuCA7AtgBk)6rF*)IP+EM[>FCd'6$;No?%15is/g+SDF*2>2F#ja;
:-pQU+<V+#:-pQU+<WBf+@.,[Df00$B6A6+A0=JeA8-'q@ruX0Gp%Q.:IJ/N;cF25:-pQB$;No?
+Eh=:@UX@mD)re]D]j1DAKYN%3XlEk67r]S:-pQU+<XEG/g+e<DImisFCcS9@rc:&F:ARP67sB'
+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1:-pQU+<Y]A+=D#7CLoh@F(o,V:IJ/n
F*)IN%15is/g(T1:-pQU+<XEG/g,1WDBNY8%15is/g)8Z-nlf*1+=>.C2dU'BHS[O8l%iS78m/=
6=FqL@nKNb<+U,mF"V0AF!hD(:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp130f<]gCbRjY$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$>aWhA0<77De*s$F*(u6
-OgE"@;BFQD/X3$8l%iSATMs71,2Nj/h1^HCLpF]DeioV:IJ/nF*)IGF"JsdD..3k+A,Et+EMC<
CLnW1ATMr9F(96)E-*]>:-pQ?:-pQU<+oue+EM%5BlJ/:B4YslEaa'$F!+m6F(96)E-*3FDe:,4
@;]UoD/=J?DfTB"Eb/c(8l%htF)>i2AI;1!/g,7IF*)IU+B3#c+D58'ATD4$ARlo+F(96)E-*3F
@ps6t+C\n)+EDUB/0H'VFCB33Bl7Q+Bl5%9FD,4m:-pQU-t6V+ALSa<De!3lAKZ22FD)dh+=Joe
3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC$;No?$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.
ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1ARlo+@X/;U67sB/<(0_b6Vg]W<%0FB+B2on
FE8R5Eb-@9Eb03$@<?'k+DGF1+=L2X;cH+[<DHLB+D#e-AS#Cn+EV:.$;No?+Du==@V'R&De:,6
ATMs7+DG^9FD,5.-u*[2F)>i2ATVL)FE8lRF*22=AM+<b67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU
G%G]'@<?4#3XSVK/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130f<]g
CbRjV:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.;:@rGk"EcP`/F<Dr?@<6!-$>aWhA0<77De*s$F*(u6-OO^!DJ<]oF*)/8A25l7
67sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]ARfg)6tp.QBl@ltEd9#A$<BSn
;b9b[4ZXrE/ibOE3Ar5o$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8
Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[
%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2
De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMG
FEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKi
Cggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a
$:I<Z78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R
8g$o=C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172q
Deq$K8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!
FDl)6F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7
:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%ht
BlkJ3F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr
+A,Et6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</
Bl@l3AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m
+=Kg!AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]
6m-;S@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+C
ARuuV:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7
Df-\>D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$
Ec#6,Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6
BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f
+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn
;b9b[4ZX]50J5@<3B8rE%15R#9LM<I4ZXs'ASu("@;IT3De*Bs@s)X"DKI68$;aD^<(9Y]9iF29
-RT?19L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-p
FDl2F/p)>[%17&bAn5gi05>E9/oY?5%14Nn$;s;d76sj@4ZX]5-OgDN78lQO8PiAX:JO&6+>=p!
+>=638l%ht6uQRXD.RU,+Cf>-FCAm$F!)lGDe(J>A7d85GA(]#BHUi(@s)X"DKKqBFD,5.8l%ht
F*VhKASj%/$4R>3DfQt;DfTD3Bl7O$Ec#6,Bl@l3F(Jo*FD,5.8l%htGA1i,+E1b%ATJ:f-qS;g
D]hAhFEDG=.3NPL+EhI?BlkIsBOr;Y:IH=%@:s-o@<=O>$4R>UFEDJC3\N-pDII@,H=_23ARo4k
@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$4R>9@8pf?+CoD#F_t]-F<GXCF`Lu'+DGm>
@<Q'nCggdhAKYo/+@g-f89JAa@<=O>$4R>UFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[Wn
Dds4`%15^GBPnqZ@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%16r\DJ<]oF*)/8A92[3EarZ9
0ht%f+DkP)BkCptF<G16EZdtM6rQl];F<k^$:@*U<(Tk\4ZXr_:IH=$@VTIaF<Etc@ruF'DIIR2
+B*3$EarZ.%16-);H$._:-CWc0J5@<3B8uF%15R#9LM<I4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ
9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC
3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-
F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ6rQ60+>=p!+>=63B4YslEa`c;C2[Vl
$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0+Cf>-FCAm$F!,O8EbSruBmO?$+Co1r
FD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DAFD5Q4.4u`BBOu6r+CoV3E$043EbTK7
F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#
D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$@;0U%8l%ht@;]TuEb0&qFCeu*F*VhK
ASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(
Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1DBNtBDCuA*%15^'6m-PrF*(u1+Co1r
FD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$
A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr
/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"+EM+9+E_WGBl5&8GAeUJ@<loT%13OO
0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9F)Q2A
@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'
F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=D
BOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08/g;DI$6UH68l%htCggdo+CT;%
+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)jDflKr+<Ve;D]iq9F<GX9AKXT@6m-;S
@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE
@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%
DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$7QDk                        ~>
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
zz=:zz,'eadnoun readobid regd remast restd rv rxs saveobid second tc trimnl'
zz=:zz,' tslash2 tstamp uses valdate wex wrep write writenoun''),(<<;._1 '' j'
zz=:zz,'oddob BAKPFX DFILES DFPTRS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DI'
zz=:zz,'RVNS DSUBDIRS DTSIXCN ERR200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR'
zz=:zz,'206 ERR207 ERR208 ERR209 ERR210 ERR211 ERR212 HEADNMS OK200 OK201 R'
zz=:zz,'EFCN REFIX REFTS TEMPFX backnum copydirinv copyfile copyfiles creat'
zz=:zz,'edl dbakf dfclose dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropb'
zz=:zz,'akdir dropdir dropinv dropnc dropref gettstamps justdrvpath libstat'
zz=:zz,'us loadbakdir loaddir loadnc loadref loadstamps maxback movefile nu'
zz=:zz,'mmask packdict packspace puttstamps renamefiles restdict restspace '
zz=:zz,'savedir saveref tmpdatfile tmpusesfile volfree''),(<<;._1 '' jodmake '
zz=:zz,'DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR015'
zz=:zz,'1 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 E'
zz=:zz,'RR0160 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER '
zz=:zz,'OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWIT'
zz=:zz,'CH WRAPTMPWID btclfrcl clearso clfrbtcl createmk dec85 dumpdictdoc '
zz=:zz,'dumpdoc dumpgs dumpheader dumpntstamps dumptext dumptm dumptrailer '
zz=:zz,'dumpwords extscopes fap fmtdumptext fromascii85 getallts getascii85'
zz=:zz,' halfbits htclip jnb jscript jscriptdefs makedump makegs masknb nam'
zz=:zz,'ecats nlfrrle nounlrep opaqnames parsecode putallts rlefrnl sexpin '
zz=:zz,'sonl tabit toascii85 uqtsingle wraplinear wrdglobals writeijs wttex'
zz=:zz,'t''),(<<;._1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CN'
zz=:zz,'EXPLAIN CNLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINI'
zz=:zz,'T ERR050 ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ER'
zz=:zz,'R059 ERR060 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068'
zz=:zz,' ERR069 ERR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR'
zz=:zz,'079 ERR080 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 '
zz=:zz,'ERR089 ERR090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR0'
zz=:zz,'98 ERR099 ERR100 ERR101 ERR102 ERR103 ERR104 INVGROUPS INVMACROS IN'
zz=:zz,'VSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052 OK054 OK055'
zz=:zz,' OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 OK065 PATHTI'
zz=:zz,'T READSTATS afterlaststr allnlctn allnlpfx allnlsfx apptable appwor'
zz=:zz,'ds badcn bnlsearch bnums checkntstamp checkopen checkpath checkput '
zz=:zz,'closedict createst defwords delstuff delwordrefs didstats dnlsearch'
zz=:zz,' dupnames freedisk freedisklinux freediskmac freediskwin fullmonty '
zz=:zz,'getdicdoc getdocument getexplain getgstext getntstamp getobjects ge'
zz=:zz,'trefs gslistnl inputdict invappend invdelete invfetch invreplace is'
zz=:zz,'lib iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscr'
zz=:zz,'eate loadalldirs loadallrefs loadwords mainddir mnlsearch newdparms'
zz=:zz,' newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict p'
zz=:zz,'athnl pathref putdicdoc putexplain putgs putntstamp puttable puttex'
zz=:zz,'ts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub''),(<<;.'
zz=:zz,'_1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 '
zz=:zz,'ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES I'
zz=:zz,'zJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK'
zz=:zz,'00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING'
zz=:zz,'00400 WORDTESTS addgrp addloadscript addloadscript1 allnames allref'
zz=:zz,'s betweenidx createjodtools dayage delgrp firstcomment firstperiod '
zz=:zz,'fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames on'
zz=:zz,'lycomments pr refnames revonex today todayno updatepublic usedby yy'
zz=:zz,'yymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSON'
zz=:zz,'LY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 '
zz=:zz,'ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinte'
zz=:zz,'rface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK02'
zz=:zz,'51 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SC'
zz=:zz,'RIPTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj '
zz=:zz,'createut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 '
zz=:zz,'doctext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfr'
zz=:zz,'eader qt reb revo rm rtt textform2''                                '
zz=:6065{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C6+>P&q+>Y`,1E\Ru1,(XI+?(Dt2D?m/3$:"33&r*@+>Gl92]t%%0fC^?C2[WX67sB1C2[W*
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
9gMZM6r-lZ4ZY>W%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?
+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=
<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/
0F\@g78m/K3\_'N7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dK
ASbs$Eb/ioEb0,uAISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23u
A90dS=&2^^/6#&:<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F
<Cp.Y/58Dt;GR`/%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl
4ZZe.+>#2g><3lV/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*
@<,ddFCfJ8-6R89FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI
-OgDZ5u^BB85`AL3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(n
EcW@6AT23uA8,po+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O
-Rg00/jMH\+C-FE.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloq
Bl%?'DIIBnEt&IkF`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z
+=f&t>V7-q5u^BC78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2
Et&IO67sBqDe*p7F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*
F!,")Anc-oA0>T(+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'
6r6cW7QieIDe*p7F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[WnDdlI./g)WYDe*Bs
@N]/4/KeS<Eb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.4u&::-pQB
$;No?+@KpaARfh#Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlp-BOu'(A8,OqBl@ltEbT*++CT;%+E)41
DIm>f$;No?+CT.u+Co&)FE2;FARlp-BOu'(FD,62+CT;%+Cf5+F(Jl7+<X'dEb/a&DfU+GDdmHm
@ruc7@rH7,@;0Tg$;No?+CQC6ATT&5Aftu0F`)7C@;]TuG%G]'F!,R<@<<W/@;]LdAKWHTBkh6&
Anc'm+Co2,ARfh#EbT*+/e&._67r]S:-pQU8T&W]Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8Z
-uEC1Gp%!CF`)7C@<,p%Bl7HqEb/a&Cj@.1?QaB#An?!oDI[6g.1HVZ67sB'+Co(oCi=B++<VdL
+Cf5+F(HJ)Bk)7!Df0!(Gp$^5Ch4%_:-pQU+<Y3,DfB9*+<VdL+<YTAASrW$Bk)7!Df0!(Gp$^5
Ch4%_:-pQU+<Y3,E$-8G+<VdL+<Y3/Eb/a&DfU+GAnc'm+E1b2BQFUi:-pQU+<Y34@r<D3+<VdL
+<YQ1D.Oi.Aftr!Bl5&(Bl[cpFDl2F+Cf>,E,TW*DKI"=Dfoq,$;No?+<Ve;DJ=><+<VdL+<VeE
@;TQuDe:,/@;0U%A8-'q@ruX0Gp$g=A7^!.DJsZ8%15is/g)8ZA8Z9p+<VdL+<VdLDIIBn+E(j7
@r,RpF!,@=F`%Wq:-pQU+<Y34DJ^L=+<VdL+<YiAF(o*"AKYo#C1Ums+DtV)ATJ:f:-pQU+<Y38
DfB6$EZcJI+<Y69@<6!&A8-'q@ruX0Gp%!CF`)70$;No?+<Ve;Ec5o7@ium:+<Ve<Eaa$#+Cf4r
F)s!VH#R=;DJsZ8Et&IO67sB'+CoM2E,oN%+<VdL+D#S%F(HJ7AS,LoASu!h+Du+?DK?6o:-pQU
+<Y<.FEDSG@;Tt)+<Y]9@:XF%@rc-hFD5Z2+CT.u+DbJ-FDuAE+Cno&AKZ)/D.Rd1@;Tt)%15is
/g)8ZCi<`mA8-',+<VdLCi<`m+Co2,ARfh#Ed8*$:-pQU+<YK=@:X7c+<VdL+<YK=@:UL)DfTA2
@;]TuD.-ppD]iP+@<6KCFEqh:Et&IO67sB'+Dbt)A9)6n+<VdL+Dbt)A0>o(An?!oDI[7!%15is
/g)8ZCi<`mF*(i-E-!-ECi<`m+EV=7AKZ&9@;Tt)%15is/g)8ZE+*6lA8,Oq+<VdLE+*6lF!,"-
@ruF'DIIR2+CT.u+ELt7ATJu4Ch+Z#Bl%@%+CT=6@3B#f@r$4+%15is/g)8ZE+*6lF)YPtAKW*<
FCfN8F!,(5EZfFGAnGaeBk;1(+C\bhCNXS=F)YPtAISuA67sB'+E2IFFE;P4D/aP=+E_X6@<?''
Bl8**Ecbl'+CfG'@<?4%DBNA*A0>\sF*)ADF<G[>D.Rd1@;Tt)%15is/g)8ZEb0<6A8,Oq+<VdL
Eb0<6DfTE1+Dl%<F<GU8@qBP"+C\bhCNXS=@rc-hFCeu*@X0(EE+*6lA8,Oq.1HVZ67sB'+ED%7
FE;D0@q?c*+EV19FE8R:DfQtAF_56"@qfLlF<GU8F*)>@AKZ&5@:NjX$;No?+<VeJ@<Q3mBlY==
+<VeJ@<Q3)A8-'q@ruX0Gmt*U67sB'+ELt7ATD?o+<VdL+ELt7AKZ#)An?!oDI[7!%15is/e&._
67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-q[9'A8bp"Ea`iuAKW`^0J,%:3@PCE%16T`
@r,RpF!)i=C2[WnDdk('$=e!gDKBB0F<Dr>C2[X(FDl22-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki
8l%icDdji"AT23uA7]Y#+Co%qBl7X,Bl@m1%13OO:-pQUA8-'q@ruX0Gp%!CF`&=>@;TQuE,oN%
Bm=31%15Kp;GKqb4ZY\e/mg=U-QlJd;FDX,78m/.7oE,_:`r\:8Q8,$9gM-E:F?SY%15is/g+\=
Eb/a&DfU+GDJsZ8+EM[;AncL$F!*%WDfTB"EZf4-FED)7Et&IE<)Z@j6V]d*4?G0&0d%hd<)Xo2
=<Kt+-OgCl$;No?+EV=7ATMs%D/_$KBl7HmGT^g:F*&O5DIal"Df'H3DIm^-+Du+?DBNh*D.Rbt
$7Its-U^O(<)Xo-8Q&,^+@Je!6V]!X4ZX]J+u(3f3Zpg^;GKqb+=nil4te$H<)Z@j6V\'t%15is
/g,%?D.Oi"CghC++CT.u+DkOsEc3(BH#R=;DJsZ8+DtV)ATJ:f6qL9O6TmIm4"akp+=A:5:JsSU
6Qf)h6W-]T6RN<M%15is/g,1GAn?!oDI[6#DdmHm@ruc$$:IH`;FXDE3]oJV?SNZN+BM?:6rHHC
+B1d.<)Q.S-OgCl$;No?+ED%*ATD@"@q?d)Bl.F&FCB$*/0JYEA7^!.Ch[s4+CT.u+Cf>,E,TW*
DKI"=Dfoq?DIIBnEt&I)4$"`e77L6T+AtWt8Q[*577KX>-Rh2>+?Ui&+FH3m6qL9S7SY'W-8%J8
+@K1-8Q\>T%13OO:-pQ_ASu$hAT23uA7]Y#F)#W(D..3k:-pQU.V`m4D..3k+CcuT+EM%5BlJ/:
D..3oDJ((=+Cf>#AKYhuDJ='4CghF"Df.TYAU&<.DKBN1DBNk0+=LuCA19,?$;No?%15is/g+,,
BlbD<F^eis@<6K4A7]@eDIml3F`_>6Bln'#F!,(5EZf4-CM@[!+EM%5BlJ08+D,Y4D'08p:-pQU
B6%p5E-!.1DIal2F_Pr/F"SRX8TZ(`CiaM;@rH7,@;0V#+Cf>#AKYT'EZee.@;L48Bl7Q+%15is
/g,%?D.Oi1AS,LoASu!hF!,17+A*c#DfTB0/g(T1:-pQB$;No?+A$HmATDBk@q?d#Dfor=+=84S
ATD7$3XlEk67sB'+D58-@;Kb%F!)SJ+<Ve>ATVu9@;Ka&FD5T'F*(i-E,uHq:-pQU+<YN0CLq%!
D/^U?+<VdLA9Da.F!,C1C1UmsF!,C=+E1b2BHVD8+E2IF+CoV3E$/\*Eb/a&DfU+4$;No?+<VeD
@;BFeF!)SJ+<VdL+DkP&AKYW+Dfp"A@;]TuF*22=AKZ&(EbTK7Et&IO67sB'+DtV)ARf.jF!)SJ
+<Ve:CghC+BkD'jF!,@/D.Rc2Bl5%c+Cf>#AISuA67sB'+E2IF@;Kb%F!)SJ+<VeGF`_[I@;Ka&
FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8l?$;No?+<VeNFED)=F<D\K+<VdL+EqaEA0>;uA0>u*
F*&OHAU&;+$;No?+<VeNEb&g!Ddm-kF!)SJ+D#e>Ea`I"F!,+3Ddm-k+DtV)ATJu+Ec5e;8g%V^
A7Z2W:-pQB$;No?+AQisATKmA$;No?+<VdqEcQ)=+Dk\2F(&]mF!)lGDe*]nCLnW/@;]^h+>G`-
/MT7G.1HUn$=e!aCghC++=CT4De*]nCLnk&$=e!gDKBB0F<D\R@;9^k-OgCl$;No?.V*+0ASu$i
DKKqBGV(KiDdmHm@ruc7GA2/4+Co%qBl7X,Bl@l3A7]^kDId<r@qfLq%13OO:-pQUFCAg'+A,Et
+CoV3E$043EbTK7+ED%&F_PZ&+Cf>,D..<mEt&IE<D?:h5t=(!-Ql/N/pf'?:IH[\-OgCl$;No?
+DbJ,B4W3-AU&;>GB.,2+EV13E,Tc*Ed8dFDfoq?DIIBn+CT.u+Dbb0AKZ22A9;Jo$<L+k:fL.c
=%PeC3[]6"-Ta4F%13OO:-pQUAU&07ATMp,Df-\>BOQ!*@r,^bEcW@E@rc""@q[!'@VTIaF:ARU
:I@fE5uKj,-R(0aDe!Tp@<*_H6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W4AR]drCh.T0
B6%p5E-!.1DIal2F_Pr/F!,(8Df$V<@psIhBHV5&C1Ums+Cno&@1<QB:Ie;Z4ZXr5B6%r<4s2%%
+<iE\-RU8m-pDu1=&M=\<)$1j8OP!Y-XS5K/5o><:I@EA74]f6?RI3D>9IEo@s)g4ASuT4-RWA3
F(H^H-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+EMXCEb0;7GAhM4F!,17+EV:.+EM%5
@<?!m+E(_(ARfg)Bl5%c:IGX!;bp4i<'<8iF)Q#?F<Db[-RWeJ?RI3P;bp(_6U=C7/12fP+DEGb
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@
ATJtBDIIBn/9GHJF=A>S@:F%aF!,17+EM%5@<?!m+E(_(ARffk$<'_s<E)pd=B%FE-QmANF<Db[
+<iEc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP-RU$@+Cf>"F`MM6DKI!K-XpM*
ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*D>?@q]Fp+EVNEDKTf*ATD?m+EM%5
@<?!m+Dbt+@;KKa$<'`!=%Q@Y83K!]@rGk"EcP`/F<FLX?XHE$6uQOL-S.Yc9i+eT7h#e7$;No?
.V3L.A7]^kDId<rFE7lu%16igA92j2Eb/!4/h1USA92j2Eb-A'/M/)dFDl2.B4W3(@VTIaF<G(0
@<6KN+D#e>ASuR'Df-\9AfrL:De(:L%15is/e&._67sBOBk1dr+EV:.+E_R4ATDU4Bl7Q+A79Rg
@UX=h04np7AKZ&>F*(u1+E_a:A0>u4+EMXCEb,[e:-pQUA8,OqBl@ltEd8dG@VTIaFE9&W;Isf`
@:O"hB-;;0BlbD,CghC++DGm>@;Ka&FD,*)-Z]_(:-pQUEb065Bl[cq+EVNE@q]:gB4W3-BOr;s
Bk)7!Df0!(Gp%0MDfT9!AKZ&>F*(u1/e&._67r]S:-pQU<b6;\+DG_8ATDBk@q@\1$;No?+<Ve:
BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(
BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`
CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2
%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL
+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4
Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1r
FD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdL
F(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#
D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*
$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>
ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU
+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!h
Et&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4
FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not
+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'
+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+
@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE
+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$
:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22
+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE
@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,
+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<
@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#
D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28
Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._
67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO
@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki
8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$
D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,
E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(
AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"
+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H
76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k
%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3i
FD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRt
ATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78
+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY
83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*
$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&
$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`
<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'
$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E
:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ
4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O
74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:*9uQ%15is/g,7VBl+u5BkM+$+=M>P@;0OlDJ(C@
E+*j%+Co&"Bl.R+ATDi7+Xefh4Y@jR5u^BC78+-tEc>Q2EbTAR3aEjQINViU+>#2g><3lV/h^H^
+Ab@'845m?,$uHU+C,E`%15is/h1FMA7T7jASu$iDKKr7De*s.DesJi67sa&De*s.DesJ;@kB8T
A7]dqG%G2,FDl)6F!+t/@<6KN+D#e>ASuR'Df-\9AfrL:De+!4Bl#4N%15is/e&._67sBPDKKH1
Amo1\+EqaEA90d@$;No?+<Y*'A7oq%+<Ve8A7Qg,DfTB006CcHFE8RHD]i\5Dfp"PF*22=AKW*<
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y*/Ci3ZuATJu(Df&rt
DIml3DIIBnF!,(8Df$UFEb/j#@;TRs.3N&:A0<:=@W#UkATK:C+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<Vd9$;No?+<Y*/CiX*!F!)T6Cht53@;TRs+ED%*ATD@"@qB0n@X0)7@VTIaFE8RCDBNh*
D.Oi+BleA=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y3+ChId-+<VeIASl@/AKZ28
Eb'5EFCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<Y<.FE2UK+<Ve>ATT&8AT;j,Eb/c(FDi:5G\(B-FCcR;+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Y?6E,KJ7+<Ve;Ble60@<lo:F(fK4
F<G+*F(96)E-,f4DK?q=Afu#$C1UmsF!,C=+=MLa+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#
:-pQU+DPh*@:s-o+<Y3'H#k*LBl7El+DbJ-F<G(,@;]^h+CT.u+CfG'@<?4%DBNk0+A,Et+E(_(
ARfh'%15is/g)9ODe*NmCiCL>+Co2-E,8s.+E).6Bl7K)8l%htBOu"!+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'ChFk5+<VdL+DkP&AKYE!A0>],@:UKQ:IH=<Ec6)>+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'D/=89+<VdL+DkP&AKYf-@:UL%
@rc:&F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)9SDe404+<VdLEb0?8
Ec,q@@3BB#F*&OCAfu#$C1UmsF!,[@FD)e7D]iV9E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%15is/g)9SDffW4E$-8GGAhM4F!,CA+EV19FE8R:Ec5e;.![6aFD,*)+CT;%+Du+>
+DG^9B6%p5E-!.?EZfFGBlmp-+<VdL+<VdL+<VdL+<Vd9$;No?+<YQD+<VdL+<Ve>ATVu9DIIBn
+CT.u+EV1>F<G19Df$V.A8--.GA1r*Dg-7F+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<YQG+<VdL+<Ve<A8--.@3BH!G9CIAE,95uBlkJADfTA2F`V87B-9fB6m,uXDK]T/
FD5Z2F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YT3DIIBnF!)TJDJ=*5AKZ&4Ecbl'
+E(_(ARfg)@;]TuCi<flCh4`,@;TRs+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<Vd9
$;No?+<YWD+<VdL+<VeGF`\a7DIal"Ec6#?+ED%*ATD@"@q?ck+EqaEA0<HHG%G]>+D>2$A9f;+
F!+n/+D#(tFDl1B6r-0M9gqfV6VgEN5u'fW$;No?+<Y]9Ao;$oATJu:DJ=*5AKZ&4Ecbl'+ED%*
ATD@"@q?d#@;TRs+D,Y4D'16LF(KDA+ED%7F_l.B+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?
+<Y]9G&M80GT\,LATW'8DK?q/+Dbb5F<GL6+E2IF+Co1rFD5Z2@<-W9DdmHm@ruc7GA2/4+Du*?
AU&01@;]LqBl@m1+<VdL+<VdL+<Vd9$;No?+<Y`LAU#=?+<VeJATT&9BQ%p5+EqaEA0>H.E,8rs
DIIX$Df-\0Ec5e;-tI7+.3N;8@:Wqi+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YfJ
ARo7q+<VeIATW'8DK?q/+Dbb5F<GL6+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<
DfTB0+E)-?.!R0`+<VdL+:SZQ67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m+=LuC
A9;a.Ci^_>@;]^h+>>K+0JG(40JP780I[G<%14LD+Z_G7.3L;e+AP6U+Co2-@psCg+EqL5FCfN4
@:NjX$4R>PDe!TlF)rHO@;9^kFDl)6F!hD(@rH(!F(KB6+<W%?C2[X*FD5P=%16igA9E!.Ced;L
+=_,EA9E!.C`m4>/KeIE@rH1"ARfgrDf-\9Afs]A6m-VoBl%L*Gp%<LEb'5P+D#e>ASuR'Df-\9
AfrL:De(:L%15is/e&._67sB[BPDN1F*1r%CghC++Co%qBl7L'+CQC6ATT&5AftbqDIe#8F`_>6
Blmp-+EV:*F<G^IAKZ).AKYK$Eb,[e:-pQUAmo1`Ch\!*ATJu4Afs]A6m-Si+E1n4AoD^,+EV%5
CNCV:Aft_tDImisC`mkAAKZ)5+A*bqEc5T2@;TjmEcWiB$;No?%15is/g*`'FCfK)@:NjkDJsZ8
F!)ePG%G]'F#ja;:-pQU+<Y04D/a54+<Ve<G][t;D.Oi"Df'H6ATMp,Df-\9AftVu@ruF'DIIR2
+EqaEA9/1e:-pQU+<Y3++<VdL+<Ve;Ec5n>ATDg0EZek1A7ZlqEc5e;8l%htEb0<7Cij_-$;No?
+<Ve;Ble59+<VdLA8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE7lu:-pQU+<Y35@ium:+<Ve=DfT]'
F<G(3D/Ej%FE8R=DBO.AEb'56@;]TuA8bt#D.RU,Et&IO67sB'+D#(++<VdL+<Y6+BlkJ9@VTIa
FE8R:Ec5e;8l%ha$;No?+<Ve<F<D\K+<VdLARoLs+EV1>F:ARP67sB'+D5d=+<VdL+<Y<.F<G[:
G]Y'HF`\aEAftYqBlkJABl7I"GB43#:-pQU+<Y]9G&JKG+<VeCBleA=Eb/`lDKK]?+ED%:Bldir
+E(_(ARfh'%15is/g)8ZEbupA+<VdL+EDUB+DkOsEc6".$;No?+<VeIFEAWJ+<VdLEcl7BFCB<6
Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;;DJX$)AKYYtCiBgj:-pQB$;No?
+AQisATKmA$;No?+<Ve<EcQ)=+=84LCERJ*F)tc&ATJtBC2[X*FD5P6Ea`iuAKWZ\1,Ua;0JG:C
3@PCE%16T`@r,RpF!)i=C2[X*FD5P=%16T`Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqB
A1]AUA7]^kDId<rF<GdGEb'56%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F)uJ@ATJ:f
5uU]^9gquT5uL?=3[\?WF*2>2F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZee5FD,T5
%15C$<(Ke_9gMZM4ZXs!F`_;8E]PQW$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZek4ART[l
A.8l5;FNlN779j9;G0/6-Y%1.@<?'k3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+Cob+
A0>Q.DJ*BuBjkm%@;]TuAU%X#E,9*,%15L+5t"F5;G0/6-Y.L2A3)(I$4R>;67sBkDe!p,ASuTu
FD5Z2+DkP-CER5-EZf4;DII&uBQ\3*@<-'jDBNA*A0>H.@;Tt"ATJ:f9i"MM6qosF90G<`D/X<#
A3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZfO:EaiI!Bl+:d<^fnQ5u^EM9gMZM4ZXs6
ATD6gFD5SQ-OgCl$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4Ec5l<+EqaEA9/1e;GU(f=&2^^
;b]PU90G<`Ec5l<GAhM4F#kZX$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CNCUM+Co&&ASu%"+E)-?
DffZ(EZf4-Ebf_*$:IZW<D>nW<)#YV92du7+@/q)<D>n\9gMZM4$ckG85E,X5uL?;6W-?=<(02L
5uL?;6s2fD9gMZM4&&LG5t"F5;G0)P78cH<<(TeY5uL?;;GU(f=&2^^;b]PU9+;4;$;No?+Cf>,
D..<m+Dbb0AKYu8DffQ3+AYoYA7]^kDId<rF?1OZDe't6-n6Z//g+\6CiOT9FCcR($?:/N3Zq^9
A7B@pF`2A55V>Vt=%Q-r$4R>;67sa!DId9hE+NotASuU2%13                          ~>
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
zz=:zz,'adArguments00 odSmokeArgFail00''),(<<;._1 '' jodstresstests getStress'
zz=:zz,'00 makeStress00 packdStress00''),<<;._1 '' loadlargefeasiblecase load'
zz=:zz,'test001dictionary loadtest002dictionary loadtest003dictionary loadt'
zz=:zz,'est004dictionary testdictionarypaths''                              '
zz=:908{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&p0d&2)2E5Mk@:X1_EbArqARTXo@VfUc@<6!T67sa(Ddd0m@<-!lAn>ClBjtmi@psFi
+ET1e+C]J-Ch.T00mFgOBk)7!Df0!(Bk;?.AoD]4FD,5.9L_B%$;No?$;No?+@C0\@<?(%+CT.u
+Dbt)A9/l8BOr;sBk)7!Df0!(Bk;?.F`V,)+DG^9FD,5.Cgh?sAKYSr@<6-lCh3rK67sC&ATMr9
@psFi+=KoQ6RaW1<+ohc9L_AlBlbD2DKKH-A7]9oFDi:2AKYD(@rH4'Ch7^"+D#e+D/a<&$;No?
+<ki;@<6@)@;KCa+s:u=F*&O7@<6!4+B3#c+<X?I6QdLb@<3P6AoDg4+Co1rFD5Z2@<-'nF!,[@
FD)"V67sB80JG1'1GCL:+EqaEA9/l3DBN@1E+*j%/g+,,BlbD2F!,=B@q[!$@<-!lEZcKHBOPd$
+EVmJBk(Rf$;No?+A,Et+E2@>C1UmsF!,R<@<<W7F*1o-Cj@.:@<Q3)1*@]XEZcJ\+Co1rFD5Z2
@<-'nF!)TDAfr4<BOqNG67sC"@<?0*GA2/4+DbV1F!,R<@;[2F0JFVnDfTB0+E1n4+Co1rFD5Z2
@<-WG$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB[BOr<.ATMr9A8,OqBl@ltEd8d;Eb/[$Bl@lB
Ci<`m+EM%5BlJ083XSVK/db??/g)8Z+CfG'@<?(&ATMs(Bk)7!Df0!(Bk;>m:-pQU+<VeCDdd0u
ATMrI0JR*P@ruF'DIIR2$;No?+<VdLCi<`mFCfN80JG7mBk)7!Df0!(Gm[;5/g)8Z+Dbt)A9;C(
F>,C)A8,OqBl@ltEd8!e67sB'+<YK=@:XIkF*')i1h:<1FD5Z2@<-W#:-pQU+<VeKATMs(Bk)7!
Df0!(H#R26BQFMU67rU?67sB'+<YK=@:XIkF*')j0P"m-FD5Z2@<-W9:-pQUDJsV>E+*d/+E(j7
9L_AV:-pQU+<VeCDdd0uATMrJ0JI$O@ruF'DIIR2+AP6U+Du+>+E1b0F<GL6+A>6l$;No?$;No?
+Dl7BF<G%(+EDUB+DG^9DfTB"E\8IW<+ohcDIIBnF!+n3AKYK$DKBo?F^oN)A0>r3+EV:*F<G+*
AmoguF:(c0/g*b/@;Kmr@:EeiBk&9,DfTr6DJ()2F`_[IFD,6&+DG^9@rHC.ARfg)DfTB"EXGQ.
/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emQaFttf[:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.;:
Eb065Bl[c--YI".ATD3q05>E9-OL1                                             ~>
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
