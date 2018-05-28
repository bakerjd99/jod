NB. JOD dictionary dump: 27 May 2018 18:37:22
NB. Generated with JOD version; 0.9.994; 10; 27 May 2018 18:24:35
NB. J version: j807/j64/windows/beta-e/commercial/www.jsoftware.com/2018-05-25T12:07:57
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

JODTOOLSVMD=:'0.9.994';11;'27 May 2018 18:37:22'

JODVMD=:'0.9.994';11;'27 May 2018 18:37:21'

MACROTYPE=:21+i.8

MIXEDOVER=:'(<:)=:'

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
1,q$32)6:0+?1K"2BY"&2Du[9+>Pku0f1"21E\G.+>Pku0ea_+1E\D1+>P_q0eje,1E\Ru1,L+6
+?))!3?U(;+?:Q#0d&J!2)ud>+>Ykt0ea_+1*ACr1bg+/+>kns3?U7=+>Ghu1c?I31E\P4+>GSn
1c$77+>tqs3?U+4+>k8t1*ALu1,0n/+>Pes0ea_-0H`+n1,C%.+?:Q!0H`2-+>k9!1E\Fq1,C%-
0H`20+?(E"1*AIt2DlU9+>khq0ea_+0d&J!1bp10+>Gbs3$:";+?1K%1*AIt1G^./+>Pr"3$:"8
+>GPm1,L+/+>PVn1E\D4+>GVo1Gg4/2'=_8+>PYo1G^..2]sq5+>PVn1H7d&9i+P_7l3g\G%G]8
Bl@l3FD,*)+CfG'@<?'k+EV:2F!,"9D/a*$Ch6%'6VgHU:J=3!AU&;>ARoLsDfQtBD]j1DAKZ21
ASrW2F`))2DJ((a:IH=>DBN\(Df0W7Ch4`-DBN"pDId[0F!,OLF*(u1F%A_c6q(!dEc6)>+CT.u
+EM[>FCcS.ART+\EZek1A7\>Y8l%ihDKKH1Amo1\@rHC!+A,Et+DG_8ATDBk@q?c7+Dbt)A7]9o
Bl8$2+=Lr=De(:>/Kf+GF<DuQATV[*A8,q'ATDBk@q@)\H:gt$Bl8$(Eb8`iAQ)Po:..BG7!!HY
DId0rA0>B#Eb-@c:IH=>DKKH1Amo1\8U=!)7!*?cCi`3E6rZrX9N*&^BkhQs.3N>BFCfK)@:Njk
GAhM4F!)SsH:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td6qU6C
<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk$49C$6rm#MG%G]8Bl@l?+DkP&AKYE!A0>DkFCbdd
9gM-E:K1In7;ZICEc3(BAU&;>FEqh:F"AGEAT23uA90dS8lJ)T8PiA;9L2WH==d!B9h[*?9h[*;
79EM?6<R8V/58E.912QW:+TCE7Q=+6=@GVR<^fo'Bm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)
:I7NN;aWiM7;lXIF`V&$FCcS2De!3l+DG@tDKKT)Bk;=++EV%):I7NN;aWoI<,Q,]AKYo#Ap&0)
@<?4%DBNb0D/")7/Ke_@B4tjs+Eh10F_,V:Ch7[/+Dbb-AScW7FDi:3CghBu:I7NN;aXAN=DqY\
F`V&$FD5Z2+Dbt+@;I'#A7]Y#BkD'jEZf=AAS,Y$<(0_b=[>bV78e5=F*&OAATMp$B4W3,GA2//
BHSlL0d(CP+>=pVAnGLbATVs(FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9@UWb^F`;D2
DJX-'F*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj@r$4++D,>(ATM<uCia/r
Eard(ARTUhBOu6-E-67FA8,OqBl@ltEd8d:@:O(qE$0%,D.Oi+BleB;+D,P4+EM76E,9).@q]:k
@:OCjEZf14F*&OD@<?U&Ec,r-F_PZ&C2[WmDf'H6ATMp(A7B[qCh.T0@3B0)Ci"A>@rH4'Eb0<5
ARloU:IH=ADdd0!FCfN8+EM%5BlJ0'F_PZ&C2[X)Df9H5@rH4'Eb0<5ARo7mBl%=$+Cf>,E,oN2
F(Jl)G%G]8Bl@l3De:,6BOr;Y:IH=IDf9H5+Cf4rF)rIF@rc:&FCSuq@r#t(FCAW7@q]F`CNCV,
Cht59BQ@Zq+=M,9D.P8&@r,RpF'U>=AU&;G+EV%$Ch7ZtDf'H6ATMp-Eb0*+G%G_;@;Ka&GA(]4
AKZ&5@:NjkAo_g,+A*c#DfTB0+CT.u+EM47Ecbl1F!,:;@ps0rDIIBnF(96%@<?'qDe*Bm@ruF'
DIIR2+E(_(ARfg)@rc-hFD5Z2+Eh=:@UrqVCM%1$Ci"A>EHP]+BkD'jA0>>i@r$4++D,>(AKYr#
FD,2s@r-()ARfOpF(HJ)Bk)7!Df0!(Gp$^5Ch7-rF(KH7ATT&*Bk)7!Df0!(Gp%'7Ea`frFCfK6
A9Da.BOtU_ATD:$ART[lF!,R<AKYN+D/a*$Ch4_tDIal6EbTW,F!,.-@:Wqi+DG_*DfT]'FD5Z2
ARo@_BlkJ.Bk)7!Df0!(Gp%$7C1UmsF(KH)A8--.FCf]=B4Z1&FE;P4D/a-!F<GI0D.P7@@rc-h
FD5Z2+CT.u+DbJ-F<GOFF<G[>D.Rd1@;Tt)C2[X$DKL#ADBMPI6m-Dc+ED%7F_l.BBlbCO+DGF1
F*1u&ATMp)F_i1/DIakD+E)@8ATE!/F(K0#D..3k+CT.u+Dbt)A0=K?6m-,_Dfp#8Ddd0c@;BCf
EboZ&A9/l'Df'H0ATVK+Eb065ATMs)A0>>i@r$4++Co2,ARfh#Ed8cUGq!QJ@:Wn_EboZ&A9/l8
BOr;rDf'H0ATVK+Eb065ATMs)A0>DsEb/a&DfU+G.![7XDdd0o@r-'lA0>buD.Oi"CghC++D,P4
+=MLa+AuclF_l.BBlbCN+D,P4+EM[8@qB_&+CT.u+>G!NDfQt4@;0P#Eb0'*@:XCiAo)BoA9/l;
DfTA2@;]TuFCfN8+ED%*ATD@"@q?d!BleB;+D,Y4D'3tBATJu+Bl%?sDdd0tFCB$*F)5c'A9/l(
Bl[cpFDl2F+EV=7AKZ&9@;Tt)+=MLaCi<`mGAhM4F)5c'A9/l(Bk)7!Df0!(Gp%<LEb'56Bl8$2
+EV%4B4Z0-Ci<flCh7[)CiaH%CLnW)Ddd0!F(96)E-,u+D.R3cFE;#<FE1f"FE8R5DIal"CghC+
BkD'jF!,@/D.Rc2Bl5%c+Cf>#ASuF/DJX?)E+<g(G%G]9F!,@=F`)7CF*)>@ARlolF!+q+DIIR2
+EVNECh[cu@<*K4AU&;>Eb031ATMF#FCB9*Df0W7@WZ1+FCB63ASkmmATJu&DIal1ATW'8DK?q=
@VTIaF<G[:G][k7DfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nF)Z8D@;Kb%F)Z8DF!+n-C`mh6
D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.<9!9ARTXkC2[WpBl7?q+A,Et+ED%4Ch7$rAKZ&9AT2^2
D/sc:F!+'tD.-ppD]j+2EbTK7F)lAEEcl8@+A*buATMr9F(96)E--/BATVC(Bl%<jBl\99ATVu9
E+*j%F!,UHARlomGp#^T6m,r]Bl%<&GAhM4F*(u7FCf?5Bl\-0D.RU,F(KH7+E_WGFD,5.-u!F7
A18X;De!3lAKYT'EZfCFDJj0+B-;;-F*&O7@<6"$F`:l"FCf3*A7TCqFE2))F`_>9DKTo/@<?(%
+D,>(ATJu.DBMPI6m-#SF*)G:@Wcd,Df0]:A79RkC2[X"@;]dkATMs7ATT%e:IH=6A7TUrF!,=.
DJ<]oF*)IGFDi:3F`MM6DKI"EATDj+Df0]:A79RkC2[X(Dfp)1ARoq#E-$/@A79Rk+D,>(ATJu.
DBMPI6rQl];F<kqA8-+,EbT!*FD5Z2                                            ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fV!41,C%.+>GPm1,1XA+>GPm0ekUH0H`)*+>PZ,3?U%3+>Pr83?U(4+>Z#70d&2*+>Gi01*A>.
+>GT10d&2)+>GW*3?U%1+>Pf/1*A;,+>G]31a"e$0fM*J+>GYp0ebCC+>Gl!1,1dI+>G_r0ebF?
+>GPm3&`f>0f'q21GU(-1a"M00eje*1a"M12)HF12'=V/2DZI20d&502DlU41a"P01H$@11*A;1
1cHO:+?25<@W$!K@<6-m0JQ<h/h1=JCdMQOBk&hO+ET1e+C\c#Bk&86@W$!2+C\bhCNXS=DIIBn
+Dbb5F<G[:F*)IU%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8C2[W:0e"5S
@:O(qE-!.<Ddd0fA0?)1FD)e.DJsZ1BHVM;Eb'56FDi:=@<?!m+DtV)ATKI5$;No?+<VdL+<W(S
ATMs.De(OV.3N>G+Dbt)A7]9o@X0)<BOr<.ATMrS+EDRG+=CuD@:XIkF*')i0k>!.FD5Z2@<-W@
%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F;A7]7+0F\@a
67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB83,N)L1,L+rE+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,
@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn
@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m
3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4
HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#_c%13OO:-pQUFD,6+AKYi4F*&O6AKYE!
+E)41DBNJ(@ruF'DIIR2%16uaEZeh/C`k)Q%16uaEZeh/C`k)X-OgE#ATAo&DJUFCEb/]40f16e
$4R>REZf:2+EV..@rr.e:-pQUGAhM4F!,(8Df$V6Df^"C@s)g4ASuT4@UWb^F`7csATAo&DJUFC
-OgCl$;No?+EV19FE8R:Ec5e;D/XK;+CfP7Eb0-1+C\bhCNXS*$>"6#0d'qCC`k)Q%13OO:-pQU
ATT&)ATVL(@1<QTEZd+[@W$!)-RT?1ATAnL+C]5)+=ANG$>"6#1a$7FC`k)Q%13OO:-pQU@W$!)
9i"\e9N`KTBl\64EcW@6DJUG-DfQtBBOr<'Df^"C@s)g4ASuT4@UWb^F`8HT+D#e-AT2`#$;No?
+C]5)+E).6Gp%0>@<,jkATJu&+EM77B5D-%E-67FA8,OqBl@ltEd8d:@:O(qE$079ATD?)BlbD7
D]j"-FD)*j:-pQUBOu'kAKZ).ATD?)@<,p%DJpY:@<?0*DfTB"EZfC6F*2;@F!,:5CLoOL+>=pF
0d("EC`k)Q%16Ze+>b2s+C]5)+=CMa:K/\a+AP6U+DkOsEc6"AASu$mDJ()9Bln#2-XT8;<$rf&
DBNG3EcP`/F<G%$@r$4+%16Ze+>P&p+C]5)+=D)<-QjNS+AP6U+D5_5F`;CE@rH7,@;0UnDJ()5
F^fE6EbTE(+=D)<-Qm,@+CfP7Eb0-1+C\bhCNXS*$4R>REZd%Y0d&.m@W$!)-RU#Z+<XEG/g+S=
C`mV6F`)7CBl5&'F`MM6DKI"1@:O(qE"*.cEZd%Y0d&1n@W$!)-RU#Z+<XEG/g+S=C`m.sG%G]'
F!,17+CfP7Eb0-1+C\bhCNXS*$4R=O$;No?+EqaEA9/l*Ec5e;E+*d/Bk):%@<*K"@:O(qE,uHq
:-pQU@VfOj+E(j7@UWb^F`8I@F_tT!EZen2FE8uUAS4%H4?G/M+=Acs1G1C@/ho7:0f:R<1bLL=
/ho+60Jk-d$;No?+D,P4D..O.ARlp)D]iJ)E+iZ&F)Q)@F!,=.FCSu,DKTf-EbT#+F)Q)@Et&If
EZeh/F_u1_3ZqmLC`k)X-OgDlCHX^$4u%CnDKTf;4ZX^6/g+V@F_u1/$4R>REZeh/C`m2&+<VdL
+<VdL+<VdL+<XEG/g)9GDJUFC/ho:4+<VdL+AP6U+DkP/@q]Fp+CT)&+EqaEA9/l-DBNS+G%GP6
@UWb^F`7csATAo&DJUFCEb/]-/7NB;+<VdL+<Ve%67sB'@W$!)-ZWd-/ho:4+<XEG/g,">FCSuq
F!+n-C`mq?Eb'56F*(i2FD5W*+EqOABHS[CAR[#0Bl5&+Bm+'*+C\bhCNXS*$>"6#0H`.o@W$!)
-Y7NM/7NB;+<VdL:-pQU+>=oo+C]5)+=C`F/ho:4+<XEG/g,@VEb'56ASu$mDJ()9Bln#2-Y7NM
+DG^9B5)O#DBNCs@r$4+%16Ze+>Fup+C]5)+=C`F-S/_B+<VdL+AP6U+<WB]1E^.EC`k*:GV1^0
-QjO,67sC&ATMs7+D#G$Bl7Q+GA2/4+=C`F-Qm,@+D5D3ASrW"@:O(qE"*.cEZd+[1*C%DC`k*D
A1&p;CEO`B+<XEG/g)8l+>P'KDJUFCDe(IT2^]^j:-pQUB6%p5E-!.3Df0Z*Bl7X&B-;8<@WQX3
Bl7Q+-Z<NC+DG^9B5)O#DBNCs@r$4+%13OOATAnI+>Fun+C]5)+=BK'/7NB;+<Ve%67sBhCht5&
A9MO)@WNZ5FCB33Bl7Q+GA2/4+=BK'+DG^9B5)O#DBNCs@r$4+%13OO%15is/g)`m<(0_b+B)9-
6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6"48DBk'.`3F?65Cf>1hCLo1R:-pQ_@W$!\D/X3$0JFVk/M/(n@W$!2+CT;'F_t]-F<GXADeio,
FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi$;No?+<Vd].3L$\ATMs.De(ON+Co1rFD5Z2
@<-W9%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OL%15is
/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f<]gCbmdT$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>
Ci<`m;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"m
Ci<`m;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr
-RU8h-7hD1/1)_l-RU?.-mO0`4utqW4XMO(-RU>l%13OO:-pQUB4YslEaa'$+CT)&+E27?F(o*"
AKZ/)Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$4R>;67sC%@q]jF3ZpUIBeCMa+<XEG/g,4H
@<,jk+E;O4Ch[KqATDi$$;No?+DPe(4ZX].+<YAN+>b2`:-pQU8g&=rEb$;1@;TQu@r,RpEt&Hc
$;No?+Eh10Bk/?&AS-$,.!R0`@<-"'D.RU,Et&IO67sB'+<X*hBk1dc+<VdpBk)7!Df0!(GscL\
ATJt:+<VdL+<X'd@ruF'DIIR26Z6LHF&QXYEarc*+<VdL+<Xa(Eb&*[@<,jk8krf3AOC9BF)rHH
+<VdL+<VdL9jqOPDc:4UEarcW@:O=rFEqh:%15is/g+t=Eb@Nr+=K?d/he^s/0H?'+tt-86:s[6
<),ef@;9^k?R[*K+=Jdf-r30%771$L6XO8:De*3(4*+nFE@E"]+=Jdf-nJFq;FFl#C2[Wi.6DT\
BQ6+J/g)u"+=nW`/:/cr9gM-E:L@OFDe*3(4*+nFEB?l\6W-]Z=\qOo@;9^k?RZEk%15is/g,=G
Ch[E&EbT0"F<DuW.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+<VdLASlC.Gp"5=@:O(qE+<d-+<Ve8
Ci!g'@UWb^F`8HGD..NrBQ@ZoASuT4+<YN0FCSuuDIR$aCNXS*$;No?+ECn2B0A9u-RU#Z4!5Xn
/ghba+<VdL+?L\n/n8gBDKI6K4!5Xg-Z3@0ALATC+<VdL4!5ng@;TR.@rHL-F=.M)%15is/g+bE
Ec#6,F!+n-C`mn0Ch[E&-t7(1.3N&>B6A'&DKI"?@<?U&Ec,q-$;No?+=BoN/g)Ma/0Zek+?Lc%
+<iin/j:C4+>=on+F>:e+<Wij-p/k"@W$!)-Rg/h+A=g=0d&"iHQX_!Cgh?s.3L/a4E5L^FCcdO
4s4lSEb>gg%159QHZ*F;-Zip@FD>`)0IIuI+>Y-YA0<6I%13OO:-pQUA7]RgFCcS'Cht5<DfTB0
/0JSGDfp#?/0K%GF*)IS+EM[>FCfME+DkOsEc6".$8EZ-+E(_1+Co&"-9`P,+FPjh/j:Cr@WNZ&
DJUXP4s26uDdmcN/j(=3+DEGN2(9b4-RT?1%15is/g+_G@<6!&@;^?5@UWb^F`;CE%15Ks4ZX^4
3dWJ%6r60K87,_&<*s!):IK,1C(1M)+=o&d-nul+2)Qg*0d("@EZd\794)$o9IqP@/no'4-OgCl
$;No?+EVXL+EM+&EarcsDJ()9BOu'(FD,6+AKYE%AKYl/+C\bhCNXT;+>"^IG]75(FCeu*ATDg0
EX`@nATAo&DJUFC-OgE#ATAo&DJUFC/gh)8DImi2@W$!)-S@2&%13OO:-pQU@rc-hFCcS:BQ@Zq
+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.jE+*6lA0<7A
ATMs.De(OL%13OO:-pQUF(Jj"DIal.@VTIaF<G(3Ci!ZmFD5Z2%14g4>9G=B0HiJ30JFpu3]\Bj
0fga+Ci<`m;f-GgATVL)F>+.24tq>&@:O(`+=D8BF*)/8A2#A?$6Tcb:-pQUFD,B/A0>f"C1Ums
+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*3Zqca3[l1fDdd0TD/X3$FCfN80b"IR0RIbI@r#Tt
-Zip@FD>`)0II;:%15is/g,4RD.Oi!@<6-m+DG_:@;KXg+CT;'F_t]-FE8QV+D#e:ARfgnA0>H(
Ec5t-$>sEq+C]5)+=AdM-OgE#ATAnM+C]5)+=Acn0ddD;DImi21*C%DC`k)X/gh)8DImi2@W$!)
0F\A,ATAo&DJUFX-RT?1%15is/g,4RD.Oi!@<6-m+DG@tDKKT7Bk;?.%14LmDJUFC-Rg/i3ZqmL
C`keoHX^l/+=Ach+:SZ+0HahBC`k)Q.3L3'+>=pIDJUFW0mbSs@W$!)-S?bh%14L<+C]5)+=ANc
+>#Vs0d'qCC`keoHSHXPDJUFC/ghbN$7IYP@W$!)-RU>c/NP"0+C]5)+?M<)1*C%DC`k)X-Qij*
-o2uTDJUFC-Rg/i3Zp4$@W$!)4#)(<+C]5)+=Ach+:SZ+1a$7FC`k)Q.3L3'+>b3MDJUFW0mb`"
@W$!)-S?bh%13OO:-pQU+C]5)+=Ach%159QHX^l/+=Ach+:SZ7+?^hl@W$!0/gh)8%16QQA8ZO,
4ZX]5/ghbm+<iih0f'q&+<iE\-p'/1@W$!)-S?bq+>#2g-S?bU$4R>;67sBmATVEq+D,Y4D'0s=
Df0-2BleB-DKI"1@:O(qE$-_TATDg0EZeq<E+NO$ARl5WDImi2@W$!)@UWebF_qQpDImi20HahB
C`m1qA8ZO,%16uaEZd(Z@W$!)@UWebF_qQpDImi21*C%DC`m1qA8ZO,%16uaEZd.\@W$!)@UWeb
F_qQpDImi21a$7FC`m1qA8ZO,%13OO:-pQU9jqpb+E(j7Eb0)rBl7X&B-;;-F*)IG@rc:*Bk(Rf
Cj@.6AT23uA0>f.+EV:.+Dbt)A7]9oDdmHm@rucE%15is/g*_t+EV:.+Dbt)A0>r1Deio,FCfN8
+EM%5BlJ08+CT;%+Cf(nDJ*Nk+CQC/Dfd+?Afu2/ATME*FCfN8Et&IO67sBtF`VXI@V$[&AThd/
ARmD9%13OO:-pQU+C]5)+=ANG$7KG&C`k)Q.3L3'+C]5)+=ANG$4R>;67sB'@W$!)-SAnIF`):K
%14LmDJUFC-Rg/i3ZqmLC`keoHX^l/+=Ach%13OO:-pQU+C]5)+=D&8D.P(($7IVj+?MV36;LBN
5u^WS0H`\X:J=&R:JEPd6;LBN9M&/^+@8k"9N4;E9LU<X+>#Vs@W$!)-ULU)9IC8V%15is/g)9G
DJUFCDIIBn/n8gBDKI68$7IVj-V7'45u^WS0IJq08PW5a5se76-Rg/i3ZqmLC`k)s:/iSl4#2.l
DJU[Q-OgCl$;No?+>=pIDJUFC-OgD20HanDC`k)Q.3L3'+<W?\@W$!)-RT?1%15is/g)hj@W$!)
-S?bU$7KA$C`k)X-Rg/i3Zp+!@W$!)-S?bU$4R>;67sB7+C]5)+=AdODfor>-OgD20HanDC`k)Q
.3L3'+>=pIDJUFW0mdAIC`k)X-OgCl$;No?+>=pIDJUFCDIIBn-OgD20fpL>3[[6i:J=&R:JEMc
6;LBN5u^WS0d&eY:J=GR;cFl+:JXY`5se76-Rg/i3Zp+!@W$!)-ULU)9IC8V%15is/g)hj@W$!)
-Z3@0AM.J2F`):K%14L<4"!Tp<'aJZ9e[qV-V7'4<'`iE740N,/NP".+C]5)+=B`U<$s4Y14*JJ
CaUh_%13OO:-pQU0d'qCC`k)Q%14L<4"#)dDeio<<+U,m0IJq0F)>i2AMI.qF*')`4"#)dDeio=
<+U,m0deCm/NP"/+C]5)+=ANG$4R>;67sB8+C]5)+=Ach%14LmDJUFC/gi(j/NP"/+C]5)+=Ach
%13OO:-pQU0d'qCC`k)X@rHL-F=.M)-o!e2F)>i2AM@(pF*')`.3L3'+>G!JDJUFW14*JJCaUh_
%13OO:-pQU0d'qCC`k*C@;TR'%14L<4"#)dDeio=<+U,m0IJq0F)>i2AMI.qF*',a.3L3'+>G!J
DJUFCF)>i2AMGPA$4R>;67sB8+C]5)+=D&8D.P>0Dfor>-OgD20fpb(D/X3$0N;V)F>,'k+>#Vs
0d'qCC`k*HD/X3$0IJD514*JJCaUh_%13OO:-pQU1*C%DC`k)Q%14L<4""KUDesK3Deio<-T`\b
Df9H5D/X3$0df%1Bl8$6D/X3$0IJq0Bl8$6D/X3$0deCm/NP"0+C]5)+=ANG$4R>;67sB9+C]5)
+=Ach%14LmDJUFC/gi(j/NP"0+C]5)+=Ach%13OO:-pQU1*C%DC`k)X@rHL-F=.M)-n%24.4dS8
,[i__+>#Vs1*C%DC`keqHX^l/-S?bU$4R>;67sB9+C]5)+=D&8D.P(($7IVj-Y[I?F)>i2AMGP]
+>#Vs1*C%DC`k*>DKKr:Deio=-OgCl$;No?+>P'KDJUFCDIIBn/n8gBDKI68$7IVj-Xq"4CiaH3
CLo1I.3L3'+>P'KDJUFC@W-1$-S.>7HX^l/+=Ach%13OO:-pQU1E^.EC`k)Q%14L<4"#)lBlmp-
D/X3$0deCm/NP"1+C]5)-RT?1%15is/g)qm@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$@W$!)-S?bU
$4R>;67sB:+C]5)+=AdODfor>-OgD20fpb(F_Pr/F)>i2AMGP]+>#Vs1E^.EC`keoHX^l/-S?bU
$4R>;67sB:+C]5)+=D&8D.P(($7IVj-ZaEEFCfN1Deio=-Rg/i3Zp4$@W$!)-ZaDX%13OO:-pQU
1E^.EC`k*C@;TR.@rHL-F=.M)-n%24.4dS8,[i__+>#Vs1E^.EC`k*HFXJ_%14*JJCaUh_%13OO
:-pQU1a$7FC`k)Q%14L<4"#)dDeio<9jqOPD_NP#-Za-CCLo1o@:O=r0df%1F)>i2AMHnf@rcKA
-T`\sD/X3$0hl(dEc3Z[.3L3'+>b3MDJUFC-OgCl$;No?+>b3MDJUFC/gh)8-t7(1+=Ach.3L3'
+>b3MDJUFC/gh)8%15is/g)tn@W$!)-SAnIF`):K%15is/g)tn@W$!)-Z3@0AL@oo:-pQU1a$7F
C`k*C@;TR.@rHL-F=.M):-pQU0H`(m@W$!)-RT?1%15is/g)hj0d'qCC`k)X-OgD2@W$!)-S?bq
+>#Vs0H`(m@W$!)-S?bU$4R>;67sB7+>G!JDJUFC/n8gBDKI68$;No?+>=om+C]5)+=D&8D.P((
$;No?+>=om+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P'KDJUFC-OgCl$;No?+>=on+C]5)+=Ach
%14LmDJUFC/gi(j/NP".+>P'KDJUFC/gh)8%15is/g)hj1*C%DC`k)X@rHL-F=.M):-pQU0H`+n
@W$!)-Z3@0AL@oo:-pQU0H`+n@W$!)-Z3@0AM.J2F`):K%15is/g)hj1E^.EC`k)Q%13OO:-pQU
0H`.o@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1E^.EC`k)X-OgCl$;No?+>=oo+C]5)+=AdODfor>
-OgDX67sB7+>Y-LDJUFCDIIBn-OgDX67sB7+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>Fun+C]5)
+=ANG$4R>;67sB8+>G!JDJUFC/gh)8-t7(1+=Ach.3L3'+>Fun+C]5)+=Ach%13OO:-pQU0d&1n
@W$!)-SAnIF`):K%15is/g)kk0d'qCC`k*C@;TR'%15is/g)kk0d'qCC`k*C@;TR.@rHL-F=.M)
:-pQU0d&4o@W$!)-RT?1%15is/g)kk1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs0d&4o@W$!)-S?bU
$4R>;67sB8+>P'KDJUFC/n8gBDKI68$;No?+>Fuo+C]5)+=D&8D.P(($;No?+>Fuo+C]5)+=D&8
D.P>0Dfor>-OgDX67sB8+>Y-LDJUFC-OgCl$;No?+>Fup+C]5)+=Ach%14LmDJUFC/gi(j/NP"/
+>Y-LDJUFC/gh)8%15is/g)kk1E^.EC`k)X@rHL-F=.M):-pQU0d&7p@W$!)-Z3@0AL@oo:-pQU
0d&7p@W$!)-Z3@0AM.J2F`):K%15is/g)nl0d'qCC`k)Q%13OO:-pQU1*A:o@W$!)-S?bU$7KA$
C`k)X-Rg/i3Zp1#0d'qCC`k)X-OgCl$;No?+>P&o+C]5)+=AdODfor>-OgDX67sB9+>G!JDJUFC
DIIBn-OgDX67sB9+>G!JDJUFCDIIBn/n8gBDKI68$;No?+>P&p+C]5)+=ANG$4R>;67sB9+>P'K
DJUFC/gh)8-t7(1+=Ach.3L3'+>P&p+C]5)+=Ach%13OO:-pQU1*A=p@W$!)-SAnIF`):K%15is
/g)nl1*C%DC`k*C@;TR'%15is/g)nl1*C%DC`k*C@;TR.@rHL-F=.M):-pQU1*A@q@W$!)-RT?1
%15is/g)nl1E^.EC`k)X-OgD2@W$!)-S?bq+>#Vs1*A@q@W$!)-S?bU$4R>;67sB9+>Y-LDJUFC
/n8gBDKI68$;No?+>P&q+C]5)+=D&8D.P(($;No?+>P&q+C]5)+=D&8D.P>0Dfor>-OgDX67sB:
+>G!JDJUFC-OgCl$;No?+>Y,p+C]5)+=Ach%14LmDJUFC/gi(j/NP"1+>G!JDJUFC/gh)8%15is
/g)qm0d'qCC`k)X@rHL-F=.M):-pQU1E\Cp@W$!)-Z3@0AL@oo:-pQU1E\Cp@W$!)-Z3@0AM.J2
F`):K%15is/g)qm1*C%DC`k)Q%13OO:-pQU1E\Fq@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp4$1*C%D
C`k)X-OgCl$;No?+>Y,q+C]5)+=AdODfor>-OgDX67sB:+>P'KDJUFCDIIBn-OgDX67sB:+>P'K
DJUFCDIIBn/n8gBDKI68$;No?+>Y,r+C]5)+=ANG$4R>;67sB:+>Y-LDJUFC/gh)8-t7(1+=Ach
.3L3'+>Y,r+C]5)+=Ach%13OO:-pQU1E\Ir@W$!)-SAnIF`):K%15is/g)qm1E^.EC`k*C@;TR'
%15is/g)qm1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Lq@W$!)-RT?1%15is/g)tn0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs1a"Lq@W$!)-S?bU$4R>;67sB;+>G!JDJUFC/n8gBDKI68$;No?+>b2q
+C]5)+=D&8D.P(($;No?+>b2q+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P'KDJUFC-OgCl$;No?
+>b2r+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P'KDJUFC/gh)8%15is/g)tn1*C%DC`k)X@rHL-
F=.M):-pQU1a"Or@W$!)-Z3@0AL@oo:-pQU1a"Or@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E^.E
C`k)Q%13OO:-pQU1a"Rs@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E^.EC`k)X-OgCl$;No?+>b2s
+C]5)+=AdODfor>-OgDX67sB;+>Y-LDJUFCDIIBn-OgDX67sB;+>Y-LDJUFCDIIBn/n8gBDKI68
$;No?+>=om+>=pIDJUFC-OgCl$;No?+>=om+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=om+>=pI
DJUFC/gh)8%15is/g)hj0d&.m@W$!)-SAnIF`):K%15is/g)hj0d&.m@W$!)-Z3@0AL@oo:-pQU
0H`(m0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`(m0d'qCC`k)Q%13OO:-pQU0H`(m0d'qCC`k)X
-OgD2@W$!)-S?bq+>#Vs0H`(m0d'qCC`k)X-OgCl$;No?+>=om+>G!JDJUFC/n8gBDKI68$;No?
+>=om+>G!JDJUFCDIIBn-OgDX67sB7+>Fun+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Fuo+C]5)
+=ANG$4R>;67sB7+>Fuo+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Fuo+C]5)+=Ach%13OO:-pQU
0H`(m1*C%DC`k)X@rHL-F=.M):-pQU0H`(m1*C%DC`k*C@;TR'%15is/g)hj0d&4o@W$!)-Z3@0
AM.J2F`):K%15is/g)hj0d&7p@W$!)-RT?1%15is/g)hj0d&7p@W$!)-S?bU$7KA$C`k)X-Rg/i
3Zp+!0d&7p@W$!)-S?bU$4R>;67sB7+>Fup+C]5)+=AdODfor>-OgDX67sB7+>Fup+C]5)+=D&8
D.P(($;No?+>=om+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>=on+>=pIDJUFC-OgCl$;No?+>=on
+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=on+>=pIDJUFC/gh)8%15is/g)hj1*A7n@W$!)-SAnI
F`):K%15is/g)hj1*A7n@W$!)-Z3@0AL@oo:-pQU0H`+n0HahBC`k*C@;TR.@rHL-F=.M):-pQU
0H`+n0d'qCC`k)Q%13OO:-pQU0H`+n0d'qCC`k)X-OgD2@W$!)-S?bq+>#Vs0H`+n0d'qCC`k)X
-OgCl$;No?+>=on+>G!JDJUFC/n8gBDKI68$;No?+>=on+>G!JDJUFCDIIBn-OgDX67sB7+>P&o
+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>P&p+C]5)+=ANG$4R>;67sB7+>P&p+C]5)+=Ach%14Lm
DJUFC/gi(j/NP".+>P&p+C]5)+=Ach%13OO:-pQU0H`+n1*C%DC`k)X@rHL-F=.M):-pQU0H`+n
1*C%DC`k*C@;TR'%15is/g)hj1*A=p@W$!)-Z3@0AM.J2F`):K%15is/g)hj1*A@q@W$!)-RT?1
%15is/g)hj1*A@q@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp+!1*A@q@W$!)-S?bU$4R>;67sB7+>P&q
+C]5)+=AdODfor>-OgDX67sB7+>P&q+C]5)+=D&8D.P(($;No?+>=on+>Y-LDJUFCDIIBn/n8gB
DKI68$;No?+>=oo+>=pIDJUFC-OgCl$;No?+>=oo+>=pIDJUFC/gh)8-t7(1+=Ach.3L3'+>=oo
+>=pIDJUFC/gh)8%15is/g)hj1E\@o@W$!)-SAnIF`):K%15is/g)hj1E\@o@W$!)-Z3@0AL@oo
:-pQU0H`.o0HahBC`k*C@;TR.@rHL-F=.M):-pQU0H`.o0d'qCC`k)Q%13OO:-pQU0H`.o0d'qC
C`k)X-OgD2@W$!)-S?bq+>#Vs0H`.o0d'qCC`k)X-OgCl$;No?+>=oo+>G!JDJUFC/n8gBDKI68
$;No?+>=oo+>G!JDJUFCDIIBn-OgDX67sB7+>Y,p+C]5)+=D&8D.P>0Dfor>-OgDX67sB7+>Y,q
+C]5)+=ANG$4R>;67sB7+>Y,q+C]5)+=Ach%14LmDJUFC/gi(j/NP".+>Y,q+C]5)+=Ach%13OO
:-pQU0H`.o1*C%DC`k)X@rHL-F=.M):-pQU0H`.o1*C%DC`k*C@;TR'%15is/g)hj1E\Fq@W$!)
-Z3@0AM.J2F`):K%15is/g)hj1E\Ir@W$!)-RT?1%15is/g)hj1E\Ir@W$!)-S?bU$7KA$C`k)X
-Rg/i3Zp+!1E\Ir@W$!)-S?bU$4R>;67sB7+>Y,r+C]5)+=AdODfor>-OgDX67sB7+>Y,r+C]5)
+=D&8D.P(($;No?+>=oo+>Y-LDJUFCDIIBn/n8gBDKI68$;No?+>b2q+>PYo@W$!)-RT?1%15is
/g)tn0d&5++C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo0d'qCC`k)X-OgCl$;No?+>b2q+>PYo
@W$!)-SAnIF`):K%15is/g)tn0d&5++C]5)+=D&8D.P(($;No?+>b2q+>PYo@W$!)-Z3@0AM.J2
F`):K%15is/g)tn0d&5,+C]5)+=ANG$4R>;67sB;+>Fuo1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs
1a"Lq1,9t]DJUFC/gh)8%15is/g)tn0d&5,+C]5)+=AdODfor>-OgDX67sB;+>Fuo1*C%DC`k*C
@;TR'%15is/g)tn0d&5,+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo1E^.EC`k)Q%13OO:-pQU
1a"Lq1,C%^DJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>P_q@W$!)-S?bU$4R>;67sB;+>Fuo1E^.E
C`k)X@rHL-F=.M):-pQU1a"Lq1,C%^DJUFCDIIBn-OgDX67sB;+>Fuo1E^.EC`k*C@;TR.@rHL-
F=.M):-pQU1a"Lq1,L+_DJUFC-OgCl$;No?+>b2q+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%
0d&5.+C]5)+=Ach%13OO:-pQU1a"Lq1,L+_DJUFC/n8gBDKI68$;No?+>b2q+>Pbr@W$!)-Z3@0
AL@oo:-pQU1a"Lq1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2q+>Pes@W$!)-RT?1%15is/g)tn
0d&5/+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>Fuo2'?@GC`k)X-OgCl$;No?+>b2q+>Pes@W$!)
-SAnIF`):K%15is/g)tn0d&5/+C]5)+=D&8D.P(($;No?+>b2q+>Pes@W$!)-Z3@0AM.J2F`):K
%15is/g)tn0d&50+C]5)+=ANG$4R>;67sB;+>Fuo2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Lq
1,^7aDJUFC/gh)8%15is/g)tn0d&50+C]5)+=AdODfor>-OgDX67sB;+>Fuo2BZIHC`k*C@;TR'
%15is/g)tn0d&50+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Fuo2]uRIC`k)Q%13OO:-pQU1a"Lq
1,g=bDJUFC/gh)8-t7(1+=Ach.3L3'+>b2q+>Pku@W$!)-S?bU$4R>;67sB;+>Fuo2]uRIC`k)X
@rHL-F=.M):-pQU1a"Lq1,g=bDJUFCDIIBn-OgDX67sB;+>Fuo2]uRIC`k*C@;TR.@rHL-F=.M)
:-pQU1a"Lq1,pCcDJUFC-OgCl$;No?+>b2q+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%0d&52
+C]5)+=Ach%13OO:-pQU1a"Lq1,pCcDJUFC/n8gBDKI68$;No?+>b2q+>Po!@W$!)-Z3@0AL@oo
:-pQU1a"Lq1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2r+>PYo@W$!)-RT?1%15is/g)tn1*A>,
+C]5)+=Ach%14LmDJUFC/gi(j/NP"2+>P&p0d'qCC`k)X-OgCl$;No?+>b2r+>PYo@W$!)-SAnI
F`):K%15is/g)tn1*A>,+C]5)+=D&8D.P(($;No?+>b2r+>PYo@W$!)-Z3@0AM.J2F`):K%15is
/g)tn1*A>-+C]5)+=ANG$4R>;67sB;+>P&p1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,9t]
DJUFC/gh)8%15is/g)tn1*A>-+C]5)+=AdODfor>-OgDX67sB;+>P&p1*C%DC`k*C@;TR'%15is
/g)tn1*A>-+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p1E^.EC`k)Q%13OO:-pQU1a"Or1,C%^
DJUFC/gh)8-t7(1+=Ach.3L3'+>b2r+>P_q@W$!)-S?bU$4R>;67sB;+>P&p1E^.EC`k)X@rHL-
F=.M):-pQU1a"Or1,C%^DJUFCDIIBn-OgDX67sB;+>P&p1E^.EC`k*C@;TR.@rHL-F=.M):-pQU
1a"Or1,L+_DJUFC-OgCl$;No?+>b2r+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>/+C]5)
+=Ach%13OO:-pQU1a"Or1,L+_DJUFC/n8gBDKI68$;No?+>b2r+>Pbr@W$!)-Z3@0AL@oo:-pQU
1a"Or1,L+_DJUFCDIIBn/n8gBDKI68$;No?+>b2r+>Pes@W$!)-RT?1%15is/g)tn1*A>0+C]5)
+=Ach%14LmDJUFC/gi(j/NP"2+>P&p2'?@GC`k)X-OgCl$;No?+>b2r+>Pes@W$!)-SAnIF`):K
%15is/g)tn1*A>0+C]5)+=D&8D.P(($;No?+>b2r+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn
1*A>1+C]5)+=ANG$4R>;67sB;+>P&p2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Or1,^7aDJUFC
/gh)8%15is/g)tn1*A>1+C]5)+=AdODfor>-OgDX67sB;+>P&p2BZIHC`k*C@;TR'%15is/g)tn
1*A>1+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>P&p2]uRIC`k)Q%13OO:-pQU1a"Or1,g=bDJUFC
/gh)8-t7(1+=Ach.3L3'+>b2r+>Pku@W$!)-S?bU$4R>;67sB;+>P&p2]uRIC`k)X@rHL-F=.M)
:-pQU1a"Or1,g=bDJUFCDIIBn-OgDX67sB;+>P&p2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Or
1,pCcDJUFC-OgCl$;No?+>b2r+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1*A>3+C]5)+=Ach
%13OO:-pQU1a"Or1,pCcDJUFC/n8gBDKI68$;No?+>b2r+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Or
1,pCcDJUFCDIIBn/n8gBDKI68$;No?+>b2s+>PYo@W$!)-RT?1%15is/g)tn1E\G-+C]5)+=Ach
%14LmDJUFC/gi(j/NP"2+>Y,q0d'qCC`k)X-OgCl$;No?+>b2s+>PYo@W$!)-SAnIF`):K%15is
/g)tn1E\G-+C]5)+=D&8D.P(($;No?+>b2s+>PYo@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G.
+C]5)+=ANG$4R>;67sB;+>Y,q1*C%DC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,9t]DJUFC/gh)8
%15is/g)tn1E\G.+C]5)+=AdODfor>-OgDX67sB;+>Y,q1*C%DC`k*C@;TR'%15is/g)tn1E\G.
+C]5)+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q1E^.EC`k)Q%13OO:-pQU1a"Rs1,C%^DJUFC/gh)8
-t7(1+=Ach.3L3'+>b2s+>P_q@W$!)-S?bU$4R>;67sB;+>Y,q1E^.EC`k)X@rHL-F=.M):-pQU
1a"Rs1,C%^DJUFCDIIBn-OgDX67sB;+>Y,q1E^.EC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,L+_
DJUFC-OgCl$;No?+>b2s+>Pbr@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G0+C]5)+=Ach%13OO
:-pQU1a"Rs1,L+_DJUFC/n8gBDKI68$;No?+>b2s+>Pbr@W$!)-Z3@0AL@oo:-pQU1a"Rs1,L+_
DJUFCDIIBn/n8gBDKI68$;No?+>b2s+>Pes@W$!)-RT?1%15is/g)tn1E\G1+C]5)+=Ach%14Lm
DJUFC/gi(j/NP"2+>Y,q2'?@GC`k)X-OgCl$;No?+>b2s+>Pes@W$!)-SAnIF`):K%15is/g)tn
1E\G1+C]5)+=D&8D.P(($;No?+>b2s+>Pes@W$!)-Z3@0AM.J2F`):K%15is/g)tn1E\G2+C]5)
+=ANG$4R>;67sB;+>Y,q2BZIHC`k)X-OgD2@W$!)-S?bq+>#Vs1a"Rs1,^7aDJUFC/gh)8%15is
/g)tn1E\G2+C]5)+=AdODfor>-OgDX67sB;+>Y,q2BZIHC`k*C@;TR'%15is/g)tn1E\G2+C]5)
+=D&8D.P>0Dfor>-OgDX67sB;+>Y,q2]uRIC`k)Q%13OO:-pQU1a"Rs1,g=bDJUFC/gh)8-t7(1
+=Ach.3L3'+>b2s+>Pku@W$!)-S?bU$4R>;67sB;+>Y,q2]uRIC`k)X@rHL-F=.M):-pQU1a"Rs
1,g=bDJUFCDIIBn-OgDX67sB;+>Y,q2]uRIC`k*C@;TR.@rHL-F=.M):-pQU1a"Rs1,pCcDJUFC
-OgCl$;No?+>b2s+>Po!@W$!)-S?bU$7KA$C`k)X-Rg/i3Zp7%1E\G4+C]5)+=Ach%13OO:-pQU
1a"Rs1,pCcDJUFC/n8gBDKI68$;No?+>b2s+>Po!@W$!)-Z3@0AL@oo:-pQU1a"Rs1,pCcDJUFC
DIIBn/n8gBDKI68$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R=j0fU=;
1asP0-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,@rH4'C/\tfCLo1R:-pQ_@rH4'
C/\tfCLo1R+ET1e+EV19F<DuADf'H..3NM:D.Oi.@V0b(@psInDf.0:$;No?%15is/g+5/ASrW4
BOr;/F*)G:DJ((?001OF3ZoPRE,]AsEcW?GBl5%9@3A/b+EqaEA0<!C@rH4'C+19LBl%Sp$;No?
+E(_$F`V&$FCcS'DL!?ICi<flC`mV(D.Rc@+AZHYF`V&$FCeu*DIIBnF!)T7AS5^p+<YlBFD)e=
BOqV[:-pQUE,oN%Bm:aC-r30!<Du7]7T_)^+CT.u+<Ve<DIak4GA2/4+<Y]5DId[&+<Y-%F(HI:
:-hTC5tk*G5n+/r67sC%F_56"G\(q=+<Y04DKKo;Ci!Zn+<Y-=+<W(.6:OsR6UOUJ.4u_c+@p3Z
BOu3,+<Yi9Cis<1+<YT7%15is/g)Q<6:OsR6UOUJ.3N87DImisFCcS2Df03!EZee.A0>]"F)rI?
Bkq9rGp%3I+Cf4rF(c\6@;TRs/e&._67r]S:-pQUG%G]'@<?4#3XlEk67r]S:-pQU+<WBf+CT>4
F_t]2+EV19F<G+.@ruF'DIIR2+=M>CF*)/8A2#\d+D#e3F*)I4$;No?%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_ick%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1E^gZ
A79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"
EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$
3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6
A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172f
Bk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5+=ANG$4R>;67sBjBOPpi@ru:&
+EV%$Ch4`0AT2[$F(K62@<?4%DBNk0+DN$CDfTB0/0JG2Chu-T+DPD,+=D>DEagC*$>O'k4ZZe.
+C.&]?SNZO0edr_/h%no+BplL2'G"<+?U)?%15is/g+\9Anc-o+EqaEA0?)1FD)e8@V0b(@psIn
Df-!kDdm=$F(8X#ASl!44ZX]A+?CW!%15is/g)Pq3[m3Q+E(_$F`V&$FCcS2De!3l+DtV)ATJ:f
-Z!^2@;L!-FD,*)+D58-+EqC2Eb$O\/g,EK$>+3s?Zp@+A8a(CGp$X9/e&.1+Dbt+@;Kuo$6UI8
ASH0q%144#BcoPk+<t]@@ps1p%144#G9B%$+DD8lASu$2%14Nn$4R>;67sBsDe!3l+E2.*Bl5&2
@;TRs%16oh@;TRs4ZX]I-p04G0e"5l+?L]#+F>4c0d(+FDdmc1-Z<I+F`V&$FCf<#0OI+36$$m]
CLoLd3F=-C$4R>;67sC%FDl22+DG^9A8,OqBl@ltEd8*$ATAo8D/a<0@j#`5F<DrL@V0b(@psIj
D.PCK%13OO:-pQUEb/Zi+C\bhCER&'A0>DoAnc-o+EqOABHV5&Ap&0)@<?'k+DtV)ATJ:f0d'[C
0HiJ20JO\S+?M<)@rH4'C*4mB@V0b(@psIjD.PCK%13OO:-pQUCi<flC`mY*Ap&0)@<?'k+DtV)
ATJ:fDf0!#ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iK@V0b(@psIjD.PD.5s[eXD/X3$
3B9*,-OgCl$7I-;DIIBnF"&4p+<t]?@;TRs%13OO0d'[CF(fK9E+*g/+Dbq(D.Rc2/1r&`DIIBn
Et&Hc$?Km!Ecbl1D.PCa3Zp4$3Zp*c$7BY.@ps1p+EV:*F<G4-F<Gd=Bl[`34Y@k&%16]cEaO!.
De*c=+F,)?D_;J++<YK=@ps1p%144#G@bK/A.8kg+DDr]/g)BTDe!3lEt&I!+Enqk/g+j;$>"*c
/e&.:%13OO:-pQUCi<flC`m\5@;0U%DIIBnEt&ImDIIBnF$2Q,4"*3G4#&0,HQYBm0d(fc0eje`
Ci<d(+=D5DDfTr2DJ`r=?U6tDF)>i2AN;b2?RH9i%15is/g,4WDfTD3Bl5&(Bk)7!Df0!(Gmt*l
EZfI@E,9H&+E2IF+=D5DDfTr2DJ`r=-OgCl$;No?+ED%%A0>>i@r!2qDIal#AS,XoAISu$+BosB
+Z_;20d'[C4#)(lDf'H.+=D5DDfTr2DJ`r=-OgCl$;No?+Dbt+@;I'-BQ%p5+DtV)ATJ:fF)GE'
ATL!q+?Lu60fq*=+F>4m+>G!c+>GSnB5DKqF!)iOBQ%p5ASu?r0OI+36$$m]CLoLd3F=-C$4R=j
,BIa2D.Rc;+?^hlCi3ZuATJ:f%14g4>9J!#Dg-//F)rI?DIIBnF!*"d+EMF/D.Rbt$4R=O$;No?
+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#
+?Xa_E,9H&?U6tDF)>i2AN;b2?Xn"kE,&<gDeio<0ht%f.V!C6E,&<gDeio<0d(Qi/KcHODf'H.
.3NeBCh[E&@<-"'D.RU,+EMC<CLnW1ATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+CfG'@<?'k3Zp130JIQZE%j!U$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A,Et
+>>E./i5'f$;No?+>G`gF_iff+ED%2@;TRd+D,Y4D'16:Df'H.6=FqL@jrO/DIakuA867.FCeu*
AoD]48g$)G0Jj4G:-pQU+<VdL+<VdL@;]TuDIn#7.!'6DCLo&+@<6-m/8Sa8B4WW8FE1r6F"CgA
F`V4F+EV19FD5W*+ED%+Bl.Dj$;No?+>Gim@<jUa+E_X6@<?'k+EVNE@rHC.ATMg/DIal3D`T"]
FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEo
ATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OOATAo3
A0>u)Bk)6->9G^EDe't<-OgCl$;No?+DG_7ATDl8F)Po,+EMX5DId0rA0?)7Eb'56FDi:3Df'H6
ATMo%$;>AUB22lPATL.XAQ!)JCi"Af@<,mXDcD"$AN`'s1E\_$0F\?u$=[pl+?_>"Eb/ZqCjBi8
DJ*iqD.RcsDJjB<D.OhQ/g,7LAU.^)ARTY*D/aT8D'1to+>=63De<R*ARf:mF(of/F*(i.A79Lh
F!*Uu+C]8-%13OOFD,*)@<,pfF(A]r@:s:lB45k!Df^#/DId0rA79RgCht4W/g+VAD]gMPGmt)i
$7AeA6qL0S;]nq;:K0bN+AP3s78k<p;FM]o9N+_06W-oZ6V'X6+@K",:+%/I/g+VAD[d$_$7A>;
:I7?@;]nM26VLKJ778Ld3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr)Df02_@;TRs6#pO7ARTCk
Gt;@aA5mJHH#R=B%17,c+Bos9Eap56G]Y;r3ZqpND/a54-VSGrB22lPATL.XAQ!)JCi"Af@<,mX
DcD"$AL@oo0d'[CF)>i<FDuAE+EVjM%13OOF(fK4F?MZ-1E\_$0F\@a67sBu@;TRs+CT)&Eb/Zi
Gp%$CAKYJr@<*JB+Du+>+Cf(nDJ*Nk%16N,/pRm5Gs*cg+=\Kh%17DE/n#kP+F,(Z+F+D'.1HUn
$>"6#FDYu5Ddso/F`\`RF(fK4F=.M)Eap4r+=D2>+EVjM-TsM#Df'H.+=D5DDfTqI%14g4>9J!(
Dfp/@F`\aJG]XB%%13OODdmHm@rua&Aog*r+>Y-$+>=63Bjkjc?Z0CgARfgF/g,E^:-pQUA8`T.
Dfd+3Df'H6ATMo8DdmHm@ruc$$>aX%FC/BhDI6ah@VTIaFC/BbDf000F(oQ14Y@j4%13OOA8-'q
@ru(&G^*RY/g,E^:-pQUA8`T.Dfd+3Df'H6ATMo8Ci<flCh7Ys$7QDk%16Ze+EVI>Ci<f+E-67F
-Z<I/ARfh&AS-!2%17,c+Bos9Eap56G]Y;r3b*)FE,$LCDdmHm@rua&Aof=/$8EZ-+EMC<F`_SF
F<G[MF:AQd$>40n@UX(nAS-!H3\qm>+>=63B5DKq@;L!-.Ni/?AKWHFDJsV>.Ni5>D/aN,F)to'
+=\LZ%14Nn$4R>REZfI@E,9H&+E2IF+=Cf<Ddm-kEb/j(-OgE'@j"tu-ZW]>FEhmT4ZX]qDf'H.
+=Cf<Ddm-kEb/j(-OgD;+Bot0D/XQ=E-67FFEhm:$4R=O$=m^XCgh?qA927!E+O)R3Zp7%3Zp*c
$4R>;67sBkARfObEb/c(F(9--ATJu&Eb-A8DfoQ'Gp%!5D.Rc2@;]Tu@<,og$;No?+D#e-Cis9"
A0>K)Df$V=BOr;rDf'H6ATMp,Df-\:Ec5H!F)qct%17#sATDg*A7[nbB5DKq@;L!J3ZrYi+AP6U
-n6Z//g,(UATDg*A7ZlrCi<ckCi^$m%16Q_D`o^dDf7ckFDl(\/g)kk+<VdL+AP6U+=J]g4ZX]p
Df6b3Df6b?Df6'l%16]cEaN]mD.Rc@+F,)?D_;J++<VdL@W-0-.NiV;D.RcqBl7HmGT\,(67sBp
D/a<*@qg$-AoD]B+Dbt+@;L!-DJsV>@q]:gB4YT_$6UH6+=DAE+D58-+CfG7DI[?kA0>f5F<GL6
+D#e3F*(u2@q@#14Y@jp@;TRs+=\LO@;TRs%16ZaA1e;u%16ceD]gMPGmt*0%13OOATAo8D/a<0
@j#`5F<DrAARfObEb/d&@rH<tF!hD(Eap4r+=D2>+EVjM-TsL5@rH4'C*4m7ARfObEb/d&@rH<t
F!hD(0d'[CF)>i<FDuAE+EVjM%13OOD/"6+A927!E+O)R3Zp4$3Zp*c$4R>;67sBsDe!3l+DGm>
@<6L(B5V9k+Dbt+@;I&pDIal&Ci<ckC^g_H67sC)BOu'(@;^?5D/"6+A0>r'DfB9/+CT;%+Co&*
ARfgnA0>f.Cj?Hs:-pQUGA(]4AKZ&5@:NjkBlbD;ASl@/ARlo8+=Ll=Ddmc:+ED%4DfTr@%15is
/g+S?A0>SsASuU(Anbgt+Dkh;ARlp)@rH<tEt&Hc$>aWj@;J(Z+F+D'Ci<flCcsg%1*A%hCi<fl
C^g_#%13OOATAo8D/a<0@j#`5F<DrJBm=3"F(9--ATK4.$?BW!>9G;6@j#l<F=044+Cf>,E,$LC
D/"6+A927!E+O)<%14g4>9J!(Dfp/@F`\aJG]XB%%16T`DJ"$4ARojlDfB9/4ZX]A+?CW!%13OO
:-pQUBkAK0BOu3q+CT;%+CT/5+DtV)AKYK!@<6L(Anba`FD5Z2+DGn<F_,V'$;No?+Dbb-AKYK$
DJ"$4ARlp)@rH<tF!,C=Cj@.IBPDR"+EML1@q?csF!,L7D/XT/A1e;u:-pQUFD,B0+DGm>FD,5.
F(&ZlF*&OHBPD?s+EVNEA8a(C+B3#c+=Ll=Ddmc:%15is/g,=KEag/%ATVKnFE8R5DIal1AT2R.
FE8R7Df000F(Jl)A7]7e@<,duBl@m1/e&-s$;No?+C]8-+DGm>A7]7e@<,pi+Dbt+@;I&pDIal&
Ci<ckC`k;PB5\o)BkMR/AIStU$=[pl4aA.m+<VdL+<Ve%67sB/.OdM5+C]8-%16ceD`o^^Df6aJ
+F,(P:-pQU-n6Z/3ZqmMD[d%&%13OOATAo8D/a<0@j#`5F<Dr@Df000F(Jm'@rH<tF!hD(Eap4r
+=D2>+EVjM-TsL5@rH4'C*4m6Df000F(Jm'@rH<tF!hD(%15is/g)`m<(0_b+B)9-6UapP7TE-1
/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd
3F?9:ART[lFCfN8A8,OqBl@ltEbT*+:-pQ_@rc-hFCfQ*F*(r,@ruF'DIIR"ATJu9/M/)TEb/[$
ATJu*D/aTB+A,Et+EV19F<G+.@ruF'DIIR"ATKI5$;No?%15is/g+&7DBL?<ATMs6Dg?G9F*(r,
@ruF'DIIR"ATK:CE,oZ2EZfIB+EDUBDJ=!$/e&._67sB'%15is/g+SFFD,T53ZoP;DeO#26nTTK
@;BFp%15is/g+YEART[lA3(hg0JP:oAR[AN%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'D..]E1E^OQA8,XiARlp*
D]j(CDBO.;FD)e7ATo7FBkhQs.3N>BFCfK)@:NjkCi<flCh4%_:-pQU0emQaFttcp-us0FDf9_H
+CSekARlo8+CSeqF`VY9A0>u4+EDUB+E)-?@W-@%+EqO;A8cZ7-6R,=DKU15$;No?+>GfiF`&rg
+EV19F<G+.@ruF'DIIR"ATJu'Ea`irARlo8+Dl%;AKYDlA7]9\$;No?+>Gim@<jU_+DG_7F`M%9
IS*C(<(0_b+Co2,ARfh#Ed8d=G\M5@Et&Hc$=e!aF`MM6DKI!K@UX=h-OgCl$;No?+DGm>8l%iS
78m/.@rH6sBkMR/ARn"7$8!kQ-[nZ`6rZTR<$re?3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g,7I
F*(u6+E_d?Ci^_8Ddd0!Bl8$2+=Lr=De(:>Ci<flCh4%_Eb065Bl[c--YdR1FCfN8ATB.-$4R>;
67sBjEb/[$AKZ)+D/aE6@<-W9GAhM;Bl7Q+Ci<flCh4%_@rGjn@<6K4FDYu5De!-?5s]U5@<6*B
3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%13OO
:-pQU:2b5c3ZrNXAKZFo:IJ/N;cFl[Df9_?D09oA+C\n)F(KG9/Kf1WAKXSf@rH6sBkMR/AKVEh
8l%iS78m/`:JXqQ3Zr0V@<?0*-[nZ`6rZTR<$r+^%15is/g+.h6QgSeDId[0F!,@3FE_YDCERY9
DfcEq:-pQU8l%iS78m/`:JXqQ3ZoeT>]"%^@r>^r0JHaSF(KB5>\[eY@;BFp>\\1fFCfN80ddD;
%14g4>9IckCLq$jEaN6iDe*2t4A&C;<(0_b;GU(f%13OO:-pQU@:X+qF*&OGCghBu+D,P4+Dbb0
Fa,QV@:K`R8l%iS78m/`:JXqQ3ZrNcCghBu11+I)De*2t8l%iS78m/`:JXq!$4R>;67sBjEb/[$
AKYQ$E--@JFCfN8+Co1rFD5Z2@<-'nF!*%WF(KH8Bl7Q+6r-0M9gqfV6qKaF%15is/g,7S+>=pW
Eb0<'Ecu#8+EV:.+EV=7AKZ&9@;Ts+@WGmpA1e;uA8XOk-Zip@FD>`)0JFj`$>"6#DIn$&+Co@O
8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f
/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\
F*)/8A2#_c%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&
-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL
:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(OW-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze
+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\
De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W:1FEV=ATAo2ATqZ-
A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`
:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk
-Zip@FD>`)0Jk-d$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\f
A7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t
<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2#kg%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-
$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze
+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(O[-OgDoEZf72
G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N
;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>Q
DEU$.FCfN8C2[W:2^]%AATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj
@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B
6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0K:Eh$>"6#DIn$&+Co@O8l%iS78m/`:JXq@
A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!
$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]+:SYe$=n$;3[]#\F*)/8A2$"k%16Ze
+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuRF*(i-E*m$gDe*3&-RgSo+>#/f-S.kc
6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3
%16W`4ZXs4ATMs.De(RV-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4
D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$
F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W;0ddD;ATAo2ATqZ-A8XJ$:IJ/N;cHXj
:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5
A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF-Ta")%13OOA8XOk-Zip@FD>`)0et*c
$>"6#DIn$&+Co@O8l%iS78m/`:JXq@A8Vh`ATAnN+E2IF+=M>QFCB$*?X[\fA7$]3.4chh/M/(m
/4r]+<(0_b;GU(f/7`W@>9Iip+Co@!$>"6#1E^UH+Co@4>9IHqF(KG9-U^`t<D>nW<(';F<$sa]
+:SYe$=n$;3[]#\F*)/8A2,kf%16Ze+Dtb7A0>E#4%`::<(0_b;GU(f/7`W-$>"6#2'?j\F<DuR
F*(i-E*m$gDe*3&-RgSo+>#/f-S.kc6rZTR<)QLf<%MQt+Bot,A0>E#%16Ze+>Y-YA0>E#+Bot!
E-#T4+=BQQ6WHiL:/jVQ6W>Ep0H^f3%16W`4ZXs4ATMs.De(RZ-OgDoEZf72G@Vh,DECHd6rZTR
<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum+=A^4:IJ/N;cHXj:K/lUDBN.+
De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)4"qcd$4R>QDEU$.FCfN8C2[W;
2(&h?ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M/12Pl
/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV6qKaF
-Ta")%13OO:-pQUDfTB"EZf:4+DkP"DJ=38A7ZloBk)7!Df0!(Bk;>p$=n$;3[]#\F*)/8A2,bl
-OgDoEZf72G@Vh,DECHd6rZTR<)QLf<%MQt%16Ze+>k9\F`\`SFE;P4D/`ijC2[Wi-RU>o-Qjum
+=A^4:IJ/N;cHXj:K/lUDBN.+De'u$D@HqaEZd.\De'u$DBN.+A8lU$F<Dr!:IA,V78?fM8OHH)
4"qcd$4R>;67sC&GAeUBEb&a%F!,C5+DkP"DJ=38A7ZloBk)7!Df0!(Bk;>p$=n$;3[]#\F*)/8
A2,bl0II;:ATAo2ATqZ-A8XJ$:IJ/N;cHXj:K/lUD@HqaEZd4^E-67F.!0NP@;Tsj@;9^k?RI3M
/12Pl/KcDl8l%iS78m/`:JXq@A8WMo+E(d5A8Vh`ATAnL+E(d5A8WMo+CoG4ATT%B6r-0M9gqfV
6qKaF-Ta")%13OO:-pQU<(0_b+B)9-6UapP7TE+k$4R>;67sC$AT)O!DBNA*Gp$X3@ruF'DIIR"
ATJ:fATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B
3B:FU$=m^a6=FqL@k]Sk:-pQ_A7]RD@<6-m0JG4(F=f'e@UX=l@j#r'Ch[E&-tHn*.3N_DF*)IU
%15is/g(T1:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;f@3AH:5t"dP8Q8,$E-67FA8,OqBl@lt
Ed8cUFCfN8C2[W:.4u&::-pQB$;No?+A,Et+CehrCi^_@D]j+4FEMOFFCfN8+D#G6Bl\-0D.RU,
+>"^EF)uJ@ATJtd:IJ,W<Dl1Q+:SZQ67sBhA7TUr+DG_7FCB!%ARlolDIak^:IH=9AThX$DfBQ)
DKI"3Bk)7!Df0!(Bk;?.-u*[2A7]p;C2[W9F`_>6F"%P*:-pQB$;No?+<VeFA0<rp-YdR1A7]p,
C2[W*F`_>6F!i)7+>Y-YA0<6I%15is/g)8ZD/=89-YdR1FCfN8ATB.-$;No?+<VeCDdd0!-YdR1
FCfN8ATB.@+:SZQ67sB'+>G!ZFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4A+AP6U+CfG'@<?''
FCfN8+Co1rFD5Z2@<-'nEt&IO67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3lfFtbWn@rH7.ATDm(A0>u4+DNee0JXb&+ED%2
@;TRd%15is/g)l'D..]E1E^gZA79RkA0>K&EZdt502-(tFa,$PATDj+Df-\9Afs]A6k'Ju67sB8
0l:?E1,'h!C2[X)ATMs)E[`,OAT;j,Eb-V/%15is/g)l'DJs\R1E^1@@;]^hA0>u4+E_a:+EV13
E,Tc*Ed8dDDe!3lAISuA67sB83,N)L1,L+rE+*j"A0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?
@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eG@<6-m3B9*,4ZX]5
5s[eG@<6-m3B9)I+BosuDe3rtF(HIV-UC$a@UX=l@lZP0-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4
A8,Oq%13OO:-pQUBl8!'Ec`F4+EqaEA0>;uA0>DoCh7^"+DGp,$>EpcGAhM44ZX]A+?CW!%16N,
/g)nl.j0*H$=P&,+>S0N$7QDk%16odF`VXf3Zodm-RL*"+?CoV+FGdc?SR!PBeCSa-87\5>p*]2
+Bp9D%13OOATAo8D/a<0@j#`5F<DrF@;U4,Eb$O?+<XEG/g+kGFDi:4Bk)7!Df0!(Gmt*lEZen1
C`k*>@;U4,Eb$O?+<XEG/g+kL+DGp?Bl5&8BOr;sBk)7!Df0!(Gmt)i$>"6#A7]R"-Y["+GAhM4
-QjNS:-pQUA7]RgFCcS=DfT@t$>sEq+EVI>Ci<f+B4Z0--Y["+GAhM4-QjO,67sC)DfTA2BlbD-
ASbq"ARlon@;]t$F<G4-F:AQd$;No?+DG_7ATDl80eb:(GAhM4F!,17FDi:4Bk)7!Df0!(Gp$O5
A0>DoCh7^"+EV:.D%-h#GAhM4H#R\?F$2Q,4<cL&-[0KLA9i-4D^QYY+u(2_Che*6F<Dbg+=o,f
BeCM_0JFpu4ZX]?0JFUo+?Uc(+Z_J'4==iOD0Ko=A1%fnATAo8D/a<0@j#`5F<GdGEb'H7Df9\+
$>"6#A7]R"GAhM4H#R\?Et&Hc$;No?+EqO9C`mV6F<G%(+CS_qAKZ)5+D58-+CT/5+Co&"ATVKo
+EqaEA9/1eDImi2FDYu5Ddso&ATT%C0ebg:GAhM4H#R\?F")H[DfTB6E,TZ9%13OO:-pQUA7]Rg
FCcS'Cht57AS,LoASu!hF!+n/A0>AqARfKuFD,62+CT;%+D5V1AISuXEZd(k+Co&"+EqaEA9i-4
DfZ?pDImi2F`fi.+E_a:F!,[FEb'H7Df9\+$4R>;67sC$AS5RlATD4$AKZ#)An?!oDI[7!%14g4
>9GUBB5DKqF!a'nGAhM4H#R\?Et&Hc$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQUEb00.ASrW!
DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eG@<6-m3B9*,%16WWF*)G@H$!V=FC])qFD5Z2@<-'nF&#%S.V*+3FE2;FFCfN8A8,Oq
Bl@ltEbT*++ET1e+Co&)FE2;FF!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?<%15is/e&._67sBhF)uJ@
ATKmT-u*[2FCfN8ATB4BBlbD*+Dbt)A0>r'EbTK7%15is/g)8G$;No?+CTD7BQ%oP+<X9pBPnq\
/g*JhCLqMq$;No?+CfG'@<?'k3Zp130emNRGqh)a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>GTgDg!lj+=M8IEc5l<
.3N&0A7]9o/KeqLG9CpKDK?q=DBN"pDId[0F!+n/A0=Q[DKU15$;No?+>GfiF`&rg+C\c#Bk&8q
Df00$B-;;-F*&O5A7T7^%13OO@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUBlbCh:IJ/N;cFlLDf00$
B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(<(0_b-OgCl$;No?+EV19F<G^JBl%i5
Ci<`m+DG_8D]gHBC2[W3+Dbt+@;KKa$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+Co%qBl7K)FCfN8+E_d?Ci^$mFCfN8ASu[*Ec5i4ASuT4-YI@9
A1'Gd8l%i&%13OO:-pQUF`)52B5)F/ATAo%DL!@HATMs.De'u$Bk)7!Df0!(Bk;>p$9ieh+@Jdg
<)Yq@+>b3ZA0<6I%14g4>9H=*6W?uI3Zp."E+rft+@Jdg<)X550d'[CF(fK9E+*g/+@Jdg<)Yq@
+=MRh+u(3.8OHHU.3Kja+=f&t+u(2g/35/#ATMs.De(4E+@Rn*5'nn+0d&kU6W?tn$8EZ-+>Y-\
AS5O#4s36b6W?tn$4R>;67sBkATMs6Dg<I6Cht5(F`MM6DKI"9De*s$F*&O8Bk)7!Df0!(Bk;>p
$;No?+AQisANCrUBOr<8C2[X)ATMr9Ec5l<+Dl7BF<G%(+EM+9+>"^YF(HId+Cf>-Anbn#Eb-@&
$;+)^<(0_b;GU(f4ZX^#E+*j%+=DV1:IJ/N;cG+R$4R>;67sB\:.$.JBl7I"GB4mEATW-7Ebce<
Df9_,$;No?+A,Et<(0_b;GU(f4ZX]5>[2,W@q0CbF"f:QF`V,7F'NHj@UX%`Ea3?tA9;C(F>5-P
$4R=s+Bot/D/sQ5F<F1O6rZTR<)QLf<"00D$;No?+B1d.<$5+>6UO:@;asb\%13OO:-pQUEb00.
ASrW!DL!@8Bk)7!Df0!(Bk;>p$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&
4EPFZCi<fj5s[eYEaa$&3B9*,%16W[A5d>`CLo1R:-pQ_A8,RQD/X3$0JFVk/M/(nA8,R'+EMC<
CLnW1ATMrG%15is/e&._67sBhF)uJ@ATKmT%15is/e&._67sB'+>G;fF*(i.A79Lh+A*bqEc5Q(
Ch4%_:-pQU+<WEg+=LuCA9;C(FCfJA+Eh=:@WNZ#G%#*$@:F%a%15is/g)8Z1FXGE76s=C;FshV
+EV19F<G+.F(9<+Df0!(Bk;?H%15is/g)8Z+<VdTFCfN8C2[W:0J">gATMs.De(OV/0K%GF*)/8
A2,bh+EV19FD>`)0eb:1+:SZQ67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW)0QUfE0JO"D:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0K3NR@kftd@rH7.ATDm(A0>u4+DNee0JXbC:IGX!
:-pQU0emQaFtks!F`:l"FCeu*AoD]48iJCsBl8'<%15is/g)l+C3=>H3?W?RDIIBnA0<:2Bk1.Z
Deio<0I\,VEc5e;-tI%&6=FqL@k]Sk.3K',:-pQU+<VdL+<VdLEcl7BBl5&.F`(t;Ci<flCh4%_
:-pQU0fX#YGqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2
@<-'nF!hD(%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIG
D/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr
$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b
+B)6*;H/&r%13OOFC])qF?MZ--Zip@FD>`)0JFj`$4R>;67sC&BOr;sBk)7!Df0!(Gp$g3ASuU(
Anba`FD5Z2+Eh=:@N[(0Bk/Y8BkM=%Eb0;7Blk_D+CT;'F_t]-FE9&D$>"6#De'u4A8,Oq%16Ze
+Co1s+>=63%15is/g,%SD.7's+E(j7A8,OqBl@ltEbT*++E)-?E+*j%+Dl7BF<GF/FCStn$8EYd
+<r"W/g+\=A0<Q8$4R>REZf:2+?MV3FCfN8C2[W:0d(RLF*)/8A2,b\FCfN8C2[W;0JFj`$4R>!
+?^hl+FPjbA8,Qs0F\?u$>"6#FZhc.0Han?A0<Q8$8iqh+<r!`+E2%)CERaB+AP6U+DG_'Cis9"
F!,.-@:Wqi%13OOATAnL+E(d54$%IoBk)69-QmMBF*)/8A2,bl-OgDoEZfKf3ZqsIA0?=D0F\@F
+?^hl+>G!XBk(p$FU\Ze$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1
Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?Y"%j;f-GgAM>f567s`uDJW6g
Deio<0HbHh/KcHPDJUaEF)>i2AKZ)+F*)IU%15is/e&._67sBJBOt[hF!)T6Cht4:FD,5.G%#3$
A0<"'EbBN3ASuT4+Cei$ATJt:De:+7-tI43.4u_c:3CDbEc6)A%15is/g)?UARTUqGp$U8EcP`$
F<ViADK]H)Bk/>r@<6"$+CT;%+CT)-D]j.5F*(u(/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._
67sB'+>G;f.!0$AFD>`)0JFpuA8,OqBl@ltEd8*$:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*Jh
CLqMq$;No?+CfG'@<?'k3Zp130f<]gCbd[R$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUa+E_X6@<?'k+EVNE
@rHC.ATMg/DIal3D`T"]FEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.$4R>PDe!p1Eb0-1+=CW,
F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe9
5s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#
FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8B
F*)/8A2#\b%13OOATAo3A0>u)Bk)5o$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ+EV19
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
E-#T46=FqL@k]V[F=f'e@UX=l@j!11E-#T4.3NS<Ea`frFCfJ8F(KGH@q]:gB4W3-ATMs7/db??
/db??/g+SDF*2>2F#jY'67rU?67sB'+>G;fFCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpuAU%p1
FE9&A:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhE1,(F<DJs\R0FCQA
/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+$;No?+>Gim@<jU_+Au!2<(9YW6q'urFCfN8F!+n%A7]9Y$=e!aF`MM6DKI!K@UX=h-OOm*
EHPu9AKW@8De*s$F*(u6-OL2U67sC)DfTV9Bl5&'Ch7$q+C\c#AKYo3+EVX4F(c\4De!3lAI;p`
ARTU%-RT6.@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#
AKX)_5s[eYEaa$&3B9)I$=e!gDKBB0F<DrFC2[W1$4:ldF*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr
6mi=:67sB4HW3F4<$5+=5uL[1/IDi,A8,Oq4ZX]5FCfN8C2[W:0II27ATAnK+E(d5FC])qF<D\K
+<VdL+<Ve%67sC!E+No0;FNl>:JOSd$>sEq+CoG4ATT%B5uU-B8N8RT4#%j#:-pQU@ps7mDfd+3
BOPdkAKYr#Ea`frFCfJ"$;No?+ED%3E+No0Bl8!7Eb-@k76s=C;FshV$>"6#De'u4A8,Oq+BosE
+E(d5-RT74EZen3F(KG9-W3B!6s!8X<(//AATAo(E-#T4+=BHR6V0j/2((I?$>"6#A8lU$F<Dr/
78uQE:-hB=-Ta$i$;No?+DkP&AKZ#)@:UL!DJXS@/KeP:@;]^h+EqO9C`m=uBl",fEZen3F(KG9
-W3B!6r-QO=XOPoATAo(E-#T4+=BHR6V0j/2((I?$49Np/g,1GDfB9*+>"^HBk)7!Df0!(Gp$gB
+AtWo6r-QO=UJ_\+E(d5FC])qF<Fd11E^UH+=ANDDImi2A8lU$F<Dqs;aX,J3&N'F0FA.^67sBp
DKBr@AKZ)+F*&O;Ec6)>+D#e3F*)I1ATAo(E-#T4+=C&U5t"dP8Q8,+$8EZ-+>P'MAS`J:FCfN8
B6%p5E$kuf67sC'F(oN)+EqaEA9/l-DBNb6@:Wq[+DPh*+Cf4rF)q\"EZc`<C2[WnDdk(:E-67F
DJWZgC2[WnDdm&r-RT74EZf"8E$-NMATMs+Ec6)>-Tc3^?X[\fA7TUf?Q^^D$49Np/g,1GCghF"
G%De:Df9`=+C\npBl5&;Bln#2-[mEMATAo(E-#T4+=C&_:K0eZ9LM<I-T`\B5t"UH:K/\K$;No?
+CTA6ASlC.+EVNED..3k+D5_5F`8IIBl%T.AmoCi+C\nl@<HX&+E(j7@UWdiEc5l<$>sEq+Dkq9
+=D8BF*)&8Dfp"H$49Np/g,1GF(KG9FDi:F@;KXg+EDC=F<G"0A0>o(D..3k+>"^MDKBr@AKZ)'
EbAs*+D,P.A7]d(AU%p1FE7dD+Bot*@;BFbBl[QhC2[Wi+?XCX@<?0*-[nZ`6rZTR<%i?)F*(r3
F(KG@$>"6#A8lU$F<Dr/:JXqZ:J=/F;C=ORIS*C(<(0_b06CcHFC]?3ATT:,ATAo1Ci^^HFCfN8
B6%p5E$ku"$;No?+>%q>78m/.;cQ1P78m,S<D7fm$>"6hDfB9*+>=-0@rGk"EcP`/F<Dr?@<6!-
$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?Y*bHD/X3$0JH6g/h1FC;f-GgAM>e\F=f'eF)>i2
AKW+;ATMs7+E(j7-tQp<+=M,9D.P8&@r,RpF'U>=AU&;G+<Yc7@VfTb$;No?+D#(tFD5W*/e&._
67r]S:-pQU-tQp<+EV19FE8RFAT;j,Eb-A1DfTD3F`V,7+DG_8ATDs*DKKT2DBO%7@;[3)@;^?5
DffZ(EZdtM6k'Ju67sC&ATMs7/g)9&F!)TIBOr;/FCfN8F!)TGF`&<EFD,62+<Y`E@<ZT3+<YfJ
ATAn9GA1r*Dg-7F+=M/K%15is/g+hQE+O'+Bl7^-+DG^98k;l0+EV:*F<GFCF*&O6AKYQ/@;T^r
ARlolDIal"Ci=B+A1e;u:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<WBf+=M>CF*)/8A2#\d
+Co1rFD5Z2@<-W&$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg
0JPG"F_ifn%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1E^gZA79RkA0>u4+Cf>1Eb0<2Df0).FDj2_EccCG
-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$
F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]55s[eXD/X3$3B9)I+BosuDe3rt
F(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172gF*(u2G%ku8DJ`s&F<DrDDf9/6
4"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3ZoelATMs.De(OU-OgCl$>"6#De'u4
A8,Oq+BosE+E(d5-RT?1%15is/g+kGF(KB6+=M/OATE!8Blmo8+EqaEA9/l3Afu8*EbTH7F!,RM
E+O)"$=[plCgq=.4ZX]>%16]`Ddda)AN`'s0f_08,p5Dp1E\Fq1*@hb2`D0Q8SDOUAOC->Ea`I"
ATBpp+=Ci@G9CaF@q[!/Df9//GAhV?A0>;'GAhD1+Cf)-@r!2sBQ[g#-OgDnDfoN*AT2I.F*2A5
Df9/L3Zoq6+@%&"3XlF)D/a',A8cQQ3Zob%%17;s@;TRs4ZX]I3[\BTDerm$Gp$^8Ddda)AKXQX
@<Q3LBOPpi@ru:&+CoD5@VfUpCisfADJ*m+A0>;tE+O'#Dfd?9$9g.jFDYu5Ddso/F`\aMDIIBn
Et&I?0RImq4ZX]>+>GPmB4Z0-GA^i+ATJ:f%15is/g+_9BlkJADfTA2-uNI1ALq>-@<6K@FCf]=
.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(tFDl1B0d&%j-S.>5HZs@9D.Rc2>9IKf+?M<)
F>+.2%15is/g+kGF(KB6+EV19FE8R5DIakuDIal,@:O=rEt&I?0RGMsE-67F-Zip@FCB!)BONSK
-T`\N67sBpDJjB&Dfp+DFCf]=-OgDH0RGMsE-67F-Zip@FCB!)BONSL-T`\N67sBpDJjB&Dfp+D
FCf]=-OgDH0RGMsE-67F-Zip@FCB!)BONSM-T`\N67sBpDJjB&Dfp+DFCf]=-OgDH0RGW!E-67F
-Z*:%Ec5B&E+iZ60IJq;0fpa;+=eQh-OgDH0RGW!E-67F-Z*:%Ec5B&E+iZ60df%<0fpa;+=eQh
-OgCl$9g.jF>5p>+>G!OATT&:DIIBnF$2Q,I4cWs+CoA++=D8BF*(i,E+iZ6-OgCl$;No?+D#(t
F<G[:F*&gJ@;TR,FCf]=.3N_@@VfTb$8EZ-+EM47GApu3F!)i?BOt[h+D#(tFDl1B1*A.k-S.>5
HZX.6D.Rc2>9IKf+?M<)F>443%159QHZV#+3Zp7%B4Z0-D/Nd!ATL!q+FPjb1a$=HC`k*B@:O=r
@;Kmr@5'&<$4R>;67sBlA8--.D.-ppD]gHG@;TR,@rGmh/9GHJF=A>S@:F%a%14g4>9J!#Dg-//
F)rHO@q]F`CER2!Bln96+>Y,l+=A^%0RIYS@;TRs+Bot"A0<rgHZV"P$4R=O$>"6#1E^UH+EV..
@rr.e%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-
%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E8DdmcS@<6-m0JG4V67sa#Ci<d(6=FqL@k]Sk
+ET1e+<Y-%F(o,,-td@7@WNt@FCfN8F"Rn/:-pQB$;No?+B2onFE8R5+D,%rCisc0+DG^9G%#3$
A0>buD.Oi$G][t7@ruF'DBNJ(F(9-3ATD?m+EqL1D@HqJ67sBsDdd0jDJ()5Df'&.De:+YDdjhU
ATD["@r$?;F!+'t@rGmh+DG_8D]hY)+<V+#:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq
$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/O`$;No?+>GTgDg!ll+E_X6@<?'k+D,P4+A+RG9PJBeGRY!T67sB83,N)L1,C%qE+EC!
ARlp*D]iP.EcP`4E,TW)+EVN_+EDRG+=CZ>ART[lFCfN8A8,OqBl@ltEbT*+-OgCl$=e!aF`MM6
DKI!K@UX=h-OgE'AT;j,Eb-@@C2[X)ATMs)E[M;'%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E
3B:G03Zoe95s\sgF(o,E3B8H0>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs
-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$4R>;
67sBjEb/[$AKYD(G%G]'+EqOABHV22+D5M/@UX'qG%#E*@:F%a+ED%*ATD@"@qB^6%15is/g+S=
C`mh5AKYE&F(o9)ARlp$@;TRs+CT;%+Eh16BlA-8+A*bdDf0W<@;^1.+:SZQ67sBuDf0,/F(fK7
Ch+YsE,]AsEZee3+DtV)ATJu<BOu'(-td@7@WNt@BlbD*E,]W-ARmD&$?Tj#FCT6,F*(i.FE9T+
+>Y-$+>=63@6H4c?SQ:M%16Q-/g+L[GW-'=@m)Fe1,Er.%16W//g+LUAN(&*Aj%ah?SQ"E2[p+*
4Y@j41O'?9Aj%ah1iPD`$7QDk%15is/g,4KDfol,+C\n)ASlC.Gp$a9Ddm-k+Dbb5F<E.XEb/io
EZfIB+DtV)AKY])+EV13E$/t8@ps1b%14dP,<gH8+D5M/@WNY>FCfN8@rH7+FCB'/F'g:GFDYu5
Ddt=G?RH9i%16Ze@<6!&-Zip@FCT6,F*(i.FE8f=$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8
ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s\sgF(o,E3B:FU
$>40n@WPIbDeioMF)u&.DD3au:-pQ_B5DKqF&QpoCLoeQF(o9)0JG1'+<YbX/Kc/YBl7HqEb/a&
+<Y*6F(o9)D.RU,+<YT7+<Ve>Ci<ckC^g_H67sC'DK0f;FCeu*DIIBn+Dbb5F<GI>F`)7Q%15is
/e&._67sBLEcQ)=+Co2-@rHO%Eb/c(A9Dp,DJ()7F(HJ4Afs]A6m-Dc+>>eu:LeJh1,(F?+>GW4
2)I?N0b"Ib67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*2/cuH
0KBRL:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=:-pQU0fNrXGqh&sAnc-kCi"A>AncK4FD,B0+Du=9F(&rrAISuA67sB82f2uK
0f:(^A7Qg$G%G]7Bk1ctFCAf)-seq`4ZX#Z:-pQU0fX#YGqq/u@q]:gB4W3(G%G]7Bk1ctFCAf)
FDi9M4?=oS3Zp!sF(Jo*DJsZ8+AGF0779pP78aR%%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR
+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4
-YI@9A1'Gd8l%i&4#%0O:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g,%M+Dkh;ARlolF)u&.DJ`s&
FE7luD/"6+A4^ZLBl[cpF?sthBkM<ZCG7n41a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%16]i
DI[I-4Y@j)H>dqJ?W2/WB4!"q$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$=Q(M+?0f;@Qcap2E!H9%14Nn
$4R>;67sBuD]in2G\(D.@<6L(B5VQtDKKqB@;]TuEb/d(DId0nF<GO2Eb0-1BOu6rEt&InBm=3"
8T&'QEb/a&6$%*]B5UL\0g.QS+?CW!%14L39kAE[De).SB6A'&DKKqK.6T:+0F\A$F`(])Gs*c&
-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14L3-n&PIChtOL.4ID@+=CZ;G@GK9-OgD3
%13OO:-pQUD/"6+A0><%F(o9)D.RU,F!)lCF`(\<+DGm>F`V,)+C]82BHV,0@ps1iGp$O5A0>N$
Ddm-kCj?HsD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0KhHR+?CW!%16]iDIYg^+=DJRF`^thG@>,k
-OgD2Ap&!$.6T^7>9GF=0H_hf>n%,i%13OO:-pQUFD,6+AKYE%AKYi(G\(D.@<6L(B5VQtDKKqB
@V'%XF`V+:-t[U>@jrO<@;TQb$;No?+DGm>@W-@%+Dbt+@;Kb*+CT.u+D5M/@UX(hGp$O:F(o9)
ARlp*BPDN1BlbD8CCLVG67sBpDBMOo@Wcc8F)5c6E-WRD@;TQuF`V+:@<3Q'@<*K!F!+(N6m-2b
+Cf>-@qB[uARl5WD/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=0g.QS+?CW!%14LXATVU(A3k6KF_t]-
FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R><G%G]7
Bk1dHDIdI%ARfgJF)u&.DD=:81a"h%0F\@a67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn
3[m3Q%14LXATVU(A3k6KF_t]-FE8lo/g)hW$>+Eu@m)Fe-[K]RFC.sj@:rpp%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R>;67sBnCi<d(+Dbt7CNCV1DfQtEDfTA2G%#30ATJu.DBNCsF(HJ1De!3l
AKVEh:-pQU@X0),AS,@nCige9Df9D6Bl5&8ATMr9Ci<flCh4`$DfQtBBPDN1FCfN8%13OO:-pQU
Eb0?8Ec,q@@rHC.ARfg)Eb0<7Cig*nATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DGP%%?U6tD
F)>i2AN;b2?RH9iATAnJ0d(+FDdmc1-Z*RBARnAMA8-'q@rt"XF(o9):MVXk5s[eXD/X3$3B9*,
-OgDoEZf"2Ddmc1-Z*RBARnAMA8-'q@rt"XF(o9):MV[l5s[eXD/X3$3B9*,-OgDoEZd(k+D5M/
@WNY>D/"6+A4^ZLBl[cpF?sthBkM<ZCGB0^5s]R/DeioE3B:Fo%13OO:-pQUA7]jo@rri1Bm=3"
+DG_(Bl[cpF<G"5F(o9)D.RU,+DtV)AKZ,:AISuaATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.
DFJSdDfRO=5s[eXD/X3$3B9*,-OgE#ATAo+Ci<d(+=D#?G\(DWDIdI%ARfgJF)u&.DFJSdDfRR>
5s[eXD/X3$3B9*,-OgCl$;No?+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKq/$>"6#B5DKqF!)i+
G%G]7Bk1dHDIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%16Ze+>GSnB5DKqF!)i+G%G]7Bk1dH
DIdI%ARfgJF)u&.DD>Ka5s]R/DeioE3B:Fo%13OO:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6h
DfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,B5DKq
F&QpoCLonP@k]T367sa#Ci<d(;f-GgAOLHH0JFVk/M/(nB5DKqF"&5BDe!p,ASuT4Ao_<mD.RU,
+EV19F=n[F$;No?%15is/g+,)F*(u(+DkP/ATDKnC`mY+@s)g5+DG^9C2[W8E+EQ5+A$HlF`M%9
BlkJADfTW7/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW*
3,N)L1,KFI:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>P
De!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/
DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is
/g)`m<(0_b+B)6*;H/&r%13OOD/"6+A79P#BkM=#ASuTQ3Zp4$3Zp*c$;No?+A!\h@<Q3)@3BE$
G\(D.B5DKq@;I&pDIal+De!3l+CT>4BkM=#ASuTB+B<K*@;Kb*/0K%JBlbD2Et&IO67sC"Df9Y=
DIIBn+Cf)'Bk(]s@Wcc8FD,6+AKYE%AKYW(De'u2ARTXuDK?q4DfQtAF^o)-@<6L(B5VQtDKKqP
%16u]D.RcO/g*5:-[0,E@<,p%B5_L%B-;;7+C\n)B5DKq@;L!4%14M$@;TRs.6T^74==WT@;]Ue
F*),6AKYW%Ddm-k-OgD3%13OO@rH6sF`V87B0A9u1E\_$0F\@a67sBhCi"$6+Dkh;ARlolF)u&.
DJ`s&FE8QQ4?=oS3XlF;@rH<tCh7[/4Y@j>-Y$k3?ZT^qE+s3&?YORgF)PE.DI7U+CLnk&$7Kt*
DfB9(ATMoA4ZX^,@rH<tCh7[/%14Nn$4R>;67sBtBm=3"+CT>4BkM=#ASuT4FE2).B4Z+)+D#S6
DfQ9oDImi2B5DKqF!)iIBm=3"@<6L(B5VQtDKK5O5s]R/DeioE3B:Fo%13OO:-pQUDg#]4EbT&q
+EV%)+CT)&Dg-7FD/"6+A0><%F(o9)D.RU,Et&IfEZf"2Ddmc1-Y%(4Ap&0/DJ*<B5s]R/DeioE
3B:Fo%13OO%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E>E)UUlCLo1R:-pQ_B6%riD/X3$0JFVk
/M/(nB6%r?+CfG'@<?''ASlC.Gp$a?Dfp#?/e&._67r]S:-pQU@<6L4D.RcL+:SZQ67r]S:-pQU
+<Vd].3N_DF*&O8Bk)7!Df0!(Gp"MWATMs.De(OU.3N2HBleB;%15is/g)8Z+>PAg;FNl>=&MUh
73HPlF<G+.@ruF'DIIR2+E)41DCuA*:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?
+CfG'@<?'k3Zp130fX#YGqq/b$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoB
A9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEo
ATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?
De(4W-V@0&-OgDX67sB4HW3F4<$5+=5uL[1/I`$r$?Tfm@rsjp+=D8BF*)/8A2#\b%13OO:-pQU
DfB9*+CT.u+DG_7F`M%9;FNl>=&MUh71BT8EZf:2+EV..@rrht+>Y-YA0<!B-OgDoEZen3F(KG9
-W3B!6s!8X<(//D$4R>;67sBjEb/[$AKYQ$E--@JB6%p5E"*.cEZf"8E$.7jB6%p5E,Kf7CbR4G
$4R>;67sBjEb/[$AKYQ$E--@JB6%p5E$-_TFD,B0+D,P4D'3b,@s)g5+CoV8Bl7Q+A9Da.+ED%7
FDl22F!,C5+D#D/FEo!AEc6)>Et&IfEZf"8E$-N@Ec6)>DKTc30df%1-OgCl$;No?+Dl7;FD5]1
AKYl5Ci"/8FDku,Eaa'$A.8lWEZf"8E$-N@Ec6)>DKTc31+,.2-T`\'/7CRj4D?E%%13OO%15is
/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#
AKX*WD/a<0@p_Mf6$$m]CLoLd3F?E>E,9616=FqL@k]W467sa#Ec>i/F@'DWBk&hO+ET1e+C\c#
Bk&9-ATMr9AoD]4D..-r+DPh*Ch\!&Eaa'$+Eh=:@N[(3Ec>i/F=AgO$;No?%15is/g,=KEaiI!
Bl,mR@<6L4D.Rc2-u*[2Ch\!&Eaa'$.3KaADIak<C2[W3+DGm>Ci<`mARl5W:-pQB$;No?+CTD7
BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp130f!ZWF>,]a$;No?+>#/s/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`
@s)g4ASuT4-XpM*AL@ooEb065Bl[c-+<W%HDe*s$F*(u6+DPh*Ch\!&Eaa'$-OgDmDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Gr
$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1ATDl8+=CT4De*ZuFCfK$FCcg/$4R>aATMs)DK]`7Df0E'
DKI!KB5_^!-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R=s+BosE+E(d5-RT?1ATAo3A0<rp
-YdR1A7]p,C2[W*F`_>6F!hD(ATAo7ATV[*A8Gt%ATD4$AKW@13\PSdD/^j3$4R>;67sBnASu("
@<?''CghEsGT^U:EZee,C`mA2Dfp#?+E)-?E+*j%+>"^E+CfG7DI[?kEX`@;HS-Ks+EM47GApu3
F!,+9E,961-9`Q#/g+eIE$m"B$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:G_Ddd0TD/X3$FCfN8
0MXqe.Vs$3A5d>`CLqU!F*')Y+ET1e+<YK=@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+E(_(ARfh'
+<YB9FDhTq:-pQU.!0$AFD>`)0JFq.%15is/e&._67sB[BPDN1FCfN8+EM%5BlJ/:BlbC>FEqh>
@ps1iGp%-MDBNY2F(o/r+E)@8ATAo8ATMr9F(96)E--.R%15is/g*`-+EM47F_kS2DJsV>+CT).
ATAn9FD,5.+EDUBDJ=!$+Dbt+@;KKtBOu'kAKY]/+<YK/@r$-.FD,4p$;No?+E_aJ@;I'.ATMr9
F(KH9E$/S,A0>u*@<*K$Dg-(O%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0e"4nFCfN8
C2[W:0I\,TBk)7!Df0!(Gmt*U67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*2.:W?0K'@I:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0fX#YGqq3!F`:l"FCeu*AoD]48g$)G0K1+qAS!nF
EccCG-Y%1.@<?(&ATMs(Bk)7!Df0!(Bk;?5%13OO4tq>%A0<7AATMs.De(OU-QlV91E^UH+=ANG
$4R>;67sC)DfTB0+E(j7G%#E*Dfp+DFEqh:Et&IC:JXYM<)64B4ZX]>%15Et:J=&R:JEQ,3Zp-d
$:7Na9MA#V<'<8b5;"'50JF_,%15Et:J=_R6;0g23ZpX>+>k8r1E[qc1(=R"$;!ul5u^WS0KhH>
0b"I]:/k1Y6;0g23ZpX>+>k8t,V^u,%13OO7SHTD<(ok^<'<8b2`E?L3?TUj5;"'70JF_,1CX[#
$:@?M;G9Y\<'<8b-V5FhD'4%9@<<V`+CT+0@V'%XF`V+:8K_P^+EqL-F<F-tA8`h)$4R>@=\Vj]
69R@P1E\V8+=&(N3ZodmG@_n*Eb-A7H#7#/Ci^_-DIal3BOQ!*BlbD/Bl7K0%13OO6;L]^<)lCW
4ZX]64@2h>9MA#V<%0@H4@W"?5u^NL;cG1s4B#BW<'`h[$4R>;67sC%FDl22+Dbt+@;KKtGAhM4
F!,1/+E2@4F(K62%14L>+?CW!.46JP$>F*)+<tc??U6tDF)>i2AN;b2?Qa&81a$=I/e&.1+?hK+
-UC$aF)>i2AN;b2-QmANF<GI;?U6tDF)>i2AN;b2?Qa&81^se'Cia0%AhG2NDJUG0/i4\]D_;J+
+<Wj%HZ4+L+Du!<BeD4O$>"$pASGa/+CoCC%144#0H_JI$>"*c/e&.:%13OO:-pQU@3BZ'F*%iu
4tq=<+E2IF+=D5IDeio<<+U,m0IJq00d&V%0d'4X/g,7IF*&OG@rc:&F=.M)%15is/g+RFAn?0/
B6%p5E,uHq4tq=rEc<-K@W-1$F)>i2AM>Jn+?MV36;LBN5u^WS0H`\X:J=&R:JEPd6;LBN<'`iE
74/NO4tq=rEc<-KBl8$6D/X3$0IJq)4$"`\:/jMY:JEMc8PW5a5se76-OgCl$;No?+EMI<AKYhu
@rcL/%159QHScjaF`\`RF)>i2AM?he@rcKA-Ta(<4""_p+>P`#%159QHScjaF`\`RF)>i2AM?he
@rcKB-Ta(<4"!ci/g*_.A8`T.DffZ,DJ()$F`\aE@q0Y#Gp%0I@:Nk$+A!\aD'370Ch[?iEa`c-
-OgCl$;No?+DbUtG%De,Bk)7!Df0!(Gp%$EASqqaCi<`m;f-GgATVL)F>6NW/h1[U@:W;RDeip+
ATMrJ+ET1e+<YK=@:UKh+EMC.Cht5(Des6$@ruF'DBNk0+<YT3C1UmsF!)T>DKKe+$;No?+=M>C
F*)/8A2#\d/e&._67r]S:-pQU<+oue+<Yc;F*&NIF(96)E-*3FCh[Zr+=M&E@:W;RDeip+ATMrI
.3KaIF!)TIH#RJ-@;Kb*+<Y]ID@HqJ67sBpDKBN&AKYo5BOu3,FCfN8+<Y`8EbTK7F"SS,F<GX<
Dfol,+Du+>+<Y*/FCfJ8FD,5.+EDUBDJ=!$%15is/g+tK@ps1b+D>>(@q?csF<GC.@r$-.FD,5.
F`V\6C`mh2F*&OGATW'6+CT.u+EV1'EZen2GA]#B$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?
+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@
EX`@N67sBjEb/[$ARmhE1,(F?@<H3:2@U!g67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+rE+EC!AKYT'EZdss
3%cmD+EM+*3ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(%159QHZ*F;-Zip@FD>`)0JFjs
>9G^EDe't<-OgCl$;No?+EqaEA9/l3Afu8*EbTH7F!,RME+O)"$=[plCdD#r9e\^k+>=63@W-1$
5u^WS0g.Q?0b"J!Df9Gc8Q/SO3ZpX>+>GQ(,;K]8@W-1$<'`iE76N[S5;"'9+>GYp,TniO$4R>V
DKJ0D:JEN+3Zp-d$>FC"<'`iE76N[S5;"'9+>Y8t0JEqC%16]`Ddd`]8Q/SO3Zp@?/ibp7,p5E)
+>Y]*,;M%a$4R>PBOPpT8Q/SO3ZoeA+CT+0GA(E,+A!\aD'3;!@psM$AKXPeA8`T7BOQ!*8K_P^
-OgCl$?LK0<'`i63Zp4$2`Dj)+EKRd-QmVE+CT;%+EMgF@W-((+CT.u+EV:*F<G:=+D,>*AL@oo
%16Q_GZ.RA7RfO%+=K?=:JXYX8Q/S;/1<VM9M[rR9M&/^.4dS[=\Vj]64F82$;No?+EMXCEb-A0
De!3lAKZ28Eb'56BkAK,Eb0<'DKH<p-o2u,+>>5l-OgDsAhG2NDJWZG5s]R/DeioE3B:FhBeD4b
A8a(0$6UHT0RG055s]R/DeioE3B8H0E-67FDJWZG5s]R/DeioE3B:FhBeD4O$>"$pASGa/+<tc?
+DEGb+CoCC%144#4tq>&F`\aDC`mFE1^se'Cia0%AhG3:D_;J++<W?\+:SZhDIb@/$7QDk%15is
/g,4RD.Oi3ATMs7%159QHSHX^F`\`RF)>i2AMI.qF*')`4!ua*4WlI%:-pQUFCfN8+EM%5BlJ/A
%159QHSHX^F`\`RF)>i2AMI.qF*',a4!ud+4WlL&:-pQUFCfN8+EM%5BlJ/A%13OO:-pQU@3B/n
G9CO=Dfp#?%159QHY7A<+=CW:DesK3Deio=-T`G43[\BTDeq^=:JEMc@W-1$5u^WS0d'qDDerB=
6;0fq%159QHY7A<+=Cl@FE;;;CLo4J4!6UG-Y[I?5u^WS0Hb(IFAtOm9LU<<$4R>;67sBh+EM[>
FCbmg4tq=>+D5_6+=D5QBlmp-D/X3$0df%*4$"a1D/X3$0iV_*F>+hYD/X3$0iV_*F>5-P$4R>;
67sC%Df'&.D.-ppDfZ?p4tq=?+E2IF+=D5IDeio=9jqOPD_NP#1,1j<BeCM`1FEV=4tq=?+E2IF
+=D5IDeio=9jqOPD_WV$1,1j<:-pQU8K_P^+Du+>BPD?s+C]J8+E(b"F`;UKF)YPtAM,)s+CT+0
@3BB#@V'RgC`t/8$4R>;67sBsARTan+Co1rFD5Z2@<-W9DfB9*Ci<`mA9Da.;f-GgAM>f567sa(
Ddd0eF_u(rD/X3$0JFVk/M/)UF_u(?F(96)E-*4CASc9nA8,po+EMC<CLnW1ATMs7/e&._67r]S
:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9%15is/g)8Z
+<VeIAS5Nr-Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8C2[W:0II;::-pQU+:SZQ67sBh
F`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F?De!lC2%9mf67sBjBOPdkATKmT
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB8
3,N)L1,^7tE+EC!ARloqDfQsm+?1u-2^!0QANCrSFEAWQ@rc-hFCfQ*F*(r,@ruF'DIIR"ATK4.
$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?
5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'
Ec`EOBkhQs-OgCl$;No?+ELt7AKZ&2Deio,Ci<`m+EV19F<GX7EbTK7Et&Is@j"tu-ZW]>Ci<`m
;f-GgALBW%+>G!OATT%V3[\`^@:W;RDeip+ATMrI+Dbt)A5d>`CLqU!F*',a%14M1/g<"mCi<`m
;f-GgALTc'+F?-n0d(:N@:W;RDeinn$7I_S3]/cD+?MV3Eap5.Ddd0TD/X3$-OgCl$?Tj#FCf?5
Bl\-0D.RU,+=Cf?De(4W-V@0&-OgCl$9g.jDe't<FCfN8C2[W:0IIuI+>Y-YA0<6I%13OO:-pQU
FEMVA+E(k(+EV=7ATMs%D/aP*$9g.jA8lU$F<Dr/78uQE:-hB=-Ta!k$4R>;67sBkASbq"AKYDt
C`mq?Eb'5B+D5_5F`;CQ+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!
4s4cQF!,"2CaLbu+=JIQ@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+Dbt)A0>f"C1UmsF!,17FDi:D
ATMr9A8,OqBl@ltEd8*$0d'[C-n$bm3\`<B.3LZ4+C?ia.3NGF@:W;RDeip+ATMrI%14g4>9G=B
0HiJ30JFpu3]\Bj0fga+Ci<`m;f-GgATVL)F>443%15is/g+\ID/^V-F`MM6DKI"0DIal1ASc9n
A.8lVAj&0tD..3k+=ANZ+:SZ4+Bos:-nlf*0I\,*3Zqca3[l1u3b2h3$4R>;67sC&F`M@BDf-\>
Bl.F&FCB$*F!+n/A0>E*D/_.KASc9nA.8l00RI>LF(KG9-W3B45tOg;7n"de0b"J#Aj&0tD..3k
+=ANZ+:SZ4+Bos:-nlf*0I\,*3Zqca3[l1u3b2h3$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8
ATD@#E+No00F\?u$7IVg+Z_G/+?V#\@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F?T@
@:XIkF*')i0k>!.FD5Z2@<-Wg67sa(Ddd0uATMrI0JR*P@ruF'DIIR2+ET1e+Dbt)A0<UO+EV19
F<G+.@ruF'DIIR2/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0emNRGqq&r-u!F7A18X8DKKH1Amo1\+Dbt+@;KKt@:Wn[A0>u4+C\c#AKYGjFD)d+$;No?+<VdL
+<VdL+=LuCA9;C(FCfJA+ED%5F_Pl--Y6ft$;No?+>GTgDg!lk+E_X6@<?'k+D,P4+A,Et+>>E.
/i5'f$;No?+>GTgDg!ll+=LoAF*)J7E%)oMASl@/ARm>7.!0$AF=A>CASbq"ARlo8+EM+*+C\nu
Dg)Wt:-pQU0f<]gDDF*mAn?'oBPD?s+=L3#F*'fa@ruF'DIIR27!3?c.3N5CDf$UFC2[X)ATMrB
+Co1rFD5Z2@<-W&$;No?+>GfiF`&rg+D,2,@q]RoB-8TpDe)dbF`Lu':gnHZ7!3?c.3N5CDf$UF
C2[X)ATMrB+Co1rFD5Z2@<-W&$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?
%13OO:-pQUBlbCh:IJ/N;cFlLDf00$B6A6+A3UM1/M8.nIS*C(<(0_b-Qk!%+DPk(FD)dEIS*C(
<(0_b-OgCl$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eYEaa$&3B9)I+BosuDe3rt
F(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g*b^6m-PhF`Lu'+EqaEA9/kF
+Dk\1B4Z-,E+*j%+Co1rFD5Z2@<-'nEt&IO67sBV@q/qgBl@ltCi"A>Eb0)rCLnW1BPDN1A9Da.
+EVNEFE1f"CER,#@;]^hF!,17+A,Et%15is/g*>3HYm2,AKXT`A5dDhEarZW@<?0NF_u(\3Zohc
E+*j%+=DV1:IJ/N;cG+n/13)cDe*fqFD*:@C3(a3$4R>;67sBmATVEq+EV19F<G+.@ruF'DIIR2
+Cf>-FCf?3F!,OGDfTE"+CT=6@3?!d:-pQUA9Da.+EM%5BlJ08+DG^9FD,5.-u*[2FCfN8.3N/4
G%GK.E,B0(F<G+.@ruF'DIIR2%159QHZ*F;4$"a(De*s$F*&O>De*BiFs(O<A0?#:Bl%i<+BosE
+E(d5-RT?1-ZW]>F(A^$-TsL51a$FBF<Dr1ATMr]Bk)7!Df0!(GsldlE$l)%.!mQj0d(OJ@<<q]
3Zrc1+u(3]A79Qh$7Bk(+EM(%F=044+>b3RATT%B8oJ6=Dfp)1APcfWBLHu[E$l)%.!mQj0d(OJ
@<<q]3Zrc1+u(3]A79Qh$9g.j1E^UH+=CoBA9;C(F=.M)%172gF*(u2G%ku8DJ`s&F<DrDDf9/6
4"!Wr6miEN%16Ze+E(d5-Zip@FD>`)0JOpa$4R>;67sBkASbq"AKYDtC`mq?Eb'5B+D5_5F`;CQ
+EV19FE8uUF*22=ATKCFD.-ppDfZ?p0d'[CDdmc1A7]R(4s2R&I4cj!4s4cQF!,"2CaLbu+=JIQ
@WO[b4<cI%BeCMc.3gr&-OgCl$;No?+Dbt)A0>u*F*&O8F_u(?F(96)E-*33$7I;V+Z_>30I\,*
3Zp+;.3MT$F*'fa@ruF'DIIR27!3?c%16T`@s)g4ASuT4FDYu5De!-?5s]U5@<6*B3B:FU$4R>;
67sC"@:O'qA8,OqBl@ltEd8dLD]j(3D/XT/+<k?-@:UQ)Anc'm+Cf>,E,TW*DKKq/$>"6#E+*6l
A0<7AATMs.De(OV-OgCl$;No?+EV:.+D,P.Ci=N3DJ()+DKBB0FE8RA@;^?5F(oN)Ch4`*Bl7K)
A7]glEbTK7Bl@m1+D,P4+EqaEA9/l;Bln$,F`\a:ATM@%BlJ0.Df0V=%16#s3Zr$UASrhY+>=om
+>Y-XDe404+=ANG$<')K+B'C-INU%$0I\,n3Zrc%+u(3=%16Ze+>=ot+E2IF+=MRh+u(3=.3L/o
+=K3'-9Nn)0H_Se4s525+u(3=.3Nsi-8%J)HTE?*+B&^V%15is/g,"BEbAr+Bl5%c:IH=HDfp)1
AIStp-nlf*0I\,*3Zp+;.3M6$A5dDhEarZW@<?0NF_u(,$=e!aF`MM6DKI"CD/a<0@p_Mf6$.-U
F(dQo3F<4&%15is/g+e<DImisFCcS'Cht5(Ec6#?+ED%*ATD@"@qB^(/Keb?DJsQ0DJ()'EcQ)=
F!+n4+DkP)Gp%<LEb'5#$;No?+CT;%+Dkh6F(oN)+CT.u+DkP)Gp$O4@VKInF`S[C@;TRs+CT;%
+DG\3Ec5o.Ebp"DA7]7e@<,pi/e&.B+BosB+D5M/@WNk[+FPjbA8Z3+-RT?1%15is/g*nb<(.p)
8PN#B+Co&"ATVK+FD,5.GAhM4+=M>CF*&iRBlkJ-Df'',+DG^9G%kA--rac!F@9hQFD5Z2@<-W]
F_u(H%15is/g+S?A0>]"@:XF%FDi:=@;BEsAmoCiF`M&7+DG^9FD,5.9L_Al/M/)eBOu3q-Z^D=
+A,Et+DkP&AISuA67sBiF_;h=BOQ!*De!:"EcW@IBOu'(GAhM4F!,[@FD)e=BOr<-@;TQuDIIBn
+CT.u+Co1uAn?!oDKI"=@;TQb$;No?+Cf4rF)to6+CT5.ARTU%Bl5&(BkCsgEb0-1+Co1rFD5Z2
@<-'nF!,C=+EV:.+A,Et+E1b2BJ'`$:-pQU8T#YmBPDN1A8,OqBl@ltEd8cUFCfN8C2[W;.3L$\
ATMrB+DGm>@3B`)EagXD8T#X[$;No?+=M>CF*)/8A2>YWBlkJ3F!+m6DJsZ8/g+&'D/XT3DJ()+
F<G7.Eb-A6ASl@/ATJu9BOqV[:-pQU@Wc<2F!,RFBkM'iE\8J9BOu'(8LJ[m+D,>4ARlp*BPDN1
8K`4kCht52@;BEsF*2M7%15is/g,7LBlbD,@<6!&BlbD;AT2[$F(K62ARlotDBO%7ATME*B4Ysl
Eaa'$A0>u*F*&O8Bk)7!Df0!(Bk;?<%15is/g*o-Fs&Or/0H]%0ej+E:-pQU0d'[CA7]R"-Zip@
F=.M)%15is/g,+A@r#Tt@;]TuD..3k+:SZhEZf=0@r#Tt-Zip@FD>`)0JOpa$>"6#D..3k+=ANG
$4R>;67sC%BQ&);@rHL-FE7luATAo7BQ&*6@<6K4A8,QsINU<R$4R>REb00.ASrVE%13OO@rGk"
EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<4&E-67t@;TRTBl.F&FCB$*
F$a;VBk&hN:-pQ_E-67t@;TRTBl.F&FCB$*F$a;VBk&hN+ET1e+C\c#Bk&9/@;KXg+=M2OF=A>M
@;TQuFD5T'F*(i-E-!.DATMs7/e&._67r]S:-pQU@<6L4D.RcL%15is/g(T1:-pQU+<WBf+CQC-
E+*j%+FZpY6rZTR<$5^cEb/a&DfU+GBOPs)@V'+g+EM+9/e&._67sB'%15is/g+SFFD,T53ZoP;
DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`e%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l.D..]F1a$p[
A79RkA0>K&EZdss3%cmD%13OO@rGk"EcP`/F<Dr?@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl
$;No?+EqB>DImBi+CQC&Df00$B6A6+A0>DsEb/a&DfU+G%14[>+=LM</NP"hE+*j%.3L!e8l%iS
78m/5%13OO%16T`@r,RpF!,RAE,9H&?U6tD@UX=l@lZP0?TgFm-UC$a@UX=l@lZP0-QlV9@rGq!
@<6!&4=<E\6"48DBk'.`3@>7C@rH(!F(KB6+=Cl<De(4)$4R>aATMs)DK]`7Df0E'DKI!KB5_^!
-T`\J:IHQ>$;No?+>%q>78m/.;cH%\<.->-$4R>;67sBjEb/[$AKYl%G9D!=F*&O8Bk)7!Df0!(
Gp!P'A9;]tD.Pjk+=D8BF*)/8A2#A^-o!JA0et2),!'7KA8ZO,?X[\fA7$]3%16WfE+*j%4ZX]6
FE;8,F(d=9@;9^k?Qa*&@<?0*-[nZ`6rZTR<$s+GA9;]tD.Oh!$9g.jDIn$&+CoS3@;TR;A9;d!
FD)*j%159QHZ*F;A9;]tD.O.`%15is/g,4WDfTD3F)Po,+EqaEA9/kF+E_a>DJ((a-Z^DV+Dbt+
@;KKt@<3Q0@VTIaF<GXCF`Lu'%159QHRF+e+E2IF+=LM<HS0ai0ea_4/g)Af+Du"&H=%dK+<XEG
/g,%MF`)70$9g.j-[I-_E-67F-s[sB/q+ot0H`J1+<r<XDJW[+?Q_'G+AP6U+CSf(ATD7$%159Q
HRF+e+E2IF+=LM<HS0ai0ea_4/g)Af+Du"&H=%dM+<XEG/g+YBDJF<3@ruF'DK?6o4tq=2H7'hS
F`\`S>p+JHINU@!+?V8!,:OaQCgVKq+>Y,_:-pQUG%G]'Et&Hc$;No?+B;B.+Cno&AKYE!A0>u.
D.OhbASGs'6#pg`FE2;;B-;8;AT2U"A0>f.+EV:.+Dl%8D@HqiDf9N7FCfDS3Zr<YG@kAm@;9^k
?Q_'`2E;m=+>PYo1*AG4+>>E%%13OO:-pQUF(KG9GAhM4+EV=7ATMs%D/aP=FDi:6Bm=3"+Eh10
F_)!hEap4r+=D2>+Du:B-TsL50Ha^W1a$FBF<Gua+CoA++=ANG$>ss,4ZX]64=DI:0mde[F"&AO
Df9N7FCfD?+=JrnI3<ELEt&I?0RGJr?SOA[E-67FDKKq/$4R>;67sBkD]j.9D.Rd1@;Tt)+DkP/
@qZ;Y-ZW]>DKKqI4ZX]>+C?i[+D58-+FPjbA8Z3+-RT?1D/X?1F*(u4+?^hu4#))"FE7lu%15is
/g,4HF<G(3DJF<3@ruF'DK?q:@<6O0F`\aJD]iY+G\(D.G%#30AISue@j"tu-ZW]>DKKqI4ZX]>
+C?i[+D58-+FPjb0H`(m1*C+FC`k)Q%15is/g,7MD.Rc2@ps6t@V$[*@;KXg+D,b<F`M%9A79Rk
Et&Ip@UX+^B5_[!4ZX^'Dg,f(?X[\fA7$H70JPL/0d&5*+>=ol+>>E%+<V+#DKKq_3Zoh5-np!0
0mde[F"&4_3Zoht3[?dAHZ!qH.3rh@@;TFcDf0,8+=JrnI3<ELEt&I?0RGJr?SOA[E-67FDKKq/
$;No?+EV=7ATMs%D/aP=D09oA+DkP/@qZ;Y-p'/1DKKqK+>#Vs.!n!#4#))"FE8lR,9eibD/X?1
F*(u4/37]Y@;TFcDf0+q$4R>;67sC$ATV?pDBO%8D.Rd1@;Tt)+DG^9A9Da.Et&I?0RI>LF(KG9
-W3B45tOg;7n"de0b"IR0RI>B4ZX^&@;BEs-RT?14tq=>+E(d5-RT?1%15is/g,4H@rH6q+Dtb7
+EV19F<G+.@ruF'DIIR2%16WfDIIBn1-IZ@-Zip@FD>`)0IJD"0etsJ1+@Po3b2r8DKTf'@;9^k
?RI31$=n6t@<?0<4ZX]6FE;8,F(d=9@;9^k?Qa*&@<?0*-[nZ`6rZTR<$s+GA9;]tD.PIF%159Q
HZ!D=A0>E)DIIBn1-9#gE+*j%1(=RS0RI_K+CoS3@;TR2%13OO:-pQUCi<`m+CoV3E$0(2+D,>.
F*&O8Bk)7!Df0!(Gmt*/-nlf*0I\,*3Zp+;.3NsuA7c8X0d'[C@rGk"EcP`/F<Dqs5s\sgF(o,E
3B8Gr$4R>;67sBhCht59Bl.F&FCB$*F!,(8Df$V+DffY8A8,OqBl@ltEbT*++Dl7BF<GF/FCStn
$?U>E4ZX]uATV?sCij`*?VO1#?V4*^DdmH(0F\@Q0RI_K+CoS3@;TQu>9G^EDe't<-OgE)F"og=
+D58-@;Kb%F'i9K94)$u:IK,1C*52>$?U>D+>#VsFE92H$4R>;67sBkATMs6Dg<IIATMr9A8,Oq
Bl@ltEbT*+%159QHSZdbAS5NrA9;]tD.Oho+>Y-YA0<6I%159QHSZdbAS5NrA9;]tD.PIF%14g4
>9Is'Ec5l<+CoS5@<?0*%14g4>9Is'Ec5l<+CoS5@<?0<%13OO:-pQU/ULGc;cFl<<C9,B;c?.c
9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG@<6-m
3B9*,Eb0<6A3s^GBk&hO:-pQ_Eb0<6A3s^GBk&hO+ET1e+C\c#Bk&86Eb0<6A18XCATMs7/e&._
67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'+>G;fFCfN8+Co1rFD5Z2@<-W9.!0$AFD>`)0JFpu
AU%p1FE7lu:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zq@4E-,Z.
@V'R&1,(C9%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+%15is/g)l'DJs\R3?WH`A79RkA0>K&EZdt502-(tFa+?&:-pQU0fX#Y
Gqq/uF`:l"FCeu*FDi:3DfTl0F)Z&8A0>u43ZrHbF<Dr@Eb/[$ATVL)FC])qFD5Z2@<-'nF!hD(
:-pQU0fX#YGqq9#ARoLs+D,P4+EMgLFCf<1+EqOABHU;M6QgPjCisT+F!(o!%16T`@s)g4ASuT4
-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6"48DBk'.`3F=p1
+=BH@6"48DBk'.`3@>qR+Cf>$Eaa$#+?V#;5s\sgF(o,E3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO
FCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOA8,Oq4ZX]5
FCfN8C2[W:0II;:%15is/g,(OASrW!+EV19F<G+.@ruF'DIIR2+CT.u+E1b!CER>5/e&/!EZf:2
+Co1rF:ARgEZf=0@r#TtA8,Oq%13OO:-pQUDJs_ABl8!'Ec`FFDf'&.DIn!&EZeh&AoD^$+EM+*
DBN\:DJLA=DfT@t$;No?+DG_8D]j.8AKZ)+F*&O8Bk)7!Df0!(GqKO5-uNU?DIIBn4ZX]5@4*TK
,!$iWBk2+(D-p^dDe*2t0I\,-3Zp4$3Zoe*+=\LZ-OgDoEZfI@E,9H&+E2IF+Dtb7DIIBn%16Ze
@<6!&DIn$0@;TQb$>"6#FDYu5Ddso&ATT&4ATr$#D.O.`ATD4#AKYl%GA^i+AIStU$;No?+ED%7
FDl22+EV:.+E2@4G%kl;F!+q#@r$4++>"^MF<G+4ATJu3Dfd+3Df0Z*Bl4@e:-pQUFD,5.DIn$0
@;TQb$>"6#Eb0<6A0>Ds@rr.eDImi2B4Z0-DIn$0@;TQb$>"6#1E^UH+=ANG$4R>;67sBjBOt[h
+ED%7FDl22F!,(8Df$V*F<GC2@<6N5FE_XGG&M2>D.Rbt$;No?+E_a>DJ()7DJ=*5AKYMtEb/a&
DfU+G@;]TuA8,OqBl@ltEd8dF@;TRs%13OOG&M1O4ZX]5@lbtH$4R>;67sB\:.$.C@<?1(+CT;%
+Du+>+CT)1@<lo:E,oN2ASuT!$;No?+Eh[>1-IZ@-X9nqDIIT?11kS_>\J%mAR&tgBPoRZ0JHaR
ASlB6%13OO:-pQU:.\/V+EVg=@;?utDfQt:Bl8'<+CT.u+Eh[>F_t\4@rH6sBkIk^ATAo2ATqZ-
DIn$0@;TR;G&M1O/13)mASlB>-S0.HGA^i+AISuaATq^+DIIBn4ZX]5@4*TK,!$iWBk2+(D-p^d
De*2t0F\?u$;No?+B;0(+E1b2BQFUi:-pQUATAo2ATqZ-DIn$'Ec,<&ANP'RCbdOh>]aOoE*ObA
DIn$'Ec,<&AIStU$;No?+Eh[>F_t\40b"J$EZf:2+Dtb7DIIBn%16Ze+E1b!CLeQ*ATr$#D.O.`
ATAo8D/a<0@j#`5F<DrKATr$#D.P(($>"6#Eb0<6A0>c$GA^i+AISuaATAo+ATT&4ATr$#D.O.`
ATAnL+E(d5-RT?1%15is/g,=UCisT++>P'>:.$.C@<?1(%15is/g+_G+E(d5DIn$'Ec,<&AISuA
67sBlEZf=0@r#TtDIn$'Ec,<&AISuA67sBlEZfI@E,9H&+E2IF+=D&<G@bf4@;TR'%15is/g+_G
+ED%7FCZM3ATq^+DIIBn%15is/g,%CEZf"+F<GI4G@bf4@;TQb$;No?+D#R91E^UH+=ANG$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s\sgF(o,E3B:GgATMs7FEM%f67sa7IT1cE+ET1e+EV19F<DuYIT1cE.3N\R
F^cs1:-pQ?:-pQU<+oue+EV19F<E1g/hSb!AoD^,@<?U&A0>u*G]X9f67rU?67sBhF)uJ@ATKm>
:-pQ?:-pQU+<XEG/g,4HF<G=@DJLA2De!3lAKYl!D.Oi3D]j.5F*&OHH#R=%:-pQU+<W$b5s[eY
Eaa$&3B9)Q5s[eXD/X3$3B9)I+Du9D-Z3L>FCfN8-ONU8/db??/g)8Z0e"5WBl\9:+EV19F<G"5
F*2>=FD5Z2$;No?+<Vd^.3N\C@rH6q+EV19F<G"5F*2>=FD5Z2$;No?+<VdL+<VdL+<VdZ/hSa`
:-pQ?:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA,Q67sBjEb/[$ARmhEH[\A3I0r_9/g+Y;@;]^h
F#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+$4:9]
@s)g4ASuT4-XpM*AL@h*AT;j,Eb-@@C2[X)ATMs)E[M2$:-pQUFCfN8+DG^9@r,^bEZeh"F(HJ.
Afu2/BlbD/Cggs!BlbD9Eb0<'DKH4\67sBQ:IIQD76sgI94)CJDe*2^:-pQU@r,^bEZc_W$49Np
/g,7IF*&O=DBO%4D/aE6@<-W9C3=E0+Dbt+@;KKt/KeqLF<G".C`l>G6jc[U/g,7IF*)IG@ps6t
@V$[$ATDC$Ec#Au+DG^9C3=E0+Dbt+@;KLr+EMI<AKYi4F*&OFF`&=9DBNCsF(G\gDe!TlF)rIG
D/a<0@p_Mf6$.-UF(dQo3F=p1+=BH@6$.-UF(dQo3@>qR+Cf>$Eaa$#+?V#;5s]U5@<6*B3B8Go
@rH(!F(KB6+=Cl<De(4&$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-ONU8/g)`m<(0_b+B)6*
;H/&r$4:lcBk)6J3ZoelATMs.De(OU-OL1f$;No?+>%q>78m/.;cQ1P78m,S<D7fm$>"6hDfB9*
+>=-0@rGk"EcP`/F<Dr?@<6!-$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?N            ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f1R,1,C%.+>GPm1Gg4/0H`,/+>GVo1-$I31*AA0+>P\p1Gp:00d&5-+>P_q1GBq+0H`).+>GPm
0fL401*AD-+?:Q%1E\D.+>Gl!0f^@61a"M1+>Y\o0ea_*2'=V0+>bqu0f1"10d&2-+>kkr0f:(0
1E\G-+>P_q1,L+03?U%3+>Gl!3$9q7@W$!K@<6-m0JR$FF(o,,-t7(1.3N).@r$4++DtV)AKYf'
F*&OHATMs7@W$!\D/X3$0JFnaDJUaE@<-"'D.RU,+EMC<CLnW1ATMs7@rH4'C/\tfCLo1RFCfN8
+=L`<D/a5=+DtV)AKYo#Ap&0)@<?4%DI[U%E,&<gDeio<0dpOMD/a5=+Eh10Bk/>pEbBN3ASuT4
F)>i2AKZ)+F*)J5Eb/[$ATVL)FC])qFD5Z2@<-'nF(96%@<?(%+D#D/FEo!$:IH=IATMr9A8,Oq
Bl@ltEbT*+A7]RD@<6-m0JG4j@<6-m+Eh10Bk/>7A7]R++EV19FE:u(F*)G@H$!V=FC])qFD5Z2
@<-'nF(Aj'FE2;FF!+(N6m-S_F*&O8Bk)7!Df0!(Bk;?rBk1.ZDeio<0IUIGA18XBD/X3$+EV19
FC]9*;f-GgAM>edA8Z34+EMC<CLnW1ATMs7A8lU$F@'DWBk&hO@UX=l@j!11E-#T4.3NS<Ea`fr
FCfJ8F(KGH@q]:gB4W3-ATMs7ARn_VDeio<0QV)LCLnW1ATMs7+E(j7-tQp<+=M,9D.P8&@r,Rp
F'U>=AU&;G+EV%$Ch4`#A8-."DJ*TuDdmcS@<6-m0JG4j@<6-m+=Ll=Ddmc:+EV19FE;)2Ddmcd
D/X3$6$%*]B5TCW0PPE8Bl[cpF<G"5F(o9)D.RU,+E(j7B5DKq@;I'/DK0f;FCeu*DIIBn+Dbb5
F<GI>F`)85Ci<d(;f-GgAOLHH0JFnfCi<d(.3N/>@s)X"DKI"5Ea`TtASuT4FCfN8B6%riD/X3$
0JFnfEc<HM@rc-hFCcS+D/aTB+D5_5F`;D7Ec>i/F@'DWBk&hO@UX=l@j#l)F*&O:DfQt;@;0U%
C2[X!Blmp,@<?''G%G]'+=LlCE,961.;Wp2A5d>`CLqU!F*'*PDdd0!@3BW.@;Ka&@rH1"ARfgr
Df-\9Afu#$C1UmsF!,17FDi9MFCfN8C2[W:0I^gV@:W;RDeip+ATMrJCi<`m+CQC6D..6s+Cf>+
Ch7*uBl@l3De:,1@VTIaFE8R=DKKe>.!0$AFD>`)0JFqlDdd0eF_u(rD/X3$0JI$[D/^V=@rc:&
F<GU8Ci<`mBl7Q+F)>i2AKZ)+F*)J>Ddd0uATMrI0JR*P@ruF'DIIR2Ci<`m+>J*`FCfN8+Co1r
FD5Z2@<-X4F`^AeD.Q[\D.Rd1@;Tt)6=FqL@k]TG@<6-m+Eh10Bk/>7E-67O+DtV)AKZ)/D.Rd1
@;Tt)+EV19FE;J6F*(qZ@<6-m0JR$FF(o,,-urm?FCZgCFCfN8F*(u7FE;PH@WZ1&F<DuYIT1cE
.3N\RF^b                                                                  ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fUp20fU:3+>G_r1*A;33AWZ<1,'h++>Gl61,'h*1a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PW+2BX_.+>P&o3&NHJ+>GYp1*A>30f:(4+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>tr/0H`).+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bpd.0f^@3+>l,9+>Get
1*A;-2D[s$6pamF9LMEC;cHOj=Y_j067sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
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
Ch+Y`F_tT!E]P<t0d%T,@<?'A+>Pku9jr;i1,(FB+>Gi:1H.?M0a^NK6rZrX9N+8X8PDNC8Q/Sa
;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[
ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt
6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O
2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+
@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF
+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.
0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:
+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*
2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@
+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm
1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_
ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%F
F_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`
F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh
1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!Y
A0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H
1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K
3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)
F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ
1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi
+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&
+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+
B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S53\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_
+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S53\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_
+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_
+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S43\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_
+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r
@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP
0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!
E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*
2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc8
1bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV
0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K
3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50
F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ
0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A
+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"
@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r
@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh33]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;
0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[
0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's
3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU
1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k
0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&
:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM
1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u
+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG
0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG
2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@
+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\
FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6
+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG
0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk1
3\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ41b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn
+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A
+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0eskG@<itN0JPL/1,1gH2**NI$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1*B;"
Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!n
Bl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i+>PW*2]sh63]/lX0K'7F$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i1,(FA
+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=Wi
D.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/0fV3N2**KI$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lU
3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS
1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[
ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K3Zp:&8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2BYV#
DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!n
Bl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:2
1HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_
ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW41H@KM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2]t_$DBL\g0fU:11-.6O3\WK"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0
@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqi+AH9b+>PW*3$9n83]/cU0JEh@$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J
@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie1,(FB+>GQ22)dQR2$sZt:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqm+@0se+>PW*3$9q1
3\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!
E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-
@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<
/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm
6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9E,m'V0JPO00fV3K1cdKM$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,EZd+k
0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&
:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*3$9t43\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'2!Gp"jr0fU:13BArS3]&W"
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU
1,0nG@<itN0JPO01,(aC2EENL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3b
Ch+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i1,(FB+>PW31,_0M3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ41c%0H
1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A
+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i1,(FB+>P]50f;!J2[Tm!:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1a!o/@<?'A+>P_q9jr;i1,(FB+>P]51,1gF
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A
+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i1,(FB+>Gi:1,h6N3=6*#:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pht9jr;i1,(FB+>Gf90KD0L
2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A
+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!n
Bl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i1,(FB+>Gi:0fD'I0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp1:+AH9i+>PW*3$9q83\iNQ
1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GSn+@KX[
ANCqh2]th'Gp"jr0fU:13'&iS3\iGt:L\BVEcu#)7<3EeEcWun:-pQ_:L\BVEcu#)7<3EeEcW@E
/M/)SF_;h5DeC2$DIal1ATMg/DKBB1/e&-s$4R>;67tA`-o!.n@rc"!BK@8SDBNb,B5)I%D..Nt
+=Lc<CagK8EbBN3ASuT4-u*[205<?u1ark@:-pQU1-$IO@<*JG0JG@,0f(jJ0KLpF%13OO+<VdL
+>b2r+CoA++=C]B-OgF"ZZ9JlCER2/Ec5tZ+Du"*FD_Np_Qt@-+E)$<Afr3=+<YQE@W$!lFD`4H
/e&-s$;No?4[(8K.3N5:GWHsaDe*QoBk:ftFD,5.G%G]'+=Lc<Cia/rEarc3+EVNEBl8!7Eb,[e
:-pQUFD,*)+CT/5+Du=<C`me1@<,jk+Dbb5FE8RDEc5o.Ebp"DDfB9*+EVNEDKTc3%15is/g,7E
@VfUs/g+,,BlbD/Bm=31+EV:.+ECn.CER2/Ec5t@/Kf.KAKYK$A7Z2W:-pQUGAhV?A0>PoG%De.
@;0OhA0>f.+E)@8ATAo%EbBN3ASuT4E+*j1ATD[0/0JLVB.b;_+>P'MDJUFC@W-04+:SZQ67sC)
Bln#2DJpY=F_Pr/F!,[FF_kS2BOQ'q+D,%rCh7-"%15is/g)8q+@0se+>PW)2'=V13\WBO1,04F
%13OO:-pQq4X`'7+CfG#F(dTWGA(Q*+CTA6ASlC.Bl7Q+FDi:BAS5^uFCfJ8@3BN0AKXSf2(gR>
%15is/g+\=@ruF'DIIR2/g)99BOu3q+DGm>@3BW0D.Oi!Bl7@"Gp$g=@rH4'@<?3mBl%L*Gmt*U
67sBoATD?)/KeS<@ruF'DIIR"ATJu(Eb/[$ARlomGp#^%2(gR>+CoC5DJsV>F(fK9%15is/g,7L
BlbD.EcQ)=+>"^MDIdHk@<?(%+Dtb%A0>K&EZf4;Eb-A6Ddmj1F<G.8Ec5t-$;No?+EVX4E,]N/
B-:o++CQC)ATo8;Dfp/9DImlA%15is/g)o0+AH9b+>PW)2'=V13\WHQ1GTCH%144#+ED%+A0<77
F`(tB4""N!>\[\fA8,OqBl@ltEbT*+>]++pD..-r>\[\fDImp,@;0U,%19tYA8c<nBl5&)EcQ)=
3Zr0EEb/Zi%19tY+<Ve=Eb/fF/g)8Z+DP8(ART*lBKKf8$4R>;67tDb-o*4oAncKN+EV:.+DPM&
Ch7Z1G%G]'F!+n3AKYl/G9CC(Ci!Zn+EV:;Dfo]++CT-s$;No?+CSf(ATDj'+?DP+FE1f/E+NQ&
Bl8$(Eb8`iAKYE!A0>;sC`mh<E$/t.G%GJ4@rHC!%15is/g*b^6m-\lEb'56@<,p%@;L"'+EVX4
E,]B!/g)99BPDN1ATDg0EZfR?Cht58FD5Q-+E(b"F`Iou:-pQUAoD]4Bl7F!D/`p*Bjtmi+C]&&
@<-W9Anc'mF!+q7F<G:=+Du+A+E2@>E+O'+Gp%3L@;p0sA1e;u%13OO:-pQq4X`*8+EqjEDJ)!Q
-tI%5E%)o?De3u4DJsV>E,ol9ATDU4+Co2-E,8s.+E_R9@rGmh+Cno&@<?d6ATJ:f:-pQU1a#)'
EZd+k0Jst-1HI<J3]&Q#$4R=b+<VeLA3DsrFZLWmFD,B0+DGm>F`(o'De*E,%144#+:SZ#+<Y3'
FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6E-67F-ZrrI%1:"A_h>pZ_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>pZ_h>p\_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5NF`\a?DBLMp
_R"!"DJR+q%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>pY_h>p\
_h>p\_jLr@+<Ve<Eaa$#+=D;B-OgD;%144#+D58-+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ[^C:OeZSB>'0d([YEb$S>.3N/4Anc-oAAYY^$H%D3KYrAYKYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$6UH6F^tpgFD,B0+DGm>F`(o'De*Dg$6UH6
A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<Y3/F)W6LF^ujB:-pQUF(fK7Ch+Z!Ble60@<iu;
BOr;P;aX,J+Eh=:F(oQ1+D,P.Ci=N3DJ((a+Cf>-G%GQ5Bl@m1%1:"A_h>pZ_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_S6Ne_Qtr5ZQVq:
6m-&]Ec5tZ+Co%qBl7X,Bl@l3AmoCiF`M'1ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYs2e$4R>;67tDb-o3:pAncKN+EqaE
CNCV4DBNb(FCfJ8G%G]8Bl@m1+E(j78g#].FCfN8+Cei$AKYMtF)Y,sBk)'lAM>em%13OO%13OO
:-pQq4X`-9+D#S6DfRl]FD,6+AKY].+CQC/Df021F*(i.A8,po+E2@>@VfUm+EqOABHS^@@;TRc
@<?Q>+DG^9FD,*)%15is/g)9IARfObEb/c(F(9--ATJu&Eb-A2Dfd+1Cj0<5F!,L7FEMVAARlon
DfTl0@ruO4+:SYe$;No?4[(8N.3N5:GWHrV$4R=O$4R>;67tA`-oEFrATDg0E]P<kD..3k.3NhC
F!,('Bl%L$B-;;7+D58'ATD4$AKYW+Dfp#?+EqL1DBO%7AKYMpE+NotASuT!$;No?+Dbb5F<G.3
E-,f*A0>u-AKYW+Dfp"ACh[s4/g)8G$4R=b+E(d5-ZsNFCi^sH>9G^EDe't<-OgCl$6UHH+C?lH
D..3k+=DAOEb&d#Ec#6,Bl@l:%13OO:-pQr4t&9;+D,>43ZqpG@;]^hA0<:;@;BFeF"&5RD]i_%
DIdQp+EV:2F!+t$F(Hs5$4R=O$;No?4?Y)N.3N2=E--@JB6%p5E-!.1Eb-A2Dfd+3Eb/[$ARlom
Gp%-MDJj0+B-:`-D/aQ+EbTK7F!+q'@psM$AKYW+E$-NG@;TR'4!uBb$;No?+D,%rCi^_;DBNA*
+DG_:@;KXg+DtV)AM,)7$4R>;67tDb-oNLsAncKN+=LlDD..3kE@E#IDe*QoBk:ftFDi:BASl@/
AKYE!Gp$[8E-,f*F!,(8Df$V7@;TRlBleA=@V'.iEb,[e:-pQU@rc-hFD5W*+D5_5F`;CE@;]Tu
F*22=ATJ:f%13OO:-pQq4X`6<+D#S6DfRl]-u*[2@:s.#+DG\3Ec5o.Ebp"DA8-+(CghU1+EM77
B5D-%DIIBn+Cf(nEa`I"ATAo0BleA=@<-"'D.RU,Et&IO67sB93?V(8Fs&Oo0K1+/0KLpK3]&]'
$4R=O$6UH6C2[WkB4W25A92j$F=/1R:-pQU@s)m7+DtV)AIT"+P`4UdJDufpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufp
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IF
ifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^
P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$(
$K@;%+QAW;ifo%*+<VfdP_(YE0K1[G0ek:;+<VdLifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#6
2_[6H0eP:*+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbX
JDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$6UH6%13OO+>P&^C2[WkB4W25@WQX"FE8f=$K@;/
ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFL
ifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`k
A`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_
@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZJmoiF+QAW;1,(C@0KCjB/i5:*+<][.Ji>\4+<VdL
+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1bg*qifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%
+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjB3$>OKi@:s-o4$"a"
F*(i4+ED%&-QjO,67sC!CER5-EZf14F*)I4$4R=u+DPh*@:s-oI4cWu+CoA++=ANG$4R=O$;No?
4?Y)P.3N2BEc5tZ+Dbt)A8,po+A,Et+CoV3E$043EbTK7F!,('Bl%i5GA(Q*+ED%7FDl26DJ()&
F_u(?F(96)E--.1$;No?+EqOABHV2(G9D!AD.Rd1@;Tt)+>"^RDfd+3BOt[hBl7Q+AoD]4DfB9*
+Co1rFD5Z2@<-'nF!+n5+EMI<AKYr1Bl8#%$;No?+>>Yq:LeJh1,(F?+>>f:0ek^E0b"I!$8<Va
0H`J*@lc8XDe(M9De*g-G%>`4E-![LAT089C3(a3$4R=b/hSb/+E)+2FED))+EV1>F<E1g/hRS?
%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)
@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;.kN8'
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@lt
EbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17K!ASu.&BHUl,
Ec5tZ+CoC"$@Es=+D3hi6qL9O9iGD+A8b[\4Y@j"+<X'I5tsdT?Y"'a$4R>;67tDb-o`XuAncKN
+Du+A+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.Bl5&4F`_&.Cij_-$;No?+>>Yq:LeJh
1,(F?+>G]60fV3L3=Q<)$;No?4?Y)Q.3N2BEc5tZ+=Ll=Ddmc:+DG_'DfTl0@ruO4+D,FuB6,2:
Df'&.Ci<flC`m/-F(o9)D.RU,F!,RC+E_RAF`2A5A.8l@67sBpDIdI%ARfg)B5DKq@;L!-@<3Q"
+Dkh;ARlolF)u&.DJ`s&F=n[Y7W3;iAU%X#E,9)H+:SZQ67sB73?V+-F<E=m0f:(.1-.9L3]&Q#
$4R>;67sC&BOu3q+CT;%+Du*?D/"6+A0><%F(o9)D.RU,F!(o!D/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=4ZYDB3Zp*c$7JV[FD,T'6#pU\D.RU,F"'7)+>=63-t[U>@jsQ%+Bos=+>=of+C,E`.1HUn
$;No?+DG\3Ec5o.Ebp"DEb0?8Ec,q@D/"6+A0><%F(o9)D.RU,Et&IhCi<d(+=D#?G\(DWDIdI%
ARfgJF)u&.DFJSdDfR37$4R>;67tDb-oi_!AncKN+Dkh;ARlotDIdI%ARfg)@<6L(B5VQtDKI"4
EcQ)=+D,>4ARlnm$;No?+>GVo9jr;i1,(FA+>GZ51c%0M2[p*'$;No?+D#G$/T55QDdmd!Ecu#)
/S/sCDfTn.$=\-lCh.:!A7TCqFE2))F`_>9DDEqA67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"Jsd
Ap%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO@rGk"EcP`/F<Dr?@<6!-%16T`@r,RpF!,RA
E,9H&?U6tDC2[WlF_PZ&3B9*,4ZX]55s[eODe*="Bl%<?3B8H0>9IEoATD4#AKX)_5s[eODe*="
Bl%<?3B8Gr$=e!gDKBB0F<DrFC2[W1%13OO:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u
+E)41DBMPI6m-#S@ruF'DIIR"ATJ:fDf9PW3Zri'+Co1s+>=63De'tP3[\Z\A7T7p+DPh*+E_d?
Ci^sH>9G^EDe(4C%13OO:-pQUB4Z0-8l%ht@WcC$A0?#:Bl%L*Bk;?.@;]TuG%G]8Bl@l3FE1f"
CM@[!+Du+?DK?6oFDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1%13OO-V@0&;cH%Q779^F+A,Et
7nHZJ8Q$[':IJ,W<Dl1Q;cH%Q779^F+A,Et;cH%Q78QBA6qL9!8l%iR<'a#C6r-0<8Q$[':II]E
<('ML6qL9!8l%i@6psgG6qL9!8l%iR6W-KP<(';U+A,Et79EMf6qL9(4ZX^,ATVC(Bl%<jBl\8;
0F\?u$?^;u@<?'qDe*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2F(Jl)8l%iR<'a#C
6qL9<8l%iF8Q8)L;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_<_Yt)@WcC$A86$n
FDl)6F(9-*E,oN2F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a6qL8c$;+)^<_Yt)
F`:l"FCf3*A7TCqFE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL8c$;+)^<_Yt)F`:l"FCf3*
A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)A0=K?6rR&N7n#g;
;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO@rGk"EcP`/F<Dr?
@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1?O[>O$4R>OF_PZ&C2[WsC3)-b:-pQ_
@WcC$A86$nBkh]3F"JsdF`:l"FCfM9+Cf>,D.RU,ARlouDe*QsF!,O6EbTK7F!)T>DBL':De*Kp
F:(c0/g+\=Eb/a&DfU+U$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sB'+ED%5F_Pl-+=Cf5DImis
CbKOAA1&KB+<XEG/g,(AFCAm$+A,Et$;No?+<Vd_+E(d5-RU#Z+<VdL+<VdL+<VdL+<VdL:-pQU
@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>m:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,
67sC!E+No0A8,OqBl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)F^67rU?67sB'+>G!ZD'138
F_PZ&C2[WsC3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c#g
67rU?67sBhF)uJ@ATKm>:-pQ?:-pQU:2_7dEcQ)=+Cf(r@r#drB.aNd67sBYAT;j,Eb0;7F*(i.
A79Lh+A*bqEc5Q(Ch3rK67rU?67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EXGQ./g+YEART[lA3(hg
0JP:sF`&lg$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O]:-pQU0emEcDD4!l@:Wn[A0>W*A8lR-Anc'm/no'A+DPh*E+*d(F"V0A
F!,49A9Ds)Eas$*Anbme@;@K0C3'_W67sB82.:HE0JXbkASl@/ARlp0Anc'mF!*%WDfp/@F`\a:
Bl[cpFCeu*FDi::De*KpF<G^DA7]d(@;KXhD@-_\De!p1Eb0-1+=CW,F(H^+@rGjn@<6K4FDYu5
De!-?5s]U5@<6*B3B:G03Zoe95s]U5@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I$=e!g
DKBB0F<DrFC2[W1$49Np/g,1G@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,Oq
Bl@ltEbT*+$?'j$4ZX^6/g+\=A0<Q5De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe(4C$49Np
/g+b;FCSu,Eb065Bl[cq+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Esd#+E,9H&+D58-
+FPjbB6%r6-Xq44Ch.:!A1%_!De+$&EcYr5DEU$'/3Yb78l%iU9gf<q:-pQU@;KXhDBN\4A8,e"
+Co2,ARfh#Ed8!a:II]E<(]qS8P2oX5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4
/pfW'0d&k\5u^B^?W0p2?V4*^DdmGg8l%iF8Q8;X6qL!L:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X
6qL!L:dJ&O/151NA7oUu05>E9Bkh]B-OL2U67sBnASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4
F(96)E--..C1D'gF)to64ZX]I3[\Z\A0>W*A92j2Eb-A.De*Bs@N]E(A8PajAKY`+A9E!.C`mJ2
A9;a.Ci^_6De*d(-OOU,A7fOlATL!q+=K?-+C?iP+DkP&AL9S`C1D'gF)to6$49Np/g,1G@:UKj
CghC++D,>(ATJu'@:O'[-u*7.@<6L$F!*"\/j:C?-Y-Y--Rh2>+ED%%A0rom+F?-n0d(4LA7fOl
ATJ1c:-pQU@rH1"ARfg)G%#E*Dfp+DD.-ppD]j+2EbTK7Esa:8@j#i5@jaE#+>b3RATT%V3[\Z\
A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@4t.!mQj0d(OX@jsQ%+F?-n0d(OX@gWQ<
67sC'E+EC!AKYMtEb/a&DfU+GAnc'mEsbB.9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@/1)u5
+?V#(Bkh]:$:[T\78l?1+=K?E:II]E<(]qS8P2oX5u^B(+=nil4s3<d9LVke0Ka)gA7T+j+<VdL
+<Y9?EbTW,+?M9(7S-9B;[P3@C2[X(FDl22A79R&Ap890FCcRV0mcA]9LVke0Ka)gA7TUfA79R&
+<Y9?EbTW,+?M?*7S-9B;[P3@C2[X"@;BFb@<<V7Ap890FCcRV1ODS_9LVke0Ka)gA9E!.Ch-sr
+<Y9?EbTW,+?ME,7S-9B;[P3@C2[X)Df9H5A79R&Ap890FCcRV21%ea9LVke0Ka)gA8c?r@<<V7
+<Y9?EbTW,+?MK.7S-9B;[P3@C2[X%Ec5Q(Ch4_3Ap890FCcRV2g\"c9LVke0Ka)gA8kstD0$gB
+<Y9?EbTW,+?MQ07S-9B;[P3@C2[X*F(KB%Df00$B4>:b+<Y9?EbTW,+?MT17S-9B;[NkQD/XQ=
E-67F-Y%(3D.RU,ARlouDe*QsF!,O6EbTK7F!,UEA79RkA1%_*D/XQ=E-67F8l%iF8Q8;X6qL!L
:dJ&O$49Np/g,1GF*)>@AKYo1ASrW$Bk)7!Df0!(Bk;>mDe'u/Df6b&+>Y-YA1&`3$=e!aF`MM6
DKI!K@UX=h-OO@%ATD4#AKX*WD/a<0@p_Mf6$.-UF(dQo3F<,&F_PZ&C2[X*DJ=2J0ht%f.UmO7
Ch.:!A9Dd(F<GWV/Kf7XBlmo/8l%htF`(o8+EV19FE8RHD]j+C@:s:lB-:`!Eb/a&DfTQ'F"Rn/
:-pQB$;No?+Eh=:@UX@mD)r+5:-pQB$;No?+<VeIAT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQU
DdmfsBl5%c:IGX!:-pQU+<WH_De't<-QjNS+<VdL+<VdL+<VdL+<Ve%67sBjCi=B++CT/5+E)41
DBNJ(@ruF'DIIR"ATJ:f:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QjO,67sC!E+No0A8,Oq
Bl@ltEbT*++EVNE@:NeYF)rIGBPDN1F(96)E-)Nr:-pQB$;No?+<Vd]+ED<A-Xq44Ch.:!A9Dd(
F=/1R:-pQUEcl7BC2[W*D.-ppD]gG_+EM[EE,oN2F(KD8Bl.g*Bk(k!+DEKI.1HVZ67r]S:-pQU
@<6L4D.RcL%15is/e&._67sBUD]iV3Ec5t@@q]F`CM@[!/e&._67sBYAT;j,Eb0;7F*(i.A79Lh
+A*bqEc5Q(Ch4%_:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp13
0fX#YGqq,a$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/O`$;No?+>Gim@<jUb+E2@4E+*cu+EV19FE8R5A7T7^%13OO@rGk"EcP`/
F<Dr?@<6!-%16T`@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!
@<6!&4=<E\6$.-UF(dQo3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!
Df0!(Bk;?.@;]TuDfB9*+DPh*+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1
A7]p,C2[W*F`_>6F!i)7+>Y-YA1&`6$4R>;67sBhCh[Hu+DPh*F`(o8+Co2,ARfh#Ed8*$8l%iF
8Q8;X6rcuR<)>k[83K!V+tb6/9M$T_4)AhFF(TZ(?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&
<*s!):IK,1C(1MB:II]E<(]qS<DH+b:dJ&O4ZX^#E+*j%F(K;58l%iF8Q8;X6rcuR<)>k[81Z-'
De*KpF>%BIA9Dd(F>#!N$4R>dEbTW,FCfN8F$2Q,1a"h%0F\A'AhG38@:XCg?X[\fA7$I$ATMs7
4Y@jU<Cp.Y?X[\fA7$HlEc<.H+CoCC+EMC<F`_SFF<G[:F*)IGEb0?8Ec*KPASu$2%14J)FEqh:
+E1b2BI>qq+F">&BkAt?-o!e2-Rg/i3ZrNUF*)IGA8a(0$6UI4D/XQ=E-67F-VeS&-S0@]H#R=G
-QmMBF*)IG/Kf+J@;TR!-OgDoCia/?%144#-ZW]>FCfN8F!j+'+>G!OATT&C/p(ZGFE7lu+<Y`B
Dfp/@F`\`S,!$rjATMs7.4chh-S0@]H#R=G-QmMBF*)IN%144#AoD]sFCfN8/g,7IF*)IGA8a(0
$6UH6+EMC<F`_SFF<G10Ch5a^+E1b2BHSiKFEDeIAKWNH-SHhi/0H?&0RInQF*&iR/0H;mBkh]:
%144#+<W(SDb*Z&<$47WHZWh?F=A>VEbTW,?X[\fA7$HkBl%>i$6UI&DIb@/$>"*c/e&.:%13OO
:-pQU@rH1"ARfg)@;]TuGB.D>AKZ/)EbTH7F!,R9F*&OGF_Pr/Et&IO67sB/-Za-CCLnkT8l%iF
8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8F!)iFF`VYKEc5i.-OgD2-Za-CCLnkT8l%iF8Q8;X6rcuR
<)>k[81>[*EbTW,FCfN8F!)iFDe*p+Deip+ATMs7-OgD2-XpM*Bk&MP8l%iF8Q8;X6rcuR<)>k[
81>[*EbTW,FCfN8F!)iFDe*<cF(o-+ATMs7-OgD2-Z!43B4WGP8l%iF8Q8;X6rcuR<)>k[81>[*
EbTW,FCfN8F!)iFDe*ZmEbAs*ATMs7-OgD2-ZaBMATMo?4%`::7nHZP:IJ2X8Q8MP<(JG\GB.D>
ATVL)FE8QPC2[X(FE1r6F*(u7FE8f=$7I93EclG:-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*
F*)IG-YdR1@rc^5BQRg,FE8f=$7I9@Eb02uEb-U[8l%iF8Q8;X6rcuR<)>k[81>[*EbTW,FCfN8
F!)iFDe*g-AT2'uATVL)FE8f=$7I95G][M7A1'H2:II]E<(]qS<DH+b:dJ&O.3NhTBlmp.ATMs7
+=CoBA7^"-ASuR'Df0Z.F*)IN%13OOF)>i<FDuAE+=CT6C`mk<BlkJ>ATMs7+Eqj?FED)3-OgCl
$;No?+ED%7FDl22+E)41DBNJ(@ruF'DIIR"ATJ:fDe'u/Df6b&+>Y-YA1&`6$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDFE1f2BK8(5?O[?UBleB7Ed;D<A25kK$>3pfATD3q
05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<b
/hen<3A_j1+AH9i+>Pl,+>PW*3"63($6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc
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
DffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KVC2[W8E+EQ'F`:l"FCeu8%13OO,9nEU0J5@<
3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@
DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(t
FDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1n
FEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'
%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(
+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1
Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et
+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5
ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+
A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O
2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#
3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\LOATo8=ATMr9F(96)E--.D@:Wn[A0>u4
+CJr&A92[3EarZg+Co1rFD5Z2@<-'nF!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k
+D,P4+CJYrCg\k)$4R=b.Ni,;A7-NgA867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"
DIdf2GA2/4+CK5$EHPu9AKW@5ASu("@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h
+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'
BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)
@<?'k+C]U=?t4+lE,&c'Bl8!6ART*lDe:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL
/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o
+<VeNDfTB0+EV:*F<GUHDBNS'DImisC`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3
D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=
+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe
$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s
$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3
/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S
@:F%aF"SRE$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$
A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&
/hf43%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\
EcW@3DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qD
D_<b!+D5A!@:UuE3@>7C+<VdL+<VdLARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?
@:O=rF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p3
0KC7b@:O(aA1fPl+E_WN%144#+<VdL+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@
DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-
I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF-
-qS;eAT23uA7]XgAKXBLGp#OdBln'-DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF
?m',kF!+q'ASrW!A7T7^+EVNE?tX%m?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*
+EM+7BjkglH=:o0Df.0M=(l/_+A,Et+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%p
CLplrBlkJ.De3u4DJsV>Bl7EsF_#&+DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6
FD5T'F*(i-E-!WS87c[KALnsJBOu'(@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6
DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2
%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG
/g,%?D.PA1Eb/[$Bl@lBCghC,E-67FFD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[
+D58-+FPjbEb0E4+=ANG$6UH6+<VdL+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1
%144#+<VdL+<XEG/g)QdFE9!GFE8lR@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.
DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD
.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk
+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL
+>P'H0f1"lF`\a=FE8QI%144#+<VdL+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN
8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5f
DBN=b78uQE:-hB=?m'$*BleB;+CT.u+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7
ATDKnCh\3,A0>;uA0><"E+NotARlp*D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30
AKY].+CHm2/g+P"78uQE:-hB=?m'0)+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0
%144#+Du+>+D#e3F*&O=DBNJ(@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:
$6UH6<+oue+Ceht+C\n)@q]:gB4YTr@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-
ATBD;C1^ir%144#+CT.u+ED%0Ddd0jDJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6
ARuulC2[W8E+EQg%144#+D,P4+Dl%;AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/
@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL
+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b
+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U
<'a)N5t=?k4#%0O%144#+<VdL+<XEG/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>
D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!
F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/
A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$
ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3
Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$
A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i
:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#
+Co1rFD5Z2@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$
F<DqY+AP6U+EM47G9CjIF<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%
67sC%ATT%m:JXqZ:J=/F;BU("+CQBb+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/
:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D
@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P((
$4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB0
3ZrKTAKYAqDe*g-De<^"AM.\3F'pU0$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;
?tsUjFDl)6F'p,#CghC+/g+/8AKYB%Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2
AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4
A0>T(+CJr&A1hh3Amc`iDIal1AThd/Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?
+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo
+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:g
B4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b
@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<
BOu'(?q+$_78m#K6UbB*BlbDCATD]A%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4
Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"
Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgL
FCf<1/e&-s$6Uf@6tL=KDId<r@q?d$DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$
AT23uA9/l3DBL_j+C]&,%144#+BN8pA8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]Y
F@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)
Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).
Bm+&1D.R?g@X3',F"SRE$6UH6?rU]YF@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%
De*s$F*'$KC3*c*@<Q'nCggdhAKYo/+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b
.NhW#G%l#3Df0V=D.-sd+EVNE:ddbqA8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3
A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]
BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5
DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E./ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/
?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2AARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL
+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>
%13OO+<VdLFD,B0+C]J++ED%7F_l/2A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/
%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er
+?1u-1*C.=Bln96F"Rn/%14=),9SZm3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&s
G%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL
<+ohcF*(i.A79Lh+A*beAS,XoBln'-DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-
AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCjEcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m
$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!
+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;
FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq
+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiA
ATBC4$4R=e,9n<b/ibOE0H_qi8muU[@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%
BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohc
F)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!
A6gTsFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6
+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*
%144#+<VdL+D>\0A9/l*F_kl>+Cf>,D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0r
A.8kg+<VdL+<X9B9H\CdEbTK7F!+n3AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5
De*Bs@pLKrFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL
+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL
+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+
A8,OqBl@ltEbT*+>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5
AKYl/G9C=;@;0Od@VfTuDf-[fBllmg@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!
@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+
/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h
+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV
-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1
GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!
BHVD1BlbD,BOPdkAKYA9+?1KSBle59I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5
F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(
+CoD#F_t]-FE9&W%13OO+=\LADKK8/FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1
AISth+<Y`IEbTE(F!,C5+CK)"@pgo3?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;
BleB:Bju4,ARloU:IH=9Bk)7!Df0!(Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&
@<?''F*)G:DJ+#5@<,p?+CKPF<.97'/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_
?m''"EZcKHBln0&/0JADFD,T5/0JJ3FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''
-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+
$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.
Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)
AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:
DJ()&ASc'tBlnD*$6UH6Eb03+@:NkcASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8
DIatp:K8bbDKI!KDIn$6ATMr@%13OO+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/
A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*
+Co%qBl7Km+DG^9@")NpA8c@,05"j6ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm
3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_
+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$
FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<
Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<
De*E%1,g=aA7T7^/e&.1+<V+#+=\LA2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&
E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=
@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<
F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h
/oG6B05trMC1UmsF"_B=Ebf3(GA]&_+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q
%14=),9SZm3A*9F+>"^.F_l=G0et:&1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9
@;]TuAn?'oBOt]sGA2/4+CI&LE-67F-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/
G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=
@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(
D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B
?pmdX<D>nW<(';F<';sD+EMXCEb0;7FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3
E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e
+CT.u+CK8/@r,^bEaO-"?m&luAKYl/G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)
E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9
+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7
?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%
EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%
EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.
;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@
ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG
<+oue+CT)&Dg-7F%144#+CJ)95t"LD9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+
CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)
+DkP4+D>2,AKYMtAnGUpASuT4%144#+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m
@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LA
C2[W8E+EQg+=Ll6DImisCbKOAA7TUgF_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1
/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]
BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL
+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg
+E_X6@<?'k+CT.u+Du+A+Co2-FE2))F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'
F*(i,C`m+uASu("@;IT3De*Bs@s)X"DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMt
Eb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7
CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol
+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1
F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<
025kb+Eh=:F(oQ1Et&I!%144-+DbIq+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&
An?"'ARl5W+<VeKD]iJ++E)(,+=M2LAKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b
/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl
/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4
@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.
0JP9k$4R=b.Ni,3ATTIGE-681+Du+A+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKK</Bl@lA%143e$6UH6+<VdL+>k9SATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0
+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E./iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,
Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB
9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3
A9DBn+EV:.+EM7CAKYo'+CJr&A92[3EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od
@VfTuBl5&8BOr<)DJX$)AKXT@6m-PoDBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J
>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/
Df'H.?m&rfDBNh8G9C@++Dbb/Blmos+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#
+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$
$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;
G\(D.@3Arp@;BF^+C]J++DG^9?t=CsE-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,Oq
Bl@ltEbT*++D,%rCh7-"FDi:=@;BF,%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOC
De+!#ARlotDI[U*Eb/a&+:SZ#+<X9P6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1
+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!
$6Uf@F`:l"FCcS&C2[WsDId='/nf?DCg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,
ASuTuFD5Z2%143e$6Uf@AncL$A0>;'?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(
GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8
G@bf++E2@4F(K62+E)-,$6UH6FD,5.E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!
B-9fB6m-S_F*)IU%144#+:SZ&,9n<b/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#
F_t]-FCB9*Df-\<AThd/ARlolDIal$G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5
AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o
+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'nFEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=
+B3#c%144#+E(k(Ch[cu+CJr&A1hh3Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+
F`V,7+D,1rA7AtWCG$&'%14=),9SZm3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<
+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd
+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2
Ch[d0G]%GAATKJGG]XB%%144-+E).6Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.
+Eh=:@N]&nDe*NmCiEc5%144#+D>2)+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ
@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8
ATDZsC`mD:E+O'+Bl7^-%144#+A!\aD'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;
7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG
0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-
%144#+CT.1@:NeiEaa'$+Co&)@rc:&FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-
+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a
+E)-?>A\X.@Vfsq>psB.FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/
F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et
+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#
+AH9i+?(ho1,(F;%13OO+=\LNBl7j0+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82
BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-
+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#
+CT)-D]j(CDK?q=DBMOo2D-\.+EMgLFCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(
@ps1b+DG_8ATDBk@q?d,Bln#2@;[2qBkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'
+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)
Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-o
A0>T(+CJnuDe*5uGA(]#BHV#1+E2.*@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*
E+*j%%144#+:SZ#.Ni\=FD)e*DIal%Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u
+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSek
Df-\:@:O(]B4W\<+CJr&A1hh3Amc&T+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/
AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu
+C]U=?tsUjBOu"!?nNR)Dfm14@;[2uDg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3
DBN>9@:WneDK@IDASu("@;IT3De(M9De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_
6q/;>ART+`DJ(R2$6UH6%144-+E).6Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*
Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP
2B[*[+>Po!-urm9ASkmfEZd+s+D,P4+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7
+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63(
$6Uf@@:Wn[A0>c$G9C:.De*fqEc#kMBkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;
Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'mF!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ
@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(
+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&
De(I0$6UH6%144-+CJr&A92[3EarZg+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.
@ruF'DIIR"ATJu9D]fJr+<VeIARopnAKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#
.NiSBDJsP<AncL$F!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@
AoD^"ARlp&@<?0*@rH4'@<-('Df0V=FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8
+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y
$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"
A8bsc%143e$6Uf@F`:l"FCeu*?tsUj/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,
/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'
@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#
Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b
/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e
$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(t
FD5Z2%143e$6pc?+>>E+/heD"+@1-_+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(t
FE7lu+:SZ#.Ni,6De(J>A7f3lBl7HmGT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&
1,(CA%13OO+=\LAC2[X*F(KB%Df00$B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#
D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8
E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO
+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@
D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08
/no'A?k!Gc%14=),9SZm1G1X0/KdbrGp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-
F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17
+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b
.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o
+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'
Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,nF*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#
%16<G0jQg_+B3#gF!,"3@s)X"DKI"2@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4
+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL
+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5
DE846+<VdL+<Vd9$6UH6+<VdL+<VdL+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-
F*)>@H"q8./nf?DC^g^o+<VdL+<VdL+<Vd9$6Tcb+:SZkBleB7Ed;D<A7TUg1,3EQDImisCbKOA
A7TUgF_t]-F<E.X@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%13OO,9nEU0J5@<3B8o=/KdbrGp"k$/0H]%0fTUL%144#.NieS@<-H4De:,4AThd/Bl@l3
@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?6m-;S@WNZ5
@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LOATo8)F`(o'
De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E./ibpJ+>"^1
@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f89JAaEb03.
F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-VARoLs+CJr&
A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqBF`V87B-9fB
6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?0J">%0JPHp
$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144#.Ni,.
DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE3%uI,+@1-_
F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuoA.8kg+:SZ#
+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWpATJu&A7T7^
%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B&`:
/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?hE$/(hEbTK7
+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72G9D!AD.Rd1
@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5BQ&$8+CJr&
A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3A8-.,+EVNE
F*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo$4R=b+=\LG
Bm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'+>PW*2%9m%
$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LDBOPdkATJu+
DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A@qB$jDJsW.
A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\:IH=*E+EC!
ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F?0/,18
1,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b50f1F(1,(F>
%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSekDf-\+E,]As
EcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(0JP?m$4R=b
+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?6m,oKA8c?<
+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKkDe!p,ASuU$
A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(AS,LoASu!h
+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN?tsUj
A9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-
+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*FCeu8%143e
$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co
@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'+>PW*1(=R"
$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:WneDBN@uA7]9o
%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-FCB9*Df-\=
E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAqDe(J>A7f3l
BlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm+<VeFAfu2/
AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:Wne
D@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q@;BFpC1K=b
/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a+E)-?FD,5.
8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.@rHC.ARfg)
?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3De:+a+E2.*
FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\8TZ>$+D"u&
Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth+<Y',De*Nm
CiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKi@V'V&1,V`k6<$NU
9LV**+=BcW6m*m6.3LrgF*&O$Ea`I"Bk(^q-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/0I8f
CLqN/%16QQCLqO$A2uY8B5M'kCbB49D%-h$%15cp6:4OC9gqfV;a!/a-UMBcF<GOC@:OCn@qB^(
AoD]48l%ht/Kf(FG%l#/A0>K&EZdss3%cn0+AH9b@qZu?0JPO7%15cp6:Oa<<Du%A+>F<4%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+A$HmEc5K2@ruF'D@HqODe=*8@<,p%FDl)6F!+n3AKYf'CLnW)Ddd0fA0>N-
DK@i]E,Tr3Eb9H1+EqC*E,TW8+D,P4+EM@-H"h//+F.mJEZek1A8,po+Co&#Df0V=@Wcc8@;L"'
+CnnuB4Z+%F`S[LBOu'(F`V,)+DG\3Ec5o.Ebp"R+<X3`G%DeADfm16G%G\:F(fK6+F.mJEcYf.
Aftf*+EV:.+D,P1F?^lj8K_edDg*<q-Z'uCBle?0DJ()#+D,2/+EVO5F!+n/A0=Gd@V'X(H#IgJ
@<,p%@<3Q8ASc08+:SYe$<1\QF!,:-@N]T3FDPZ/ATJu&+Du==@V'R&De:+9@V'V&+E2@0@ruEp
ATK%<DfQt5F_PAtCh[cuF!,(5EZfLGBl7Q+8l%i-+<X6'G%De4ARTUsARlp*BOr<"@<,m$G@>bY
+DGF1H#IgJFCArr+DlBH@:XOq@q?d)D]i_)@<-H4H#IgJD/!WrF<G%(+EML1Eb/c)%14Nn$?B]t
F_Pl-+=Cf5DImisCbKOAA1%fn%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B2onF<G16EZdtM6m-VnATAo(AS,Xo
ARloqDerrqEcVZs=$]_Z8PVc:+B1m';]nb"66K/p;,p1c78k<p+APp26:Fcp:IZI,;ajS,6q'R:
:.7Pn8l%ht7Sc]G78d&:%13OO<+oue+DbIq+ED%5F_Pl-F!+m6DKTf*ATAo3Afs]A6m-)[Ch.*t
F!,RC+EDUB/g+,,AKYl%G]Y'LFCfD6FCfN8F!,(5EZfI;AKYQ/BleB-DI[6#De:,6BOu6r+D,P.
A7]e&/e&-s$;"hP-rac!F@o=s6tp[Q@ruX0Bk;?7+Dbb5FE8R5DL!@IDId<jBl7Km+A,Et+Co2,
ARfh#EbT*++Cf>-Anbn#Eb-A8BOu6r+Co2,ARfh#EbT*++C\noDfTD3Ecl8;Bl7Q+FD,B0+DbIq
/g*`'F*)GF@ruF'DK?q=DBNV2G9D!G+CoC5FD,B0+Ceht+C\n)AoDg0A0>T(+=LuCA1hh3Ago>T
8T&Tk@;Ka&FD,5.-u*[2A8bt#D.RU,.3N&0A8c?.FDi:7ATT%CC2[W8E+EQ0/e&.:%16'GF*(#M
6pta0ARfh#EbT*+?YO7nA7%J\1E\_$0F\?u$;No?.TBu#F@o=s6tp[Q@ruX0Bk;?.FtG9gFCfN8
+E_a:EZek1DJ!TqF`M&(+A,Et+Co2,ARfh#EbT*+/e&._67r]S:-pQU<+oue+<Yi=Eag.6@q]F`
CNCU@FD,*)+<Y]9EHPu9ARlo+8l%ht+DbIq+Co2,ARfh#EbT*++<Y*5AISuA67sBkAS,XoARmD9
,"-!SBl7Km+s:E7ATJu3Dfd+=ARTI!FD,5.+Co2,ARfh#EbT*++<Y6?BleA=Df0B:%15is/g,7L
@<<V?C2dU'BIP'8G]7)/A9/l8D]j+>D.Rg&Bl7Q+DffZ(EZfI;@;[3%FE8R8AS,@nCih9=$;No?
%15is/g,"LDII':+<Y019ljqi4Y@jVATMrc:IITbEb/a&DfTQ'F!,UJ8S;pZEb,[e%15is/g,@O
ASrW!+ED%0@<?4,AKYMtEb/a&DfU+GA8c%#+Du+>+D#e3F*&NQC2dU'BIP'8@q]dlF!,1=F!+n3
B6A'&DKH<pC2[X*A8-(*+?_>"-[mEi/1)u5+?MV38l%ht8l%iC<D?:g+A,Et;bpCk6U`+i:IJ/N
;cG+R$>OKiF_#&qF!*Uu+DPk(FD*!R4s4TYA9DEsEcW?G:-pQU+Xefh4Y@jlE+*j%%16r\F))m]
/g+nIA9DEsEcW?d+DPh*F_#&qEt&IjAhG2\+D!/JD..L$+CoCC%144#4s24iBle?0DJ((a:IH=;
DerrqEcW?T+Co%qBl7K)@V'.iEb-A6F`))2DJ((a:IH=A@:F:*+?L]_@<63,,9U`>A9DEsEcVZs
AScF!/e&.1+?gnq@;Ka&8l%htAoDKrATDi7@<,p%A7]@eDIm?++?L]\De+!$AS,um$>"*c/e&.:
%13OO<+U,m8l%iCBl[cpFDl26ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[k@:C?hCh7$mF`7cs=$]_Z
8PVc:+@Jdg<(Tk\5uL9C;]nG*76smA6m+g!+Abs-:Jr<5<DHI8:IZI#5sc\n84c`&=%Q(Z+@8L>
6q'd<<(01t8PUC-84=Xr79EM3;cH1^/e&-s$<LnPDBO%7AKX<NF*&O$Ea`I"Bk(^q+DbIq+EDUB
F!,1=+CfG'@<?(%+CQC1F_tT!EZf:4+Co1rFD5Z2@<-'nF!,17+EV:.+=M\2:IJ,W<Dl1Q.3N/8
Eb/a&DfU+U+B3#c+Dtb8F<GXHAT/c9Bl%T.Eb0*+G%De)DL!@CAfu2/ATME*A8,OqBl@ltEbT*+
/g)9.7Nbi0<?OXp;FM]o6;LT\+B1m';]nIo<'_X*<)6=5:/=qD%14Nn$;tGPDg#\c@:DQ7F*'fa
@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%16f]/g*_T=%Q.0A8a(0$6UI4BOu!r+=D2?+>7dY06&*Y
-S-Z\E+*j%+=DV1:IJ,W<Dl1Q-RgSo+t!g,+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp$R-F*&OD
Ea`I"Bk(^q+=MGJDCH]=Bk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/+A#%&:.\P1A8a(0$6UHd
67sBhG&M)*+C].qDJO;9Bl5%f@:LEgDIak`Bl8'<+E1b2BQFUi+<Y`=ASc0*-ZX&H/TPGG-S0"O
@<?0*-[nZ`6rQl];F<l#%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9@V'V&+E2@0@ruEpATJtB
D.-p-Ch[d0GUXbGBk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&a
F(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+Co1rFD5Z2@<-'nF!,=.DKTB(
Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;tGPDg#\76=k4[+Ad)e@ruEpATJu1@:C?i
Bk)7!Df0!(Bk;?<%14Nn$?B]tF_Pl-+=Cf5DImisCbKOAA1%fn%15is/g,:SEb/ltF*(u6+Co1r
FD5Z2@<-'nF!*%W8OlNO;FM]s;Gp:g;[j'f+>=o`+>Y-\AS5O#4s2pJ-Xq%)DfBtE@W6F#F*&cP
>9G^EDe't<-OgCl$;No?+Co&"ATVK+A8,OqBl@ltEd8d>Bl%@%%16!ED/XT/9OVBsATMr]Bk)7!
Df0!(Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38l%htA8c%#+Du+>+C\nuDf021Bl5&8BOr;Y+EVX8
AIStj8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-84=Xn+B26-73W0J%15gT+D,>.F*&O5DIal,Df^"C
Bl.g-Ecb`-F<G%,F<GL6+CSf(Bk(]sBlbD<Bl.g*GrcBA%15j!<^fn/:.82P;BS_'<^fn/F*)>@
AKZ8:F`JTs:IH=9Bk)7!Df0!(Bk;?.Bl5%c+DG_7FCB!%+Co2,ARfh#EbT*++Unbf$:u@aDfol,
+CT)-D]iJ3DeW`)@;^?5:K&BQ@;]LdARlooBl[cpFDl26ATJu1Bkq9&%14If:i^Je@;R,VBl%@%
>UM-5$4R>0Eb/[$AKYD(8l%htD..L-ATAo(Bk)7!Df0!(Gp$X3Eb/a&DfU+GEc5l<+EV:*F<G:=
+Cf>,E,9*-AScW7Bl7HmE+NotASuT4De:+a/g)9.F=2,P@;L"'+CQC*Df9//Bk1d`+EVNEA7]@e
DIjr!+EM[7A8-'q@ruX0Gp%0MEckl6F`M%9FD,*)+Dkh5Ec5u>+A+#&+Eh=:F(oQ1F"SRX8l%ht
@rc-hFCfM9@VK^gEd8dBAnc'mF"SRX<+oiaAKYT!Ch7Z1@<,p%AmoCoCj@.EFCAWpAKYH)F<G%,
DIIR"ATJu(@;[2tBOPdkAKZ21ASrV_+Cf(nDJ*O%/e&.:%15is/g+YEART[l+CQC0@<6O%EZdtM
6m-#SEb/a&DfU+GEc5l<+E)CEF(o/r+E(j78ge[&A8-'q@ruX0Bk;?<%15is/g+,,BlbD,Eb/[$
Bl@l3A7]^kDIal.DBN@1@rH6sBkMR/ARlooBl[cpFDl2F+=M\2:IJ,W<Dl1Q.4u&:DIn$&+=CW;
FCfN8-T`_kE+*j%+=DV1:IJ,W<Dl1Q04JmBATMr@.6AndATMr9E,oAsFD55rF!,R9F*&O8Bk)7!
Df0!(Gpa%.%15is/g+,,BlbD2F!+n/+D#e+D/a<&+>"^YF(HJ&DJsW1ATAo6Df9_?AoD]4H#IhG
+Co1rFD5Z2@<-'nF"Rn/%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>\s@N]2q@ruF'DIIR2+D,Y4D'3A3
D/^V=@rc:&F:ARVD]ib1Cisf@Eaa'$+DYP6+D,1nFEMV8F!,C5+A,Et+EqB>DImBi+CQC1Df0-'
E--@JA8,OqBl@ltEd98[<+oue+Dtb8F<GXHAT/c.Ddd0t+EV:.+=L]<FCfN8.3N/8@ruF'DIIR2
+D,Y4D'370A9Da.+EM%5BlJ/:A8-+,EbT!*FCeu*GA2/4+A,Et/e&.:%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-!k9Q+?M+DbIq+Co1rFD5Z2@<-WG%14Nn$;No?+E)41DBNh.G9CF1@ruF'DIIR2%17#a+=CW;
FCfN8-QlV91E^UH+=ANG$4R>;67sBsDdd0!Ao_g,+D#e+D/a<&+CoV3E$043EbTK7%14d43\V[=
C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm@WO2=@:EbiD/_+AC3(a3$4R>;67sC$AS5Rl
ATD4$AKYDtC`mb0An?!oDI[7!+>"^WBQ&);CghC,+EV:;AS!!$ATMp$B4Z,n$=>S3HS-Ep+D5M/
@WNk[+FPjbEb0E4-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@9LHCNXS=@UWb^F`8I4@:O(qE"*-u6:!t3
<DXf)5sn:F:`r(j6VCEU+q4kg$;#=^BlbD5Blmp,@;Kb*+CQC6DIIK,FDi:=@;BEs@3B#f@r$4+
+EqOABHToC6nTT);f<df@:O(qE$0(2FCf>5%14Nn$;No?+E)41DBO%7AKYGnF*&ODEa`I"Bk(]s
A8,OqBl@ltEd8*$De't<@W6F#F*&cP>9G^EDe't<-OgCl$;No?+C\bhCER>5+E_W4$?0E`CLeP8
@W6F#F*&c=$4R>;67sC$ATMs(+ED%'Dg#]4F!,R<AKYi.F*&O7F`MM6DKI"1@:O(qE"*.pATMs(
+=CW;FCfN8-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3<+0QR+CQC6@rc:&F<G+:D/aS+$6iG8919sh+B(X*
8PiA/6rcrX+q4kg$7Kk%@r#U(+C\bhCNCV@E$/V(DIIR2+DPM&Ch7Z1@Wcc8Blk_D+CT)-D]iI2
B5_^!+DG@t@3BZ1+<k?=D/^[AH#IhG+Co1rFD5Z2@<-'nF!+n4+E2.*Bl5&8AU&;L+<X9P6m,uJ
DBNJ4D/^V+Cht54E+No0A8,OqBl@ltEbT*++CT=6@3BW*DJ*cs+A*bt@rc:&F=n\7@rc:&F<G+:
D/aP=@<,p%FD,5.D/XK;+EMX5@VfTuG@>b>FDi:CFDl22+A*beBk)7!Df0!(Bk;?<+<XWsAKY`+
A92[3EarZ'@:WneDBNJ(F*)G:@Wcd(F!+n-C`l>G6m-PhF`Lu'+Cf>#AKY])+EV:2F!,(5Ec!E<
$7QDk:-pQUA9Da.+E).6Gp"MEE-,Z4F=@Y+De't<@W6F#F*&cP>9G^EDe't<-OgCl$;No?+=M)8
CLnq;@rc-hFCfM9@3B)p@ruF'DIIR2+CoV3E$/k4+EV:.+CoV3E$04E@Us1nARfh#Ed8*$@W6F#
F*(r8D/_X!+EM47GApu3F'i?jDe*2tD..3k+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi4F(KD8
De:,&F_u(?F(96)E--.1$;+)^+CoV3E$043EbTK7F!+t$DBND"+E_a:A0>u4+ED%0Ddd0-+Cf>/
Gp$O5A0>`#EbAr+A8,OqBl@ltEbT*+/e&.:%15is/g,1GCi<`m+C];3ATMr&$?'Gt-Xq%:ATMr@
+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4FC]N2E"*-`$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:A`NGp$N<A8,Oq
Bl@ltEd98H$7QDk:-pQU@rH=305Y9@B4W2pE-,Z4F<G+.@ruF'DIIR2%16uaG@VgD@W5gqE-Wfm
C2dU'BHS[O8l%iR:K::[75&+h@rH=3-OgE$A0<7/E+<g*Gpa_=+>Y-YA0<6I%14d43\V\'3b!&M
ATMs(F_u(,$4R>;67sBjCh7$q+E1b2BFP;ZE-#T4+=BNM76sgJ5u^B&%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[l@;BEs@3BDqF*(u6+ED$FEb/ltF*(u6+EM%5BlJ/'$6i21919sh+AG.#<(0\-;FN0877TpJ
<(0\-;aXGS:fJVJ$4R>7:IH=DDJXS@F(Jp(+EV:.+Co1rFD5Z2@<-'nF!,L7B5)F/ATD?m+DG^9
FD,5.C2IC#FCfJFBkh6&Anc'm+EMHDD..-rFCAm$Bl7Q+@3BB#F*&OCAfu,*B5)F/ATD?m+Co1r
FD5Z2@<-'nF!,1<+CQC*Df9//Bk1d`/g)9/:IH=8@;[3#ASu("@<?''@3BT%/TPE8BleB-EZfF5
EbTK7+EV:*F<GjIFWb1&DBNM$BlksM+:SYe$:eZFATD4$AKYD(Eb-hCAS5^uFCfJ8F(96)E-*42
DIal/F`\a?F<G:8+F.mJEZf4-Bl5%c:IH=9Bk)7!Df0!(Gp$X3Eb/a&DfU+GEc5l</e&.:%15is
/g+e<DImisFCcS8AM%q6B5)F/ATAo7@rc:&F:ARtATD?p4ZX^,BQ&*6@<6Ks@;9^k?Q_FW3Zp:&
De't<-OgCl$;No?+ELt7AKY]/+DG^9FD,5.D..L-ATAo6Df9_,$?B]uAS3-0EbTW,?X[\fA7$Ho
E+*j%+=DV1:IJ,W<Dl1Q05>E9Eb/ltF*(u6/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;e:%nCh[@!
@<-W9A8,OqBl@ltEd8dLD]j(3@:X:oCj?Hs,#^p0+A>?n;F+2`+@Jdg<(Tk\5uL9C;]o%8+AtWo
6r-QO=X":^%15mMASrV_:IH=9Bk)7!Df0!(Bk;?.A7]@eDIjr!+EM+&Earc*E+*j%/g)99BOr;u
Bl\9:+Co1rFD5Z2@<-W9Df-\>BOr<*@<?0*BlbD=BOr<)DJXS@A8,OqBl@ltEd8dLBOQ!*@ps6t
@V$ZlBOPdkARmD9+A$YtBlbD,@;KakA0>u-AKW19F`\fMA8,OqBl@ltEd98[+@UHbDBO%7Dfo]+
+Du+8E-67FA8,OqBl@ltEbT*++CehtDJsV>@V$ZlBOPdkARlomGp#^T6m-2c-Z^D=+D5V2A0>Ss
ARQ^'D]j+4F<G[=ASiPf76s=;:/"e5@V'%XF`V+T%13OO;FNl>:JOSd+Co1rFD5Z2@<-'nF!+t$
DBND"+CSbiATMp(A0>?,+CT/5+Du==@V'R&De:+a:IH=I@<64*/g+%\5t"dP8Q8,$A8,OqBl@lt
EbT*++Ceht+E).6Gp$R-+CSbiATMp(A0>?,+E)./+EV%5CG$_P%13OO94_[RBl7Q+Ch[@!@<-'n
F!+@L5t"LD9N`KWEb0E*DKKqB@:Ne]A7]Y#@;I'*F`]!P+CT=6H#IgJDfB9*+CT.u+Cf5+F(HJ)
Bk)7!Df0!(Bk;?<%14Nn$;No?+DkP&AKYH$FCfN8+AtWo6r-QO=Ub^VA0<7/E-,Z4F=/28+>Y-Y
A0<6I%16WbF(KG9-W3B!6r-QO=XOXc%15is/g+VB@rH=3+DGm>DJs_AFD,5.E-67FA8,OqBl@lt
Ed8*$De'tP3[\BU@rH=3+C];3ATMr@+BosE+E(d5-RT?1%15is/g+b?EcZ=FB6%p5E%c9TBlmo/
F(KH7+E1b2BFP;]Ec<-K@:sV!F`8]i+?MV3A79Rk@q]F`CERn6@<,meFCfM9FDk\uGp%0NDK9H4
ATMF)0II;:%15is/g,%MFCcS*Bk)7!Df0!(Gp%'7FD)*jA8,S'+>=63%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+A69WE$014An?!oDI[7!+E_X6@<?'k%14:P77C#q;FO&D;FO>J78k=/:ddTK778=/$4R>7:IH=H
FDl22F!,[FEb$;5AS,LoASu!hF"SRX;IsHOEb0,uATJu*DII!jAKYhuDL!@IF(Js+C`mY8ATD4$
Bl@m1/g+&'An?!oDI[7!+CT)&Dg*<PB4Z1*GUXbWD]ik7@:UL)DfTB0+EV:*F<G(%Cht54FD,6+
+EqaEA9/l-DBNh.G9CC6DKKH7FE9&D$7QDk:-pQUDf0B:+E2IF+Co1rFD5Z2@<-W9Eb/ioEb0,u
ATJu3AS#BpF`:l"FD5W*+>"^WBQ&);CghC,+D,>2AKYi$F)tc&ATJ:f?SrsQ/g)hjB5DKqF!a'n
I4cX_AThu7-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@L-XF_t]-F<G+.@ruF'DIIR2+E(_(ARfh'%14:I
:IA,V78?f)6qKaF8P`)I;HY,<6:s[6<)XtM$4R>1De!p,ASuTuFD5Z2+DGm>@3BB)DJ()5FCB&t
Bl7Q+F)Q)1+E275DKI"5DfQt>Ec5T2@;TjmEcWiU+AHcqF<GL6+EV:.D'3M#FCcS/F=n\7Df'&.
@r,RfD'3P7-Z^DQDJj#qATMp$Ed8d9DIal$G%GP6A8-+,Ea`I"Bl7Q9+<XI%BOu4*+E2IF+DG^9
BOP^h+C\bpARlopAnGt%FE9&W8T#YfGp%$EBl7X'DBO%7BlbC@Ble/>F<G.<ASrW7Ec5i.+X/$O
7rN<V+CoD#F_t]-FCB9*Df-\/Ch7cuFCfM9@rGmh/g*`'+A6TpFD*%C+E)45DJ=$,+DGp?F(K<!
Eaa'$F!)ZCBlmp,@<?''E,ol0Ea`g%Bl7Q-+D,Y4D'3q6AKYDtFCfK1@<?4,AKWQI,&(k0Blmp,
@<?''E,ol0Ea`g%Bl7Q9+s8!N%13OO8l%htE,ol?Bk1dr+CQC1F_tT!EZf:4+D"u&Gp%<>H#k*M
D]iS/@s)X"DKI"2De*E3+B`W*+Ceht+D#G4ATAo%+EM77B5D-%F(K62ASu!h+E)9C@3BApEbAr+
A8-++ATDm$FD5Z2/g)9.+EqaHCh+Z/ARfXqD.RTq+EV:.+D,P4D.R`?+<XToAKXT@6m-#Y@s)X"
DKK</Bl@l3AoD]4D/XH++CoD#F_t]-FCB9*Df-\9E-,f4DK@E>$7QDk:-pQUAoD]4DIn#7GAhM4
F!,RFGp$N<F(oN)Ch4`*Bl7K)De:,&De!p,ASuTuFD5Z2/e&.rAoqU)CghC,F*)Fc3aEkV/q+of
5[,?]+>G2kBf^\l5U]hZ74o]g.1HW'F`\`R@:jUmEbo0*FE;PE-OgCl$;No?+DG_7ATDl8F(K62
ASu!h%14d33$<0_F<Dr>AoqU)CghC,F*)FM4"#&[FCAm$F!,OGEbTE(+=MLa+CSl(ATAo0@<6N5
De!:"EcP`/@q?d$AfrLH.45Q3%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m-VnATJu)De!p,ASuTuFD5Z2
+DG^9DIn#7@rH7,AU&<</e&.:%15is/g+bEEZfI4@qg%++EV:.+CoD#D.RU,+EM+3FCf?"AKY].
+D,2,@q]Fa%16W[F)W6L@:jUmEbo0*FE;PE-OgCl$;No?+C]A*AS,b(+Co&)@rc9mAKZ&:DJa<1
DBNS4Dfp"A+>"^XBOr<*@<l<j@r!3!DfQt3DKKH1Bl7Q+FD,T6AKZ&*DKKH-@qB]j$>=6pDJUGD
/g+eIE$-NLF`)&7Df-p3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq=DBNM8@;Tt"AKYo'+Dbt6B-:`'@s)X"
DKK</Bl@lA%14Nn$;No?+Dbt6B-:`'@s)X"DKH<p0H`@uA8-+(+=D5QDK9H4ATMF)0II;:%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@KdQBl7K)H#IhG+E)IA+A,Et+EM47Ecbf6FE7lu,"+jh8PV\s=\i$q+AZ'6
+A,Et+B(g,;H-"`<)XtM$4R>7:IH=LDfTB0+Ceht+C\n)F`V,)+EqOABPD?,@<,gkFE1f1Gp#^%
E,ol0Ea`g+/g)9.AfuA;FWb45DC9NKAnc-n+CQBb:IH=EEbTB)FD5o0+EV:*F<GF3ATVu9H#IhG
+Dtb%A9/l(D]iI2Ch\!5Ch4`.Ec5T2@;TjqDJ(R2$4R>ABOu3q+CT;%+DkP)Gp$[C@;Tt"ATJu4
Afs]A6m-GhDeF*!D/F!)B-:o++A,Et-Z^DODfp)1AKYK$A7[A98T&Tk@;Ka&FD,5.C2[X(Dfp)1
AKYDlA8c?.FDi:7ATT%e:IH=HDfp)1AKYK$A7[A&$7QDk:-pQUAU%X#E,9*,+E(j7F`V87B-9fB
6m-\lEb'56FDi:4AS,XoAKYl%G9CL+@qfanFD5<-%13OO:-pQUA7]glEbSuo+CQBb:IH=<Ec6)>
%16c]?YO7nA7%J\+BplLBP_X*C`lqC+FPjbB6%r#$4R>;67sC$AM%q6An?!oDI[6#E-67FA8,Oq
Bl@ltEd8dKBQ&);@;^?5ATDg0EcVZsEb09&Am]7eDe*3<3Zp4$3ZoduDCdD].3Kja+>#3-0RFuu
+EK[u0Hb"EDdmc75&NM9I4fPOG&J`U-RU$@+F,=D$4R>;67sC%BQ&);GAhM4F!,L7An?!oDI[6g
+C]U=GAhM4F!,17+CQC*Ec6)>+EV:*F<G"4AKYl/F<G:8+EV:.+D5_5F`7csC2[Wq?YO7nA7%J\
+=CT1Ec6)>-OgE#G[G0"De*3<3Zp4$3Zodu@;Kb#AS-!++FPjbB5T.@/M8/YDETTpB6%r6C2[Wq
-OgCl$;No?+Dkh6F(oN)+D,Y4D'168B6%p5E%)5'DKm9O-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36ZmHl
Df'37AKXT@6m-&OBlkJ0@:O"fBln'#Et&I#6WI&a:JFDa73G2u6m+od8Q6g%5sn4;8Q88M;^)YX
%16'JAKYhuBl5%c:IH=:A8--.GAhM4F!)lKG:=YCDIak<ARm54@ps6t@V$ZlF`VYCD/"<-A0>?,
+Co%qBl7X&B-:V*6r-0M9gqfV6VgEN5u'fjF(96)E-*]A$7QDk:-pQUA7]@eDIjr$De!p,ASuT4
@rH4$@;]TuF(96)E-*3S+FAQ4IXN>QF!,[FEb$;1@;TQuE,8rmAS?!uA7]cj$:IZW<D>nW<'sGU
9gMNB?YO7nA7$HB3Zp+!3Zp*c$?L'&F`_SFF<GOC+=DMb:4@U=%14Nn$4R=O$;No?+CfG'@<?''
@3BH!G9D*JEb$:E+E)41DK?q3A8--.GA1r*Dg)WtDKd3N@W6O0Eb$O,$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
D@HqBBl7H(FD,5.-t7.>DfTA;+D#(tF<GdADId[0+CT.u+Du+>AKYZ)G9B:L6WHiL:/jSV9hdoK
6m-S_G]Y'A@<3Q#AS#a%D/Ws!Anbge+CT.u+DG_7ATDlF+<Xa!ASrW4BOr<-@rc:&F<GdADId[0
+DGm>F('6'A0?)1FD)da;H-=A=!0n,6WHiL:/jSV9hdoK6m-MmDK@E>$4R>?F`&=1DIal"Ci=B+
+EV:.+=L]<GAhM4.3N24BlkJABl7I"G:j=3.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:SK>F<G!7GAhM4
+DG^9FD,5.A8,OqBl@ltEd98[+A,Et+DGm>@;L-rH#k*>A8-."DJ()%DfBE%F"SS2EbT0#DII@&
+Ceht+E).6Gp$R-+Cf(nDJ*Nk+EqOABHUl2E,95uBlkJ:F`\aEE+O&uFD5Z2F"Rn/.1HVZ67sBs
Ddd0!A8,OqBl@ltEd8dODfTA2Bl8$2+D#(tF<GdADId[0%16ZW+=D5QDK9H4ATMF)0II;:%15is
/g+b?DIal3BOr;7F*2A@Bldj,ATTUT+D#(tF<GdADId[0+CT.u+Du+>+@K!m<D>nW<'sGU9gMNB
+:SYe$;No?+Cf5+F(HJ*A8--.GA1r*Dg)Wt%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@KdQBl7K)8l%htE,ol3
ARfg)D.-ppDfZ?p,"+jh8PV\s8l%ht:f:(]771#s9gM-E:K&GH$4R>DBOu'(E,ol0Ea`g%Bl7Q+
GA2/4+A,Et+F.mJ+EVmJBk(RfCj@.AE+No0@3BW&F<GL6+Co1rFD5Z2@<-'nF"SS/Ddd0!F)Po,
+EMgLFCf;3F(96)E--.D@;]TuA7]@eDIjr3Df'&.BOPdhGp%!CF`)7Q+<XWsBlbD,@;[2sAKYN%
DIjr)DBN@1E,ol3ARfg)D.-ppD]j+2EbTK7/e&.:%15is/g+\9Anc-o+CQC3Ec5](@rri1@:O=r
+>"^-+E_a:+EV:.+E2@4AncK4E,o\9AoD]4F*1u++EM%5BlJ08%17&pC3+N8D/X?14ZX]>+?CW!
%13OO:-pQUF*(i.A79Lh+DN$?@rc:&FE7luEb065Bl[c--Y-dtF_;h=@<633%13OO:-pQUCi<fl
C`me/EbTK7+Du+?DK?p0$>OKiB4#@fDe*3<3ZoekF`)&7Df-p3$>OKiF'iWrDe*3<3ZoekF`)&7
Df0Z.F*)IN%13OO:-pQUE-67UG]IA-%15L!6WHiL:/jSV9hdoK6sk7I+?_b.-Za-CF`_SFF<GOC
+=AO`ISP??-RU8N$7QDk%15is/g,4WDfTD3D.-ppD[d%1+E2IF+=D,KC3+N8D/X?1-Taq!6W-KP
<*s'KDe*3:E,o]7F`)&7Df-!k%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15mK@q?d%Ec5](@rri1@:O=rF!+n3
AKYMpAnc-oA0>T.-Z^DA@<6]:FDi:3Df00$B6A6++F.mJEZdssF(KE6Bl@l3/KetNASrW4BOr<,
AT;j,Eb/c(A8,OqBl@ltEbT*++CT.u+EDUB+EqOABHS^DD(-TLD]j+4FEMOT%14Nn$;No?+EM+9
F`8IBEc5](@rr.eEbupHE,o]7F`)&7Df-pF+Bot,A0<rp-Xq%)DfBtE@W6F#F*&cP>9G^EDe't<
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l37:^+S+F.mJEZf+8A8lR-Anc'm/no'A%14:J6qL?#=\i$q+DPh*
E,ol/Bl%?5Bkh]5%13OO=(l/_+A,Et+Dbt)A9/l8BOr<-@rc:&F<H$@A7TUrF"_0;DImisCbKOA
A1q\9A8lR-Anc'm/no'A+DGm>AU%crF`_2*/g+,,BlbD<@rc:&F<G(%DBND"+E_a:A0>u4+EM+9
+E_WG8l%htFD,5.G@>b>H#IgJG@>B2/g*o-FCcS.Dg*=LDfm14@;[3!G\(B-FCcS6Ec5](@rri1
@:O=rF!,[?ASrV_:IH=ADdd0t+EqOABHVA-DKKH-@qB^(Ch[Zr3XlE*$?Bu+-ZF*@F*2A;Df9M@
+Bot,A0<rp-Xq%)DfBtE@W6F#F*&c=$4R>D5uLHL:.I>fF*)>@AKZ8:F`JUDEc5Q(Ch4`'DBNk8
AKYo'+F.mJEZen,@ruF'DIIR"ATKIH+B3#gF!,(/Ch4`'F!,L7F(KG9GA(Q*+A+pn+E_X6@<?(%
+EV:.+A,Et+CSekDf.0:$7QDk:-pQUA8-+(CghT3C2[X%Ec5Q(Ch555C3'gkATT&8ART+V@;9^k
?Qa*&@<?01IUQbtDf0VLB4YslEa`c;C2[W9C2[X%Ec5Q(Ch555C3(a3$4R>;67sBjCi=B++EV:.
+DPh*E,ol/Bl%?5Bkh]3GA1r*Dg)Wt%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B;?/+A,Et+@npp:`r&!6m+ln
6WHiL:/jMY8P`(j$6iJK73G2u6m,#h9Mcit:.-3m:IA,V78?fJ<(Tk\+q4kg$;#,VFCB!%+EV:.
+=Ll6DImisCbKOAA7TUgF_t]-F=A>@A7TUr+EVNEF`V+:8l%ht:ddbqBOu"!/g(T1.1HVZ67sBs
De!3tBl@l3De:,,De(J>A7cr9+DG_7FCB!%+CSekDf-[GB4YslEa`c;C2[WnDe!p,ASuT=+EqOA
BHTo59FV>DE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi05>E9/oY?5-OgCl
$;No?+E)41DK?q8De(J>A7cruAftM)E+EQ'Eb/ZiATAo-F!+n7@;0Od@VfTuDf-\CDfp(CF*VhK
AShk`C2[WrASc<.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;fuqo@<-W9@;]TuAnc-kC`mb0D..I#F"Rn/
<+ohcAoDL%Dg,o5B-;/6@:OCn@qB^(D..3k+A,Et+Dl%;AKYr4De+!#FD5o0+CT.u+E_a:Ap%oN
%13OO8l%ht6r-6M+AP^3+@8Lj:JOD&8PUC-84=Xn+B26-71BS5$:7$G93"e26:!t3<DXf)5sn:F
:^ma@$<0;a73Fl=;aXGS:fJQ*<D?:!$4R>:5taWh5p/lf;cH1`+AtW[;FO)I;cH1`+B(X*8Pi@q
$4R>@78tC'8O?<@;HY,18OHHK:JO2R8OZQ#<)4W776s=;:/"e"$4R>877C#q;FO&D;FO>J78k=/
:ddTK777Rl%15L!6WHiL:/i?(8OHHK:JO2R=WgL,8ju*H;[j'C$:I<P8PV\s=\i$q+AZ'6+A,Et
+B(g,;H-"`<)X55%15I&;cHOe8QnP*8l%ht779^H+@\Xa8PD]T8OZPe$4R>177KjD73G2u6m,<(
:J+&C<$4n$6W-]Y%13OO779^H+B_K?;BT^mA8lR-Anc'm/no'A%13OO<Du=/8l%ht84?3K+@/aj
+@K!m<D>nW<'aJT:JM?+%13OO<+oiaAKYE%AKY`1F*&OGDf'&.De:,6BOr;Y:IH=EEa`I"Bk(^q
+A!\h@<Q3)AoDg0A0?#9AS-($/g)9&F!,aHFWbgJAKXT@6m-bnFWbmBCht55Ec5Dq@Vg<4Anc-n
+F.mJEZf:EDBNe-FD,T'F"SRX%13OO8S0)jDfm17Bl7H(@;[2r+E_a:Ap%o4D.Rg&De'u0Ch7$r
AKYf#F<GF3+DYk5G:k!\8K_MODBND"+ED%%@q]Fa+CT@Q%13OO8oJB\+@9LPATAn&$;FrL@qZu?
0JPNr$=[FZATDNr3B9?;D..-p/n8g:%14Nn$4R>WDe*C$D/_6f9L2!E8Q8AP4ZX]58l%ht-o*4o
;f?f!@q?cMDe*E%7!3?c+B)cjBlJ08-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/g*JhCLqMq
$=[FZATDNr3B9?;D..-p/n8g:%14Nn$;<`P6VgEN78?f\4ZX]5<+oue+DbIq+Co&#Df0W<Eaa'$
F!,.7G9D!G+Dbt)A0>E*D/^Ui:IH=H@rc:&FE8QV+ED%:Bldir+D,P4+A*b9/hhMm9jr'PBHT&a
0fUNi$;<`P7ScBO;a!/a0b"I!$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l38T&WjDe+!#FD5Z2%15^'6m-PhF`Lu'
+Cf>#AKY].+Co2-FE2))F`_2*+DG^9FD,]+AKXT@6m-#_D/^V=@rc:&FE9&W7!3?c+EM%5BlJ08
+CT;%+E2.*Bl5%Z;aX,J+A*bt@rc:&FE8RHBOQ!*@ps6t@V$ZuDdd0fA0?)1FD)dh-Z^DOFCB&t
@<,m$F(96)E-*4AEc5H!F)u&5B-;A/Eaj)B%13OO<+oue+DbIq+CT>4F_t]2+A,Et+CT.u+EM[E
E,Tc=Bl7Q+@:WneDK?q6@<Q3)@V'+g+DG_7FCB!%ARmD98l%ht@;]TuF*2G@DfTr6DJ()#A7TUr
F!+t$DBND"+DG_7FCB!%ARlp-Bln#2FD,5.8g&(]@r#LcAKYhuDII0hE\7e..1HVZ67sC&D]j1D
AKYD(A9Da.+EM%5BlJ/:8l%htD09oA+C\n)@:OCnG%D*iEb065Bl[c--YI".ATD3q05>E9-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l36Z6jSBkMR/AKYD(IVNe3F)Q2A@q?cnBl[cpFDl2F%16'Q+EDUB+CQBb
:IH=9F_u(?F(96)E-*4DBl.g*Gp%$EASrW!+Dtb7+Co1rFD5Z2@<-W9@;]TuF`V+:-nlf*0I\Us
%13OO7W3;iFD,B0+DbIq+EV:.+EMIDEarZ'A8,OqBl@ltEbT*++CT;%+CfG'@<?'k+DG^9FD,5.
."4ca6rQl];F<l%+ED%0@<?4,AKYMtEb/a&DfU+U+<Xg*FWbmBCht53AS#BpFDi:3Df00$B6A6+
+CQBb+D,P.A7]d(FDi:@DeX*2+EVNE@;[2r@ruj%C`m8&Eb/a&DfU+U+A!\S<)QLe7nd&.;FNrK
9he&O6m-VnBl7Q+@3B)pEb/a&DfU+GFD,*)+DGm>DJsV>Bl5&8BOr;Y+EMgLFCf;3FE1r(+Wsp+
FWb45DC9NKG@>B2+F.mJEZf=AARfFmF`S[9Bk)7!Df0!(Gp$X+FCAWeF(KD8@V'7kB-;D4E+NQ&
@X0)1DKBo.Ci!g'B-;;0AKYl%G]Y'#+Eh=:F(oQ1/e&-s$:8<9DfTD3E,ol,AS#CdDJ()%Df00$
B6A6++CQB@IS*C(;bpCk6U`FHA8-'q@ruX0GqL48DBMP2/hhMm8l8P1F*VhKASlK2FD,5.6Z6jS
BkMR/AM6MkCh.*tF!,=2DKR(?E+Np.+EV:.+Co2,ARfh#Ed8d>DerrqEZek1DJ!TqF`Lo4Bl@l3
Anc'm/e&.:%15is/g+YBDJ!TqF`M%9@3C"k:IJ,W<Dl1Q+Co2,ARfh#Ed8d:AS,k$AKYr4De!?i
A8,po+EVNEFD,5.DIn'7+EMX9E%VS,%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AucfDg#\7E,oN5BlA-8+DbIq
+Co1rFD5Z2@<-'nF"Rn/=$]_Z8PVc:+B1m#+AP@-<$5+=78P+)786QY78k<s8OHHK:JO2R8OZQ#
6W-?=<(01t6<PF-;FsY^+Au37;]nk*+B1m';]nb"67sB'<(KG#6qKaF8P`)I;Fs;U+=MASBl%j,
Ddd0-+DPh*Ci<`m/0J\GA7T7pCi<`m.3M\`9M?Qq73Fue9LVoL6nTT)8Oah*:K8N)5uL,o5se@I
<$5.273Frn:/jYW<)Xo87NbZ$78lVt6qKaF8P`)I;Fs;U+@K!J:/=h379DuG<E)C0<(KG#:.88a
+A>'f+B)6.:bE1a%16'JBlbD<FCfD6A7]@eDIml3@3B`)Eag/5BOQ!*Eb0*+G%G_;CggcqF)Q2A
@q?cnBk)7!Df0!(Bk;?<%14Nn$;tGPDg#\c@:E/RF`Lu'6tp.QBl@ltEbT*+?YO7nA7%J\+>Y-$
+>=63BkAt?-[nZ`6rQl];F<l#+>#VsEc5l<4Y@jlE+*j%+=DV1:IJ,W<Dl1Q-Qlr</e&.1+EMC<
F`_SFF<Dqs+A,Et;bpCk6U`,.Bl[cpFDl2F+DGm>DJsV>F(KH9E$-_TF(KH9E$/S,A0>u7Gp$O.
@;0U3-OgDoCia0%AhG2X/nS[>BleA=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9
/no'A-Qlr</e&.1+EMC<F`_SFF<Dr':IJ,W<Dl1Q+CSekDf-\3F!,@=F<G:8F*(i,Ch7-"/KebF
F*(i,C`m/(A0>u7Gp$O.@;0U3-OgDoCia0%AhG2t7TW/V+CoCC%144#:-pQU@r,^bEZf:CF<G+.
@ruF'DIIR2+Co2,ARfh#EbT*+%144#F(f-$C`k*GA0<OH+>7^W+t"oiEc5l</14\FFD5Q4Ci<`m
-RgSo+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>\\1fCi<`m-RgSo+t!g,+<Y`=ASc0*
-ZW`?0686hE?HGQ/1>OWDfdNX>\\1fA7]q#Ddd0(.4chj-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)
Eaa!6+=MGJDCH]LDfp)1AKYMt@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J+
+<XEG/g+SGDeW`)@VfIjCNCV4DBMPI6rQl];F<kqE+*j%F!,C=+A?KeFa,$;DIaka@:LF$H#n(=
D0$-n+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX06MANCiaE2@:U_p$6UI4BOu!r+=D2H+>%VG+=A^\
Df9_K-SK4QA8H0mA1%fn+<Y`=ASc0*-ZX&H/TPGG-S0:VDfdNX05>E9A7]q#Ddd0(%144#F)>i<
FDuAE+=Bik@N]c(D/aE6@<-W9-uEC&05P??Fa,>XF)Q2A@q?cnBk)7!Df0!(Bk;?.ATD4#ARm.t
$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@DEb0E.Dfp+DFCf<.DfT9,Gp$p3@N]`1
F`Lu'+Co1rFD5Z2@<-'nF!,=.DKTB(Cj@W\%16ZaA1e;u.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;tGP
Dg#\7@;^?5E,oN5BlA-8+Dbt)A0>\s@N]2q@ruF'DIIR"ATKI5$7QDk:-pQUF`)52B5)F/ATAnF
+DGJ+DfTD3ATDg0EcVZs0H`%l,TnlcEb/lo-9`P63[]&lBl%j,Ddd0!C2[X!Ddd0!C2[WnAThm.
@:U`.>9G^EDe't<-OgCl$;No?+Cf5!@<*K/F`\a:Bk)7!Df0!(Gp$X3Eb/a&DfTQ'Et&ISASl@/
AP?NA;f?f!@qA&B@ruF'DIIR"ATJtJ%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bEb/[$AKZ,;Bl%j,Ddd0!
A8,OqBl@ltEd8*$7!3?c+EM%5BlJ08+CT;%+Dbt)A7]9oBl8$2+Co1rFD5Z2@<-'nF"SRX6ZQaH
FCcS'+=MASBl%j,Ddd0*+Co1rFD5Z2@<-WG%14Nn$;No?+CfG'@<?''@3BH!G9D$MBl%i5A8-'q
@ruX0Gp$g=+=M\2:IJ,W<Dl1Q.3L2bBlkJABl%T.@V$[&AStpnARlp"@<?($%15is/g+;8FWbOD
F*&O7Df00$B6A6++=M\2:IJ,W<Dl1Q.3N&:A0>i0Bl8#8FDi:1DBN@tFEM#.+D#D/FEo!>Bl[cp
FDl2F/e&-s$>sF!A0<7BFD5Q4Ci<`m-T`_kE+*j%+=DV1:IJ,W<Dl1Q06MANCiaE2@:U`74""lR
Bl5&9FD5Q*FEo!>Bk)7!Df0!(Gpa%.%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nF!+n/
A0>f0ASqqaDe't<F`_>6F)5c'A1&L(+>Y-YA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k=(l/_+A,Et
+CoV3E$043EbTK7F!,LGDBO%7AU,D/D]iq9F<G+.F*)PF@N]r7F`JU7F`MM6DKI!n+D#G6Bl\-0
D.RU,/g)9&Cht5<DfTB0+CT;%+Co%qBl7Km+DG^9@3BH1D.7'sARlp)@rc""@q[!$De!3lAKZ).
@<<W+F!+t5ART[lA0?)0ASrV_:IH=ADdd0t/g)9/:IH=9F_u(?F(96)E--.DA8-+(CghT3D.Rd0
@:s.m+CSl(ATAo0Ddd0jDJ()$@<?!mATJu4Afu#$C1UmsF"SRX<+ohcDIn'7+DbIq+EMX9E$/t8
@:XF%FD,5.F`_>6BlnVCA8,OqBl@ltEd98H$4R>D@<-7"DJ)!QA9Da.+EM%5BlJ08+Ceht+C\n)
G%G]>+DbJ,B4W3,D]ib9-Z^D=+D5V2A0>SsARQ^'D]j1DAKYDtG@>c<+E_a:+=Joe3d<)++<X?r
@:X(iB-:V*A9Da.+EM%5BlJ/:Bl8$2+A*btATMp,Df-\/A8-.(EcW@5@;[2tEaa$&+A*bgDfQtD
ATE&=Cgh?sAKZ&(EbTK7F"Rn/.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>u-AKZ,;Bl%L*Bk;?.
A8,OqBl@ltEd98H$7QDk:-pQUEcl7BFD,5.F`_>6F!,"9D/^V=@rc:&F:AR2+Z_;"4DJhDFD)dE
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM81JBl%iCBkh]:%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qAS5Rl
ATD4$AKZ,;Bl%i5@rcL/F!,L7An?!oDI[7!%16'JAKYetF*&OAATMp$B4W2rBle60@<lEp+C]U=
@3B*'D/^V=@rc:&F<G:=+CQC5ASl.!A7]d(FDi:BAS5RlATD4$AKYK'Df]tBEb/ioEb0,uATKIH
+A,Et+Co1rFD5Z2@<-'nF!,=.Bl8$$Bl5&;DfTA2@rcL/F!,L7An?!oDI[7!+EV:*F<G"4AKZ,:
ARlotDBNe)DL!@K@<loH+<XWsAKYK'Df]tBEb/ioEb0,uATJu&Eb-A2Dfd+CFDl22A0>T(+CoV3
E-!.1DIal,F`VXI@V$[&ARfal@<?'k+CSl(ATE!'Eb'5D%14Nn$;No?+ED%+ASu("@<?''F`_>6
Bln'#F!+t5Df]tBEb/ioEb0,uATJu&DIal2BQ&);Anc:,F<EF`D.Rd0@:s.m%14s8HS-Ep+D5M/
@WNk[+FPjbEb0E4+=ANG$4R=O$;No?+DkP&AKZ,;Bl%L*Bk;?.@3BT%@:UL!DJXS@A8,OqBl@lt
Ed8*$A8lU$F<Dr/76s=;:/"e<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!C2[Vl$<1\M+E_d?Ch\!*
ATJu)Bk)7!Df0!(Gp$gB+Du+A+Dbt)A7]9o@;]Tu@rcL/F!,L7An?!oDI[7!+D>2,AKYGnASrW5
E+EC!ARmD9+B38%@rH4'Ch7^"+EV:.+ED%7FDl2.FD5Z2+E(j78l%htF)Q2A@q?cmDe*E%G@_n7
Dg*=6Eb/[$AKYE!A0>],@:UK/C2[X!Ddd0*+CT.u+=LuCA7T7pCi<`m.4u&:.1HVZ67sBjEb/[$
AKYMt@ruF'DIIR"ATJ:fDIn$&+=CoBA8H0mA1'GeC2dU'BHS[O8l%iR:K::[75&CoA8H0mA1&ff
-YdR1+EMIDEarZ'@rGmh+Co1rFD5Z2@<-W@%16uaG@VgDC2[WnAThm.@:U`I-u*^0FD)dEIS*C(
;bpCk6U`YCDe*BiG&2)*A1&ff-YdR1+Co&,ASc:(D.RU,+E2IF+Co1rFD5Z2@<-W@%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-!k8l%htF)Q2A@q?cmDe*E%A7]^kDIdf2Df-\9@VTIaFE8R=DBO%7AKZ,;Bl%L*
Bk;?.A8,OqBl@ltEd98[+B3#gF!,L7CghF"Df0W0BlG2/F!,=.Bl8$$Bl7Km+C]U=FD,5.E+*j%
+E):2ATAo3AftVu@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;?.
%14m6De't<-OgCl$;No?+E)41DBL?BDe*[&@:Uf0@;]Tu.!9WGCiaE2@:Uer$?'Gt4$"a(De*[&
@:UL'FD5Q4Ci<`m-OgCl$;No?+Co2-E,8s.+Co1rFD5Z2@<-W9Bl7O$Ec#6,Bl@ku$=mj]INTae
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-!k9Q+?M+A,Et+EMIDEarZ'@rGmh/g)99BOr;Y:IH=9Bk)7!Df0!(
Gp$X?D/^V3F!,:-EbAr+@V'%XF`V+:BlkJ-Df0Z*Bl7u7@3BW6@WQX"DKKT$C`m/'Dfor>+E(j7
A8bt#D.RU,@<?4%DBNA*A0>u*F*&O8@<>p1+A$YtD..]4FCArr+CQC)ATo86Df'''FE8RHD]ik7
@:Uu"$7QDk:-pQUCi<`m+DPh*%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;IsKPDImisFCcS0De'u#Ec6#?+ED%*ATD@"@qB]j
$:8<9DfTD3Eb/lpDImisFD5W*+DPh*-Z^D?Ec6#?+ED%*ATD@"@qB^(Ci=6-+CT@7FD,5.DfB9*
+Co1rFD5Z2@<-'nF"SRX<+ohc-u*[2Ci<`m.3N/8@ruF'DIIR2+Du+A+D>2)+CQC5AS,LoASu!h
+E1b2BHVD1@<<W+DI[L*A7]g).!9WGCiaE2@:Uf>%14Nn$;No?+Du+>AKZ).AKWC9De*[&@:Uf0
E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%ht@rcL/F!,L7An?!oDI[7!+EqO9C`m8"
E+Not+E)-?F`_>6Bln'#F"Rn/.1HVZ67sC$AS5RlATD4$AKWC9De*[&@:Uf0@rcL/F!,L7An?!o
DI[7!+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(-9`Q#/g,1GG&JKN-OgCl
$;No?+DkP&AKWC9De*[&@:Uf0@3BT%@:UL!DJXS@A8,OqBl@ltEd8*$A8lU$F<Dr/76s=;:/"e<
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!C2[WnATeLi:2b>!Ch7]9F!,:;@:UKhDIal"Ec6#?+ED%*
ATD@"@q?c2C2[WnAThm.@:Uf>+<W(IDe*BiG&2)*A18X8F!,[?@<<V`+CehrC`mh5AKW1-ATfYA
@<lF)+tau\<+ohcA7]p9CghU#EZf(;+CQC3F`\a:Bk)7!Df0!(Gp%3B@<<W5BlnD=Df-\>Df?h;
AftM)DKTf*ATAo3Afu/:@:F%a+Co1rFD5Z2@<-'nF"SS'F`M26B-:_rG%GK.E,B0(F<GL>Cj@.F
BOr;sATfYA@<lF)+Cf(nDJ*O%/g)9>Dfm14@;[3!@<6.!Gp%-=G&M/-+CQC'ATfYA@<lF)+Co1r
FD5Z2@<-W9@X0)+Ci=B/DJ()+F=n"0.1HVZ67sBjCi=B++E)41DBNJ(@ruF'DIIR"ATJu&DIal.
E+No0Bl5&'DfTl0@rri4@<?0*DfTB"EX`@3+E(d5-RT?1De'tP3[\Z\A7T7pCi<`m+DPh*Ci<`m
+E_d?CiaE2@:U_p$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!@;]Tu@rcL/F!,L7An?!oDI[61%14Nn
$;No?+Dbt)A0<:8De*BiG&2)*A17rp0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A
@q@<.De*BiFtRKDF!hD(%15is/g+kGF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"AAU%p1FE8QV+Co%q
Bl7L'+E2IF+Co1rFD5Z2@<-W9E+*j%%16`gE$-NCDe*d(-Tc`/+D5_6+=CoBA8c?5%13OO:-pQU
@rcL/F!,L7An?!oDI[5e$8irQ/g)hjB5DKqF!a'nI4cX_AThu7-RU#G$4R>;67sBkAThX$DfBQ)
DKI"?@<?0*A8,OqBl@ltEbT*+%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?''Ap%p+
Gp$U8D/Ej%FCeu*C2[W*F(96)E--.1$<1\M+A,Et+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'nF!,.)
G%De6Dg*=5AS#a%Eb0<6DfTE"/g(T1%16'Q+D58'ATD4$AKYT-Ci"A>@rH4$ASuU$A0>u7@:X(o
Bl@ltC`l=mF(96)E-*47Bl%@%+D,P4+EV:.+Cf>,E,TW*DKKqBDe:,6BOr;Y:IH=HH#n(=D'4+B
FWb1&DBNtBDBN@1F(96)E-*4DFDl22A0>T(+EV:.+A,Et+Co1rFD5Z2@<-'nF"SRX<+oue+EMX9
E$01DDK?qBBPDN1F(96)E-*]A$7QDk:-pQUB4YslEaa'$+A,Et+EM%5BlJ/:Anc'mF!,17+D,b4
Cj@.5Df'?&DKKH#+D,P4D(Z8)EbupH@WcC$A86$nF)Q2A@q@"s$4R>;67sBjCi=B++Co1rFD5Z2
@<-'nEt&I4+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Aucg@;TQu8l%htCi<`m+Co1rFD5Z2@<-'n
F"Rn/<+ohc8l%htF)Q2A@q?cmDe*E%A8,OqBl@ltEbT*++CT;%+DtV)ARlo3C2[WnATfLF-u*[2
.3N&:A0<:CFD5Q4.4u_c9jqpb+EV19F<G"0A0>?(Bl%<&F(96)E--.DBl5&8BOu6r+Co1rFD5Z2
@<-'nF!,=.CLnW2F(HJ4Afu2/ATME*DIIBnF"SRX<,WmiBm+&1Bl8$2+A,Et+Cf>#AKY]/-Z^D=
+D5V2A0>SsARQ^'D]iP.E-WR7DIal1AStpnAKZ).AKYf-@:UKkBk)7!Df0!(Bk;?<+B<;hDf'?&
DKI"0DIal1F`&=DBOr;uDes6.GA1r-+Dbb0ATJu9D]iP.E-WR7DIal1AStpnAKZ).AKYf-@:UKk
Bk)7!Df0!(Bk;?<+:SYe$<KMk:.\2N3ZqEt6VgEN78?f):JOSd+A#$F=\i$?6r+q#:K/H&9N";F
6s1X'5upDs-u*[2A7]p5+=LuCA18We:.-3QF`_>6F"&5"8OHHK:JO2R8OZQ1%14Nn$;No?+E_RB
AS5^uFCfJ%$;No?+>Y-\AS5O#4s2pJ-ZsNFCiaE2@:UKqDe*[&@:UKqDe*BiG&2)*A0?#:Bl%i5
C2[W*C2[WnATfF1$4R>;67sBjCh7$q+CT/5+DPh*+EMIDEarZ'A8,OqBl@ltEbT*+%15is/g*o-
FCdKU@rH4$@;]Us+CT;%+BN8pA8c[5+E):7ASuU$A1euoDfQtCDJ=><F*VhKASlJt$;No?+ED%1
Dg#\7@;]Tu@rH=3+Co2,ARfh#EbT*++DkP)F^]*&GqKO5:-pQUF(f-$C`k*GA0<OH+>7^W+t"oi
C2dU'BHS[O8l%iR:K::[79jtWBl%i<.4chj-OgDX67sC%BOu!r+=D2?+>7dY06&*Y-S-Z\E+*j%
+=DV1:IJ,W<Dl1Q>\\1f-RgSo+t!g,:-pQUF(f-$C`k*GA0<OH+>7^W+t"oiC2dU'BHS[O8l%iR
:K::[79jSGA7T7p-RgSo+t!g,%15is/g+YBE-WR:Bk)7!Df0!(Bk;?./Kc]X+E)4@Bl@l3@rH=#
ATJu7AT;j,Eb/c(ASlC.Gp%0N@Us1nARfh#EbT*++:SZQ67sC%BOu!r+=DDDDfBtE+t"oiC2dU'
BHS[O8l%iR:K::[79jtWBl%j,Ddd0(.4chj+<i0a-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4>ULsO
-R'ZdAKWXO-OgDX67sC%BOu!r+=DDDDfBtE+t"oiC2dU'BHS[O8l%iR:K::[79jSGA8H0mA1&fW
-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>\\1f>ULsO-R'ZdAKWXO-OgDX67sC%BOu!r+=DDDDfBtE
+t"oiC2dU'BHS[O8l%iR:K::[79jSGA7T7pCi<`m-RgSo+s8'W/1>7P@<?0*-[nZ`6rQl];F<lX
C2[WnATh<+.4chj+>7:K06noS$4R>;67sC$AM%q6B5)F/ATAo;Bln#2DIn#7DIIBnEt&IO67sC$
AS5Nr-ZsNFCi^sc-u*^0FD)dEIS*C(;bpCk6Ub7&FD5Q4-Rh,)B4YslEa`c,F`_>6Bln'#F!hD(
:-pQUEb/lo+=CoBA1'GeC2dU'BHS[O8l%iR:K::[79jSGA1&ff-YdR1+EMIDEarZ'@rGmh-OgDX
67sC$AS5Nr-YdR1A7]p34"+i_@<?0*-[nZ`6rQl];F<lXC2[WnATfFM4""c]A0>DoG%GK.E,B0(
F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztq;$;=l;+B)i]FD5Z2+B*E"D..I1%16'JBlbD5@:C@#BQ&*+A0>Q(G9D!G+Dbt)A0>E*
D/^V=@rc:&FE9&W+A,Et+EMIDEarZ'@rGmh+Co1rFD5Z2@<-'nF!,[<Eb-A0Ddd0fA1euI<,Wn%
F(HJ9BOr;Y:IH=HDfp)1AKYMt@ruF'DIIR"ATJu2@;BEsF*2M7+EV:.Gp$O9AKYl!D.R6#-u*[2
A7]p5/0H?UDe(:>@;]Tu.!9WGCi_$X%13OO8oJB\+@9LPATA4e9jr'PBHT&a0fTUL@UX%`Eb],F
3C%4o@;0O1@rH2n$7QDk%16igA8,q'Ec3]j9L2!E8Q8AP4ZX]58l%ht-o!.n8T&WjDe+!#FD5Z2
-OgDV5sdk;<(Ke_4ZX]>+?CW!%15^GBPnq\/g*JhCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn
$;<`P6VgEN78?f\4ZX]5<+oue+DbIq+DG_8Ec5K2@qB^(FD,5.8l%htF*VhKASiPA+ED%:Bldir
+D,P4+A*b9/hhMm9jr'PBHT&a0fUNi$;<`P78d#Z;H#_>+>F<49L2!7:IA,\4ZX]>%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-\!BOQ!*BlbCh:IIDV$;+)^+DGm>@3A/bGAhM4+EMXCEa`Tl+CT.u+ED%8EbT*.
@;I'-H#n(=D(Z8)%16'JAKYGjF(o,,Bk1d`+C\nqBl7H(8l%htBlbD=BOQ!*8g&(nDeF*!D/F!)
B-:o0+C\o'F<Ga@ATq]r+CT=6DfTK!DJ=E2DJ()#+Cf>+Ch7*uBl@l3De:,9DfTB0+EVNEE+O'%
DfT\;@3BZ#F)*BN:NC)VDJ=E.A0>B#Ci!ZmFD5Z2F!,C5+EqaEA9/l,@<Q3)@3B#jFED)7+DtV)
ANCr%8OHHK:JO2R8OZQ$%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqF:IH=>F!+m68g%PQA8c?<+<X6t
+DGm>Bl8!6@;KakA0>T(+EV:.+=M\IA7TUrF'N?hDImisCg:^nA18X1Ea`iqBHV5*+EV:.+CfP7
Eb0-1+A*btH#n(=D'3G/Ch.*t+C]U=FD,5.E+*6l@:s-oD..<jB4Z*+DfQt0Gp%6IH>.>;Bl7Q+
FD,5.A8-+,EbT!*FD5Z2+F7a@+=LuCA1i1BE%*C^+B3#c+Dtb8F<GC.@N]`6AT/c+DJ=3,@;KY(
ATJu9BOr;Y:IH=HH#n(=D(Z8).1HVZ67sC'F(Jl)@X0)<BPDN1Cggc^$?B]tF_Pl-+=Cc8Ch7Z1
A8-',FCB6+-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;flGgF<F1O6k'K&BPDN1F*(u4+EMX5Ecc@FFD,5.
8l%htF*VhKASj%/$7QDk:-pQUF*(i2F<G=:A0<HH@rc-hFCfM9D..L-ATAo*Bl%?'BkAK*ARf:m
F('*7%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgD/XT/+E)(,+DbIq
+Co1rFD5Z2@<-'nEt&IK:IH=>F!,17F*(i,Ch7-"GA2/4Dfp.E@;^?5A8,OqBl@ltEbT*+/g)8Z
<,Wn%F(HId:IH=NDfm1>F`VXI@rc-hFCcS9Df'&.A8,OqBl@ltEbT*+/g)99BPDN1CggcqF`V,8
+D,P7EZeq<@;Tt"AKYMt@ruF'DIIR"ATJtBCggd%/0H?W@:EbYFt"sb.!0BQ.3N&:A0<:>CghU.
ASrqL+<X9P6m-#S@ruF'DIIR"ATJu&Eb-A'Eb/[$ARlp-Bln#2FD,5.-uNU?A18WFDIn#7A8,Oq
Bl@ltEd8iOG%G]'/g(T1%15F5AoD^$+CfG'@<?4$B-;#!@N]2q@ruF'DIIR"ATJu7ASl@/AKYE!
Gp%'HBlA#7CggcqA8,OqBl@ltEbT*+/g+,,BlbD<FCfD6A7]@eDIml3@3B]7Bl%L*Gp%3B@<<W9
Bl%T.ATD4#AKYMt@ruF'DIIR"ATJu+Ec5e;A7]@]F_l.BCi<flFD5Z2F"SS,F<G:=+EDUB+DG^9
FD,5.DIn'7+EMX9E%W7B$4R>D5uLHL:.I>f8Oah%84=Y#786TS;F+2`+A>'f+@Jdg<(Tk\5uL9C
;]nG':/jMN:*<,'7ScoV5u^EO:*<\8<?OXp;FM]o6;LT\+@K!J:/=h379DuG<E)C0<(KG#:.88a
+A>'f+B)6.:a$8T.1HV^ASl@/AP?NA6tp.QBl@ltEbT*+?YO7nA7%J\+>Y-$+>=63Ec5l<4Y@jl
E+*j%+=DV\F(KA>%16f]/g*_T=%Q.0A8a(0$6UI4BOu!r+=D2?+>7dY06&*Y-S0:VDfdNX>\\1f
A8,OqF'NNi@Us%n+t!g,+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>\mhX+t!g,
+<Y`=ASc0*-ZW`?0686hE?HGQ/95ZIF=\eEC2[WnBk)7+>]an0+t!g,+<Y`=ASc0*-ZW`?0686h
E?HGQ/95ZIF=\eEC2[WnBk)7+>]=LfH#R>4+t!g,+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp"MZ
Bl5@BA8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC%144#:-pQU@<QR'A0>>t
@;]k%+DG^9E+*j%F!,C=+A?KeFa,$;DIaka@:LF$H#n(=D0$-n+<Y`=ASc0*-ZX&H/TPGG-S0:V
DfdNX05>E9A8,OqF"_?<@Us%n-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+05P'+
-OgD*+EM4-Cht4AEbupNEb6FA/95ZIF=\dmC2[WnBk)7+06D,X-OgD*+EM4-Cht4AEbupNEb6FA
/95ZIF=\dmC2[WnBk)7+05t`9H#R>4-OgD*+EMC<F`_SFF<Dr)@:C@$ASlC)Eaa!6+=M)8@kVY4
DKU1Q+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5
+E2@4G%kl;F!,R9D/aE6@<-W9CggcqA8,OqBl@ltEbT*++DkP)F^]*&GqLHR$>"*c/e&.:%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k;Is]`G%De)DL!@DEbTH4+DbIq+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBj
Ci=B++CT/5+Co1rFD5Z2@<-'nF!*%WBkM=%Eb-A)EcQ)=Et&I1+>=o`+>Y-YA0<6I%13OO:-pQU
F`)52B5)F/ATAo%DL!@@@:C?iBk)7!Df0!(Bk;?./Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+ED%+
A0sJ_4$"a*@:EbYFs(U0@N]c2Gp%'B@<lg'DC5l#%15is/g,1GD/XT/+Co1rFD5Z2@<-W9A8-'q
@ruX0Bk;?.@;]Tu@;Ka&@rH7,ASuU2+>"^MB5VX.AKYQ)Ec5u>%16!ED/XT/9OVBuBk)7!Df0!(
Bk;?.0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\QF!,OGAT/c%Eb/[$ATJu9BOr;7Cggd%+CT.u+=M&7
@Us%n.3N/8@ruF'DIIR"ATKI5$7QDk:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;>p$8WfC
A0<6I%13OO:-pQU@rc-hFCcRCCggd%+CT.u+<W(K@:EbYFt"PEBk)7!Df0!(Bk;>p$>sF!A0<79
@:CSn$>sF!A0<79@:EbYFsd_+%15is/g+tEF*&O5G%#*$@:F%a+Co1rFD5Z2@<-'nEt&IpA0<6I
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[nE+Np$DJ()#+Cf5+F(oN)+Co1rFD5Z2@<-'nF"Rn/<+ohc8l%ht
@rH4$@;]TuAoD]4DfB9*Bl7Q+@;]Tu@r-()Bl7Q+A8,OqBl@ltEbT*++DGm>-uWWF+E)9C-uX'9
DBNJ(@ruF'DIIR2.4u`8:IH=8Df'?"DIdf2@<,p%F(fK4F<G"0A0>GlF*SmMD]j.IE+LX2$4R=j
De(:>@ps6tDfB9*+Co1rFD5Z2@<-'nF!+@L5t"dP8Q8,$@;]Tu;FNl>:JOSd/g*H$+F.mJ+Dkh*
BQPA.G]75(F<FIM5t"LD9N`KKBk)7!Df0!(Bk;?.@ps7mDfd+2AKYJr@;]^hA0>?,+A,Et+Cf>,
D..<mF"Rn/.1HVZ67sC!E+No0Eb/Zi06_GNFCbmgDe't<Cggd`ATfF1$4R>;67sC!E+No0Eb/Zi
05k`EGmt*9+E(d5-Z!4#-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+Cf>,D..<m+ED%8F`M@B@rGmh
+C\c#Bk)2n$:/KE+A,Et+Cf>,D..<mF!,L7FEMVA+C]86ARlp"BleA=Eb0<7Cij_N+B3#c+D,>.
F*&O=FCf;3BlbD*+ED%8F`M@B@rGmh3Zoh*.3N8ADe't=0I\,R@:Uu5+Aucf@;0UnDJ()+FCf<1
+CT;%+Dk\2F(&]mF!+n/A1SjGF*1o-Cj@QSATDg0EZfC6CghEsA0>T(AoD^,@<?4%DD!%S8l%ht
@rH4$@;]Us+E1n4AoD^,+D#e>ASuR'G%De)EbBN3ASuT4@q]F`CM@[!/g)9.AfuA;FWb.6ART?s
@3A0<6m,uXD/E^!A0>i-ARTXk+D#CuBl"o/AKWC1@;BFpC1K=b5\FqBBl#D3Df$pG@;]TuFCf9)
+Dk[4GA(E,+F.mJ+Co1s/e&.:%15is/g,4RD.Oi$EcQ)9AT)^4+E)41DBNG-D/E^!A9/1eDe't<
Bcpi$+CQC0Ble?0DJ()&Bk)7!Df0!(Gpa%.%15is/g+V3A0>u>E+O)"$?'Gt3=Q<)$;No?+C\bi
+ECn.CNBplDe'tH+>Y8j@W-04%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[nDJX$)AKXT@6m-#Y@s)X"DKK</
Bl@ku$;+)^+D>2)+D#e>ASuR'G%DdEE+EQ0+CoD#F_t]-FCB9*Df.0M8l%htA8bt#D.RU,@<?4%
DBNFtDBND"+CSbiATMp(A0?)1FD)e=BOr;7C2[WrASc<7+Eh=:@P/)s%14LuDe*NmCiCgGF)YQ3
DK?q/+AbHq+ED%%A7]d(FCB6+/g*b^6m-VnAKXSmF!+t2DJ!TqF`M&(+AbHq+ED%%A7]d(Df-\!
Bl7I"GB4m8DIak`Bl8'<+EMgLFCf<1+CT.u+EV:.+<k`CASr\7F(f-$C`m5+D/E^!A0>f.+AH9S
F"Rn/.1HVZ67sBkBle60@<itf:IH=9De!p,ASuTuFD5Z2%16igA8#OjE$-hD$4R>;67sBsDe!3t
Bl@l3De:,/@;0U%8l%ht:ddbqA8bt#D.RU,%16ih@<?0*-[oK7A8c@,>\@VcATD3q>\\1fA8bt#
D.RU,>]=4cA8bs*%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cBk)7!Df0!(Gp%'7FD,_)$<1\M+E)41DBNJ(
@ruF'DIIR"ATJu4Afs]A6m-#OAnc-o+CQC6ARTUhBHU`$A0>JqFCSu,E+*j%/g+,,AKWC3Bk/Y8
-tI%%FD5Z2@<-W9Bk1dmFD5?$@psInDf.!HG%G]'+Dbb5FE8RHBOr<*@<?08%14Nn$;No?+EM47
G9Cj5FD)*jA8,Qs0F\?u$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\M+Cob+A8,NrAoD^,+E(j7-tI%&.3NYB
FEMVAF!,")FCAm"F!+n#Dfp.EFD,5.@rH7,ASuU2+E(j7ART(^+Co1rFD5Z2@<-W9Df-\>BOr<*
@<?08%14Nn$;No?+Co1rFD5Z2@<-W9A7]jkBl%i"$8<T5Bk/>?%13OO:-pQUA8,QsINU<e+<XEG
/g+h9DIe#8Bk1prD%-g]$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+E(_(ARfg)DfTQ'DKK</Bl@ku$<1\M
+A,Et+EMgLFCf;3BlbD*+Cf>,E,9*-AKYE!A0>DoFCAm"ARlopG[YH.Ch4`-Afu#$C1Ums+E):7
ASuU$A0>i3DeF*!D/F!)B-:o++A+7/+B3#c+EMgLFCf;3@rH7+BleB;+E(j7@3BH1D.7's+E(j7
@r,RpF(KD8-ua3<AncL$A0?)1FD)dE@;9^k-RgYj+BN5fDBO%7AKZ&>F*(u1+Dbt)A9/l%+Eh16
Bk;C3+E(j7DdmHm@ruc7@<,p%@rc-hFCeu8+<XWsAKYGjF(o,,@<,jkBlmorFEMV8+DGm>@3BDq
Bl5&(Bk)7!Df0!(Gp%$7C1Ums+EV:*F<G(3DKK<$DK?q4Dfp(CF*1r1@VTIaFE9&W7:B\>+E)41
DBNJ(@ruF'DIIR2+DGm>@;L"'+CT>4De!KiFCeu*GA2/4+CQC'Bl[cpFDl2F+E(_(ARfg7+@Kpa
ARfh#Ed8dG@VTIaFE8R5Eb-A'Eb/[$ARlolDIal#ATMs6Dg>o)+CT=6Eb065Bl[cq/e&.:%15is
/g,(AC1UmsF!+q'B5)7$Bl7Q+GA2/4+=CT4De(4<@<,p%FD,5.8l%ht@r,RpF(KDF%16T`DJUFL
%13OO:-pQU8l%ht@rH7+BleB;+E(j7F(okA@UX=l@j#]!C1UmsF!+n/A0><%%15is/g,">DL!@8
Bl[cpFDl2F+E(_(ARfh'+CT=6FD,6+AKYE%AKYr#FD)e2FCf<1/e&.tDf0A60b"I!$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@l3<+ohcE-67FA8,OqBl@ltEd8d;Df0&rE-)Nr<+ohcAnc:,F<G+.@ruF'DIIR2+E)-?
FD,5.E+*j%+DGm>F)Y]#Bjkg1+<X6t+DGm>FD,5.Df0B:+<Y3/@ruF'DIIR2+EV:*F<G(%DBND"
+Dl%-BkD'jA0>?,+A,Et+Cf>,D..<mF"SRX6=jY8F`V+:D/XK;+Co1rFD5Z2@<-W9D/Ws!Anba`
FD5Z2F!+n3AKYr7F=2,P8K_MOCht59BPDN1A8,OqBl@ltEd8dLBOr;1E-67H+Co1rFD5Z2@<-WG
%13OO8TZ>$+DG\3DfTr.DKI"CD]j1?A7]e&FCB&t+EV:*F<GjIFWb1&DBO(CAKZ).AKYK$DKKH-
FE8RCAfu2/AKYo5BOu3,A8,OqBl@ltEbT*++E)-?FD,5.E+*j%+C]J8+F.mJ+CehtDJsV>@q]:g
B4W3-BOu$'Bl5&%DL!@K@<jI7$7QDk:-pQUAnc:,F<GO2FD)e-Bk)7!Df0!(Gp$gB+EV:.+E2IF
+Co1rFD5Z2@<-W&$=mj]+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C0\@<?4$B-;)'G9CF1@ruF'DIIR"
ATKI5$:8<9DfTD3D/Ws!ApJ*.B-;;0AKYK$DKKH-FE8RCAftN"Gp$X3@ruF'DIIR2+DbV2-Z^D?
Eb/[$AKYD(DIn#7,'7aK+s:E1@ruF'DIIR2+CT.u+DkP&AKY]/+EV:.+E2IF+Co1rFD5Z2@<-WG
%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@ltEbT*+%14m6De't<-OgCl$;No?+CfG'@<?''.!0BQ
.1HW%ATqZ--Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;FrEAKWCCDg<cS@3BN3F<G+.@ruF'DIIR2
/e&.:%15is/g,(OASrW4Dg<lVCggd`ATf2)DIal+@:C?2+EVOI+DGm>FD,5.E-67FA8,OqBl@lt
Ed8*$De'tP3[]#fGp$p3@Us%n+DbIq-OgCl$;No?+DG_7F`M%9FDlFIBlbD;ART+&GB.D>AISuW
E-#T4+=C&U5t"dP8Q8,+%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fATW$.DJ()#DIal/F`__>DJ()9DfTB0
/e&.ZDBO%7AKYT!EcZ=FF(Jj'Bl@l38K`(_Bk/>Y:IH=>F!+m6GAhM4+EMXCEa`Tl+CT.u+ED%8
EbT*.@;I'-H#n(=D(ZqR:2b>!G@_n*Eb-A6ART+p+EVNE-ua<N.3N&:A0<:5ATT@DF)Po,+EqaE
A90@4$4R>3Bl\9:+CfG'@<?''F)Po,+EqaEA9/l8D]j+CDfTDA%14Nn$;No?+CfG'@<?''F)Po,
+EqaEA9/1eEa`irDf%Wu+?qS7+>GPq0eb:(+AP6U+Du==ATDKp+Du+?D@HqpAU&;[3ZoelBPDN1
BlbD*+EV19F<GL6+EV:.+E)./+E2IDAKZ).Bl7Q2%16]`Ddda/4ZX]@+=eQ\+>GQ(,;Cl+%170%
D.7F"F$2Q,F#kEk+E).-AKYi.Eb-A;Bln#2An>OiBl7Q2%16Q_G\(DK3ZpO/0d(0_+>P&q%17,a
FD5Z2@;L!J3Zp.20H_kg,p4U"3b^2h0edi$+C60J0F\A3DJ<U!A7[nb+E]^f-Zj$9F!,1<+Du+A
+E_R9@rGmh-OgDo@:Nt63Zob%4s1sj+<VdL+<VdL:-pQUFCAZnF<G"&G%G]'%16ZkE,95uBllL!
+>b3%+>=63:-pQUAU&01Bk(k!+Eh=:@LWZh+=f&eGmt*0%13OOGAhM4F$2Q,4$"a0@;]UoD'3q3
G]Y'?Ci<a(F!,OLD.7F"F!+q1G\(D.Eaa'(Df0!"F!,UCBk)'lAKYPm@qZurG]7J5@qg$4%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k-ua<N.3N>G+EV:.+A,Et+Cf>,D..<m+EV:*F<GXHDfTE1+EqaEA90@4
$4R>@@<Q3)@;]TuATD4#AKZ).AKZ28Eb'5D+<XWlCLnW0Df'&.FD5T'+EVNE@rH7.Bl7El+F.mJ
EcYf.Afu2/@<<W6BOr<1DfTB0+D>2,AKYGnASrW%Eaa$#A0>>mAoD^$+E2@>@qB4^Bl7Q9%14Nn
$4R>;67sC%@<Q3)GAhM4Et&IqF`\aMDfTB0%13OO:-pQUATD4#AKYMpAnc-sFD5Z2Et&IfEaa$#
+EqaEA9/1e%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15jKG9Cp;FE2),G%De<BOr<-FDl22A0?)7Eb'56@;]Tu
@q]F`CER_4@<<W6BOuH3@<,p%E,ol9ATDU4+ED%7FDl22A1e;u.1HVZ67sBnATT&=DfTB0%16`Z
F<GdGEb'5#$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM>c@s)X"DKK</Bl@l30eb<k$;YPN+E(j7D0[7CATT&6
AS$$rF!,1<+E_R4De!p,ASuU$A0>B#A7Znn$4R>5Dg*=BAoqU%+D>2,AKZ8:FWb@+A0>u4+D,%l
AKYZ/DIdd!A90:ED..^!AKZ).Dfp,0DIdf>+E(j7Ch[cuF!,C5+Cf>#AKZ22FD)e7@<-W9@3B&u
D/Ej%F<G:8+EM70BQPjL6Z6gYASuU2+CT;%+Du+>+D,P4+EqO:E-!.1DIal&Bl\$8/T#':/g+,)
Ci!g'B-:]&D/Ej%FE8R5Eb-A%+D>2"Ci*U$CERP-+D5V2A0>B#A7[A&$4R>7:IH=EEc6,8A7]g)
@3BH1D.7's+E(j7G@>c<+EVNEA8bt#D.RU,+EqaEA90@G=(l/_+CQC:DfTA2BlbD2DKKo;A9DBn
A0>T.-Z^D=+D5V2A0>SsARQ^'D]j+CDfTD3@3BW)DfTqBDf0,/Ch[cu+Co&)@rc:&FD5Z2+E(j7
FD,5.GAhM4/e&.:%15is/g,4WDfTD3F(fK4F<GdGEb$;'ATM@%BlJ0.Df0V*$8<S^+E2IF+=D2<
DId[&-T`\r@;]UoD'3P1FCf)rEZfI4@VfU'%13OO0H`=tE-67F-Y6^rBI>kh@;p1%Bk;?.Ch74#
+CT;'F_t]-F<G[D+CT;2@<iu0FCf<1-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;Y7V@rHL1F(HJ>Dfm14
@;[32Bk;K2H#IhG+EMXCEb/c(A7]glEbTK7Bl@m1+EqOABHS^9ATT@R%14Nn$;No?+D58-+EM47
Ec`F8G]7J-DIIX$Df0V*$8<S^+D58-+=D2<DId[&-T`\e@:Nsu%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
9lG&`+Co&*@;0OhA0>E$@s)X"DKK</Bl@l3@ps6t@V$['FDl22A0>;uA0>o(FE2),G%G2:+B3#g
F!,OGAT/c.Ddd0t+CQC5ARTChF*),++D#e+D/a<&+E(j7GAhM4+CoD#F_t]-FCB9*Df-\3DKKe>
FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8d9DIal3BOu'(A8-+(CghU1+EqOABHS^6Ble5B/e&-s
$7KG!F)WQNBlbD*+A,Et+E_d?Ch\!:/g)9.F<G:=+EV:.+E).6Gp%9AEag/5BOQ!*Eb0?8Ec,q-
$=P&eBOPpi@ru:&+Dbb5F<DuUBOu'(F*1u&ATMp)F_iKLBl8!6ART*lDe:,6BOr</F*1o-+C]86
ARlo3Eaq1S@;L't.1HV5%15is/g+tK@:XF%-t?q!DJ*O%FE/fQ@;]Tu-t?q!DJ*O%FE/fQA8bt#
D.RU,@<?4%DBNY2FDi:DBOr;rF`MM6DKI"?F`\a:Bk)7!Df0!(Gmt+%@rc:&F<Dr[@:WneDKB&q
ASu("@;K1`De**fDe*Zm@WPdj@:Eem@;Tt"AM>em/no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<1\Q
F!,OGAT2]5A8-+(CghU1+EV:.+Dbt6B-:`'@s)X"DKI";Ddd0fA0>T(+EV:.+E2@4G%kl;F!,OG
AT072$7QDk:-pQUF(fK9+Dbt6B-:`'@s)X"DKK</Bl@ku$8<S_+Co2-E$-N<BOPdkATMs6-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l39lG&`+E2IFFD5W*+CT.u+D58-FD5W*/e&.9E-67O+CT.u+=Ll6F=A>@
Eb-A5F_Pr/+D,G$G\LW'AKYE!A0>AjDBO"BDfTD3ASuU(Eb-A0De!3lATKIH+B3#c+Dbt+@;KLr
+Ceht+C\n)DIIBnA0>f2+Du==@V'RkA1e;u.1HVZ67sC%@<Q3)FD,5.-t-k/A8PajALSa<De!3l
AM7P0@<6K4Bl5%;FDlFK%14IkC2[X"@;BF%+E2IF+F8>s3Zr<V?X[\fA8PajAR?Qo/g)t[$4R>;
67sC$ATVs,AThW-FD,5.-t-k/A8PajALSaGDfTB0+DG_8D]iJ++=DDYGUFVMDe!3lAIStoG^+H\
+D58-+F8>C$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkh@<,jkBl7Q+AoD]4GAhM4Et&IMBkq9&D/XK;+EMXC
Ea`Tl+EMgLFCf<1+A,Et+E2@>G%kJuF!,('@qfanFD5<-+D,P4+EM+&EarcsDJ()6BOr;rDf0Z.
DKKqBDe:,+FE8R8@<>pe@<6!4%13OO<+ohcD..-r+EM+&Earc*@rH4$@;]TuBlbCFA8Z34+=Lc7
@ruF'DIIR2+DtV)AKYf'F*)IP/e&.:%15is/g+tEF*&O5Cht59BOr<1DfTB0+E)-?FD,5.E+*j%
+C\npBl7g&DJ()9Bln#2-Y.?I%16ocF*&OQ/g+\BC`k*9FXIV*%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14Lo
DJUaE@ps6tF(Jd#@qZusDfQtEDfTB0/0K%GF*)IS+D5_5F`;CQ+EM[>FCfM9@;]TuD.-ppDf[NR
+B3#gF!,OGAT/c%Eb/[$ATJu8Df'&.B6%p5E-!.1DIal3BOu'(Ch[s4F!+n-C`mh5AKYW+Dfp#?
+E)-?FD,5.E+*j%+EV:*F<G%(B5)6+GA2/4+=BcW6miEN.1HVZ67sBjEb/[$AKZ&4D.Oi&Ec6)>
Et&IhEc<-KF*)G:DJ+#<4""NO@;]^hF*)FM%16`gE$-NEDe!m#F*&ckDJWZgC2[X"@;BF]+DEGb
%13OO:-pQUB6%p5E-!.2AS5^pDJ=!$+EqOABHS[=Ddt.($8N_Y+CoA++=CuD@j_]m%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+BN5bF<G"4AKZ).ATME*Ap&!/Gp$O9B6A'&DKI"=F_tT!EcXGS$:9"\DJs_AH#IgJ
BOQ'q+E2@>@UW_^Gp%!CFD55rA0>u-@<<W/@;^?58l%ht@rH4$@;]Us+EV%-AKY])FCf)rEZee2
B6A'&DKKqP+<X9P6m,oYB6A'&DKI"2De*F#+CT;%+E(j7@UX=l@ps1iGp%3BEb/f)FEqh:F"AGP
@VTIaF<G(3A7]g5+E)4@Bl@l3@rGmhF!+n/A0>l7@;KXiBk;=+/e&-s$<1\M+E(_(ARfh'+A,Et
+EMXCEb0;7@;]TuEb0?5Bk;I!F!+n-C`mD"G%De7@VTIaF<G(3A7]g7+<XWsAKYl%G]Y'M@:F%a
+Co2-E,8s.F!+(N6m-DWC1Ums+Cf>#ATJ:f.1HVZ67sBQ:IH=D@VTIaF<G(3A7]fk$7J"\0Hb'^
+>tYk/1r&,3[\!);FDX,78m/.7oE,_:`r\:8Q8,$9gM-E:EW%s6W?WQ:-hc\-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@ku$;YV_Bl@l3@;]TuEHP]+BkD'jEZek1A7]g)F(K0!@rri%DIal,De*QoGp%$EFD5Z2
F"SRX<+oig+CT;%+CT)&+DG_8AS5RpF"SS)DfQt;DfTD3Bl7O$Ec#6,Bl@l3@:F.tF<G"4B6A'&
DKI"2De*F#+ED%%A0=K?6mm$uDf0B*DIjr$De!p,ASuTuFD5Z2/e&-s$;PM`+Dbt7CER&-+EMI<
AKYi.Eb-@AA8Z34+Cf>,D..<mF"Rn/.1HVZ67sB/B6%p5E%E,ME-,f4DBLYV/Ken=FCSu,E,oN%
Bm;'L/KeP3F(HJ2@<?U&EcVZs1*A:oA8Z3+-Yt.>$4R>;67sB/D.-ppD_*#LE-,f4DBL\W/Keq>
D.Oi"Df0Z*Bl7u7F*)G:DJ(C@/KeqL+DkOsEc6"AH"D(,$8`k\+CoA++=CT<-OgCl$;No?+DkP&
AKYD(D.-ppD]iJ+A0>r)@<,jk+CSnkBl4@e1a$a[F<Dr>EcPf+-Taq!6W-KP<*s'KDe*3:-Vcu\
+DlBHA8`T.DffZ,DJ((a+DkOsEc3<7$4R>!+>P'MDJUFC@<*_)$4R>;67sBD4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMGi
Dfp#?+CT.u+EM[>FCfM&$;+)^+E2@>G%kJuF!+m6F(oK1Ch4`5@<iu;D]i\5Dfp"AGAhM4F!+n/
A0>u*F*)IU+<WrmB6%p5E$/k9+CQC&Des6$@ruF'DBNk0+A*c#DfTB0/g)9&+EM[>FCcS/F!+m6
@rH1"ARfgrDf-\9Afs\gFCfN8+EM%5BlJ08/g)9>Dfm14Eb/[$AKYE!A0>`-A8,Y$+D5_5F`;CE
@;]TuF*22=ATJu<Bln#2FD,5.-tdR>.3NeFEagX1$7QDk:-pQU@rc-hFCcS'+D5_5F`8IAAfu;9
Eb'56GA2/4+DtV)ATJu'AS5^pDJ=!$+EqOABHS[4BI=5rB6%r6-Zip@FD#W4F`8]N4!8r(+CoA+
+=CZ4-OgCl$;No?+CfG'@<?''@3BZ'F*%iu0d(FXF<DrEASc1$GAhM<A1'Gd0d'[C-RVM^6m-S_
F*)IG@<,p%8g&1bEbTK7F!,R<@<<W4ATW'8DBLZT-RU8N$4R>;67sBjEb/[$AKYD(FCfN8+EM[>
FCcRH+Du+>AKYf#Aoo/(EbBN3ASuT4@rGmh%14m6B6%r6-Zip@FE;S=FCcgB4!8r(+>G!LDJUFC
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$<_:i+Ceht+Dbb5F<G[=AKYK$DKKH-FE8RCAft`,Dfp#?+E)9C
F*22=ATJu<Bln#2-tdR>.1HV5%15is/g+tEF*&O7Df0Z.DKKqBDe:,6ATMs+Ec6)>+D5_5F`7cs
B6%r6-Zip@FD#W4F`8];$4R>;67sBjDf0Z.DKKqBDe:,6ATMs7F_Pr//0JhKFCcS9F_Pr/+Cf>#
AKYf#Aoo/(EbBN3ASuT!$8Wf;Ec<-KFCfN8F*22=AL@oo%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AH9[Bl7Q+
B6%p5E-!.1DIal2F_Pr/Et&IPDIjr/Afu2/AKYhuBl5&%A9MC!FCAfnF!,C5+EMXCEbTE(+A*bd
De*E%Bl5%c:IH=KF"SSD+E2.*Bl5&7@rc:&F<G:=+EV:*F<GjIFWb1&DBNe)Bl8$$Bl5&%+B(j,
7nc>oG%G]8Bl@l3De:,#+EqaEA1SjFATMrE+D5_5F`8IAEZfFGBlmo/@;]TuFD,6'+D58'ATD4$
AKYhuDL!?s+Dbt)A0>r'EbTK7F!,R<@<<W7F(HJ)Bk)7!Df0!(Gp%$7C1UmsF"SS'@<>pe@<6!&
A7]grB5V:$F!+t$Cht59BPDN1,&_@1+Eh=:F(oQ1+E(j7FD,5.FE2MGBJ(J<$4R>ABOr;uDes6.
GA1r-+DG_7ATDm6+CQC6Bl7R"AKZ28Eb$;,DBL?LDg<cSB6%p5E-!.1DIal3BOu'(B4YslEaa'$
F!,O6EbTK7F"Rn/.1HVZ67sBsAS-$,C3=T>BkDW5FCAWpAKZ/-EafIbChe*6F?MZ4+=AK]3ZpI3
>p+MI,%!'R+DEGP0d\S>-s[s,/g+@I.1HUn$;No?+EMXCEb-A-DBNn@F<G+.@ruF'DIIR2%17&s
F<DrIC3=T>-OgCl$;No?+DG_7ATDl8Bl5&%Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?+:SZ+I4cWt
+ED%:D]gDT.3N&0A7oq%-9`P7-Z!O?F*&c=$4R>;67sBsDf9E6E$-QLAThu@+DG^9C2[W8E+EQ'
GA2/4+=LuCA8#OjE%)5'%15is/g+e<DImisFCcS'Cht55F`\a:Bk)7!Df0!(Gp$a?Dfp#?+:SZ3
+Dkq9-9`Q#/g)nlEb0E4-RT?1%15is/g+k?+EV:.+DbV$F<G"4B6A'&DKI"8F!,%1Bk1dc+EV:.
+D5_5F`;CE@<,p%D.-sd+DG_8D]gHEDdd0*+EM%5BlJ08%15is/g,"IF!a'nI4cWt+ED%:D^QnA
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMY^@rcL/%16'CF),hJ+Dbb-AKZ,7A79RoDJ())ASu("@<?'k+EM%5
BlJ08/0JG2DBND"+EM76E,96#Bk:ftGA2/4+A,Et+DkOsEc6"O+<Wrm8l%htD.-ppD]ib8+CT.1
@<,gkFE1f1Gp#^%F(96)E-*4EBOQ!*@ps6t@V$ZoATVEqARlolDIal$G\(B-FCeu*GA2/4+=M8I
.4u&:.1HVZ67sBt@:O=r+EV:*F<G4-DImisFCfM9@;Ka&E-67FA8,OqBl@ltEd8d?Ec6)>Et&Ik
De*]n@rcKN3ZoeF67sBnASu("@<?''@;Ka&E-67FA8,OqBl@ltEd8d?Ec6)>F!iM47P#o@+Dkq9
-9`Q#/g)nlEb0E4-RU8h+=@U*%15is/g,4WDfTD3D.-ppD]gVS@rGmh+>PYoFCf9)F!+(N6m-Sb
BlbD2F!+m68g&1bEbTK7%14p7E-67F-Z*:-AT2d6B6%s4-Ta(<4)/\ED.-ppD[d$_$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@ku$;u"aDJ=!$+CQBb:IH=B@:O=r+DGm>@3BW*D/a<&+DkP/FCfJ8De:,1E+Np$DJ()6
BOr;pE,]i9E,oZ$FCcS*Bk)7!Df0!(Bk;?.@;]TuF`V87B-8UCD(-SZ+EDUB+DkOsEc3Q>$7QDk
:-pQUAn?'oBHU`$A0>H.ARfk)AKVEhEbupHD..3kE-688Ec?(I%13OO:-pQUAn?'oBHU`$A0>H.
ARfk)AKZ&.Ch7L+Cj@-T+EqO9C`mY6Cj@.6Ble60@<iu,G]7J5@qg%1+Cf>#AKYo6FDuAE%15is
/g)kkEbupHD..3kE-688Ec?(I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k9jqOPDf[%0Eb-A2Dfd+BATMs6
Bk)6rA0>u4+A*bt@rc:&FE9&W+B`W*+Ceht+CT)-D]j+CDfTD385r;W/0IVp<+T/_+BV?3/0In\
=B$go9gMZM6r-lZ/0Iql7Q;N!DIakV=]@g4F(96)E--.DBl5%c:IH=9Bk)7!Df0!(Bk;?<+<XHt
Cj@-q+EM%5BlJ08+Ceht+C\n)Ecl7BBQ&*+G%G\H%14Nn$;No?+EMXCEb-@e@8pf?+=K!#.3N&:
A0=EB9hZZX1,C@%FCf]=Et&I5+E2IF+=Cu6FCf\E4#/QQ-S@#(+A?3CAQU'bDe*E%/hSb(%13OO
1a$a[F<DrEFDYhA4#/TR-Qk#o/g*\a9hZ[>De*E%/hSb(%13OO:-pQUF*)>@AKY)L9H[b]A0><$
@VKq)@<-W9<(0ng+=L]EFCfMB/e&.E+E2IF+=DDNCaV;H9h\o&C2[Wi4"!.4ATMrWFD,B0+DGm>
Cgh0l+F%a>4>1efF*'Sn%13OO:-pQU6<R8V+DGm>F`(o2FCfK3Eb0?(A0>?,FCfM9@;]Tu@ps6t
F*)>@AKYGrDIIR"ATJtG+Du+>+ED%'Df'?&DId<h+D,P4+DbJ,B4W2tBl%@%/e&.E+E2IF+=BKI
:+&+Y2EPqj@:W_RC2[Wi+DPk(FD)dEIUQbtDf0W$B4YslEa`chC2[WfC2IC#FCfJFBkh6-%13OO
:-pQU@X3',+EM7CAKYo'+DkOsEc2Bo1a"M1+D58-+=BKI:+$JX%15is/g,">@rcK1FCf]=+EVmJ
ATJu&Eb-A'Df0Z*DKKqBBl5&8BOr<'@;0U%8l%ht@r,RpEt&IK;aXGS:fLe1C2[Wi/0IVP<(0nr
@;9^k?S!<j<)$%n@;9^k?S!=%9h\o&C2[Wi/0In\=B&X9C2[Wi/0I8^<(1/&C2[Wi/0IYQ;G0DR
=&*+2C2[Wi/0Iql7Q=a`C2[Wi%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0jDJ()&Bk)7!Df0!(Gp$X?
D/^V=@rc:&F:ARVD]iS%D/X<5FE1f3AKYo5BOu3,8l%htAn>CmF`M&7+EqB>DImBi+EMI<AKZ28
Eb'56Bl5&3F`JU8Bk)7!Df0!(GqL3^<+ohcDIn'7+EMX9E$/t8@:XF%-u<=$A9Da./no'A.4u&:
.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>\s@N]2q@ruF'DIIR2+CoV3E$043EbTK7/e&.:%15is
/g+kGF*2M7+Cf>1Eb/a&+E1b2BFP;eA0<rp-Zj9P+DbIqA7]p,Cggd#+BosE+E(d5-RT?1%15is
/g+tK@:UKkF_u(?F(96)E-)Nr0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Cggdo
05P'+A9Da./no'A-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:K#RE$043EbTK7F!,"3+Du+>+EMXCEb-A;
DfTA2Eb/ioEb0,uATKIH+B3#cGp$sHF*&O6AKYVsDImisFCeu8%14Nn$;No?+E_X6@<?''GAhM4
+ED%*ATD@"@qB^(/Kf+JDg*=9Bl\9:+>k9YATMp$B4Z,n$8irQ/g)hjB5DKqF!a'nI4cX_AThu>
-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@l37r3*Q@;I',AS,LoASu!hEt&IK:IH==@<3Q'@:O"fBln'#F!,(5
EZek#EcQG>DJ()1F`\aIFCB9*@j#YtD.OhuDII@,F(o\<Df-[i+EqaEA9/l%DIal3ATMs7/e&-s
$<1\M+=Ll=Ddmc:+CT.u+=MARATK:CG%G]'F!+n/@;L48AKYE!A0>r8DfTD3DIIBn+ED%*ATD@"
@qB^6%14Nn$;No?+CT.rCjC><+DtV)ATJ:fB4Z0--Y.:?@<<k+$4R>;67sBjCghC+BkDW5DIIBn
+E_a:+DG^9@UX=h+Dbt+@;KKtGAhM4%14gE+D5M/@WNY>A92j$F=.M)%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
%166VFWb1&DBO(@A79Rk+D5M/@UX'qGAhM4+ED%*ATD@"@qB^6%14Nn$;No?+>=pPF!,R<AKZ28
Eb$;&De*E%/Kf+VDfTE1+D5M/@UX'qEb/ioEb0,uATJ:f0Hb"EDdmc1-Y.:?@<<k+$4R>;67sBD
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;
@N\T\@ruF'D@Hq$F`V,8.3NYBFE2),G%G_;F*)>@ARlp(AS,LoASu!hF"Rn/.1HVZ67sBnCi<ck
C`mb0An?!oDI[7!+D,P4+=LcAFCB8?%176!ATJtAA92j$F=.M)%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%14M+
F(KDA+C\nlDf'',+Eh=:Gp";RF(Js+Ca(!GBOu'(@;Ka&GAhM4F!,.)G%De;FDl22A0>o(An?!o
DI[7!/e&.:%15is/g+kGF*2M7+EVOI+DGm>FD,5.E-67FA8,OqBl@ltEd8*$De'tP3[]#fGp$p3
@Us%n+DbIq-QlV91E^UH+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$F`V,8.3N,/DBNt2FEMVA+DkP)
Gp%-=An?!oDI[6#Ch[s4F!+n5+E).-AM,*)BOr<-@;TQuE+*j%+EM+&Earc*D.R3j@;]e#D'3P6
+E_a:A0>K&EZfC6FE2),G%ki,+ED%*ATD@"@qB^6%14Nn$;No?+D5M/@UX'qEb/ioEb0,uATJu4
Afu;9Eb'56@V'1dDJj0+B-;D4FD)dED'oc":-pQUF`V,8+FPjbA8Z3+-Z(4?$4R>;67sBnCi<ck
C`mb0An?!oDI[7!+E(j7GAhM4F!,%3A8,po+EqOABHS[D-OgE*F(KD8I4cWr+>Y-NDJU\A-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l3<+ohcF`V,8+E_R9Df-!k:N1DiDf-[R0d(CH+=MARATK:CEb0?8Ec,q@
FD,5.F`V,8/TkrFDf-\9AftM)GAhM4/g)99BOr</F(KDEF`(o3DBNY7+C\c#Bk(RfCj@.3+E_R9
EHPh8Ch[s4+CT)&+EV:.+EqaEA9/l3DBO%7AKYJkCht59Eb/f)De:,#+EqaEA1e;u.1HVZ67sC'
F(KD8F`(o3DBNk0+EVgG+EqaEA9/1e1GL"pF(KD84$"a!@;Ke!Df0V=F*2A@Bldj,ATTUR%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;#/@:UL%@rc:&FE7lu8l%ht@ps6tB4YslEaa'$+A*bm
Ddd0!F(96)E--.DAo_g,+Co1rFD5Z2@<-W9B6%p5E-!WS+B3#c+D58'ATD4$ARlp)@rc:&FE8R5
Eb-A;EbTW;ASrW4D]j.8AKYr7F<G+.@ruF'DIIR2-Z^DO@rc:&F<GXI@Us1nARfh#Ed98H$7QDk
:-pQUB4YslEaa'$+Dbt)A0>r'EbTK7%16rgF!)iOF`)&7Df-pF+<XEG/g,4XDD,jFDf-\<Bldi.
F(KG&$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqiCi^_-E,]B+A9/l+ASu("@<?'k+EM%5BlJ08+EVNEFD,5.
@s)g4ASuT4F`V,7-Z^DOFCB33F`8sIC3(M0Bl%?'F)N1CBOuH3@ps6t@V$ZuDdd0fA0>T(A7]^k
DId<rFDQ4FDe:+a:IHfE$4R>;DffPO+Dkq9+EM%5BlJ08+CT;%+CSekARlp*D]hkV6;0s<?YWpj
DfQssF^f0$@p`tX+D,P4+EV:.+CfP7Eb0-1+E_a:E\7e..1HVZ67sBsDdd0!B4YslEaa'$A0>r'
EbTK7%16oi@:UK.F*2A;Df9M@%13OO@ps1jDf9N7+>PW*2'=#:67sBmF_kk:-o!.n+CT.u+Dtb7
+=Jom+Dl%8DK?q7DBL\g0f9CI%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$Bl7Q+F(96)E--.DDf-\.
ASkjnA.8l<:IH=8@;[2rCiaM;B4YslEaa'$+CT.u+Dbt)A0>r'EbTK7F!,[@FD,T8F<G(6ART[p
DJ().Ddd0!F(96)E--.R%14Nn$;No?+Dbt)A0>>iF(o,,F*(i4BleB1@ric*Ec6)>%16oa+=CW>
FCB94-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7KOuFE2UT+Dbt)A9/l%Cht59BOr<1DfTB0+CehrCh7-"
@X0))+D5D3ASrW7DfTA@%14Nn$;No?+Dbt)A0>;sC`mq?Eb'56DImBi+EVNEEcl7B-tIC@@<<q-
$>3plEd/]SA92j$F=.M)%13OO:-pQUCi<`m+DG_8D]iJ/@VKq)@<-W9Ci<flCh7Ys$;No?+=D5P
@<?=(@j`C3ATVs;+=C]@FCB8=%15is/g)N%3@>q^ATVs;+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgr
Df-[a@:O(eDJ()7E$/S,A0>o(F*)>@Bl7Q+A8,OqBl@ltEbT*+%15^'6m-2b+Cno&@:EYdAKYT'
EZdssGAhM4F"AGT@rc:&FE8R5DIal.FD,6++E2@4@qfk(F!,FBDeF*!D'3q3G]\!Z+<XBsF*&O8
@<>pe@<6!&F*VhKASlK2BOQ'q+Dk[uDK?q4DfQt0@:O(eDJ()7E$/S,A0>o(F*)>@Bl7Q+A79Rg
@UX=hF!+n/A0=K?6m-#YATJu&F!,[<Cht^H+B3#c+=M2;@r#U(+Eh=:@N],g@r$4+F!,UE+CQC'
@<>pe@<6!4%14Nn$;No?+ELt7AKYD(@UWb^F`8IAAfu2/AKYK*EcP`/F<GOFF<G+.@ruF'DIIR2
%17&_@r#Tt-Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kk%@r#U(+Cf>/Bk;?.FD,5.@s)g4ASuT4
A8,OqBl@ltEd8d>Bl%@%+EVNEFD,5.@UWb^F`8IEF^elqEb/a&DfU+G@;]TuE,oN%Bm=31+CT)&
+EV:.+D,>(ATJu<Bln#2@3B]1BlS9,+D#_-EZf(6@rc-hF(oN)+C\bhCNXS=DKTf*ATBC4$7QDk
:-pQUCh[s4+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I8Bl%@%%15Ei8Q%]4+F?.r/g)9):dJ&O?XH`2
?XHE$6uQOL+<Ve%67sC"F`\a:Bl[cpFDl2F%16W[EZd\794)$m6qL9--Rp`_C1\h9+<VdL+<VdL
+<Ve%67sBi@:O(qE$/b,Ch7Ys$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$Eb0<6A18XAATMs3Eb0;7FD,5.
CghC,+C\bhCNXS=@X0);ASbpfFD5W*+C\bhCNXS=Anc'mF!,[@FD)e=BOr<"BkM*jF*&ODEb/is
GV0F4.1HVZ67sC$ATMs3Eb-A0@<6N5@UWb^F`7csEb0<6A0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMY^CM@[!+CQC6@rc:&F<G+:D/]pk-u`U)CLek:@rc-hFCfM9@VK^gEd8d:@:O(qE-!WS+B`W*
+Ceht+CT)-D]iLt@r$4++Co1rFD5Z2@<-'nF!+n4+CoV3E$043EbTK7F"SRX7!3?c+EM%5BlJ08
+CT;%+EM77B5D-%8g&1bEbTK7F!,R<@<<W%@;[2sAKZ,:ARlp*D]iLt@r$4+/0JG@E-WR7DIal,
ATDEp+Co1rFD5Z2@<-'nF"Rn/.1HVZ67sBkF_u(?@;Ka&FD,5.GAhM4F!,C=+EV:.+E1b2BHU`)
+CQC6Bl7R"AKYN+D/^V=@rc:&F=n"0FDlG8F_u(\3ZrKWDg-//F)t\sC2[Wi+DkP&AKW?J%13OO
:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Uh`l@:C?XARfgrDf-!k=(l/_+EqB>Ci<`m+=M>MH";&7E%)oDDKKe>@3BH!G9CF1@ruF'DIIR2
+E(_1ATDs*+D>\;+EV:.+E1b2BHV#1+Cf(nDJ*Nk/g+,,AKYMt@ruF'DIIR"ATJu-@<Q3)@V'+g
+Dk\1B4YU+%14Nn$;No?+Dtb7+Co1rFD5Z2@<-W&$>sF!A0<7=CghU.ASrk<>9G^EDe't<-OgCl
$;No?+E)41D@HqkA0<7=CghU.ASrk)$4R>;67sBsDdd0!.!0BQA9Da..1HV<+Z_;"4<Q_43ZrN_
H";&7E"*-`$;No?+Co1rFD5Z2@<-W9Bl7O$Ec#6,Bl@ku$=mj]INU<R$4R>;67sBD4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'
DBMD_DII?(GAhM4Et&IZDfm1?Dg*=;@<Q3)F)Po,+DG@t@3BK#+EqL-F<F1O6m-2b+CT)&+CS_t
F`]5Y<,WmqARTUs+Dl%;AKZ#)@:UKQ:IHRO+CoD#F_t]-FCB9*Df-\+DIal1F`&=DBOr<)FD,6+
+A,Et+DbIqF"SS,AfuA;FWb@+G%De)DL!@DEc5E'ASlK>+E;O8F*),7DK?q=EZek1D/a<"Bl8$6
+E2..@<6!&ASkjiC`mS++CT@7@UX%`Eb],F3C%4o@;0O1@rH2n$4R>7DeO#26=FY@EX`@b@;BFp
C1K=b5\FqBBl#D3Df#pj9jr'PBHT&a0fTUL.1HVZ67sBjCi=B++CT/5+E)41DBNJ(@ruF'DIIR"
ATJ:f1E^UH+=ANG$4R>WDe*g-De<^"AMPu867sa&De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2
+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0
+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.
+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)
FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t
+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0
D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#
+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>
;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19
AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:
E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OE
ASuU$DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$
AKW*<FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7
BQ%oP+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%
ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8
DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7
$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB
@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+
B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%16WbF(KG9-W3B378uuM-OgCl$;No?+A,Et+DG_8
ATDBk@q?d!De!3lAKWQI-u!F7A18X8F!+m6B5_^!+E2.*@q?cpDfQt/A0>Q(@j"B>6m,oKA8c@,
%16T`@r,RpF!)iEC2[W1%13OO:-pQUF`V,)+C]U=F)Po,+DkOsEc6"[+BM*&;FNlG8Nf*W4"qe(
+?MV3BQ%a!+EqaECER_1F*&c=$;No?+BM*&;FNlG8Nf*W-YRF8AL@oo%15is/g)QVC2[W3+D#S6
DfRKRD.Rd0@:s-oFCf]=%15O%;FsJV6ng;X3Zoe[F`MM6DKI"6Ec6)>+DtV)AKWC9De*KfBkhQs
?R[+8Dfd+CATT:/$:Rij8P2cH0JP^O+=CZAEcP`/F<GXIBlmo/DIIBn+=LuCA92*lC2[Wi.3NMH
F<GX9F=.M):J48O:IHlj4ZX].-Z3iFD..NrBOu64%13OO:-pQU@:WmkA7]RgFCcS5@VTIaFE8R:
Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63BkAt?G@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2
%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.@:Wn]Ec<.H
+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!%16f]/g,@LG[Flo
De*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqE
A1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N/4ChId-
+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is/g,1GAn?!oDI[6g
+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#d
De*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi
+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b+D5R@+>#2gB5S.c
.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t$?]uE3Zp4$3Zp*c
$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&C
DIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;uGp%6N
ARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3DIal2@<Q3)Ci<`m
+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</LCi^_6De*K'AScF!
/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB
+EqaEA90:EB6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)
Eb0E4%172u4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3
Dfd+CFDl+@Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBNe)@rcK1F(oH%
DKK]?+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtF$2Q,0d^pX%13OO:-pQUF(fK4F<G7.
CiCM/DfQt5Ec6)>F"_TWBlmp-%16c]4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*.fF$2Q,0d(.GE,KJ7
><3mT/g)qmB6%r6>n%,M$;No?+EM47Ec`F;ASc<.Df-\:F`\aE@VTIaFE8R=DBNt2G%l#/A0>f2
A7]d(Ao_g,+Cf>#ANC8-:-pQU+<VdLBQ>4P+<XEG/g,">@rcJs$;No?+<VdL+D>d<1*@]767sBn
Ec6)>Et&IO67sB'0ea_`EZd%Y+AP6U+DbJ-F<G[:DBO.AEb'5#$>=HC3Zp4$3Zp*c$>F*)+C\bi
EarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5+D>S1DJUGD/g,?I$9AV'
BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'BP_X*C`msF
HS-Fh/g,?I$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.AoD]4F*)G:DJ()#DIal+BleA=D..Nr
BPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&Earc*GAhM4+EM47Ec`FG
AU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%
:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*
+>Y-$+>=630Hb%MF!,`;$9AV'BkAt?@UWef@p`YZDe*2tG<IQ$GT^O7C`k)Q+<Ve;D_</V+ED%8
F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$0d&YFHQZiA+<VdL+<VdL+<VdL
A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?0KgY%4Y@jK/g)Pn3dE.s.kWJ!
0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&//-@6j^/j:Cg%14Nn$4R>;
67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4+=DAOEb$O?+<VdL+<VdL:-pQU
GAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOsEc2Bo:-pQU+>G![Ch7i6-Zj$9
F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)11E\_$0F\@C+EM@1GT_8@$9AV'BkAt?@UWeWCgUUc
De*2tF)3ul+F##>Ble59Gp$X9/g,4O+ED%8F`M@P+D#G$/e&.9GUtg'+E2IF+F-%\Bl\9:@rH4$
ASuTs?V4*^FDl)6F!,O?%14Nn$4R>;67sC$AS5RlATD4$AKYr7F<G+.@ruF'DIIR2+EqaEA0>B&
Df]tBEb/ioEb0,uATJ:fEb09&Aj&0t1E\_$0F\A'AhG38@:XCg?X[\fA7$Hs4Y@jtAThu7-RU$I
D_</M+ED%8F`M@P+D#G$/e&.9DCdD].3Kja+>#3-0RFuu+EK[u0Hb"EDdmc74s4`+/q#?i%14Nn
$4R>;67sBo@;]V$+Cf41A8bs#BOu"!ATDi$$=n'bF(95R3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M
4!uCN67sW5.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa%16Wa@rus;4ZX]A+?CVm
@ruNo@;9^k?Q^aT0fq'N0KUX0-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\
%15is/g+\=F)Yr(Gp%!CF`&=?DBO"1Eb/g"+CT.u+ED%8F`M@BDJsZ8+Eh10F_)!hF(fK9E+*g/
4ZZjk>9GXD3\i$;%13OO:-pQUARoLs+Cf>,D..<m+:SZG:IA,V78?fL:JFPL:..6++=D5DDg-//
F)rICEZc_WH[\_=I4$Bi%13OO:-pQUEb/Zi+=84TEbTW,+D,>(ATJ:fEb/Zi4ZY;@3\_s0?!oc[
/grM2-9a[C1Eee5.4H\T$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$?B]dA8Z=.DEU$:
+Z_AD-nul+0d\;S?p$\,-o3V*5!UMP+Z_;+.4H\T$?pN)FCf?.F`'?'-sJ_T1Eee6+Bp9;-nul+
1*Bk14?tMI1GU:@5U\E33\W!3.3Mn*$4R>;67sC$ART*l<'`hnA7]RkD/"*'A0>u&@VfTuAnc'm
F!*%WAmob&ATAo8BOPd$-urm-A9;?2+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?B]d
A9;?;4ZZe.+?V_<?SWrl+=K6s@4iuO/1)u5INViU+?V_<?SWa.3ZohV+=nW`-o!E&@4iuQ?Q_KS
HTESuI4cWj0edr_/h%uO.3L#n1OEO_.3L2pINU?g3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$4R>;
67sC)EbTW,F!,R5@VfUs+CT=6<'`hnA7]RkD/"*'A0=Q8+EV18D/!lrFCeu*FCf]=+>"^WAS!!#
Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*5!UMP+Z_;+
.4K]g><3lT><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'5U\0K-o!%s
/0Zet5U\3:5U\*703g+R0gI-M-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f.3MhU+FPjd
0d'[]+?Lc%+=K6s@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>@rcL/%173!
4ZZjk4!80X%16ro4ZZjk4!6:9,$uHS+D5d=+<XEG/g)VrFEhm:$>jN@3aEji+>PYq?Q_EQB657=
+AP6U+=]!XC3'gkD.Gdj>p)3O1,gCa+?L]YF<D\K:-pQU.P>RHEbf3(GA[isD0S3)>p)3O1,:%\
+?L]YF<D\K:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@
F(96)E-)NrDf\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK
.3L/a-S?bh/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q
@ruX0Gmt*qF?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13
E"*.hCcsg%-nlf*0I]8%F:AQd$;No?+Du==@V'R&De:,1@VTIaFE8QV+E_a:A0>?,+Eh16BlA-8
+=MASBl%i>+DkOsEc6"A.!'*KAT2d6/0JA6AT2d6/0HPt/h%oWAfu&5ATMF#F:ARP:I7uC3Zp.2
%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2
ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`3[Y@D%15is/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6
F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=
0..29:-pQU6rcrX:f:=j5u^B<3Zoe'C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!
Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ
9LV6F8jl6<;a!/a4$"`:%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#
AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=
FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4
De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB
+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4
+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:
AT0">>9G^EDe't<-OgCl$>OKiF`V,7@rH6sBkLm`CGIV>67sa&De+!3ATD:!DJ!Tq@UX$pF"Jsd
AU%X#E,9).8l%htF`V,7+Cf>-Anbn#Eaa'(Df-\=@rc:&F=n"0:-pQB$;No?+B3#gF!)TH@rc:&
F<G:=+<Y6?ARfk)ARlomAS,k$AKXT@6m-DWC1UmsF!)T6Eb-A'Eb/[$ARmD98TYCK:-pQU@ps6t
@V$[)F(Jl)FDi:BARo@aBl7K)@;]Tu@s)j7Df'37AKZ/)EbTH7F!+t/@<6K4DJsZ8F"SS7D[d%K
67sBt@;BEs+EV:2F!,O6EbTK7+<Y*&FD5o0+<Y]9DIIBn+DGp?FDi::De+!3ATD:!DJ!Tq/no'A
+CT.u%15is/g+YBE-WR?F=\PYBln#2H#IhG+D#(tFE8uUFDi:DBOr<'@;0U%C2[W*A8-'q@ruX0
GrcBA:-pQB$;No?+F[a0A8c@,>\@VcATD3q>\\1f%15is/e&._67sB[BOr<(Dfor=+Dbb5FCeu*
@V'@oG9C=7AKYW(De'u#@;]UiA79RkF!,(5EZfC6A7]@eDJ=3,Df.0:$4R>;67sC%D/XQ=E-67F
-YdR1F`V,7@rH6sBkK&4C3(M/G\(B-FD5W*+>,9!-OgCl$;No?+AbHq+ED%%A7]d(Bl5&.De+!4
Bl"o%CghC++>"^GF`MM6DKI"BATW$.DJ()+F!,R<AKYMpAmoguF<G+.Eb/a&DfU+4$;No?+D,P4
+EV:.+BN8pA8c[5+Eh=:F(oQ1+E(j76"FnCAKXl^@:Wqi/g+&'F(KG9AoD]4DffZ(EZe1H7Nc__
@:WqiEt&IO67sBW6q1'C5t".>?X[\fA9E!.CgT=d-UTq":i^JeEa`f-7VQ[MF!)lU3&W3j6"FnC
AR%N2Ec5DqF<FIm@:Wqi+@JS%;Is9IATD$A@rcKcA2>tnAU%c6%13OO:-pQUEb0<'F<F1'F!+:I
7Nc__@:Wqi+EVNED..NrBHToC6mm$u:ddbqEb/ZiATAnF+CoC5AoD]4-u*71DKB`4AM.P=ALS&q
:-pQU:ddcNART+\EaNQg4ZX]^6q1'C5t".>?X[\fA9E!.CgRVY%15is/g+S=FCfK1@<?4,AKXKV
Df^#A@rc:&F<G(3D/`p*Bjtmi+ED%%A7]cj$;No?+AbHq;FNl>78dK$C2[X*FD5Pu4ZXrX3a>L%
DeF*!D'2;^Ch7Zm7qcg^FD#`5>\A,$Bk;KnB6/61ATopc/nK9=-OgCl$;No?+Ad)iAn?"'ARlp-
ARZckEc6/CATAo-DBN\4A9E!.C`m5(@<6K4/KeS8AmoguF<FY!DId[0F!*qdEb.^YGT^O2Eb/a&
DfU+4$;No?+BMWG0OJ7'De+!4Bl%->3[[9U>YoHZB6%Et+@^']ATM*NDgH,6CgeGUBl[csDg5N!
Bl[csDg3mGG\&63$4R>;67sBZARfXrA79M(+EqC++C]A0GB7>9+DG^9C2[X*FD5P6@r,RpF!*%W
A7]@]F_l.B=(uP_Dg-7FA8-'q@ruX0Gmt*U67sB^='%+`@;9^kF`_>6?TgFt6TSIKEc5T2@;R,V
Bl%@%>Y/gTATD["F<F"sE,9H5ATD$I79EA[:JsV679Du+%13OO:-pQU<+U;r+D#(tFDl1BFDi:E
F(HJ<BOu'(Ecl8;Bl7Q+8l%htBl5%AC1D1"F)Pl+/nK9=.3NPH+BN8pA8c[5+EMgLFCf<1%15is
/g+"j01nc6+Cf>-Anbn#Eaa'(Df0V=@<,p%DJsV>DIm<hF)tc1Bl&&;@;p1%Bk:ftAoD]4-u*71
DKB`4ALqD;ALS&q779L=:/aq^7:0J<De+!4Bl%->3[Z+=3a>L%DeF*!D'2;^Ch7Z1.!R^0.9pb/
FCfE"A1K08DJsW.E+*9-.kYCXAKiK2$>j3eAO9gHBk'b26r[`=FE92l:-pQ_D..3k6=FqL@nKNb
<+U,mF!,NU/Ken=CLnV\:IH=7@<6-m+EV19F<GX7EbTK7/e&._67r]S:-pQU<+oue+EM%5BlJ/:
B4YslEaa'$F!+m6F(96)E-*3FDe:,4@;]UoD/=J?DfTB"Eb/c(8l%ht@UX=l@grc?67sC&ATMs7
/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.%15is
/g)QO@<6!/+Dbt+@;KKtGA2/4+A*b)0HiJ4.3NPL+=Joe3\r3-FCfN8+D,P4ASGdpF"Rn/:-pQB
$;No?+B3#c+<Y`>H=\3A+E(j7+<Yc>AKW+.ASu("@<?'k+<Y`8EbTK7+<Ve@F!)SJ@rH7,Ec5c1
ARlo+@X/Ci:-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h
.3N2H@qB4^F!,R<AISuA67sBuF_tT!EZf:4+EV19FE8R=DBO%7AKWC9De*<cF(o-+ATMs7.3N\S
Blmo=%15is/e&._67sBhF)uJ@ATKmA$;No?+<Vd9$;No?+<Vd].3Lo!@rH6sBkMR/ARloU+Co2,
ARfh#Ed8dV8l%iS78m.p$;No?%15is/g,=KEaiI!Bl,mRFDi:EF(HJ)D`S=7:-pQB$;No?+<Ve%
67sBnASu("@<?''F(96)E-)Nr:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG
$;No?+<VeID'13C@;BF@@<6-m8l%iSATMs7-OgDX67sAi$;No?+<Ve%67sC$F`&=9F:ARP67sB'
+=Joe3\i-,4DJhDFD)dEIS*C(<(0_b01')gBk'b26r[`=FE9'KC3(a3$;No?%15is/g+SFFD,T5
3ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JPG"F_i`l%15is/g+Y;@;]^hF#kEq/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/
F<Dr?@<6!-%16oi@:UK.C2[X)ATMs)E[M;'D..3k;f-GgAP,`d<+U,mF##IF67sa)@;BFQD/X3$
8l%iSATMs7+EK+d+DkP&AKXT@6m-PfDeio,FCfN8+EM%5BlJ/H$;No?$;No?+B3#gF!,O6EbTK7
+D58'ATD4$ATJu&+EM%5BlJ/:+E(j7Ea`irDf'<9+E):2ATD?m+A,Et+EMC<CLmiJ67sC&ATMs7
/g+,,AKYVsDImisFCeu*+EM%5BlJ/:+Ceht+<Y-)+<Y]IDCcnQF*(i2FD5W*+DG^9+EV:.$;No?
+=L]-F(HdCCi<flCh4`5Bln#28g#N9+Z_A-+E)9C-nlf*1FXGgATMr9AoD^$BkM=)/db??/db??
/g+,,AKW+:BmO>5+<YT7+<VeKBOr;/B4YslEaa'$A0<"9@rc:&F<D\KBlbC>+Cf>-FE2;9Ch7-"
+C]U':-pQU-r`W6<'sG]:/iYp+<XWpF*)IG@<,p%+ED%4ART[lA0>Su+<W(378m/Q:K:.h.3N2H
@qB4^F!,R<AI;1!/g,%SD.7's+E(j7FCfN8F!,17+EV:.+=LuCA92U+CLqU!F*)IP+EM[>FCd'3
:-pQ?:-pQU@<6L4D.RcL$;No?$;No?+Eh=:@UX@mD)r#!67rU?67sBhF`_;8E]P<c8oJB\+@Ih)
6=FY@EXGQ./g+YEART[lA3(hg0JPG"F_i`l$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]$=e!aF`MM6DKI!K@UX=h-OO[.@:UK.
C2[X)ATMs)E[M32@;]dkATMs.De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht
8g$o=C1Ums+@KpRFD5Z2@<-W@%16-);H$._:-CWc0J5@<3B8oD%15R#9LM<I4ZXs'ASu("@;IT3
De(4)$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRL
Ea`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gk
D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@
A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eB
FCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[Wo
G]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!
$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+
A9Da./no'A%14Nn$;s;d76sj@4ZXs*3&!3;%15Kl:dn,I;a!/a0H`D!0F\A"@<>p2C1_0rATJ:f
.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2.3N>G+CQBb+E2@>
B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5DJNfo+Co1rFD5Z2
@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7+CoD#F_t]-FD5W*
+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/FC?h;Anc'mF"&5?
A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;
DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!
FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-
D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje
:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,
Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQ
D.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6
ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et
+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogq
G%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De't5
%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH6WHiL:/hZ06U=OJ
8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-SR/5/ibpK-OgDP:J=/F;E[&gB4Ysl
Ea`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARrA7f@j@kVS8A1hh3Ado(r%16!%
9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8
E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO7W3;iD/XH++DG_*DfT]'FD5Z2
+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J
+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)
%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqB
Bl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg
:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-SR/5/ibpK-OgDP
:J=/F;E[&gB4YslEa`c;C2[X(Dfp)1AL@oo:eX/S7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-OgDV
5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkC2[WnATf\?
C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^78--9;aii1-YbUp
2(&h?6q'p@:./#D3Zp+!3Zp*c$>3pfATD3q05>E9%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%14Lu
De*p-F`Lu'.3N,=DKK<$DK?qAATDKnCh\3,A0>Ds@ruF'DIIR2+CoV3E$043EbTK7F!(o!-u*[2
A7]p8C2[W6F`_>6F"&^a<+oiaAKYN+D/^V=@rc:&FE8R7Df0Z*Bl5&%Cht59BOqV[@rGmh/0K%G
F*&O7@<6"$/0JDEBl%<&F(96)E--.P+CT.u+CoD#F_t]-FCB9*Df-\?F(Jkk$?U2/A7]pqCi=88
@;]TuD..-rFCAm$+A,Et+CT.u+ED%0@<?'k+EMgLFCf<1/e&-s$:K#RE$043EbTK7F!+n3AKYet
EbAr+8g&1bEbTK7F!,R<@<<W.Ddd0!A8,OqBl@ltEd8*$DdmHm@ruc7Bl8$2+A,Et+Co1rFD5Z2
@<-'nF!,[?ASrW2F`&f@$4R>7:IH=HH#n(=D'3A'@ruF'DIIR"ATJu&Eb-A+Df9//AU%X#E,9*,
+E(j7BQ&);8l%ht%16TRDBND"+E_a:A0>u4+C]J-Ch+YuDf'H0AU#=i+EMgLFCf<1/e&-s$;+)^
+ED%5F_Pl-F!,R<AKWC3@<>p2C1_0rATK:C@:WneDD!%@$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"
ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=
BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(
D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH
+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'n
DfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"C
F`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("
@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%
@:s-o@<=O>$6UH#$6UH6BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1
De(G=@:s.)%14Nn$3                                                         ~>
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
zz=:zz,'0 EXPPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS '
zz=:zz,'SOCLEAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl c'
zz=:zz,'learso clfrbtcl createmk dec85 dumpdictdoc dumpdoc dumpgs dumpheade'
zz=:zz,'r dumpntstamps dumptext dumptm dumptrailer dumpwords extscopes fap '
zz=:zz,'fmtdumptext fromascii85 getallts getascii85 halfbits htclip jnb jsc'
zz=:zz,'ript jscriptdefs makedump makegs masknb namecats nlfrrle nounlrep o'
zz=:zz,'paqnames parsecode putallts rlefrnl sexpin sonl tabit toascii85 uqt'
zz=:zz,'single wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore C'
zz=:zz,'NCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNLIST CNMARK CN'
zz=:zz,'PARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ERR051 ERR052 E'
zz=:zz,'RR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060 ERR061 ERR06'
zz=:zz,'2 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR070 ERR071 ER'
zz=:zz,'R072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 ERR081 ERR082'
zz=:zz,' ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR090 ERR091 ERR'
zz=:zz,'092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 ERR100 ERR101 '
zz=:zz,'ERR102 ERR103 INVGROUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT '
zz=:zz,'OFFSET OK050 OK051 OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 '
zz=:zz,'OK061 OK062 OK063 OK064 OK065 PATHTIT READSTATS afterlaststr allnlc'
zz=:zz,'tn allnlpfx allnlsfx apptable appwords badcn bnlsearch bnums checkn'
zz=:zz,'tstamp checkopen checkpath checkput closedict createst defwords del'
zz=:zz,'stuff delwordrefs didstats dnlsearch freedisk freedisklinux freedis'
zz=:zz,'kmac freediskwin fullmonty getdicdoc getdocument getexplain getgste'
zz=:zz,'xt getntstamp getobjects getrefs gslistnl inputdict invappend invde'
zz=:zz,'lete invfetch invreplace islib iswriteable iswriteablelinux iswrite'
zz=:zz,'ablewin jdatcreate jwordscreate loadalldirs loadallrefs loadwords m'
zz=:zz,'ainddir newdparms newregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nu'
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
zz=:6015{.zz
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
zz=:zz,'sic001 putNameTimestampsBasic00 restdBasic01''),(<(<''jodcrushtests'')'
zz=:zz,',<0$a:),(<<;._1 '' jodextensiontests grplitBasic01''),(<(<''jodlargete'
zz=:zz,'sts''),<0$a:),(<<;._1 '' jodpreparetests loadSmoketest0 loadSmoketest'
zz=:zz,'1 loaddumpSmoke00 loadtest001dictionary''),(<<;._1 '' jodsmoketests c'
zz=:zz,'ompjSmoke00 compjSmoke01 didSmoke00 dnlSmoke00 edSmoke00 globsSmoke'
zz=:zz,'Assign000 globsSmokeDoc00 grpSmoke00''),<(<''jodstresstests''),<0$a:  '
zz=:467{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c6C7+>P&o1E\M4+>GYp1c?I22]sq4+>GYp2)cX42'=Y3+>GYp2)6:/1a"Y0C2[Wl@<6-mFCfN8
F(/R!Bk&9-ATMs7+>"^WD..6s+EVNED.R6lF_r7B@ps1b+EV19F<G(%F(KE-De*?uF`V5<ATMs7
@rc^5BHVD.F*)IG/Kf.HF*&O7@<6"$+Co&)BkM<pA0>u4+CfG#F(c\2De*U$A7^"-ASuR'Df0Z.
F*)J7G][M7F(oQ1+EV19FE8QV+EV19FE8R:DfQsm:IH=:G][M7F(oQ1F)#W(Cgh?sATVL)FE;8,
EbAr+An>ClBjtmi+EV19FE8QV+EV19FE8RKBln#2Cgh?sAKYH)F<G1,@<6-lCh4`"@<>pmDe*g-
AT2'uATVL)FE;DAAT2'uAKZ)+F*&O8Bk)7!Df0!(Bk;@#De*p+Deip+ATMs7F)>i2AKZ)+F*)IG
/Kf+O@;Ka&FCfN8+Cei$ATJu(BOt[hBl7Q+@rHC!+EqaEA9/(bC2[X(FE1r6F*(u7FE;MFEb0<5
+EV19FE8QV+EV19FE8RKBln#2Cgh?sAKZ)5+Eh=:Gp$p3EbAr+A79Rg                   ~>
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
