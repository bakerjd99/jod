NB. JOD dictionary dump: 21 May 2018 20:06:05
NB. Generated with JOD version; 0.9.993; 18; 21 May 2018 19:36:42
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-16T14:58:11
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

EDCONSOLE=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'

ERR00407=:'ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot'

ERR103=:'no backup(s) to restore or search'

HEADER=:1

IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODinterfaceSTANDARD=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.993';19;'21 May 2018 20:06:05'

JODVMD=:'0.9.993';19;'21 May 2018 20:06:04'

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
if. _1 e. (4!:0);:'load conew coclass coerase coinsert copath jpath UNAME IFWIN' do.
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
NB.   override mixed   allow mixed assignments (^:)=:
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
    if. -.'(<:)=:' +./@E. ,y do. (jderr ERR0159),uv1 return. end.
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
0f_081H$@2+?1K"2BY"&2Du[9+>Pku0f1"21E\G.+>Pku0ea_+1E\D1+>P_q0eje,0d&@s1,9t4
+?))!3?U+4+?:Q%3?U=)1Gp:00H`/,+>b2t0d&J!2`;d53$:%9+>P_q2)QL20d&;/+?:Q&0d&J!
1GL",0H`5,+>P&p1E\Fq3?U%1+>bhr1*A>.+?:Q$1*AP!1H?R;+>ttt2BXe3+?1K"2BX_.+>Pbr
1*A>++>Y,p3?U%8+>bks1,'h,3(-b@:eakY1eJm6ATDj+Df-\>BOQ!*@rc-hFCeu*FD,B0+CoV3
E+Wg#AOT!S:JOha9LX&7G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+DPD)DKB`4
AKYo/+BN8pA8c[5+EMgLFCf<184>g478dc=Dfp"A@;]TuF*22=AKYYt@:Wqi+Cf>#AP%2?:IJo7
FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+9+=M;BFD>`)
Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@6m-2]FCfK)@:Nk?
H:gt$FDl)6F%T4r<)6:`;]mK&C2[W3+DG_8ATDBk@q?d,DfTB0+<X7%8l%itFD5W7ATDBk@qBCn
A9E!.C`mG0FCfK)@:NjkGAhM4F%T4r<)6:`;cZU\8l%iS:JXY_+Eh=:F(oQ1/0Je<CLnVsDIal#
@<?'Q:IJ5X7!<-^F(oQ1/0Je<CLnVsDIal#@<?'T5snOG<*<$dD.-ppD]j.5G]Y'MH#R>9/0JJ7
E+NotF#kF9;aXGS:fJu>5u^9T/4``79Is:?9Is.3=B$h<=]@g@9gMZM6r-lZ/6,Y=3);k1<Du7N
<(1_7Ap&0)@<?''Ci<flC`mG&ASuU(AnbgsF!,R5B2:i`<Du7P:/l+>D.Oi.@V0b(@psInDf-\6
Bl.R++>"^LBkM*jEZfO6Cis<1+DbV1F!,:5CLq=-+EVNE@r,RpBMUra<Du7]7TaS<Ap&0)@<?4%
DBNb6@ps0rBk1dmFD5?$ATAo4Eb/isGZ7+1<*;L]9gqs%ATMr9D.Rd0@:s-oF*D>?@qZu:+>G!W
DBLVUDe<TjB4Z1*ATVs,AThX++E(_(ARfh'+D,Y4D'3A'@ruF'DIIR2+C\bhCNXT;@W$"'ARTUh
BQI`nEarcoF!,FEF<G+.@ruF'DIIR2+C\bhCNXS=DIIBn+Dbb5FE8R:DfQtABl.g*AKYJr@<,dd
FCfJ8Ch[s4+E1b2FCfK1F(09+Ch.:!A7KOpE,oN2F(JlkF_PZ&F!+m6Ap%p+Gp$U8D/aN,F)to'
+A,Et+Dbt)A0>u*F*&OG@rc:&FCKB,Ch.:!A9;a.Cia*)D/aN,F)to'@WcC$A9/l'Df'H6ATMp(
A0?&,EcYr5DBNk0+EV:.+A,Et+EVO?Ci^_/CghC++EM%5BlJ0(BOt[hDKKu/@P_M-ARfLs+CT)&
+EV:;ARuu4DIIBn/6cV#@<6Kq/9GHJF=A>S@:F%aF(9-*E,oN2F)#`,D/XT/F!+n-C`mq8Blmo/
F)YPtAKYT*Df$Uh+EqaEA9/l%DIal2BQ%p5ASuQ3Ci<flC`mV(D.RcuEb/[$ASQ-oA8,OqBl@lt
Ed8dG@VTIaF<G(6ART[pDf-\@ATD6jF_u)2ART+\Eas-$@<?(%+EV:.+CoV3E+Wg#AKYE!A0?):
Blmp-+D>=pA7]d(Bl7O$Ec#6,Bl@m#A7]:cF<G+.@ruF'DIIR2+E(_(ARfh'ATVKoBlkJ>AU&<0
ATVg3F*(i-E+`a(+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aQ4B5M'mAKYE!
A0>],@:UKQ:IH=<Ec6)>Ci<`mGAhM4F)5c'A9/l(Bk)7!Df0!(Gp%<LEb'56Bl8$2+EV%4B4Z0-
Ci<flCh7[*@;TRc@<?R%G][t7@ruc7@;]Tu@r,RpF(o6#ATJu3@;TRs+DG^98g%V^A7]XsF`)#9
AT2-tDK]T3FE8RBDfor=+EMXCEb/c(@<3Q#Bl7@"Gp%3I+Dbb0ARTU%FCf]=+ED%4Eb0<'DKK</
Bl@m1Ddmg"G][A8F(K2tCh7Z1@;]TuEb0?8Ec,q@DdmHm@rri8AU&<9F`_&.Cij`;F`_[I@;Ka&
FD5T'F*(i-E-!-R+EM+*+=Ll6FCB!%FE8mOASbpdF(K*)A7fOn@;I&Y:IH=GAT2Hs@<6!&F*(u4
F)l,<F`)7C8g%tZ@rcK1F(96)E--/AFEDPGDK?pm+EV19F<GX7EbTK7F*2G4@<?'qDe*]nDJ<]o
F*)J7F<F1O6m,oKA8c@,+DkP)BkCptFE8RHD]iP4EcP`/F<Ga<EcYr5DKTo/@<?'qDe*p-F`Lu'
A9Da.F*2G4@<?''Anc'mF!,17+A,Et;bpCk6U`,.BleB:Bju4,Bl@k                    ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekR/0f1".+>GPm0ekUH0H`)*+>PW-1*A;,+>Pl71E\G.+>Z#70d&5-+>GT10d&2)+>GT+1*A;*
+>Pc/2'=V/+>G`02'=n%0fLg@+>Gl!1,1UF+>G\q0ekRH+>G\q0f(O<+>G_r0ek[E+>PYo1,_$J
@W$!\D/X3$0JH6g/h1=JCf>1hCLo1R+ET1e+=L]:CagK8EbBN3ASuT4F)>i2AKZ)+F*)IU%15is
/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)0I\,TBk)7!Df0!(Gp!P':-pQU
+<VdL+ED%+A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0II;::-pQU+:SZQ67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>K0b"Ib67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!a
F`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2
AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<
De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio3
4ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio5
4ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sC#F`2A54ZXr<-RU5l5U\01
-RU8h.6o:+INUg85U\cB-RU8h.4G]5%15is/g+e<DImisFCcS'Cht55Df]u6@VfTuG%#3$A0<:0
DJUaE@<-"'D.RU,+E1b2FCfK1Et&Hc$;No?+EM%+EBQ?*5!!C1+>Y,_:-pQUF(Jd#@q[!)F^]*#
AnbgsEt&IO67sBqDIYgj+<VdLBeCMb+<XEG/g*b/GAhM4+DtV)AKYK!@<6K!$4R>;67sC(@;KXg
+DbV$F<DuV.3N&>B6A'&DKKq/$;No?+<VdL7;Q[KARlo++@KpRFD5Z2@<-W\De*F#+<VdL+<VdL
6tp.QBl@ltEd:#jA7]g\ARTUhBHSE?+<VdL=)W+i;e9BX@q\J0@;TRCCghC++<VdL+<VdL+<XBe
@rcKdARTUhBMDoFEc6&FE+KIc:-pQUCgh?s4ZX]64D?E%.3L/a-p/\-+AY<r771$L6XO8:De*3(
+=nW`/:/d@6:s[6<),ef@;9^k?R\'X@q]j2+=nW`/:/cr=&2^^?X[\fA7$cIF(8m'4)$;i1asOu
+=Jdf-nJ(Y6W-]e@;9^k?R\'X@q]jD9gM-E:K1In7:0J<De*3(%13OO:-pQUG%#3$A0>o,B4uB0
.![6a@<-"'D.RU,+E1b2FCfK1Et&IO67sB'+<Y64E--@J+C\bhCNXT+DKI!D+CT)&Bl7Bg@r$4+
+<YN0FCT!)ARf:hF<D\KD..NrBPD?n@:O(qE"*.L67sC$@<-!D3Zodt+<W`g+=Ach+<VdL+<Vdg
+=AdODfor>-QkJn+<W%L@;TR'+<VdL+<W`g-Z3@0AM.J2F`):K%13OO:-pQUAoD^,@<?Q5@;Ka&
G%#3$A0<:0DJUaE@<-"'D.RU,+E1b2FCfK1Et&IO67sB.:-pQU-Qjra0d%T#+u(2a3[QIC+>Fum
+>P'd+u(2_4s279-Qll9C`k)S+=nX/3Zp."/0K9^-p2<SEb?gD/0I&pF`2A5-8%J)Eaa!$%13OO
4tq>%A0<7AATMs.De(OL+BosE+E(d5-RT?1%15is/g+\9Ch7^"+CT)&+EqaEA90:EB6%p5E-!QQ
FCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e/g`27+E(_1+CoA+-8%J)-mNY>
F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+F!(o!6qfa)+F?.r/g*PY5u^B^
?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=-Rp`_C1\h&$4R>;67sC&Ed8dK
ARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:ARfgnA0>H(Ec5t-$>sEq+C]5)
+=ANG$>sEq+C]5)+=Ach%16uaEZeh/C`k)X1FEV=%15is/g+YEART[l+EV:;ARuun@:O(qE,uHq
%15is/g+b?EcZ=FDdmHm@rri'Des6$@ruF'DBLMRASlC.Gmt*E0RIbI@r#Tt-Zip@FD>`)0II;:
%15is/g,4H@rH6q+E(_(ARfg)@rH1"ARfgrDf-!k0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;R
Deip+ATMrI%159QHZ3D'CLeP8FCfN8C2[W:-OgD*%15is/g,7LBl[`,DdmHm@rri'Des6$@ruF'
D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$9g.jE+*6lA0<7AATMs.De(OL
%13OO:-pQUF)Po,+C\c#Bk&9"DK]H)Bk/>pEbBN3ASuU2+>"^IG]75(FCeu*ATDg0EX`@nATAo&
DJUFC/n$+:$>sEq+>b3MDJUFC/hJe*%16uaEZd+[@W$!)-S@#!%16uaEZeh/C`kD@$>sEq+C]5)
+?V#!%13OO:-pQUF)Po,+C\c#Bk&9"A7]Y#Bln'#F!(o!-t7(1+=ANc+>#Vs@W$!)4#)(kDJUFC
/ghbN$7ISN@W$!)-RU>c/NP".+C]5)+?M<)0HahBC`k)X-Qij*-nuiRDJUFC-Rg/i3Zp."@W$!)
4#)(:+C]5)+=Ach+:SZ+1*C%DC`k)Q.3L3'+>P'KDJUFW0mbYu@W$!)-S?bh%14L>+C]5)+=ANc
+>#Vs1E^.EC`keoHSZdRDJUFC/ghbN$7I_R@W$!)-RU>c/NP"2+C]5)+?M<)1a$7FC`k)X-Qij*
%15is/g)9GDJUFC/gh)84tq=mDJUFC/ghbN$8`kg+<t?5CaUh_%13OO@UWebF_s9&+=Ach+=nWZ
3Zp.5+=eQY/g)Q(0mdAIC`k)X-Rg/i/g)Mo-OgCl$;No?+D,2,@qZusEc5e;+Du+8AU%p1FCf?3
+C\bhCNXS=/KeVFEc5t@AU&0*@ru9m%16uaEZeh/C`m1qA8ZO,%16uaEZd%Y@W$!)@UWebF_qQp
DImi20d'qCC`m1qA8ZO,%16uaEZd+[@W$!)@UWebF_qQpDImi21E^.EC`m1qA8ZO,%16uaEZd1]
@W$!)@UWebF_qQp%15is/g*ksDL!@CAfu,*D..-rBl7Q+FCfN8F!+t5Bln'!@;Kb*+Co&&ASu$$
Df-\>BOr<&Ddd0fA0>f"C1UmsF"Rn/:-pQU8S0)eBOr<&Ddd0!F)>i2AKZ)+F*&OG@rc:&FE8R5
Eb-A'BOPdkARlol+Dbt<+E(j7FD,6,AKZ)+F*)I4$;No?+Dl7BF<G%(+ED%:Bldir/g(T1%15is
/g)9GDJUFC-OgD2A8Z3+-RU>c/NP"`DJUFC-OgCl$;No?+<Y-2C`k)X@rHL-F=.M)-t7(1+=ANc
+>#Vs@W$!)4#)(kDJUFC/gh)8%15is/g)9GDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc6;LBN
5u^WS0d&eY:J=GR;cFl+:JXY`5se76-Rg/i3ZqmLC`k)l:JXY3%13OO:-pQU+C]5)+=D&8D.P>0
Dfor>-OgD20fpaS:/jMY:JEMj4"!Tp<)c.M9LU<X+>#Vs@W$!)-V7'4-S.>7HX^l/-S?bU$4R>;
67sB7+C]5)+=ANG$7ISNA8Z3+-RU>c/NP!s0HahBC`k)Q%13OO:-pQU0HahBC`k)X-OgD2@W$!)
-S?bq+>#Vs0HahBC`k)X-OgCl$;No?+>=pIDJUFC/n8gBDKI68$7ISNA8Z3+-RU>c/NP".+C]5)
+?M<)@W$!)-S?bU$4R>;67sB7+C]5)+=D&8D.P(($7IVj+?MV36;LBN5u^WS0H`\X:J=&R:JEPd
6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs0HahBC`k)l:JXY3%13OO:-pQU0HahBC`k*C@;TR.@rHL-
F=.M)-o!e28PW5N<)64B-T`\I:/k1Y6;0fq.3L3'+>=pIDJUFC8PW54/3>V6@W$!0/gh)8%15is
/g)kk@W$!)-RT?1-o!e2F)>i2AM@(pF*')`4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'
+>G!JDJUFC-OgCl$;No?+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>G!JDJUFC/gh)8%15is/g)kk
@W$!)-SAnIF`):K%14L<4"#)dDeio<<+U,m0IJ:l/NP"/+C]5)+?M?*@W$!0/gh)8%15is/g)kk
@W$!)-Z3@0AL@oo-o!e2F)>i2AMI.qF*')`4"#)dDeio=<+U,m0deCm/NP"/+C]5)+=D5IDeio=
-OgCl$;No?+>G!JDJUFCDIIBn/n8gBDKI68$7IVj-Za-CCLo2!ATMrI-Rg/i3Zp."@W$!)-Za-C
CLo1I/3>V6@W$!0/gh)8%15is/g)nl@W$!)-RT?1-o!e2@W-1$F)>i2AM>Jn-Xq"4CiaH3CLo4J
4""`[FE;;;CLo1I4""`[FE;;;CLo4J.3L3'+>P'KDJUFC-OgCl$;No?+>P'KDJUFC/gh)8-t7(1
+=Ach.3L3'+>P'KDJUFC/gh)8%15is/g)nl@W$!)-SAnIF`):K%14L34>A994>8$h3[l1'3Zp1#
@W$!)4#;4mDJU[Q-OgCl$;No?+>P'KDJUFCDIIBn-OgD20fpasDKKr:Deio=-Rg/i3Zp1#@W$!)
-Y[I?F)>i2AMGPA$4R>;67sB9+C]5)+=D&8D.P>0Dfor>-OgD20fpalDf9H5D/X3$0IJ:l/NP"0
+C]5)+=CW:DepdP4#2.lDJUFC/gh)8%15is/g)qm@W$!)-RT?1-o!e2F*22=ATM^,CLo4J.3L3'
+>Y-LDJU[J%13OO:-pQU1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1E^.EC`k)X-OgCl$;No?+>Y-L
DJUFC/n8gBDKI68$7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)4#)(kDJU[Q-OgCl$;No?+>Y-L
DJUFCDIIBn-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`k*HFXIV*%15is/g)qm@W$!)-Z3@0
AM.J2F`):K%14L34>A994>8$h3[l1'3Zp4$@W$!)-ZaDX/3>V6@W$!0/gh)8%15is/g)tn@W$!)
-RT?1-o!e2F)>i2AM?he@rcKA-T`\sD/X3$0MPtcEc3Z[4"#)dDeio=9jqOPD_NP#-Za-CCLo4p
@:O=r0deCm/NP"2+C]5)+=ANG$4R>;67sB;+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+C]5)+=Ach
%13OO:-pQU1a$7FC`k)X@rHL-F=.M):-pQU1a$7FC`k*C@;TR'%15is/g)tn@W$!)-Z3@0AM.J2
F`):K%15is/g)hj0d'qCC`k)Q%13OO:-pQU0H`(m@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!0d'qC
C`k)X-OgCl$;No?+>=om+C]5)+=AdODfor>-OgDX67sB7+>G!JDJUFCDIIBn-OgDX67sB7+>G!J
DJUFCDIIBn/n8gBDKI68$;No?+>=on+C]5)+=ANG$4R>;67sB7+>P'KDJUFC/gh)8-t7(1+=Ach
.3L3'+>=on+C]5)+=Ach%13OO:-pQU0H`+n@W$!)-SAnIF`):K%15is/g)hj1*C%DC`k*C@;TR'
%15is/g)hj1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`.o@W$!)-RT?1%15is/g)hj1E^.EC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`.o@W$!)-S?bU$4R>;67sB7+>Y-LDJUFC/n8gBDKI68$;No?+>=oo
+C]5)+=D&8D.P(($;No?+>=oo+C]5)+=D&8D.P>0Dfor>-OgDX67sB8+>G!JDJUFC-OgCl$;No?
+>Fun+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+>G!JDJUFC/gh)8%15is/g)kk0d'qCC`k)X@rHL-
F=.M):-pQU0d&1n@W$!)-Z3@0AL@oo:-pQU0d&1n@W$!)-Z3@0AM.J2F`):K%15is/g)kk1*C%D
C`k)Q%13OO:-pQU0d&4o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp."1*C%DC`k)X-OgCl$;No?+>Fuo
+C]5)+=AdODfor>-OgDX67sB8+>P'KDJUFCDIIBn-OgDX67sB8+>P'KDJUFCDIIBn/n8gBDKI68
$;No?+>Fup+C]5)+=ANG$4R>;67sB8+>Y-LDJUFC/gh)8-t7(1+=Ach.3L3'+>Fup+C]5)+=Ach
%13OO:-pQU0d&7p@W$!)-SAnIF`):K%15is/g)kk1E^.EC`k*C@;TR'%15is/g)kk1E^.EC`k*C
@;TR.@rHL-F=.M):-pQU1*A:o@W$!)-RT?1%15is/g)nl0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs
1*A:o@W$!)-S?bU$4R>;67sB9+>G!JDJUFC/n8gBDKI68$;No?+>P&o+C]5)+=D&8D.P(($;No?
+>P&o+C]5)+=D&8D.P>0Dfor>-OgDX67sB9+>P'KDJUFC-OgCl$;No?+>P&p+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"0+>P'KDJUFC/gh)8%15is/g)nl1*C%DC`k)X@rHL-F=.M):-pQU1*A=p@W$!)
-Z3@0AL@oo:-pQU1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)nl1E^.EC`k)Q%13OO:-pQU1*A@q
@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp1#1E^.EC`k)X-OgCl$;No?+>P&q+C]5)+=AdODfor>-OgDX
67sB9+>Y-LDJUFCDIIBn-OgDX67sB9+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Y,p+C]5)+=ANG
$4R>;67sB:+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Y,p+C]5)+=Ach%13OO:-pQU1E\Cp@W$!)
-SAnIF`):K%15is/g)qm0d'qCC`k*C@;TR'%15is/g)qm0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
1E\Fq@W$!)-RT?1%15is/g)qm1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1E\Fq@W$!)-S?bU$4R>;
67sB:+>P'KDJUFC/n8gBDKI68$;No?+>Y,q+C]5)+=D&8D.P(($;No?+>Y,q+C]5)+=D&8D.P>0
Dfor>-OgDX67sB:+>Y-LDJUFC-OgCl$;No?+>Y,r+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>Y-L
DJUFC/gh)8%15is/g)qm1E^.EC`k)X@rHL-F=.M):-pQU1E\Ir@W$!)-Z3@0AL@oo:-pQU1E\Ir
@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d'qCC`k)Q%13OO:-pQU1a"Lq@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp7%0d'qCC`k)X-OgCl$;No?+>b2q+C]5)+=AdODfor>-OgDX67sB;+>G!JDJUFCDIIBn
-OgDX67sB;+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>b2r+C]5)+=ANG$4R>;67sB;+>P'KDJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+C]5)+=Ach%13OO:-pQU1a"Or@W$!)-SAnIF`):K%15is/g)tn
1*C%DC`k*C@;TR'%15is/g)tn1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs@W$!)-RT?1%15is
/g)tn1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs@W$!)-S?bU$4R>;67sB;+>Y-LDJUFC/n8gB
DKI68$;No?+>b2s+C]5)+=D&8D.P(($;No?+>b2s+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fum
+C]5)+=ANG$4R>;67sB7+>Fum+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fum+C]5)+=Ach%13OO
:-pQU0H`(m0HahBC`k)X@rHL-F=.M):-pQU0H`(m0HahBC`k*C@;TR'%15is/g)hj0d&.m@W$!)
-Z3@0AM.J2F`):K%15is/g)hj0d&1n@W$!)-RT?1%15is/g)hj0d&1n@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp+!0d&1n@W$!)-S?bU$4R>;67sB7+>Fun+C]5)+=AdODfor>-OgDX67sB7+>Fun+C]5)
+=D&8D.P(($;No?+>=om+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=om+>P'KDJUFC-OgCl$;No?
+>=om+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>P'KDJUFC/gh)8%15is/g)hj0d&4o@W$!)
-SAnIF`):K%15is/g)hj0d&4o@W$!)-Z3@0AL@oo:-pQU0H`(m1*C%DC`k*C@;TR.@rHL-F=.M)
:-pQU0H`(m1E^.EC`k)Q%13OO:-pQU0H`(m1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`(m1E^.E
C`k)X-OgCl$;No?+>=om+>Y-LDJUFC/n8gBDKI68$;No?+>=om+>Y-LDJUFCDIIBn-OgDX67sB7
+>Fup+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&n+C]5)+=ANG$4R>;67sB7+>P&n+C]5)+=Ach
%14LmDJUFC/gi(j/NP".+>P&n+C]5)+=Ach%13OO:-pQU0H`+n0HahBC`k)X@rHL-F=.M):-pQU
0H`+n0HahBC`k*C@;TR'%15is/g)hj1*A7n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A:o@W$!)
-RT?1%15is/g)hj1*A:o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A:o@W$!)-S?bU$4R>;67sB7
+>P&o+C]5)+=AdODfor>-OgDX67sB7+>P&o+C]5)+=D&8D.P(($;No?+>=on+>G!JDJUFCDIIBn
/n8gBDKI68$;No?+>=on+>P'KDJUFC-OgCl$;No?+>=on+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'
+>=on+>P'KDJUFC/gh)8%15is/g)hj1*A=p@W$!)-SAnIF`):K%15is/g)hj1*A=p@W$!)-Z3@0
AL@oo:-pQU0H`+n1*C%DC`k*C@;TR.@rHL-F=.M):-pQU0H`+n1E^.EC`k)Q%13OO:-pQU0H`+n
1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n1E^.EC`k)X-OgCl$;No?+>=on+>Y-LDJUFC/n8gB
DKI68$;No?+>=on+>Y-LDJUFCDIIBn-OgDX67sB7+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB7
+>Y,o+C]5)+=ANG$4R>;67sB7+>Y,o+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,o+C]5)+=Ach
%13OO:-pQU0H`.o0HahBC`k)X@rHL-F=.M):-pQU0H`.o0HahBC`k*C@;TR'%15is/g)hj1E\@o
@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E\Cp@W$!)-RT?1%15is/g)hj1E\Cp@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp+!1E\Cp@W$!)-S?bU$4R>;67sB7+>Y,p+C]5)+=AdODfor>-OgDX67sB7+>Y,p
+C]5)+=D&8D.P(($;No?+>=oo+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>=oo+>P'KDJUFC-OgCl
$;No?+>=oo+>P'KDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo+>P'KDJUFC/gh)8%15is/g)hj1E\Fq
@W$!)-SAnIF`):K%15is/g)hj1E\Fq@W$!)-Z3@0AL@oo:-pQU0H`.o1*C%DC`k*C@;TR.@rHL-
F=.M):-pQU0H`.o1E^.EC`k)Q%13OO:-pQU0H`.o1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o
1E^.EC`k)X-OgCl$;No?+>=oo+>Y-LDJUFC/n8gBDKI68$;No?+>=oo+>Y-LDJUFCDIIBn-OgDX
67sB7+>Y,r+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo0d'qCC`k)Q%13OO:-pQU1a"Lq1,0n\
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>PYo@W$!)-S?bU$4R>;67sB;+>Fuo0d'qCC`k)X@rHL-
F=.M):-pQU1a"Lq1,0n\DJUFCDIIBn-OgDX67sB;+>Fuo0d'qCC`k*C@;TR.@rHL-F=.M):-pQU
1a"Lq1,9t]DJUFC-OgCl$;No?+>b2q+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&5,+C]5)
+=Ach%13OO:-pQU1a"Lq1,9t]DJUFC/n8gBDKI68$;No?+>b2q+>P\p@W$!)-Z3@0AL@oo:-pQU
1a"Lq1,9t]DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>P_q@W$!)-RT?1%15is/g)tn0d&5-+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo1E^.EC`k)X-OgCl$;No?+>b2q+>P_q@W$!)-SAnIF`):K
%15is/g)tn0d&5-+C]5)+=D&8D.P(($;No?+>b2q+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn
0d&5.+C]5)+=ANG$4R>;67sB;+>Fuo1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,L+_DJUFC
/gh)8%15is/g)tn0d&5.+C]5)+=AdODfor>-OgDX67sB;+>Fuo1a$7FC`k*C@;TR'%15is/g)tn
0d&5.+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2'?@GC`k)Q%13OO:-pQU1a"Lq1,U1`DJUFC
/gh)8-t7(1+=Ach.3L3'+>b2q+>Pes@W$!)-S?bU$4R>;67sB;+>Fuo2'?@GC`k)X@rHL-F=.M)
:-pQU1a"Lq1,U1`DJUFCDIIBn-OgDX67sB;+>Fuo2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq
1,^7aDJUFC-OgCl$;No?+>b2q+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&50+C]5)+=Ach
%13OO:-pQU1a"Lq1,^7aDJUFC/n8gBDKI68$;No?+>b2q+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Lq
1,^7aDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pku@W$!)-RT?1%15is/g)tn0d&51+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Fuo2]uRIC`k)X-OgCl$;No?+>b2q+>Pku@W$!)-SAnIF`):K%15is
/g)tn0d&51+C]5)+=D&8D.P(($;No?+>b2q+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn0d&52
+C]5)+=ANG$4R>;67sB;+>Fuo3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq1,pCcDJUFC/gh)8
%15is/g)tn0d&52+C]5)+=AdODfor>-OgDX67sB;+>Fuo3$;[JC`k*C@;TR'%15is/g)tn0d&52
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p0d'qCC`k)Q%13OO:-pQU1a"Or1,0n\DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2r+>PYo@W$!)-S?bU$4R>;67sB;+>P&p0d'qCC`k)X@rHL-F=.M):-pQU
1a"Or1,0n\DJUFCDIIBn-OgDX67sB;+>P&p0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,9t]
DJUFC-OgCl$;No?+>b2r+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>-+C]5)+=Ach%13OO
:-pQU1a"Or1,9t]DJUFC/n8gBDKI68$;No?+>b2r+>P\p@W$!)-Z3@0AL@oo:-pQU1a"Or1,9t]
DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>P_q@W$!)-RT?1%15is/g)tn1*A>.+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>P&p1E^.EC`k)X-OgCl$;No?+>b2r+>P_q@W$!)-SAnIF`):K%15is/g)tn
1*A>.+C]5)+=D&8D.P(($;No?+>b2r+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>/+C]5)
+=ANG$4R>;67sB;+>P&p1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,L+_DJUFC/gh)8%15is
/g)tn1*A>/+C]5)+=AdODfor>-OgDX67sB;+>P&p1a$7FC`k*C@;TR'%15is/g)tn1*A>/+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2'?@GC`k)Q%13OO:-pQU1a"Or1,U1`DJUFC/gh)8-t7(1
+=Ach.3L3'+>b2r+>Pes@W$!)-S?bU$4R>;67sB;+>P&p2'?@GC`k)X@rHL-F=.M):-pQU1a"Or
1,U1`DJUFCDIIBn-OgDX67sB;+>P&p2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Or1,^7aDJUFC
-OgCl$;No?+>b2r+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>1+C]5)+=Ach%13OO:-pQU
1a"Or1,^7aDJUFC/n8gBDKI68$;No?+>b2r+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Or1,^7aDJUFC
DIIBn/n8gBDKI68$;No?+>b2r+>Pku@W$!)-RT?1%15is/g)tn1*A>2+C]5)+=Ach%14LmDJUFC
/gi(j/NP"2+>P&p2]uRIC`k)X-OgCl$;No?+>b2r+>Pku@W$!)-SAnIF`):K%15is/g)tn1*A>2
+C]5)+=D&8D.P(($;No?+>b2r+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn1*A>3+C]5)+=ANG
$4R>;67sB;+>P&p3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,pCcDJUFC/gh)8%15is/g)tn
1*A>3+C]5)+=AdODfor>-OgDX67sB;+>P&p3$;[JC`k*C@;TR'%15is/g)tn1*A>3+C]5)+=D&8
D.P>0Dfor>-OgDX67sB;+>Y,q0d'qCC`k)Q%13OO:-pQU1a"Rs1,0n\DJUFC/gh)8-t7(1+=Ach
.3L3'+>b2s+>PYo@W$!)-S?bU$4R>;67sB;+>Y,q0d'qCC`k)X@rHL-F=.M):-pQU1a"Rs1,0n\
DJUFCDIIBn-OgDX67sB;+>Y,q0d'qCC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,9t]DJUFC-OgCl
$;No?+>b2s+>P\p@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G.+C]5)+=Ach%13OO:-pQU1a"Rs
1,9t]DJUFC/n8gBDKI68$;No?+>b2s+>P\p@W$!)-Z3@0AL@oo:-pQU1a"Rs1,9t]DJUFCDIIBn
/n8gBDKI68$;No?+>b2s+>P_q@W$!)-RT?1%15is/g)tn1E\G/+C]5)+=Ach%14LmDJUFC/gi(j
/NP"2+>Y,q1E^.EC`k)X-OgCl$;No?+>b2s+>P_q@W$!)-SAnIF`):K%15is/g)tn1E\G/+C]5)
+=D&8D.P(($;No?+>b2s+>P_q@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G0+C]5)+=ANG$4R>;
67sB;+>Y,q1a$7FC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,L+_DJUFC/gh)8%15is/g)tn1E\G0
+C]5)+=AdODfor>-OgDX67sB;+>Y,q1a$7FC`k*C@;TR'%15is/g)tn1E\G0+C]5)+=D&8D.P>0
Dfor>-OgDX67sB;+>Y,q2'?@GC`k)Q%13OO:-pQU1a"Rs1,U1`DJUFC/gh)8-t7(1+=Ach.3L3'
+>b2s+>Pes@W$!)-S?bU$4R>;67sB;+>Y,q2'?@GC`k)X@rHL-F=.M):-pQU1a"Rs1,U1`DJUFC
DIIBn-OgDX67sB;+>Y,q2'?@GC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,^7aDJUFC-OgCl$;No?
+>b2s+>Pht@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G2+C]5)+=Ach%13OO:-pQU1a"Rs1,^7a
DJUFC/n8gBDKI68$;No?+>b2s+>Pht@W$!)-Z3@0AL@oo:-pQU1a"Rs1,^7aDJUFCDIIBn/n8gB
DKI68$;No?+>b2s+>Pku@W$!)-RT?1%15is/g)tn1E\G3+C]5)+=Ach%14LmDJUFC/gi(j/NP"2
+>Y,q2]uRIC`k)X-OgCl$;No?+>b2s+>Pku@W$!)-SAnIF`):K%15is/g)tn1E\G3+C]5)+=D&8
D.P(($;No?+>b2s+>Pku@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G4+C]5)+=ANG$4R>;67sB;
+>Y,q3$;[JC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,pCcDJUFC/gh)8%15is/g)tn1E\G4+C]5)
+=AdODfor>-OgDX67sB;+>Y,q3$;[JC`k*C@;TR'%15is/g)tn1E\G4+C]5)+=D&8D.P>0Dfor>
-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$7IVg+Z_G/+?V#\@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?97D/a5gD/X3$0JH6g/h1@LD/a5gD/X3$0JFVk
/M/)eATMr9-t@14E,$gEDIIBn+E(_$F`V&$FD5Z2/e&._67r]S:-pQU=(l/_+EV:.+<Y`IEbTE(
+=Jm(.6T^7+CT5.ARTV#+<YB9+<Y)88g#7#DfTA2+=L`<D/a5=+EqO9C^g_H67sC!@V0b(@psIj
+CT/5+<YK=@ps0rDIIBnF"SS2@V0b(@psIjA0>buD.Rc2+C\npBl5%9GA2/4+EV:.%15is/g,+R
AS,Y$+<W(.6:OsR6Vp6S.3KaADIak4+D#G$+<YlBFD)d>Ea`irDf$U>@UX=h+<XEF9gq?A:e3k]
$;No?+EM[;AncL$F!)SJ@rH7,Ec5c1ARlo+@X0(=-r30!<Du7P:/iYp+<VdtBkM*jEZcJIG%#30
ATJt:De9Fc:-pQU-r30!<Du7P:/iYbB4YslEaa'$+Dbt6B4Z*+@;]TuCh7[/+Dbb-AScW7FDi:3
CghBu+DtV)ATKI5$;No?%15is/g,=KEaiI!Bl,m?$;No?%15is/g)8Z0e"5RF)uJ@ATJu9ATMr9
A8,OqBl@ltEd8cUFCfN8C2[W:.3N2HBleB;%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(F?C3=>I2[p*h67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,
Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2
-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>+0RI_K+=D8BF*)/8A2#AR>9G^E
De't5-RT?1%15is/g+Y;@<,ddFCfJ8FCAWpAKZ#)E,oN2ASuTuFD5Z2+E(j7C*7_=Eb'5B+Cehr
CcW[]C1D9,-[''A@ODTlC1D9I3a4Wf>rsZG0d%l!0RI4\.3L/a><3la+Z_J'4:MW,$;No?+Co%q
Bl7K)GAhM4+EqOABHV5&Ap&0)@<?4%D@Hqk@V0b(@psIjD.PCa3Zp4$3Zp*c$;No?+=Jm(.6T^7
Ddm=$F(8X#AKYf-@ps0rDIIBnEt&I(Ci<flCi^_@BOQ!*B4Z0-G@bK/A1'Mm+F+D'AoD]sG&M;0
D_</X+CoCC%144#Ci<flCi^$m+<Yl>Bl[_n$6UI*+?_>",A_:.@;Kuo$6UI8+?_>"BakD\DIb@/
$7QDk%15is/g+tK@ps0rE,8rsDBNh*D.Rbt$>aTgD.RcO3ZpL44>AoP.3Ns[4!67#HQY$t+D5M/
@WNY>Ddm=$F(8X#ASl!4?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*l
EZfI@E,9H&+E2IF+=D):Ap&0)@<?'tAM>J@$4R>;67sC$ART*l@UWb^+CT.u+Co%qBl7K)GA2/4
+E(_$F`V&$FCeu*DIIBnEt&I2+BosB+Z_;20d'[C4#)(lDf'H.+=D):Ap&0)@<?'tAM>J@$4R>;
67sBsDe!3l+E(_$F`V&$FCeu*DIIBnEt&IpDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(
+=D):Ap&0)@<?'tAM@IW5s]R/DeioE3B:Fo%13OO-mNYJ@;TRs.3Lbr,A_7+D.Rbt$4R=s+Bot0
BQ&*6@<6K4Ci3ZuATJtF/g,(M@;TRs%13OOF(fK4FCf?,AM?8.+>Y-$+>=63-Z!^2@;L!-FD,*)
+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8ASH0q%144#BcoPk
+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2@;TRs%16oh@;TRs
4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z`s>Ecbl1D.PD.5s[eXD/X3$3B9*,-OgCl$;No?
+EMXCEb-A-DBNJ(@ruF'DIIR2%16Ze+EVI>Ci<f+E-67F-Z`s>Ecbl1D.PCK%13OO:-pQUEb/Zi
+C\bhCER&'A0>DoAnc-o%14g4>9GUC3\W6B+BosM0mdDKD/a54-Z`s>Ecbl1D.PCK%13OO:-pQU
Ci<flC`me4DfTqBDIIBnEt&ItDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`Ci<d(+=D5DDfTr2
DJ`r=?U6tDF)>i2AN;b2?RH9i%14L.F)GE'ATK:C4WktcDIIBnEt&Hc$8EZ-+EM47GApu3F!,::
@;TRs+=o,fF)GE'ATJ:f%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`
@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1S:-pQ_
@rH4'C/\tfCLo1S+ET1e+=L`<D/a5=+Eh10Bk/>pEbBN3ASuT4F)>i2AKZ)+F*)IU$;No?$;No?
+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW)0QUfE0JNo067sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g)l'DJs\R1E^gZ
A79RkA0>K&EZdtM6m+093A*-=$;No?+>G`gF_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/
DIakuA867.FCeu*AoD]48g$)G0Jj,367sB'+<VdL+<Ve8DIal-ATo7FF)>i2ALq;!F(o,8Cgh?s
ALqnEEb0<5/7W^CF(d!FFCfN8Bl7Q+Eb/ltD.O%]@rGk"EcP`/F<Dr?@<6!-$?B]tF_Pl-+=CoB
A9;C(FCfJ?$4:9]@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!
@<6!&4=<E\6$$m]CLoLd3@>/DDeX*1ATDl8-Y[=6A1%]kFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd
8l%i&$;No?+>%q>78m/.;cH%\<.->*$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OL2lEZf:2
+=D8BF*)/8A2#A<$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56FDi:3Df'H6ATMo"9Q+f]
:18!NF$XhX;Is9QCjAQ[Eb&-f<-`Fo4ZX]A+?CW!$4:6\D]h1q+ED%%Ci"B5Df03*@;TRs@;]t$
H#7+84Y@k!BOuHtEb/[#H#7MBDf$U[/g)hTDe<R*ARf:mF(of/F*(i.A79LhF!*Uu+C]8-$4:lg
@<>puARTXj@;TFcBl7QlF)Go;FCB&t@<,meFCB!%+?_>"@W-0-.Nj!D$7AeA6qL0S;]nq;:K0bN
+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[Hh!7nc]F5tk3"79DoN<CB8D-TsL5
@W-/l.1-DnEZfI@E,9H&+E2IF+=Bj$DJ)^QD.RcSEb/-[@;Kb*87?OL<,Y`]E+LC(Eap4r+=D2>
+EVjM-TsL5@rH4'C*4ltDf02_@;TRs6#pO7ARTCkGt;@aA5mJHH#R=B$8EZ-+EMC<F`_SFF<G[M
F:&@rBQ%p54ZX]A+?CW!$;No?+DtV)ATJu&Ci"-'@:XX+Df0,/@q]:k+>"^RDfd+3BOPdkARl-V
4YD!eGs*cg+=\Kh$@4if@3@$BGp"RZGmYu-$>"6#FDYu5Ddso/F`\`RF(fK4F=.E9@j"tu-ZW]>
FEhmT4Z[(kD/a54-Z`s>Ec`Z90d'[CF)>i<FDuAE+EVjM$47,Y@VTIaFE1r)F$2Q,1E\_$0FDN&
D-pXg@VTIaF?M6!Gp#jK/g+\C+Du+>+Cf>,E,oN2F!,C1C1UmsEsc`%F*(brBl79bDdmHm@ru'b
@rH6sF`V88DETTp1("A!Bl[cpFC09;G[ETd+F,))67sBkD]iq9F<G(3D/aN,F)rI?De!3lATJ2-
$4:?b+EVI>Ci<f+E-67F-Z<I/ARfh&AS-!2$?BW!>9G;6@j#l<F=044@rH4'C*4mB@VTIaFE1r)
F!h;L+Bot0D/XQ=E-67FFEhm7$>40n@UX(nAS-!H3\qm>+>=.8Ci<ckCi^^K+CT;%+=\LODfd*O
+Cf>,E,oN2F(Jl).Nj!D.1-DnEZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(-OOm(+Bos9Eap56G]Y;r
3ZqpND/a54-YI76@UX(nAS-!2$8EZ-+EMC<F`_SFF<G[MF:&?^A7]7e@<,piF(9--ATL!q+>b3%
+>=-0:-pQUA7]7e@<,pi+EM%2E+O)5@<,p%FDl;3BR(_<@;TRs+CT.u+CT;%$;No?+D#e-Cis9"
A0>K)Df$V=BOr;rDf'H6ATMp,Df-\:Ec5H!F)qZqDg#]4EbT&q4Z[4lDdm-kF$2Q,GT\,(67sZ9
.6T:+Dg#]4EbT&q+D5M/@UX(o$4:6\D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U+=J]g4ZX]pDf6b3
Df6b?Df5siAoD]sDIIBnF"SS\+CoCC$6UH6+C]8-+=\LO@;TRs?YOCgAU#=?:-pQUBl.g*Bk(k!
+D,P4/g+tK@ps1p+Du+>+Cf(nDJ*Nk$6UH6+=DAE+D58-+CfG7DI[?kA0>f5F<GL6+D#e3F*(u2
@q@#14Y@jp@;TRs+=\LO@;TRs$>"*c/d_r!Df6aJ+F+;C$4:?b+EVI>Ci<f+E-67F-Y-duCgh?q
A927!E+O)<$?BW!>9G;6@j#l<F=044+Cf>,E,$LCA7]7e@<,piF(9--ATK4+0d'[CF)>i<FDuAE
+EVjM$4:WaG\(E,@rH<tF$2Q,1E\_$0FA.^67sBsDe!3l+DGm>@<6L(B5V9k+Dbt+@;I&pDIal&
Ci<ckC^Np(/g,@OASrW!DL!@ABm=3"+EM%2E+O)5@<,p%A7]jo@ru9m+E).6Gm[;5/g,@OBlmo/
F)YPtAKY].+ED%1Dg#]&+>"]aB5DKqF"&5PAT2R.FE7da67sBhDIal(A7]Y#BkD'jF!,=6G\(D.
F(9--ATJ1cCi<flCcsBnGm\A+@ps1:3Zp1#.NiPG@ps0\.1-DnEZfI@E,9H&+E2IF+=D#?G\(E,
@rH<tF!h<8@j"tu-ZW]>FEhmT4ZX]qDf'H.+=D#?G\(E,@rH<tF!h;L+Bot0D/XQ=E-67FFEhm7
$=e!lAp&0+A927!E+O)R3Zp4$3Zp*`$;No?+DGF1FD,6+AKYE%AKYE!Gp%!5D.Oi"CghC+BkD'h
@<?4%DBNY7F*2&8$;No?+Dbb-AKYK$DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7
D/XT/A1e3a67sC&BPDN1BlbD=BOr<-@:j(lF<G[=Bl7Q+FDi:4D_<.T<+ohc-td@7@WNt*:-pQU
G%G]'+Co&*ARfh'+CT.u+ED%4DfTr@+Cf>-Ap&0+A0>Do@r,Ro@<?4%DK@E;$;No?+C]8-+DGm>
A7]7e@<,pi+Dbt+@;I&pDIal&Ci<ckC`k;PB5\o)BkMR/AI8cRDf7da+<VdL+<VdL+AP6U+=J]g
4Y@jdDf5trDf7ck@W-0-.Nj!Z+AP6U+=J]g4ZX]pDf5t3$4:?b+EVI>Ci<f+E-67F-Y%(4Ap&0+
A927!E+O)<$?BW!>9G;6@j#l<F=044+Cf>,E,$LC@rH6sF`V,)F(9--ATK4+$;No?+>%q>78m/.
;cQ1P78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tD
F)>i2AN;b2?Xn+f@<?(&ATMs(Bk)7!Df0!(Bk;?\67s`tEb/[$ATVL)FC])qFD5Z2@<-'nF!,QV
/KePDART[lF!,%2E--@J8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+B!?"+=Lc3F*)G@
H$!V=FC])qFD5Z2@<-'nF"&5NEbTH4+EVNEEcl8;Bl7Q9%15is/g)8G$;No?+CTD7BQ%oP+<X9p
BPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130em9O@PK\K$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTf@<jR`+Dl%-
BkD'jA0>u4+EDUB+EqOABHV2(G9A;JC2[W3+DG_8ATDBk@q?d!De!3lAISuA67sB80lCoQ1,0n"
Ec#i8DfdEN@:Wn[A0<HH@:X+qF*(u(+EVNEEcl7BDf-\,DffY8GA1r*Dg*<N+Dbb0Fa+?&:-pQU
0fNiiDDEmgFCfN8+Co1rFD5Z2@<-'nF!+q4@;]UeA0<HHD/XH++CSekARl5W:-pQU0fX#YGqq)s
Bl8!7Eb-AB8l%iS78m/.A8-'q@ruX0Gp$[CBleB;%13OO@rGk"EcP`/F<Dr?@<6!-%13OO:-pQU
BlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OgCl
$;No?+EV19FCfJ8F`_>6F!,:;@:UKpDKKe>-u!F7A18X;De!3lAISueAT;j,Eb-@@C2[X)ATMs)
E[M;'%15is/g+YEART[l+EV13E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!TlF)rIGD/a<0@p_Mf
6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr$=e!gDKBB0
F<DrFC2[W1%13OO:-pQUA7]@eDIjr4ATMr9F`_>6Et&IuATMs)DK]`7Df0E'DKI!KB5_^!-T`\J
:IHQ>$4R>;67sBUDffPO+EV:.+FZpY6rZTR<$64"Dfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$
B6A6++:SZM:IJ/N;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+B;0(+EqO;A8c[5+Dtb4
GAhM;+EDC=F:ARP67sBQ:IJ/N;cHXj:K0J<+=CE!D.R3eDIIT?0O/aAATDisC1Ld^CLqNkC2[X)
ATMrJ-OgCl$8EZ-+DkP&ARoLq?X[\fA7$HA8l%iS78m/`:JXq!$4R>;67sBhA867.F<GX@@<6*)
AoD]4Ch[d0GV<oB@grc;:IJ/N;cHXj:K0J<+EV[@@<6*;?X[\fA7$HO:IJ/N;cHXj:K.c1%15is
/g+YEART[l+D#D/FEo!NATMr9A8,OqBl@ltEbT*++>"^WATW$.DJ(([:IA,V78?fM8OHGd$;No?
+EVNE0Hb=TATMF'G%G_;FD,5.FD5T'+EMX5D/^V,Ea`ir/e&.uDEU$.FCfN8C2[W:0II;:ATAo2
ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS
78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OO
A8XOk-Zip@FD>`)0JOpa$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*
?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9
-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2#bd%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f
/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#
%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(OX-OgDo
EZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4
:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd
$4R>QDEU$.FCfN8C2[W:1a`_>ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP
@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4
ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0Jt3e$>"6#DIn$&+Co@O8l%iS78m/`
:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip
+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2#nh
%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f
-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep
0H^f3%16W`4ZXs4ATMs.De(O\-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`S
FE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+
A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W:3%#.BATAo2ATqZ-A8XJ$:IJ/N
;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo
+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)
0KCKi$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh
/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F
<$sa]+:SYe$=n$;3[]#\F*)/8A2,bc%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\
F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#
+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(RW-OgDoEZf72G@Vh,DECHd
6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lU
DBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8
C2[W;1+*M<ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M
/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV
6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0f(0d$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN
+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH
+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2,ng%16Ze+Dtb7A0>E#
4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf
<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4
ATMs.De(R[-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi
-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V
78?fM8OHH)4"qcd$4R>;67sC!Eb&a%+E(j7D..'pBlnK.AKYMt@ruF'DIIR"ATJ:fA8XOk-Zip@
FD>`)0eb:/%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&
-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL
:/jVQ6W>Ep0H^f3%15is/g,7[D]it=A7]e&+E(j7D..'pBlnK.AKYMt@ruF'DIIR"ATJ:fA8XOk
-Zip@FD>`)0eb:8-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ij
C2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!
:IA,V78?fM8OHH)4"qcd$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5+Co1r
FD5Z2@<-'nEt&IfEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6$.-UF(dQo3F<4&A7]h(Ec65FATMs(Bk)7!Df0!(Bk;?\67s`uATMs6Dg?G9F*(r,@ruF'DIIR"
ATJu9/M/)UATMs6Dg?CH8l%htFCfN8+Co1rFD5Z2@<-'nF"Rn/:-pQB$;No?+CT>4F_t]23Zohc
De*s$F*(u6.3N>G+CQC/Ddd0!F(96)E-)Nr:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(F;D..]E1CX[d67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB80lCoQ1,0n"Ec#i8DfdEN@:Wn[
A0<HHDJs_AEcl8@+E)-?=(uP_Dg-7F@;]Tu9PJBeGRY!T67sB82emJQ1,'h[@<6-m+Cf>-Anbm#
FCfN8+CSekARl5W%16T`@s)g4ASuT4-XpM*AL@oo%15is/g+kL+A,Et<(0_b+Cf>-Anbn#Eb/cG
%14[>+=DV1:IJ/N;cG+e/NP"hE+*j%+=DV1:IJ/N;cG+R$4R>;67sC&ATMr9F`_>6F!,:;@:UKp
DKKe>-u!F7A18X;De!3lAISueAT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&?U6tD
FE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>;67sBkAS,XoAKZ)+F*&OIFD5Q4%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6miEN%15is/g,:SEb/ltF*(u6+CT/5+EV19FD>`)+Co1rFD5Z2@<-'nEt&I?HS-F/8OHHU4ZX]B
+E(d5-RT?10d'[C6qKaF;a!/a0d(FL@r!2T8OHHU%14g4>9J!#Dg-//F)rHl8OHHU4ZX]6HS-Ks
+@Jdg<)Y4g,CUac/h\D'+=Jd%-Zip@FD>`)-Rg0,/g*?)/g<"m6qKaF;[j'g+BosE+ED%+A0sJ_
6qKaF;[j'C$;No?+Co&)FE2;F+CT)&+CfP7Eb0-1+DPh*FCfN8+Co1rFD5Z2@<-'nEt&IO67sBU
DffPO+EV:.+F\'DA9;C(F<GUBDfd+=F`VXI@V$['ATT%H+E_a:+A*bdDf00$B6A6++:SZM:IJ/N
;cHXj:K0J<+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+B;0(+EqO;A8c[5+Dtb4GAhM;+EDC=F:ARP
67sBQ:IJ/N;cHXj:K0J<+=CE!D.R3eDIIT?0O/aAATDisC1Ld^CLqNkC2[X)ATMrJ-OgCl$8EZ-
+ED=>Df9_?8l%iS78m/`:JXq!$4R>;67sB[78m/.;cQ1P78m,S<D3i/%15is/g,1GDfB9*+CT/5
+Co1rFD5Z2@<-'nEt&IfEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6$.-UF(dQo3F<4&A8,RQD/X3$0JH6g/h1CGA5d>`CLo1R+ET1e+=Lc7A18XBD/X3$+EV19
F=n"0:-pQB$;No?+CT>4F_t]23Znk=:-pQB$;No?+<Vd].3N\R@;]UaEb$:b+E2@>Anc'm%15is
/g)8Z1+==oC2[X)ATMs)E[`,SATD7$+CTG%Bl%3eCh4%_:-pQU+<WHh+AtWo6s!8X<(.pOATMr9
A8-*pFD5Z2@<-'nF#ja;:-pQU+<VdL+=M>CF*)/8A2#PWFCfN8C2[W;/0K%GF*)/8A2,bh+EV19
FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW)
0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!:-pQU0emQa
Ftks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.ZDeio<0I\,V
Ec5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd
3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OO:-pQU
FD,5.A8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBO+6Eag.>A8,R'+DGJ+DfTE1+DGpFF!+n3B6A'&
DKKqP%16Ze+E(d5-Zip@FD>`)0II;:ATAo(Bk/>?%13OO:-pQUDKTf*ATAo3AftVu@ruF'DIIR"
ATJu4DBNn,FD)e6F`VXID..NrBFP;'+?^hl+FPjbA8,Qs0F\?u$>"6#De'tP3[]#\F*)/8A2,3K
ATMs.De(RV+EV19FD>`)0eb:/%13OO1a"q(,9VCe+Co1s+>=63%16Ze+E]h.+>=pKBk/>?%14s8
4Wksl0d(FL@r!30+<XEG/g+kG@r-9uATJu-ART+\EX`?b$>"6#1E^UH+?MV3FCfN8C2[W:+EV19
FD>`)0eb:/%16Ze+E]h.+Co1s+FYFe%14m64Wksl0d(FL@r!30%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eX
D/X3$3B9*,A8Z3^D/X3$0JH6g/h1CLCf>1hCLo1R+ET1e+=Lc<CagKJD/X3$+EV19FE9&D$;No?
%15is/g*MpARfLs+<Y*/C`jjBBOr<0@;KXg+<Y*5B6A'&DKI!D@psFiF!)TDAfr3EA8Z34/g)93
F_t]1Dfp+1$;No?+<k]7@<-10+Cf>1Eb/a&+s:T;G%#3$A0>AjF(KD8@<,p%@;L"'+EV19FCeu8
%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?C3=>J0F\@a67sBj
BOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`@r,RpF!,RAE,9H&
?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]CLoLd3@>7C@rH(!
F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\
<.->-$4R>REZf:2+=D8BF*)/8A2#A?$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19
FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ@WO[b
4<cI%BeCMc.3gr&-OgCl$;No?+E).6Gp%'KF<G+.@ruF'DIIR2+DGm>Df-\>BOr<*@<?/l$8N_e
+<tE2A0<Q8$4R>;67sBkBk)7!Df0!(Gp$gB+D#D/FEn<&0H`M$,<d5)+F>4b+CoA++=ANG$8<Sc
+<s&m0d(fc0d("EC`k)Q%14d34Wkt5+>G!c+>P'MDJUFC-OgD:+?^hl4s2R&HQY*eA8Z3+-RT?1
0H`M$,<d5)+F>4f+CoA++=ANG$4R>;67sBpDKBB0F<GXCD.Oi5ATD7$%178r@;TRs4ZX]5@Wuj'
0HahKEb$mI@Wuj'1*C%MEb$sR%16QgEb$je3ZpQp$=\4"A2-5.+>"$0@Wuj'1-IZ@1E\_$-[6a`
+F,=D$=\4"A2?A0+>GYp3Zoep+>"]k+=\LZ-OgDH0RInYE,9H&+E2IF+?MW-DIIBnEt&Hc$;No?
+DG_7ATDl8F)Po,+Du+?DK?6oDJim"ATL!q+=D&NEb$jHDKg,30d(@XEb$pJDKg,31E^RZEb%!S
%14LF3c8hDD.Rc;4ZX]6-Zs'<Gp$U8G@GK9F!iCu-tt:V1*AA%4")g;5;=i@4"*'K+=/-p2'=Y"
2`E0I4EW\4F`(o'De*E%D.Oi!Ec3<7$9g.jFDYu5Ddso/F`\`f3c8hDD.Rbt$4R=O$7KG&C`k)Q
.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"ATJ:f-nlcSDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;
+=nWs3c8hDD.Rbt$4R=j0H`(mA8Z3+-RU>c/NP"/+?L\o4$%P&@;TRs.3L/a4$%7s@;TRs+<XEG
/g+_BE--@JGAhM4+E2@4AncK!$7ISN1*C+FC`k)Q.3L3'+>G!#+=K<4G&C`*ATK:C/0I#8DJim"
ATJt::-pQUASlC.Gp%<LEb$;,DJ!U-%14L;+>Y-NDJUFC-Rg/i3Zp."4!5q53d,CLD.Rc;+=nWs
3c8hDD.Rc2+AP6U+D#D/FEo!QDfTA2F*2),Bm:'o%14L;+>G!LDJUFC@Wui?.3L3'+>G!#+?MW-
DIIBnF!)SJ+<VdL+AP6U+EqaEA0>i3AS,Y$%14L;+>P'MDJUFC1aa^p/NP"/+?L]-3[\fhEb%!S
+<VdL+<VdL+AP6U+EqaEA0>T(AncK!$7ISN1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mIDKg,3
0de(d:-pQUGAhM4+EM[;AncK!$4R>[ATAnI+>=pKDJUFC-Ql/N/g,.V@;KXiBk;<-ATDg0EcVZs
DImi20H`1pA8Z3+-RT?1DImi20H`%l0HanDC`k)Q%13OO-nlbu+>=pKDJUFC-Rg/i3Zp."4!6UG
DJim"ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%Bm:aKDJsZ8F"%P*-nlbu+>=pKDJUFCDKg,3
1aa^p/NP"/+?L]-3[\fhEb%!S+AP6U+EqaEA0>i3AS,Y$+=M,GF`)7L%14L;+>P&n+CoA++=D2?
1FFUo/NP"/+?L]-3[\fhEb$sR+<Ve%67sC)DfTA2Bl7NsGT\DPDfor=.1HV40H`.o0HanDC`k*9
0deCm/NP"/+?L]-3[\fhEb$mP+<VdL:-pQUGAhM4+EM[;AncK4-uNsGDK@69$4R>[ATAnI+>b2p
+CoA++=D2?-QjO,67sC#F^]*#Anbgs+D#S6DfTn.$>sEq+>=op+>Y-NDJUFCEb$O?+:SZqATAnI
+>=oo+CoA++=D&F-OgE#ATAnI+>=om+CoA++=DARDf028%16uaEZd%Y0H`+nA8Z3+-XgXrBl5:-
$6Tcb-nlbu+>Y-NDJUFC-Rg/i3Zp."4!6UGG&C`*ATJt:+<VdL+AP6U+D#D/FEo!QDfTA2E,oN%
Bm:aKG%G]'F"%P*-nlbu+>Y-NDJUFC@Wuj'1FFUo/NP"/+?L]-3[\B\Eb$sR+AP6U+EqaEA0>i3
AS,Y$+=MDEEaj)=%14L;+>P&q+CoA++=D2?1FFUo/NP"/+?L]-3[\B\Eb$sR+<Ve%67sC)DfTA2
Bl7NsGT\DXATD7$.1HV40H`.o1E^4GC`k*90deCm/NP"/+?L]-3[\B\Eb$mP+<VdL:-pQUGAhM4
+EM[;AncK4.!B0B@WNt-$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!a
F`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GWE-#T46=FqL@k]W467s`u
E-#T46=FqL@k]V[F=f'e@UX=l@j#<$F(KG9E+*cqD.Rg#EZfF7F>%-;@;]^h+EV19FE9&D$;No?
%15is/g*H$F*2>2F!,R9F*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;/e&._67r]S:-pQU
G%G]'@<?4#3XlEk67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JP>#Dg!li%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F0d'@i:K0eZ9LM<I+EV19FE8R5A7T7^%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$;No?+EqaECER>/+Cf5!@<*K"@<6!&
DfQtBEaa$&+Dbt+@;KKa$=dm`@<*J<-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]5
5s[eYEaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%16Ze+>P'XA0<7A
ATMs.De(OU-QjNS+<XEG/g,(OASrVg76s=;:/"e"$>sEq+CoG4ATT%B5uU-B8N8RT4#%j#:-pQU
@ps7mDfd+3BOPdkAKYr#Ea`frFCfJ%$4R>;67sC$AT)O!DBNY2F*2M7+AtWo6s!8X<(.6'ATAo3
A0<7AATMs.De(OU-QlV91E^UH+=ANG$>"6#A8lU$F<Dr/76s=C;FshV-OgDoEZen3F(KG9-UCZu
8P(m!-Ta$l$>"6#A8lU$F<Dr/78uQE:-hB=-Ta$l$4R>;67sBt@;BEsEb/Zi+E).6Gp"[]@q]:g
B4W30Bl%T.AmoCi%16Ze+CoG4ATT%B;FNl>:JOSd-OgE#ATAo(E-#T4+=BHR6V0j/2((I?%13OO
:-pQUEb00.ASrVB+Co1rFD5Z2@<-W9BlbCp76s=;:/"e"$>"6#De't<FCfN8C2[W:0IIuI+>Y-Y
A0<6I%16uaEZen3F(KG9-UCZu8P(m!-Ta")+:SYe$;No?+DG_7F`M%9FCfN8+D5_5F`8I7G\M5@
Et&IfEZen3F(KG9-W3B!6s!8X<(//D$8EZ-+>P'MAS`J:FCfN8B6%p5E$l)%:-pQUF`V87B-;D:
Eb'56Bl5&0Ddd0fA0>W*A0>Au@<6K!$>"6#-Xgb.A7TUf-QmANF<GI;?X[\fA7TUf?Q^^D%16Ze
+D5_6+=D8BF*)&8Dfp"H4)SkA@;9^kA8bpa+=ANG$4R>;67sC$ASbdsBm+&1Ec5l<F!+q'B5)6+
GA2/4+=DUc%16Ze+CoG4ATT%B;GU(f7Sc]G78bKp-UL*e;GU(f-OgCl$;No?+CTA6ASlC.+EVNE
D..3k+D5_5F`8IIBl%T.AmoCi+C\nl@<HX&+E(j7@UWdiEc5l<%16uaEZf48F!)iPATMs+Ec6)>
-OgCl$;No?+ED%7ATT&:D]j43Ch[E&Ec5l<+CT.u+ED%1@;BEs/KebFF*2M7+EV%4B4Z0-AoDKr
ATAo)G\M5@Et&I2+Bot*@;BFbBl[QhC2[Wi+?XCX@<?0*-[nZ`6rZTR<%i?)F*(r3F(KG@%16Ze
+CoG4ATT%B;GU(f7Sc]G78bKp-[nZ`6rZTR<%i?)F*(r3F(KG@%16Ze+Dkq9+=D8BF*)&8Dfp"H
%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F??.;f-GgAM>f567sa!A5d>`CLo1R+ET1e+EMC<
CLnV2FCfN8F!,C5+=Lf3.3L$V@;TR,>@VJXF)tV<FCf]=.3KaT@:F%a%15is/g+_9Bln',B.aW#
:-pQB$;No?+=Lf3.3N_DF*)IGEb065Bl[c-D/XH++E_a:EZf(6FCfK9ASuU(Df-\>BOPd$D..=-
+E)@8ATAnc:IGX!:-pQUFCfN8F"SRX6$".kFD,5.+EV19FE8QIEcl7B+EV:.Gp"5NE+*s.+<VeL
F(KA7+EqO;A8c[5+<W(NEX`@N67sBoH#R>8Ch[d&F!,17+A,1'.3N_G@<<W/F`VXI@V$ZnG[YH'
DIm?$@;]Tu@r-()ARmD&$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd].3L$\ATMs.De(ON
+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JPG"F_ifn%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$a
F)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN
:-pQU/ULGc;cFl<<'aD]I4Ym8%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUBl8!'
Ec`EPDg#]4GB.D>ALSaGDfTB0+E(j7G%#E*Dfp+DFEqh:Et&IcDf9H$Dg=K,+>=63Ao)BoFDYSP
3Zp.;2]sCh59Ma)1*A=p,To$)%15[?@<Q3LBOPpi@ru:&4ZX]5BQ&);D09?%+EqaBA0?)7F_kS2
@3Bc4De'u#BQ[g#+Cf)-@r!G$$=n't@VfUpCisfADJ*m+A3Dsr.lne<+=fJ^$=RdjATD="F?MZ-
-8#`7GA^i+ATL!q+?MV3@W-1$@W-N7Ao)BoFDYS38SDOUAOC->Ea`I"ATAo(DfoN*AT2I.F*2A5
Df9//@;TspEb'*1-OgDH0RInYE,9H&+E2IF+Eq^3D.Rbt$9g.jF>,j=+>=om0Hb">F<GdF@;TRs
%13OO:-pQUARoLs+EqaEA0<:<@;TR,@r,RpF"DEEG]YAWFCAWpAISu$+Bot0BQ&*6@<6K4-Y$h$
@r!2uA8-.(EZd(Z/KcDl4"u#*DIIBnF!+[0ARloF0me!r%13OO:-pQUBl8!'Ec`FGATMs7+CT.u
+CT.u+DkOsEc6".$9g.j0d(FXF<DrQATMs%CiF&r0JFk9-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j
0d(FXF<DrQATMs%CiF&r0JOq:-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j0d(FXF<DrQATMs%CiF&r
0JY";-Vcu\+DG_2De!^.F!,R9G]Y;B$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'A_4#/NP-SZ_o+>G5Q
$9g.j1a$a[F<DrJ@:O=r@;Kmr@5'D`4#/NP-SZ_o+>G5Q$4R>+0RImr4ZX]?+D58-+EVL0D.RcO
3Zri'+>G!LDJUFCFCfN8@;Kmr@5'&<$4R>;67sBlA8--.FCfN8-uNI1ALqq7G]YAWFCAWpAISu$
+Bot0BQ&*6@<6K4-Y$h$@r!2uA8-.(EZd+[/KcDl4"u#'DIIBnF!+[0ARloF0me!s%13OO4tq>*
1-IZ@1a$FBF<GF<@;TRs4ZX^6/g)tnA8Z3+-Z*:%Ec5B&E+iZ6-OgCl$;No?+D#(tF<GF/@rcK1
-uNI1ALq>0A7[<6AU&;G+EV%$Ch4%_0d'[CF(fK9E+*g/+=CZ4ARfKuARoLsDfQsV+>"]`/3>P4
D/Nd!ATJtu+D#(+4#))(1(=R"$4R>+0RGSuDe't<FCfN8C2[W:-OgCl$;No?+>%q>78m/.;cQ1P
78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tD
F)>i2AN;b2?Y=1n@WPIbDeioMF)u&.DD3au:-pQ_B5DKqF&QpoCLoeQF(o9)0JG1'+<YbX/Kc/Y
Bl7HqEb/a&+<Y*6F(o9)D.RU,+<YT7+<Ve>Ci<ckC^g_H67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>
F`)7Q%15is/e&._67sBLEcQ)=+Co2-@rHO%Eb/c(A9Dp,DJ()7F(HJ4Afs]A6m-Dc+>>eu:LeJh
1,(F?+>GW42)I?N0b"Ib67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW*2/cuH0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fNrXGqh&sAnc-kCi"A>AncK4FD,B0+Du=9F(&rrAISuA
67sB82f2uK0f:(^A7Qg$G%G]7Bk1ctFCAf)-seq`4ZX#Z%16T`@s)g4ASuT4-XpM*AL@ooEb065
Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd
3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO<(0_b=[>bV78c90
+>F<4%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%15is
/g,%M+Dkh;ARlolF)u&.DJ`s&FE7luD/"6+A4^ZLBl[cpF?sthBkM<ZCG7n41a"h%0F\@;9kAE[
De).SB6A'&DKKqK4Y@j2%16]iDI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+
$=Q(M+?0f;@Qcap2E!H9%14Nn$4R>;67sBuD]in2G\(D.@<6L(B5VQtDKKqB@;]TuEb/d(DId0n
F<GO2Eb0-1BOu6rEt&InBm=3"8T&'QEb/a&6$%*]B5UL\0g.QS+?CW!%14L39kAE[De).SB6A'&
DKKqK.6T:+0F\A$F`(])Gs*c&-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14L3-n&PI
ChtOL.4ID@+=CZ;G@GK9-OgD3%13OO:-pQUD/"6+A0><%F(o9)D.RU,F!)lCF`(\<+DGm>F`V,)
+C]82BHV,0@ps1iGp$O5A0>N$Ddm-kCj?HsD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0KhHR+?CW!
%16]iDIYg^+=DJRF`^thG@>,k-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUFD,6+AKYE%
AKYi(G\(D.@<6L(B5VQtDKKqB@V'%XF`V+:-t[U>@jrO<@;TQb$;No?+DGm>@W-@%+Dbt+@;Kb*
+CT.u+D5M/@UX(hGp$O:F(o9)ARlp*BPDN1BlbD8CCLVG67sBpDBMOo@Wcc8F)5c6E-WRD@;TQu
F`V+:@<3Q'@<*K!F!+(N6m-2b+Cf>-@qB[uARl5WD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0g.QS
+?CW!%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R><G%G]7Bk1dHDIdI%ARfgJF)u&.DD=:81a"h%0F\@a67sC!G%G]7Bk1ct
D/"6+A0><%F(o9)D.RU,F!)l;3[m3Q%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]R
FC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBnCi<d(+Dbt7CNCV1DfQtEDfTA2
G%#30ATJu.DBNCsF(HJ1De!3lAKVEh:-pQU@X0),AS,@nCige9Df9D6Bl5&8ATMr9Ci<flCh4`$
DfQtBBPDN1FCfN8%13OO:-pQUEb0?8Ec,q@@rHC.ARfg)Eb0<7Cig*nATAo+Ci<d(+=D#?G\(DW
DIdI%ARfgJF)u&.DGP%%?U6tDF)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Z*RBARnAMA8-'q@rt"X
F(o9):MVXk5s[eXD/X3$3B9*,-OgDoEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9):MV[l5s[eX
D/X3$3B9*,-OgDoEZd(k+D5M/@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCGB0^5s]R/DeioE3B:Fo
%13OO:-pQUA7]jo@rri1Bm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+DtV)AKZ,:AISuaATAo+Ci<d(
+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfRO=5s[eXD/X3$3B9*,-OgE#ATAo+Ci<d(+=D#?G\(DW
DIdI%ARfgJF)u&.DFJSdDfRR>5s[eXD/X3$3B9*,-OgCl$;No?+E)F7EcPl)AKYi(G\(D.@<6L(
B5VQtDKKq/$>"6#B5DKqF!)i+G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%16Ze
+>GSnB5DKqF!)i+G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,Ci<`m;f-GgATVL)F>-HV/h1[U@:W;RDeip+ATMrI+<YbX/Kc0PDdd0!
@3BW.@;Ka&@rH1"ARfgrDf-\9Afu#$C1UmsF!)T>DKKe(:-pQU.!0$AFD>`)0I\U]:-pQ?:-pQU
<+oue+EV19F<GX7EbTK7+DGm>+EVmJBk(RfCj@.DF`&=9DKBN&AKYo5BOu3,FCfN8+EM%5BlJ08
/db??/g*`-+EM47F_kS2DJsV>+CT).ATAn9FD,5.+EDUBDJ=!$+Dbt+@;KKtBOu'kAKY]/+<YK/
@r$-.FD,4m:-pQUF`V\6C`mh2F*&OGATW'6+CT.u+EV1'EZen2GA]#?:-pQ?:-pQU@<6L4D.RcL
$;No?$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2@<-W#:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"
+@9LPATA,Q67sBjEb/[$ARmhE1,(F?@<H3:2@<2G/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$48sNHZ*F;-Zip@FD>`)0IIuI+>Y-Y
A0<6I$49Np/g,@VEb'56De:,8@<-(#F`S[IH#R>9$:7Na9L2WR9e\^k+>=-h:JXYM<)64C4ZX]?
$:7Na9MA#V<'<8b5;"'50JF_,$:7Na9N4;E9LV**+?qJ$2'=V0+=&'b$49@"<'aJZ9e\^k+>F3p
:/k1Y6;0g23ZpX>+>k8t,V^u,$496r:I.rR8Q/SO3Zp@?/ibp7,p5E)+>Y]*,;M%^$:@?M;G9Y\
<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h&$<()%<'`i63Zp4$2`Dj)
+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*F<G:=+D,>*AL@fl6;L]^<)lCW4ZX]64@2h>9MA#V
<%0@H4@W"?5u^NL;cG1s4B#BW<'`hX$;No?+EMXCEb-A0De!3lAKZ28Eb'4u4tq>*D/a<0@j#`5
F<Db[-Z3a-5s[eXD/X3$3B9*,+DEGb-OL2U67sBh+EV19F:(2cHSHX^F`\`RF)>i2AM@(pF*')`
4!ua*4WlI%:-pQUFCfN8+EM%5BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$
0IJq)4$"`U:JXYM<)64B+@8k"9L2WR9edbW:JXY`5se76-ON$kHY7A<+=Cl@FE;;;CLo1I4!6UG
-V7'45u^WS0H`q^<)c.M9LU<9$;No?+EMI<AKYhu@rcL/$9g.J1a$a[F<DrPD/X3$0MPtcEc3WZ
4#/NP-YY1U1,C9b4tp1t+E2IF+=D5IDeio<9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8
+E(b"F`;UKF)YPtAM,)s+CT+0@3BB#@V'RgC`t/5$;No?+DbUtG%De,Bk)7!Df0!(Gp%$EASqik
Ddd0TD/X3$FCfN80ht%f.Vs$3A5d>`CLqU!F*',ZF=f'e+Dbt)A0>;'F)>?%C`m5+Ci!ZmFD5Z2
+E(j7+E(_(ARfh'+<YB9FDhL]67sB/FCfN8C2[W:.4ts&67rU?67sB[BPDN1+EV19F<D]I@rc:&
F<D]BBkq9&-u<g1A5d>`CLqU!F*')b+<YB>+<YcOE+rfjCi"A>+EDUB$;No?+DG_7Bk1ctDffZ(
EZfI8F*&NIF(96)E--.R+A$YtF(fK7Ch+Z+Dfd*E@;L$sEZfI;AKW+9F`))2DJ';O67sBsDe!3l
AKYYtDI[6#BlkJ6@:O(o+EV:.+E_aJ@;I'.ATMr9F(KH9E$/S,A0>u*@<*K$Dg-(O$;No?$;No?
+CT>4F_t]23XSVK/db??/g)8Z0e"4nFCfN8C2[W:.3N/8@ruF'DIIR2$;No?$;No?+CTD7BQ%oP
+<X9pBPnq\/g*JhCLqMn:-pQU@rc-hFCeuD+>PW*2.:W?0K'8567sBjBOPdkATKmT/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhK0RI_K+=D8BF*)/8
A2#AR>9G^EDe't<-OL2U67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:EscApDeq^=:JEN+3Zp*`@W-1$
5u^WS0g.Q?0a_B.Der*=;cGn@+?qJ$0eb:+1(%K/DerB=6;0g23ZpX>+>k8r1E[qc1("A&DKJ0D
:JEN+3Zp-aBl8#l5se764ZX]M/g*"o1F+\/0FA/!Ci<a(9M&/^4ZX]E2_I*N+=/-p/g)r(0I&>/
$4:9V@<,%5;cGn@+=B`'@;R-2BOQ!*8K_GY+C\nl@<HX&+A!\dD]j7;@<<V`+CoC<$4:j"D,`ef
4ZX]A+?)5%,Tq.h+=A:UAKYE%AKZ&>D.7F"F!+n/A0>u-@<<W+F!,(/DIk1&$=[pu;cHad7QidT
-p0gl:J=GR;cG1s-p0sm:I.rR8Q/S;/3Hj69iODF$49Np/g,4WDfTD3Ci<flCh4`5DfTB0$9g.j
FDYu5Ddso/F`\`M/gkOQ?U6tDF)>i2AN;b2?Qa&81a`V;:-pQUF)Po,+EV19FE7dQ0RGMsE-67F
-Za-CCLo5"ATMrI-T`\1+?^i%+AP6U+EV19F<GX7EbTK7-ON$kHSHX^F`\`RF)>i2AMI.qF*',a
4!ud+4WlL&:-pQUFCfN8+EM%5BlJ/A$49Np/g+RFAn?0/B6%p5E,u@M0RIGQE$-N;Df9H5D/X3$
0df%*4$"`uDf9GX<)64B+C]8-CdD#r9edc"Df9Gk5se76-ON$kHY7A<+=Cl@FE;;;CLo4J4!6UG
-Y[I?5u^WS0Hb(IFAtOm9LU<9$;No?+CQC6F_Pr/$9g.j1E^=NE$-NLF_Pr/F)>i2AMGPo+?MV3
F)>i2AMI.qF*')YF)>i2AMI.qF*',a$49Np/g,4RD.Oi,@:O=rEsb)b>;RIAF`\`RF)>i2AMHnf
@rcKA-Ta(<4""_p+>P`#$9g.J1a$a[F<DrPD/X3$0hl(dEc3Z[4#/NP-Vcu\+A!\dD]iq9FD,B+
B-:Z+F<GL3@s)a9+EML1@q@888K_GY+CQC/BjtXo@;I)7$49Np/g+tA@<Q3)A8,OqBl@ltEd8dG
E+Np'Ddd0eF_u(rD/X3$0JH6g/h1[U@:WnkD/`EjDeio<0HbHh/KeSHD/^V=@rc:&F<GU8Ci<`m
Bl7Q+F)>i2AKZ)+F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?+:SZQ67sB'+>G;f.!0$AFD>`)
0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+ED%+A0<7AATMs.De(OL4)/_CFD)dEIS*C(<(0_b06CcH
FD>`)0II;::-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?
De!lC2%9mf67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`$r$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%16T`
@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&4=<E\6$$m]
CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9F(96)E--.1
$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0TD/X3$FCfN8
0ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX+Dbt)A5d>`
CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>+0RI_K+=D8BF*)/8A2#AR>9G^E
De't<-OgCl$;No?+EVaHDBNk0Afu20D.Rd1@;Tt)%159QHXq):ATT%B;FOPN8PVQA741/N%13OO
:-pQUA7]RgFCcS'Cht5<DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1
+Co&"-9`P,+FPjh/j:Cr@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL!
@VTIaFE8R=DKKe>FCfN8+Co1rFD5Z2@<-W&$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$
FCfN80F\@D+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$4R>;67sBkF_u(?@s)g4
ASuT4@;]TuEb0'*@:TfSA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO
:-pQUFEMVA+E)-?FD5T'F*(i-E-!.1DIal#F_u(NEb0'*@:TfS4tq=oE-#T4+=C&U<'a)N5t=?k
4#%0OA7dtc+DkP&AKW?J+<V+#0d'[C-n$bm3\W!*3]\Bj0fga+HTG\L%13OO:-pQU/ULGc;cFl<
<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%14L<3$C=>.3L`#@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]R/DeioE3B:G_Ddd0uATMrI0JR*P@ruF'DIIR2:-pQ_Ci<`mFCfN80JG4lBk)7!Df0!(Gp%2\
/KekJ@:UK8GT_*>F*&O8Bk)7!Df0!(GqKO5:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTf@<jU^+=Lr=De(:>Bl8$(Eb8`iAKYf-@ps1b+CSekARlp*D]iLtF(HJ'
@<?0*%15is/g)8Z+<VdL+<W(IDe*s$F*(u6.3NYBEHPu9ALD&"%15is/g)l'DJs\R1*C^YA79Rk
A0>K&EZdtM6m+093A*-=%15is/g)l'DJs\R1E\)ZDf^#AAT0(@Eb0*+G%G28+=M>CF*&iRA7]Rg
FCeu*/Kf+GAKYGnCi=M,$;No?+>G`gF`&rm+D,2,@q]RoB-8U%ATMr]Bk)7!Df0!(GsldlE%)oA
Ec5e;-u*[2FCfN8.3N/8@ruF'DIIR2%15is/g)l-C3=DL0Hat=FCSuuDJ((?8oJ6=Dfp)1APcfW
BLHu[E%)oAEc5e;-u*[2FCfN8.3N/8@ruF'DIIR2%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9
AKW@8De*s$F*(u6-OgCl$;No?+DGm>8l%iS78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?
3Zr0V@<?0*-[nZ`6rZTR<$r+^%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2
BK8(5-QlV9@rGq!@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sBQ:IH=H
Dfp)1AKZ28Eb'56/KenAEbAs)+E1b2BHUi"@ruF'DIIR"ATJ:f:-pQU:LdmCF(oQ1@;Kb*+ED%1
@;BEsFD,B0+CoV3E$07@+EVX4@r!2sBOPdkATJu.DBMPI6k'Ju67sBE0RIYFCLnV\De)dbF`Lu'
:gnHZ7!3?c4ZX]6C2dU'BHS[O8l%iS78m/5.4ci"C2[X%@<?08Bkh]:%13OO:-pQUAn?'oBHVD.
F*&O8Bk)7!Df0!(Gp$U8DKKH-FE8RGFDl22A0><%+CQB%$;No?+CoV3E$043EbTK7F!,17+EV:.
+=LuCA9;C(F=A>CAThX$DfBQ)DKI"3Bk)7!Df0!(Gmt*E0RI_K+?MV3C2[X)ATMr9C2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$7Bk(+EM(%F=044+>b3RATT%B<+U,m6tp.QBl@ltEd:&qD/^j3
$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%14J'@j#i'@<<k[3Zp7%B4Z0--VA;f;f?f!@qAJFFD+'b
D/^j3$7L6R+u(3]A79R/4ZX^43[-:$F(A^$%159QHSZd_A0<77De*s$F*&c=$4R>aATMs)DK]`7
Df0E'DKI!KB5_^!-T`\J:IHQ>$4R>REZf:2+=D8BF*)/8A2#_c%13OO:-pQUA7]RgFCcS'Cht5<
DfTB0/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr
@WNZ&DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+tK@:UL&ATMr9A9Da.+EM%5BlJ/:
%14L30HiJ30JFpu3]\B;3[l1NATMr]Bk)7!Df0!(GsldlE"*.aDe!p1Eb0-1+EVI>Ci<fj5s[eY
Eaa$&3B9*,%13OO:-pQUE+*6l+Co1rFD5Z2@<-W9FDi:BASl@/AKW1-ART*n+D,>(AKYK$D/aE2
ASuU2%16Ze+E1b!CLeP8FCfN8C2[W:0ddD;%15is/g,7LAKYT'Ci"$6Bl7Q+Bl8!'Ecc@FD..=-
+EM77B5D-%Ch[cu+Co&)@rc:&FD5Z2F!,(5EZfREEb'56GA2/4Dfp.EA7]glEbTK7Bl@m1+:SZV
4ZX]tF(K594s2O%0d&7pDJs*2E$-MU%16#s3Zq?D,CUa`4>83,IQATu/g<"m;[j(FEZd%Y3$<0_
F<DuY/g<"m;^ih?/g)Q%0IAn7+tt,a-9`Q!3[-:$;^ii9/g`27+F?-n0d'C($4R>;67sBtATDEp
+DG^98l%htF)Q2A@q?)V-n$bm3\W!*3]\B;3[l1DDe)dbF`Lu':gnHZ7!3?c%16T`@s)g4ASuT4
FDYu5De!-?5s]U5@<6*B3B:FU$4R>;67sBnASu("@<?''@;Ka&@rcL/F!,L7An?!oDI[7!+>"^M
B5VX.Bl7Q+ATDg0EcW@3F!,=.DL!@KDfTB0%15is/g+SCAKYi(F)u&5B-:W#A0>_tDL!@5D.73l
Dfp+DDIIBnF!+n3AKY](E,ol9ATDU4+Co%nCgh?qA1e;u0d'[C0Hb"EDdmc74s58++CoA++=ANG
$4R>;67sBU:K0b*:.\/V3ZqsECh7^"+EV:.+EqaEA0<:BATMrB+DGp?@rH3qF!,17+EhI-+=L3#
F*'fa@ruF'DIIR27!3?c.1HVZ67sBhDIal+ART+j+EVNED..3k+D,%rCisc0F!,17+EV:.+A>6l
+>#/fFD,6+ALDOA@3A0<6m->TCLmq^:-pQU@Wc<+FD,*)+E(b"F`MOGGA(Q*+EqaEA9/l;Bln#2
FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn%15is/g+Y?@<6L$F!+n1E+NHu+DG^9A8,Xf
ATD@"F<G+.@ruF'DIIR"ATJu4DBO%7AKXT@6m-GWFD*99$;No?+A$GnFD,B0+Co1rFD5Z2@<-W9
.!0$AFD>`)0e"4nFCfN8.3N>G+CQC9ATD64+A$Gn%15is/g)QaATMs.De(XQ+DGp?BlbD*+Du+?
DD!&0ASl@/Bl7Q+BlkJ2ATD?)Eb0*+G%G_;FD,4p$;No?+C]J+-Z^DPEbT0!ATBCG=(l/_+A!r(
AKYT!G\(D.FD,B0+A!]"Bl%T.D..3k+EM[GAISuA67sC&BPDN1@psFi+DGm>Eb031ATMF#FCeu*
Bl5&8BOu6r+D58'ATD4$ARlp*ATMr9A8,OqBl@ltEbT*+/e&._67sBUDg!6Y1FsY(0JP9k$;No?
+>G!C+Co&"+=D8BF*&c=$4R>;67sC"@:O(`+CT.u+DkP&AKVEhATAo4@:O(`+=D8BF*)/8A2#_c
%16Ze+DkP&AKW?J%13OO:-pQUF(fK9+Cf>4DKKq/$>"6#F(fK9E+*g/+Co1s+FYFe%13OOATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$3  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c-=6+>P&o0H`,/+>GVo1-$I31*AA0+>GPm0fC./0H`)/+?:Q%1E\D4+>kubDJW6gDeio<0IUCJ
CagK8EbBN3ASuT4F)>i2AKZ)+F*)J5Df'H.;f-GgAM>f[ATMr9-t@14E,$gEDIIBn+E(_$F`V&$
FD5Z2@rH4'C/\tfCLo1S-t@14E,$gEG%#3$A0><$B6A'&DKI"BD/X3$+EV19FE:u,A5d>`CLo1R
-tI%&.3N\KDeio,FCfN8A8Z3^D/X3$0JFncDJUaEF)>i2AKZ)+F*)J7A5d>`CLo1RF)>i2AKZ)+
F*)IGDe:+?ARm54-uNI1ALq%qCghC+>qC)/G]YAWFCAWpAKYPpBln',B4l%!@WPIbDeioMF)u&.
DD3auBl7HqEb/a&+CT>4BkM=#ASuT4De:,)Ci<ckC`mk<EHQ2AARlp$@;TQuCh[s4+Du+?DK> ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fLj10fL42+>G_r1*A;21GLd11,'h++>Gf71H-F21a"Or2E!NT+>PVn1*AS30d&2*+>P&p0K:j2
0ea_*+>Gi22`)X31E\Fq1,UjB+?(Du+>GZ33B&'>+>P'"2D[<83$9t!1,(OA2]sh/+>P&t0Jtj5
0fC.0+>G]50H`)/+>P'!3&Da42]sju2DR*30eje++>G`.2'=V6+>P&s3AVd42]sju0f1^G8l%iA
<CokP84c`Z:Jt=N2,6Ij+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#
+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO0f][M$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp='8p+qm1,(F?+>GT31,M$I2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QR$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg2'>M6C`kJe
0f:(-3BB#U3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2'=#0@<?'A+>Get8p+qm1,(F?+>GQ22)mWO1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`O$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2]t_8C`kJe
0f:(.1-.6H3\iT#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?1Jd
6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Get8p+qm1,(F?+>Gf90JPUC1^XQs:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>PYo8p+qm1,(F?+>GT30K2$J0a\6p
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PYo8p+qm
1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t
1*@]-@<?'A+>P_q8p+qm1,(F?+>GQ22)@9L3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>P_q8p+qm1,(F?+>GT31,1gH3!p!":-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>P_q8p+qm1,(F?+>GT31,CsI
1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>Pbr
8p+qm1,(F?+>G`71H7EP3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P<t2BX,1@<?'A+>Pbr8p+qm1,(F?+>G`71b^sH2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>Pbr8p+qm1,(F?+>G`71c[TS1C=Hr:-pQU;gEG+
ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp17
+A-cm+>PW*2'=V33\`HP0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS0f^@!6t(1K3Zp1;+A-cm+>PW*2'=V23]&fW0Ja%C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmF+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp1;+A-cm+>PW*2'=V23]/WQ0f'.D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp1<+A-cm+>PW*2'=V-
3\W<M1,fOI$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K
3Zp1<+A-cm+>PW*2'=V-3]/lX1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+>Y-+F_;gP0JPF-0K;*L1HI<O$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+@1-_+>PW*2'=S53\`QS0Jj+D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD
2EEWL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqi
+@1-_+>PW*2'=V.3\`WU1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>Y-+F_;gP0JPF-0ek^F1-.*E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+@1-_+>PW*2'=V.3]&]T0es(C$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKM
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi+@1-_
+>PW*2'=V33]&TQ0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
3?TG4@<?'A+>b3,F_;gP0JPF-0KD0J2**TM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU2'>2-B-8r`0f:(.2EETP3]&]$$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fB@G
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp='6$6f_
1,(F?+>>f:0K(sH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+>t?.F_;gP0JPF-0ebXF3BAlN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU2BY;.B-8r`0f:(.0fh$H3\iQ"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)bjL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp='6$6f_
1,(F?+>Gc82)@9I3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<t
2]s52@<?'A+>t?.F_;gP0JPF-0fV3M1-.-J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$
6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU2]tD/B-8r`0f:(-3'&fN3\`Gu$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1,fOI
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3ZpF*6$6f_
1,(F?+>GQ21,:mJ1C=Hr:-pQU;gEG+ASjIN8l%ht4?R+lD/Ej%FCeuH4s3.6FD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1,0mo6t(1K3ZpF*6$6f_1,(F?+>GQ21-%BL1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+?:Q1F_;gP0JPF-0ebXG1-.-F$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.2+@1-_+>PW*
2'=S43]&iX0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU0ea_9F_;gP0JPF-0KD0K1HI<J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Vm%6?R!Y
A0=WiD.7's3Zp."+@KX[ANCqg0H`Z(B-8r`0f:(.0KLsC3]&T!$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GSn6$6f_1,(F?+>>c91cIHN3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*Al*B-8r`0f:(.
1cdHN3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A
+>GVo6$6f_1,(F?+>G]61cRNN3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3A;Qu6?R!YA0=Wi
D.7's3Zp7%+@KX[ANCqg+B)ij+>PW*2'=V33\rTR0JWtB$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibp7+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0d'D+E$-ni0f:(.2EEZL3]&Z#$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>k9;@rrhK0JPF-0f1pG1-.*L
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO
+>PW*2BX_23\`EO2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU0f1"I@<*JG0JPI.0etdD2``]L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&
6?R!YA0=WiD.7's3Zp."+@KX[ANCqg1a#M$EZd+k0fC./1HI?M3]&W"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Jj+D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>PVn9jr&b
1,(F@+>GT31GLpG2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/r?+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,'hF@<*JG0JPI.0ek^G2EEQQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&_s&
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh0Ha(uEZd+k0fC./0fh0H3\WK"$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gE3BB#Q$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3ZpF*8muT[1,(FA
+>PZ41,CsG2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp4$+@KX[
ANCqo+A-'[+>PW*2]sk13\rHN0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`
F_tT!E]P="+<X'\FCdKU1,U1DARZc;0JPL/0f1pF0fh$F$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP1H5^K$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,U1DARZc;0JPL/0f1pK
0KLsI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp18
+@]pO+>PW*2]sh33]/cU2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!
E]P=&+<X'\FCdKU1,U1DARZc;0JPL/0f;!G0KLsL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh53\i]V1H5^K$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>Pes7V-$O1,(FA+>Gc81GCjE
0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,U1D
ARZc;0JPL/0fD'L1cdBN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqh2'>A"@N[E[0fL402``WK3]/l($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
0H_K)F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&W"$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh2]tS$@N[E[0fL410KM$J
3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh
2]tS$@N[E[0fL410KM'G3\r]%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3b
Ch+Y`F_tT!E]P<t+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'K$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Po!7V-$O1,(FA+>PZ40f1pI
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp4$9jr&b1,(FA+>Gi:1H%9K1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp4$9jr&b1,(FA+>Gi:1c7<L2$sZt:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM
1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[
ANCqg1*B;"EZd+k0fL401cdEL3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0eskG@<*JG0JPL/0f1pI2EETQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>GVo9jr&b1,(FA+>G]6
1H7EP1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a
6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1E]D#EZd+k0fL411HI3D3\WQ$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f'qH@<*JG0JPL/
1,CsF2``fQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+>GYp9jr&b1,(FA+>P`60fD'M1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsH2**KQ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp.5+AH9b+>PW*2]sk33\rcW2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU0f'qH@<*JG0JPL/1,CsJ1HI6H$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6
+AH9b+>PW*2]sk13\`?M0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!Y
A0=WiD.7's3Zp.6+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2**QR$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K3Zp.6+AH9b+>PW*2]sk13\iWT
0es(C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\
FCdKU0f1"I@<*JG0JPL/1,1gG1-.9N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,
+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU0f1"I@<*JG0JPL/
1,1gH0KM$N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
0f^@!6t(1K3Zp.6+AH9b+>PW*2]sk13]/WQ0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0G$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b
+>PW*2]sk13]/iW1GB.C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp15+<X'\FCdKU0f1"I@<*JG0JPL/1,:mE1-.-E$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp.7+AH9b+>PW*2]sk13\iEN0ej"B
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU
0eskG@<itN0JPL/1,1gH2**KP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,U0s6t(1K3Zp.4+AH9i+>PW*2]sk23\`HP1GK4D$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0f:(J@<itN0JPL/0fM-N
3'&`N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,g<u
6t(1K3Zp.8+AH9i+>PW*2]sh73\rQQ1GfFG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp.8+AH9i+>PW*
2]sh73]&fW1c#IG$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp44+<X'\FCdKU1E];4DBL\g0fL401-.6M3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,@<?'A+>Po!8p,"o1,(FA+>PW30f1pJ1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqh3?V73
E$-ni0fL410KLmB3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!1E[f.@<?'A+>k96@;[2C0JPO00fV3L0KM'F$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp19+A-'[+>PW*3$9t33]&WR1GK4D
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh
2BYV#DBL\g0fU:21-.9J3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3b
Ch+Y`F_tT!E]P<u+<X'\FCdKU1,^7I@;[2C0JPO01,CsF1HIBK$47,867sBZH#n(=D)re3:IH<J
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K
3Zp1:+A-'[+>PW*3$9q23]&fW0K'7F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh1a#8!@N[E[0fU:10KLmE3\`W%$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1E]D#EZd+k0fU:03BB#S
3]/o)$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0f:(J@<*JG0JPO00fV3K2**QS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+?(E/E,m'V0JPO00ebXG2``fQ$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+?(E/E,m'V0JPO00ek^C
2**KP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m
6t(1K3Zp@(6#^ie1,(FB+>GT30ebXE2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0KBII$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2]tD*EZd+k0fU:1
0fh$H3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+?(E/E,m'V0JPO00ek^D2EEWP$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0
+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp.2+@0se+>PW*3$9q83\`?M1GK4D$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V
0JPO00fV3K1cdKM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS0fC-s6t(1K3Zp.;+@0se+>PW*3$9q83\rTR0ej"B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,C%=E,m'V0JPO01,CsG2``WQ$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nG@<itN
0JPO00f_9N2EEZM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;
+<X'\FCdKU1,0nG@<itN0JPO01,(aC2EENK$;+)^<)6:`;aOJU9LMEC;cHOj=Y_j067sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#pj:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2)cX#6t(1K3Zp7%8p+qm1,(F?
+>>K10f(jG0F\?r$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+>l,$+@KX[ANCql+A-cm+>PW*2'=V.3\iNQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+>l/%+@KX[ANCqg2'>M6C`kJe0f:(-3BB#T3]&i($49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=7+<X'\FCdKU0f:(GF_i0U
0JPF-0KD0O2EETP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=$0d%T,@<?'A+>G_r8p+qm1,(F?+>GQ20JkgH2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DQBt6t(1K3Zp.9+A-cm+>PW*2'=V-3]/lX0f'.D$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u"u+@KX[ANCqg2]t_8
C`kJe0f:(.1-.3N3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp=;+<X'\FCdKU0fL4IF_i0U0JPF-0etdH0fh'K$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$2'=#0@<?'A+>Get8p+qm1,(F?+>G]61,M$K1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2Du[#6t(1K3Zp.9
+A-cm+>PW*2'=V43\W9L0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>u/$+@KX[ANCqh0d')2C`kJe0f:(.0fh!I3\iGt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=?+<X'\FCdKU1,0nDF_i0U0JPF-0ek^D1HI<H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3?TG4@<?'A
+>P_q8p+qm1,(F?+>GQ22)@9L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2_Z?s6t(1K3Zp16+A-cm+>PW*2'=V.3\iEN1cPgL$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)"t+@KX[ANCqh1E];4C`kJe0f:(.0fh'G
3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@:+<X'\
FCdKU1,L+GF_i0U0JPF-0f;!J3'&lV$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=%1E[f.@<?'A+>Pbr8p+qm1,(F?+>G`71b^sH3!p!":-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`)X"6t(1K3Zp17+A-cm+>PW*2'=V2
3]&iX2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)/#
+@KX[ANCqh3$:h9C`kJe0f:(.2**QR3\WAt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp@>+<X'\FCdKU1,pCKF_i0U0JPF-0f;!L0fh$G$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2]s52@<?'A+>Pr"8p+qm1,(F?
+>GQ20JY[E2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2`Mp&6t(1K3Zp1<+A-cm+>PW*2'=V-3]/lX1,TCG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O2'=#.F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp4$6$6f_1,(F?+>>c91G_'J3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>Y-+F_;gP0JPF-
0KD0K2``WM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=!
+<X'\FCdKU1E\u+B-8r`0f:(.0KLsI3\rQ!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3&Mg$6?R!YA0=WiD.7's3Zp7%+@KX[ANCqi+@1-_+>PW*2'=V.3\`WU1GoLH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp4$6$6f_1,(F?+>GT3
1GV!F1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>Y-+F_;gP0JPF-0ek^G2**HJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1E\u+B-8r`0f:(.2**EJ3]/`$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpC)+@KX[ANCqi+@1-_+>PW*2'=V33]&TQ
0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp7%6$6f_1,(F?+>>f:0JtmK1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0ea^m6t(1K3Zp:&6$6f_1,(F?+>Gc81,h6N2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp:&6$6f_1,(F?+>Gc81H@KN
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0esjo6t(1K
3Zp='6$6f_1,(F?+>>f:0K(sH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0f'pp6t(1K3Zp='6$6f_1,(F?+>GQ21c[TO1^XQs:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp='6$6f_1,(F?+>GT30f;!I
2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0f:'r6t(1K
3Zp='6$6f_1,(F?+>GT31,M$L3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0fC-s6t(1K3Zp='6$6f_1,(F?+>Gc82)@9J0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp='6$6f_1,(F?+>Gi:1GV!G
2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K
3Zp@(6$6f_1,(F?+>>c91,CsG2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS0f^@!6t(1K3Zp@(6$6f_1,(F?+>PZ41c%0J3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3ZpF*6$6f_1,(F?+>GQ21,:mJ
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K
3ZpF*6$6f_1,(F?+>GQ22)73I1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0K;*M3BAlN$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg0H`Z(B-8r`0f:(-3BAlN3\rT"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Vm%6?R!YA0=WiD.7's3Zp."+@KX[ANCqg
0H`Z(B-8r`0f:(.0KLsC3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>Fu]6t(1K3Zp.3+@1-_+>PW*2'=S43]&cV1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>GVo6$6f_1,(F?+>G]61c7<J2@9cu
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU0esk;
F_;gP0JPF-0f1pJ3'&fK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3A;Qu6?R!YA0=Wi
D.7's3Zp7%+@KX[ANCqg+B)ij+>PW*2'=V33\rTR0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>G!;AT/bI0JPF-0fD'L0fh-K$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp='+@KX[ANCqk+AZKh+>PW*
2'=V13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>GPm7V-$O1,(F@+>G]60f(jJ2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmM+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>G\q9jr&b1,(F@+>GZ51cIHL2$sZt:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>PVn9jr&b1,(F@
+>GT31GLpG3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmM+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>PVn9jr&b1,(F@+>GT31c@BM0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibmM+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>PVn9jr&b1,(F@+>GT32).-G3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU3?Uq&DBL\g0fL41
0fh'D3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^
6t(1K3ZpF*8muT[1,(FA+>PZ41,CsG2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU3?Uq&DBL\g0fL410fh*E3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp18+@]pO+>PW*2]sh33\W9L
0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>Pes7V-$O1,(FA+>G]61bh$K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3b
Ch+Y`F_tT!E]P=$+<X'\FCdKU1,U1DARZc;0JPL/0f1pK0KM!I$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2'>A"@N[E[0fL402EEWJ3\iQ"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp18
+@]pO+>PW*2]sh53]&ZS1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&
:3CD_ATBgS3?TG4@<?'A+>Pes7V-$O1,(FA+>Gf90JbaI3!p!":-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpG+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+@]pO+>PW*2]sk03]&WR1c5UI
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh
2]tS$@N[E[0fL410KM$J3]/c%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!Y
A0=WiD.7's3Zp.4+<X'\FCdKU1,g=FARZc;0JPL/1,(aH0fh*L$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh3$:\%@N[E[0fL41
0fh$C3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>Po!7V-$O1,(FA+>PZ40f1pI1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqi+AH9b+>PW*2]sh73\rZT0f04E
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\
FCdKU1E]D#EZd+k0fL403'&lR3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GVo9jr&b1,(FA+>G]61,(aE1("?q:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqg1*B;"
EZd+k0fL401cdEL3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>GVo9jr&b1,(FA+>G]61H%9L3!p!":-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqg1*B;"EZd+k0fL40
1cdEP3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_
ATBgS2'=#0@<?'A+>GVo9jr&b1,(FA+>G]61c%0K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1E]D#EZd+k0fL411HI3D3\`;q
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>GYp9jr&b1,(FA+>P`60K2$M1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI
+>"^HATf1=6?R!YA0=WiD.7's3ZpC)+@KX[ANCqg1E]D#EZd+k0fL411HI6K3]/]#$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>GYp
9jr&b1,(FA+>P`61,1gH3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0f'qH@<*JG0JPL/1,CsH2**NI$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1E]D#EZd+k
0fL411HI<P3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS0esjo6t(1K3Zp.5+AH9b+>PW*2]sk33]&WR0f04E$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>G\q9jr&b1,(FA+>PZ4
0ek^C2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp.6+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[ANCqg1a#M$EZd+k0fL410fh'K3\`As
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s
6t(1K3Zp.6+AH9b+>PW*2]sk13\rNP2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>G\q9jr&b1,(FA+>PZ41H.?O3=6*#:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU
0f1"I@<*JG0JPL/1,1gH0KM$N$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqg1a#M$EZd+k0fL410fh0I3\iJu$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,'gn6t(1K3Zp.6+AH9b
+>PW*2]sk13]/iW1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u0d%T,@<?'A+>G\q9jr&b1,(FA+>P]50JY[D1("?q:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\FCdKU0f:(J@<*JG0JPL/
1,1gF0fh$E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>P_q+@KX[ANCqg1*B;"Gp"jr0fL410fh-K3\rGs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp.4+AH9i+>PW*2]sk23\`HP
1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
2'=#0@<?'A+>G_r9jr;i1,(FA+>Gf92)mWN2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0fC.K@<itN0JPL/0fV3M1HI<M$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqg2BY_&Gp"jr0fL403'&lR3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp.8+AH9i+>PW*2]sh73]&fW1c,OH$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>Y-4
F`&<W0JPL/0etdH2EEWS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh3$:h9DBL\g0fL410KLpF3]&Z#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GL!p6t(1K3Zp1<+B)ij+>PW*
2]sk03\W9L1,0+C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=!1*@]-@<?'A+>k96@;[2C0JPO00fV3L0KM'G$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp19+A-'[+>PW*3$9t33]&WR
1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU1,^7I@;[2C0JPO01,:mJ1-.3I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^6t(1K3Zp19+A-'[+>PW*3$9t43\W?N2)>RH$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=!+<X'\FCdKU
1,g=J@;[2C0JPO00etdG3BAiN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8
Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1:+A-'[+>PW*3$9q23]&fW0K0=G$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU1,L+CARZc;
0JPO00ebXB1cdBG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&
+AR&r@V'R@+>t>b6t(1K3Zp4$9jr&b1,(FB+>>f:2)REK0FA-o:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg2'>V%EZd+k0fU:13'&cO
3]/Su$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+?(E/E,m'V0JPO00ebXG2``fR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp@(6#^ie1,(FB+>GT30JtmH3!p!":-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU
2]tD*EZd+k0fU:10fh$C3\r]%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,
+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp@(6#^ie1,(FB+>GT30etdE0FA-o:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU2]tD*EZd+k
0fU:10fh$H3]&i($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&
:3CD_ATBgS0f'pp6t(1K3Zp@(6#^ie1,(FB+>GT30fD'K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU0ea_9E,m'V0JPO00fV3K
0fh*F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@
+>G_r+@KX[ANCqg0H`Z#EZd+k0fU:13'&cN3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp.;+@0se+>PW*3$9q83\rTR0es(C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52
@<?'A+>P_q6#^ie1,(FB+>P`60fM-J0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+AH9i+>PW*3$9q93\rZT1c#IG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'2!Gp"jr0fU:2
0KLmG3\WDu:L\BVEcu#)7<3EeEcWun:-pQ_:L\BVEcu#)7<3EeEcW@E/M/)SF_;h5DeC2$DIal1
ATMg/DKBB1/e&-s$4R>;67tA`-o!.n@rc"!BK@8SDBNb,B5)I%D..Nt+=Lc<CagK8EbBN3ASuT4
-u*[205<?u1ark@:-pQU1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO+<VdL+>b2r+CoA++=C]B-OgF"
ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!lFD`4H/e&-s$;No?4[(8K.3N5:
GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7Eb,[e:-pQUFD,*)+CT/5+Du=<
C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"DDfB9*+EVNEDKTc3%15is/g,7E@VfUs/g+,,BlbD/Bm=31
+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>PoG%De.@;0OhA0>f.+E)@8ATAo%
EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ67sC)Bln#2DJpY=F_Pr/F!,[F
F_kS2BOQ'q+D,%rCh7-"%15is/g)8q+@0se+>PW)2'=V13\WBO1,04F%13OO:-pQq4X`'7+CfG#
F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf2(gR>%15is/g+\=@ruF'DIIR2
/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*Gmt*U67sBoATD?)/KeS<@ruF'
DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>+CoC5DJsV>F(fK9%15is/g,7LBlbD.EcQ)=+>"^MDIdHk
@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4E,]N/B-:o++CQC)ATo8;Dfp/9
DImlA%15is/g)o0+AH9b+>PW)2'=V13\WHQ1GTCH%144#+ED%+A0<77F`(tB4""N!>\[\fA8,Oq
Bl@ltEbT*+>]++pD..-r>\[\fDImp,@;0U,%19tYA8c<nBl5&)EcQ)=3Zr0EEb/Zi%19tY+<Ve=
Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;67tDb-o*4oAncKN+EV:.+DPM&Ch7Z1G%G]'F!+n3AKYl/
G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?+CSf(ATDj'+?DP+FE1f/E+NQ&Bl8$(Eb8`iAKYE!A0>;s
C`mh<E$/t.G%GJ4@rHC!%15is/g*b^6m-\lEb'56@<,p%@;L"'+EVX4E,]B!/g)99BPDN1ATDg0
EZfR?Cht58FD5Q-+E(b"F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi+C]&&@<-W9Anc'mF!+q7F<G:=
+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u%13OO:-pQq4X`*8+EqjEDJ)!Q-tI%5E%)o?De3u4DJsV>
E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU1a#)'EZd+k0Jst-1HI<J3]&Q#
$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ#+<Y3'FCB9:E+L/7A.8lgDJ<U!
A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?DBLMp_R"!"DJR+q%1:"'_h>pY
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY_h>p\_h>p\_jLr@+<Ve<Eaa$#
+=D;B-OgD;%144#+D58-+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4Anc-oAAYY^$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg$6UH6A79RgFEqh:+E_3($?^6#
@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60@<iu;BOr;P;aX,J+Eh=:F(oQ1
+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5ZQVq:6m-&]Ec5tZ+Co%qBl7X,
Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$4R>;67tDb-o3:pAncKN+EqaECNCV4DBNb(FCfJ8G%G]8
Bl@m1+E(j78g#].FCfN8+Cei$AKYMtF)Y,sBk)'lAM>em%13OO%13OO:-pQq4X`-9+D#S6DfRl]
FD,6+AKY].+CQC/Df021F*(i.A8,po+E2@>@VfUm+EqOABHS^@@;TRc@<?Q>+DG^9FD,*)%15is
/g)9IARfObEb/c(F(9--ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVAARlonDfTl0@ruO4+:SYe$;No?
4[(8N.3N5:GWHrV$4R=O$4R>;67tA`-oEFrATDg0E]P<kD..3k.3NhCF!,('Bl%L$B-;;7+D58'
ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMpE+NotASuT!$;No?+Dbb5F<G.3E-,f*A0>u-AKYW+Dfp"A
Ch[s4/g)8G$4R=b+E(d5-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH+C?lHD..3k+=DAOEb&d#Ec#6,
Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG@;]^hA0<:;@;BFeF"&5RD]i_%DIdQp+EV:2F!+t$F(Hs5
$4R=O$;No?4?Y)N.3N2=E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$ARlomGp%-MDJj0+B-:`-D/aQ+
EbTK7F!+q'@psM$AKYW+E$-NG@;TR'4!uBb$;No?+D,%rCi^_;DBNA*+DG_:@;KXg+DtV)AM,)7
$4R>;67tDb-oNLsAncKN+=LlDD..3kE@E#IDe*QoBk:ftFDi:BASl@/AKYE!Gp$[8E-,f*F!,(8
Df$V7@;TRlBleA=@V'.iEb,[e:-pQU@rc-hFD5W*+D5_5F`;CE@;]TuF*22=ATJ:f%13OO:-pQq
4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1+EM77B5D-%DIIBn+Cf(nEa`I"
ATAo0BleA=@<-"'D.RU,Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK3]&]'$4R=O$6UH6C2[WkB4W25
A92j$F=/1R:-pQU@s)m7+DtV)AIT"+P`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'c
F*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZ
SDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%*+<Vfd
P_(YE0K1[G0ek:;+<VdLifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:*+<][.Ji>\4
+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifof>$6UH6%13OO+>P&^C2[WkB4W25@WQX"FE8f=$K@;/ifnuQPcWl/JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQ
PcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&OD
F`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOF
FQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'
Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M
0JGF>3AE6@1bg*qifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufD
ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjB3$>OKi@:s-o4$"a"F*(i4+ED%&-QjO,67sC!
CER5-EZf14F*)I4$4R=u+DPh*@:s-oI4cWu+CoA++=ANG$4R=O$;No?4?Y)P.3N2BEc5tZ+Dbt)
A8,po+A,Et+CoV3E$043EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26DJ()&F_u(?F(96)E--.1$;No?
+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!+n5
+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!$8<Va0H`J*@lc8XDe(M9De*g-
G%>`4E-![LAT089C3(a3$4R=b/hSb/+E)+2FED))+EV1>F<E1g/hRS?%14U;.kN>)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7
%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN8'/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17K!ASu.&BHUl,Ec5tZ+CoC"$@Es=+D3hi
6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT?Y"'a$4R>;67tDb-o`XuAncKN+Du+A+Cf(r@r#drB-:f)
EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq:LeJh1,(F?+>G]60fV3L3=Q<)
$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,FuB6,2:Df'&.Ci<flC`m/-F(o9)
D.RU,F!,RC+E_RAF`2A5A.8l@67sBpDIdI%ARfg)B5DKq@;L!-@<3Q"+Dkh;ARlolF)u&.DJ`s&
F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB73?V+-F<E=m0f:(.1-.9L3]&Q#$4R>;67sC&BOu3q+CT;%
+Du*?D/"6+A0><%F(o9)D.RU,F!(o!D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=4ZYDB3Zp*c$7JV[
FD,T'6#pU\D.RU,F"'7)+>=63-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn$;No?+DG\3Ec5o.Ebp"D
Eb0?8Ec,q@D/"6+A0><%F(o9)D.RU,Et&IhCi<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfR37
$4R>;67tDb-oi_!AncKN+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"4EcQ)=+D,>4ARlnm$;No?
+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'$;No?+D#G$/T55QDdmd!Ecu#)/S/sCDfTn.$=\-lCh.:!
A7TCqFE2))F`_>9DDEqA67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))
F`_>9DBND2Bl%;h$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eODe*="Bl%<?
3B:G03Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$Eaa$#+?V#;5s]7(A7B[qCh,Od3@>7C@rH(!F(KB6
+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+A,Et+Co1rFD5Z2
@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;
67sBnATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0
@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R=i8l%iR<'a#C6qL9!8l%iF8Q8)L;BSS-6rQl];F<lO
<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA;BSS-6q9gJ6r-0<8Q$[':IIK:6r-QG
8Q$[':IJ,K;Fs\a6qL9!8l%iD=B&3e8Q$p!3ZrKTFCKB,Ch.'jEcW?W%13OOF`:l"FCf3*A8Pam
BkCptF<E7H$;+)^<_Yt)@WcC$A86$n@rH4'Eb0<5ARloU:IJ,\5t=@38Q%WB:II]E<(';U4%`::
5t"+::..ZO4%`::;aXGS:fKhS;@Nt*:IJ/X:J=\f9gg+5F_PZ&C2[X)Df9H5@rH4'Eb0<5ARloU
:IJ,\5t=@38Q%WB:IIWR<)Z1V;EIKH6rQHN8PiAS8Q$!)8l%iU9gg+HE+EC!ASQ-oA8-+,EbT!*
FD5Z2+A,Et;cH%Q779^F4%`::7nHZJ8Q$!)8l%iU9gg+HE+EC!ASQ-oF)Q2A@qB1nD/aP=8l%iR
:K::[78m/O7n#g;;@Nt*:IJ5X6m-M]Ch7$rASQ-o+A,Et;cH%Q779^F4%`::;cH%Q78QBA6qL9<
8l%iR<'a#C6r-0<8Q%WB:II]E<('ML6qL8c$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_
E,9H&?U6tDC2[WlF_PZ&3B9*,%13OO%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=/M/)f
E+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu$;No?+Co2,ARfh#Ed98E
:-pQ?:-pQUG%G]'@<?4#3XSVK/db??/g)8ZEb065Bl[c--YI".ATD3q05>E9-QjNS+AP6U+E(_2
@;0U%8l%h^:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41DBNJ(
@ruF'DIIR"ATJ2R67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+<XEG/g,(OASrW$Bk)7!Df0!(
Bk;?.FDi:1@q0(kF!,R<BlbD<@rc:&F:(c0/db??/g)8Z0d(LR+=CW@Bl%<pDe*QsF!i(Q:-pQU
Ecl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1/g:/db??/g+SDF*2>2F#jY'
67rU?67sBUD]iV3Ec5t@@q]F`CM@[!/db??/g+&'EHPu9ATJu8FCB&t@<,m$8g&(nDe<^"AI;1!
/db??/g+SFFD,T53ZoP;DeO#26nTTK@;BFp$;No?+CfG'@<?'k3Zp130emEcDD3gQ:-pQU@q]:g
B4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)
67sB80ktiK0K1+_A7T7^+DPh*E,ol/Bl%?5Bkh]3C2[X%@<-4+/no'A+DPh*F`V,7@rH6sBkLm`
CG'=9EsbZ//g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^SF`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu
+E_R4ATAo%Ch[Hu$4:9]@s)g4ASuT4-XpM*AL@gpDe!TlF)rIGD/a<0@p_Mf6$.-UF(dQo3F=p1
+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go@rH(!F(KB6+=Cl<De(4&$;No?
+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>mDf9PW3Zri'
+Co1s+>=.@A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`3$;No?+D,2,@q[!*AT;j,Eb/c(
F`_>6F!+n/A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n
-OOU,A9MO)F(oQ14ZX]:4tq=U:IJ5X6ja8r67sBhCh[Hu+DPh*Bkh]3A8-'q@ruX0Gm[/>6q9gJ
8l%iH8lJPP<(K/5+<iEc5tjit/3@Zd@rl7,?XHE$6sj:n:IK,1C*7jUHTE?*+@K$l<(LA';cI+2
8l%in@VQ6B:II]E<(]qS8P2oX5u^B<3Zr0V@<?1(AT/ba:II]E<(]qS8P2oX5u^B+-YdR1B5)H@
C2[WsC3)$U$49Np/g+e<DImisFCcS)Df'?&DKKH#+A,Et+Cf4rF)rIF@rc:&FE7e(@r,RpF(KDU
3ZpLF-YdR1+DPh*F*)>@AKY`+A7TUf+DPh*D..3k+DPh*F`_>6+DPh*FDl)6F!,49A8c?5$>OKi
Anc'mF$2Q,-p07-?SNuPD..3k-9`Pe@r,RpF(KD"$;No?+ED%%A0>Au@<6K4Anc'mF!+q#@quE"
C1D'gF)to6+=nil4s2s8A79R-.6T^7Eb/Zi-8%J)HTE?*+DPh*Anc'mEs`7L67sBjDes6$@rri:
@<-(#F`S[B@:O=r+EM%5BlJ08$7Bk(+EMR5-TsL51a$FBF<EY+-YdR1E,ol/Bl%?'C2[X%@<-4+
+DPh*F`V,7@rH6sBkLm`CF9H;HS-Ks+EMR5.6T^7HTE?*+EMR5$49Np/g,:UA79Rk+Co2,ARfh#
Ed8d>Bl%@%$:[T\78l?1+=Lu7CghC+ATJtF+F>^b0d(OX@jrNO-8%J)4=;aqC3(a07S-9B;a!/a
-p1*t6q9gJ8l%iH8lJPP<(JG\/1)u5+@\pr78jOI4DJeFA79R&+<VdL+D,h<Blmo/4"u"N8PDQO
$8=SWDe*p2DfTE"@<<W(GB.D>AKX&hHU^S#78jOI4DJeFA8bpf@<<V7+D,h<Blmo/4#2.P8PDQO
$8=SWDe*]nCLq$bF<D]<GB.D>AKX&jHU^S#78jOI4DJeFF`_>6A79R&+D,h<Blmo/4#D:R8PDQO
$8=SWDe*s.DesK*@<<W(GB.D>AKX&lHU^S#78jOI4DJeFDf0)oF<D\K+D,h<Blmo/4#VFT8PDQO
$8=SWDe*g-De<^"AKW+-GB.D>AKX&nHU^S#78jOI4DJeFE+*d(F!)SJ+D,h<Blmo/4#hRV8PDQO
$8=SWDe+!3ATD:!DJ!Tq@UX$p+D,h<Blmo/4#qXW8PDQO$4:ikDfp/@F`\`R@rH4$ASuU$A0>W*
A8,e"+EM%5BlJ08+E_X6@<?'k-OOp3Dfp/@F`\`u:II]E<(]qS8P2oX5u^A^$;No?+ED%7FDl22
+E)41DBNJ(@ruF'DIIR"ATJ2sA0>f/D]i7,1E^UH-RT6.@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#
+?Xa_E,9H&?U6tDFE1f2BK8(5?OCI\F*)>@H"q8.1,04FB4YslEa`c;C2[W*/KeP:@;]^h+D>J1
FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<P1E\7lA7]on$4R=b
.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$
BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6
@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e
+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<X$403*()EcWmK
DeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'
@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#
+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;IR6_(7k[hQ=CuST
E-Q59/no'A%13CJ%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:Wne
DK@E>$6UH6+<VdL+:SYa$#j^!F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#
+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD
+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+
GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U
@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7
Bm=3"+CT>4BkM=#ASuU2/dVgn$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%
0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>
%144#+<VdL+<W*B$4."J$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mo>B.6V&]BOPs)@V'+g
+CSekARlp*D]iG*@;TRc@<?Qu+EVN2$6UH6Dg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE9&W<+ohc
AoDL%Dg,o5B-;#%B5)I%D..Nt+A*bq@<?U&Ec*!/$6UH6BlbD>F(Jl)Bl5&%+Du==@V'R&De:+a
:IH=LDfTB0/e&.1+<V+#+<VdL+<VdL:-pQUDg#]4EbT&q+Dkh;ARlolF)u&.DJ`s&FE8QQ?90Mu
3XlE=+<VdL+<Ve%67sB/A8Wh=@;p0s@<-E3FDi:2AKYH#FD)e5De!3l+CT.u+D5M/@UX'^$6UH6
+<VdL+Co@Q/g)Q)?S[$^Bm;'L/1)u5+@K1-8Q\>T%144#+<VdL+<W(CDCI_0+Cno&%13CJ%144#
+B3#c+E2@4G%kl;F!+t+@;]^h+D#e:Df]K#+EV:2F!,1<F*2%:Bl5%c:IH=8De*E3+A[/lEcPl)
AKYK$D/Ej%FE7lu+<Ve?@<Q3)@V'+g+CSekARlp*D]hYJ6m-\lEb'56F`V87B-;;0BlbD9@<?U&
Ec*KP#mh%J+<VdL+<VdL+<V+#,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b.Ni,1
FC65"A867.FCeu*FDi:2ATW$*EZfFGE,]`9F<G.*Bln',B-;D3ASrW2F`))2DJ((a:IGX!+<VdL
Bl5&$C1D1"F)Pl+/nK9=?m'N%F)u&6DK@EQ;e9M_?tsUjF`V,7@rH6sBkLm`CG'=9F'oFa+<VdL
FDi:CARuutDg*=GD]iP.DJ!TqF`M%9@rH4$@;]TuCh[cu+D#(tFDl2@/g(T1%144#+<VdL+<XEG
/g+,)G]Y'>A8-.(EZfIB+E_a:+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!
Bl7I"GB4mJH#n(=D0$-n+<VdL+<VdL:-pQU;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4
@qB_&@<-'uGp$O7E,96"A0>K&EZccF@rH7+Deru9AU%c8%144#+<VdL+<X*@6VgHU:J=2a@;9^k
F`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl
$6Uf@+DPh*/oY?5+E_X6@<?'k/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2BXDhDes-/
FD55r.1HUn$6Uf@?tFFf+CSeqF`VY9A0>u4+EM[EE,Tc=+CK2(Bk1d_/g*b^6m-,RDImisFCeu*
FCf]=+Du+A%144#+E)41DK?q7DBN>,C2%3i?m'#kBln96+EqO;A8c[5/g+PAC2%3i?m'</F*&O6
AKZ,7A79RkA.8kg+<YcE+EM[EE,Tc=+EV:2F!,(+@<?X4AM+E!+<Vd9$6UH6+<VdL+AP6U+D#(t
F<G:8+E;.1A7Z2W+<VdL+<VdLARlo2GAhM4DIIBn-OgD*+<V+#%14=),9T!!3A*<O2BXRo6$6g_
F*&NZ0J">%0JPEo$4R=b.Ni,;A7-O#ART+aF`VY9A0<HH@:Wn[A0>9#AT;j,Eb/W$@rH4$ASuU$
A0>f5F<G"5+CK5$EHPu9ARGrS+<VdLD..]4DJsV>@;L-rH#k*>G\(B-FCd'6$4R=b+<VdL+<VdL
+<WB]E+rft+>k9[A0<6I%144#+<VdL+<XEG/g*b^6m-M]B5)F/Eaa'(Df0VW+>GPm6$6f_1,(F?
+>GW40JkgI1^sd7+<VdL+<Ve%67sC$AT;j,Eb-@@B4YslEa`c;C2[W1%144#+<VdL+<WH_Eb/lo
-9`Q#/g,(C-RU$@+>Y-YA0<6I%144#+<VdL+<Y]9B4N,4F`_>6F!j$s@lc8XDe(MDFD5Q40..29
+<VdL+<VdL+<VdL+<VdZ/hSac$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b.Ni,.
DJW]'@UWb^F`8I@@;TQuCh[s4F!,16E,9*&ASuU$A3(iSARuulC2[W8E+EQg+D,P4+Co&*@;0P!
/e&-s$6Uf@DIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+
DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+q
F*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;
C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN
3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#
+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7
@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2
/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-
@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&
Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k
+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-
F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4
D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK
@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'o
BHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tp
F<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6
+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+
DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>
+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<
A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$
A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2
%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5
$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"
DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,R
DImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(
ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'
F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?
BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*
DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7
ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P
@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%
+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL
+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17
+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=
%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9
$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.
DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-
+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4
F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6
DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(
Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=
Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+
A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(
ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6
DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.D
D]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBk
F_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1
%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]
/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(
+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrp
DerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$
B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C
@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5
Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$
AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(
Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^
DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9
$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_a
Ch.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQt
DJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO
+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4
?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5
Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1
F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9
@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S
/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=
+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm
@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1
+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg
+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*Qo
Bk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*
H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0
F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)
Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&
F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa
@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`
F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#
F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu
+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5
/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L
+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*
B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5
.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlot
DBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*
1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE
1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7
ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>
BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE
+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!4
0d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`
DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"
Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&
A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9
+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`
>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%F
D]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.Ge
BOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%
FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;
@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5
B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1
+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG
%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:
BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(
+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#
+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT
4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4
DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkT
Ec<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#
+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13
E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"
@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+
3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.
H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''
-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/
A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXF
Bl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_o
F)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,
AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,
+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@
?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPp
BlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImis
CbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO
+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj
+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F
3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jk
Bl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';
Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%
DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33
Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D
+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',
+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*
1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<
@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ
+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=D
C3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB
/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>
F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/
DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8
Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCq
Gp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(
H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'
ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$
ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@lt
EbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.
FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<
Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu
+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].
F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&
@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et
;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"
DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:
+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d+
+A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs
@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(
A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt
%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(
C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5
DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb
+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@
Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&n
De*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P
/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LA
C2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#
+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'
+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/
FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0-
-RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34
/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1
+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloq
Ec5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'
/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFC
AT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2
F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4
+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)
?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9
$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];
Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1
+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5
F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[
A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&
FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%p
CLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os
+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2
BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<
1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.
DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,
F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?
De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3l
GA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>
+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-
+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#
+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu
+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'
ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-
G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.
Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T
-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?Ke
Fa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4
DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_t
F`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.
GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u
+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.
GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=
$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F
0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1
F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@o
A7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*K
C2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8
ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ
+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm
+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>
A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6
G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&
A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0
Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[Wn
DdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu
+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT
+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai
<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-
+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A
?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:
F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsm
Eb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7
F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5
ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)
BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNE
Ci=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#
.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA
%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3
Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1
Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m
+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^V
ARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LS
AS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZU
F_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og
/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3
D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4
C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?
+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"
%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5
E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE
?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO
0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U/
/KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB
%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>
A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2
AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgL
FCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t
@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$
DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5
B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3
DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL
%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4
$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>>E./ibpI+>"^HATeLi
%14=),9SZm3A*<P0H_qi7V-%LF^]<9+>Pl,+>PW*2@U!&$6UH@+D#(tF<Ft+De+!3ATD:!DJ!Tq
@UX%)Bkh]s+CT5.ASu$mGT_*H+C\o(FCfJ%$6UH6+EM[EE,Tc=+E_a>DJ((a:IH=>DBN\(Df0W7
Ch551G\&"=ATMp,Df0VK%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@%13OO+<W-VD/!m+
EZeq(BlnD*$4R=e,9n<b/ibOE3&Mg1+@1-_F`VXI3@l:.0JPEo$4R=b+=\LA@W$!i+C\bhCNXS=
DIIBnF!,:5F*)IGF(Jj'Bl@l3@:Wn[A1euI%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?
%13OO+<W-VDIn#7?t4+lE,&c'FCAf)?mmZh.6T_"+Co&)@rc9mARl5W+<V+#+<W-V?tEkV+D#e+
D/a<&+E(j7ARoLsBl7Q+-uNI1ALq%qCghC+>qC/-Cis;<+EV%$Ch7Z1@:Wn[A.8kg+:SZ#+=\LJ
DId='+DG\3Ec6,4D.RU,F!+n/A0>`'DJsP<ARoLsEt&Hc$6pc?+>>E./ibjH+>"^.F_l=G1b9b)
0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)
A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=
%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e
,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq
+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/KdbrEarc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$
F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^h
F!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]
H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^hF!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>A
EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l3
0J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"
FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn
+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUjA8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G
0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/
BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm
3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LW
ATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?M
F@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.
F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLs
F!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3
@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trM
C1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"
@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[WnDe!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E.
/iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*
FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0
Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht
@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3
A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF
@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'
EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!
Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeGEc5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu
8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:
8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-
+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+/e&.1%16igA7B+kF>>^I5seOB<(o_D3ZoeB:IH<R
1FXG5ATMr9:i]uSFD55rF!hD(9L2!2<E)Lb;E[&`0H`D!0F\@]DeO#26nBHI@;BFp+:SZe@;BFp
C1K=b5\FqBBl#D3Df#pj.1HVX5sdq79he&O<)Yq@+=BKeF*&ODEa`I"Bk(^q+D,P4+A,Et+>"^V
AThd/ARloqDfQsm+?1u-GT]^hEarc*1,(FB-OgDV5se%:6WI&J3Zp-d$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMMgFE2;1F^oN-Df-!k;f?8iG@>N'+EVO?Ci^_-Eb-A0Bkq9&Ci<`mARlorF`)7]+E27CATDC*
C`mq5@;p.&F!,(5EZfF>@<lR)B-;J<F`JU7De*R"B-:_rD/X<5+C]J8+CT)-D]iS!DJ*O$Dfp+D
GA(Q*+E_a:A0>T'E,ol9ATDU4/g)9-@<Q3)H#IgJAThX*+EM47F<GjIF`MP7Ch=f(DBO%7AKYT'
Dfe2d+A!\kDJs_A8LJ?tD/"'4Bl7Q+@3B/nG9D!GATJu&DIak]+C\o(+F.mJ+CT;%+CT=6G@bT,
/g(T1%16'JBlbD5@:C?tF`_G6DIml3@3BH1D.7's+E(j7,%>,)F<GOC@:OCn@qB^*+E)9CB6@p!
ASc'uATJu+DfQtCF(oN)+A,Et/g)9.-['&DCh7$qDIm?$FD,5.BOPpl+Eq7>4!86L+F.mJ+EV%-
AKYi8+CSf(Bk(]sFDi:8ARTV$+F.mJ+Dkh*BQPA+AKZ&5@<,pi+Unc-%17,eEHPu9AKW@5ASu("
@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMniF*&O:DfQsm:IH=JF(KA7A7]@eDIm?$AoDKrATDi$
$<KMk:.\2N3ZqBm8Q-a*5sc\l78[&V;FOM,5p/p&9gV9H+AYHL<Du=a+@JXf8PV]B+A,Et+@].#
6q(!P/e&-s$<1\QF!,:-@N]]&EHPu9ATJu&+Du==@V'R&De:+a:IH=;DerrqEcW@FD]j(CDD!&2
BOr<(AU&;>F*(u4+EV19FE8R:DfQtBBOr;tG\M5@ASu!h+E(j7FD,6,AKYT'Ch.*tF"Rn/%15[=
+=L3#F*(#M6pta0ARfh#EbT*+.3NG@F*)IG@;^?5F`(`$Anc-oA0=K?6m-#SEb/a&DfTQ'F!+t2
DJ!TqF`M%9FD,6,AKYMtEb/a&DfTQ'F!+q'AoD^$+EDUBDJ=!$+EV:2F!,:-@P/cpDKBo?F^oN-
Df0V=Df-\2Dg*=GD]iS/+EV:2F!+t$DBND"+D,P7DIal(DBL?BDe(J>A7d8C+A$HlFCB!%+EV:.
+=LuCA7TUgF_t]-F=A>@A7TUr+EVNEB4Z0--u*[2/oY?5.4u&:.1HV`ATMrc:IITbEb/a&DfTQ'
F'iWrDe*3<3\qm>+>=63%15is/h0h3F*(#M6pta0ARfh#EbT*++Ef=g+EV19F<G^IATAo'Df00$
B6A6+A0=K?6m-#SEb/a&DfTQ'F"Rn/:-pQB$;No?+B3#gF!)TKATD6&+Cf(r@r$-.+EV:*F<D]H
AT;j,Eb/c(+A,Et+<YK/@N]2qEb/a&DfTQ'F!)T6Eb,[e:-pQUA7]@eDIm?2+<j3bAnc-oA0N.,
De3u4DJsV>D.R-n+EV:.+<Y3/Eb/a&DfTQ'F!)T:G\M5@+E).6Gmt*U67sC&BOQ!*-u*^0FD**G
AU&0&DIdf2FDi:CDf''-BPD?s+E)@8ATAo8BOPd$BlnD=A7]@]F_l.P%15is/e&._67sBtDf/uo
3ZoPTCe\t`+?_>"<+U,m8l%iCBl[cpFDl26ATJu:F\-4`DfTCu$4R>;67sC)BOu'(@3BT%CghF"
G%De,Bl[cpFDl2F+CoD%F!,@=F<G.>BleA=-u*^0FD**GARfClATJu.FE8R5EbBN3ASuT!$>OKi
F_#3,F!*Uu+=DUc-7gJr4s2pJ-V@0&+A,Et6rcrX;]n\.6rQl];F<kq8l%iS78m/5%16igA9DEo
Aof(X/g+nJ@<?00/j:CmDe+!$Bl\8;+AP6U+<`-_.6T:+C2dU'BFP;c@<63,4Y@jlDe+!$Bl\8;
4WnKXA9DEoAoeCgBkAt?0d($[+DkP.CER/+/e&.1+?gnqD/"'4Bl7Q+8l%htAoDKrATDi7/KeS8
Anc-o+C\noDfTD3Ecl8;Bl7Q+8l%htCggdo-QkJnD..L$+<r"DDe+!$Bl\8($>"$pAM+E!+<Wij
-Xgh-+A,Et+D,P.A7]e&+CT;%+Co%qBl7Km-QkJnC2[X*A7]@o%16ZaA1e;u.1HUn$<1SXF@o=s
6tp[Q@ruX0Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39OVBQ@r,^bDKTn-$<KMk:.\2N3Zpg^6W?WQ
:-hcL78k<r;FNlN7787b=WgO=8P`5,;H6Ij+AYHL9L1uf<(KSZ+BM-.9HZYj+@JXl78u]D+A#<N
<(KG#:.88a+B)6.:bE1a%160MASrW4BOr;QATMr9:i]uSFD55rF!,:-@N]]6DK?q7F<G(6ART[l
F!+m6DKTf*ATAo3AftVu@ruF'DIIR"ATJu.DBO%7AKWCM8l%iR:K::[74B?iBl[cpFDl2F/g+,,
AKYl%G]Y'LFCfD6GA1l0+ED%1Dg#\7@;^?5De:,6BOu6r+Co1rFD5Z2@<-'nF"SRX8Oah*:K8N)
5uL,o5se@I<$5.28Q-a"5u^,m;cHOh+AP^6/e&.:%16!ED/XT/9OVBsATMr]Bk)7!Df0!(Bk;?m
BkhQs?TgFm1E\_$0F\A'AhG2t7TW/V+CoCC%144#F(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O
8l%iR:K::[740N8-R'oI$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8d:ATMr9E,oAsFD55rF!)lT
Bl5@BA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC%144#:-pQU@<QR'A0>>t
@;]k%+DG^99jqNS@;]Tu9PJBeGT^s6FD,_)$6UI4BOu!r+=D2H+>%VG+=A^TE+*j%+=DV1:IJ,W
<Dl1Q-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+C\o'F<GOC@:OCn@qB^(-uEC&05P??Fa,>X
A8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/nAlQ%144#F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5
BlA-8+EV13E,Tc*Ed8d:ATMr9E,oAsFD55rF!,"-@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/
$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!ED/XT/+@9X\F<FD#@:OCn@qB^(CggcqA8,OqBl@ltEbT*+
/e&.:%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sC'DK9<$BleB-EZen,@ruF'DIIR"ATJtG
+A#'u:JsV(78d#Z;H"#30H`%l,TnlcEb/lo-9`P63[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1
%15is/g+\9Ch7^"+Co1rFD5Z2@<-W9Anc'mEt&ISASl@/AP?NA6=k4[6tp.QBl@ltEbT*++>=63
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+A,Et+CoD%F!,@=F<G%(Ci=3(+DG^9FD,5.8g&4rARu;X,"bX!+@K!o
;]nh2<$4Lr9M\DR+A#<N<(KG#8g%)277AC0$4R>:Gp$^5EcZ=F@;]TuD/XK;+DG\3DfTr.DKI"1
BlkJ9AftMmG%kGt+DGm>F(oK1CjA&N$4R>;792iT+AP@+78b7'792iT+EMXCEb-A=Dfp(C8l%ht
A8,OqBl@ltEbT*++DG^98g%hcF*(i,C`m8&Eb/a&DfTQ'F!1u"%15ZLGAhV?A0>;sF)N10G&M)*
+CT/5+AYoYD..<jB4YTrA8-'q@ruX0Bk;?.Ch[Zr+:SZ*>YoHZB45X"7VQ[MF'L(F%13OO6ZQaH
FCcS'+A,Et+DkP.FCfJ8A8,OqBl@ltEd8d<Bl[cpFDl2F+EDC=F<G[=@<<W+F!+t2D/a<&FCf96
+DG_(AT23uA7]Y#+E(j78hM5/8TZ>$+CT)-D]iI2B5_^!+DG@t@3BZ1+Co%qBl7K)@3BW6@Us1n
ARfh#Ed8dKFE2M6FEMV8+EV:*F<GF7EcQ)=F!+(&F!,X;EcYr5DK@EQ+A,Et+CfG'@<?(%+C]&&
@<-W9C1_0rATKIH+B3#cF(HJ+Bl%@%+CT;%+D,%rEbp"DF*(i"Ch4_uF`\a8Bl7@"Bk;?.@ps6t
@q]:gB4W30BOu'(8g%VW@;]^hF"Rn/.1HVZ67sBjEb/[$AKYD(D..L-ATAnc:IH=9Bl[cpFDl2F
+EDC=F<GLEFE;/,AKYo'+A+#&+Co2,ARfh#EbT*+/e&._67sB[BPDN1@rc-hFD5Z2+Co&&ASu$$
Df-\++Cf>-Anbn#Eb/c(A8-'q@ruX0Gp"Ma8l%iR:K::[74Bhu$>sF!A0<7/E-,Z4F=0-uC2dU'
BHS[O8l%iR:K::[75&+hFCfN8-Rh,)@V'V&+E2@0@ruEpATJu9ATMr9A8,OqBl@ltEd9#A$4R>;
67sB[BPDN1BlbD*DBNM8@;Tt"AKWQIF`V+:@;^"*BOu3,Ec5l<+D,P4+F.mJEZen,@ruF'DIIR"
ATKI5$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMVk@:UKs@:C?iBk)7!Df0!(Gp$^>Df$V-F_u(?F(96)E-)Nr
<,WmnCi"68FE1f3AKYc"Gp$^1@<?X4ATJu4Afs]A6m-\b+Dtb%A0>;'DJsE(D/aTB+Co1rFD5Z2
@<-WG+B3#gF!,@3G]Y'LFCfD6Ci<`mF!,R<AKWC1E-,Z4F=A>CBk)7!Df0!(Gp$^>Df$V*+CoV3
E$043EbTK7+Co2-FE2))F`_2*+EqOABHToC6nSoU.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>\s
@N]2q@ruF'DIIR2/e&.:%15is/g,(OASrW.ATo8-Bk)7!Df0!(Gmt+!A0<7/E-,Z4F=/28+>Y-Y
A0<6I%13OO:-pQUCi<`m+D,Y4D'3D7@;Tt"AKYN+D/^V=@rc:&F:AR2+Z_;"4DJhDFD)dEIUQbt
Df0VLB4YslEa`c;C2[W9C2[X!@:F:2Cggd`F_u(MBkh]:%13OO:-pQUEb/lpDImisFCcS'Cht57
AS,LoASu!hF!*%WF(fK9+DbJ-F<G[=Eb/f)D.Rd0@:s.m%16Gu+F>^`0Hb"EDdmc74s58++ED%:
D^QnA$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBM8S@r$4++C\bhCNXS=@UWb^F`7cs,!nR_93"e26:!t3<DXf)
5sn:F:a->U%15[K+DGm>Ch\!&Ea`d#Gp$N<F)GE*+EVNED..3k+CQC%@:O(qE$0@=FD)dh:IHfX
+B*2$@UWb^F`8IAAoqU%+Unc-%15is/g,(OASrW4BOr;qATMr9E,oAsFD55r+Co1rFD5Z2@<-W&
$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1%15is/g+V3@r!3$F<G^F%17&_@r#Tt-Xq%:ATMr@%13OO
:-pQUEb0<6A0>o(@rHO%EcW@FBOr<'Df^"C@s)g4ASuT4@UWb^F`7csEb0<6A0<7/E-,Z4F=.M)
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+B2cbAKYD(F(96)E-*45F_u)>%14:Y5taWh5p0)n;Fs\a+@K4(:a->U
%14M&@:O(`.3N).@r$-.F`8I4Bl7@"Gp$j6Bl%@%+C]J8+DGpFF!+n-F)N10+D5V2A0>SsARQ^'
D]g67F_u(A+F.mJEZen,@ruF'DIIR"ATJu&F!,F<@;0U%FCf]=/g)9/:IH=8@;[2uF_u(?@;Ka&
DfB9*+Co1rFD5Z2@<-'nF!+n4+CQC6Bl7R"AKXSfF(96)E-*]T;e'i^E-*45F_u)=+CT;%+EV:.
+Dl%<F<GXH@:F%a+Eq7>+EVNEF*)>@AKXSfA8,OqBl@ltEbT*+/g)99BOr<$De*p-F`Lu'+CSek
Df-\.BleB:Bju4,ATJu&Cht4d:IH=HDfp)1AKYK$A7ZltDBO%7BlbD/DfT\I%14Nn$;No?+CoV3
E$0(:Cj@-O@W6F#F*&i?$?'Gt-Xq%:ATMr@+BosE+E(d5-RT?1%15is/g)QZ@;BF'+CfG'@<?(%
+CQC'Bk)7!Df0!(Gp$X?D/^V3DBO%7AKYN+D/^V=F^elqEb/a&DfU+4$=[srATMs(F_u(\3ZrKW
Dg-//F)t\sC2[Wi+DkP&AKW?J%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[rDf'&.F`V,8+E(j7A9Da.+EM%5
BlJ08%15^'6m-#_D/^V=@rc:&FE8R7@;[2sAKZ,:ARlp*D]j(3Ci<`m/0JG@E-WR7DIal,ATDEp
+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sC$ASc9nA0>?#FCfN8%17#a+=CW;FCfN8-QlV91E^UH+=ANG
$8<Va0Hb^'@W6F#F*(r8D/]pk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15I@E-WR7+Co1rFD5Z2@<-WG%14Nn
$;No?+Cf>/GqX#GEbAr+@W6F#F*&O8Bk)7!Df0!(Gmt*uATqZ--Xq%)DfBtL4)/_CFD)dEIS*C(
;bpCk6U`Y;E+<g*Gpa%.De't<@W5gqE-WfR>9G^EDe't<-OgD:+Z_;"HTGVTFCfN8A9Da.%13OO
:-pQU@r,^bEZf=0FD)*jA8lU$F<Dqu9LV6F:dJ&O-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39jqgK+CQC0
@<6O%EZfC6/TPE8BleB-EZfF5EbTK7%14:R5taWh5p/lf;cH1`+AtW[;FO)I;cH1`+B(X*8PiA1
%13OO8l%htDf0B:+EM+*F!,R<AKYMt@ruF'DIIR"ATJu7AS5^uFCfK(A0>T(+EV:.+DPb%F*(u6
/no'4+D,>(AKZ&4+DkP$DKK<$DJ=!$+CQC/BleA=De:,4AS5^uFCfK(A0>Ds@ruF'DIIR"ATJu.
F!+m6B5_^!+DG@t@4iZF8l%ht@ps6tB4YslEaa'$+CQC5AM%q6B5)F/ATAo7@rc:&F<G[=@<<W;
Dfm14@;[3!A8--<+<V+#%15U:DImisFCcS'+ED$FEb/ltF*(u6+EM%5BlJ/:@;]TuE-67FBlkJ3
DBO4CF`JUA@;0U%8l%htA8,OqBl@ltEd8d<Bl[cpFDl2F+EDC=F=n"0.1HVZ67sBnASu("@<?''
Eb-hCAS5^uFCfJ8F(96)E-)NrEb09&B0A9uF(fK9E+*g/?X[\fA7$H@HTE9,+E(d5-RT?1%15is
/g,4DG%De1F<G:8+EV:.+DkP.FCfJ8Ec5l<%17,eEb/l+GB.D>ARAk\De*2tC2dU'BHS[O8l%iR
:K::[75&CoA9)6oBleB-E\;'@F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B)in+Dbb$Eaa!6+Co1rFD5Z2
@<-W9FDi:BART+fDJXS-$6iD;<$4k+6;g*I=Wg+(6W?WQ:-hcL78k=.:EWP(5t"LD9N`PK$4R><
E+No08l%htA8,OqBl@ltEbT*++Co%qBl7K)@3BW&@<,jk+E1b2BJ(DM<+ohcAnc:,F<G+.@ruF'
DIIR2+E)-?FD,5.E+*j%+DGm>FD,5.Df0B:+Co1rFD5Z2@<-W9FD,*)+Ceht+C\n)@q]:gB4YU+
+<X6t+DGm>@ps1iARlp*BOr;1E-67H+Co1rFD5Z2@<-WG+<X*rASrW4BQ&$+BHV22DK'`?+Co1r
FD5Z2@<-'nF!+t$DJjB7+C\n)@q]:gB4YTr@X0(g:IH=>F=2,P@3B3$De'u)A7]0lFDi:CATT&:
BOu$';FNl>:JOSd+C\nl@<HX&3XlE*$;s;Y6r-QO=Wh6h@ruF'DIIR"ATJu(@;[2sAKYDk@qB_&
ARlomGp$O5Gp%!ID.7's+E(j78l%htFCB6+F"SS576s=C;FshV+Co1rFD5Z2@<-'nF!+t$DBNk8
Cj@.4AKYDk@qB_&ARlomGp%$CAKZ)'F)*BN+:SYe$;4rAE+s3&+Dbb$Eaa!&ATJtl76s=;:/"e5
E,oN5ASuU2+CSbiBk1dmFCAu.E-67MF!+n4+F.mJ+E)41DBNA*A0>AuDf]J4A8,OqBl@ltEbT*+
/e&.:%15is/g,">CLnVtE-,Z4F<FIM5t"LD9N_f3De't<@W6F#F*&cP>9G^EDe't<-OgDnE-#T4
+=C&U5t"LD9N`_P$4R>;67sBiE+<g*Gp$gB+Du+A+EV:.+E2IF+Co1rFD5Z2@<-W&$?'Gt4$"`u
E+<g*Gp$R8FCfN8-QlV91E^UH+=ANG$4R>;67sBmBl\9:+D5_5F`9!TF_Pr/+EM+9F!,F1FD)*j
B6%r6-XgY.Dfp"H4!6UG-Y-Y-ARfCb@r!34ARTUi@<?(%+EVO4@<iu:F`)56F(KE(F>,'O$4R>;
67sBuDffP5A8,OqBl@ltEd8dH@<?/l$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMS`AT/c4AS,Lo
ASu!hF!,UEA79RkA.8ki91;9G+AtWt78cQL6Uaor<DZ(L<(02!%13OO8l%htF*)>@ATJu<DfTA2
Eb/ioEb0,uATKIH+Auc_ATD@"@qB^(AStpcCh4`+@;^?5F`V,+F_i1=E+O&uFD5Z2F"SS5AS,Lo
ASu!hF!+n-Ci=M?-td+5Ed0#UFDi:<Ddd0!GAhM4F!,R<@<<W%@;Ka&DffZ(EZfREEb'56Bl5&2
ATo8,Df0Z.G]\!Z%14Nn$;No?+E).6Gp%'KF<G+.@ruF'DIIR2+ED%*ATD@"@qB^(DImBi+E_X6
@<?4$B-8cKF(fK9+DbJ-F<G10G%De5ATMp$B4Z,n$=>Y5HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBM>c@s)X"DKI"3Bk)7!Df0!(Gp%$7C1UmsEt&I#6r-0M9gqfV+@Jdg
<(Tk\5uLi.:I7ZB6W?u.%13OO6uQRXD.RU,@<?4%DBNY7+CQC/Df021F*(i.A8,po+EMIAAKYr1
Bl8#8AoD]4E,ol0Ea`g%ATDiE+<XBsF*&OCAfu2/ASiQ'@<?''BlksM;f?Ma+Cf4rBl+u,F=2,P
F`)).@qB_&@<-W9@;]TuAThX&+Co2-FE1f"FD5W*/g)94FD,6+F!,FEF<G:8+D>2"AftPkCLq$!
AS,OmEcc@T+A$GnD0[7BE+s3(Df-\>BPDN1,&)+9-ZgJBG%GP6GB.V>B-AHA+@g?gA0>E$@s)X"
DKK</Bl@l3ASbq$@<?(%+Cf>#AM,)sDBMSiF`_:EF!,C?Bl7X'DBNY8+EM+5@<,duATJt<Ch\!&
Eaa'$+E2@>B6%EtD/!m#+s:K<Df$V=BOr;pCij6/DIIX$G%DdJ+<kN9Ch\!&Eaa'$+E2@>B6%Et
D/!m#/g;D\+:SYe$;+)^+E2@>G%kJuF!+m6DKTf*ATAo3AftYnF*SmP@<lo:FDi:4De!p,ASuT4
@rGmh/g+;8FWb1&DBNM.FCfJ8@3BW*DJ*cs+EM+3FCf?"AKYo3+CQC/@<-!l+Co2-F(KB6@<?4%
DD!%S8K`4qF_kS2Eb/a!D/Ej%A0>u-AKYT'Ec#B./g)98ARuuV:IH=9De!p,ASuTuFD5Z2+D,P4
+Dl%;AKYN%@s)X"DKK</Bl@l3DfBf4Df0VK%14Nn$;No?+D,P4+Dtb7+EqaEA9/l8Ed8d9+EM77
B5D-%Ch[cu+E(j7A8bt#D.RU,@<?4%DCuA*@:jUmEbo0*FE;PE4ZZjkI4fsk,=#HU.j-Pn-tt_k
.6o:c+@Rn*>q$3iE-67F-XgV/ATDTqF*)JFE[M;'%15is/g+kGF(KB6+EM+3FCf?"AISu#+?1K_
F`\`R@:jUmEbo0*FE;PE-T`\rATV?pDK?qAFE2)5B-8UJ.3N&2FCfJ8CghC,+E(b"F`MM6DI[6#
De:+?GUY!L$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=JF(KD8A8bt#D.RU,@<?4%DBNY2+Dtb7+Cf>-
FCf]=F"Rn/.1HVZ67sBmDfQtB@:O"nF!,R<AKYN%@r5dpF<GX9DKKH-@q?csF!,(+FCSuqA.8lV
Ble59-XgV/ATDTqF*)JFE[M;'%15is/g+VDBk:mmGp$X/F(96)@V$['F`)&7Df-\1Ec6)>+<W6Y
FD,5.E++$$@:O'qAoD]4ASuU$EbTE(+EV:8F(HJ8ASuU$DI[7!%16cbE,KJ7I4cXTEc<-KF*2A;
Df9M@%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k6#IfVG[YH.Ch4`-Afto.DJ()&De!p,ASuTuFD5Z2/e&.:
%15is/g+tKDJ()&De!p,ASuT!$8<S_+Co2-E$-NLF`)56F(KE(F>,'O$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBM>YAnc-o+F.mJEZf:EDBMPI6m-PaDfTr0F`_[6$6hl,7S-?D+B_K?;BSb::*</)6m,E!:Jt.Z
<E)m@%13OO8l%htGAhM4F!+t$DBND"+E_a:A0?)1FD,B++CT;"BlnB(Ed8d"+E2@>B6%EtF"SRX
8S0)jDfm15Df-qE+D,>*A0>;'8l%htE,oZ0Bln'4AKZ).@<<W/AS#t)+F.mJEZf72ARoj)A8`T!
+Dbb6FDPM2E,ol0Ea`g%Bl7Q9%13OO<+oi`AKYE%AKYhuDL!@9G[YH.Ch7Z1De:+a:IH=EEc5T2
@;TjqDJ()+DBMPI6mm$uF)Q2A@q?cmDe*E3+A$HlFCB!%+EV:.+DPh*F)Q2A@q?ckA7TUr+EVNE
B4Z0-8l%htF)Q2A@q?cmDe*E3%14Nn$;No?+D#e+D/a<&F!,C5+E_a>DJ((a:IH=LDfTB0+EVNE
A7]@eDIjr.ATo8/@:O"fBln'#Et&Hc$;No?+Co&)@rc9mAKYD(8l%htB6%p5E"*.fB4#@fDe*3<
3ZqWf+D>S1DJUG"3Zri'+D5_6%13OO:-pQUEb-hCAS,LoASu!h+E2IF+Co1rFD5Z2@<-W9F(fK9
+CT/5+D#S6DfTn.$?B]uAS,:`C2[Wi4ZX]A+?CVm-uLRgF"&4VINU3p4"u"*0d(O#/heD\Ci<d(
-9c<1/q#?mAThu>-RU8a>9J2=%13OO:-pQUF(fK9+EqaEA9/l6AS,LoASu!hA0>?,+EqaEA9/l-
DBN@1B6%p5E$079@<<W#Eb-A2Dfd+9DBO%7AKYW+Dfp".$>OKiB4#@fDe*3<3ZoeYB6%p5E$l)%
DKoN&C2[Wi4ZX]A+?CVm-t-q.Eb/j(+<Z(b+D5R@+>#2gB5Tjb+D5_6+DPh*B.",q%15is/g,"F
F)u&5B-:f,Df$UF@:sV!F`8c=$>t)2-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C9mFDl#1H=\3k:IH=:
A8--.Amo1`Ch\!*ATJ:f,"#@/<)64[>"'Q+:IH<o6qL?#7R9C59M&2T78kB>$4R>ABOr<'@;0U%
8l%htARoLs+EqaEA9/kADKdNP@;]Tu-tQp<+Ceht+C\n)@s)j7Df'37ARlomGp$X/Anc-sDJ()#
+@K!m<D>nW<'sGU9gMNB+EM%5BlJ/H%14Nn$;No?+Co%qBl7K)A8bt#D.RU,+Cf>,D..<m+EM%5
BlJ/:/KfCh:4@U6BlbD@DfTA2DIIBn+E2.*@qB=lCh.*t%15L!6WHiL:/jSV9hdoK6sjYCDe*2t
4ZX]>+?CW!%17/nDfp/@F`\aFEZc`VISP??-OgD3%13OO%15is/g+YEART[l+CQC1ATo8@DfTA2
/KetNASuQ3ARoLs+EqO;A8cZ$$>t&1-Xq%=DfTA9%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k7VQaN+EV:.
+=L]<GAhM4.3N24BlkJABl7I"G9C=3A0>c.FCcS.Dg*<l:IA,V78?fL:JFPL:.-4HAU&;>BOPs)
@V'+g+Dl%-BkD'jA0>;uA0>T(F(KB6/g)9<BOu'(FD,5.F(96)E-*4HBl7I"G9CU@+ELt7ARlp-
Bln#26W-lW/QX&_:IA,V78?fL:JFPL:.-4FF`)7Q%13OO;KZk"@;]Tu@r-()AKZ).AKWC1E-H5@
A18X4A8--.GA1r*Dg*fC$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15O7BlkJ++EqaEA0>T(+EV:.+Co1r
FD5Z2@<-WG+<X9P6m-2b+CT)1@<lo:ARoLsBl7Q+@rH=#ATKIH:NC/^Bl7?qF!+t$DBNk8Cj@.4
AKYJr@;]^hA0?)1FD)e.G]7J5@qg$-E-67FDfB9.@<?4%DK@E>$7QDk:-pQUCi<`m+Co1rFD5Z2
@<-W9GAhM4+DG_8D]iV%BlkJABl7I"G7=mjA0<7@F`)56F(KE(F>,'O$4R>;67sBmBl7H(FD,5.
.!'NKEbTT+F(KGI.3N24BlkJABl7I"G9C=3A0>c.F<EtI6WHiL:/jSV9hdoK6m)pG%15is/g+Y?
Df]J4ARoLs+EqO;A8cZ$$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>YAnc-o+A,Et+E2@>C1Ums+DkOsEc6".
$6hl,7S-?D+A,Et+Abs38ju*H+AG-h;GU48%13OO=(l/_+E2@>B6%EtD/!m#+EqOABHToC6m-bn
FWbdOE+rfjCi"A>DfB9*+CQC6ATT&5AftVu@ruF'DIIR"ATKIH9Q+?M+EMI<AKZ&>F*(u1+EM%5
BlJ08+CT.u+Co%qBl7K)F)Po,+D>2$A9f;8Dfor=/g)99BPDN1@ps6t@V$ZmDf0,/Bl5&%+E2@>
C1Ums+DkOsEc3(A@rc:&F=n"0.1HVZ67sBkAS,XoAKYD(E,ol3ARfg)D.-ppD]gVS8K`.sAKZ).
AKYr4AS,Y$+E2@9+D,P4+EM[8BHVA+EbTK7Et&IqEb]Z<DJa<1DEU$'0H`D!0F\?u$;No?+EMX5
DId0rA0>V0F(96)E--.1$?B]tF_Pl-+=C]2@Wc<+FCB6+-OgCl$;No?+Dbt+@;I'-@rc:&F<GI>
F`)7C%16igA7o7`C2[Wi4ZX]5F*2A;Df9M@%16igA92*lC2[Wi4ZX]5F*2A;Df9N8ATMs7-OgCl
$;No?+E2IF06hMKAdo)8:IA,V78?fL:JFPL:./H8?Q_Km+=D5IDfp/@F`\aFEZc_WH[\_=I4$Bi
%14Nn$4R>;67sC%FDl22+DkOsEc2Bo1a$a[F<DrMEb]Z<DJa<1DC7M<;aXGS:fLe1C2[Wi4)f4T
F*2A;Df9M&$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqKDI[6#E,ol3ARfg)D.-ppDf[%0Eb-A(AS,XoARlot
F=2,PARTY*+EVNE@rH6sBkMR/AKZ8:F`JTs+EM+8F(oQ1+>"^SE+No0FD,5.Eb065Bl[cq+Co1r
FD5Z2@<-'nF!+n/A0>o8DBO.;FD)dFEc!6JFDi:CATW'6/e&.:%15is/g,4HFEMOFE,ol3ARffk
$?Bu+-ZF*@F*2A;Df9M@+<Xl2De'tP3[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@TgTF<GjIF`JU>De*g-De<^"AM.\3Et&I#779^H+B_K?;BT^mA8lR-Anc'm/no'A
+q4kg$<LnPDBMPI6m-;a@:XF%FD,5.F(96)E-*4O@:WneDK@IDASu("@;IT3De(M9De*g-De<^"
AM.\3F!,1<+D#e/@s)m)A1f!(BPDN1F(96)E-*44@;[2sAKZ,:ARlp*D]j+4F<G^F+A,Et+EV:.
+Eq7>+F.mJ+Eq73F=n\2DffP5BQ&);H#IgJ@ps6tAU%crF`_1;E,ol3ARfg)D.-ppDf[%FBOu'(
8l%htCi<`mF!,[@FD)e<ASuU$DI[7!+Dbb-ANC8-%17,m+=D,KC3+N8D/X?1-QlV9De'tP3[\BU
@rH=3+C];3ATMr@%13OO=$]_Z8PVc:+EMXCEb-A=Dfp(CE,ol/Bl%?'Bl5&3DIjr/AfuA;F`JU8
Bk)7!Df0!(Bk;?<+<XWsBlbD/Bl%?'BlbD;ATMF)+EqL1DBMP;9H\IsA79RkF!,R<AKXT@6m,oK
A8c?<%14Nn$;No?+Co2-E,8s.+DPh*E,ol/Bl%?5Bkh\u$>"<%Eb/Zi?X[\fA7$HoE+*j%-[oK7
A8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]:%13OO:-pQU@r-()AKZ).AKY`+A8lR-Anc'm
/no'A+EqO;A8cZ$$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMqX73G2u6m,#h9Mcit:.-3m:IA,V78?fJ<(Tk\
%14:Z;ahg$:IH<r78-N#5u'fj6r-0M9gqfV5u^EO:*L,S%15[EF*(i,C`mh5AKWC6ASu("@;IT3
De*Bs@s)X"DKI<M@:WneDBO%>+E_a:+A,Et+AbHq+D>>&E%W7B$7QDk:-pQUCi<flFD5Z2+E(j7
C2[W8E+EQ'/KebFF*(i,C`m.sA8c?.-td+/ATD3q05>E9A8bt#D.RU,.3NhKFD)dh5th^pC2dU'
BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Ag\#p%15is/g,(OASuQ3
C2[W8E+EQ'BkAJr+E1k'+ED%%A7]d(BlbD*G%#*$@:F%a+E)-?H#IhG+EMgLFCf:u$>OKiBOu"!
+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*E"D..I1+CT.u+D,>*@;I',ASkjrCND*;$<1\M+D,P.Ci=N3
DJ()2Ea`I"Bk(^q+DkP&AKXT@6m->bEb-A4Ec5K2@ruF.AKYE!A0?#9AS-($3XlE*$;+)^+@K!o
;]nh2<$4Lr9M\DR+A#<N<(KG#8g%)277@Xm%15Ef6VCEU+@8@]93"e26:!t3<DX,3%16'#919sh
+B(X*8PiA/6rcrX%13OO9gME@+@.,E5uU`O;BSk+/Q,#-8Q/SW;BSn*;Fs\a%13OO;ajY.9M%QK
5uLi.6qKaF8P`)I;Fs;U+B2,Z;FNl>:JOSd%13OO91;9G+AtWt78cQL6Uaor<DZ(L<(01a$4R>1
:IA,V78?f)6qKaF8P`)I;HY,<6:s[6<)X55%15Kl7S-?D+B_K?;BSb::*</)6m,E!:Jt.Z<E)m+
$4R>0<Dujm9hAMW+A,Et+@S[i<$4Xr6V0sC<(TMW%13OO6q'R::.69t:IH=%;GTnR6W>1&5snOG
;[j'C$:R?S<$5=><DjrSDe*g-De<^"AM.\3Et&Hc$<:"n+A,Et+@npp:`r&!6m+ln6WHiL:/jMY
8P`(j$4R=O$<1\MF(HJ&Eb-A.F`VXIF)Po,+E(j7FD,5.8l%htE,oAsFD55rF!+$sBOQ'q+D,P7
DIal4F(Js+Cb?hQ6$"/oDfm1FF(HId:IH=NDfm1HBl%T.E,ol+@:F%u+D,>*A0?/9F`JUCGA\O?
ATVU(A90@G+:SYe$;"hPH#IgJAnc-n+CT.1@3B]6AS-($+Dk\3BQ%E(E,9)oF(HJ1ATT&3AKYc+
Dg*fV+A!\c@;[2sAKZ#)@:Nt^A0><&3XlE*$;,5MDBM8SCLqN/%15g<Earc*1,(FB%16QQCLqO$
A2uY8B5M'kCbB49D%-h$%13OOC2[WnF_u(Q2,$;&<(U%_76N[S-V@0&+=Juo+B*3$EarZ'6Z6LH
+@L?hE$/(hEbTK7F!hD(9L2!2<E)Lb;E[&`0H`D!0F\@]DeO#26nTTK@;BFp%16QQCLqO$A2uY8
B5M'kCbB49D%-h$%15cp6:4OC9gqfV;a!/a-WFbnF!,:-@N]2mD/X<5FE1f3ATJu-Dg*=GD]ik7
@:UKkF_u(?8l%htF(96)E--.D/Kf(FG%l#/A0>K&EZdss3%cn0+AH9b@qZu?0JPO7%15cp6:Oa<
<Du%A+>F<4%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A$HmEc5K2@ruF'D@HqF:IH=HDfp)1AKYK$A7ZltF!,"-
F*)G:@Wcd(A0>T(+EV:;ARuuV:IH=9F_u(?F(96)E--.R+@L?hE$043EbTK7F!+n3AKYr.@;0U%
5uU-B8K^VJF(96)E--.DFD,*)+Ceht+C\n)Ci<`mARlp-Bln#28ge[&F*(i.A79Lh+EM%5BlJ/:
E,ol,ATMp,DJ()8ATD7$/e&-s$<1\QF!,:-@N]*#F*2>2F!+(N6m,oUA0>r9E,]`9FD5W*+CSek
Df0V=BOQ'q+C\nnDBNY2F*(i,Ch7-0+A,Et+CT.u+EM[EE,Tc=Bl7Q+@:WneDK?q1@;[2sAKY])
F*(i,Ch7-"GA2/4+EV:.+A*bq@:O(]B4W3&@;]LdATBC4$7QDk:-pQUFDi:EF(HJ&+CoV3E$043
EbTK7+A,Et+Dl7BF<G%(+CSc%Bm+%s$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+@C'bAnbn#Eb-A%+F\'DA92[3EarZ'A8-'q@ruX0Gmt*[D]j(CDBN@18l%htA9Da.+EM%5
BlJ/:F(oK1Cj@.AE+No0@3BH!G9CF1@ruF'DIIR2+CT.u+E_a:+=Joe3\W!8+:SYe$:\rS+EV:2
F!,:-@N]c+AKZ&4F`Lu'+Co1rFD5Z2@<-'nF!+n3AKYK'ART[lA0>T(+EV:.+=M\2:IJ,W<Dl1Q
.3NYBCghF"G%De,Bl[cpFDl2F/g)9>Dfm1HBl%T.DImBi+EVNE@rH6sBkMR/AKYD(8g%_aCh.*t
+EVNEE,TH.F<G[D+CT.1@:OD%@;I&sBl[cpFDl2F/g*_.;cHXj:.Iu\+AtWq:JFPP:.-4IF(oN)
+CQC'Bl[cpFDl2F+EV:*F<G:=+Du+>+DG^9FD,5.8g&2#F*(u1+EVX8AK`1!Dfm15Df-qE+Eq73
F<GjIF`JUDEb/`pDfp+DA8,OqBl@ltEd8d<@<>pe@<6"$+C\nrDJ()9BlIWo+C]U=Bl8!6@;Kao
DJ()6BOr<(AU&;>8g&:gEcYr5DCuA*%15F5AoD^$+E2@>@qB4^Bl7Q+@rH6sBkMR/AKYD(."4ca
6rQl];F<l%+Co2,ARfh#Ed98[:Mq:I3%cn0+A,L1+EMgLFCf<1+EV:.+@C'bAnbn#Eb-mnDerrq
EcW@?ASuW5DfB9*F!,R<AKYMtEb/a&DfU+GAoDKrATAo'Df00$B6A6'FD5Z2+D,>(AM+E!.1HVZ
67sBjDf00$B6A6++CQCA8l%iR:K::[73H,TEb/a&DfU+G@V'.iEb-A4Ec5H!ARoLmB-;;7+EV:.
+Dtb8F<GXHAT072$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgD/XT/+E2@4G%kl;F!,:-@N]2q@ruF'DIIR"
ATKI5$<KMk:.\2N3ZqBm73G>o=B$DA<(0V+;FO;U<^fq06qKaF8P`)I;Fs;U+@B$q5u^9@+@93R
:f9k\;BSk;:/`927NbZ$8Q-a*5sd1H+B1m#+@Jdg<(Tk\5uL9C;]mK2FD5Q4Ci<`m/0J\GA8H0m
A1Sj<De*BiG&2)*A18X&8PDf#6:E"b78--L778aN+A#$F=\i$?6U=U=+@/=i<E()?84=Xg:JOkX
:/k.7:IZI+84?HG+@Jdg<(Tk\5uL9C;]nJ(+AP^3+@TC$6WI)S+B1m#+AP@-<$4k#66K3+78PTG
$4R>ABPDN1F*(u4+Co%qBl7L'+CQC9ATD6&FD,*)+ED%1Dg#]5+DbIq+EMIDEarZ'A8,OqBl@lt
EbT*+/e&.:%16!ED/XT/9OVC/Dfp)1AOL6BFD5Z2@<-'nF'iWrDe*3<3Zp4$3Zp*c$>F*)+=DV1
:IJ,W<Dl1Q-Qk!%+EDC=F?M6!C2dU'BHS[O8l%iR:K::[7403gD_;J++<Y`BDfp/@F`\`R5p/cq
6rQl];F<kqA8-'q@ruX0Gp$gB+Du+>+EM+9F`8HT+EM+9F`8I3DIal3Ed8d9B45Ll/gh)8AScF!
BkAt?/M:XHG\M5@+DPk(FD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A1hS2F!i)@D_;J+
+<Y`BDfp/@F`\`R8l%iR:K::[73H#LA8c?.BlbD7Dfd+9DKBo.Ci!Zn+>"^MDKBo.Cht5&DIal3
Ed8d9B45Ll/gh)8AScF!BkAt?8OccQ:*=(c/e&.1+AP6U+Cf5!@<*K/F`\a:Bk)7!Df0!(Gp$X3
Eb/a&DfTQ'Et&I!+EM4-Cht4AEb$:GF!*,U+<i0a-us6EF=\eEF`_>6F)5c'A1&fW-R'oI$6UI4
BOu!r+=D2?+>7dY06&*Y-S-ZdDf9_K-X:D)A8H0mA1&fW-R'oI$6UI4BOu!r+=D2?+>7dY06&*Y
-S-ZdDf9_K-X:D)A7T7pCi<`m-RgSo+t!g,+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MZBl5@B
F)Q2A@q?cnBk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd67sBhG&M)*
+C].qDJO;9Bl5%c:IJ,W<Dl1Q+E1b2BQG;7DBMVeDKU1H@;]Tu9jqNSF*VhKASlJt$6UI4BOu!r
+=D2H+>%VG+=A^\Df9_K-SKUaBl%j,Ddd0(%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*[&
@:U_p$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7T7pCi<`m-OgD*+EMC<F`_SFF<Dr)@:C@$
ASlC)Eaa!6+=M)8@kVY4DKU1Q+EMIDEarZ'A8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/nAlQ
%144#F)>i<FDuAE+=BTu@<6!&@;^?5E,oN5BlA-8+EV13E,Tc*Ed8dD@:C@#Dfp)1AKYMt@ruF'
DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!ED/XT/+CT/5+E2@4
G%kl;F!,:;@:UKs@:C?iBk)7!Df0!(Bk;?<%14Nn$;No?+E_RBAS5^uFCfJ8/Keb?DJsQ,+D#S6
DfTn.$8<SV+=&'c+ED%+A0sJ_4$"a3FD5Q4Ci<`m+DPh*Ci<`m+DPh*A7]q#Ddd0(+BosE+E(d5
-RT?1%15is/g+Y?ARTU%Dfp.EA8,OqBl@ltEd8d<Bl[cpFDl26ATJ:f;Is]`G%F?U@T.2fEarZK
Bk)7!Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36ZQaHFCcS;FD5Q4Ci<`m+Co1rFD5Z2@<-W&
$:K#RE$043EbTK7F!+n3AKYf-@:Wq[+DG_8D]iS)@ruF'DIIR"ATKIH+@C0\@<?''@3?t@FD5Q4
Ci<`m.3N/8@ruF'DIIR2/e&.:%15is/g+YEART[l+CQC1ATo8>FD5Q4+Co2,ARfh#Ed8dADBL?V
8l%iR:K::[74B?2+DGp?GA1l0+C\n)Eb0,sD.R6#CghEsEX`@N67sB`Dfm1>F`VXI@rH6sBkMR/
AKWCM8l%iR:K::[74B?fDIal/DeX*2+EVNE@;[2r@ruj%C`m;+E--@JA8-'q@ruX0GqKO5%16ua
G@VgDF`_>6F)5c'A1'GeC2dU'BHS[O8l%iR:K::[75&e*Bl%j,Ddd0(.6Ano@;0U%F`_>6BlnVC
A8,OqBl@ltEd9#A$4R>;67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+Nnr$?'Gt
-ZsNFCiaE2@:U`.>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<LnPDBMPI6m-#_D/^V=@rc:&
FE8RFF`&=DBOuH3A8`T.Dfd+4BleB=Eag/:Dfp(C@s)g4ASuT48g%\_G%ku8DJ`s&F=n[Y6#:?[
GAhM4F!+n3AKYMpAnc-oA0>T(+CQC1F_tT!Eb/c(F(96!FCSu,Ci<flCh4`2BOQ!*BlbD,Eb/[$
ARlp-BOu'(8l%htCi<`mF"SRX8l%htA9Da.+EM%5BlJ08+Co2-E,8s.+Dk\2F(&]mF!+n'FCfJ8
Ci<`mBl7Q+@UX@gBOu6-De:,1@VTIaFE9&W+B3#c+Dtb8F<GC.@N]`6AT/c.Ddd0t+EV:.+E_d?
Ch\!:+Co1rFD5Z2@<-WG%13OO=(-,eBl7QE+CoV3E$043EbTK7F!+t$DBND"+Eh=:Gp$p3EbAr+
F)N18F=2,P@3B3$De'u)A7]0lFDi:EF(HJ&Cj0<5F!,UHAKWBT+Zais/g)91Ddd0jDJ()#+CoV3
E$043EbTK7+DG_8D]hXpF(KE6Bl@l3ARoLsDfTnA@ps6t@rc"!BHTniAoD]4G%G]>+DbJ,B4W3,
@rc:&FE9&D$7QDk%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15dI@:UL&BOr</FD5Q*FD5<-+Co1rFD5Z2@<-WG
%14Nn$;No?+EDUB+EV:.+E_d?Ci^_0F_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6
ATD3q05>E9F)Q2A@q@<9FD5Q4/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;IsKPDImisFCcS;FD5Q4
+CfG1F)rIEAS,LoASu!hEt&IUBOr<&@<6N5D.Rd0@:s-oA8-+(CghU#A0>?,+CQC'F_u(?F(96)
E-*4:F!+m6Eb0*%DId=!+EVNEEb/lpDImisFCcS)Ec6#?+ED%*ATD@"@qB^6+<X9P6m-#S@ruF'
DIIR"ATJu2@;0V$@;0U%GAhM4+CfG1F)rIEAS,LoASu!hF!,R<@<<W#Eb-A9F(Jl)Bl5&1@;^?5
G@>c</g)99BOr;rEc6#?+ED%*ATD@"@qB^(@<,p%DJsV>F*)>@ARlotDBNJ4D/aP=@;]TuD09oA
+C\n)Eb/a$ART[lA0>;mFCfK:@<,n"/e&.:%15is/g,1GB4YslEaa'$+E_d?Ch\!*ATJu(Ec6#?
+ED%*ATD@"@qB^(@;]TuF(fK9+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:
D]gDT%13OO%15is/g,">CLnW2FD5Q*FD5<-+CQC5ART*lDf0B:+Co1rFD5Z2@<-W&$=n*sATT%B
;FNl>:JOSd-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39Q+?M+DPh*%16'JAKZ,;Bl%L*Bk;?.A8,OqBl@lt
Ed8dAF!,@=G9C^?@:Wq[+CT.u+CfG1F)rIEAS,LoASu!hF!,.)G%De*AS#a%F`:l"FCeu8+<XX%
+Cf>,E,9*-AKZ).AKZ#)F*)>@@<?4%DBNk0+A,Et+EMIDEarZ'@rGmh+EqB>DJs_A@rc-hFCcS'
DIal+Ddd0!-u*[2Ci<`m.3N&:A0<:8De*BiG&2)*A19,?$7QDk:-pQU@rc-hFCcS*Bk)7!Df0!(
Bk;>p$>sF!A0<77De*[&@:U`I-u*^0FD)dEIS*C(;bpCk6U`YCDe*[&@:U`74""c]A0>r3F`Lu'
+Cf>#AKYMt@ruF'DIIR2-OgE#ATqZ--YdR1A7]q#Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+C2[Wn
AThm.@:U`74""c]A0>DoG%GK.E,B0(F<GOFF<G+.@ruF'DIIR2-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku
$;+)^+EMIDEarZ'@rGmh+Co&&ASu%"+E)-?DdmHm@ruc7Bl5&8BOr</FD5Q*FD5<-+Co1rFD5Z2
@<-WG+<XWsBlbD;ASbdsBl@m1BPDE.BlbD6@;0V$@;0UjA0>?,+EV:.+E1b2BHV56A7]d(De:,&
Bk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*++:SZ6+E(d5-RT?1
%15is/g,(OASrV=C2[X!Ddd0*+CT.u+=MASBl%j,Ddd0*%17#a+?MV3C2[X!Ddd0!F`_>6F)5c'
A1%fn%15is/g+\=F)Yr(Gp$X3@ruF'DIIR2+DG_*DfT]'FD5Z2%16W[A:>XD0F\?u$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@ku$;>AHA0=K?6m-PhF`Lu'+Cf>#AM,)J<+ohc8l%htA8,OqBl@ltEd8d<F_u(?BlbD5
@<-!l+C\nl@<HX&+DGp?@rH7,@;0V#+CQC6F^fE6@;^1$@;I&pD/XQ7F<GL6+CoD#F_t]-FCB9*
Df-\+DIal3ATMr9A79Rg/g*`-+DkP4+EV%-AKYD(An?0/D/X9&DKKqBFDi:<Ddd0/%14Nn$;No?
+Dbt)A0>W*A.8l"+Z_;"4DJhDFD)dEIUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A1hS2F!hD(
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+Auc`ASu("@<?''C2[W*@rcL/F!,L7An?!oDI[7!%15F5AoD^$+ED%+
ASu("@<?4$B-:r-A1)F@@rcL/F!,L7An?!oDI[7!+Dbt7CER&-+EV:.+E)41DBNJ(@ruF'DIIR"
ATKIH+B3#c+=LuCA8H0mA18X3Bk)7!Df0!(Gp%!CG9CR-F!+m6Eb/ioEb0,uAKYr#FD)e=BOQ!*
Bl7EsF_#')+=MASBl%j,Ddd0*/e&.:%15is/g,%MFCcS:BOr;7C2[X!Ddd0*+E1b2BFP;ZBk2Z8
0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^+CfG1F)rIEAS,LoASu!hF!,[@Cht5)AT23uA0>f.+E_d?
Ch\!*ATKI5$7QDk:-pQUEb/lpDImisFCcRCC2[X!Ddd0*+CfG1F)rIEAS,LoASu!hF!+n/A0>r,
Dg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu7-RT?1%15is/g,">CLnV:
C2[X!Ddd0*+CQC5ART*lDf0B:+Co1rFD5Z2@<-W&$=n*sATT%B;FNl>:JOSd-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l39Q+?M+DPh*A7]on$;PM`+DbV2-Z^DHDdd0!@;]Tu@rcL/F!,L7An?!oDI[6#-u*[2
A7]q#Ddd0*/g)8bC2[WnAThm.@:Uf0BlbD@BOQ!*8K_MOCht59BOr;1A7]p9CghU#E[!+Y+B3#c
+Co&,/Snj@ATAo-F!+m6E-67FA8,OqBl@ltEd8dLBOQ!*F(o`;+E)-?FDl+@De:,#+Du==@V'R&
De:,5FCAWpAKYMt@ruF'DIIR"ATKIH7!3NaDJ()&AThX$DfBQ)DKI">DJXS@FD,5.A7]p9CghU#
EZek*@;]^hF"SRX=`8F*@ps6tARTXoCj@.DATi!-AKYD(A7]p9CghU#EZen,@ruF'DIIR2+C]U=
@r-()Bl7Q+Blks:$7QDk:-pQU@r-()AKYo1ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+DG^9@rHC.
ARfg)E+*j%+E):2ATA4e1E^UH+=ANG$?'Gt4$"a(De*BiG&2)*A0>W*A8H0mA0?#:Bl%j,Ddd0(
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+CT.u+CfG1F)rIEAS,LoASu!h/e&.:%15is/g+tK@:UK/
C2[WnAThm.@:Uer$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[WnATf\?
C3(a3$4R>;67sBpDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+D#e3F*)IG/KeS8Anc-oF!,FEF<G+.
@ruF'DIIR2+E1b2BFP;]Ec<-KC2[X$DC7Mo/g+eIE$-NCDe*d(-OgCl$;No?+CfG1F)rIEAS,Lo
ASu!h%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANZ%13OO:-pQUA7]pqCi=90ASuT4E+*j%+Co1r
FD5Z2@<-'nEt&IeBk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37qHRLEaa'$+D,b4Cj@.5Df'?&DKKH#
+DPh*+EM%5BlJ08%16'JAKXT@6m-PhF`Lu'+Cf>#AKYMt@ruF'DIIR"ATJu-@<Q3)DJs_A@V'+g
+ED%7FDl22A1eu6$4R>AD]i\(DImisFCcS,F_kl>+Cf>,D.RU,ARlp*Ea`KmFD5Z2@;I&Y+EM%5
BlJ/:Anc'mF!,(5EZfI;AKYK$D/aE2ASuU2+E(j7FD,5.8l%htF*VhKASiQ8Dfm14@;[3.F`&=1
+EM%5BlJ/:F*)>@ARlotDBO%7AKXT@6m-#S@ruF'DIIR"ATKIH+B3#gF!,OGAT/c4F`)7CFD,B0
+EM%5BlJ/H%14Nn$;No?+D58'ATD4$AKXT@6m-P\EbTK7+D,>(ATJu.DBNP6Ci"A>@rH4$ASuU$
A0>K&Ec!E<$?Bu+-Xq44Ch.:!A92[3EarZ.%13OO:-pQU@r-()AKYMt@ruF'DIIR"ATJ:f1E^UH
+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgDIIBn+A,Et+Dbt)A0>Ds@ruF'DIIR"ATKI5$<1\M+A,Et
+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'nF!+n3AKYl!D.R6#-u*[2A7]p5+=LuCA18X0DIak<F`_>6
F"&^a+AH9^Gp%3?F*&O5DIal!F_PZ&+EM%5BlJ08+DG^9FD,6,AKYMt@ruF'DIIR"ATJu2@;BEs
F`V+:De:,6BOu6r+DtV)ATKIH+B38%A8-3u+DG_8D]hYJ6m,uXA7ZltF=2,P@3B3$De'u)A7]0l
FDi:3DfBtE@;]TuEb0,sD.Oi3BOr<&Ddd0!A8,OqBl@ltEbT*+/g+/3@rH4$ASuT4@;]TuEcl7B
FD,5.AoDL%Dg,o5B-;#)DIml3FDi:3DfBtE@;]TuEb0,sD.Oi3BOr<&Ddd0!A8,OqBl@ltEbT*+
/g(T1%160&;GKeY7lhbm:.%fO9gqfV+AYa+=Wg:*+B_K?+@K!J:/=h35tk0F5t"iu83p9F+=LuC
A7T7p.3L$RDe(:>5u'fj.!9WGCi_$J6qKaF8P`)I;Fs;U/e&.:%15is/g,:SEb/ltF*(u6%15is
/g)qmEb/lo-9`P63[]&lBl%j,Ddd0!C2[X!Ddd0!C2[WnAThm.@:UL'FD5Q4+DPh*+DPh*A7]p3
%13OO:-pQU@r,^bEZee.Gp$j?A0>r3F`Lu'+Co1rFD5Z2@<-'nEt&IO67sBUDffPO+Cf>,D..<m
F!+n3AKY&gDId[0F!,CABk;1(ARmD97W3;iF`(o<+EMgLFCf<1%15is/g,1GD/XT/+CT.u+Cf>/
Gp$X3Eb/a&DfTQ'F!,=.DKTB(Cj@WB$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(
;bpCk6Ub7&FD5Q4-RgSo+t!g,:-pQUF(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR:K::[
79jSGA1&fW-R'oI$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*Bi
Fse^i-R'oI$4R>;67sBjDfBtEA8,OqBl@ltEbT*++>"]hAKYo1FD5Z2+Cf>/Bk;?.Eb065Bl[cq
+D#D/FEo!MF^elqEb/a&DfTQ'F!(o!:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0FD)dEIS*C(;bpCk
6Ub7&FD5Q4Ci<`m-RgSo+s8'W/1>7P@<?0*-[nZ`6rQl];F<lXF`_>6F'L(A/12Va04c7ZGpa%.
:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe*[&@:U`7/12Va+t"oiC2dU'
BHS[O8l%iR:K::[79jSGA6^K2/12Va04c7ZGpa%.:-pQUF(f-$C`k*M@rH=3+<i0a-u*^0FD)dE
IS*C(;bpCk6Ub6pDe*BiG&2)*A1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]ph-RgSo
+s8OM+>8!f%13OO:-pQUEb-hCAS5^uFCfJ8GA2/4+Dtb7+DtV)ATJ:f:-pQUEb/lo+=D;RBl%i<
4"+i_@<?0*-[nZ`6rQl];F<lXF`_>6F!iCu-YI".ATD3q+E_d?Ch\!*ATK4.$;No?+ED%+A0<77
De(4W-u*^0FD)dEIS*C(;bpCk6Ub6pDe(4E4""c]A0>r3F`Lu'+Cf>#AL@oo:-pQUEb/lo+=CoB
A7T7p-T`_kE+*j%+=DV1:IJ,W<Dl1Q>\\1fA7]p3.6AnlDe'u$AThX$DfBQ)DKI68$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'DBMl#D/E^%Gmt*[BPDN1CggcqF(fK9ARlosDg*=GD]ik7@:UKkF_u(?F(96)E--.R
+<X9P6m-PhF`Lu'+Cf>#AKYMt@ruF'DIIR"ATJu<ATD?)Ci<`mARmD9+B38%F`V+:FD,5.8l%ht
F)Q2A@q?cnBk)7!Df0!(Bk;?.D..3k+EM[GAKZ).AU,D,Eb-A2@;TRd+=LuCA7T7p.4cSiC2[W3
+CT.u+=MASBl%i>/e&-s$;,5MDBM8SCLqMq$;FrL@qZu?0JPNr$=[FZATDNr3B9?;D..-p/n8g:
%14Nn$4R>WDe*R"FE2:T2,$;&<(U%_76N[S-V@0&+=Jrn+A$HmEc5K2@ruF'DC5l#9L2!2<E)Lb
;E[&`0H`D!0F\@]DeO#26nTTK@;BFp%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV
;a!/a-WFbnF!,:-@N]B&FE2;1F^o!(+EV:.+A,Et+EMgLFCf;3/Kf(FG%l#/A0>K&EZdss3%cn0
+AH9b@qZu?0JPO7%15cp6:FdM:Jt+S3Zp-d$;<`P7ScBO;a!/a0F\?u$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
=(l#a+DGm>8l%i>%15^'6m-2b+CQBb+EqaEA0>r8DfT9!AKYE!A0>o(FE2),G%#20F*VhKASj%/
$4R>ABOr;q@<6-m+DG@t@3B#jBPD?p+A,Et+DGm>FD,*)+A*bqEc5T2@;TjqDJ()+F!+q'F*&OJ
Bk;L"A0><%+E):5@;]e*Bl7Q+@3B&uCi!ZmFD5Z2+E(j7GAhM4F!,RC+E1n4AoD^,+CQC7@<63:
+A[#j@;]e*ARlonDes6$@ruF'DK?q=Afu;9Eb'56BOQ'q+CQC%ATW$*EZf7.D.PaN6qKaF8P`)I
;Fs;U+Unc-%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%htBlbD*+A*bbA7TUr/g)9.F<G:=+DG_7FCB!%
ARlotDBO%7AKWCM@:WneDKB&qASu("@;K1`De(:>@WGmp@q[!'Afu2/AKYK*EcP`/F<F0uF*VhK
ASiQ%DerrqEZeh:+EV:.+E1b!CLLje+DkP)@:s.l+E)9C@X0)=DL-#9E+s3&+EV:.+Co2-FE2))
F`_>9DBO7>E$-QDDe(JHBlGLR+<XWsAKYl%G]Y'E@:C@#FCfD6Bl7X,BjkglH=_.?FD,5.8l%ht
F*VhKASj%/$7QDk:-pQUF`V,)+C]U=FD,B0+DbIq%17,eEHPu9AKW@4Bl%@%+Co2,+EV%5CF9Pu
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+B*AjEc`Er:IGX!<+oue+EMX9E$04D@<-I2+EV:.+A,Et+EMgLFCf;A
%14Nn$;No?+EMX5Ec`F=De'tB+CfG'@<?(%+DkP.FCfJ8Anc'm+DGF1DIm<hF)tc1Gmt+$AT;j,
Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qASl@/AKYo-A0>\s@N]2q@ruF'DIIR"
ATJ:f8l%htBlbD2DKBo.Ci!Zn+EqOABQ&$8+CT/5+Co1rFD5Z2@<-'nF"SRX+B38%F`V+:8l%ht
H#IgJD09oA+CfG'@<?''F)Po,+Co1rFD5Z2@<-'nF"SRX<+oue+DbIq+E_a:F!,(5F`JU9G[YH.
Ch4`"Bk)7!Df0!(Bk;?.-u<=$.4cSiCggd`ATfLR+=M>MGpskEDIak<E,8s.E+No9/g)9/:IH=9
Bk)7!Df0!(Bk;?.@<,p%@rc-hFCeu*GA2/4+EV:.+=M,=G@W-F,&Ut9+Co1rFD5Z2@<-W;+Eh=:
@P/c4$4R>/AS,k$AKYK'ART[pDJ().@:C?iBk)7!Df0!(Bk;?.Eb0*+G%De)DL!@DEbTH4+DbIq
+Co1rFD5Z2@<-'nF"SS7BPDN1F*(u4+Co%qBl7L'+CQC8FD5Q*FEo!NBOQ!*GA1l0+D#S%F(HJ)
Bk)7!Df0!(Bk;?.Ao_g,+Co%q@<HC.+Dbt+@<?4%DK@EQ8TZ(hF!,LGDBNY2+EV:.+Dtb8F<GXH
AT07E%13OO=$]_Z8PVc:+A#$F<(KG#<(0MX:JsJV=WgC(66JZf6W?WQ:-hcL78k<r:JOkT8PUC"
:.A#W9gM`M:JN$8:K8N)5uL,o5se@I<$4S)+AP^3+@TC$6WI)S+B1m#+AP@-<$4k#66K3+78P-:
$7QDk;Is]`G%F?U@ROp?FD5Z2@<-'nF'iWrDe*3<3Zp4$3Zp*c$?C''F?M6!C2dU'BHS[OF`V,7
-OgDsAhG2t7TW/V+CoCC%144#F(f-$C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]'@:EbY
Fs8:C$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX>\\1fA8,OqF'NNi@Nm0/$6UI4BOu!r+=D2?
+>7dY06&*Y-S0:VDfdNX>\\1fA8,OqF'Ng*Gp4UF$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX
>\\1fA8,OqF'N[#@<lg'DB^G;$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUGA1qD+Co1rFD5Z2
@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U+CTG3Bk/>qCgh3sF!,17+E1b2
BQG;7DBMVeDKU1H@;]Tu9jqNSF*VhKASlJt$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCa
FE9*O@:EbYFsd_++<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A8,OqF"_?<@ODTl+<Y`=ASc0*
-ZX&H/TPGG-S0:VDfdNX05>E9A8,OqF"_WRGpa%.+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9
A8,OqF"_KK@<lg'DC5l#+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MP@:Ls,Bl8'<.3N/8@ruF'
DIIR"ATJu*Eaa$#A1%fnAScF!BkAu.D_;J++<Y`BDfp/@F`\`R7<2gXAKYE!Gp%'HAThd+F`S[I
ASlC)Eaa!6+DbIq+Co1rFD5Z2@<-'nF!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$;tGPDg#\7@;^?5E,oZ2EZf1,@N]2q@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp$X3
@ruF'DIIR"ATJtG+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcDe't<-OgCl$;No?+E_RBAS5^uFCfJ8
@;^?5CggcqA8,OqBl@ltEbT*++>"^MB5VX.AKYQ)Ec5u>%14d30H_V`1E^^LB4N>Q+?MV3Cggd`
ATf24@:C@$Dg<IECghU.ASrk)$4R>;67sC$ASl@/AKYMt@ruF'DIIR2+Co2,ARfh#EbT*++CT.u
+CT)&+Cf>-FCf?3F!*%WBkM=%Eb-A)EcQ)=Et&ISASl@/AP?NA6tp.QBl@ltEbT*++>=63%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%16'JBlbD<FCfD6@rc-hFCfM9FD,5.-u<=$.3N&:A0<::@:EbYFt"PEBk)7!
Df0!(Bk;?<%14Nn$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%14m6De't<-OgCl$;No?
+CfG'@<?''-u<=$.3N&:A0<!CCggd`ATfLFA8,OqBl@ltEbT*+%16uaG@VgDCggd#%16uaG@VgD
Cggd`ATfF1$4R>;67sBsBleA=@<Q'nCggdhAKYMt@ruF'DIIR"ATJ:fDe't<-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l3:N0l_Bl7Q+@3B&rDf]W1B-:`!@ruF'DIIR"ATKI5$<1\M+A,Et+Cf>,D..<m+D,P4
+E)41DJ=!$+CT.u+Cf5+F(oN)+Co1rFD5Z2@<-'nF!,1<+=M/=.3NPL+=M/IASrW$Bk)7!Df0!(
Gpt?g8l%ht@rH4$@;]Us+CT;%+EM47Ec`F4DIal$@<6]:FDi:DH#R=I%13OO-uWWF+Ceht+E)41
DBNJ(@ruF'DIIR"ATJtl76s=C;FshV+CT.u+AtWo6r-QO=Y:g_F!,aHFWbO8B4uB0AU&0*@rrhk
76s=;:/"e5A8,OqBl@ltEbT*++CehtDJsV>@V$ZlBOPdkARlomGp#^T6m,uXD/E^!A90@4$7QDk
:-pQUDfB9*+ED%%A1r.IBlmnq$?'Gt-Z!4#A7]p3%13OO:-pQUDfB9*+ED%%A1qk=Cj?Hs1*CLG
+=Cu6@ODTl%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*2qAKYK$D/E^!A0>o(FEMVA+Cf>#AKYGjF(o-*%15C;
C`l>G6m,uXD/E^!A9/l6ATW'8DBND,G\(D.Ch[s4+ED%7F_l/@/g+,,AKYT!EcZ=FBlmp'+DGm>
@3BT%FEMVA+Cf>#ANCq^0e"5XDf9//-nm(m@UWe"+<XQnD..-rBl7Q+Blmp'F!+n3AKYi$F)tc&
ATJu&DIb:@F`V\6Ci"AJ+D#S6DfQt@ASbdsARlotDJ!g-D..O#Df.0M+A,Et+Cf>,D..<mF!,F5
Eb961D'3D7FCf?2Bm+&1@<-"'D.RU,+Cf(r@r#drB.b;L8S0)jDfm13Eb/Zp+CQBb:IH=8Df'?"
DIal/Ch7$rAKYQ$@;0O#D.Oh<@UX%`Eb],F3C%4o@;0O1@rH35+CT.u+EV12C`mS++EqL-F<GjI
FWb4/A1e;u.1HVZ67sC%Df'&.ATDg0DIma/F!,C?ASrW#Df'?"DIdet$?'Gt-YX]3D'370D/"'4
Bl7Q+A8,OqBl@ltEd9#A$4R>;67sBi@:UL&H#R>9%17#a+?9l<%15is/g+V3A0>o$DJO;&$?'Gt
1E\J!-Xq"4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3:Msu_DIjq_:IH=9De!p,ASuTuFD5Z2%15^'6m-/O
F!,%=FCf?2Bm+&1-u`^/.3N/>@s)X"DKK</Bl@lA+A,Et+CoD#F_t]-FCB9*Df-\-@;[2sAKYDk
@qB_&ARlp-Bln#2FD,5.-u*[2BOu"!.3NeFEagX1$4R=jC2[WrASc<7+EML1GA_IE@3AB77Nc__
@:Wqi+EV%5CG$`%:IH=JF(HId-Z^D?Df00$B6A6+A0=]:7Nc__@:Wqi+E)-?=(uP_Dg-7F@;]Tu
9PJBeGT_'QF*(u1F!+n/A0>u-AKW18E+No2+EM4-Cht5(Df'?"DIal.DBMY^@rj73$7QDk:-pQU
A8-+(CghT38l%htA8bt#D.RU,@<?4%D@HqfDe*NmCiCLN%13OO:-pQUCi<flFD5Z2+E(j7D..-r
+A,Et+AbHq+CoD#F_t]-F:ARlE+*j%+=DVHA7TUrF'N?hDImisCg:^nA7TUgF_t]-FBicqAn5gi
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l36tp.QBl@ltEd8dH@<?1(%16'JAKYo1ASrW$Bk)7!Df0!(Bk;?.
De:+a:IH=9AS,XoAKYD(F(Jd#@qZunDIal%ATVEq+E1b2BJ(E,BOr;7A8,R'+=Lc7@ruF'DIIR2
+DG@tDKKT)Bk(RnBl@l<+Eh=:@N]K$F*)IGFD,5.E+*j%/e&.:%15is/g,4KDg*=C@<?/l$=mj]
+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'JAKYN/@:X(^+D,P4D'3b/+=Lc7A18XAATW'8DK?q2ATV?p
Ci^_-@W-C2+EV:.+Cf>-FCf?3F!,C5+D"tkBHUi"@ruF'DIIR2+E)-?FD,5.E+*j%/e&.:%15is
/g+\=@ruF'DIIR2+Co&*@;0P!%14d3A8,Qs0F\?u$;No?+Co1s+FYFe+<Ve%67sBo@;]V$+DGA#
Df#pj%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*2qAKYo#C1Ums+E):7ASuTuFD5Z2%16'JAKXT@6m-PrF*(u1
+DGm>@3B&uD/a<&FCcS'DIal#ATV?pCh7-"AU%X#E,9).De:,1@VTIaF<GLBBk;1(ARlp&Ec5T2
@;TjqDJ()+DBMP(+<XWsAKZ&>F*(u1+Cf>-F(o];F!,C5+CQC1F_tT!EZf:4+Cf4rF)to6+=M2L
AS,Y$ARlp-Bln#2-Xgb.A1&fY+<Xa!ASrW4BOr<-H#n(=D'3Y5@:XF%@3B`%EbT*,Gp%$;+E(_(
ARfh'+CT;%+CfG'@<?'k/g)99BOr;q@<6-m+CT;#BPDR"@ruj6AKY].+CQC0@;0U%A8,OqBl@lt
Ed8dG@VTIaF<G[=@<<W%Df0Z*Bl7u7AoDg4+EM[7DdmHm@rucE+@T^KBHV54ASrW$Bk)7!Df0!(
Gp$gB+CT)-D]iJ0F)PQ&@<?'k+EqOABHU_+A8-'q@ruX0Gp%$7C1Ums/g*PrEb/a&DfU+GDdmHm
@ruc7@<,p%@rc-hFCeu*@;]TuA7]h(Ec657A0><%+ED%5F_Pl-A1e;u.1HVZ67sC!@VTIaFE8R6
AS5^pDJ=!$+EqOABHS[2C2[W1+CT;%+EV:.+A,Et+Cf4rF)to6/e&.tDf0A60F\?u$;No?+A,Et
+Cf>-F(o];F!,C5+EM7A+C\c#Bk&9(@VTIaFE8R5DIakuEt&IO67sBt@;^?5A8-'q@ruX0Gp%$7
C1UmsF!+n4+EV:.Eb-A%Eb-A4@<?0*Blmp'F"Rn/@rH7$+>F<4%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B3#c
+E2IF+Co1rFD5Z2@<-W9@rH6pAT2`#$<1\M+D,>.F*&O8Bk)7!Df0!(Gp%$C+EV:.+E1b2BHV#1
+EML5@qf@f/g)9.F<G:=+EV:.+E).6Gp"5?Bk)7!Df0!(Gp%3B@<<W%@;[2sAKYi.A8,XiARlom
Gp#^T6m,uXD/E^!A90@G+@9XL@<HX&+Dl%<F<G+.@ruF'DIIR2+Dl%-BkD'h@<?4%DK?q/Eb-A4
F`]!P+A!\c@;Ka&FD,B0+Co1rFD5Z2@<-W9FD,5.,&h[H+s:E1@ruF'DIIR2/e&-s$;#=eF!,16
E,Tc=@;^00FDi:EDId=!F*(i.A0>u-@<<W;Dfm14@;[31F(HJ9BOr;rDf0Z.DKKqBDe:,6BOr<)
FD,6++Co1rFD5Z2@<-'nF!,C=+EV:.+E1b2BHUc,F<GjIFWb1&DJjB7+Cf(nDJ*N'FD,6&+DG^9
@;^?5G@>bL%14Nn$;No?+D,>.F*&OD@<?0*A8,OqBl@ltEd8dAF!,R<AKYr7F<G+.@ruF'DIIR2
%16W[A0<Q8$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;eART[pDJ()0ATo8-Bk)7!Df0!(Bk;?<%15F5AoD^$
+Dl%-BkDX)DJ()6BOr;rDf0Z.DKKqBDe:,#DL!@8Bk)7!Df0!(Gp$p7F=2,P@rc-hFCcS'+Dtb7
+<koGGp4AABk)7!Df0!(Gp$O5A0>_tCLnW&F<G[=AKYr7F<G+.@ruF'DIIR2/e&.:%15is/g+Y?
Df]J4DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5-RT?1%15is/g+YEART[l+=M>MGps10DIn$&+=D8L
Gpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15g<CLnV:FDlFR+CQC3F`\a:Bk)7!Df0!(GqKO5.1HVZ67sC!
E+No0FDlFU+DbIqA7]p,@;]TuCggcq/Kf.RGp$gB+EV:.+E2IF+Co1rFD5Z2@<-W&$?'Gt4$"a2
Dg<IA@:EbYFs(U0@ODTl%15is/g+kGF*2M7+EVOI+DGm>Eb/Zi06_GNFCbmgA8lU$F<Dr/76s=C
;FshV-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37qHdaBl7Q+@;]TuE-68EBl7Q+GAhM4F"Rn/8T#YmBOr;u
Bl\9:+EM+(FD5Z2+A!\s@;06p8l%htBlbD*+EqaEA0>r8DfT9!AKYE!A0>o(FE2),G%#20F*VhK
ASj%B+AQj!+EqB>@<,p%Eb/ZiGp%3I+=M2OF=A>@DIak<B4Z06+EMI<AKZ28Eb'5D%13OO7VQma
F<G(6ART[l+EMI<AKZ28Eb'56FDi:CFDl22/e&.:%15is/g+YEART[l+EMI<AKZ28Eb'5#$?BQm
A8c<J3ZpXA0H`)(,V^u,+<XEG/g,%SD.Ra%@j#Z-F`%WqFCf]=4ZX]5FD,B0+DGm>@3BZ'F*&OC
Afu2/AKYo/AKYr7Eb-A8BPD?s-OgDpCi<a(F$2Q,1*A(i,p4or0I&;+0F\A1H#7#/Ci_a#+EKRd
-Qm>F@q?d"DfTD3GA2/4+D,1rCh[d"-OgDlDg5i(4ZX]J+u(3S/g)nl1CX\3@<?4%DII@&4ZX]?
0JFV"+=/-Y5!!C1+>GQp.3Mq>2)#IHF`(o'De*EB3ZrQ++=D8EBlbD2F!,@=G9D$GBk)'lAL@oo
ART(^4ZX]4/j:C#+<VdL+<VdL+AP6U+EV%%BlkJ+A9MO)@LWZUG]7J5@qg$J3Zp7%3Zp*c$;No?
+D#e:Ch[BnF<Ga<EafIbGT\Lh+F+D'.1HUn$?pE/A90mp+?MV3Ea`irDf$V=AU&;>Ao)BoFE8RG
H#7#/Ci^_.Dg5i(+ECn4Bl@ltCi^_ADJ<U!A7Zlp@:NsnAU&01Bk(k!-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$7Kk9F=A>HF!,R<AKXT@6m,uXD/E^!A0>u-@<<W5FDl22F!,[FEb'5D%13OO;dji\+CT.u
+D#S%F(HJ9BOr<1DfTB0/g)99@;BEsF)Po,+EV=7AKZ)5+Cf>-G%ki(AKZ8:F`MP7Ch=f3BOQ!*
FD,5.GAhM4F!,.)G%De*AS#a%ATD4#ARlomAS,k$AKYr4De!?iA8,po/e&.:%13OO:-pQUF('6'
+EqaEA9/1eE-67FGAhM4Et&Hc$;No?+D#S%F(HJ)AS,XoBln'-DK?6oATD4#AKZ28Eb'5#$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'D@HqJDg*=EATVs,AThW-FD,5.F*)>@ARlp-DfTB0+CT.u+Cf(r@r!3/BOQ!*
FD,62+CT;%+E2@>E+O'+Gp%-=F*)>@ARmD&$7QDk:-pQUB4Z0-GAhM4Et&IhATT&=DfTB0%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[cDe!p,ASuTuFD5Z2+>GQ)%15mKAKYo'+DlBHE+O,6E+NU(ATJu.F!,UC
A8bt#D.RU,ARlonDe*E&%13OO88i\pDe=*&DBNV$G%DeADfm19@:UL&D]iY#@q?crF`(`1ARoj5
+DkP4@V$[(BQ&$7@;]Us/0JkC+Dbb0ATJu4AftT%A7Zm-Bln#2DIIR2+CQC&Df'?&DKI"8DBO"7
B4uB>+@C'aD.RU,F!+n3AKYl/F<G16EZfR?D/aP=@;]TuB5)C&GqElEDD!&2ASc0sDJ()%Df'?&
DKKqB@<,p%@3B5lCi!rsEbce9Aft`)De'u#De*E3%13OO8l%htE,ol?Bk1dr+CQC1F_tT!EZf:4
+Eq7>F!,RC+CoD#F_t]-F<GdGEb'5D+BN5fDBN@1GAhM4+DGm>Bl8$5De+!#ARlotF=2,P@3B3$
De'u)A7]0lFDi:CFDl22+CQC6BQ%p5+E)./+Dbb0AKYMpF(96)E-,f4DBNk0+EV:.+EqaEA1e;u
.1HVZ67sC%FDl22+EM47Ec`FJDfTA2A7]glEbTK7Bl@m1%14d33$<0_F<DrO@;]UoD'qCmEa`ir
Df$V2DKKH&ATAo8@:F%a-OgCl$8<S^+E2IF+=C`/@q[5O-Xgt5Ch[I%+DbV$F<G"4B6A'&DKI"C
D]iJ/Eaa59Blmp'F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15mC+Cf>4EcYe7H#IgJ@ps6tG%kN3+F.mJ
EZfFFDfTE"+Co&)@rc:&FD5Z2F!,[@FD)dFB4Z06/e&.:%15is/g+e<F<GX<DfTqBAU&01@;]Lq
Bl@m1%14d33$;jFF<DrO@;]UoD'qCmART(^-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;GGZAKYMpFCAm"
ARlooDe!p,ASuTuFD5Z2+Ceht+C\n)F*)>@ARlolDIal1ATVs,AThWq/g+,,BlbD<FCfD6Ci<`m
F!+m6Eb/ZqBleB1@j#?-@;Tt"AKYo'+EqaEA0>E$@s)X"DKK</Bl@l3Bl8$2+EV:.+CfP7Eb0-1
+E2IF+Co1rFD5Z2@<-W9@;]TuFD,6'+Co2-E,8s.F!,[@FD)dFA8-+(.4u&:%14LoBle5B+DGm>
@3A0<6m-VoBl%L*GqL3^8TZ(hF!,R<AKYo/Cj@.HATD6&FD,*)+ED%8F`MA@%16Md@q]:k@:OCj
EZf14F*&NQGA(Q*+EM[8@qB_&Ap%o=+DG_7FCelk+E(j7FD,5.F`V\6C`m2*G\(D.-urfZG%#30
ALS&q.1HVZ67sBsDdd0t+=L`5@;]^hF*)FO+CT.u+=L`5@;]^hF*)FO+CoD#F_t]-FCB9*Df-\3
DKKe>FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8*$F(96)E-*3MIUQbtDf0W$B4YslEa`chC2[Wf
C2[X!@:F:_CggdaG[YH.Ch5:S0eR0TF!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16'JBlbD<FCfE4+Co2-
E,8s.F!,R<AKYf-DJ()&De!p,ASuT4Ci<`mARlotDBO%7AKYr4AThd+F`S[HFCfDD%14Nn$;No?
+EM47G9C^?DJ()&De!p,ASuTuFD5Z2%14d33?VjHF)W6L@q]:gB4Z.+E[M;'%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+AHcpAKYr7FED57B-:W#A0>MrFED57B.aW#-ua<N.3N&:A0<:5ATT@D@<,p%EHPu;AKYT$
AU%ouCh4_tDIal"@;[3/FDl22+D#G4Bl[c-Ci<flCh7Z?+<XWsAKYf-@ps1bF!+t$DBND"+DtV)
ARlp%EZf7BD.7'sARmD&$7QDk:-pQUF('6'+EV:.+=LZ5De*]nCLnq;Ci<flCh580CghC++DG^9
,'7aK+q4l,@;9^kD..3k-QmANF<GmU4ZX^'CgUUcDe*]nCLpiqBeCMb%13OO:-pQUEb0?5Bk;I!
+EV:.+=LZ5De*]nCLnq;GAhM4F!,17FDi:1DBL<OG^(SYCi<flCh4%_-[9l\-Qm&5F<GmU%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[rARTUhBPD?s+D,P4+EqaEA9/1e9PJ9R+Dl%<F<GXHDfT9!AKZ&>F*(u1
F!+(N6m-GhDg#i*ATJu+@:O"fBln'#F!,(5EZfF7@<,jkBl7Q+FD,5.@rH7,ASuU2+E(j7BlnD=
A79Rg@UX=h/e&-s$<1\M+DkP$DBO"3@<,jk+Cf>,D..<m+DGm>-tI43.3L$LBk)7!Df0!(Gp%!5
D.Oi+BleB;.4u&:.1HVZ67sBsBleA=@;Ka&FD,5.GAhM4F!,C=+EV:.+E1b2BHUbqB5)7$Bl7Q+
GA2/4+=C]B-OgE!BleA=I4cXQDJUFCA9B7/$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$A8Z34+Ceht+EM+&
Earc*AoD]4GAhM4F"AGUATMs7/0JSGDfp#?/0K"VBlmp-+CT.u+DkOsEc6"O+<XWsBlbD<FCfD6
@rc-hFCfM9F)Po,+D5_5F`;CE@;]TuFD,6'+Dbb5FE8R5Cht59BOr<!Ec6)>F!,C=+EV:.+E1b2
BHVD1@<<W$AS5^p+EqOABHSZp:IHQ>$7QDk:-pQU@rc-hFCcS9Df'&.B6%p5E,uHqB6%r6-ZaBM
Bl7R)-T`\cBOPdkATMs6-OgDqEc<-KCi<g*ATMr@4)SkA@;9^kD..3k?Qa&81^sd$$;No?+D5_5
F`;CE@V'1dDJj0+B-;D4FD)dECi<f2%14j50d("EC`k*ADdt.($4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBN"o
@<<W#Eb-A8BOu6r+D,b6DL!@5EbBN3ASuT4DKTf*ATDiV%15FI+Du+A+F.mJ+D>2,AKYr4Ddm-a
Cj@.@Dff]'ARlp*BOQ!*D..=-+A,Et+Cf>,D..<mF!,R5CLnW&DKKH&ATAo%EbBN3ASuU2/g)9/
:IH=6EbBN3ASuT4@rGmhF!+n3AKYo'+C\c#Bk(RfCj@.FBQ@Zq+EVmJATKCFDdmHm@rri'De*F#
/0JkMFD5Z2+Cf>#ATJu&DIal0F^]*#AnbgsF"Rn/%16'JAKYo#C1UmsF!+(N6m-PmDfTE1+CT.u
+ED%8EbT*.ATJu&Cht5-@<Q3)DdmHm@rri'De*F#/g)99BOr<(AU&;>FCAWpAKYMtF)Yr(H#k*#
:IH=D@VTIaF<G(3A7]fk$7QDk:-pQU8l%htDdmHm@rri'De*F#%14LG+tt-R/g*&$+=o,f4$"`j
:JsS'<(0_b+@f=*<DXf:<Cp.Y+AG-h;GSE'8OHHK:JO2R=XOXc%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15mM
FD5Z2+CT.u+E;O4Ch[KqATAo'De*F#+EM+1ARfg)@;]TuD/Ws!ApGM;E-,f4DK@EQ+B3#cGp$O9
AKYDtC`mG0FCf)rEcWiU7W3;iD/XH++DG_*DfT]'FD5Z2+CS_tF`\a7EbBN3ASuT4@rGmhF!,L7
@:UKQ:IHRO+E).6Bl7K)A8bt#D.RU,@<?4%DCuA*%15jKG9C^?DegJ(F<GXCD.Oi,DfTD3-tI43
.3N,=D/E^!A90@4$7QDk:-pQU-tdR=F`8lSDfBf4Df-[P+>"^Q@<?!m+E2@4AncK=+>"^G@<6!&
D..O.ATDi$$8N_Y+CoA++=CtQ%13OO:-pQU-uEC&Ec3KODfBf4Df-[Q+>"^R@;TQu@rH7,@;0V#
+EMXFBl7Q4+>"^RD]in*@rcL/+F.O?%14p71*C+FC`k*6E[M;'%15is/g,">CLnVs+DkOsEc3(/
DIal2ARTUhBHU_r@;0Tg$8`lEF`\`R@<-C$BI>l6;aXGS:fLe1C2[Wi4"!ci/g,"V+CoC5DJsW1
Bl7Q+8g%tZ@rcK8%13OO1a"OrA8Z3+-Xh$C%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fEc6)>F!+n/A0>r9
Blmp-%15^'6m-GhDg#i*ATJu&+EM76E,9).G@>b>FDi:7Ec6)>+EqaEA9/l%DIal3ATMs7/g)9&
+D5_5F`8I;F!+m6@rH1"ARfgrDf-\9Afs\gGAhM4F"SRX5p15kBlmo/BlbD*+Cf>+Ch7*uBl@l3
De:+a+EV19F<GX7EbTK7F"SRX=`8F*@rc-hFCcS'DIal,De*QoGp$a?Dfp#?+CT.u+EM[>FCfM9
GA2/4+EV:.+=LlCE%)oQATD64%14Nn$;No?+CfG'@<?''@3B3'Dfp"ADe:,9DfTB0+EqOABHV2$
D.Rc2@V'1dDJj0+B-;D4FD)dE@q[5!$>4Bu+=D8BF*)&8Dfp"H+?L]o/g+\BC`k*8BI=5r%15is
/g+YEART[l+CQC7ATMr&$8EZBF`\`RBOu!rDg-,?Ch+nT-SZ`J+=AO/:IH=IATMs7+CT;%+A*bt
@rc:&FE8RHBOQ!*Eb0?8Ec*!SF!i=_%13OO:-pQU@rc-hFCcS'+EV19F<GXIBlmo//KeqLFCcS2
AS-$,@<-"'D.RU,+Cf>#AISu&+D5_6+=D8BF*)JGBlmo6+?L]o/g)kkA8Z3+-RT?1%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%166VFWb1&DBNb0F*&OHBOr;rDf0Z.DKKqBDe:,)Ec6)>F!,CA+EM[>FCfM9GA2/4
+=LlCE%)5'.1HVZ67sBsBleA=@rH7,ASuU2+E(j7FCfN8B6%p5E$/e6Dfp".$>4Bu+=D8BF*)&8
Dfp"H%13OO:-pQU@rH7,ASuU2+E(j7FCfN8F*22=ALnsADffP5F*22=AKYK$A7Zm"AS-$,@<-"'
D.RU,%14m6B6%r6-Zip@FE;S=FCcg/$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMY^CM@[!+D5_5F`;CE@;]Tu
F*22=ATJ:f:Ms_dDe:,6BOr<'@;0U%@:XOiDKK<"ATJu4Afu/:DfTQ0B-9eh@rGmh+DG^98l%ht
G&o8Y@3BN*@;0U%F(96)E-*4:F!,R<@<<W;Dfm14@;[3)@;0V$@;0U%@3AK?:.IuH+Eh=:F(oQ1
+E(j7@3Bc4Eb$^DFCfN8/0JSGDfp"ADfQtAF_Pr/+CT.u+EV:.DBNS'DImisFCcS3@;^?58g%qg
@:UL%@rc:&FE8RHBOQ!*F`V+:A8,OqBl@ltEd8dG@VTIaFE9&W6t(1G@UX=h+Co&)BkM<pEcW@5
@;Ka&FD,B0+<k`AAKZ/-EcYr5DBNk0+EV:.+EVXHFD*9N%13OO<+ohcAoDL%Dg,o5B-:o+F(KB6
F!+m6F(oN)Ch4`5DfTA2Bl5%AFDlFR+D5_5F`;CE@;]TuFD,6'+D58'ATD4$ATJu8@rc:&FE9&D
$7QDk:-pQUCh74#+DQ%?FD5?4+EV%$Ch4`4ATD5h$>aI"F*'Q+-Qjc`,W[&/-s[sC/g=XWINW>W
+u(Du5U]n\AM,*0.4G]5%15is/g,4WDfTD3Bl5&4F`\a:Bk)7!Df0!(Gmt+"F`\`RChe*6F=.M)
%15is/g+kGF(KB6+DG^9@;Ka&E-67FA8,OqBl@ltEd8d?Ec6)>F!(o!."*]j1*CUKG&JKN-Rg0H
A7T=nE$dak4==r[F`VXP%13OO:-pQUCi=6-F`8HOEb0E4.3N>B+DPh*/oY?5+EqOABHS^<De*Nm
CiCg4$4R>;67sBnASu("@<?''@;Ka&E-67FA8,OqBl@ltEd8d?Ec6)>F!(o!0Hb4KF!a'nI4cWt
+ED%:D^QnA$4R>;67sBpAfu2/AKYf#Aoo/(EbBN3ASuT4BlbD.Ch[EkA0>u-AKYW+Dfp#?+CT;%
+DkOtAKY])FDi9MCi<`m.3N\AEbTK7Et&IO67sBtCi^pe+FPjb1*CUKG&J`U%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-[l@:O=rEt&IU@<64*/0JbCCLnW2E+EC!Bl7Q+B4YslEaa'$A0>r'EbTK7F"AGD@;[2s
AKZ&.D/a<*Anbge+EqOABHToC6m->T@rcL//g)9&+A,Et+DkOsEc3(7F!+n/+CT;"BlnB(Ed8d"
+EM%5BlJ/:FD,*)+Ceht+C\n)An?'oBOt]s@;]TuAU%crF`_2*+EqOABHS^DD(.(H$7QDk:-pQU
D.-ppD]j.8@<<W)ASu("@<?(%+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E,uHqC2[X"@:O=r4ZX]5
:-pQUB4YslEaa'$+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!BX9L^Q\0Hb4KF!a'nI4cWt+ED%:
D^Qn[-QjcG$4R>;67sC%FDl22+DkOsEc3'P+Cf>#AKW`_+EV12Ci^^k:IH=IBPDN1BlbD*+A*bt
@rc:&F:AR6+E2IF+=D#7CLqI-FD#W5F!j%)0fs,gA8PabEc2Bo%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%16!U
DJj0+B-:V*8l%htD.-ppD]ib8+CQC6Bl.g*AKYhuFED)7+E(j7DfB9*Bl7Q+FD,5.@;p1+DfB`2
@<?''A8,OqBl@ltEbT*++CT.u+E_a>DJ((?Ec!6J/Kf(VDBNe)@rcK?%14Nn$;No?+D,2,@qZun
DIal$G\(B-FCcR($?Bu+-Z*:-AT2d6B6%s4-OgCl$;No?+D,2,@qZunDIal$G\(B-FCcS9Bl%?u
FDQ4F/Kf7OCht54DJXS@A8-+(CghT3AU&01Bk(k!Gp$U8A7Zm%F`_SFF:ARP67sB8+ED<A-Z*:-
AT2d6B6%s4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;Fr=Ec6"A@<,p%DJsV>Eb0<6EbT$*ARlp*D]hXp
F(96)E--.R+<Xg*FWb1&DBNA(F)N1BFDl22+@oI+9Iq;[@8pf?/0J%h9Iq;c79EM?+AG."912QW
:+RMf<(8hi@;]Tu6<R8V+EM%5BlJ08+DG^98l%htA8,OqBl@ltEbT*+/g)94DJXS@8g&1bEbTK7
F!+t$DBND"+EDUB+D>\;AThX*/e&.:%15is/g,4WDfTD39OUn3=<K"I1+=>SDIak\<)$%/-o*S-
+EV1>FE7lu1a$a[F<DrI@<?(*-Ta(=4!uX5/g*hr<+T/S@rGmh+>,9!-OgCl$8`lEF`\`RBQS*-
-Ta(>4!u.'/hS8;<)$%/@rGmh+>,9!-OgCl$;No?+EMXCEb-@q9hZ[<DIakuEaia)Eaa!6+B1d3
<$3SuH$!V=.4u&:1a$a[F<DrUD/:R]=A;Ir@;9^k?TTVtFCfN85'1IPF!,1<+DbJ'AKZ57Ccj@m
ATMrW-OgCl$;No?+@94173H;c+E_R9DKKH1E,oN3ARlomH$!V=+CT.u+Ceht+EMXCEb-A&Bl7@"
Bk;?./KeqLF<GU8@rH4$ASu$iA0>K&EZf1,EbAr+Anc'mF"Rn/1a$a[F<Dqt8PUWp1,_47ART+V
@;9^k?Qa*&@<?0*-[oK7A8c@,>\@VcATD3q>\\1f>\\+aF*(u6/no'4-OgCl$;No?+C]V<AKZ&.
H=\4;Aftr!@rcJs$8`k[2'?OCF<Dqt8PUWB$4R>;67sBt@:O=r+EV1>F<G[NE+O)5@<,p%@rH7,
@;^1.+DG^9FD,5.D..-r+A,Et+Cf4rF)qct8lJ)T8PiAn@;9^k?S!<n5u^9T?X[\fA7$l185r;W
?X[\fA7$l1=A;Ir@;9^k?S!=!79EMr@;9^k?S!<d=]@gs@;9^k?S!<o5uL?D:KL:u@;9^k?S!="
<(8iS@;9^k?O[>O$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l39Q+?MBl7Q+A8,OqBl@ltEd8d<F_u(?F(96)E-)Nr
<,WmiASl@'F*)G2FCcS5FD,6++A,Et+D,1nFEMV8F!,[<+Dtb%A0>r3D.Oi6DfTB0+DG^9Dfp(C
A8,OqBl@ltEd98[+B3#c+Dtb8F<GXHAT/c.Ddd0t+=M&7@UsUuE%Yj>F"&^N$7QDk%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15dI@:UKs@:C?iBk)7!Df0!(Gp$X?D/^V=@rc:&F=n"0.1HVZ67sBpDKBr@AKYK$
EcP`$F<GO2FD)*jDe'tP3[]#fGp$p3@Us%n+DbIq-QlV91E^UH+=ANG$4R>;67sBsDdd0!A9Da.
+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVHA7TUrF"_0;DImisCbKOAA1q\9A8G[`F"_?<@UsUuE%Yj>
F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15LGD/^V=@rc:&FE8R8D]iq9F<GXHDfTD3GAhM4+ED%*ATD@"
@qB^6+<XWsAU,D8F`VXI@V$ZpASu("@<?'k/e&.:%15is/g,:UA79Rk+EqaEA0>o(An?!oDI[7!
+>"^WBQ&);Anc:,F<EF`D.Rd0@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4-RT?1%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+@g6d@UX'qEb/ioEb0,uATJ:f8l%htBOPs)Amo1`Ch\!*ATJu+DfQt1@<-C6Bl7Q+
Dfp.EF*(i4Bk&9'@;TQu@;]LiH#m\@+E)-?8g&=rEb'56@;]TuFCfN8F"Rn/%16'JAKWC6Ci<d(
.3N&:A0<:CF(KDA+Eh=:@WNZ#DII@,H=\4-DIal2FDl22+DtV)AKZ#)An?!oDI[7!/e&.:%15is
/g+S?@;L48AKYl!D.Rbt$>3pl+=C]@FCB8=%13OO:-pQU@r,RpF(o63+DtV)AKZ,:AKY])+C\c#
AKYf-@ps1b+EqaEA.8l#0d(+FDdmc1-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqUDfm14@;[31
E+EC!AKYW%Ddm-k+EqaEA0>o(An?!oDI[7!/e&.:%15is/g)hjBlbD=BOr<1DfTA2@rGmh+>"^W
FDl22F!,+3Ddm-k+ED%*ATD@"@qB]j$8<T8Ci<d(+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
.!9TBF"&5PATVs,AThX++EMXCEb/c(Eb/ioEb0,uATKI5$7QDk:-pQUB5DKq@;I',AS,LoASu!h
F!,(5EZcc@F*(i4.1HW,F(KD8-Y.:?@<<k+$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$F`V,8.3N)2@rH3q
F!,X;Ed8cOF`V,+F_i6EGA(Q*+CT)&+EqaEA9/l,@<Q3)F*)>@ARlp(AS,LoASu!hF"Rn/.1HVZ
67sBpDKBr@AKZ)5Gp$gB+EV:.+E2IF+Co1rFD5Z2@<-W&$?'Gt4$"a2Dg<IA@:EbYFs(U0@OE:&
+>Y-YA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k.!9TBF"&5A@;[3.ATW'8DBNe)DL!@FAS,LoASu!h
+Dbb5FE8R5F<GL>@q@88<+ohcF(&os+E1b2BHVA-@<,jk+Dk\"BOPdmF)<%6F!,UHARloqDfQt@
ATVs,AThd*B-;5+An?!oDI[7!/e&.:%15is/g+eCDdm-k+ED%*ATD@"@qB^(De:,9DfTB0+C\np
Bl7g&DJ()9Bln#2-Z(4?$;No?+E_a:F!,l`+CoA++=D"R%13OO:-pQUB5DKq@;I',AS,LoASu!h
F!,C5+EqaEA9/l)DIdI!B-;D4FD)dEF!hD(F`V,8+FPjb0H`.oA8Z32F!hD(%15is/g*;?4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]
FD5Z2+B3#c+E_a:F!,UCBl@ku$;YV_Bl@l31GL"jAfrLEF(KDA+ED%8F`MA@+EV:.+E_a:F"MNP
Bl@l3De:,#+EqaEA1euI<+ohcF`V,8/TkrFDf-\3F!+q#F(o,mCi"A>@3B]1BlS9,+Dbb5F<G".
C`mh5AKZ28Eb'56Df-\>BOr;r@;Ka&FE1r(+E(j7@3Bc4Eb$d3$7QDk:-pQUF`V,8+E_R9Df-\9
Afu2>D]j7BEb'5#$8XCZF`V,8+?MV3@ps1jDf9N7+EM[CEbTT+F(KGI-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@l37qHRLEaa'(DJ().Ddd0!F(96)E--.1$;+)^+Ceht+D58'ATD4$AKXSfCi<`m+EM%5BlJ08
+D,Y4D'3A'@ruF'DIIR2+D5_5F`;CS+<XWsAKYVsDImisFCeu*F(96)E--.D@<,p%GB.D>FCf>4
FDi:DBOr<*F`\a:Bk)7!Df0!(GpdYUF(96)E-*4DF^elqEb/a&DfU+U%14Nn$;No?+D58'ATD4$
AKYf-@:UL%@rc:&F:ARoCi^^HF*2A;Df9M@+<Ve%67sC%F`&jLDf9M9EbTT++EM+9%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!kD/=89@;p0sDIdf2B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CfP7Eb0-1+E_a:
E[PoNF*(i2FEMOTBkh]3Anc'm+EMHDFD,62+Ceht+C\n)Ci<`mARlotDId<tASu$iDKK]?+E(j7
8l%i-%13OO:2b5c3Zr9UF!,O6EbTK7F!+n3AKYDlA7]9oFDi9u<C0AN6XOS8+E)9C:j$5`Bk(Lb
?Q`s!EZfI;AKYK*EcP`/F<G^IATBC4$7QDk:-pQUCi<`m+D58'ATD4$ARlp)@rc:&F:ARnDdd0!
-ZaEJD/X?1-OgCl$=dL\D/X?1F!*4l0f:'r:-pQUAp%p++=Jrn+<Y*1A0>c$G9A:f.3NJGDf0V=
Bl5%K0JPEo$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMG\DImisFD5W*+EM%5BlJ08+E)-?A7]UdDIa1`8l%ht
@ps6t@;L"'+D58'ATD4$AKYE!A0>],@:UL%@rc:&FE8RKBln$,F`\a9Eb/[$Bl7Q+Ci<`m+EM%5
BlJ08/e&.:%15is/g+tK@:UKi@<6-m+EMX5FD5f<Bk)3,B6%p5E"*.jB-8R2F*(i4F!hD(%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%14LrATVs;.3NGF@:XF%@;Ka&FD,5.GAhM4F!+t$Ci!Zn+C]U=@3B2sG%GP6
GAhM4/e&.:%15is/g+tK@:UKhCht5<DfTB0+Dtb%A0>u4+EDUB+=LcAFCB8?%16`ZFE2UK-Y.:?
@<<k+$4R=O$;No?+Dbt)A0>T(FDi:1Eaia)Eaa!6+Dbt+@;KLr%15is/g)N_FCB9-Ddt.;B4Z1*
GT\AEF*(i4-OgDX67sB.3B8H0B4Z1*GT\AEF*(i4-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36=FA>Bl7Q+
F`8I3DIal1ATMs3EbTE(+Co1rFD5Z2@<-'nEt&IK:IH=>F!,"%FCAWeF(HJ+DfQsm+EqaEA90:E
F(96)E--.D@;]TuDffZ(EZf=AARfFmF`S[EEc5T2@;R-/AU&<</g)92Df^"CA79Rg@UX=h+EMgL
FCf<1+D>2,AKYi$@;^-/AoD]4@UWb^Bl7Q+F`8I3DIal1ATMs3EbTE(+Cno&@:EYdATJu&DIak^
:IH=9De3u4@<3Q8ASc08+<XWsAKWC?@:O(`.3NeFEag/#@:O(qE-!.EE$/R3A79Rg@UX=h/e&.:
%15is/g,4DG%De)+C\bhCNXS=De:,6BOr;rF`MM6DKI"?F`\a:Bk)7!Df0!(Gmt+"@:O(`+=D8L
Gpa%.%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M&@:O(`.3N,=E+rm)+EV:.+CfP7Eb0-1+Co1rFD5Z2@<-W9
Anc'mF!,RC+EV:.+C\bhCNXS=F*1r&Bl[cpFDl2F+CT.u+E2@4AncL$F!+n-C`mh5AKYT!Ch7Z1
GA2/4+CQC8DJ=*5AKYQ-ATAo-DI[]u@<6.#B-:Yl@r$4++Du==@V'R4%14Nn$;No?+Dbb5F<GOF
F<G+.@ruF'DIIR2+C\bhCNXS=Anc'mEt&IC6qL9>3Zrc1HS-E`6r60K87,_&<*s!):IK,1C*4WA
:-pQUE-67FA8-'q@ruX0Gmt*kBlY=_5tbQl6:=CC/12o"Bkh6-+<VdL+<VdL+<VdL:-pQU@UWb^
F`8I8Bl%@%%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-urm?FCZgCEb0<6DfTE1+EV:.+DbJ-F<G%$@r$4+
+C]U=F(K0!@ruF&B-:Yl@r$4++D,>(ATJu<Bln#2FD,5.BPD*mATMr9E,oN%Bm;6>$7QDk:-pQU
Eb0<6DfTD3CghC,+C\bhCNXS*$?B^!FCZLAFDlFP%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@;BRpB-:V*
F(96)E-*45F_u(,$7Kk%@r#U(+CfG'@<?(%+C]&&@<-W9@UWb^F`;CS+<Xg*FWb1&DBNA(F)N11
@:O(qE$/\*@ruF'DIIR"ATJu&F!,"9D/^V=@rc:&FE9&W+@L?hE$043EbTK7F!+n3AKZ&.DJ*cs
+A*bt@rc:&FE8RHBOQ!*@ps6t@V$[)F(Jl)FDi:2@:O(qE%E,ADfBtE@;]TuD.Ra#AKYMt@ruF'
DIIR"ATKI5$7QDk:-pQUA9Da.+CT)&+EV:.+EqaEA9/l3DBO%7AKYr#FD)e*F!+m6F(oN)Ch4`"
F_u(?F(96)E-*]A$?U33A9Da.4ZX^,BQ&*6@<6Ks@;9^k?Qa2oCLnV9-OgCl$;No?+?_kN4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\
Bl@ku$<LnPDBO.7+Dbt)A0<:BDg>l9D/^pHBl8$2+CQC1ATo8-Bk)7!Df0!(Gp%$7F(KB8AKYZ)
G9D!@AKYr#FD)e2F!+t+@;]^hA1f!(BOr;sBk)7!Df0!(Bk;?.BOQ'q+C\nnDBNe-EbAro/e&.:
%15is/g,%CG9CF1@ruF'DIIR2%16uaG@VgDE,8s.E+No7+BosE+E(d5-RT?1%15is/g,(OASqqa
De't<E,8s.E+No7%13OO:-pQUCi<`m+=M>MH";&7E%)5'0HiJ2+?Uc.HTE9kDg>l9D/]pk%15is
/g+\=@ruF'DIIR2+DG_*DfT]'FD5Z2%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[eBl7?q+EqaE
A9/1e=`8F*DJs_ABOQ'q+EMI<AKY\tARQ^"Afu;2@<<Va:IH=>F!+n-C`m.qDfp.S+B38%Ch7$q
DBNe7Eb-A6ART*l8l%i&F!,"3@s)X"DKK</Bl@l3@;]TuEcl7BFD,5.DffZ(EZdtM6m-;S@WO.E
8S0)jDfm19@<Q3)@;^?5E,ol+Ch7I)/0JqTATMs-Df0V=DfQt1Df'H0@;0V$F!,F<ARTXk+D#Cu
Bl"o/AKYE'+C\bpATDNr3B9?;D..-p/n8g:%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1
@rH2n$;FrL@qZu?0JPNr$7QDk:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$8WfCA0<6I
%13OOC2[X%Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'HDe<^"AM+E!
:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/Bl%?'F(96)E-*]T;dji\+EV:2F!,O6EbTK7+DG^&
$;No?%15is/g,UOA7TUrF"_0;DImisCbKOAA1nB!:-pQB$;No?+EqOABHVD1AKYl!D.Oi)De*g-
De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)+CT)&+Co1r
FD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBiAS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)+E_a:A0<":
D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et%15is/g,@VEbfB,B-:c'G%ku8DJ`s&F=n"0:-pQB
$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8AKW*f:IH=I
@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@Df0,/FCB6++DGm>@:OCnG%Ddo78lWS9gpFN+E2@4
G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9E+No0+Dk\2F(&]mF!,R<@<<W(Eb065ASuU+Gp%-=
F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:+D#e3FD5W*
+A+6q$;No?%15is/g*o-FCcS:D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@
Ch[cu+<YT7+A*b!FD,4p$;No?+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lr
FD5W*.3KaWDfol,+<Y-)+<Yi=Ed8*$:-pQUF`V,+F_iZ>$;No?%15is/g+SFFD,T53Zq%5BPnq\
/g*JhCLqMq$;No?+D#CuBl#gQ+C\bpATDNr3B9?;D..-p/n8g:%13OO:-pQUF(KG9GA(]4AKZ&5
@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4%15is/g,"FDJ<s1D'3e<Bl8#8E,oN"Ble!,
DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+A79+^.1HVE+Z_>4+BosJ%13OO:-pQUF(KG9
C2n><GA1r*Dg-7F@rH7+Deru-F(or3+>"^EF`_P=@<?3n+D,P4+Dbb0Fa,QV@:Ls)DfZ?p6[*3N
C0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#
+E)./+A,Et+DG_7FCB&sAISuWE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<fl
Ch4_@+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHO
BkhQs-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28
Ebce>ATMr@%15is/g+4d78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs.3N2BEc5tO+Dk\2F(&]m
+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq?YO7nA7$c.DJsV>F(KG@
%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs?R[+8Dfd+CATT:/$;X;d
8l%i/0KhH>+=D&F+DkP/@q]Fp-OgCl$;No?+CSek+Co&"ATVK+DdmHm@ruc7Ao_g,+CfP7Eb0-1
+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4
D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj+D#G$/e&.:%16Nb4ZX]A
+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSekB6%r6Gp$[7F(HsHC1Lmr
EaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.
+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JFV\DIb@/$7QDkA90mp
+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGWASc""E$0EKAScF!/g+n>
ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,LoASu!hA0?)7Eb'56DJsV>
Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>
ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9
De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p+D5R$$7QDk+<Vd9$;No?
+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A+?CW!%16f]/g)_uG@c#+
@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3
A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$@*b:F(JlkGp%Mf+D5R$
$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'+Dbt)A0>r'EbTK7%17/h
4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq+D#A1AM,*?A7]e%?X[\f
A7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'DIIR2.3NhQEb'5B+D5_5
F`;CEBl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i4ZX]@-?<[@D[d$_$;No?+EDUB+EV%7
FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*
+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SF
F:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.CiCM/DfQt5Ec6)>+EqaEA9/1eBP0Ih+BplLBP_X*
C`lqC+FPjbB6%r#$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"
EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U+D5_5
F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38@:XCg
?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?%16f]
/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c
+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuu
DJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>
F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*B6%p5E$048DfTqBFCf]=%15is
/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A
+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8
DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35
/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]/g)i2,BH"#+A"1.-nIE).3L,n0-W,9
74o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$?IP@+=8^)+Ckog.1HUn$;No?
+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`AAU#=FGAhM4-QjNS+<VdL+<XEG/g,@V
Eb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt@:O=r%15is/g)8k+EM@1GT\AUBPDO0
ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TDCh7i6Gmt*A%16f]/g+V3A7KF_@;9^k
?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%
FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2@rcL/
F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+Ds=p+ED%:D]gDT+CoCC
+Dr<BATW'8DD!&CDIb@/$7KdC/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'nDETV#/oD+*.1HUn
$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D
-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@
CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%13OO
:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//F)sK*
>p*>o0d/S5-8H#;%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9E+*g/
+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-4?tMI
1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\3\qp?
1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n+Z_A$
?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!Ch7Z1
/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)ART+k
A26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A4Wo)4
.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn$;No?
+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*+Dbt6
B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"
INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<-7CDh
0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT/g<"m
><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDfZ?pFEBZ,
>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%
67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0%16rs4ZZjk4!6:6,$uHS
+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-
EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=
/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&
DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq
$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZR
F`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D
%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#
F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQUA9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>
+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[
%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2
@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk
5uL<C8OHE>3ZpLF-RT?1%15is/g*b^6m-YaEaj)4FEqh>@ps1iGp%-MDBNP3Df$V=BOr;q@<6!&
Ci<flCh4^u$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+D#e+D/a<&F!,C5+A,Et+EM+8F(oQ1+EMX5
Ec`FHE-!-R+EM47GB43#:-pQUBQ&);FDi:?E+No0A8,OqBl@ltEbT*++CT.u+DG_:Deio,E,ol3
ARfg)D.-ppDfZ?p%15is/g,4HF<G^F+CfP7Eb0-1+E2@>C1Ums+=JreF*2G@Eb0<5+A#?[+>=pV
EZeq0Bk1dc+Co2-E,8s..1HVZ67sB8+ED<A-ZF*@F)?&4BOPCdBl7Q2+Bot0D/XQ=E-67FDe'tP
3[\ucF_>5rFs(jCF_;h>FD5Q4-QlV91E^UH+=ANG$;No?+>G!ZD'13FEb]H&E$lc4+E(d5-Z*F6
-QlV91E^UH+=ANG$4R>WDe+!3ATD:!DJ!Tq@UX%-0ht%f.V`m4F`V,7@rH6sBkLm`CER[M/KeVL
@;Tt"AKXT@6m-VnATAo'Df00$B6A6'FD5Z2+EM%5BlJ/H%15is/e&._67sB[BPDN1+EM%5BlJ/:
BlbC>AU%crF`_2*+C\noDfTD38l%htDdmHm@ruc7+CT;%+CfG'@<?'k/g*`-%15is/g+Y4DBND"
+E_a:A0>u4+ED%(AS,XoAKYE!A0>B)F*)>;BmO>5G%#E*Dfp+D@r,RpF!,@=F`)7Q+B37g$;No?
+DkP&AKW+;BPDN1F(96)E-*3F@:OCnG%Dd=Eb0,sD.Oi(F<G[D+DPh*F`V,7@rH6sBkK&4C3(M+
DIa1`:-pQU@rH=3+DGpK+EqOABHVS=F`JU9A8-.,/0K%Q+EV:.+DkP$DBN\4A0>DsEb/a&DfU+a
%15is/e&._67sC0@:WneDKB&qASu("@;K1`De':a:-pQB$;No?+B3#c+Du+?DK?q:BleB-A0>>m
Ci=M?@<,p%B5_^!+CehtA8,R_FCfM9AoD]4Eb/cmAnc-sFD5Z2/e&-s$;No?+EMC<F`_SFF<DrG
De+!3ATD:!DJ!Tq/no'A+D#e/@s)m-DJ((E/hSL\$4R>;67sBW6q/;>ART+\EZf(6+DPh*F`_>6
+Cf4rF)rHU+CfP7Eb0-1+EM+9FD5W*+DGm>FD,5.A7]@]F_l.BA8-'q@ruX0Gmt*U67sBmDfQtB
BOr;fBl7I"GB4mMATDj+Df-\9AfsBMDdm9#;Is9IATBCG;Iso\F<G16EZf:BBOu3,:ddbqEb/Zi
ATDi$$;No?+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX3a>L%DeF*!D'2;^Ch7Z1.!R^0.9o/LDdm9_
6"=qR@UX@$;Is9IATAn]6X3N#@:Wqi>X;k?Dc1+%1+m-_AL@oo%15is/g,1GF(KG98ge[&:ddbq
Eb/ZiATAo8D]in*FCSu,8l%i&F!+:I7Nc__@:Wqi+>"^HD]iY1EZccF@rH7+Deru;AU%c8%15is
/g*tY7T*f+A7]dgC0s+b+AbHq;FNl>78dK$C2[X*FD5Pu%13OO:-pQU@;L$sEc,<-Bm+&17qcg^
FE:r4BlJ/:@rH4'@<?3mCh4`0ART+\EX`@N67sBW6q1'C5t".>?X[\fA9E!.CgT=d-UTq":i^Je
Ea`f-7VQ[MF'M4KDf^#5F_tArF*;8/G?ed%G%kN31GURoG\&63$4R>;67sBWEb/ioEcP`%+EqC+
+C]A0GB7>9+DG^9C2[X*FD5P6@r,RpF!*%WA7]@]F_l.B=(uP_Dg-7F7VQmS7W3MoA8-'q@ruX0
Gmt*U67sB^='%(_@;9^kF`_>6?TgFt6TSIKEc5T2@;R,VBl%@%>YT-_Bl%To+@^'cAS,k*>\7\j
AS,k*/nK9=-OgCl$;No?+B)i]Df0)oEd8dOARZckEc6/CATAo-DBN\4A9E!.C`m5(@<6K4/KeS8
AmoguF<FY!DId[0F!,"-Eb/a&DfU+4$;No?+BMWG0je@(De+!4Bl%->3[[9U>YoHZB6%Et+@^']
ATM*JDKKH1DImo47<icfDfTE0>Y.@d:eXY_74q#274/NO%15is/g+,)G]Y'>A8-.(EZfIB+E_a:
+EqL1DBNtBDJj0+B-9fB6m-2]+=Lu7Df0W7Ch551G\&<HDf-\!Bl7I"GB4mJH#n(=D0$-n:-pQU
;,f2@85gX@Df00$B6A6'FD5Z2F!+n3AKYl/F<GI4@qB_&@<-'uGp$O7E,96"A0>K&EZccF@rH7+
Deru9AU%c8%15Nl6VgHU:J=2a@;9^kF`_>6?TgFt,""Cr:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.
E+*9-.pQt1FCfE"A1K/_AU%c1-OgE"@;BF@@<6-m8l%iSATMs71,2Nj/h1^HCLoh@F(o,V:IJ/n
F*)IGF"JsdD..3k+A,Et+C\c#Bk&9-ATMr9F(96)E-*]A$;No?%15is/g+,,BlbD<@rc:&F<G4-
DImisFCfM9@3BW$EbTK7+<YT7+ECn.A8c=$Gp%$GA7]dmA0=K?6m,rIF(o+n$;No?+EV19FE9&W
<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqV[:-pQU
-t6V+ALSa<De!3lAKZ22FD)dh+=Joe3\i-,DfQsK0HiJ5.3N_DF*&O:DfTE'B5VcC%15is/e&._
67sB[BOr;/F(or3+<VeFAfr3=FD,5.+D58'ATD4$ARlo+F(96)E-*3F+DGm>+<Y04DKKo;Ci!Zn
+<Y-=%15is/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYb
AU%]rARoj)FD,4p$;No?+Du==@V'R&De:,6ATMs7+DG^9FD,5.-u*[2@UX=l@ru:'FE8lRF*22=
AM+E!:-pQB$;No?+CT>4F_t]23XlEk67sB'+:SZQ67sB'+>G;f5p0ZUDJ!TqF`M&(+A*beBl[cp
FDl2F+FZpY6rZTR<"01067r]S:-pQUG%G]'@<?4#3ZrN_+E_a:+CoCO%15is/e&._67sB'+AP6U
+D58'ATD4$AKZ&(EbTK7%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX
67sB'+ED<A-Z*:-AO9gHBk'b26r[`=FE8f=$;No?+:SZQ67sB'+AP6U+EDUB+DGp,$;No?+<VdT
0HiJ4.3L`fE+*j%+=DV1:IJ/N;cGD:@<6-m8l%iSATMs7/no'A-OgDX67r]S:-pQU@<H[*DfRl]
+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/78M0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4
-XpM*AL@ooCi<`m+=CoBA9;C(FCfJ?%16r\CLpF]DeioV:IJ/nF*)IY0ht%f.W&U0AQ*GaCLp+6
6r[`=FE8RG/M/)^@;BEs8l%htF)>i2AKZ)+F*&OG@rc:&F=mnq67rU?67sB[BPDN1F(96)E-*48
ASu("@<?(%+CQC6@rc:&F<D]EAfu,&DId[&Cj@.AEb&a%ARloU:IH=HD/X3$$;No?+EV19FE9&W
<+ohcB4YslEaa'$A0<"9@rc:&F<D]9@;[21@V$Z)Ecl7N+<Y`I@<-I(DJ()+DBL'DBOqNG67sB/
@UX=h.3NGF@ps1b+EqOABHTni-nlf*1+=>aEZcba+Z_D.+EV19F<G16Eb/rtDK@E;:-pQ?:-pQU
<+ohc+EM7CAKW*<De:+7+EV:.+<Y<.DImisFCeu*+EM%5BlJ/:+<YB>+<Ve:Df0Z;Des6$A0<"(
Gm[;5/g)QA78m/Q:K:.h.4u_c<+U,mF!+n3AKW+9AT23hFCeu*BkAJ1-r`W6<'sG]:/iYbAU%]r
ARoj)FD,4m:-pQUDKTf*ATAo3Afu2,F*)IGBl5&8BOr;7C2[X(D/X3$FCfN8F"&5QF_Pr//db??
/db??/g+SDF*2>2F#jY'67rU?67sC(ATD6gFD5SQ$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMn:-pQU@rc-hFCeuD+>PW*2/78M0KBJ867sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IDhpDe!p1Eb0-1+=CW,F(H^+Ci<`m+=CoB
A9;C(FCfJ?$>j3hBkCptFD>`)1,2Nj/g,">DJ<]oF*&O:DfQsm:IGX!6U=OJ8P`)E3[[Nq6m,)E
:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*<P1FEV=:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63C2[W8
Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u$>=-pFDl2F/p)>[
%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0C3'gkC2[Wl@;@N2
De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[WnDdtG;@:O1nFCfMG
FEhm:$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo
05>E9A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKi
Cggdo05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[\Z#
0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!03C,dn)+DNki2BZ`o0K1?g$:I<Z78?6L4ZX]>+?CW!
%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums+@KpRFD5Z2
@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%htF*2G@DfTr@
+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5EZeh6Bl%<o
DJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7+?(o,GV;$/0R+^4:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<%15pPBlA#7G%G]8Bl@m1+E(j78g%tZCLnV:
C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/%15[=+F.mJ+DG_7FCB!%+A,Et
+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:Wne
DBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTu
FD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*Bj
F!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.
:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>
F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8
FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*
DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#
+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj
/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-)
;H$._:-CW\-SR/5/ibpI-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr
9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8X.1HV^
78--9;aii1+=Cn^0JO\b2D?m/C,[h$+DNki0d(3j0JXbc3&!-2C,dn(+DNki2(&h?6q($A;Fs\a
8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2
+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'
B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"B
Dfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.
De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]
Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibpJ-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<
+Cno$GA1qB%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9B
Et&IkDe*BiFtRKDEt&IkDe(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%
9LV6G76N[ZC,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jjne3&!3;%15Kl:dn,I;a!/a
0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,
@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>
/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$
A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c
:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.D
FD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB
/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG
@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7+?(o,GV;$/0R+^4:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+Ad)mDfQs0$?g!$F(oQ1F!,C5+A*bn@;BEs
-u*@.Ch7Z:+CTG%Bl%3eCh4`$Ec5e;F*VhKASiQ2@rc:&FE9&D$4R>7:IH=HDfp)1AKYMt@ruF'
DIIR"ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe
$6UH6IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1
BlbD=BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-
AKYD(D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'
6Z6LH+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h
@<?'nDfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!
DKU"CF`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@ID
ASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y
:IH=%@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%I
BOrc1De(G=@:s.)%14Nn$3                                                    ~>
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
zz=:zz,'DVMD JSCRIPT JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS'
zz=:zz,' MAXEXPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK0'
zz=:zz,'05 OK006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHS'
zz=:zz,'HOWDEL PATOPS PUTBLACK REFERENCE SUITE SYMBOLLIM TAB TEST TEXT UNIO'
zz=:zz,'N UTF8 WORD XML afterstr alltrim badappend badblia badbu badcl badf'
zz=:zz,'l badil badjr badlocn badobj badrc badreps badsts badunique befores'
zz=:zz,'tr bget bnl boxopen catrefs cd changestr checknames checknttab chec'
zz=:zz,'knttab2 checknttab3 createjod createmast ctl datefrnum dblquote dec'
zz=:zz,'omm defzface del destroyjod did didnum dnl dpset dptable empdnl fex'
zz=:zz,' firstone fod fopix gdeps get globals globs grp gsmakeq guids guids'
zz=:zz,'x host hostsep isempty islocref jappend jcr jcreate jderr jdmasterr'
zz=:zz,' jnfrblcl jodsystempath jpathsep jread jreplace justdrv justpath jv'
zz=:zz,'n lfcrtrim locsfx make makedir markmast mubmark nc newd nlargs now '
zz=:zz,'nowfd obidfile od ok packd plt put quote read readnoun readobid reg'
zz=:zz,'d remast restd rv saveobid second tc trimnl tslash2 tstamp uses val'
zz=:zz,'date wex wrep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPT'
zz=:zz,'RS DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ER'
zz=:zz,'R200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209'
zz=:zz,' ERR210 ERR211 ERR212 HEADNMS OK200 OK201 REFCN REFIX REFTS TEMPFX '
zz=:zz,'backnum copydirinv copyfile copyfiles createdl dbakf dfclose dfopen'
zz=:zz,' dfp dncn dnix dnnc dnnm dnrn dropall dropbakdir dropdir dropinv dr'
zz=:zz,'opnc dropref gettstamps justdrvpath libstatus loadbakdir loaddir lo'
zz=:zz,'adnc loadref loadstamps maxback movefile nummask packdict packspace'
zz=:zz,' puttstamps renamefiles restdict restspace savedir saveref tmpdatfi'
zz=:zz,'le tmpusesfile volfree''),(<<;._1 '' jodmake DUMPMSG0 DUMPMSG1 DUMPMS'
zz=:zz,'G2 DUMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR015'
zz=:zz,'4 ERR0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX'
zz=:zz,'0 EXPPFX1 GLOBCATS HEADEND JARGS OK0150 OK0151 PORTCHARS SOCLEAR SO'
zz=:zz,'GRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clf'
zz=:zz,'rbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntst'
zz=:zz,'amps dumptext dumptm dumptrailer dumpwords extscopes fap fmtdumptex'
zz=:zz,'t fromascii85 getallts getascii85 halfbits htclip jnb jscript jscri'
zz=:zz,'ptdefs makedump makegs masknb namecats nlfrrle nounlrep opaqnames p'
zz=:zz,'arsecode putallts rlefrnl sexpin sonl tabit toascii85 uqtsingle wra'
zz=:zz,'plinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore CNCLASS CNC'
zz=:zz,'OMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CNPARMS CNPU'
zz=:zz,'TDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 ERR053 ERR0'
zz=:zz,'54 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR062 ERR063 E'
zz=:zz,'RR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ERR072 ERR07'
zz=:zz,'3 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082 ERR083 ER'
zz=:zz,'R084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR092 ERR093'
zz=:zz,' ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 ERR102 ERR'
zz=:zz,'103 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK0'
zz=:zz,'50 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK06'
zz=:zz,'2 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpf'
zz=:zz,'x allnlsfx apptable appwords badcn bnlsearch bnums checkntstamp che'
zz=:zz,'ckopen checkpath checkput closedict createst defwords delstuff delw'
zz=:zz,'ordrefs didstats dnlsearch freedisk freedisklinux freediskmac freed'
zz=:zz,'iskwin fullmonty getdicdoc getdocument getexplain getgstext getntst'
zz=:zz,'amp getobjects getrefs gslistnl inputdict invappend invdelete invfe'
zz=:zz,'tch invreplace islib iswriteable iswriteablelinux iswriteablewin jd'
zz=:zz,'atcreate jwordscreate loadalldirs loadallrefs loadwords mainddir ne'
zz=:zz,'wdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx ope'
zz=:zz,'ndict pathnl pathref putdicdoc putexplain putgs putntstamp puttable'
zz=:zz,' puttexts putwords putwordxrs rpdtrim rplctable rplcwords sortdnub'''
zz=:zz,'),(<<;._1 '' jodtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ER'
zz=:zz,'R00402 ERR00403 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPS'
zz=:zz,'UITES IzJODtools JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK0'
zz=:zz,'0401 OK00402 OK00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB '
zz=:zz,'WARNING00400 WORDTESTS addgrp addloadscript addloadscript1 allnames'
zz=:zz,' allrefs betweenidx createjodtools dayage delgrp firstcomment first'
zz=:zz,'period fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obn'
zz=:zz,'ames onlycomments pr refnames revonex today todayno updatepublic us'
zz=:zz,'edby yyyymondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMAR'
zz=:zz,'K CWSONLY DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 E'
zz=:zz,'RR0252 ERR0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJO'
zz=:zz,'Dutinterface MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK02'
zz=:zz,'50 OK0251 OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDS'
zz=:zz,'MARK SCRIPTDOCCHAR VERBATIMMARK blkaft changetok compclut compj com'
zz=:zz,'pressj createut ctit de dewhitejcr dewhitejscript disp doc docct2 d'
zz=:zz,'ocfmt2 doctext docword ed et exobrefs gt jodfork jodhelp ljust obte'
zz=:zz,'xt pdfreader qt reb revo rm rtt textform2''                         '
zz=:6005{.zz
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
