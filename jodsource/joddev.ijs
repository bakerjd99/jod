NB. JOD dictionary dump: 28 May 2018 09:56:57
NB. Generated with JOD version; 0.9.994; 11; 27 May 2018 18:37:21
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

JODTOOLSVMD=:'0.9.995';13;'28 May 2018 09:56:57'

JODVMD=:'0.9.995';13;'28 May 2018 09:56:56'

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
0fUp20fU:3+>G_r1*A>+1,1L+1,'h++>Gl90JXb*1a"Or2E!NT+>PVn1*AS31*A;++>P&p0K:j2
0esk,+>PW+2BX_.+>P&o3&NNN+>GYp1*A>31H-F8+>P&o1H7BR+?(Du+?;>93$:1'1*A>+1c.-6
0ea_*+>tr/0H`).+>P&o1c[640fL41+?2>;+>Get1*AJ11a"M-+>P&o1bgp30f^@3+>l,9+>Get
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
1,(FB+>>f:2)[KQ2@<&P6rZrX9N+8X8PDNC8Q/Sa;HYb4:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ1
3Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>l)#+@KX[ANCqj+A-cm+>PW*2'=S,3\`EO1,'.E$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp:>+<X'\FCdKU2BYV7
C`kJe0f:(.0fh'H3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=Wi
D.7's3Zp:?+<X'\FCdKU0f:(GF_i0U0JPF-0KD0O2**QS$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$0H_K+@<?'A+>G_r8p+qm1,(F?+>>f:2)[KN2[Tm!
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2DH<s6t(1K3Zp.7
+A-cm+>PW*2'=V-3\WBO1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&
+AR&r@V'R@+>ttt+@KX[ANCqg2]t_8C`kJe0f:(.0KM'N3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=:+<X'\FCdKU0fL4IF_i0U0JPF-0etdG3'&`P
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=$1a!o/@<?'A
+>Get8p+qm1,(F?+>GW41bh$H2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!n
Bl%<&:3CD_ATBgS2DlU"6t(1K3Zp.9+A-cm+>PW*2'=V13\iNQ1c,OH$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+>u,#+@KX[ANCqg2]t_8C`kJe0f:(.2``WI
3\`Q#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp=>+<X'\
FCdKU1,0nDF_i0U0JPF-0ek^C2``]L$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8
+@:3bCh+Y`F_tT!E]P=$3$9>3@<?'A+>PYo8p+qm1,(F?+>GT30f(jH0a\6p:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2E;m&6t(1K3Zp16+A-cm+>PW*2'=V-
3]/]S1H>dL$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?(ts
+@KX[ANCqh1E];4C`kJe0f:(.0fh'E3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
3%uHt6?R!YA0=WiD.7's3Zp@9+<X'\FCdKU1,C%FF_i0U0JPF-0ek^E1HI<I$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!E]P=%1*@]-@<?'A+>Pbr8p+qm1,(F?
+>G`71H7EP3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmF+<X!nBl%<&:3CD_ATBgS
2_uR!6t(1K3Zp17+A-cm+>PW*2'=V23]&NO1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<O0H_K)F_PZ&+AR&r@V'R@+?),"+@KX[ANCqh1a#D5C`kJe0f:(.2**QS3]/`$$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mo/ibOE3%uHt6?R!YA0=WiD.7's3Zp@=+<X'\FCdKU1,pCKF_i0U
0JPF-0f;!K3'&`M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/]8+@:3bCh+Y`F_tT!
E]P=%2BX,1@<?'A+>Po!8p+qm1,(F?+>G`72).-H1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibmF+<X!nBl%<&:3CD_ATBgS2`Dj%6t(1K3Zp1<+A-cm+>PW*2'=V-3\W<M1,fOI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O0H_K)F_PZ&+AR&r@V'R@+?)8&+@KX[ANCqh3?Uq:
C`kJe0f:(.0KM'N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=Wi
D.7's3Zp."+@KX[ANCqi+@1-_+>PW*2'=S43\rQQ1H5^K$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp4$6$6f_1,(F?+>>f:0fM-I2$sZt:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-+F_;gP
0JPF-0ebXD2EEWM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B/l=+@:3bCh+Y`F_tT!
E]P="+<X'\FCdKU1E\u+B-8r`0f:(.0fh$L3\rW#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3&Mg$6?R!YA0=WiD.7's3Zp:&+@KX[ANCqi+@1-_+>PW*2'=V.3\rNP0Ja%C$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp4$6$6f_1,(F?
+>GT31c7<K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibmK+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Y-+F_;gP0JPF-0f;!G1cdKN$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B/l=+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU1E\u+B-8r`0f:(.2EEZM3\WQ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3&Mg$6?R!YA0=WiD.7's3ZpF*+@KX[ANCqj+@1-_+>PW*2'=S5
3\WEP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqk+@1-_+>PW*2'=V33\iWT1c>[J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqk+@1-_+>PW*2'=V33\rcW0fKFH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GVo+@KX[ANCql+@1-_+>PW*2'=S5
3\WHQ0ej"B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>GYp
+@KX[ANCql+@1-_+>PW*2'=V-3]&iX0f04E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>G\q+@KX[ANCql+@1-_+>PW*2'=V.3\`KQ1,]IH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>G_r+@KX[ANCql+@1-_+>PW*2'=V.
3\iNQ2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gbs
+@KX[ANCql+@1-_+>PW*2'=V33]/]S0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>Get+@KX[ANCql+@1-_+>PW*2'=V53\rNP0fKFH$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqm+@1-_+>PW*2'=S4
3\iKP0f9:F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>Gl!
+@KX[ANCqm+@1-_+>PW*2'=Y/3]&WR1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O
2'=#.F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqo+@1-_+>PW*2'=V-3\iHO2)GXI$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<O2'=#.F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqo+@1-_+>PW*2'=V-
3]/ZR0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,
@<?'A+>GPm6$6f_1,(F?+>>c91c[TO1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0ea_9F_;gP0JPF-0KD0K1HI<K$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B/o>+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU0ea_9F_;gP0JPF-0ebXD
0KM$H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp."+@KX[
ANCqg0d&c)B-8r`0f:(-3'&lT3\iZ%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2
F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.4+@1-_+>PW*2'=V13]&]T0K'7F$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>GVo6$6f_1,(F?+>G]61cRNO
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibU.+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU
0d'D+E$-ni0f:(.2EEWN3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp.";e9nj1,(F?+>Gc81bh$J2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibp7+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU2'>\)F<E=m0f:(.1cd?H3\`;q$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.2+@]pO
+>PW*2BX_23\`EO2)YdK$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp.6+AH9b+>PW*2BX_13]&cV0Js1E$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp13+AH9b+>PW*2BX_/3\rKO1-#[K$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp13+AH9b
+>PW*2BX_/3]&`U1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<O2]s50F_PZ&+AR&r
@V'R@+>b2`6t(1K3Zp13+AH9b+>PW*2BX_/3]/WQ0K9CH$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+?:Q:@;[2C0JPL/1,1gF0KLmF$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3Zp1#+@KX[ANCqo+A-'[+>PW*
2]sk13\iKP0fB@G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS
1E[f.@<?'A+?:Q:@;[2C0JPL/1,1gG0KLmG$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B83)6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2'>A"@N[E[0fL401cd<F3\`N"$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+@]pO+>PW*2]sh3
3]&QP2)>RH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P+<X!nBl%<&:3CD_ATBgS2BX,1
@<?'A+>Pes7V-$O1,(FA+>G]62)%'I2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibp7
+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU1,U1DARZc;0JPL/0fD'K0KLsH$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B83)6?R!YA0=WiD.7's3ZpC)+@KX[ANCqh2'>A"@N[E[0fL402EEZO
3\iW$$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3?TG2F_PZ&+AR&r@V'R@+?:Pe6t(1K
3Zp18+@]pO+>PW*2]sh63\W?N2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0H_K)
F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2]tS$@N[E[0fL410KM$H3]&]$$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3A;Qu6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,g=FARZc;0JPL/1,(aG
2**TP$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8c9+@:3bCh+Y`F_tT!E]P<t1*@]-
@<?'A+>Pku7V-$O1,(FA+>PW32).-J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpH
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU1,pCGARZc;0JPL/1,1gE0KM'M$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8f:/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp1;
+@]pO+>PW*2]sk13\`HP1GfFG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P0d&%jA7]p,
+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU1E]D#EZd+k0fL403'&iR3\`Gu$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3ADX.+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Y-7@<*JG0JPL/
0fV3N2**KM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Fu]6t(1K3Zp.4+AH9b+>PW*2]sh33\iBM1,91D$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0eskG@<*JG0JPL/0f1pI1cdEJ
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_
6t(1K3Zp.4+AH9b+>PW*2]sh33\rZT1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU0eskG@<*JG0JPL/0f1pI3'&lP$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.4
+AH9b+>PW*2]sh33]&WR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,
+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f'qH@<*JG0JPL/1,CsF0KLpB$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.5+AH9b+>PW*
2]sk33\WKR2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`
F_tT!E]P=&+<X'\FCdKU0f'qH@<*JG0JPL/1,CsG2EE]O$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.5+AH9b+>PW*2]sk33\iEN
1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
0H_K+@<?'A+>GYp9jr&b1,(FA+>P`61,V*K0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU0f'qH@<*JG0JPL/1,CsI3BB#U$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo+@KX[
ANCqg1E]D#EZd+k0fL411HI?K3\`Gu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/
+Co&,+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp.6+AH9b+>PW*2]sk13\`?M0K0=G$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>G\q
9jr&b1,(FA+>PZ41,V*L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=
6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0f1"I@<*JG0JPL/1,1gF2``ZK$47,867sBZH#n(=D)reS
De*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg1a#M$EZd+k
0fL410fh*G3]/f&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&
:3CD_ATBgS0fL3t6t(1K3Zp.6+AH9b+>PW*2]sk13\r]U1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>G\q9jr&b1,(FA+>PZ4
1b^sI3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's
3Zp.;+<X'\FCdKU0f1"I@<*JG0JPL/1,1gI1-.0H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg1a#M$EZd+k0fL410fh0N3\rJt
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo
6t(1K3Zp.6+AH9b+>PW*2]sk23\W<M0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P
1*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>G_r9jr&b1,(FA+>PZ41,1gE1("?q:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU
0eskG@<itN0JPL/1,1gH2**NI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqg1*B;"Gp"jr0fL411-.-H3\rJt$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp.7+AH9i
+>PW*2]sh63]/lX0K'7F$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u2BX,1@<?'A+>Gbs9jr;i1,(FA+>Gi:1G_'J2@9cu:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0fC.K@<itN0JPL/
0fV3N2**KI$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8i;/KeS8Fs%noF_PZ&+AR&r
@V'R@+>Po!+@KX[ANCqg2BY_&Gp"jr0fL403'&lU3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp4$8p,"o1,(FA+>GW41c@BN
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpI+>"^HATf1=6?R!YA0=WiD.7's3Zp44
+<X'\FCdKU1,pCKF`&<W0JPL/1,(aD1cdHM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B8i;/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqh3?V73E$-ni0fL410KLmB3\iDs$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3AM^/+Co&,+<X!nBl%<&:3CD_ATBgS1GU'q6t(1K
3Zp:&8muT[1,(FB+>Gi:1,(aH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^H
ATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2BYV#DBL\g0fU:21-.6J3\rMu$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0d%T,@<?'A+>Pht8muT[
1,(FB+>P]52)73K1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!Y
A0=WiD.7's3Zp1#+@KX[ANCqh2BYV#DBL\g0fU:21HI3G3]/]#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pku8muT[1,(FB+>GW4
1H@KM1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's
3Zp7%+@KX[ANCqh2]t_$DBL\g0fU:11-.6O3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pbr7V-$O1,(FB+>GQ20JkgG0FA-o
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[
ANCqi+AH9b+>PW*3$9n83]/cU0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7l
A7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0f:(J@<*JG0JPO00fV3K2**TK$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp@(6#^ie
1,(FB+>GQ22)dQR2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!Y
A0=WiD.7's3ZpF*+@KX[ANCqm+@0se+>PW*3$9q13\WEP1,oUJ$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+?(E/E,m'V0JPO00ek^D
0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@
+>GSn+@KX[ANCqm+@0se+>PW*3$9q13\`BN0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P1E\7lA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+?(E/E,m'V0JPO00ek^D2**QS$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[
ANCqm+@0se+>PW*3$9q13\`NR1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E\7l
A7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>GPm6#^ie1,(FB+>Gi:0ek^F0a\6p:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibpJ+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0ea_9
E,m'V0JPO00fV3K1cdKM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l</KeS8Fs%no
F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg3?UV,EZd+k0fU:13'&iP3\`As$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE3AVd0+Co&,+<X!nBl%<&:3CD_ATBgS0fL3t6t(1K3Zp16+@0se+>PW*
3$9t43\`QS0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<P1E[f,F_PZ&+AR&r@V'R@
+>Ghu+@KX[ANCqh0d'2!Gp"jr0fU:13BArS3]&W"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE3AVd#6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,0nG@<itN0JPO01,(aC2EENL$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8l<+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo9jr;i
1,(FB+>PW31,_0M3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>P_q9jr;i1,(FB+>PZ41c%0H1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1*@]-@<?'A+>P_q9jr;i1,(FB+>P]50JbaG1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>P_q9jr;i
1,(FB+>P]50f;!J2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS1a!o/@<?'A+>P_q9jr;i1,(FB+>P]51,1gF0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>P_q9jr;i1,(FB+>P]51,h6J1^XQs:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Pbr9jr;i
1,(FB+>Gi:1,h6N3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS2]s52@<?'A+>Pht9jr;i1,(FB+>Gf90KD0L2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Pht9jr;i1,(FB+>Gi:1,:mE2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Pku9jr;i
1,(FB+>Gi:0fD'I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibpK+<X!nBl%<&:3CD_
ATBgS0ea^m6t(1K3Zp1:+AH9i+>PW*3$9q83\iNQ1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<P1a!o-F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh2]th'Gp"jr0fU:13'&iS3\iGt$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3A_j$6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,g=M
@<itN0JPO00f_9P0fh-G$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B8r>+@:3bCh+Y`
F_tT!E]P<t1E[f.@<?'A+>Po!9jr;i1,(FB+>>f:2)[KQ2[W>iF(KB8ARn5MEc5u>1,Vfn/h0Y+
F(KB8ARn5MEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R=O$;No?4?Y)I.3N,@@<6*C
+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'F_t]-F<DuHDe(M92)$j9%15is/g)o0+AH9b+>PW)2'=V0
3]/TP0f0=H%144#+<Vd`+>P'MDJUFCA9B7/$Gs,i@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43
+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb-o!.nAncKN+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUh
BIP'GD]ib3F*2M7%15is/g,7L@<<W#DL!@BF_kk:F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4
D]iq?ChsOf:-pQUFCAWpATKIH<+oue+D,>4ATJu9BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is
/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9FD,6++CT;'F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA+
+=CW:D^QY:$;No?+EqOABHV22+EM[>FCfM9GAhV?A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V
0JG@,0f1pF1cdBH%13OO%15is/j)9F1+=>UEaa$&3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-
EZed5E,oM48g#uD0Jj4G:-pQUA8,OqBl@ltEd98[+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!
D/`p*BjtdmBlnV0$;No?+D>>,AKWQIA8,OqBl@ltEbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9
F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP+DG_(Bk(RnATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0
EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/+EDCCFD5W(F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL
%13OO+<VeIAS5Nr-YddACF;1k@ldk0@<,mm@ruF'DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#
_R!ckD..-r+D#S6DfRl]C0u!m@:TfS_Qt@-+D,Y*AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L
.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4@<,p%DJs_A@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)
F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk@;]Tu@;Ka&FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4
F!+n3AKYDtF)N1CEa`p+ARmD9+B3#gF!,%7Ec5t@GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6
@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1@Wcc8BlbD7Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is
/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"
H#R>9%15is/g)tn6#^ie1,(C>+>GZ51G_'K0b"I!$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'l
AL@oo+<Vd9$6UH6A79RgFEqh:+E_3($?^6#@rGmh%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaE
A12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h#^Y_h>p\_h>pq%144#+D#S%F(HIAF^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZ
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@q
ZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2
F!,UCBk)'lAISth+<Y3'FCB9:E+L/7A.8lgDJ<U!A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4K
Dfol,+Co2-E,8s.+EV:.+@/pn8P(%JATDj+Df-\0Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr
_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>nA%19tY0Z(.>8l%htATDg0E]P=RAS,XoBln'-DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?
4[(8M.3N5:GWHskDfTW7+DG^9CghEsEZfO:EcYr5DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\
De*E50JO"D%13OO%15is/j)9F1asPYEcQ)=3ZrNXATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'
ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7@<;qc:-pQU+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1
@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4$4R>;67tDb-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2B
Ec5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+FDi:7ASu("@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<r
F:ARP67sBsBleA=ASlC.Bk:ftFD,5.B6%p5E$/t2F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH
+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4AoD^,@<?4%DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr
-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1@psFi/e&-s$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%
+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+A9Da.F(96)E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX
67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(@;TR.+:SYe$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-
BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.Bk;?.Ao_g,+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[p
DJ())Ec6)>F!+n/A0>r9Blmp-%13OO%15is/j)9F2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+
Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"BOPpi@ru:&+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u
1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;A79+^+=C]@FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQ
PcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]
P^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+
6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:
Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQPbd<'Jdi(HP_(%;P_.nZJn,uH+QAW;1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL
+<VdL+<VdLifo$M0JGF>3AE6@1a!n`ifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;
ifo\eP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^
+=CW>FCB94-OgFBP`4UdJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXO:;QVP_(XLP_.nZN8g(PifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$(
$K@;%+QAW;ifo$i@;TT8P_);3FCcRaBl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$h
AKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbX
JDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufhifo$($K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;
0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL+<][.Jhf#62_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL
+<VfdP_.nZJdi(HP_(%;P_.nZPi@pXifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\
ifo$($K@;7ifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>
$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0+AP6U+E)$<AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-N
DJUFC-OgCl$4R>;67tA`-o`XuATDg0E]P=ZDdd0jDJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?
ASrW2ATMs3EbTE(+CoV3E$043EbTK7Et&IO67sC)Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r
@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(Bk;?.@<<W5Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-
3BAlL3\iE!$4R=r+Z_;"4==W"05>E905>E9E,p,4F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6
ARlp*AU&;>/hSb/%13OO.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X
6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*++E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P)%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0
E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$+<Ve>4YB,o;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_
$;No?4[(8R.3N5:GWHsbDg*=6BOt[hBl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%
Et&IO67sB72'>\)F<E=m0f:(.1cd?N3\i])$4R>;67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*
Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r@<6L(B5VQtDKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cp
F<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4BkM=#ASuTB+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh
1,(F?+>GW42)I?N0b"I!$;No?+EV:.Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DW
DIdI%ARfgJF)u&.DFJSdDfS!%1a"h%0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%14LqF`(\<4ZX]i
+=eQg+=\L>%14Nn$4R>;67sBpD/aN6E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n
@WNY>D/"6+A4^ZLBl[cpF?sthBkM<PEcQ)=-OgCl$;No?4[(8S.3N5:GWHsaBm=3"+DG_(Bl[cp
F<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"+:SZQ67sB81*B;"Gp"jr0fL401HI?K3]/i*$4R>;67sBl
DIb>;Ah@q1F(KB8ARmB(EcQ)=Et&IcF_PZ&C2[WnBleB:Bju4,Bl@lE0ht%f.UmO7Ch.:!A7TCq
FE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A1e;u%16T`@s)g4ASuT4-XpM*
AL@oo@rGjn@<6K4FDYu5De!-?5s]7(A7B[qCh,Od3F=p1+=BH@6#(=K@WcC$A2uY1-QlV9@rGq!
@<6!&4=<E\6#(=K@WcC$A2uY1-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G@rHBu+E)41DBNJ(
@ruF'DIIR"ATJu&DIal.E+No08l%htA8,OqBl@ltEbT*+%17#lD`p-(I4cXQBk/>?%17#a+?MV3
C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+e<F<F1O6m,r]Bl%<&F`_>6Bln'#F!+n/
A0?&,EcYr5DBO%A@:O(eDJ()0Dfor=%172oE,9H&+D58-+FPjbB6%r6-Xq44Ch.:!A1%fn%14IT
:IJ,\5t=@38Q$[':II]E<(';U+A,Et;bpCk6UapQ5t=@38Q$[':IJ,\5t=@?6q0R9;BSS-6rR&N
7n#gA6UXLD+A,Et7nHZJ:I@NA;BSS-6pX4/:JO;L;BSS-6rQHN8PiAS8Q$[':IIWR<)Z1V;C=Ug
+EM+9@WcC$A7TCpF!*.G$4R>bE+EC!ASQ-oD..<rAn?%*+>=638l%iU9gg+5F_PZ&C2[WmDf'H6
ATMp(A0=K?6rR&N7n#g;;EIKH6q9gJ6qL9<8l%i@6psgG6qL9<8l%iR6W-KP<(';U%15^'6rZrX
9N+td6m,r]Bl%<pDe*s.DesK)Df'H6ATMp(A0=K?6rR&N7n#g;;EIKH6q(3W;aa2T4%`::;aXGS
:fKhS;@Nt*:IJ5X6m-VkA79RkC2[WnBleB:Bju4,Bl@l38l%iR<'a#C6qL9<8l%iF8Q8)L;@Nt*
:IJ5X6m-VkA79RkC2[X(Dfp)1ARoq#E-!-o:IJ,W<Dl1Q;cH%Q779^F%15^'6rm#M+ED%0ARTXk
C2[W*8l%iR<'a#C6qL9<8l%iR<'a#C:ddc@8Q%WB:IJ,\5t=@3:I@NA;EIKH6q9gJ6r-0<8Q$!)
%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eODe*="Bl%<?3B:FU$4R=O$=\-l
Ch.:!A8,e"1,2Nj/h1=QBl%<pDe*QsF!,NU/Kf1TA79RkF!)T8Df'?&DKKH#+DPh*Bkh]3F(96)
E--.D+DG^9+DPh*B5)Gp:-pQUA8-'q@ruX0GqKG!67rU?67sC(ATD6gFD5SQ$;No?$;No?+<VeI
AT;j,Eb-@@B4YslEa`c;C2[W1+<VdL:-pQUDdmfsBl5%c:IGOb67sB'+>Y-YA0<6I+<VdL+<VdL
+<VdL+<VdL+<XEG/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEsbZ//g)8ZDe'tP3[\Z\A7T7p
+DPh*+E_d?Ci^sH+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7$;No?
$;No?+<Vd]+ED<A-Xq44Ch.:!A8,e"-QjO,67sC$F`&=:De'u-@:O=r+=JreF*2G@Eb0<5ATJu.
D/a<*@qg$-BeOBR$;No?$;No?+CT>4F_t]23XSVK/db??/g*o-+D#S6DfQt1BOt[hBl7Q9$;No?
+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm$;No?$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMn
:-pQU@rc-hFCeuD+>PW*0ktiK0JWu167sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/IG6>/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555
C3(M4De*fqEc#kMBkh]3C2[X*F(KB%Df00$B4>:b/no'A$;No?+>G`^E,mWf+ED%1Dg#]&+F7X6
Ch7Z1/KetSFDuAE+Co2,ARfgnA0>u4+DPh*B5)H1F`(`$EZee,Bk;/h$=e!aF`MM6DKI!K@UX=h
-OO@%@r,RpF!,RAE,9H&?U6tDFE1f2BK8(5?TgFm-UC$aFE1f2BK8(5-QlV9@rGq!@<6!&4=<E\
6$.-UF(dQo3@>/DDeX*1ATDl8-Y[=6A1%]k:-pQUEb/a!Eb$;2E+No0A8,OqBl@ltEbT*++CT.u
+E)41DBN\4A0>Ds@ruF'DIIR"ATJ2sDf7d"+FPjbA8,Qs0FD`/+?MV3C2[WnATf22De'u5FD5Q4
-QlV91E^UH-RT6.:-pQUAn?'oBHV>,EHPu9ARlp+FD5Q4+CT.u+Eh=:F(oQ1+EVX4@r#drB-;)1
F`)7-FDYu5Ddso&ATT&C/g+eIE$-N;F_PZ&C2[W1$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M$49Np
/g+S=Bk;0)C2[WsC3(M.Bl[cpFDl2F$;+)^7nHZP:IIcH;c#bZ83K!V+tb6/9M$T_4)AhFF(TZ(
?V4*^?XHE$6uQOL+F>_f3[-:$6r60K87,_&<*s!):IK,1C'mR/6q9gJ8l%iH8lJPP<(K/5+DPk(
FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPfC2[WqBll"CDe*QsF"\mJ$;No?+D58'ATD4$AKYK$D/Ej%
FCeu*8l%ht@r,RpF!,O6EbTK7EscYlCghC+ATL!q+?MV3C2[W*C2[X(FDl22+DPh*A8bp"C2[X"
@;BEsC2[X*FD5P6C2[X)Df9H5+DPh*Df-p0C2[WpBl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+
ATJ1c:-pQUEb/Zi+Cf4rF)rI9Bl%@%+C\bhCC2J)@r,RpF(KD8/1)u5+?V#^@<<kG4ZX^+ART*r
/j:D)3[-:$C2[WpBl%@%$49Np/g+YBCi!ZmF<Ga8EbTH7F!,=.@rcK1F(96)E--..-ZW]>F)kb<
4ZX]B+D58-+?MV3C2[X%Ec5Q(Ch4`(De*fqEc#k?C2[X*F(KB%Df00$B4>:b-OM8K/g<"mF)kb>
4ZX^43[-:$F)kat$;No?+E_X6@<?''A8-'q@ruX0Gp$^5Ch7Yp7S-9B;a!/a-u*7.@<6L$F!*"V
HS-Ks+EMR5.3L/g/j:C?-SB+JF!h;a8PDQO4ZX]64A&C;7nHZP:IIcH;c#bZ81>Z4-8%J)7S-9B
;[P3@C2[Wn@<<V7+<VdLAp890FCcRV0RH8\9LVke0Ka)gA92j2Eb/ciF<G1>EbTW,+?M<)7S-9B
;[P3@C2[WnDdm6cF<D\KAp890FCcRV14)J^9LVke0Ka)gA8PajARo4k+<Y9?EbTW,+?MB+7S-9B
;[P3@C2[X*FD5Q%@<<V7Ap890FCcRV1j_\`9LVke0Ka)gA9;a.Cia,qF<G1>EbTW,+?MH-7S-9B
;[P3@C2[X$DId0t+<VdLAp890FCcRV2L@nb9LVke0Ka)gA8lR-Anc'm+<Y9?EbTW,+?MN/7S-9B
;[P3@C2[X%@<-4++<VdLAp890FCcRV3."+d9LVke0Ka)gA9Ds)Eas$*Anbme@;?u.Ap890FCcRV
3I=4e9LVke$?L'&F`_SFF<Dr@Df'?&DKKH#+DPh*Bkh]3F(96)E--.DF`:l"FCeu1$?L'&F`_SF
F<F1O6q9gJ8l%iH8lJPP<(I?':-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEschr+E)1:+BosE
+E(d<-OL2jDe!p1Eb0-1+=CW,F(H^+@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,$=\-lCh.:!
A9Dd(F>>RG67s`sF_PZ&C2[X*DJ=28F"JsdGB.D>AKXT@6m-ViBlkJ>ATMs7+EVNEF*(i'Bl7Q+
A8-'q@ruX0Bk;?<%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImis
CbKOAA1&KB+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U
+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH
+AP6U+E)41DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!Z
D'138F_PZ&C2[X*DJ=2?+<XEG/g,1WDBN\4A0>_t@rcK1-nuicF`;;?ATMp(F!,16E,95uBlkJ3
05i9K$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+Aucj
F_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N
67sBjEb/[$ARmhE1,(FBD..]F1(=Rc67sBjBOPdkATKmT/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB83,N)L1,L+mEb02uEb-A8ATMs7+CSek
ARl5W%16T`@s)g4ASuT4-XpM*AL@oo@rGjn@<6K4FDYu5De!-?5s]U5@<6*B3B:G03Zoe95s]U5
@<6*B3B8H0>9IEoATD4#AKX)_5s[eYEaa$&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'
DfTA2DfB9*+Co1rFD5Z2@<-'nF!+n/A0>f0ASrW*De'u$Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=
A0<Q8$?'Gt4$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+CT)#ASrW*De+!.BlkJ.
Bl[cpFDl2F%15^'6q9gJ8l%iT:.\D]5u^B<3ZoV!-UCEt-S.>qDe!j#G[FfM:IJPs8l%in@VR$4
/pfW'0d&k\5u^B^?W0p2?V4*^DdmGj$;+)^7nHZP:IJ2X8Q8MP<(K/5+DPk(FD,`,E$.bK6q9gJ
8l%iT:.\D]5u^B+-YdR1B5)H@C2[X*DJ=2G-OgCl$?pN)FCfQ*F*)Id3Zp7%3Zp*c$>F*)+C\bi
EarHbC2[Wi+EV19FE9St+B)93<(1/&C2[Wi+D5_6+F,)?D_</RD/XQ=E-67FFCfN8F!,L7FEMVA
/g+_CA1e;u-ZjHUE+L/2@<?014Y@k%%16f]/g)Ps4!uC)+>#VsFCfN8F!,"3/e&.1+EMC<F`_SF
F<Dr+D]gDYFEDeIALo2OFCfN8F!*%WF(f!!AK`E1$>"$pAM+E!+<W%P@j#l)F*)IN4Y@j3+D58-
+FPkaATMs7%144#F)>i<FDuAE+=JEp,BRL<FE8l^-QjcfFEDeIALo2OFCfN8F!hD(+<Y97EaNp"
F*'#WFCfN8F!,"3/e&.1+<VeJD/XQ=E-67FAnc'm4Y@jr@<?0*/0K%VH#R=;/0H;n-Qjr_-p',0
FCfN8.3L/a-SB+JF!hD(+<VdL.!0Au:K(484#))(ATMrB+Eqj?FCeffC2[Wi+D,>(AISth+D#G$
/e&/!DIb@/$7QDk%15is/g+YBCi!ZmF<G"0A0?):Blmo/G%#E*Dfp+DFCfN8+EM[>FCfM&$;No?
+=JUYD/X3$-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YddFFE_bDDJ(=+$7I9CD/X3$
-Tapr6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1F)>i2ATVL)FE8f=$7I92@<6-m-Tapr
6q9gJ8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1@UX=l@ru:'FE8f=$7I9<@<-!l-Tapr6q9gJ
8l%iT:.\D]5u^B(+Eqj?FCfQ*F*)IG-YdR1Cgh?sATVL)FE8f=$7I9CFE1r6F!j%A:II]E<(]qS
<DH+b:dJ&O.3NhTBlmp.ATMs7+=CoBA92j5ATMp7ATMs7-OgD2-Y%1>F(cp_8l%iF8Q8;X6rcuR
<)>k[81>[*EbTW,FCfN8F!)iFDe*?uF`V5<ATMs7-OgD2-ZF*;E+*cu-Tapr6q9gJ8l%iT:.\D]
5u^B(+Eqj?FCfQ*F*)IG-YdR1E,oN/@<,q$ATMs7-OgD2-Y7OEASu$+4%`::7nHZP:IJ2X8Q8MP
<(JG\GB.D>ATVL)FE8QPC2[WoG][M7F(oQ1FCfN8F!hD(%17/nDfp/@F`\`R@;Ka&F`(o8+EV19
FE8RKEbTW;ASrk)$4R>;67sC$ATMs3Eb-A3E+No0A8,OqBl@ltEbT*+%17#a+E)1:+BosE+E(d<
-OgCl$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]U5@<6*B3B:FU$>=-pFDl2F
C2[W<0b"J&ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`-$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn
$6Uf@@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4
Dg#]4EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%
7qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s
$6pc?+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn
$6Uf@6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6
:i^8gEZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg
+<Y*1A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(
%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;6TQl#F(KB5
05>E=DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3
C2dU'BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq
+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<Z,"9M\/3<+T0D
E`[4)D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%
A8c@,/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#
%144-+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G
0K1+_Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNE
AncK4Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:
+Eq78+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/
+Dkh;ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%
3Zp*c$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of
+C,E`+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#
AS#a%@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7
BOr;uDes6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3
Afs]A6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn
3[m3Q%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[
+<VdL+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J
$6UH6<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;i
EbT&q+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1
FED)7DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-
+CJc&?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG
+<Ve@DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc
+<VeKD]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL
+AP6U+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?
DBN"pDId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>
+Dtb#ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;s
C2[X*FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H
%13OO+=\KVC2[W8E+EQ'F`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;L
Ch[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$
ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7B
F<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQU
ARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%
F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&
DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL
+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP
0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\
AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD
-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-
+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jk
Bl%iC%13OO+=\LOATo8=ATMr9F(96)E--.D@:Wn[A0>u4+CJr&A92[3EarZg+Co1rFD5Z2@<-'n
F!,(5EZeb!DJW]5%13OO+=\LAC2[W8E+EQg+E_X6@<?'k+D,P4+CJYrCg\k)$4R=b.Ni,;A7-Ng
A867.FCeu*FDi:@Eb/isGT_$<B5)F/Eaa'(Df-\-Df'?"DIdf2GA2/4+CK5$EHPu9AKW@5ASu("
@;IT3De(5'/e&-s$6pc?+>>E./ibmF+>"^%F_>i<F<E:h+>PW*2%9m8+:SZ#.Nh#"DIn#7FCAf)
?mmZh.6T_"+DGm>Eb/a!B5VF0ARlomGp$L)Df'H.?nNR'BOu'(FD,B0+EV%)+DGm>E,oN2ASuT!
$6UH6Bl5&%+EqaEA0>],@ps0rDIIBnF!+n3AKYo#Ap&0)@<?'k+C]U=?t4+lE,&c'Bl8!6ART*l
De:,$ASH$p+EM47Ecbl1ARmD9%144#+B3#c+EV%)+CHTL/h&qE?m'B2ATDg*A7]g)Ddm=$F(8X#
Bl@lA+AZHYF`V&$FD5Z2+Ceht+C\n)F`V,+F_i14DfQ9o+<VeNDfTB0+EV:*F<GUHDBNS'DImis
C`me/EbTK7F!,[@FD)e)0HiJ2?nNQE:L[pYF(8X#Bl@l3D..3kF!,@/D.Oi"CghBuATJ:f+<Ve=
@<*K,ATMo8Ch[ZrCj@WU<+ohc?t4+lE,&c'ASuU1Gp$g=+CJr&A1hh3Amc`p@<3Q#AS#a%F`:l"
FCeu*FDhTq+<Ve;ATM@%BjtWrFD,B0+Cf(nDJ*N5+:SYe$6Uf@Ddmd+Ch7^"+CI`>9h\q;A8bt#
D.RU,+DG_(AU#><ASl@/ARloqEc5e;@rHC!+A,Et/e&-s$6Uf@Cgh?sAKYl/F`)7CEb0*+G%G2,
Ao_g,+CK>6Bl%iu+EVNEEb/d(@q?cnDg-)8Ddd0!F(or3/e&-s$6Uf@?tEkV+Du+A+D>2$A8Ggu
+=M,9D.P8?AU&;G+CT.u+=M,9D.P8.CghC+/9GHJF=A>S@:F%aF"SRE$4R=b+<VdL+<Ve%67sBm
ATVEq+C\bhCNXS=G%G]8Bl@m1+E(j7@3Bc4Eb$;$DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5
@V97o+?V_<?SNZN+ED%&/i#.(Eb/]73?W?R@P0>p+ED%&/hf43%144#+<VdL+<Y6++Dt\2%13OO
+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++D5_5F`8I:ART+\EcW@3DIal$A8-,p$6UH6+<VdL+=D2>
+Dt\2-TsL51*A:o@V97o+?V_<?SNZN+D5A!@:UuF0d'qDD_<b!+D5A!@:UuE3@>7C+<VdL+<VdL
ARlp$@rr.e%144#+<VdL+<XEG/g+b;FCSu,@UWb^F`8I?@:O=rF!+n/A0>GoBljdk+<VdL+<VdL
-ZW]>DI[c94ZX]B+C\tpF<E\-/mg=U-QmVE/ho.)@<,p30KC7b@:O(aA1fPl+E_WN%144#+<VdL
+<Y6++Dt\2%13OO+<VdL+<VdL:-pQUAn?'oBHV8&FD)e@DfTB0+EqOABQ&$8+Co%qBl7X&B-:W#
A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]>+>GPmB4Z0-I4cXQDJUFCEb-U-$6UH6+<VdL+D#(+
DI[bt$4R=O$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPF--qS;eAT23uA7]XgAKXBLGp#OdBln'-
DCH#%%144-+@.,fAS5FnBm+&1DfBf4Df-\-De*E%?sbWF?m',kF!+q'ASrW!A7T7^+EVNE?tX%m
?m&lqA0>9!F`_"6FDhTq+<VeJF`;;<Ec`FGBl.F&FCB$*+EM+7BjkglH=:o0Df.0M=(l/_+A,Et
+D58'ATD4$ATJu)F_u(?F(96)E--.1$6UH6GA2/4+CK%pCLplrBlkJ.De3u4DJsV>Bl7EsF_#&+
DdmHm@rri'Eb/[$Bl@l3@;]TuCghC,+Cf(nDJ*Mi$6UH6FD5T'F*(i-E-!WS87c[KALnsJBOu'(
@3B*'D/^V=@rc:&F<G:=+EDUB/0JYK+ED%7ATVu&$6UH6DdmHm@rri8Bl.F&FCB$*F!,RC+EqL1
DBLECF=JDRF`)7C.W00H+EqL1DBO%7AKYMt@ruF'DIIR2%144#+E(_(ARfh'+EqL1Eb-A'Eb/[$
ARlp%EZf1,F*&O7BOPdkARmDC+<V+#%144#+<VdL+<XEG/g,%?D.PA1Eb/[$Bl@lBCghC,E-67F
FD5T'F*(i-E,uHq+<VdL+<VdL-ZW]>GB@mR4ZX]>+C?i[+D58-+FPjbEb0E4+=ANG$6UH6+<VdL
+=D2>+D5e;-TsL51*BpY1a$FBF<Gua+>P'[AThu7-RT?1%144#+<VdL+<XEG/g)QdFE9!GFE8lR
@<,p%@W-L&A0>u&@VfUs+EqOABHS^4Ch%91+DtV)ATJu.DBO%7AKYT!EcZ=FEc6.E@;]Tb$6UH6
+<VdL+AP6U+D,G.@<?4$B-:f,@:OCnDf0!"+Cno++=LiD.3Nn]H$O7DA7R<)A0>u.D.Rd1@;Tt)
+DG^9FD,5.F(Jj"DIa1`%144#+<VdL+<XEG/g,:UA79Rk+E2IF+Co1rFD5Z2@<-W9FD5T'F*(i-
E-!-2$6UH6+<VdL+>=pF0f1"lF`\aMFE8Q6$6UH6+<VdL+>P'H0f1"lF`\a=FE8QI%144#+<VdL
+<V+#+=\L"+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;FOPN8PVQA7:76O@<3Q#AS#a%@:Wn[A0>u4
+Cf>-FE2;9%144#+CoV3E+s3&+EV=7ATMs%D/aPK+BN5fDBN=b78uQE:-hB=?m'$*BleB;+CT.u
+DGm>F(KG9FDi:00jl+5$6UH6FD5T'F*(i-E-!.1Eb-A7ATDKnCh\3,A0>;uA0><"E+NotARlp*
D]iS5D/^V=@rc:&FE9&W<+ohcA7]@]F_l./$6UH6G%#30AKY].+CHm2/g+P"78uQE:-hB=?m'0)
+CQC1ATo8-Bk)7!Df0!(Gp%'7Ea`frFCfJ8@;]TuGA1l0%144#+Du+>+D#e3F*&O=DBNJ(@ruF'
DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0:$6UH6<+oue+Ceht+C\n)@q]:gB4YTr
@X0):ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AKYAqD..L-ATBD;C1^ir%144#+CT.u+ED%0Ddd0j
DJ()&Bk)7!Df0!(Bk;?.Ao_g,+CoV3E$043EbTK7F"SS6ARuulC2[W8E+EQg%144#+D,P4+Dl%;
AKYMpFCAm"F"SS8E+EC!AKZ).AKYAqDe*Bs@s)X"DKK8/@:WneDBO%>+D58-+:SZ#+<Yc>AKYK*
EcP`/F<Ft+De(J>A7f3lARoLsBl@lA+:SZ#+<V+#+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjI
F<G+.@ruF'DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sBhA7Qg)Bl.F&FCB$*
F!,RC+CoV3E$043EbTK7Et&I!+<VdL+<Ve;E-#T4+=C&U<'a)N5t=?k4#%0O%144#+<VdL+<XEG
/g+\ID/^V=@rc:&FE8RBDg*=6Df0Z*Bl5&3@VTIaF<G[>D.Rd1@;Tt)%144#+<VdL+<YN0CLnV9
-OgCl$6Uf@?u9_$?m&rm@;]^hA0>u4+E_a:+Dtb7+CJ`!F(KH$+E1b0@;TRtATAo$;GU(f7Sc]G
78dMG%144#+BN5fDBN=b:JXqZ:J=/F;ICVYG\M5@F!+n/A0>T-+CQC#C2dU'BODrT+Cf>-Anbn#
Eb/c(%144#+D,P.A7]d(?u9_$?m'Z6Blmp-+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYAqE+*j%
?m''"Ch.*t/e&.1+<X6f+CJ)C:K0eZ9LM<I?m&uuATJu3Dfd+5G\M5@+E)9CBlbD7Dfd+1+<Y04
DJ!TqF`M&(+CJr'@<?0j+D,P.A7]cj$6UH6B4YslEaa'$A0>r'EbTK7F!+n3AKZ2;BlnH.DBO%>
+EMX5DId0rA0>Ds@ruF'DIIR2+D,P.A7]e&/e&.1+<Y&i:JXqZ:J=/F;ICV]F!+n-F)N10+Dtb7
+E1b0@;TRtATAo%DIal6Bl%T.DJsV>AU%p1F<G:8%144#+Co1rFD5Z2@<-'nF!+t5ART[lA0>>m
AoD^$+EV:2F!,X;EcYr5DD!%S%13OO+<VdL+<VdLA8lU$F<DqY+AP6U+EM47G9CjIF<G+.@ruF'
DIIR2+E1b0@;TRtATAo7ATW$.DJ+#"$4R=b+<VdL+<Ve%67sC%ATT%m:JXqZ:J=/F;BU("+CQBb
+Cf>-Anbn#Eb/c(AoDKrATA4e+<VdL+<VdLA8lU$F<Dr/:JXqZ:J=/F;C=ORIW]^CE\D0GA9)U,
F=.M)%144#+<VdL+<XEG/g+e<DImisFCeu*F(96)E--.D@<,p%DJs_AGB.D>FCf>4FDi:DBOr;Y
+D,P.A7]cj$6UH6+<VdL+Dkq9+=CoBA7oq$F`;5,D.P(($4R=b.Nh<"E,ol?ARlopEcQ)=+D>2$
A8GstB-:f)EZf4-DL!@4BkhQs?m$q-A0>Q(@k&UFDfTB03ZrKTAKYAqDe*g-De<^"AM.\3F'pU0
$4R=b.Ni,?G@c#,+CT.u+CK#-G[MY7ASl@/ARloqEc5e;?tsUjFDl)6F'p,#CghC+/g+/8AKYB%
Ch7j!+DG_7FCelk+E(j7?upO'G[Lsf+<Ve8DIaktD0TG2AoD]4?u0q0?nNR#ARuulC2[X%Ec5Q(
Ch555C3*bl$4R=b.Nh)sA7ZlqDfT]'FD5W*+DG\3Ec6,4A0>T(+CJr&A1hh3Amc`iDIal1AThd/
Bl@m1+DkOtAKYT'EZek*@;]^hF!,RC+A,Et/e&-s$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?
+=KZeF*(u6+@TpU+@TgTFD5Z2.1HUn$6Uf@8l%htCggdo+E_X6@<?'k+EVNEEcl7BDf-\!Bl5IE
9jqN_+A?KeFa,$MH#n(=D0%<=$4R=b.NhH"DJsP<@q]:gB4Z-,FDi:0C2[W8E+EQg+EVNEF*2G@
DfTqBCggcq@q]:gB4Z-:%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b.Ni,:ATqZm
+Cf(nDJ*Nk+EVNEDJsV>@q]F`CERe=CisT++EM7CATJu<BOu'(?q+$_78m#K6UbB*BlbDCATD]A
%144#+BEDsF_t\4F(or7DJ()/@<iu7ATDC$Ebuq<Df9Z4Gp%$C+Dtb4GAhM;+Eh[>F_t]2+CT.u
%144#+D,%rC`m;,FD5c,Cj@.ADBL-5Ci=H,+s:i@@<?+"Ec#kM%13OO+=\L+:IH=7F_PZ&F!,=<
A8,XiARlp*D]j(CDBNk8+BN8p/0IYq@k8`rBl8'<+EMgLFCf<1/e&-s$6Uf@6tL=KDId<r@q?d$
DBN>5Anc'mF'p,!A7TUr+ED%1Dg#]&/g+PJAnc'mF'p,$AT23uA9/l3DBL_j+C]&,%144#+BN8p
A8c[5+CT.u+DGm>DJsV>E,Tc=@:F%a/e&-s$6Uf@?rU]YF@9hQFD5Z2@<-W]F_u)*+ED%1Dg#]&
+D,Y4D'3\(Bl5%c:IH=9Bk)7!Df0!(GqL4=BPDN1F(oN)Ch4%_+<VeC@<-!l+E(_(ARfg)@WcO,
ARlp+E$079AKYAqDe(J7C3*c*A9Da.+EM%5BlJ/:@X0).Bm+&1D.R?g@X3',F"SRE$6UH6?rU]Y
F@9hQFD5Z2@<-W]F_u)*+DGm>DJs_AF*)>@ARlotDBN>%De*s$F*'$KC3*c*@<Q'nCggdhAKYo/
+@g-f89JAaF(JoD%144#+BrT!A9;C(F=q9BF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'
C2[WnF_u)=04Ja9@P;q>DDs4`De*s$F*'$KC3(g5$4R=b.NhW#G%l#3Df0V=D.-sd+EVNE:ddbq
A8bt#D.RU,+CJr&A1hh3Amd56%13OO+=\L'DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?
F:AR"+<Xl\:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;+<Vd9$6pc?+>>E.
/ibd3/KdZ.DIjqG2(Tk*0JPBn$4R=b.Ni,1G]\":DfB9/?m&rm@;]^hA0>u4+D>2$A8Gg"EHQ2A
ARlorATDp2A0><%F(o9)D.RU,F!,:5CLoO9$6UH6+<VdL+:SZ#+<VdL+<VdS@!$'rF!,1<+E)$C
4ZX]9?nGb9+:SZ#+<VdL+<VdS?u9h&AKYPtBI>qq+<t8>%13OO+<VdLFD,B0+C]J++ED%7F_l/2
A0>T(+CJhuDdmcq+Dkh6@r,RpF(o63Bl7Q+DIIBnF"Rn/%14=),9SZm3A*<K+>"^.F`(b50f1F(
1,(F>%13OO+=\LAATV<&F`:l"FCeu*FDi:CF`;;<Ec`Er+?1u-1*C.=Bln96F"Rn/%14=),9SZm
3A*<J+>"^2Dg#]/@V'R&1,:C'1,(F=%13OO+=\LADI[&sG%G]'+Cf(nDJ*Nk+EVNEFE1f/+Dbb/
BlkJ/EcQ)=F!,(5EZfO:Ed8dDDf021DIIBnF"Rn/+<VdL<+ohcF*(i.A79Lh+A*beAS,XoBln'-
DBO%7Ec6/C+CQC/Bl.R++D#S6DfQt4DfQt<@;TRs+D#e-AS#CdDJ'Cc+<VdL1,Up3@q]:k@:OCj
EcWiU%13OO,9nEU0J5@<3AM^/+AH9b@qZu=0e=G&0JP?m$4R=b.Ni,/Df'H.?m'!*@:UKhA7T7^
/g+OV+Cf>,E,$LW3[],iEb$;/BleAD?m'K$D/XT/Et&I!+<Y04D/Ej%FE8uUE,oN2ATDs*F!,:1
@:X(iB-;D3Blmp-E+*6f+CT.u+ED%(F^o!(%144#+Dl7;FD5]1AKYGu@;]k%+Dbb0ATJu9D]it9
AKYGu@;]j'Ch[cu/g+,,BlbD;AT2[$F(K62@<?4%D@Hpq+<YB>+E_a:Ap%o4GA(Q*+ED%%A8,po
+Cf>#AKYE&+DGp?F*2G@Eb0<5ATJu(Df'?&DKI"2CisiAATBC4$4R=e,9n<b/ibOE0H_qi8muU[
@<-W90f^d-1,(F=%13OO+=\KV8l%htF)Q2A@q?cmDe*E%BlbD7Dg*=4G%#*$@:F%a+E)-?>=WCL
89JBI-tm^EE-"&n05#!@BQ[c:@rH3;.4u&:+<VdL<+ohcF)Q2A@q?csF!,"-F*)G:@Wcd(A0>T(
+EVgG+ED%4Df]W7DfTQ'F#ja;+<VdL%144#+<WBk+BrT!A6gTsFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W3+Cf>-FCAm$F!,R<AKYT!Ch7Ys$6UH6+<VdLA8-+,EbT!*FCeu*GA2/4+A+pn
/g+,,AKYDlA8-."Df0!"+Co2,ARfh#Ed8d8C2[WsC3*c*%144#+<VdL+D>\0A9/l*F_kl>+Cf>,
D.RU,ARloU:IH=8CghC++D,>(ATKIH+B3#c+EMX5DId0rA.8kg+<VdL+<X9B9H\CdEbTK7F!+n3
AKW1,Df'H6ATMp(A1f&8$6UH6+<VdL+:SZ#+<Vd^/g+A5De*Bs@pLKrFEDJC3\N.!Bln$2@P2//
D(f@,CLqO$A2uY'C2[WnDdt4=BQ%]tF!+n-C^g^o+<VdL+<Yc>AKYAS@8pf??m&lqA0>r9E,]`9
FD5W*+D,>(ATJu3AS#C`A0>u4+C]J-Ch+Z1BOqV[+<VdL+<Ve!:IH=B@;^3rC`m,#De(J>A7f4%
%144#+<VdL+:SZ#.NhK/D.Ra+F`SZt:IH=0GAhM;Bl7Q+A8,OqBl@ltEbT*+>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPF+:SZ#+<Y*5AKYl/G9C=;@;0Od@VfTuDf-[fBllmg
@P/c4$6UH6%144-+CJ`!F(KH$+C]J++D,>4ARmD98TZ)!@<3Q"Ci"$6Bl7Q+E+*cqD.Rg#EX`?u
+<Y0-@;]^hF!,C=+CJ)95t"LD9NbaGA8,OqBl@ltEbT*+/g*Pr@ruF'DIIR"ATJt'$6UH6D09oA
+C\n)Bl5&%+CJ)95t"dP8Q8,d+EMX5FCcS:D]iP'@;]^h+CJ`!F(KG9-RW:EE+*cqD.Rg#EcWiU
%144#+<VdL+<V+#+<VdL+<VdLA8lU$F<Dr/76s=C;FshV-Qij*+<VdL+<VdLA8lU$F<Dqs;aX,J
3&N'F0b"I4+<VdL+<Vd9$6Uf@AncL$A0>`'F)u&5B-:S1GUtg'+Co2-E$0F6+CT;'F_t]-F<GL@
FD5Z2+EqL1Eb,[e+<Ve7G[MY.F!,17+CJn9+>mOZ+BN9!BHVD1BlbD,BOPdkAKYA9+?1KSBle59
I4f/QE$m#@+:SZ#+<YQ?G9CF1F)Yr(H#k*LBQ%p5+D5_5F`8I6De!p,ASuU2+DQ%?F<GC6CLnUt
$6UH6?nrib+Co2-E$0Q]B6%r=-X\'-Ble60@<lo:Ci=3(+CoD#F_t]-FE9&W%13OO+=\LADKK8/
FCf<.CghEs+EMXFBl7R)+Cf(nDJ*Nk+EVNED..NrBHVD1AISth+<Y`IEbTE(F!,C5+CK)"@pgo3
?uBUe?m'0)+CQC8FD5Q*FEo!PATD6&Bl5&8BOqV[+<Ve;BleB:Bju4,ARloU:IH=9Bk)7!Df0!(
Bk;?H+EM+*+CJ_oF)W6LDJ*H,?nMlq+<Ve+BOr<.ASlC&@<?''F*)G:DJ+#5@<,p?+CKPF<.97'
/0J>IIR/F2?n<F.H[\A3I:+TK%144#+CT.u+CKPF;ac(_?m''"EZcKHBln0&/0JADFD,T5/0JJ3
FCcRC@!R$CH#7J;A7T's+CT.u%144#+EM47Ec`F7@<?''-t%=GD/X<&A7-i=%144#+:SZ#.Ni,:
FC65%H!t5+@:Wn[A1euI6#IfQG[MY&EbBN3ASuT4BlbC+$6UH6@3B&n@<,ddFCfJ8Ch[s4+E(j7
F*)G:DJ()4AT2Ho@qBLgDKKq/$6UH6FD,*)+CT;%+CT5.Ch[Hk+EVNE@!#t$FE;PH@UL`0F(Jo*
?t<tmE$-NMATMs7FEM%??n;`o+<Ve8AoqU)+EV13E,8s)AKZ&9EbTE(F!+n3AKYr4De!@"F(Jl7
+B3#c%144#+D,>.F*&O7BOPpi@ru:&+DG^9FD,5.F*)G:DJ()&ASc'tBlnD*$6UH6Eb03+@:Nkc
ASuT4E+*I$F"Rn/+:SZ#+<VdL+<VdS,@bCqDJ*N*9gp:8DIatp:K8bbDKI!KDIn$6ATMr@%13OO
+=\LAD.d6-+CK&.?n<F.D/*H0+CT.u+CK;5?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?nNR$BOu6r
+D#(tF<G7.CiEs+Et&I!+<Y*5AKYl/G9CgCFD5Z2@;Kb*+Co%qBl7Km+DG^9@")NpA8c@,05"j6
ATD3q05>E905>E9E,ol/Bl%?5Bkh]s/g(T1%14=),9SZm3A*9K+>"^3@ruWuATAnJ1FsY(0JP<l
$4R=b.Ni,6De*ZuFCfK$FCei&B6%p5E$/S"A7]:(+B)i_+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.
?k!Gc+<Y*1A0>u-AKYGuDeC23Df^"C>>o*MBe<"mFCfK$FCbmg+<Ve!:IJJ:BQS?83\N-q@;BFp
C1K=b/pD5SA8lR#F)rsDDf%-_0JP=90eb770e[TZD.tS<Blmp,@<?'4C2[W9.3K',+<Ve=DfQt2
ATV?pCi^$m%144-+CIo0;G0DR=&*-GD.-ppD]j.5G]Y'<De*E%1,g=aA7T7^/e&.1+<V+#+=\LA
2'?FDF)W6L-X\'7Dg*=7Ble60@<lo:@;^?5Dg#]4@;Ka&E-67FA8,OqBl@ltEd8d<De!p,ASuTu
FD5Z2/e&.1%144-+<YN8DJsP<?tsUj/oY?5?m'#kBlnD=@;]Tu@:Wn_FD5Z2F"Rn/+:SZ#.NhZ3
@<-I(DJ()6BOr<*Ec5H!F)rIBAftT%DK]T3FD5W*+Dl%<F<F1O6m-#Y@s)X"DKI!1$6UH6FCf]=
+EVNE>A[ehCLh@-DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_
+:SZ#+<YB9@r-9uBl7Q+FD,B0+CoD#F_t]-F=pd(0jP4q%14=),9SZm3A*9F+>"^.F_l=G0et:&
1,(F<%13OO+=\LEBk)7!Df0!(Gp$X9@s)X"DKKqBF(KG9@;]TuAn?'oBOt]sGA2/4+CI&LE-67F
-Y..*+>,9!-X[Aj+<Ve8DIakt2'?OCF<DqY?m&luAKYl/G9Cs8G%G2,Bl5&(F_u(?F(96)E--.R
+CI&LE-67F-S@#!?m#mc+<Ve@F!+t2DKKo;Ci!Zn+C]U=@3BH!G9Cj5Ea`frFCfJ8?tsUjE+*d(
F"V0AF'p+u6r-0M9gqfV6qKaF?k!Gc+<Yc>@<<W&ATVL(D/!m!F!,[?ATVTsEZeaI+E2IF+=C]<
@j!BV-X\'<FDl22F!,R9G]YP\<+ohP$6UH6A7]@]F_l.B?pmdX<D>nW<(';F<';sD+EMXCEb0;7
FCf]=/e&-s$6Uf@G%G`:BkM-gC`m,3?m'9(@ps1b+CoV3E$043EbTK7+Dbt)A0?#:Bl%L*Bk;?.
?up7(CgVKq/.Dq/+<XTY9M\#A9LW<7?S!=@DfBi@?[?'e+CT.u+CK8/@r,^bEaO-"?m&luAKYl/
G9CI;@<6!j+CT@7FD,4p$6UH6ASu$$De:,&F_u(?F(96)E-*4CF`)7Q+A,Et+Co%qBl7L'+D#e+
@ruO4+D,P7EZfREEb'5#$6UH6Bl5&8BOr<4+Dbt+@;KL9+CJr&A8c'l?[?'1+DPh*Df/p.?S!=7
De*p7F*(u1E+*j%?[?'e%144#+CT.u+CK8(Dg-//F)t]7?XPJq$4R=b.Ni,;E+NotBk)6m+D>2)
+C\nnDBNe7A8,XiARlp*D]j.5F*&OKBOu:!ATAo1@<6O%EX`?u+<Y91Ch4`.@<?1(+CT;%+E2@4
AncL$F!,C5+EMXCEb/c(A8,OqBl@ltEd8dH@<?1(/g*W%EZbeu+<Ve7;FNl>=&MUh7:76KBk)7!
Df0!(Bk;?.FD,5.E,oN%Bm:b;F`VXID..NrBJ(DsDfQt.;FNl>:JOSd?k!Gc+<Y3/@ruF'DIIR"
ATJu9BOr<'@<6O%EZf=0FD)e;AT2Ho@qB^(FD,5.F*)>@ARlp&@<?0*Bl4@e+<Ve;Bk)7!Df0!(
Gp$X3Eb/a&DfU+GDdmHm@ruc7BkAK0BOuH3A8,XfATBCG<+oue+CT)&Dg-7F%144#+CJ)95t"LD
9NbaGA8,OqBl@ltEbT*++EVNE@V$[$CgggbA0>f.+Dbt+CLq$!A8c[0+Dtb4GAhM;+:SZ#+<Y38
Bm+'/+CT.u+CSbiATMp(A0>?,+DkP)Gp%6NATDi7FD,*)+DkP4+D>2,AKYMtAnGUpASuT4%144#
+CSbiATMo8E+*j%F"SRX%144#+:SZ#.Nh,J:dn,I;]p-m@ruF'DK?q/A7T7^+EVNE8l%ht@;]Tu
8l%iR:K::[73HGUDJ<]oF*&OG@rc:&FE9&D$6Tcb+=\LAC2[W8E+EQg+=Ll6DImisCbKOAA7TUg
F_t]-F<G"&A8c?7+E_X6@<?'k/e&-s$6pc?+>>E./iPX1/KdZ.DIjqG2Cot+0JP<l$4R=b.Ni>;
EcZ=F9jqNS@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;\@:LF'ATDj+Df-!k+<VeIAT;j,
Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9
A7TUg05Y--DJsW.F"VQZF:AR"+<V+#+=\LAC2[W8E+EQg+E_X6@<?'k+CT.u+Du+A+Co2-FE2))
F`_2*+CT=6@1<Pd+<Y`:E+*cqFCcRe5tiD0A7TUr/g*`'F*(i,C`m+uASu("@;IT3De*Bs@s)X"
DKK7q$6UH6FDi:@Cgggb+CJr&A1hh3Amc`qDBO%7AKYMtEb/a&DfTQ'F!,O8@<,jkARl5W+<Ve9
Gp$L0De*NmCiEc7+CJr&A8#OjE*sf+D]ik7DJ*O$+Dbt7CNCV1DfQt/D@Hpq+<YT?Ch[cu+Eh=:
F(oQ1+E(j7?tsUj/oY?5?nNQ2$6UH6%144-+D,>4ARlol+CJ_oF)YM0Ch7KsFD)e.EcQ)=/g(T1
+:SZ#.NiPADIjr%DIdf2Bl5&%Cht58@rc:&F<G10Ch7Z1F(KG9FDi:<Bl7K)An>Oa+A>66$6Tcb
+=\LM@:F:#F`:l"FCeu*AoD]48g$&F0JO\YDIak`Bl8'<025kb+Eh=:F(oQ1Et&I!%144-+DbIq
+CJr&A8lR(D(]O;FC653ASl@/ARlo8+EV:2F!,:-@N]]&An?"'ARl5W+<VeKD]iJ++E)(,+=M2L
AKWoa0JP"!E,ol3ARfg)D..<jB4Z*9+:SZ#+:SZ&,9n<b/ibOC+>"^.@;[2B2Cot+0JP9k$4R=b
.Ni,6De*HuEbf&*DJs_A@ps1iF!+k&DfTW#C33m*CL:Hl/KeSBDIjr4D]i_%DIdQp+Cf(nDJ*Mi
$6UH6Bl5&1@;0U%8g%qa@WGmtGqL4IFCB6+?m'W(Eaj)4@<,p%DJpY6Df03!EZf1:@:Wq[+EVNE
@!Z3'Ci<flCh4%_%14=),9SZm3A*3I+>"^(ARci;3@l:.0JP9k$4R=b.Ni,3ATTIGE-681+Du+A
+D,2,@qZunDIal2ATT&6F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e$6UH6+<VdL+>k9S
ATT%B-Qij*+<VdL+<VdL2'?j\F<DrADe!p,ASuT4FD,B0+Co1rFD5Z2@<-W@+:SYe$6pc?+>>E.
/iFh(+@KdN+>GW&+>PW*0b"I!$6Uf@?tsUjBOu"!?m'E,Bl8$(A0>u4+Dtb7+E).6Bl7K)G%G]8
Bl@l3De:,"C2[W8E+EQg%144#+@T+*/0In\=<M$iA0=EB9hZ[?De!p,ASuT4Anc'mF!,L7D/XT/
A0>K)Df$V6@;0U%C2[W*A8,OqBl@ltEd8*$+<VeKD]j(3A9DBn+EV:.+EM7CAKYo'+CJr&A92[3
EarZ5H>.>+/g+,,ATME*Anc'mEt&I!+<Y*5AKYE)@;0Od@VfTuBl5&8BOr<)DJX$)AKXT@6m-Po
DBNt2E,Tf3FDl2F/g(T1+<Ve*ARuug<+ohc8l%ht:gn!J>psB.FDs8o04J@*ATDNr3B8^9DfTB-
Eb0<5/n8g:06Cl=/S]37/T>-2AM5Jb%144#+:SZ#.Ni,/Df'H.?m&rfDBNh8G9C@++Dbb/Blmos
+EVNEDf0B:+EqL5FCcS9E+*6f+ED%1Dg#Q*+C]U=%144#+DG_7ATDm,DJ()6BOr;rDf'?&DKI"C
@:p]j-nR&#4ZZsn@;^@7BOu3q+DG^9FD,5.FCf]=+E(j$$6UH6@;[3!G]7J5@qg$-GAhM4/e&.1
+<V+#,9nEU0J5@<2'=In6tKjN1b9b)0JP9k$4R=b.Ni>;G\(D.@3Arp@;BF^+C]J++DG^9?t=Cs
E-H5@A92-$@3BMtFD)e8AftMuC^g^o+<Y64E--@JA8,OqBl@ltEbT*++D,%rCh7-"FDi:=@;BF,
%144#+:SZ#.Ni>;G\(D.@;[2qD/=9$+C]J++EV:*F<GOCDe+!#ARlotDI[U*Eb/a&+:SZ#+<X9P
6m,lYFCB33F`8sIC3*c*ASuU1Bk;?.Df-[kBl8'</e&.1+<V+#+=\LNDfTD3FCfN8+Cei$ATJu&
A7T7^/e&-s$6pc?+>>E./i4\&+AQiu+>Pf*+>PW*0b"I!$6Uf@F`:l"FCcS&C2[WsDId='/nf?D
Cg\B-D]j(3An?!oDI[6#@s)g4ASuT4Df0B*DIjr$De!p,ASuTuFD5Z2%143e$6Uf@AncL$A0>;'
?u9=fARHWiF_;gK+CK%pCLplr@rHL+A0>JmBl"o9BOu'(GAhM4F!,[@FD)e=BOqV[+<VeKBOr<-
@;TQuDIIBn+CT.u+Co1uAn?!oDKI"=@;TQu@r,RpF(KD8G@bf++E2@4F(K62+E)-,$6UH6FD,5.
E+*j%/e&.1+<V+#+=\LVE+EC!Bl7Q+@;]TuAU&<.DIdI!B-9fB6m-S_F*)IU%144#+:SZ&,9n<b
/ibO?+>"^.F`&<V0e=G&0JP9k$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df-\<AThd/ARlolDIal$
G][M7A7]:(+B3#c+E).6Bl7K)A8bt#D.RU,Et&I!+<Y*5AKYZ)F*(u(+C]U=7rN<YCh4_WDe!p,
ASuU2+CT.u+Ceht+C\n)Eb/Zi+E)-?FD,5.G@b5+DfQ9o+<Ve;Dg-)8Ddd0fA0>T(+CQC9@<-'n
FEo!IAft](Ec#6,F#kF?6q/^M:IJ/5+BNK%A1Sio<)$%=+B3#c%144#+E(k(Ch[cu+CJr&A1hh3
Amca*Bl%T.@V$[&AThd/ARlolAoqU)+Cf>+Ch7*uBl7Q+F`V,7+D,1rA7AtWCG$&'%14=),9SZm
3A*'0/KdbrGp"k&/0H]%0ej+E%144-+D,>.F*&NuBl8'<+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a
:IHfX<+ohc9PJBeGT_0@EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe
$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2Ch[d0G]%GAATKJGG]XB%%144-+E).6
Bl7K)A8bt#D.RU,@<?4%DCco=G%#*$@:F%a+EhI-+EV:.+Eh=:@N]&nDe*NmCiEc5%144#+D>2)
+C\nnDBNG-DK]T3FCeu*FDi:DBOr<(ATo7eDf99)AKXBZ@s)X"DKI"5DfT]'F=n[F$6UH6<+ohc
@rH7.ATDj+Df-\:Ec5H!F)rI5Ec5`)+CT)&+EV:.+DG_8ATDZsC`mD:E+O'+Bl7^-%144#+A!\a
D'3n9Dg-#C+D,>4Bl7Q+FD,6&/g+,,AKYo'Ao)1!AKXf;7Nc5[@s)X"DKI!1$6UH6>@;2aA1hh3
AmemmBQS?83\N.1GBYZKDg3mPATTSHBOPpmA1qS(C1_TG0P=lL.1HV,+<Y35ATJu3Dfd+CBQ&);
9PJBeGT_'HARfFdBk&8sG[YH.Ch7Z1@Wcc8BlbD<FD5Q-%144#+CT.1@:NeiEaa'$+Co&)@rc:&
FD5Z2+E(j7GA(E,+A,Et+DGm>@;Ka&@:F.tF=n"0%144-+CSekBln'-DII?(Bl7O$Ec#6,Bl@l3
@:F.tF<F1O6m-\fCht5'AKYhuA7Z2W+<Ve8G%#*$@:F%a+E)-?>A\X.@Vfsq>psB.FDs8o04J@*
ATDNr3B8^9DfTB-Eb0<5/n8g:.1HV,+<Y*)FCfJ8@3BT/F`(_4De:,$ATV?'FCfN8Bl7Q+Bl5&8
BOr<1Bl%<4+<V+#%144-+EV:2F!,X;EcYr5DBNk0+A,Et+EDUBF!,C=+EqO;A8c[5+A*b7/hhMm
@;]Tu8g$&F0R+^]H#n(=D0%<=$6UH#$6pc?+>>E./hnJ#+AH9i+?(ho1,(F;%13OO+=\LNBl7j0
+D,>4+E(j7ARoLs+Eh=:@N]&iFC655D]j(CDBNk8+C]82BHT5d0R+^KDIakJ/hhMm8g&2#F*(u1
F"Rn/%14=),9SZm3A*!./KdMo@N[Bb/0H]%0ej+E%144-+Dl%-BkD'jA0>u4+EDUB+E_R4ATAnc
+?(o,0d'(Z;]oLdA0=K7<(ehd<+oue+Eh=:F(oQ1%144#+CT)-D]j(CDK?q=DBMOo2D-\.+EMgL
FCf<1/e&.1+<V+#+=\LSAT2Ho@qB0n8l%i&F!+k:?m'9(@ps1b+DG_8ATDBk@q?d,Bln#2@;[2q
BkhQs?m'0$FCfK)@:Nk$%144#+A,Et+Du+A+Co%qBl7L'+E).6Gp%3BEb/f)GAhM4F#kFOC2[X$
DCcoFDe*cuAmc`iDIak!$6UH6?tsUjF*VhKASlBpFD,&)Bl5&8BOr;oH=.k3De!3lAM,)J6#:?[
DffZ(EZf(6FCfK)@:NjX$6UH6GAhM4F!+n3AKYMpAnc-oA0>T(+CJnuDe*5uGA(]#BHV#1+E2.*
@qB0nDf-\>BOqV[+<Ve9@<6!&Ci<flCh4u8+EM+&Earc*E+*j%%144#+:SZ#.Ni\=FD)e*DIal%
Bl%?'A8-+(CghU1+Cf>-G%G]9ARlp*D]iG&E+*j%F(K;u+Cf>-G%GQ5Bl@m1/e&.1%144-+CJr&
A1hh3Amca%ASl@/ARloqEc5e;FD,5.@rHC!+A,Et+CSekDf-\:@:O(]B4W\<+CJr&A1hh3Amc&T
+<VeN@<3Q#Gp$^-EZfI;AKYetEbAs)F<GO2Ec`FBAfu2/AKYK$Eb-A-DKBo.Cht55@:O(]B4W\<
?tsUj/oY?5?k!Gc+<YB>+Du+A+C]A0GB7>++E)-LCh[cu+C]U=?tsUjBOu"!?nNR)Dfm14@;[2u
Dg-)8Ddd0!?tsUj/oY?5?k!Gc+<Y*1A0>i-@:NjkBlkJ3DBN>9@:WneDK@IDASu("@;IT3De(M9
De*Bs@kVe3An5gi045oED]iV/@:F%a%144#+Dbt+@;I&_6q/;>ART+`DJ(R2$6UH6%144-+E).6
Bl7K)8l%htA8bt#D.RU,@<?4%DBO(@A79RkA0>u4+ED%*Ch7*u+Cf(nDJ*O%/e&.1%144-+CJ2K
7Q=cuD.-ppD]j+2EbTK7+Cf>#AKYJr@;]^hA0>K)Df$UP2B[*[+>Po!-urm9ASkmfEZd+s+D,P4
+CJ2K7Q=d)/e&.1%144-+CIN=<(11;D.-ppD]j+2EbTK7+Cf>#AKYDlA7]9oGA2/4+Eh10F_)[N
2D-*p%143e$6pc?+>>E-/heD"+AZKh+>Y`'+>PW)3"63($6Uf@@:Wn[A0>c$G9C:.De*fqEc#kM
Bkh]s+E1b0@;TRtATAo$5uU-B8N8S8+EV:*F<G(3DKKo;Ci^_CBOu:!ATA4e+<Ve;F_u(?Anc'm
F!,UHAKYE&@qfX:2'?LLEZfI8G]Y'H@VTIaFE9&W+@KdQ@<HC.+DGm>0J3eA+<Ve+BOr;pF(8ou
3&Mh!AT2[$F(K62@<?4%DBNS'DImisCi"A>E,ol-F^o!(+EMC.Ci!['+:SZ#+<Y3;D/^V0Bl%@%
+C]J8+DGm>F)5c=ATAo8BOPd$FD,5.A7]@]F_l.BD.Rg&De(I0$6UH6%144-+CJr&A92[3EarZg
+E_a:F!+n4@qfX:2'?LLEZdtM6m-#OG%GK.E,B0(F<G+.@ruF'DIIR"ATJu9D]fJr+<VeIARopn
AKZ).AKZ&.H=\4;Afu2/AKYN%GA_58@:XF3%144#+:SZ#.NiSBDJsP<AncL$F!,17+CJr&A1hh3
Amc&T%14=),9SZm2_Hm//Kdi!F<ELn+>PW)3"63($6Uf@AoD^"ARlp&@<?0*@rH4'@<-('Df0V=
FDi:<Dg,c5+Cei$AKY])+A,Et+A?3Q+<r]c@;]TuFCfN8+CHR<ATW'6?YXLiE,ol3ARfg0?k!Gc
%144-+D,>4ARlol+D,2/+EVmJDf[%8DBN>%De(J>A7f3Y$4R=e,9n<b/iPC<+>"^7AT/bI2(Tk*
0JGHq$4R=b.Ni5>D/a<&FCeu*A9hToBk&8q@<6!&De:,"A8bsc%143e$6Uf@F`:l"FCeu*?tsUj
/oY?5?m'Q0+Co&)@rc9mAKYJr@;]^hEt&Hc$6pc?+>>E,/hnJ#+B)ij+>Pc)+>PW)3"63($6Uf@
Eb0*+G%G2,F)Po,+DbJ,B4W2S:fAKKBl%@%+D,Y4D'3A'@ruF'DIIR2+EVNEEb/d(@q?cnDg-)8
Ddd0!F(or3%143e$6Uf@Eb03+@:NkZ+A,Et+Co2,ARfh#Ed8d<BjkXp@;R-$DBN>%De(J>A7f3l
/Kf(FA9DBnF!,O<H=\4;AfthrDe(J>A7f3Y$4R=e,9n<b/iPC:+>"^7AT/bI1b9b)0JGHq$4R=b
.NibCAn?!oDI[7!+CSekARlp*D]iG&De(J>A7crl%143e$6Uf@DIn#7C2[W*BOPpl@rH=3+Bs&6
G:m]SCiq@?Df&c.BQS?83\N.1GBYZUF_l1Q@rH35+D#(tFD5Z2%143e$6pc?+>>E+/heD"+@1-_
+>Gi,+>PW)3"63($6Uf@D/!m+EZf+8A0>r'EbTK7+D#(tFE7lu+:SZ#.Ni,6De(J>A7f3lBl7Hm
GT^^;E,ol?ARlnm$6Tcb,9nEU0J5480d&%j8p+qm1,1=&1,(CA%13OO+=\LAC2[X*F(KB%Df00$
B.dn5F'p,!A7T7^%143e$6Uf@?tX"]E-#D0DJs_AA8bt#D.RU,ARlotDBN>%De(J>A7f3Y$6Tcb
,9nEU0J5480H_qi8p+qm0fU^,1,(CA%13OO+=\LAC2[W8E+EQg+CoD#F_t]-FCB9*Df-\-Df'H0
ATVJm$6Tcb,9nEU0J5170H_qi8p+qm0eb.$1,(CA%13OO+=\LJDKBr@AKYE'+DbUtF*&OCDIjr'
Ec6)>+DG^9?tsUjA7]q#Ddd0a+D,P4+DbIq%143e$6Uf@D/!m+EZf1,@N]5mBlnD=/Kf(FAn?!*
FDi:0F*(i2FEMOTBkh]s+DG_7FCelk+E(j7?uoguBlJ08/no'A?k!Gc%14=),9SZm1G1X0/Kdbr
Gp"mt/0H]%0K9LK%144-+Dkh1DfQtCE+EC!AKZ)5+DbJ-F<GC.@N]`'@ruF'D@Hp^$6pc?+>>E(
/iOn)+AH9i+>Y`'+>PW)3"63($6Uf@@Wc<+AncL$F!,17+DbIqF!*%W@;Ka&Cggdo+Ceht+C\n)
Ecl7/$4R=e,9n<b/i,+<+>"^1@<itN3@l:.0JGHq$4R=b.Ni>;EcZ=FEb0&u@<6!&De:,(F_kl>
+<k6)A8c?;BmO?$+s9KR6m+'(G%G]8Bl@m1+E2@8DfQ9o+<VeKD]j.8BlbD;ASbpdF(HJ-@:UL&
D]iM#+DkP)F^]*&Gp$g=F*(i,Ch7-"@X0(*$6UH6@:Us'Ddso2@rc:&FE9&W:2b>!FD,5.8jQ,n
F*VhKASiQ'@;]UlATJtd:IH=>DKBo.Ci"/F%144#+:SZ#%16<G0jQg_+B3#gF!,"3@s)X"DKI"2
@;[2sAKYK$DK]T3FCeu*FDi:=@;^?5AoD^,@<?Q5GA2/4+:SZ#+<VdL+<Xm-@;]Uo@pLKrFEDI_
0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.4u&:+<VdL+<VdrDfQt3G[YH.Ch4`2BOr;uDes6.
GA1r-+Cf>,D..<m+E2@>A9DBnF!+n/+@oI+9H\LiEcYr5DE846+<VdL+<Vd9$6UH6+<VdL+<VdL
+E1b,A8bs#/TW%JBleB7Ed;D<A1h_-Ebf3(GA\NTD]i_-F*)>@H"q8./nf?DC^g^o+<VdL+<VdL
+<Vd9$6Tcb+:SZkBleB7Ed;D<A7TUg1,3EQDImisCbKOAA7TUgF_t]-F<E.X@q]:gB4W3!BleB7
Ed8*$4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0J5@<3B8r>/Kdbr
Gp"k%/0H]%0fU:(9kA0[EbSru+@KX`+E_X6@<?'0%13OO+<W-VF*(i2F<GL6+ED%:Ble!,DBNG7
@r,^!AoD]48g&:gEcYr5DBLnk0K1L7%13OO+<W-V8l%htAoDKrATDi7@;]Tu8l%htCggdo+EM%5
AS#a%@ps=uF`M&7+E_X6@<?'k%144#+<Y97EZdss3%cmD+A,L1/e&-s$6UH@+Dtb7+CK>0Bk)'l
AMdd;FEqh:+CSekARlp*D]hSnDJ*BuBjkm%@;p0sDIdI+/e&-s$4R=e,9n<b/ibOE3AVd0+AH9i
+>PZ&+>PW*3"63($6UH@+D,>.F*&O7Df'?*F<G[D+Dtb7+A-]nAor6*Eb-@`Bllmg@N]]&E,Tf3
FDl26ATKI5$4R=e,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144#.Ni;5BlkJ*C2[X*
F(KB%Df00$B4>:b/no'A?m&lsE+NotBm:bBD]iM#FED)7%144#+<Y`JE,]`9F<G^IBl7Q+8l%ht
Bl5&.@rH7+Deru;AU%c/F(KE6Bl@m1/e&-s$6pc?+>>E./ibmM+>"^1@<,jk+>PW%+>PW*2@U!&
$6UH@+Dkh1DfQt3A8-.,%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+<W-V?t+"i
?m&oe@r$4++DtV)ATJu1BleB;+EM+(FD5Z2+CSekARmD9+:SYe$6pc?+>>E./ibmF+>"^%F_>i<
F<E:h+>PW*2%9m%$6UH@+Dtb7+CJ\tD/a5t+EV%)+CHTN3[m3Q?m&ukF(96)@V''Z$6UH#$6UH@
+CJbk?m'$*@;Tt"AKYo'+D#(tFD5W*+=M,9D.P8&@r,RpF'U>?@;L't.3N_@@VfUs+CSekARl5W
+<V+#+<W-VBl7HmGT^^;E,ol?ASl!rFE8R5DIal,Bl7j0+D#(tFE7lu%14=),9SZm3A*<N1E\7l
8p+rq+>bVl1,(F?%143e$6UH@+Dtb7+CT5.ASu$mGT\20F`MA6DJ((a:IH<nF_u(?;e'i^E-*4%
EbT$!F!;`8A7T7^%13OO+<W-V?tX%m?m&lqA0>9!F`_"6@q]:gB4Z-,AoD]4DIn#7FD5T'F*(i-
E$04EE,]`9F:AQd$6UH@+DG\3Ec6,4A0=Je@rGmh+D,P4D..O.Bl7Q+FD,]5F_>B+F`\a6C2[W8
E+EQg%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPEo$4R=b+=\LNBl7j0+D#(tFE8RHD]j+D
E,]`9F<GC.@N]f4A79RkEt&Hc$6pc?+>>E./ibjF+>"^1@<,jk+>Pf*+>PW*2%9m%$6UH@+D,>4
+DG_'DfTl0@rri*Df9`8DffP5Ch[d&%13OO,9nEU0J5@<3B&'4+AH9b@qZu?1+XP'0JPEo$4R=b
+=\LDBOPdkATJu9D]iG&De*NmCiEc)F*VYF@<`o*De!p,ASuU$A.8kT$6UH@+Cf(nDJ*O%+D,P4
+A*b9/hhMmF*VhKASlK2@;]Tu8l8Os$4R=b+=\LDBOPdkATJu9D]iG&De*p-F`Lu'?m'?*FCetl
$4R=b+=\LGDfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.@Vfsq+E27?F<D#"+<VdL>=q[Z+B<Ak@<?'A
+BE&oF(oQ1+>>E./ibj?>psB.FDu:^0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0f:U<1G:L=
05>E9/Tl#C@<?'4G%G]8Bl@l@0J,::3B&T?%13OO,9nEU0J5@<3A_j1+A-coAKW]a/0H]%0f0=H
%144#.Nh>L9H\LiEcYr5DBNY2@rc-tASuU$A0>r3+CJr&A7TUgF_t]-FC65"A7TUr+CT5.ARTV#
+D,P4+A*b9/hhMmF*VhKASlJt$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P`(+>PW*1CX[#$6UH@
+EMgG@q]n$DJ=E.+CJr&A1hh3Amca)ATDj+Df-\ABln#2A8-+,EbT!*FCeu*8l%ht@:WneDD!%@
$4R=e,9n<b/ibOE0H_qi8muU[@<-W91,^[+1,(F<%13OO+=\LADKK8/A9hTo+CoD#F_t]-FCeu8
%143e$6Uf@G%G]8Bl@l3@rH7,Ec5b:@;p0sDIdI++ED%:Bldir+>"^EA7T7^+ED%*ATD@"@q?d)
D[d$r+<XlYBllmg@U1BqFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3N#5De*C$
D/aQ(+ED%4Df]W7DfU+U%144#+:SZ&,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LN
Bl7j0+D#(tFE8QV+CIo0;G0DR=&*-G@rGmh+>Pku@;]Tu?o9';Ble59-RW:EDJsW.A1e;u+:SZ#
.NihHBlbD-De!p,ASuT4@rH7.ATDm(A0>u4+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](a
CbBU:F>%TRDe`inFE9*P@<--oDg-(P.1HUn$6pc?+>>E./iYO-/KdZ.Cj@-X1FsY(0JP<l$4R=b
.NibCAn?!oDI[7!+EVNE9jqNSG%G]8Bl@l3@;]Tu?tsUjA8bt#D.RU,?m&lgA8c?.@:Wn[A0;<g
%14=),9SZm3A*6K+>"^.F`(b51,(7%1,(F<%13OO+=\L16q/:k:IH=9De!p,ASuTuFD5Z2+EML<
BlkJ9AnE0"DKKe>@3BW&E+*cqFCcS'A7TUr/g+,,AKYhuBl4@e+<Ve=Bl%?'?tsUj/oY?5?m'0)
+ED%0@<?4,AScW7F*(i"Ch4_tDIakuCi+*3F<G[:DBO%8D.Rc2FD,5.F(or3%144#+E(j7FD,5.
@rHC!+A,Et+CSekDf.0M8TZ(g@<3Q#AS#a%Eb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c>p
$6UH6FDi:BARopnAKYN%GA_58@:UL&Bl.F&/g+A+C2[W8E+EQg>psB.FDs8o04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM5JA$6UH6BOPs)@V'+g+CTG%Bl%3eCh4`-DBO%7AKXT@
6m,<7B4W2tDfQtCF(KB5+EVNEA8c[0Ci<`m+CT.u+:SZ#+<Y04E-WRJD]j.8AKYK$EcP`$F<Ft+
De*NmCiEc)A8-'q@ruX0Gp$R=F<GdAFD)e=BOr:q$6UH6E,ol5BkCps@<?4%DBNk0+A*bqCghEt
DfT]9+CT.u+A,Et+Eh=:F(oQ1F!,R<BlbD2F!,+,FED57B-7Wj+<VeDATMp</g*`--Z^DA@<6-o
EZfIB+E_a:+A+pn+EVNEA8-+,EbT!*FCcS:BPDN1Anc'm+CT.u+Cf(nDJ*Mi$6UH6?tsUjBOu"!
?m'Q0+Dbt7CER>/+EV:2F!+n%A8c?5F!,"-Eb/a&DfTQ'F"Rn/+:SZmDe*<gF*'/p9L2!E8Q8AP
4ZX]58l%ht-o3:p6=k4[+Ad)e@ruEpATK4.$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ib'6=FY@
EZbeu@UX%`Eb],F3C%4o@;0O1@rH2n$7QDk9L2!4:JFPP:/k.T3Zoe:ATMr9E,oAsFD55rF!,(5
EZdtM6m+'(Eb0E.F(Jl)AoD]48g$)G0R+^7@<,jk+>PW*3%#.B9L2!7:IA,\4ZX]?%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[hDKKo;A9DC(Bl@ku$<(kTFE_/6AKZ)5DesJ;@<,p%Ch[Zr+Dbt)A7]9oB6A*5
3ZrB[G@bf,F_i1EARTOrDK?q4DfQtACghU'DJ();Dfp(C@rGmlDJ()&ASl@'F!+q7F<G".F)N13
@;]^hEc6)A+EqL1DBO(CARlotD/aN6E+O'+GqL3^87?[Q+F.mJ+D#_-EZfF:Dfd+IDfp)AASbs$
Bl5&8BOr;uDf9_^+<X5uCMn'7+A!qt+Dkh6F(oN)+CQC)ATo8=De3u4@;]Tu8K_JRF<GjIFWb+5
AKYE&+EqC5Cb?h>$4R>ABPDN1CggcqDfp/<Bl7L'+CQC1F_tT!EZf:4+<k9+F*&ODEa`I"Bk(^q
+s:fE+D5h2A7]RkDIml3AoD]4F`V87B-9fB6nTT)8LJ[m+DbUtEc,H!+EV:.+D>2(A0?))Grm-_
AfuA;FWbd7CLnW*Gp$O+G%kGt+EVNEBOtUmF<GjIFWbO8B4uB0@V$['E+*cuA0DBh.1HW)AT;j,
Eb-@@B4YslEa`c;C2[W1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[sATMr9AoD]48l%htF`V,7+Co%qBl7Km
+D,P.A7]e&%160&;GKeY7lhbl84c`&9L1uf;FOG_8Q%uU+@.,F<D>eK;BSb)+B;?/;BS@r7S-?D
6m,)t6m+rp9LM<I;_ALd%16'JBlbD5@:C@"AT;j,Eb0;7@3BH1D.7's+E(j78l%htAoDKrATDi7
FDi:BF`&fS<+ohcDIn'7+EMX9E$076F*)IGAoD]4FD,5.AU%p1FCf?"AKYo'+EV:.F(HJ+Derrq
EcWiB$4R>6AfrL$ATMrc:IITbEb/a&DfTQ'F"&5JBleB;+CT/5+E_R4AS,XoARloU:IH=9Bl[cp
FDl26ATJu(Df00$B6A6++EV:.F(HJ)Bl[cpFDl26ATJu'AS,k$AKZ#9DJj0+B-;;0BlbD5@:Ci3
8T&TkEckl6Bl@m1+E)-?BQ&);FDi:4D]j.8BlbD,@;[2sAKYT'F`(_4Bl5%AC2[W8E+EQ0/g*`'
F*(i,C`mh5AKWC9De*Bs@s)X"DKI<M@:WneDBO%>+D58-+=LuCA1hh3Ago>A$7QDk<+U,m8l%iC
Bl[cpFDl26ATM3mC2[Wi4ZYAA3Zp*c$4R>;67s`eATMrc:IITbEb/a&DfTQ'F!,WX/Kf.HF*&OI
F(KA7@rH6sBkMR/ARloU:IH=9Bl[cpFDl26ATKI5$;No?%15is/g+,,BlbC>G%G]'+<Y0-ARfLs
+<Yc>@<<V7Eb065Bl[cq+<X9P6m*Ug@:C?iBl[cpFDl26ATJt:@<,og$;No?+Co%qBl7Km/g)?+
AS,XoARlu-A8c%#+Du+>+Dk[uDBO%7AKW++Bl[cpFDl26ATJt:AU%p1F<GL>Cj?Hs:-pQUFD,*)
+=LuD@<?03+D#e:@;]Us+EVNEF)Po,FD,B+B-;,7BOu3,FD,*#+DGq=+Co%q@<HC./e&._67r]S
:-pQUD/X<#A3(hU@r+k\B-9>i+B2onF@o=s6tp[Q@ruX0Bk;?.F`g8gDJsQ,%13OO:-pQUGA(Q*
+CQC5ASbdsBm+&1A8-'q@ruX0Gp$X9ATJu3Dfd+5G\M5@+=LuD@<?03+D#%rDe3u4BlnD=@<-"'
D.RU,%16igA9DEsEcW?d/g)Nj-RLAk/j:C>3[[Nq6m,)t6pt$L:fAK/:IJ,W<Dl1Q+A,Et<(0_b
-OgDtDe+!$AS-!+4Y@jlE+*j%-8%J)C2[X*A8-(*+<XEG/g);c.OdM5+DPk(FD)*jD..L$+?_>"
C2[X*A8-(*+?^i^De+!$AS,um$>F*)+>G!M/g,">F))n/D_;J++<Wij-Z*R=F(oN)+A,Et+D,P.
A7]e&+>"^HAS,XoAKYGnAoD^$+EDUBDJ=!$+A,Et+DbIqF!i(l+DkP.CEOiEC2[X*A8-(*%16Z_
F(Hs5$6UHT+=CT6C`l>G6m-)[Ch.*tF!+n3AKYMpAnc-oA1&K]+DPh*F_#&qEt&IfDIb@/$7QDk
%16'GF*(#M6pta0ARfh#EbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?3Q+Cf5!@;^4,%160&;GKeY
7lhb\8OHHK:JO2R8OZQ#6W-?=<(01t6<PF-;FsY^+Au37;]nk*+A>'f+B1m';]o.59M?Qq73Fue
9LVoL6m,&r+B1m#+AP@-<$5+=78PTG$4R>DBOu'(FD,5.6=k4[+Ad)e@ruEpATJu1@:C@"F`)7C
BlkJ-Eb/[$ATJu&+Du==@V'R&De:,&Bk)7!Df0!(Bk;?.Bl5&8BOr;7IS*C(;bpCk6U`FHA8-'q
@ruX0GqL4=BOr<(AU&;>F*(u4+EqO9C`mb0D/XT/+CT/5+E(j7FD,6,AKYMt@ruF'DIIR"ATKIH
+A#$F=\i$?6U=U=+@/=i<E()?84c`&6pXd<+B)68:`rM/="Xph.1HV^ASl@/AP?NA6=k4[6tp.Q
Bl@ltEbT*+?YO7nA7%J\+>Y-$+>=63BkAt?8OccQ:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0a
-u*^0FD)dEIS*C(;bpCk6U`@O/12Vh%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9@V'V&+E2@0
@ruEpATJtBGA1qD+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhG2t7TE2T=<M-m/e&.1+AP6U
+CTG3Bk/>qCgh3sF!,17+AH9S+CT.u+A?KeFa,$J@<?1(%144#F(f-$C`k*GD'1ENAfrHPC2dU'
BHS[O8l%iR:K::[74/NO+<Y`BDfp/@F`\`R9OVBQFCf<.DfT9,Gp$R-F*&ODEa`I"Bk(^q+=M)8
@kVY4DKU1Q+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDoCia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#
+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9@V'V&+E2@0@ruEpATJu)Bk)7!Df0!(Bk;?.D..=)@;Kb*
/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/AKX<NF*&O$Ea`I"Bk(^q+DbIq+Co1r
FD5Z2@<-'nF"Rn/.1HW)AT;j,Eb-@@B4YslEa`c;C2[W1%13OO:-pQUF`)52B5)F/ATAo(Bk)7!
Df0!(Bk;?./KdVT:/=bV+@T1+:Jt+#$8<SV+=&'c+ED%+A0sJ_4$"`uE+<g*Gp$R8FCfN8-QlV9
1E^UH+=ANG$4R>;67sBkASbq"AKYMt@ruF'DIIR2+D,>(ATJ:f;Is]`G%F?U@R=XIF@9hQFD5Z2
@<-'nF!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMPI6m-#YATJu3Dfd+2ASc:&B-:o++EV:.+A*buEb/ek
$6i)<6m+ln78k=(:K/H'78-KP7j(Au+B1m#+A*bU;FO"u%13OO9mIjnBl\9:+CT.u+Dl%<F<G:7
E,Tc=@;^00@VKp,De:,#A9MZsAKY].+EM76E,9e\%13OO:.82P;BS_'<^fn/:.82P;BU%&DfTD3
H#IhG+A,Et+Co1rFD5Z2@<-'nF!,17+A*bjDKBo.Cht5)Bl[cpFDl26ATK"($4R>6+EqaHCh+Ys
CiaM;@<QR'A0>;uGp#m]+DkP)@:s.^+Co2,ARfh#EbT*++Dbb-AKVEh-X9JgDeEKq+@^']ATM*(
/e&-s$:AiF@<?''@3A0<6m->TF*(u6+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfd+DBOQ!*BlbD,
Df'H0ATVL"Gp$g=A7]^kDId<rF<GL6+A+7/+A$Z&F!+n-F)N10+D5V2A0>SsARQ^'D]iS%Anc-o
+CQC6F^elqEb/a&DfU+GF*)GF@ruj6AKZ).@<<W/Bl\64EcW?q-Z^DRATDj+Df0VK+<X9P6m,u[
ART[lF!+q+DIIR2+DPM&Ch7Z?+<XWsATME*Anc'mF!+n3AKYSnBl\$8+EMX5@VfTu@Wcc8@VK^g
EbT*++Ceht+Cf(nDJ*N'GA(Q*+A*bdBOPdkATKI5$7QDk:-pQU@rc-hFCcS'+DkP.FCfJ88l%ht
A8-'q@ruX0Gp%-GDfd+?F`_\=A7Zm%Afs\nF!,"-Eb/a&DfTQ'F"Rn/:-pQU<+oue+CfG'@<?4%
DBNJ$E+Not+E)-?@3B&uDJ!TqF`M&(+Co2,ARfh#Ed8cUIS*C(;bpCk6U`FV%16uaG@VgD@W6F#
F*&ck-u*^0FD)dEIS*C(;bpCk6U`Y;E-,Z4F=/M!-XpY.F<GOC@:OCn@qB^(FCfN8+Co1rFD5Z2
@<-W@%13OO:-pQU<+oue+DGm>@;[3!G[YH.Ch4_@+E_a:+CT/+FD,6++EDC=F<G16EZfXGF`JU8
Bk)7!Df0!(Bk;?<%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[kDdd0!CggcqA8,OqBl@ltEd8d>Ec5e;A9Da.
+EM%5BlJ/'$<1pdBl%U.F*)G2FCcS1AU,D1ART\'Eb0;7De:+a:IH=LAKYl%ARlol+Du+8ASlC.
Gp$X3@ruF'DIIR2/g+,,BlbD7AU&;>F*(u4+Dbt)A9/l8BOr;7@W6F#F*&iRA8,OqBl@ltEd8d>
Ec5e;@3B*'D/^V=@rc:&F<G+.F*)G:@Wcd(A0?)1FD)dh:IHfE$7QDk%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
%15dI@:UKs@:C?iBk)7!Df0!(GqKO5.1HVZ67sC!E+No0DIn#7A8,OqBl@ltEd8*$De't<@W6F#
F*&cP>9G^EDe't<-OgCl$;No?+Dbt)A0>K)Df$V.G[YH.Ch4`"F_u(?F(96)E-)Nr0HiJ2+?XCX
@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Cggdo05P'+A9Da./no'A-OgCl$;No?+ED%+ASu("
@<?''@;Ka&Eb/ioEb0,uATJtG+EM47G9C^1F*&OHBQ@Zq+Dk\2F(&]mEt&I`1E_#s+>=pNCi<d(
-9`Q#/g,1GG&J`U%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[a@:O(qE$/Uu@r$4++C\bhCNXS*$6hf&6VCEU
+@8@]93"e26:!t3<DXkK$4R>6F<G:=+Dbb6ATD3qCj@.3+EMF/E$07@+DkP&AKYD(@UWb^F`8II
Bln#28l%i-+<XU$+C\bhCNXS=De=*&DBTGr.1HVZ67sC!E+No0FD,5.@V'V&+E2@0@ruEpAKYMt
@ruF'DIIR2%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sBi@:O'qBlkJ?E"*.n@:O(`+=CW;
FCfN8-OgCl$;No?+ED%7FCZM7ARfY%ATDi7FD,5.D/XK;+CfP7Eb0-1+C\bhCNXS*$?B^!FCZLA
@W6F#F*&c=$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMneCLnVs+EM%5BlJ/:A9Da.F:AR$<'a/G+@.,K6W-KP
<$4S/9i*#C$4R=jE+*6lA18X1@:O(o+E_WG@VK^gEd8dBAnc'mF!+q7F<G:>-Z^D=CiaM;@3B3$
De'u)A7]0lFDi9GA9Da.+s;/LF`JU8Bk)7!Df0!(Bk;?.@<3Q1Cgh$q+EV1>F=n[Y8l%ht@ps6t
A9Da.+CT)&+E)41DBNJ(@ruF'DIIR"ATJu&F!+m6F(oN)Ch4_]+EM%5BlJ/H+B)cjBlJ/:A9Da.
F!+n3AKZ).AKYi.F*&OGFCAWpAKZ2*Gp%3I+EMXCEb-@c+Co1rFD5Z2@<-'nF"SRX<+ohcC2[X(
Dfp)1AKYDlA8c?.A8-+,EbT!*FCfM9@;Ka&8l%htF)Q2A@q?cmDe*E%Bl5&8BPDN1AoD^,/e&.:
%15is/g+\ID/^V9DJXS@-t7.;ATMrB%17#a+=CW;FCfN8-QlV91E^UH+=ANG$4R>;67sB/D..3k
.3N,@ART[lF!+m6A8,OqBl@ltEd8d<F_u(?Bl5&8BOr;sF_u(?F*1r&Bl[cpFDl2F%16Q`FCfN8
A9Da.4ZX^,BQ&*6@<6Ks@;9^k?Qa2oCLnV9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;f?Ma+E_a:F!,C5
+CoV3E$043EbTK7Et&IK:IH=9F_u(?F(96)E--.D@ps6t@V$[)F(Jl)FDi:BASc9nA1Sj5DfBtE
@;]TuD.Ra#AKYMt@ruF'DIIR"ATKI5$7QDk:-pQUEb0'*@:UKiE-,Z4F:ARqA0<7/E-,Z4F=/28
+>Y-YA0<6I%14d43\V\'3b!&MATMs(F_u(,$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq?DfBtE@3B)p@ruF'
DIIR2/e&.:%15is/g+YBE-X*RATDEp+C];3ATMr9A8,OqBl@ltEd8*$DIn$&+=CW;@rH=3-Tc'^
@<?0*-[nZ`6rQl];F<l+@W5gqE-Wf?$?'Gt-Xq%)DfBtL+BosE+E(d5-RT?10HiJ2+F?.YE-,Z4
FC]N2E"*-`$;No?+Cf5!@<*K0@<?/l$=n*sATT%B6VKp7;G]YY81+iR%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+AH9[AKYD(D..L-ATAo6AM%q6B5)F/ATAo7@rc:&F:AR$9gME@+@.,E5uU`O;BSk+/Q,#-8Q/SW
;BSn*;Fs\a+q4kg$;+)^+E).6Gp%0>ATJu9BOr;sBk)7!Df0!(Bk;?.Eb/ltF*(u6ARlotDBO%7
AKY`)@<6O%E\;'@Aft]"Ch4`1D]in*Bl8$$Bl7X&B-:V*Ch[s4+E(j7Eb/ltF*(u6ARlooBk)7!
Df0!(Bk;?.BlbD*+D5V2A0>SsARR26+A,Et+Ceht+D58'ATD4$AKYD(Eb-hCAS5^uFCfJ8F(96)
E-*4EBOQ!*H#IgJ@ps6tARoLs/g)8G$4R>4ASu("@<?''@3BT%/TPE8BleB-EZfF5EbTK7+CT.u
+E2IF+DGp?Bl5&=Dfp(CD..-r+A,Et+Co1rFD5Z2@<-W9A8-'q@ruX0Gp%-GDfdT@$7QDk:-pQU
B4YslEaa'$+ED$FEb/ltF*(u6+EM%5BlJ/'$?B]uAS4.e+EM47GApu3F'i?jDe*2t4*s"22'?gJ
+=ANG$4R>;67sC%@<Q3)BlkJ3DBO%7AKYhuF*(u6+EDC=F:ARtATD?p+Eqj?FCeffC2[Wi+DPk(
FD)dEIS*C(;bpCk6U`YCDe*m"B5)F/ATBD;C3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkhF<GC6@WGmt
Gp$X3@ruF'DIIR2+EVNEEb/ZiDf0B:%14:X78tC'8O?<@;HY,18OHHK:JO2R8OZQ#<)4W776s=;
:/"e7%13OO:N0l_+A,Et+Co1rFD5Z2@<-'nF!,")Anc-o+CQC6ARTUhBHV8&FD*9L+B3#c+D,>.
F*&O8Bk)7!Df0!(Gp%$C+EV:.+E1b2BHV#1+EV:.+E).6Gp$X3@ruF'DIIR2+EV:*F<G(%DBND"
+Cf(nDJ*Nk/g)9.F<G:=+CehrCh7-"FD,5.,&h[H+s:E1@ruF'DIIR2/g)9*G%GP6FD,T8B4rE*
Df0N:F<G+.@ruF'DIIR"ATJu(@;]t$F<G%(+Cf(nDJ*Nk+C]U=8l%htBlk_D+CQC*Df9//Bk1d`
+EVNEF(KG9FD,6&+AtWo6r-QO=Wh0b@psM$ANC8-%16!%5t"LD9N`KKBk)7!Df0!(Bk;?.@ps6t
@V$Zj@q0(kF(Jl)@X0))DL!@BF_tT!EZf:4+A,Et+EV%5CND*N;FNl>=&MUh73H,T@ruF'DIIR"
ATJu(@;[3+DJXS@@V$Zj@q0(kF(Jl)@X0)7DIjr4@<63:+<V+#%15a>AT2@$B-;#)@WGmtBk;?.
;FNl>:JOSd+E2@4G%GQ5F!+n$@qfIbDKK<'+E2IF-Z^D=F!,aHFWbUAASrW!DIal"Ci=B++Co1r
FD5Z2@<-'nF"Rn/.1HVZ67sBt@;BEs@W6F#F*&O&76s=;:/"e"$?'Gt-Xq%:ATMr@+BosE+E(d5
-RT?1A8lU$F<Dr/76s=;:/"e<%13OO:-pQU@W5gqE-WR?F!,@=G9D!@AKYr7F<G+.@ruF'DIIR2
%17#a+?MV3@W5gqE-WR8E-,Z4F=/28+>Y-YA0<6I%13OO:-pQUAnc:,F<G4:Dfp"PF*22=AKZ&*
FE8RD@<?/l$>4Bu+=CT1Ec6)>-T`G43[\HHFCerqARfKuH"CE)A79RkF!,RCA79a+F*2A@Bldj,
ATTUR%13OO:-pQUDJsW.+Co1rFD5Z2@<-W9E+*j%%16W[A:>XT%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[j
AS#g'Eb/ioEb0,uATJu:E+EC!ARl5W,"k?n:`rY)7R^3D:.%HK+B;6+5u^9@+q4kg$;+)^+EMXC
Eb0;7GAhM4+ED%*ATD@"@qB^6+<XQnAn?!oDI[7!+D#G!@VfTuD..=-+E_a:Ap%o4DfB9.@<?4%
DK@EQ;IsHOEb0,uATJu&Ci"$6+=Ll6FE2UT+EVNECi<`m+EqaEA9/l8BOQ!*@ps1i+E)@8ATAo;
DfTB0+DG^9DIn#7@rH7,AU&<</e&.:%15is/g,(MCj@.BF`\a:Bk)7!Df0!(Gp%-=An?!oDI[7!
+Dtb%A0?#6A79RoDJ((D+EM47G9C^1F*&O:Bm+&1D.Rd0@:s.m%16H"+F>^`0Hb"EDdmc74s58+
+ED%:D]gDT%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cDe!p,ASuT4A8,OqBl@ltEd8dG@VTIaFE7lu,",3o
<D>nW<$4S#6W?WQ:-hc\+AY<r771$Q+q4kg$:JfBF_t]-FCB9*Df-\3F!+m6Ci=3(+EMX5DIdI!
B-;86Eb-A4DeX*2+D,P4+E2@>B6%EtD.Ra//g)92Df^"CDe:,6BOu$'BOQ!o+DGpM+B*2qAKYK!
@;0R$Blk_D+E_R>ARf:mF('*7+CT.u+D#_-DBNJ(F*)G2@ruF&B.b;L:NU8]EcW@BF`\a?DBNV$
Ch=f!@;BFb+D#.sDfTr@/g*`'+DlBHDfBE.Bl@l3FD,B0+<kN@DC9NKAThX&+EqjEDJ(+:+<X0m
De'u$De!p,ASuTuFD5Z2+D#A#G%#K(F!+t2A7[A98T#YDDKU&7-Z^DKE+s3(Df-\3F<GX9E+*cq
FCfM9,&Ct8ATD4$AKYr4DeF*!D/F!)B-JI1Ec5e;FD,5.@;L$sEc,<-Bm+&1/Kc6OCi!g-ATD4$
AKYr4DeF*!D/F!)B.bAN+<V+#%15^'6m-GhDg#i*ATJu&+Du==@V'R&De:,'@<6]:G@>c<+EVNE
A8bt#D.RU,+Cf>#AM,*.Dfm14@;[3!DKKH1+CQC6Bl7R"AKZ&*DKKH-@q?d$EZed5Cgh?sAKYMt
F)to5FCB9*Df.0M+A!]"Dfol,+ED%'Df'?&DIal3BOr;uDfT]+E\8IW;e9M_8l%htA8bt#D.RU,
@<?4%DBNP0EZf4;Eb-A(De!p,ASuTuFD5Z2+E)4@Bl@m1/e&.:%15is/g+bEEZf72G9D*JEb'56
FE2XL@3BW*DJ*cs+Dbb0AKYo'+CoD#F_t]-FCB9*Df.0:$=ROgATDTqF*)JFE]lHh+FPkk+<s-U
+=eQh-7ERhIORN1>9H?e+C-E*$?1-0+=CT0FCfK/@<6O3FE/`<$4R>;67sBpDKBB0F<GX9DKKH-
@q?)V0H`=tE-67F-XgV/ATDTqF*)JFE[NprEb0?$Bl7u7F*)G:DJ((?GpskEAoqU)+DbJ-F<GL3
@s)g4ASu!h+E(j7.!R0g%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k8l%htF`V,8+CoD#F_t]-FCB9*Df-\3
DBNh.G9CC6DKKH7FE9&D$7QDk:-pQUAoD]4FCAZnFE8RHBOr;sDe!WqDKI"BASuU$DI[6#BlbD/
ATVEqARl5WA8-+(+=CT0FCfK/@<6O3FE/`<$4R>;67sBiEbT)sCj@.6ATM@%BjtWrF*2A;Df9M9
B6%p5E$-8T+EV:.+E1b7@UWb^+D,P4+D#G4ATDL&B-;;0Df]J4F(K62ASu!hEt&IiCiF9.+FPjb
B6%r6-ZaEJD/X?1-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$:/PPAU%X#E,9).De:,.Df021A8bt#D.RU,
@<?4%DCuA*.1HVZ67sBsDf021A8bt#D.RU,%14d33?VjHF)W6LF*2A@Bldj,ATTUR%13OO:-pQU
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l
@:C?XARfgrDf-[cAS,XoAKZ8:F`JUCGA\Nq:IH=HBQ%p5@s)m7%14:I77KjD73G`/<Djr8=&'l1
:IH=(85E,_6WI)a+q4kg$;+)^+EqaEA9/l'@;[2sAKZ,:ARlp-Bln$&DBNA.@VKq)@<-W98g&(n
DeF*!D0%<P+A$/fH#IgJA8c?5F<G10DIaku+A,Et+E2@8D/"*+G%De<BOQ!*D.R:#F!,aHF`JUB
AS#Cn+CoC5@3BB#FED>1+E2@>B6%EtD/!m#/e&-s$<1\MEb-A%Eb-A1@;^?5AU%X#E,9*,+E(j7
8l%htE,ol0Ea`g%Bl7Q+Bl5%c:IHRO+EMIDEarZ'@rGmh/g*`'F*(i,C`mh5AKY`+A92[3EarZ'
@:WneDBO%>+D58-+A,Et+EMIDEarZ'@rGmh/e&.:%15is/g+_M@;Tt"ATJu4Afu5;Bl7Q+8l%ht
GAhM4F!,RC+Co%qBl7K)DIn#7Amo1`Ch\!*ATJ:f%15is/g+\9F(96)@V$Zj+A,Et+D5_5F`7cs
BP1[dC2[Wi4ZX]i3Zr*PE,KJ7><3mT/g+eIE"*-`$;No?+ED$FEb/ioEb0,uAKYr7F<G+.@ruF'
DIIR2+EM47G9C=3Gp$[=Ec5u>%17,eEb/iiBkhQs?TgFm1E\_$-R`j`/orHa,CUae/itb6+u(3]
4YAE2B5DKqF!a(g4YD.8Eb0E4-RU8h+Bot6-OgCl$;No?+EM47G9D*JEb'56Eb/ioEb0,uARlom
Gp%<LEb'56Bl5&%+D5_5F`8IFBOQ!*@<,p%DJsV>Bl5&8BOr<!Ec6)>%16igA7o7`C2[Wi4ZX]5
@:sV!F`8];$>t)qBkhQs?TgFm1E\_$-R`D>CiX*!F!)TR/g+eE.3L2p+D5RT/g+eIE$/n6A7m8!
$4R>;67sBtBle?0DJ()(Ec5e;-t-b/Dfp"J%16ut+=ANG$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBM;hF*)>;
BmO>58l%htARoLs+D,%lBl%L*Bk;>p$6hi;;cHOe8QnP*8l%ht779^H+@\Xa8PD]T8OZQ%%13OO
<+ohcD..-r+A,Et+D#(tF<GdGEb'56-uO5X+CT.u+=Lf3.3N,/DBND"+CfP8FDl#1H=^V0@X0),
AS,XoBl7Q+@3@s66WHiL:/jSV9hdoK6m-P\EbTK7/e&.:%15is/g+\9Anc-o+CoD#F_t]-F<G(3
D/E^!A0>r'EbTK7+>"^_ISP??+DGm>GAhM4+DtV)AKYr.@:Nk^DerrqEX`@D:IA,V78?fL:JFPL
:./H'C2[Wi+?_b.0H`D!0F\A1D/XQ=E-67FE,m'KH[\_=I4#I2.1HUn$4R>;67sBjEb/[$AKYD(
DIn#7GAhM4+>"^SE+Np.+D#(tF<GdADId[0%16us+=CW;GAhM4-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku
$:\`IA0>u-AKWC1E-H5@A18X4A8--.GA1r*Dg*=4DIal-DffP5BQ&);6r-0M9gqfV6VgEN5u'fj
FCf]=+D>2)+C\nnDBNe7A8,XiARlolDIal(DKBB0F=n[Y=(l/_+EV:.+EM%5BlJ/:GA1r*Dg*=<
F!,O4G%G2,GA2/4+@B%+9J'<g6r-0M9gqfV6VgEN5u'fjEcl8@/e&-s$;u"a+CT.u+Cf5+F(HJ9
BOr;7@W6O0Eb$UAARoLs+EqO;A8cZE%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqAA8--.@3Bc4Eb$;,
DBO%7AKYMt@ruF'DIIR2/g)9/:IH=>F!+n-G@>c<+D#(tFD5W*+Cf>/Bk;?<+A[#lB5)6lCi^_/
@;[3+DJXS@@V$ZlBOPdkARlp-Bln#2AU&01Bk(k!+E2IF+E)41Eaa'(Df0VK%14Nn$;No?+Dbt)
A0>Ds@ruF'DIIR2+EqaEA0>T(FDi:5A8--.GA1r*Dg)WtARlo2F*2A@Bldj,ATTUR%13OO:-pQU
Anc-n+EV:.+=M;RDK9H4ATMF)0I\,UA8--.GA1r*Dg*=4DIal-Dfd*i:IA,V78?fL:JFPL:.-36
$4R>;67sBjCi=B++D#(tF<GdADId[0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[cAS,XoAKXT@6m-GhDe`in
F<GF/@rcL/%14:I77KjD73G2u6m,<(:J+&C<$4n$6W-]Y+q4kg$<LnPDBNn=DeF*!D/F!)B-;D4
FD)dh:IH=NDfm1EH#RJ-@;Kb*+E)41DBN@1F(KG9De:,&Bk)7!Df0!(Bk;?<+A?]^A0>r3D.Oi2
H#n(=D'3n0EbTK7F!+n/A0>DoAnc-o+EMI<AKYYpDIe#8DJsZ8F"SRX<+oue+Ceht+C\n)A8c?s
+DG^9@3BN0De`inF<GF/@rcK1F(96)E-*]A$7QDk:-pQUA7]@eDIjr!+E2@>C1Ums+DkOsEc3'P
+A!\uF(HJ9BOr<*Eb/isGT^sGC*7,,EZfFG@q[!+@rc:&FE7luE,o]7F`)&7Df.^!+>=p!+>=63
%15is/g,4W@;]UaEb$;-+EM%5BlJ08%17,eEHPu9AKW@2AR]dp+EV%5CF9Pu%15is/g+tK@ps0r
F(96)E-*4?Dfor=+:SZmDe*KfBkhQs?TgFm-ZaEJD/X?1-OgDtDe*orBkhQs?TgFm-ZaEJD/X?1
FCfN8F!hD(%15is/g,+UF>%lZAS)AY6r-0M9gqfV6VgEN5u'gTH=%dX3ZoekD/XQ=E-67FE,m'K
-[U;;IXNRk-OgD3%13OO:-pQUF*)>@AKYhu@rcJs$8`lEF`\`RE,o]7F`)&7Df-pa8lJ)T8PiAn
@;9^k?TW4IC3+N8D/X?1%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:MsZR+E2@>C1Ums+DkOsEc6"A@<,p%
A7]@eDIm?$Blk_D+D"u&Gp%3I+Cf>-Anbn#Eb-A=Dfp(C8g&1dF)u&6DBLMRDfB9*+EV:.+ED%5
F_Pl-A0>Ds@ruF'DIIR"ATJu&DIal1F`&=GBln#2-us/R+EVNEF(KH9E%VS,.1HVZ67sC%ATW'6
+E2@>C1Ums%17,m+=D,KC3+N8D/X?1-QjO9+E(d54$"`uE+<g*Gp$R8FCfN8-QlV91E^UH+=ANG
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMAYBlkJCDfp(CC2[X%Ec5Q(Ch555C3'gk,"4mk<$5=><DjrSDe*g-
De<^"AM.\3F!;&#%160MASrV_:IH=ADdd0t+EV:.+EM%5BlJ/:IUQbtDf0VLB4YslEa`c;C2[W9
C2[X%Ec5Q(Ch555C3(M3F!,%=ARfk)ARmD9<+oue+EM%5BlJ/:@ps6t@V$[)F(Jl)FDi:CATT&;
E$.bK6m-SbAKZ2*Gp%BNFWbm:DKIKR:2b5c+D>\;+F.mJ+Ceht+D#e/@s)m)+E2@>C1Ums+DkOs
Ec6"AGA(Q*+A,Et+Dbt)A9/l;Bln#2F(K62ASu!hF!,:5CLoO9$4R>_D'13FEb]Z<DJa<1DC6Q2
+E(d54$"`uE+<g*Gp$R8FCfN8-OgCl$<KMk:.\2N3ZrKcDfTD3H#IhG+E2@>Anc'm+DG^9Df0,/
De:,;Dfp(CA8,OqBl@ltEbT*+/g)99BPDN1Anc'm+DGm>Eb0<'F<Gd@ASrV_5tiDDE+EC!ATJu9
BOr;Y:IH=6A7TUr/e&.:%15is/g+\=F)Yr(Gp$j?A8lR-Anc'm/no'A%16Zg+ED%%A7&b[De*2t
C2dU'BIA7;A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A-OgCl$;No?+Cf5+F(HJ9BOr<$
De*g-De<^"AM.\3F!,[@DId[0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[t;ahg$:IH<r78-N#5u'fj6r-0M
9gqfV5u^EO:(7OS<Du=/8l%ht84?3K+@/aj+@K!m<D>nW<'aJT:JN)C$4R>6DKBo.Cht59BOr;7
B4YslEa`c;C2[WnDe!p,ASuT=+CSekDf-\>D]j1DAKXT@6m,;o7NcAUCiD!L%14Nn$;No?+Dbt+
@<?4%DBNk0+DPh*/oY?5+>"^MDKBo.Cht5&A7TUr+=Ll6DImisCbKOAA7TUgF_t]-F=A>VBln#2
8jQ,[$>ONgFD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7d1u$4R>;
67sC!E+Np.+DPh*/oY?5+DGF1@3BN"Afu,*@:Wqi+DGm>@<Q'nCggdhAKYo/+F.mJEZfFKF*(u1
%16igA8#OjE$-hD$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMl#D/E^%Gp$O5A0>JuDII?(Eb0)rEbf_K%16'J
AKYT'Ci"$6Bl7Q+E,oAsFD55rF!,=.CLnV\:IH=BDfTD3E,ol-F^oN-G%De)DIal4F(Js+CcW"4
%15^'6m+ln78k=(:K/H'78-KP7j(Au+B1m#+A*bU;FO"`$4R>/5sn:F:`r(j6VCEU+@8@]93"dt
$4R>A5taWh5p0)n;Fs\a+@K4(:^ma@$;EfZ73Fl=9gM]W78b7+74hD+7nHWY78b7,6W-KP<"00D
$<'Am+A>?n;F+2`+@Jdg<(Tk\5uL9C;]o%8+AtWo6r-QO=Ub]I$;3fV:`rY)7R^3D:.%HK+B;6+
5u^9@%13OO6r-0M9gqfV+@Jdg<(Tk\5uLi.:I7ZB6W?tn$4R>177KjD73G`/<Djr8=&'l1:IH=(
85E,_6WI)a%13OO6WI&a:JFDa73G2u6m+od8Q6g%5sn4;8Q88M;[j'C$:I<P8PV\s8l%ht:f:(]
771#s9gM-E:K%]0%15Nl8Q6g8:K::8C2[X%Ec5Q(Ch555C3'gk%16*673G2u6m,#h9Mcit:.-3m
:IA,V78?fJ<(Tk\%13OO%16'JATME*@<,p%C3=T>+EMI<AKYo'+EV:.+A,Et+E2@0@ruEpATJtc
+D>2,AKYT'F`(_4F`V,+F_iZQ+@1&kH#IgJF`V+:8l%htH#IgJGA1l0+E2@>@UW_^Gp$^5DIal8
Dfp(CDg-(AD.Rg&De*oA+<V+#%15[=+F.mJ+D,>*A0>;u+CQC8F(Js+C`mS+FD,T'+E2..@<6!&
Ch7]2D.Oi*DJs_O+<X5u@ps6t@V$[&ART(^ARlolF?0j<%15^GBPnqZ@;BFp+:SZP@<,jk+>PW*
3"64(@;BFpC1K=b5\FqBBl#D3Df#pj.1HUn$>OKiA9Da.1,V`k6<$NU9LV**+=BcW6m*m5.3MQ-
F`Lu'+@C'XAKXB`D/^Ur@rc:&FE8f=$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@EX`@b
@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX5sdq79he&O<)Yq@+=C-%BlbD5@:C?iASl@'F*)G2FCfM9
BQ&);FDi:<Ddd0!A9Da.+A,Et+EM%5BlJ08+>"^VAThd/ARloqDfQsm+?1u-GT]^hEarc*1,(FB
-OgDV5se%:6WI&J3Zp-d$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMMgFE2;1F^oN-Df-!k8l%htF)Q2A@q?cm
De*E%BlbD-BleB:Bju4,ARlotDBO%7Eb/f)8l%htA9Da.+EM%5BlJ08/g*Q)D/^V=@rc:&FE8R5
Eb-A4Cgh$q+@/pn8P($s+EM%5BlJ08+EV:*F<G(%DBND"+Dbt)A7]9oGA2/4+A+#&+EMX5DId0r
A0>r'EbTK7+E2@>@qB_&Bl7Q+G%G]'F"Rn/%16'JBlbD5@:C?fF)uJ@ATJtd:IH=6DIal2F`;;<
Ecc#5B-:VnA8c@,+D>2,AKYGnASrW)DKBo.Ci!Zn/g*b^6m,oUA0>r9E,]`9FD5W*+CSekDf0V=
@ps6t@V$ZrDKBo.Ci!Zn+EqOABHVD1AKXSfE+*6l@:s-oD..<jB4Z*9%14Nn$;No?+EVNEF`V+:
@3B*'D/^V=@rc:&F<F1O6m->hF*&O6AKYDkFD5o0%17,eEHPu9AKW@5ASu("@;IT3De(4)$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBM;bDJ!TqF`M%9@3C#6De*p-F`Lu'+Co2,ARfh#Ed8*$<,Wn"F`&=1+A,Et
+CoV3E$043EbTK7+EM76E,9eBDfB9*+CQC1ATo8-Bk)7!Df0!(Gp$O5A0?#9AKWBT+Z_;+/g(T1
%15RCEZfI;BlbD5@:C@$BOr<-Dfp)1AKYMt@ruF'DIIR"ATJu&Eb-A'Eb/[$ARlotDBO%7AKWCM
8l%iR:K::[74B@"ASbdsBm+&1A8-'q@ruX0GqL3^=`8F*GA1l0+Dtb%A0>u4+Cf>-Anbn#Eb-A%
+A*bgDerrqEZfIB+E275DKI"CD]iJ++CSc%F^])/A8-'q@ruX0GqL42+B)6;:JODR=WgU26VgEN
78?5nF`V87B-:V*A8-'q@ruX0Gp%3B@<<W+F!,@=F<G:8+EV:.+A*btH#n(=D'3q@AS!#-=`8F*
A8c?5F<Gd9DKI"HDfp(CE,oN"BlA-8+Co1rFD5Z2@<-W9A79Rg@UX=hF!+q'Bl7Q+GA2#-A0>?,
+DG_7FCB!%Bl7Q+FD,5.DIn'7+A*c"ATDj+Df.0:$4R>/AS,k$AKYr4De!?iA8,po+Cf>-Anbn#
Eb-A%+=M\2:IJ,W<Dl1Q.3N/8Eb/a&DfU+U+AZkt8iSFWGT]UU<$67-F*(u1F!,R<AKX?YDJ!Tq
F`M%H7W3*RATDi7D.RU-+E)41DK?qBBOr;sBl[cpFDl2F+D,P.A7]d(@rH6sBkMR/@<?4%DBNP*
Ch54.$7QDk:-pQU@rH6sBkMR/AKYD(IS*C(;bpCk6U`,.Bl[cpFDl2F+C\noDfTD3E,ol,AS#Cd
DJ()6D]j.8AKYl%G]Y'LFCfDD%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qASl@/AKYr4AThd+F`S[A@:C?i
Bk)7!Df0!(Bk;?<%160&;GKeY7lhbl84=Xr79EM3;cH1^+AtX&:KBn_+@Jdg<(Tk\5uL9C;]nG*
76smA6m+g!+Abs-:Jr<5<DHI8:IZI+84c`&9L1ut+<XWS73Fui6W?WQ:-hcL78k<WF`_>6F)5c'
A1Sj<De*[&@:Uo3C2[WnAThm.@:Uf0=%Q(Z+@8L>6q'd<<(02-+<X6F+B_K?+@AFm73Fl_:K:@:
<(KG#6VgHV78?f\+AYHL<(KGV73Fui6W?WQ:-hcL78k<s:EWD.<$4V3771'S73GQ#73G>o=B$D:
5sc\m<(0V9%13OO<+oue+EMX9E$/\&Anc-oF!+m6G%G]'+EV:*F<GU8D/XT/F!,:-@N]`1F`Lu'
+Co1rFD5Z2@<-'nF"Rn/.1HV^ASl@/AP?NA;f?f!@qA&B@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!
%16f]/g)Nj8l%iR:K::[740303ZrH]Dfe,p+DPk(FD)dEIS*C(;bpCk6U`@FA8a(0$6UI4D/XQ=
E-67F-UAkI:IJ,W<Dl1Q+Co2,ARfh#Ed8dAF!,@=F<GX9FEMOF/Kf+GFEMOF@;]TuFE2XL@:s"_
DD!:G$>"$pASGa/+>#3XAU%p1F<G=;@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De(J7
C3(aFA8a(0$6UI4D/XQ=E-67F-V@0&;bpCk6U`,+A7TUr+DGm>DJsV>Bl8!6@;KakA0<HHBl8!6
@;Ka&@;]TuFE2XL@:s"_DD!:G$>"$pASGa/+A#%(8PUC=D_;J++<XEG/g+Y?ARTU%Dfp.EA8,Oq
Bl@ltEd8d<Bl[cpFDl26ATJ:f+<Y`=ASc0*-ZW`?0686hE?HGQ/1>OWDfdNX>]k.&CiaE2@:U`7
/12Vh%144#F(f-$C`k*GA0<OH+>7^W+t"oiEc5l</14\;De*[&@:U`7/12Vh%144#F(f-$C`k*G
A0<OH+>7^W+t"oiEc5l</14\;De*BiG&2)*A1&fW-R'oI$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*
Ed8cUGA1qD+EMIDEarZ'A8,OqBl@ltEbT*++D#S%F(Jl0%16Z_F(K&t/g*_T<DH+f+CoCC%144#
:-pQU@<QR'A0>>t@;]k%+DG^98l%iR:K::[73HPXFD,_<Df-[kBl8'<+CT.u+AH9S+EMgLFCf<1
%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)nFD5Q4Ci<`m-OgD*+EM4-Cht4AEbupNEb6FA/95ZI
F=\dmC2[X!Ddd0(%144#F(f-$C`k*GD'1ENAfrHPEc5l</13)cDe*BiG&2)*A1%fn+<Y`BDfp/@
F`\`R9OVBQFCf<.DfT9,Gp"MP@:Ls,Bl8'<.3N\MF`Lu'+Co1rFD5Z2@<-'nF!,%7@<6!j-OgDo
Cia0%AhIV4/e&.1+EMC<F`_SFF<Dr"Eaa$#+CT/5+E2@4G%kl;F!,R9D/aE6@<-W9CggcqF)Q2A
@q?cnBk)7!Df0!(Bk;?.D..=)@;Kb*/gh)8ASu$2%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqNASl@/
AKYE!Gp%'HAThd+F`S[ADdd0!CggcqA8,OqBl@ltEbT*+/e&.:%15is/g,:SEb/ltF*(u6+>"^M
B5VX.AKYQ)Ec5u>%14d30H_V`1E^^LB4N>Q+?MV3F`_>6F)5c'A0>W*A8H0mA0>W*A7T7pCi<`m
-QlV91E^UH+=ANG$4R>;67sBjCh7$q+E)CE+Co1rFD5Z2@<-W9A8-'q@ruX0Bk;>p$;tGPDg#\c
@:E/RF`Lu'6tp.QBl@ltEbT*++>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@C0\@<?''F`_>6F)5c'A0>Ds
@ruF'DIIR2%15LGD/^V=@rc:&FE8R5Eb-A0Ddd0fA0>T(FDi:4Bk)7!Df0!(Bk;?<+<X$lART[l
+CQB@F`_>6F)5c'A18X3Bk)7!Df0!(GqKO5.1HVZ67sBjEb/[$AKYD(DIn#7F`_>6F!,"-Eb/a&
DfU+GBl5%AIS*C(;bpCk6U`FH/KebL+EqO9C`m1u+ED%2@;TRd+DbJ.ATA4e:-pQU=`8F*D09oA
+Cf>-Anbn#Eb-@AIS*C(;bpCk6U`FH@;]TuE,TH.F<G[D+CT.1@:OD%@;I&tD/aTB+Co2,ARfh#
Ed98H$4R>[ATqZ--ZsNFCiaE2@:U`I-u*^0FD)dEIS*C(;bpCk6U`YNFD5Q4Ci<`m-Rh,)D..-r
+E_d?Ch\!:+Co1rFD5Z2@<-W@%13OO:-pQU@r-()AKYE!Gp%$EASrW$Bk)7!Df0!(Bk;?.@;]Tu
DfB9*%17#a+=D;RBl%j,Ddd0(+BosE+E(d5-RT?1%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%160MASrV_:IH=9
F_u(?F(96)E--.DEcl7BFD,62+CoC5DJsV>A8-+,F`Lq6H#IhG+CfP7Eb0-1+A*bfDK]`7Df0E'
DKIKR+@0g[+EqaEA9/l%Eb-A(AS,XoARlotDBN@1DKTf*ATD?m+EM%5@<?!m+Dbt+@;KKtFD,*)
+DGm>@rc-hFCeu*GA(Q*+A,Et+Dbt)A90@G+A,Et+CoV3E$043EbTK7F!,"-F)Yr(Gp$s8F)tc&
ATJu&AoqU)+Dbt)A8,po+C\c$@q]Fp+E(j7DdmHm@rucE+<XWsAKYl%G]Y'E@:C@#FCfD6Ci<`m
F!,R<AKZ,;Bl%L*Gp$X3@ruF'DIIR2/e&-s$<LYVDJ=!$3ZqsUD/^V=@rc:&FE8R7@;[2sAKZ/-
Ed8dD@<-!l+EMHDBlk_D+CQC*Df9//Bk1d`+EVNEF`V+:@;L-rH#k*NF(HIB0HiK%.4u_c9Q+?M
Bl7Q+@3B*'D/^V=@rc:&F<G:8FDi9o+EM+8F(oQ1+D#(tFDl2@+Ceht+CfG#F(c[g+D,P4+Eh=:
Gp$p3EbAr+F(96)E--.R%14Nn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!FD,5.F`_>6Bln'#F!,"-
@ruF'DIIR2/e&.:%15is/g,1WDBO%7AKZ,;Bl%i5A9Da.+EM%5BlJ/'$8<Va0H`JmE+*j%+=DVH
A7TUrF"_0;DImisCbKOAA92[3EarZ6F`_>6F"V0AF!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+Auc`ASu("
@<?''F`_>6F!+t5Df]tBEb/ioEb0,uATJ:f<+ohcCghC,+Dk\2F(&]m+Co2-E,8s.ARlomGp$N<
A9Da.+EM%5BlJ/:BlbD*+ED%1Bl7HmEZfIB+ED%+ASu("@<?''@rcL/F!,L7An?!oDI[7!/g)9/
:IH=9Bk)7!Df0!(Bk;?.D..-rFCAm$+EqaEA0>B&Df]tBEb/ioEb0,uATJu9BOQ!*@<,p%F`V,)
+DG^9D..=-+Eq7>F"SRX<+ohc@rcL/F!,L7An?!oDI[7!+CT;%+Du+>+EMXCEb/c(Bl5&(F_u)=
+CT.u+Dl7BF<G%(+ED%'Eb/[$ARlolAoqU)G@>N&F"Rn/.1HVZ67sC$AS5RlATD4$AKZ,;Bl%L*
Bk;?.@rcL/F!,L7An?!oDI[7!+CT.u+EM47G9CL3EcZ=F2'?aIF)tc&ATJ:f2'@5u+>=pNCi<d(
-9`Q#/g,1GG&JKN-OgCl$4R>;67sBt@;BEsF`_>6Bln'#F!+m6Eb/Zi+E).6Gp$X3@ruF'DIIR2
%16WbF(KG9-W3B!6r-QO=XOXc%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>W*A.8lFBOr</FD5Q*FD5<-
+Co1rFD5Z2@<-W9BlbD7Dg*=?Ddd0fA0>;uA0>B&Df]tBEb/ioEb0,uATJu-@<Q3)@V'+g+E_X6
@<?'k/g)99D]iP.D/a<&FCcS:BOr<,ATMs3Eaa'(Df-\9Afs]A6m-PhF`Lu'+Cf>#AKZ2.+Du+A
+CfG'@<?''@;]TuCi<`m+=LuCA8H0mA18X0DIak<C2[WnAThm.@:Uf>%14Nn$;No?+CfG'@<?''
A8,OqBl@ltEbT*+%16uaG@VgDC2[X!Ddd0(4"+i_@<?0*-[nZ`6rQl];F<l+C2[X!Ddd0(.6Anl
De'u3Dfp)1AKYK$A7ZloBk)7!Df0!(Gpa%.DIn$&+=CoBA7T7pCi<`m-T`_kE+*j%+=DV1:IJ,W
<Dl1Q05>E9A7]q#Ddd0(.6AnlDe'u$AThX$DfBQ)DKI"?F`\a:Bk)7!Df0!(Gpa%.%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2%15^'6m-PhF`Lu'+Cf>#AKYMpE+NotF!,C=+E(_(ARfh'+DG^9FD,5.F`_>6Bln'#
F!,"-@ruF'DIIR2/g)99BPDN1Eb0&qFD5Z2F(f9,+DGm>D..-rFCAm$ARlomGp%3BAKYr#FD)e8
Eb&a%+E(j7A8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nF!(o!
1E^UH+=ANG$4R>;67sC!E+No0-u*[2Ci<`m.3N&:A0<:CFD5Q4Ci<`m.1HW&A0<rp-YdR1Ci<`m
+E_d?CiaE2@:U_p$4R>;67sBkBle60@<iu+Bk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z8+>=63
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2%15dI@:UKQ:IH=HDfp)1AKYK$A7[A9+B3#c+A,Et+Co1rFD5Z2@<-W9
A9Da.+DGm>Cgh?sAKYGn@psM$AKY]/+Cf>-FCAm$F!+m6F*1r5FCB'/Bjkg#@;Tq*DKI">AftW&
@s)X"DKK</Bl@l3@;]TuFCfN8+Cno&@4iZoF<GF/Gp%3;CLnVs+D,2/+Dl%6ASuU2+EVNECi<`m
/e&.:%15is/g+tK@:UKqDe':a0HiJ2+?XCX@<?0*-[oK7A8c@,05"j6ATD3q05>E9F)Q2A@q@<.
De(J7C3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMhgB4YslEaa'$+DPh*+CfG1F)rIEAS,LoASu!hEt&IC
AS,k$AKZ#)B4YslEaa'(DJ(),De(5:+CfG1F)rIEAS,LoASu!hF!,:;DegJ(F<G[=AKYo1ASrW$
Bk)7!Df0!(Bk;?<+<XWsAKWC9De*[&@:Uf0A8,OqBl@ltEd8dFDg*=;@<3Q"+ED%*ATD@"@q?d%
@<?0*FD,*)+DG_'Cis9"F!)lRFD5Q4Ci<`m.4u&:.1HVZ67sBuDffP5FD,5.-u*[2Ci<`m.3NS<
FD)*jA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15^'6m,u[Df]tBEb/ioEb0,uATJu<Bl%T.A7]^k
DIal.DBO(DBl%L*Bk;?<%14Nn$;No?+ED%+ASu("@<?''-u*[2Ci<`m.3N,@Df]tBEb/ioEb0,u
ATJu&DIal2BQ&);Anc:,F<EF`D.Rd0@:s.m%14s8HS-Ep+D5M/@WNk[+FPjbEb0E4+=ANG$4R>;
67sBt@;BEs-u*[2Ci<`m.3N%AEb/Zi+E).6Gp$X3@ruF'DIIR2%16WbF(KG9-W3B!6r-QO=XOXc
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+A?]^A0>W*A7T7p%15jKG9C^5F=2,PCi<`m+CT.u+CfG1F)rIEAS,Lo
ASu!h+=LuCA7T7pCi<`m.4u_c-u*[2A7]q#Ddd0*+DGm>GA(E,+A!\c@;Ka&FD,5.,%P8./Snj@
ATAtI+<XWsAKYMpFtIN=H"D"=BlbD*+E2IF+Co1rFD5Z2@<-W9FD,*)+EM7=F!,C=+EVO@+E(j7
@3BH1D.7's+E(j7F*(i"Ch4`"Bk)7!Df0!(Bk;?<+@L?mBl7Q+A7]pqCi=90ASuT4Df0B:+EV:.
+Co&,/Snj@ATAo'BOPdkATKIH+B`W*+Ceht+D"u&Bl&&;Eb0E4CLnVs+Co&,/Snj@ATAo(Bk)7!
Df0!(Gp$RA+Cf5+F(oN)+DGpM%14Nn$;No?+Cf5+F(HJ4E+No0A8,OqBl@ltEbT*++CT.u+E)41
DBNY2+Cf>1Eb/a&+E1b2BHV56A7]cj$8WfCA0<6I%17#a+?MV3C2[WnAThm.@:UKqDe*[&@:UL'
FD5Q4Ci<`m-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;>AHA0>;uA0>B&Df]tBEb/ioEb0,uAM+E!.1HVZ
67sBsDdd0!-u*[2A7]q#Ddd0*%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De*p-F`Lu'
05>E9A7]p:Bkh]:%13OO:-pQUBl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/_:BleB;+>"^HAS,Xo
ATJu5F`\a:Bk)7!Df0!(Gp%'7FD)*jB6%r6-YdR1Df-paI4cXTEc<-KC2[X$DC5l#%15is/g+YE
Df]tBEb/ioEb0,uAISu(+F>^`0Hb"EDdmc74s58++ED%:D]gDT+:SYe$;No?+Co&,ASc:(D.RU,
+E1b2BHUi"@ruF'DIIR"ATJ:fA8,S'+>=63%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!\ATD4$AKYT-Ci"A>
@rH4$ASuU$A0>W*A0>r'EbTK7Et&IUBOr;Y:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.BOQ'q
+Du+A+C\nnDBNt2F*)>@ARmD9%13OO<,WmlASu("@<?''Ap%p+Gp$U8D/Ej%FCeu*FE1f#Bln'-
DII?(8g&1bEbTK7+D,>(ATJu+DfQtBBOr;rDf'H3DIm^-F!,C5+EV:.+A,Et+EMgLFCf;3H#IgJ
@ps6tEcl7B@3BW$EbTK7+EMXCEb/c(Bl5&8BOr;Y:IH=9Bk)7!Df0!(Bk;?<+<XWsBlbD<FCfD6
Ecl8@+EV:2F!,O6EbTK7/e&.:%15is/g+e<DImisFCcRe:IH=H@rc:&F<G10Ch7Z1Bl5&*F_kl>
+Cf>,D.RU,ARloqDfT\I%17,m+=CW@Bl%<pDe*p-F`Lu'-OgCl$;No?+Cf5+F(HJ)Bk)7!Df0!(
Bk;>p$8WfCA0<6I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[qAStpnAKXT@6m-;a@:UKkBk)7!Df0!(Bk;?<
%16'JAKXT@6m-PhF`Lu'+Cf>#AKYMt@ruF'DIIR"ATJu&Eb-A2@;TRd+=LuCA7T7p.3L$RDe(:>
@;]Tu.!9WGCi_$X+<XBeDL!@HATMr9@;]Tu@WcC$A0>r'EbTK7F!,17+EV:.F(HJ)Bk)7!Df0!(
Bk;?.D..3k+E_a:+E(j7FD,6,AKYl!D.Rc@+<XX%+Co20AKY])FDi9o:IH=8De*E%Blk_D+CQC*
Df9//Bk1d`+EVNE@rH=3+CT.u+ED%2@;TQuFD,5.Ci<`m+Co1rFD5Z2@<-'nF"SS8DI[U%D.RU,
+CT.u+EDUB+EV:.+D,P.Ci=N3DJ().Bl7L'+EVNE@rH=3+CT.u+ED%2@;TQuFD,5.Ci<`m+Co1r
FD5Z2@<-'nF"SRE$4R>D5uLHL:.I>f<DGnW9he&O<$4t39N`K07Nbi0<?O\*+AP^3+@/\!76s=E
+@ne!73F!nDe*BiFt"O^C2[W3+@/aj+=MASBl%i>+@Jdg<(Tk\5uL9C;_ALd.1HVZ67sC'DK9<$
BleB-EX`@N67sB:+ED%+A0sJ_4$"a3FD5Q4Ci<`m+DPh*Ci<`m+DPh*A7]q#Ddd0!F`_>6F!,49
A0>W*A7T7p-OgCl$;No?+Cf5!@<*K!DL!@>De'u3Dfp)1AKYMt@ruF'DIIR"ATJ:f:-pQU:2b5c
3ZqpND/E^!A9/l%Eb-@pBl7I"GB4mFEbT*&FCeu8+@^9i+E_R9GT_'QF*(u1Et&IO67sC$ASl@/
AKYE!A0>B#E-WR:Bl[cpFDl26ATJu2@;^3rCi"AL%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P
@<?0*-[nZ`6rQl];F<lXF`_>6F!iCf-R'oI$;No?+EM4-Cht4AEb$:GF!*,U+<i0a-u*^0FD)dE
IS*C(;bpCk6Ub6pDe(4E/12Vh%15is/g,4KASc0*-ZW`?0686hE?HGQ/1>7P@<?0*-[nZ`6rQl]
;F<lXC2[WnATfFM/12Vh%13OO:-pQU@rH=3+Co1rFD5Z2@<-'nF!*%W04c8EE-,f4DBNG-E+rm)
+ED%5F_Pl-A0>H#E--@JF*1r&Bl[cpFDl26ATJt'$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*
-[nZ`6rQl];F<lXF`_>6F)5c'A1&fW-R'ZW-S-Z\E+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci`i/.4chj
+>7:K06noS$;No?+EM4-Cht4AG[kZ2Gp":Y/1>7P@<?0*-[nZ`6rQl];F<lXC2[X!Ddd0(.4chj
+<i0a-u*^0FD)dEIS*C(;bpCk6Ub6pDe**#.4chj+>7:K06noS$;No?+EM4-Cht4AG[kZ2Gp":Y
/1>7P@<?0*-[nZ`6rQl];F<lXC2[WnAThm.@:U`7/12Va+t"oiC2dU'BHS[O8l%iR:K::[79jSG
A7T7p>ULsO-R'ZdAKWXO-OgCl$;No?+ED$FEb/ltF*(u6+EqOABHV2(G9Cd3D.Rbt$;No?+ED%+
A0<7BFD5Q4-T`_kE+*j%+=DV1:IJ,W<Dl1Q>]k.&Ci^sQ4""ZPDImisC`mkBBl%L*Bk;?5%15is
/g,1GB4N,4C2[W14"+i_@<?0*-[nZ`6rQl];F<lXC2[W1.6AnlDe'u3Dfp)1AKYK$A7[+t$;No?
+ED%+A0<77De*BiFsf@"C2dU'BHS[O8l%iR:K::[79jSGA7T7p-Rh,)C2[W*A7]pqCi=90ASuT;
%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`l@:C?XARfgrDf-[rF_tu(Ed8*$<+oue+DbIq+EM47G@b;-BQ&);FDi:<Ddd0!A9Da.
+EM%5BlJ08/g)9/:IH=HDfp)1AKYK$A7ZloBk)7!Df0!(Bk;?.G@bf++Dbt)A7]:(+<XX%+E_a:
+EV:.+A,Et+EMIDEarZ'A8,OqBl@ltEbT*++DkP&AKZ&:Eb-A8BOuH3@<,p%DIIBnA0<:8De*Bi
Ft"sb-u*[2.3N&:A0<:CFD5Q4.4u&:%15^GBPnqZ@;BFp%15g<Earc*1,(FB%16QQCLqO$A2uY8
B5M'kCbB49D%-h$%13OOC2[WsDKKo;1,V`k6<$NU9LV**+=BcW6m*m4.3M3"FE2;1F^oN-Df-p3
$;<`P5uglT:Js>:+>=p!+>=638oJB\+@Ih)6=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HVX
5sdq79he&O<)Yq@+=C-%BlbD5@:C?nDKKo;A9DBnF!,R<AKXT@6m-PrF*(u1+>"^VAThd/ARloq
DfQsm+?1u-GT]^hEarc*1,(FB-OgDV5se"<;GU1h4ZX]?%15cp6:Oa<<Du%A+>=63%15is/g*;?
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;
+B)i]FD5Z2+BN5bF<G:=+A,Et57Irl:IH=>F!+m68g&=rEb$;6FDl2.B4W2oDIal1ATVs,AThKu
+EMgLFCf;A%13OO<+ohc@UX=l@j#JrARQ]jAS>dqA0=K?6m-2b+EV:*F<F0uE,ol0Ea`g%Bl7Q+
BlbD+ATMr9G%kN3ARlolF!,CAB45[lH>.80+CQC&Des6$@ruF'DBNk0+EqaEA9/l8D]j"1Eb961
D'370FCB6+/g*r1B45[lH=^V0@rH1"ARfgrDf0V=De:,9DfTB0+D>2,AKYD(@V'Y'ATAo2@;TR:
+@Jdg<(Tk\5uL9C;]uSW.1HUn$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$;+)^+DGm>@3A/b@:WneDD!%S8TZ(h
F!,17F*(i,Ch7-"Bl5&8BOr;7IUQbtDf0W$B4YslEa`chC2[W3+C]A"DI[?&De:,6BOr;rF`MM6
DKI!n+EMgLFCf;3AoDKrATAo&Gp%3BAKYr#@r#LcAKYhuDII0hEZf:@+C]U=F`)M>E,]N/B-;;0
AKYMtF*)G:@Wcd,Df-\DBlG1CC2[W8H>.=I/g)99BOr<(AU&;>CggcqF*(u4+DG_-FD50"BmO?3
+EV:.+A,Et+EMgLFCf;A%14Nn$;No?+E_a:A0>?,+EV:2F!,:-@LWZbAT;j,Eb-@@Anc'mF!,"-
EZfI4F)*-4$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMl"@<-H48l%ha$<1\QF!,OGAT/c5FCB33F!,R<AKXT@
6m-PrF*(u1/e&.:%15is/g,4W@<-H4C2[W*/KePDART[lF!,=.F*(u6+D,>(AKY]!+Dtb#ATMp$
Ed8*$Eb065Bl[c--YI".ATD3q05>E9-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;Is]`G%De7Ch+Z)@:C?i
Bk)7!Df0!(Bk;>p$;+)^+DGm>Bl8!6@;KakA0?)1FD,T8F<G"0Gp$X3@ruF'DIIR"ATKIH+<XX%
+E_a:+A,Et+F.mJ+Dl7BF<G(6ART[l+EMI<AKYMt@ruF'DIIR"ATKIH+B3#gF!,:-@N]f7ATJu+
Dfp(CAU%X#E,9).A8,OqBl@ltEbT*++=M&7@OWiN-u<=$A7]p5/0H?_Dg<cS@;]Tu-ua!2H#R>4
.4u_c8l%htA8,OqBl@ltEbT*++CT;%+CfG'@<?'k+EqOABHVD1AKWC=ATqZ6+<k]7G9CF1@ruF'
DIIR2+s;&?EagXD%13OO6=jbIEb-A'Eb/[$Bl7Q+CggcqA8,OqBl@ltEbT*++ED%1Dg#\7@;^?5
E,oZ2EZf1,@N]2q@ruF'DIIR"ATKIH<+oue+EMX9E$/\&Anc-oF!+m6F`_>6BlnVCFD,*)+EqO9
C`m;0@<6!&A8,OqBl@ltEbT*++D,Y4D'3A#AmoguF<GC<@psInDf0VK+A$YtBlbD;F`&=9DBO%7
AKYl%G]Y'LFCfDD+:SYe$<KMk:.\2N3Zq!`+B1m#+B1d(:estT;HY,95sc\^8OHHK:JO2R8OZQ#
6VgHV5tOfo8PV`N;GBGV8P`)(=\i$?6U=U=+@/=i<E()/:EWD.<$4V3771'S73GQ#73G>o=B$D:
5sc\m<(0V,%14Nn$;tGPDg#\c@:DW=@ruF'DIIR"ATM3mC2[Wi4ZX]A+?CW!%17,oDfe,p+DPk(
FD)dEIW]^CE[M;'BkAt?8OccQ:*=(c/e&.1+EM4-Cht4AEb$:GF!*,U+<i0aEc5l</14\;De*Bm
@rucsCggd`ATf7F%144#F(f-$C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]'@:CE.%144#
F(f-$C`k*GA0<OH+>7^W+t"p^Df9_K-X:D)A7TCaFE:]/Dg<NS%144#F(f-$C`k*GA0<OH+>7^W
+t"p^Df9_K-X:D)A7TCaFE:]+CghU.ASr\>%144#F)>i<FDuAE+=Bik@N]c(D/aE6@<-W9.!KBC
.3N/8@ruF'DIIR"ATJu*Eaa$#A1%fnAScF!BkAt?8Oc]T8Q[*GD_;J++<XEG/g+SGDeW`)@VfIj
CNCV4DBNn,FD,_<Df-[kBl8'<+CT.u+AH9S+EMgLFCf<1%144#F(f-$C`k*GD'1ENAfrHPEc5l<
/13)cDe*Bm@rucFCggd`ATfF1$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*O@:CSn
$6UI4BOu!r+=D2H+>%VG+=A^\Df9_K-SK4QA7TCaFE9*WDg<]>$6UI4BOu!r+=D2H+>%VG+=A^\
Df9_K-SK4QA7TCaFE9*SCghU.ASrk)$6UI4D/XQ=E-67F-VRrX+EV13E,Tc*Ed8cUD.-p-Ch[d0
GUXbGBk)7!Df0!(Bk;?.ATD4#ARm.t$>"$pASGa/A8a(0$6UI4D/XQ=E-67F-Ui&aF(HJ&DL!@D
Eb0E.Dfp+DFCf<.DfT9,Gp$p3@N]2q@ruF'DIIR"ATJu2@;^3rCi"AL-OgDoDIb@/$7QDk%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%16!ED/XT/+CT/5+E2@8DfQt:@:C?iBk)7!Df0!(Bk;?<%14Nn$;No?+Cf5+
F(HJ&DL!@8Bk)7!Df0!(Bk;?./Keb?DJsQ,+D#S6DfTn.$8<SV+=&'c+E(d5-RT?1%15is/g,:S
Eb/ltF*(u6+CT/5+DbIq+Co1rFD5Z2@<-'nF!*%WBkM=%Eb-A)EcQ)=Et&I1+>=o`+>Y-\AS5O#
4s2pJ-Z!4#A7]p,CggcqFDlFIE,8s.E+No7%13OO:-pQUEb0*+G%De,Bk)7!Df0!(Gp$X3Eb/a&
DfTQ'F!+n/A0>;sC`m5+DKKH-FE8QV+DGJ+DfTD3ATDg0EcVZs;Is]`G%F?U@ROp?FD5Z2@<-'n
F!*.G$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBPDN1F*(u4+CfG'@<?(%+EV:.+=M&7@OWF.DIak<Cggd`
ATfLFA8,OqBl@ltEbT*+/e&.:%15is/g+Y?Df]J4@;^?5DfB9*+Co1rFD5Z2@<-'nEt&I4+E(d5
-RT?1%15is/g+YEART[l+=M&7@OWF.DIak4-u<=$A7]p5+Co1rFD5Z2@<-'nEt&IoATqZ--Z!4#
-OgE#ATqZ--Z!4#A7]p3%13OO:-pQUCh[s4+CTG%Bl%3eCh4`"Bk)7!Df0!(Bk;>p$?'Gt-RT?1
%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$;=l;+B)i]FD5Z2+AZrfDJ=!$+CQC&Ci=B/DJ()&Bk)7!Df0!(Bk;?<%16'JAKXT@6m,uX
D/E^!A0>K&EZf:>ASu4"B-:W#A0>AuDf]W1B-:`!@ruF'DIIR"ATJu.F!)lLA18X>EZccKE+No0
A8,OqBl@ltEd9)d+A,Et+Cf>,D..<mF!+n3AKZ&-DfTqB@;]TuARTY*+EVNEFEqh:/e&-s$7Kh'
.3N,/DBNk:ASrW$Bk)7!Df0!(Bk;?.;FNl>=&MUh73H#VA0=c=5t"LD9N`tj6$"/oDfm1>BkM+$
+D#e:ARfg);FNl>:JOSd+Co1rFD5Z2@<-'nF!+t$DJjB7+C\n)@q]:gB4YTr@X0(g:IH=8Df'?"
DIdf@%14Nn$;No?+E)41DBNt2@:V$8EbTW,%17#a+=Cu6@Us%n-OgCl$;No?+E)41DBNt2@:V$0
DJXS-$8N`BA0<79@:CSn$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi"Df'?"DIal1ATW'8DBNG-A7Zlm
@<6-mEt&IBCht4d:IH=8Df'?"DIdf2Eb0?8Ec*"/Dg5i(+Dbb5F<GU8F*2;@F"SS7BOr;uBl\9:
+DGq/D'3P6+CQC5ATW'8DBNG-A7[eE-o!.nB5_^!+=Jom+C\bi/g)97ASkjiDJ=!$+DGq/D0$h.
Eb-A1ATMp$B4Z-,@;]U,+E_aJ@;Kb*/0JMEEc5t@Eb0&qFCeu*Bl7O$Ec#6,Bl@lA+<X9P6m,uX
D/E^!A9/l4ATDC$Ebuq1G][M7F(of/+CT;'F_t]-F<G(,ARfLiDJ(RE+A$/fH#IgJ@WH$gCER%.
8l%ht@rH4$@;]TuE,9)oF(HJ*D..-p+Dk[4-t6V#ATDNr3B9?;D..-p/n8g:.3N&:A0>u*Cht52
AKZ21@<<W;Dfm15Bk/h*$7QDk:-pQUF)Po,+D#S6Df0-)F`S[DE+No0@rH4$@;]Us%17#a+=CkG
@;R,q+Dkh6F(oN)+Co1rFD5Z2@<-W@%13OO:-pQU@UWdiFEqh:Et&IpA0<lA$4R>;67sBi@:UL$
@;]k%%17#a+>Y,r,U[&>D^Pu$%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+AZlkBl7K)8l%htA8bt#D.RU,@<?4%
D@HqF:IH==@<3Q&G][M7F(of/+=M2>Agnj5De!p,ASuTuFD5Z2/g*b^6m-#Y@s)X"DKK</Bl@l3
@ps6t@V$Zj@q0(kF(Jl)GA2/4+EV:.+=LuCA8#OjE%)oQATD64%13OO-u*[2BOu"!.3N\N@<ZU1
+CQBh6q/;>ART+\EZfI4F)*BN8l%htF`V+:8ge[&@rH6sBkMR/ARlo[6q/;>ART+\EZf:<+BN8p
A8c[5+CT.u+A?KeFa,$MH#n(=D0$h.DIal3BOr;1DfB9*+s:r?ASc0*@rH4$@;]TuDf-[l@:O@2
%14Nn$;No?+Co2-E,8s.+A,Et+CoD#F_t]-FCB9*Df-!kC2[WrASc<.0F\?u$;No?+Dbt+@<?4%
DBNk0+DkP$DBMPI6m,;o7Nc5[@s)X"DKH<pC2dU'BHS[O@:WneDKB&qASu("@;K1`De*Bs@s)X"
DKK-&A7f@j@j_]m%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@KpRFD5Z2@<-W9E+*j%Et&IUBOr<)E+No0A8,Oq
Bl@ltEbT*++E(j78l%htA7]@eDIjr!+EM+&Earc*@;]TuAn?'oBHV8&FD*9L<+ohc-tI%&.3L$L
Bk)7!Df0!(Gp$g3ASuU(Anba`FD5Z2.3NeFEag/-BleB;+EV:.+E1b2BJ'`$.1HVZ67sC%BQ&);
E+*j%%16W[A0<Q8$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBOr;sH!t5t@j#B%Ebuq;AfrL4Bk/Y8Eb0?8
Ec,q@A7]jkBl%i5@:F.tF<G[=AKYK$DKKH-FE8RCAftYn@qZuqBk)7!Df0!(Gp%$C+EV:.+E1b2
BJ'`$.1HVZ67sBkBk)7!Df0!(Gp$X/FCAm"Et&I1+Co1s+>=63%15is/g+\=A0?=D0H_J\:-pQU
BOPdhGp$g3Bl@ht$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'DBMkrD.Oi.@VTIaF<GLBBk;1(@<?4%D@HqPBOr;Y
:IH=HH#n(=D'3P6+CQC&Df'H0ATVK+@;]TuA7]jkBl%?k+D#e+D/a<&+E(j7DdmHm@rri3EbT*&
FCeu*E,ol0Ea`g%Bl7Q+Bl5%c/g)99BOr<-H#n(=D'3>,DKBN5FE8RCAftM)DKTf*ATAo3AftT"
@<6L$F!)lMEb/isG\(D.GA2/4+=CT4De(4E/g)9<BOu'(FD,5.F*VhKASiQ+Ddd0t+CQC9@<-'n
FEo!IAfu#$C1UmsF!+n3AKYK'ART[lA1euI<+ohc@UX=l@j#3#@q]RuARfh)Eb-A-F!+m6D..-r
+Co1rFD5Z2@<-W9DdmHm@rri8BOQ!*@rH7,@;0V#+D,P7EZfFG@W,^jARfh'/g*Sk@q[!'E+No0
A8,OqBl@ltEd8dAF!+n-F)N10F)u80Bjl*pA0?)1FD)e*+Co2,ARfh#Ed8dG@VTIaF=n\(Bl[cp
FDl2F+E(_(ARfh'+CT;%+CfG'@<?'k+CT.u+Co&)FE2;FARlolF!,L7EHPu9ARmD&$7QDk:-pQU
DdmHm@ruc7@V'1dDJj0+B-;D4FD)dE@;9^k-Qli<AKZ).AKXT@6m,uU@<6L$F"Rn/@rH7$+>=63
%15is/g*b^6m,uXDKBN5FE8RCAfu//GT^I(F(o,,DdmHm@ruc7@;]Tu@<2kb:-pQUD..=-+Co2,
ARfh#Ed8dG@VTIaFE8R5F!,R<ATD?)@<,p%E+*j%+DGq/D0%<=$=e!lC`kGA$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'DBMnlAKYr7F<G+.@ruF'DIIR2+Cf>-@qBV$%16'JAKYT!EcZ=FA8,OqBl@ltEd8dGDBO%7
AKYr#FD)e2F!,OCARfF_Cb?hQ8TZ(hF!,R<AKYo/Cj@-GA8,OqBl@ltEd8dLBOQ!*@ps6t@V$[!
De*QoBk:ft@X0(g:IH=8Df'?"DIdf@+<X!^@psM$AKYi.F*&O8Bk)7!Df0!(Gp$sBA8,Xi@psIn
Df0V=@<,p%E-67MF!+$s@ps1i+EV:2F!,"-@ruF'DIIR2+EV:.+<kcIF<Vi<Bk)7!Df0!(GqKO5
%15[K-Z^DED/aE6FCB'/+EVNEF`(`$EcZ>2DIal3BOQ!*H#IgJ@ps6tF`V+:FD,5.@rH7,ASuU2
+E(j7FD,5.DffZ(EZen,@ruF'DIIR"ATJu4DBO%7AKYr#FD)e+F`\aODfm14@;]t$F<G(,@;]^h
+EV:.D'3P1+CT/5+Eq7>/e&.:%15is/g+b?EcZ=FE+*j%+Co1rFD5Z2@<-W9BlbD=BOr<*F`\a:
Bk)7!Df0!(Gmt*kBk/>?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[bEb/[$Bl7Q+DIn#7A8,OqBl@ltEbT*+
/e&.SAS,k$AKYi.A8,Y$Bl7Q+FD,5.@rH7,ASuU2+E(j7@;^?5A8,OqBl@ltEd8dDATT;@+CfG'
@<?''@3BH!G9A)ODg<NLA8,OqBl@ltEd8d9DIal,@;BEsBlkJ>BOr<*F`\a:Bk)7!Df0!(GqKO5
.1HVZ67sBjCi=B++E)41DBNJ(@ruF'DIIR"ATJ:f1E^UH+=ANG$4R>;67sBjEb/[$AKWCCDg<c@
$>sF!A0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqI@;BEs.!0BQ.3N%AE-67FA8,OqBl@ltEd98H
$7QDk:-pQUDfB9*+EVOI/0Jb;@Us%n+CT.u+DbIq+>"^XDg<I>F!,R<AKYr7F<G+.@ruF'DIIR2
%17#a+?MV3FDlFICggd`ATf24@:CSn$4R>;67sBpDKBr@AKZ)5Gp$gB+ED%%A1r.IBlmnq$=n*s
ATT%B;FNl>=&MUh74/NO%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+@g!bFD5W*+CT.u+E2IFFD5W*+EqaEA90@4
$;#+XFD,5.Anc:,F<GX9@ruF'DBMLnF(&cn+A,Et+DGm>@3Bc4Eb$;6FDl2.B4W2oDIal1ATVs,
AThKu+EMgLFCf;A+<XEtG9D*@+CT;%+ED%%A9f;>D]gHIF`]&T@;]Tu-td+5.3N\MD.Oi6DfTB0
/e&-s$:\`MF*&O7Eb/[$AKZ&4D.Oi6DfTB0+EVNEF*)>@AM+E!.1HVZ67sBjEb/[$AKZ&4D.Oi6
DfTB0%17,aDId[&4ZX]M0ea_)0I/A,0H_K567sBuF_t]1Bk&9'Dfoq,$?Tj(F?MZ--Zj$9F!,1<
+CQC7ATMr9De:,6BOr<)DIjr0F`M%9FD,B+B.",qAo)BoFE9T++>P&i+=/-b0JF_+0JEqCF*VV3
DesJX3ZrK)+=A:MDI[6#D/XH++EqOABHUnuASc'uB.",q@W-L&A3Dsr4<cL&BeCM`+>XH6Eaa'(
Df0!"F$2Q,0eb:(.j-,\-pB\+/g)l&GUXbA+>kh^$?^6#@rGmh4ZX^.3ZoelBPDN1BlbD7Dg*=H
DJ<U!A7[+t$>!XUBK\C!-8%J)+<VdL+<VdL+<XEG/g,7E@qg$-@:XOmEafIbAU&01Bk(k!4ZX]B
+?CW!%15is/g+_ME,95uBlkJ@ATD5h$@![D/g,EK$7QDk%17;tEb'5S3ZpLF-ZWX5A8c<-FCf]=
+D,G.@<?Q5F*VV3DesJ;@W-L&A0>o$FD5Z2@;L!-F`(o'De*E%ART(^+D#e:Ch[BnF=.M)%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%14M&F`]&TBlbD=BOr;Y:IH=8Df'?"DIal3BOQ!*F*)>@ATJu<DfTB0/e&-s
$<(AVAKYE!A0>H(@<6!&FD,5.GAhM4F"SRX<+0QR+EMI<AKZ)/D.Oi3D]iP.DK]`3@q?d.Dfp)A
ASbs$FD,*)+EV:.+EqaEA9/l,@<Q3)@V'+g+D#S%F(Jl)@V'.iEb-A4Ec5H!ARoLmB.aW#.1HUn
$;No?+ELt7AKZ28Eb'5#$?1-0+EqaEA9/1e%15is/g+_G@<6!&A7]@eDJ=3,Df0V*$>"6dF(HJ<
DfTB0%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k:2b>!Eb0?5Bk;I!+EV:.+EMXCEb/c(GAhM4F!+n/A0>Aq
ARfKuFD,*)+EV:.Gp$O9AKYr4DfB9.Cj@.DATMs3Eb/c6%14Nn$;No?+D58-+EqaEA9/1eB4Z0-
GAhM4Et&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l36uQRXD.RU,@<?4%DBLYf0b"IcDIjr/Aftr9+E1n6+E1n'
G%G_;BlbD>DIdZqF_t]-FCeu*@rGmh+Unbf$:o)Z+E(k6ASrW(@<Q3)H#IgJBOPEoFDi:6@:Njk
BQ\3'Eb/d&/0Je<H"(>-FD,T8F(&rsF"AGPAfto(DIml3De:,%De*E%GA2/4+DtV.Gp$N<@rH4$
ASuT4Bl5&7BkM+$/g*N"D/Ej%FE8R5Eb-A2Dfd+6DfQtEBl.g1+CT.u+D5D/Cj@ULASs+C<+Tl^
Bl7Q+@rH4$ASuU2+CT;%+CQC+@;Kas@<--+De:,)Df9//@rGmh/e&-s$;+)^+E2@>G%kJuF!+m6
DKTf*ATAo3Afu;+H#k*MD]iS/@s)X"DKI"FDfTB0/g+5/ASrW!+EqaEA0>T-+DG_8Ec5K2@qB0n
Blk_D+CQC*Df9//Bk1d`+EVNEF*)>@AKYD(F(fK4F<GL>AKYf'DIjr$ATM@%BlJ0.Df-\9Afu2/
AKZ28Eb$d3$7QDk:-pQUF*)>@AKZ&-DfTqBGAhM4+Co&)@rc:&FD5Z2Et&I1+?1K_F`\`REa`ir
Df$j`-ZWX5A8c<-Bl8$(B4Z*+FCAWpAL@oo%14d33$<0_F<DrB@:Nsu4""HUE,96"F!,:1Aoo/(
EbBN3ASuT4FDi:1EcPT6+DGq/D0%'6$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqKAftT%F`MP7+F.mJ+Ceht
+EhI1G9D0LF`JUGFDl22A0>DoF(96)E-,f4DK?qEBln#2-td+5.4u&:.1HVZ67sBnATT&9BQ%p5
+D#e:Cgh3iFD5Z2Et&I1+?1KVATT%BEa`irDf$j`-Y6^rBI=5r%15is/g*;?4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15gJ
Eb-A(ATV?pCh7-"A8bt#D.RU,@<?4%DBNFtDBND"+EMXCEb/c(@;]TuEb0?5Bk;I!A1f!(BPDN1
F*(u4+Dbt)A9/l%+ED%%Ch[s4Bk&8sG[YH.Ch4`-Afu;9Eb$;'De!p,ASuTuFD5Z2+DG_8D]j.8
AKYK*EcP`/F<GOFF<G+.@ruF'DIIR2+CT.u+EV:.DBNJ(F)Yr(H#k*PBln#2-tI%5E%*CK$4R=j
A8-+(.3N>G+CQBb:IH=JFD5Q*FEoJ]+A$YtBlbD=BOr<)DJXS@G%G]'+EV:*F<GU8FEMVAEt&Ib
+Cf(nEa`I"ATAo0BleA=.!K?9DBO"C@q0(kF(TQ2.3N>BF*(u%A0>f&+EV:.+E_aJ@;I&qDg5i(
+=M8?4*G%KF_*!2$7QDk:-pQUCi<`mF!)l@BOPdkATMs6.3N&:A0<:1BOPdkATMs6.3N/>@s)X"
DKK</Bl@l3Bl8$2+EV:.+CfP7Eb0-1+E2IF+Co1rFD5Z2@<-W&$?K]tBlJ/:-[oK7A8c@,>\@Vc
ATD3q>\\1f>\\1fCggdo>\mhXAU%X#E,9)>0JP1oC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@HqPBPDN1
F*(u4F!,"-F)Yr(H#k*MBOr<&Df021A8bt#D.RU,+Dbt)A7]9oBl5&8BOr<*Eb0E.Dfp+DF*(u4
/e&.:%15is/g,4KDg*=?Df021A8bt#D.RU,@<?4%D@Hq,+?:QTBle59-Y$guDJ*O%FE/`<$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMYlEb-A4F`__>DJ()#DIal&ATW$.DJ(R2$7Kk9F=A>@DIak<B4Z06+CT;%
+E;O<FCcS,Ch7j*@VfTu@;]Tu@ps6tF*)>@AKYQ%FD5c,+Dbt+@;KLr/g)99BOr<&De!3lATJu(
@;[2sAKYl!D.R6#DfQt<F_tT!Eb/c6%14Nn$;No?+ELt7AKZ).AKWC0C2[X"@;BF'+Dbt+@;KL.
@r,RpF!,17+<koGGp3\)-Xgb.A8PajALAU>F`\aPH9F;3DJWZgC2[X"@;BF]+DEGN1^sd$$;No?
+ED%8EbT*.AKZ).AKWC0C2[X"@;BF'+EqaEA9/l-DKKe>@;[28G^+H\+Dbt+@;KKa$7C(CGUFVH
ATT&@H4:2j$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3;e9BX@q]RoB-:f)EZfREEb'5#$;>/LAKYi.F*&OGFDl2.
B4W3,H#n(=D0$gl:IH=EEc6,8A7]g)Amo1`Ch\!*ATJu+DfQtAARTUhBPD?s+EV:.+Cf>-FCf?3
F!,C5+DGq=+Cno&@:EYdAM+E!%16'JAKYhuBl5&7ARTUhBHUf'D/E^!A0>T-+=Lc<CagJTA8,Oq
Bl@ltEd8dF@;TQuCh[s4F"&^N$7QDk:-pQUCh[s4+CT)&+EV:.+EqaEA9/l3DBO%7AKYr#FD)e+
AS5^pDJ=!$+EqOABHS[5FXIV*Ch[s4+FPjbA8Z3+-Y.?I%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k-tI43
.3N,/DBO"3@<,jk+D,P4+EqaEA90:EFCfN8F"AGHEc6)>F"AGTF_Pr/F!+n/A0>_t@rcL//g)99
BPDN1F*(u4+CfG'@<?(%+EMI<AKYW+Dfp#?+CT.u+EV:.DBNb0F*)IG@;Ka&FD,5.B6%p5E-!.?
DBO%7AKYr#FD)e=BOQ!*@V'1dDBO.;FD)dE8l%i&%14Nn$;No?+CfG'@<?''F)Po,+D5_5F`;C2
$>4Bu+=D5PEbTE(F!j$s@q]:gB4Z.+E[M;'B6%r6-Z!^2FCfN8-Tc3^?X[\fA8PajAR?Qo/i4"E
%15is/g+eIDfp#?+C\npBl7g&DJ()9Bln#2-Z!^2-OgD<+>G!LDJUFCCi<f2%13OO:-pQU4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?X
ARfgrDf-\!BOQ!*@<,p%FD,6,AKYT-DJj_B@<-"'D.RU,+Du==@V'S$57IrdGp%!CG9D0LFWb@+
G%De8Ec5Dq@Vg<4DJsW2@qB0nFD,*)+DkP)Gp#^T6m,uXD/E^!A9/l8@;BEsBl8$(B4Z*+@<-"'
D.RU,F"SRX8l%ht@<-"'D.RU,+Cf>#ATJu&Eb-A3AftPkF(o,mCi"A>FD,]+AKZ)?E+O)A+E(_(
ARfg)@rGmhF"AGPE-,f4DBNG-A7]g)@;]TuEHP]+BkD'jEcWiB$4R>ABOr<)@VTIaFE8Qs:IH=H
FDl22F!+n/A0>o(FE2),G%G_;@;Ka&BOQ'q+E(_(ARfg)@rGmhF"SRX<+ohcDIn'7+EV%$Ch4`"
Ble60@<lo:8l%htDdmHm@rri'De*F#%14Nn$;No?+A,Et+E(_(ARfg)@rGmhEt&I)4<cI%BeCMd
.3L/o+?MV3=&2^^+B1d.<$4\/:K:46;cQCg73G;j6W-]&6qKaF8P`)I;HY@V$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'D@HqKE-,f4DBNA*A0>l7@;KXiBk;<-@rGmhF!,O8Ch7*u+CT.u+Dl%-BkDW5DfBf4Df0VK
+<XWsAU,D,Eb-A%Cht5.DKKH&ATDiE+@^9i+Dl%;AKY])AoD^,@<?4%DBN@sDfp.E@<-"'D.RU,
+Cf>#ATJu7ART*l8l%i&F!,C=Ch[cu+CoD#F_t]-FCB9*Df.0:$4R>;Dg*=?Df9D6@<<W5Df'&.
D/XH++=Lc<CagK:Df'?"DIdf@%14Nn$;No?+=LlCDfp"M+E)4@Bl@l30d&%jD..NrBHV87AS,Y$
.3L2b@psFi+DkP/FCfK6%14j50d("EC`k*A-OgCl$;No?+=M)8@rcK=+E)4@Bl@l31*A.kDIIBn
+Cf>-FCAm$F!,OGEbTE(.3L2bDJpY7@:O=rF!,a>F:AR6+>P'MDJUFC@<*_)$4R>;67sBt@;BEs
@3BDq@rcK1@;]TuF(Jd#@qZunB45Ll%14p7E-67F-Xh%9B4rYS8lJ)T8PiAn@;9^k?TTW167sBt
Gp$X9+Du+>BPD?s+A*bn@:O=r-OgCl$8`k\+CoA++=CT<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l37riNj
E-!.1DIal2F_Pr/Et&IK:IH=EEc6,8A7]g)@3BW*D/a<&+Eq7>+EVNEB6%p5E$0@CEb'56@;]Tu
FCfN8F"SRX5p0f\Dfp"ABlbD*+Cf>+Ch7*uBl@l3De:+a+EqaEA90@G+@.,kF_Pr/+DGm>@3B&u
Ci!ZmFD5Z2+E(j78g&4eF*&OG@rc:&FE9&W+B`W*+CfG'@<?''@;]TuD/Ws!ApGM3Ec6)>F!+n/
A0>r9Blmp-+EqOABHVD1AKWC6Ec<HMG%G]'/e&.:%15is/g+YEART[l+CQC*Ec6)>+E(j7GAhM4
F!,[@FD)e7@;TRs+C\npBl7g&DJ()9Bln#2-Y$g;%16`gE$-NMATMs+Ec6)>-QkJnI4cXQDJUFC
@q[5!$4R>;67sBjEb/[$AKYD(FCfN8%14g4E-67F-YR(-Ci=N9Ebo864!ua*>9G:@8l%htFCfN8
F!+n3AKXSfF(96)E--.DFD,*)+ED%8F`M@B0ln]i-OgCl$;No?+CfG'@<?''@3BZ'F*&OGF_Pr/
+>"^RDffP5Ch74#+CT;'F_t]-F<G(3A7Z2W1E^=NE$-NMATMs7F_Pr/-QkJnI4cWs+CoA++=ANG
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqUDfm14@;[3(BleA=FD,5.@rH7,ASuU2+E(j7B6%p5E-!.?EZfFG
Blmp-+EqOABHS^9Ec<H:$7QDk:-pQUCh[s4+Cf>-FCf?3F!,C5+EV19FD#W4F`8I9Ec6)>%16`g
E$-NMATMs+Ec6)>-OgCl$;No?+Cf>-FCf?3F!,C5+EV19FE;S=FCd!GDJsW.+EM[>FCcS)De*E%
Ch74#+CT;'F_t]-F:AR5+D5_6+=D8BF*)JGBlmo6%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[l@;BRpB-:i-
Dfp#?+CT.u+EM[>FCfM&$;YPN+E(j7FD,5.D..-r+CSf(@;^0qB4Z-,De:,5FDl26DJ((a+Cf>#
AKY])+A,Et+EhfY+CQC3Cgh$q+EM%5BlJ/:BlbD=BOQ!*H#IgJ@ps6tD..-rFCAm$+CQBk8PVcL
73HbbEcYr5DBNk0+CQC:DfTA>+EV19F=\PIEc6)>+E)9CF*22=AKYE!A0>u-ASrW'ASu("@<?''
D..=-+A*bmDdd0!F(96)E--.DFD,*)+E_a:+Co1rFD5Z2@<-W9DdmHm@rucE+@KX[@:EYdAKYMp
F(o9)ATDi7@ps1i+EV:2F!)ZFDIjr6ATDj+Df-\9Afu2/AKZ)8F`_:L+q4kg$<1\M+D,P.Ci=N3
DJ()+DKBB0FE8R5+EM77B5D-%GAhM4+DG^9.!0BQ.3N8DDfp#?+CT.u+EV:.DBNS'DImisFCfM9
F(96)E--.R%14Nn$;No?+DbV$F<G=@F*),.Gp%3;@VfTuG%G]'%16odF`VXf3[Z$t-6tVp3[e8V
HnHUM0n(6Z/g<"s0L.$l+D!/J>:D!1$4R>;67sC%FDl22+DG^9E-67FA8,OqBl@ltEd8*$E-67F
-Z!O?F*&c=$4R>;67sBpDKBB0F<G:8+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$7L<T+>P'[
AThu7-RU>c@:Wn]Ec<?h+?V#fC3=T>-OgCl$;No?+Dbt7CNXS=-urmBD^cfCDBN\4A1hh3Afu;3
FD)dFC2[WrASc<7%13OO:-pQUB4YslEaa'$+CT)&+E2IF+Co1rFD5Z2@<-W9B6%p5E-!-2$8<T>
Ci^pe+FPjb1*CUKG&J`U%13OO:-pQUBkAK0BOr<&AS-$,@<-"'D.RU,+DGm>ASc'kARlp*BOr<!
Ec6)>F!+n3AKYhuA7ZltDKKe>-u<g1A18XB@rc:&FE7lu:-pQUD/=8?4s58++>P'[AThu>-OgCl
$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Zs5]9OVBQ;e9H\Bl@l39jqOPDfZ?p<+0i`F"AGMBkq9&F`:l"FD5W*+D58'ATD4$ARlp)@rc:&
FE8uU@ps6t@V$['Bl.g*BkD'jA0?)1FD)dh:IH=B@:O=rF"SRX5p/cq6m->T@rcK1BlbD*DBNA.
@VKq)@<-W98g&1bEbTK7+EV:*F<G(%DBND"+D,2,@q]Fa+CT.u+D#e/@s)m)A0?)1FD)dFEc!6X
%14Nn$;No?+DkOsEc3(BBOQ!*B4YslEaa'$F!+n-C`m\>F<G+.@ruF'DIIR2+D5_5F`;C2$>OKi
D.-ppD`p-(-Vcu\+D58'ATD4$AKYDtC`m\>F<G+.@ruF'DIIR2+D5_5F`;CL/5/Ma-SQZ[Ci^pe
+FPjb1*CUKG&J`U-RU#a%13OO:-pQUF*)>@AKYhu@rcK1/KePAA7Zl=0d(RLCi"/88l%htFD,B0
+DGm>@3A/bF(96)E-)Nr1a$a[F<DrJ@;BFnF`_8:E-!Bg1,1k*De*]n@rcJs$4R>;67sBD4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\
@ruF'D@HqNF`))2DJ()#+A,Et+DkOsEc3(7F!+m6F(oK1Ch4`+@<?U&EZf:4+E)41DJ=!$+EV:.
+CT5.Ec5o;Bjl*p+Co1rFD5Z2@<-'nF!+n/A0?#9Bl7Q+-us/R+>"^VF`&==@:O=r/e&.:%15is
/g+b;FCSu,@;]TuAU%crF`_1;%17,m+=D#7CLqI-FD#W5F!hD(%15is/g+b;FCSu,@;]TuAU%cr
F`_1;F(oH%DKK]?+>"^[Bl%T.Df0B:+Co2-E,8s.+D#e:Ch[BnFEo!=De*E%Dfp/@F`\'":-pQU
0d(LR+=D#7CLqI-FD#W5F!hD(%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2%15g<@rcL/+CT;%+Du+>+ED%7FE2)*
FCeu*FDi9o+EM%5BlJ08/g)9>Dfm14@;[2rCiaM;F*)>@AKXNC9h[)\9OUn3==bRs9h[)\<(0ng
/0IYQ;G0DR=&(:h<E)FI+CT.u+@94173HY]EbTK7F!,17+A,Et+Co1rFD5Z2@<-'nF"SRX:Msuo
+A*bt@rc:&FE8R7@;[2sAKZ#9DBNV2G@br/E\7e..1HVZ67sC%FDl22+A?3CAQU''1,::$@;]Tu
85r;W+=K!$.3N_DG]\!9$8`lEF`\`RCghEsGUGR.1-6j9/hS8?@8pf?+Cf>#AKWTX/gh)8%14p7
E-67F-YRU=CaV;"1HQs,/hSb!85r;W+Cf>#AKWTX/gh)8%15is/g,4WDfTD3=A;I3@;]Tu@<,gk
FE1f1Gp$'T=B$Ck@X3',F"&^N$8`lEF`\`RG\q7E4'53N?X[\fA7%DG4EP.UF?Xe[BlbD2F!,:-
D.Oi7D/;<fFCfN84spdH%15is/g*J`<(.pDF!,UCBl8$(Ec?&1FCeu*@X3',F!+n/A0>AjDBO"B
DfTD3@VK^gEbT*++>"^RDfd+BARfXqD.RTqARloqDfQt:@<-!l+D,>(ATKI5$8`lEF`\`R6:jp"
4#/]UEb/Zi?X[\fA7$HoE+*j%+=DVHA7TUrF'N?hDImisCg:^nA6`kd@<6O%E\;'@Ag\#p%15is
/g+VKFCcS9BmO>5De:,/@:O=r%14p70f:(dATT%B6:jp"%13OO:-pQUD.-ppD]j.5G]Y'MH#R>9
+CT;%+Cf>-FCB'/F!,17+EV:.+DkP$DBMPI6m,uU@<6K!$;+5a;Fs\a?X[\fA7$l19L2WH=C5KO
De*3++@oI+9OD4CDe*3++BV?3?X[\fA7$l1<(0ng?X[\fA7$l16<R8V?X[\fA7$l19gMZM6r-lZ
?X[\fA7$l1<E)FI?X[\fA7#cQ%15is/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2+A?]^A8,po+Co1rFD5Z2@<-W9A9Da.
+EM%5BlJ/'$<1pdA7]UrDKBo?@<?''DffZ(EZdtM6m-)Q@<?X4ATJu<AKYl%ARlp)Df'&.GAhM4
F!,17+E)CC+Co1rFD5Z2@<-WG+<XWsAKYl%G]Y'LFCfD6Ci<`mF!)lI@:EbiD/_+AC3(gV%14Nn
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'D@HqHDdd0!CggcqA8,OqBl@ltEd8d<F_u(?F(96)E-*]A$7QDk:-pQU
Bl8!7Eb-A'DfTl0@rri4@<?/l$?'Gt4$"a2Dg<IA@:EbYFs(U0@OE:&+>Y-YA0<6I%13OO:-pQU
Ci<`m+CoV3E$043EbTK7%14d43\V[=C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*Zm@WO2=
@:EbiD/_+AC3(a3$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq@F_u(?F(96)E--.DA8`T.Dfd+CFDl22+EqaE
A0>o(An?!oDI[7!/g)99BOuH3D09oA+C\n)B4YslEaa'$A1e;u.1HVZ67sC'E+EC!AKZ28Eb$;5
AS,LoASu!hF!*%WF(fK9+D,>.F*&N^+Dk\2F(&]mEt&I6+F>^`0Hb"EDdmc74s58++ED%:D^QnA
$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk%15d;@N\T\@ruF'DBMGcDdm-k+ED%*ATD@"@qB]j$;+)^+D>2)+D,%lBl%L*Bk;?.AoD]4
@psCuH"h//+E)CE+EMX5FD55-DIIBn+CT.rCjC)9F!,C=+A*c#DfTB0+CT.u+EV19FE9&D$4R>A
BOr;7B5DKqF"&5?DIak<F`V,8.3NeFEaj)4@;]LiH$X$E@;]TuF*)>@AKYl!D.Oi1AS,LoASu!h
F"Rn/.1HVZ67sBhDII@,H=\4:@;TRs%16`ZF<DrAF*(i4-OgCl$;No?+Cf4rF)u&-Gp%!5D.Oi4
F(HJ.DBNCsF(HJ1De!3lAKZ28Eb#Ud0eje`Ci<d(+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k
=`8F*@ps6tF`:l"FCcS-Ci<ckC`mq?Eb$;5AS,LoASu!hF"Rn/.1HVZ67sB7+DGm>FD,5.GAhM4
+Cf>#AKWQIF*)>@ATJu,Ci<ckC`mb0An?!oDI[7!%14d3B5DKqF!)i@F*(i4-OgCl$;No?+?_kN
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ
;e9H\Bl@ku$7L%<ATK:CEb0?5Bk;I!F!,OGDfTE"+ED%*ATD@"@qB^6%14Nn$;No?+D5M/@UX'q
Eb/ioEb0,uATJu+DfQsKA92j$F=@Y+F`V,8+=C]@FCB8=%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-!k.!9TB
F"&5@ARfXqATJu;ATE&=,'@s<Ap%o6+EqL1DBNA(C`mq?Eb'56BOQ'q+EMXCEb/c(Eb/ioEb0,u
ATKI5$7QDk:-pQUBl8!7Eb-A8Dg<I>F!,R<AKYr7F<G+.@ruF'DIIR2%17#a+?MV3FDlFICggd`
ATf24@:CT,>9G^EDe't<-OgCl$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7L%<ATK:C@ps6tEb0?8Ec*":@;^?5
Eb/ioEb0,uAKYf'F*)IG@<<W1DI[61+B3#c+ELt.AKYr#FD)e<ARTUhBHV/'@q]:gBle,6BlbD>
F(Jl)AoD]4Eb0?5Bk;I%DJ()4AS,LoASu!hF"Rn/.1HVZ67sBnCi<ckC`mb0An?!oDI[7!+E(j7
GAhM4F!+q'B5)7$Bl7Q+GA2/4+=D"R%15is/g,:XATJuB/g+\BC`k*B-OgCl$;No?+D5M/@UX'q
Eb/ioEb0,uATJu4Afu;9Eb'56ASu$mDJ()9Bln#2-Z^XE$?^E$F!,l`+>=oo+CoA+-Z^XE$4R>;
67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
%15d;@N\T\@ruF'DBMnlAKZ,:ATJu:DJ=$,%15mMFD5Z2+>Y_pDe:+?F`V,8.3NYBFEMVAF!,R<
AKZ,:ATKGGDJ=$,+E(j7@3Bc4Eb$dF+B3#c+E_a:F"MNPBl@l3BlbD+@<6-m@;Kb*+CQC8DJ=*5
AKYf'F*&O5Cht59BOr<1DfTB0+E)-?FD,5.@ps1i+EVX8AKYo'+CQC:DfTA@%14Nn$;No?+E_a:
F!,UCBl@l3De:,6GAeUJDfTB0%14mG+E_a:F!*P*-Y$S$D/X?1F!,OHDK9H4ATMF)0II;:%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2+@g!\ATD4$Bl7Q+Ci<`m+EM%5BlJ08%15^'6m,uJDBNS'DImisFCcRe+Dbt)
A0>r'EbTK7F!,(8Df$V-Bk)7!Df0!(Gp$a?Dfp#?/g)99BOr<!ASu("@<?'k+EM%5BlJ08+CT;%
+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+EM%5BlJ/:F*1r&Bl[cpFDl2F/e&.:%15is
/g+e<DImisFCcS2Ddd0!F(96)E-)NrD/=89-ZaEJD/X?1-QjNS:-pQUF*2@RD/X?1+ED1;AKZ&*
F:AQd$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$>jU#+CT5.ASu%"+D58'ATD4$ARlp)@rc:&FE8RHD]j.8AKYK*
EcP`/F<G^IATB/>+EMX5EccGC/no'A+D,>(AKZ&4+EV:.Gp$U*DBND"+Dbt)A7]9oBl7HmE+Not
ASuU+Gp%$;+A,Et/e&-s$;PM]ANCrNCi^_?@rc:&FE8R5Eb-A%A7T7^+EVNE:fThU8OHj"?Qa9-
+Ad2iCh[BdC0r)qDfQtBBOr;rF`MM6DKI"DF(KAE%14Nn$;No?+Dbt)A0>MrDImisFCeu*F(96)
E-)NrCi<`m+=D5QDJa<1DC5l#%16TRCi+*/DK?pU0JPF-+AP6U+D,b4C`k,\.3KaADIal-ATo7F
0I\,]Df9N7+DG^91,(F?%13OO:-pQU4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`l@:C?XARfgrDf-[fASu("@<?4$B-;8*EbTK7F!,C=+Co&#
@;]Tb$;+)^+Ceht+CT)-D]i\(DImisFCcS'DIal+Ddd0!F(96)E--.DGA2/4Dfp.E@rc-hFD5W*
+Dbt)A0>r'EbTK7F"Rn/.1HVZ67sBsDdd0!@UX=l@j#i7@<?4)FD56++D5_5F`7csChFk<@WQX"
FE8f=$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$B4Z1*GUXbODdd0t+CT)&+EV:.+EqaEA9/l'@;KakA0>?,
+CQC*Bm+'*+EqaEA1e;u.1HVZ67sBsDdd0!@;Ka&GAhM4F!,@3ARlp*D]j(CDBL?<F*(i4.1HVs
ATVs;+=C]@FCB8=%13OO%15is/g+tK@:UKpDKKe>@<,gkFE1f1Gp$pA@ps1bEt&IO67sB.F*(i4
Ci<f2+D58-Ed/]SA92j$F=.M):-pQU-TO17+D58-Ed/]SA92j$F=.M)%15is/g*;?4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$;=l;+B)i]FD5Z2
+@9LHCM@[!+E_WG@;]TuEb0<6DfTQ0B-:`!@ruF'DIIR"ATJ:f8l%htBlbD-@<>pe@<6!&AoD]4
8g&=rEb'5B+EM%5BlJ08+CT.u+E)@8ATAo4Eb/`pDfp+DE,ol0Ea`f-FCf]=F"SRX9lG)p+Cno&
@:EYdAKZ&>F*(u1F!,.)G%De5ARTIt+D,P4+C\bhCM@[!+E_WG@;]TuEb0<6DfTQ0B-:_nFCAWe
F(KD8@;]Tu8l%htA8c%#+CT=6G@bT,/g)99BOr;7E+*6lA18XEATD6&@UWb^F`;CEF`8I3+Cno&
@:EYdAM+E!.1HVZ67sC%@<Q3)@3B#f@r$4++E(j7FD,5.@s)g4ASuT4E-67FA8,OqBl@ltEd8*$
E+*6lA0<7ADg<]>$4R>;67sBD4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%15d;@N\T\@ruF'D@Hq$E+*6lA18X2DfBE%F!,R<AKYK*EcP`/F<G+.
@ruF'DIIR2+D,>(ATJu9D]j.8AKYGj@r$4++EM[7A8-'q@ruX0Gp$O5A0>i3AS,Y$ATJu&Cht59
BOr;uBl%@%+EqOABHU_+F`(o5F_)\,G%G\:Bl7F$ARTXoDJ()$@:O(qE$0%@D.7's/e&.:%15is
/g+tEF*&ODF`\a:Bk)7!Df0!(Gp$R)@r$4++D,>(ATJ:f6:=CC4ZX^43dWJ%+@K$l<(LA';cI+2
8l%in@VR#.+AP6U+E2IF+Co2,ARfh#Ed8*$A8-',6:"7O?U@.P;Cj1F/no'4-QjNS+<VdL+<VdL
+AP6U+C\bhCNXS=Anc'mEt&Hc$;No?+?_kN4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@ku$7Kq+F*(qA+ED%7FDl22F!,R<AKYet
F*&O6@:O(qE$/V8+EM+1ARfgrDJ()$@:O(qE$/b,Ch7Z1GA2/4+EV:.+D>J%BOu7,+E2@4AncKB
%14Nn$;No?+ED%7FDl22+DbJ-F<G%$@r$4+%17,eF*(q8-Zj9P-OgCl$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
9jqgODJ()#+EM%5BlJ/:A9Da.%14M&@:O(`.3N,@ART[lF!+q+DIIR2+C\bhCNXT;/g)9>Dfm14
@;[2rCiaM;@UWb^F`8I6Bk)7!Df0!(Bk;?.@<3Q%F_u(?F(96)E--.R+<X'pD/^V=@rc:&FE8R5
Eb-A7Bl7R"AKXSfF(96)E--.DFD,*)+Ceht+C\n)F`V,)+EVNE@UWb^F`8lS@rH=3+CT.u+Dk\1
B4W2rBk)7!Df0!(Bk;?<%14Nn$;No?+CoV3E$/S*C`mh5AKZ28Eb'56Df-\>BOr<*@<?0*@<3Q"
+EM77B5D-%A9Da.+EM%5BlJ/H%172qH";&7E'66)F(fK9E+*g/?X[\fA7$Hr@;BEs-RT?1%15is
/g*;?4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;
$;=l;+B)i]FD5Z2%160MASrW7AKYf-@:UK/FDlG8F_u(H+DG_8D]iI2DIn#7A8,OqBl@ltEd8dG
@WQ+$G%De0Dg*=GBOr<*@<?0*BlbD,BOPdkARmD9<+ohcA8,OqBl@ltEbT*++D>2,AKYGnASrW-
ATDEpA1e;u.1HVZ67sBuATo8-Bk)7!Df0!(Gmt*uATqZ--ZEm1H#R>4-QlV91E^UH+=ANG$4R>;
67sC!E+Nnr$?'Gt-ZEm1H#R>4-OgCl$;No?+Dbt)A0<:BDg>l9D/^p5$8<Va0H`J#4*s"2FDlG8
F_u(,$4R>;67sBkBk)7!Df0!(Gp$g=AoD^,@<?4%D@Hq`Bk2Z80F\?u$;No?+?_kN4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]9OVBQ;e9H\Bl@l3
7VQaKC`mq?Eb'5#$<_:i+Du+A+D>2,AKZ&4D.Oi(A7]0lDe:,9BOQ!*8l%htBlbD*Cht5&@W-C2
/g+,3+DbUtEc*":DfTD3Eb/Zi+A,Et-Z^D@De!p,ASuTuFD5Z2+CT.u+EDUB+EV:.+E)@8ATAnc
:IH=A@:F:1+A$/fH#IgJBOQ'q+CT/5+E2@>@VfUmF"AGRF_,W9Bl@m1+E)9C@rH4'Cgh$qFE8RD
Ch7$rAKYQ$@;0O#D.OhuF<G%$CLqO$A2uY8B5M'kCbB49D%-g]$;,5MDBM8SCLqMq$=[FZATDNr
3B9?;D..-p/n8g:%15g<Earc*1,(FB%14Nn$;No?+Cf5+F(HJ&DL!@CE+No0A8,OqBl@ltEbT*+
%14m6De't<-OgCl$>OKiE,ol/Bl%?90ht%f.V`m4E,ol/Bl%?'F"Jsd8l%htA8,OqBl@ltEd8dH
Ec5Q(Ch54.$;No?%15is/g*Gt+D#e+D/a<&+A,Et+E2@>Anc'm+EM%5BlJ/H+B)]lAKZ).BlbD<
@rc:&F<G:8%15is/e&._67sC0@:WneDK@IDASu("@;IT3De(L1$;No?%15is/g,@PFD)e=BOr<(
@;TQuC2[X%Ec5Q(Ch555C3'gk:-pQB$;No?+B3#gF!,O6EbTK7+<YB>+<Y6?ARfk)ARlo+@:jUm
EZee,C`m8&@ruF'DIIR2+<YT3C1UmsF!,.)G%D*i:-pQU@V'+g+CfG'@<?'k/g*`-+<Y0&DBL'2
AKZ,:ARlo+FDi9EF(KG9F`8HGH#IhG+Co%q@<HC.+<X9P6k'Ju67sC)DfTW-DJ()'DK]`7Df0E'
DKIK?$;No?%15is/g+4];GKeY7lhb\D]iq9F<G+5F(KG9-W3B378uuM-Qm,8+Dl%;AKZ).@;[3+
DIjq58l%htFCB6++DGm+$;No?+CSc%Bm+&?+A$/fDf0B:+E)./+EV%5CER>4+CSc%Bm+&1;FOMQ
<)#e/F!,FBAThX&F<G"0DJsf7DJ'Cc:-pQU@;Ksq@:XX+DfB9*+<YN4F)tc&ATJu9BOQ!*Ao_I&
F_,H4Cj@.DATN!1F<G19Df$V/DfTK%FED57B+52C67sC&D]iP+Df]J4A8,OqBl@ltEbT*++E_XA
DBNM8Bln',B-9f!%15is/e&._67sBUDffP5FDi9E8g%YUG%GK.E+O'2/g*G&F(f]<A8c[0+EM+3
FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3
+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?+E_a:Ap%oB%15is/e&._67sBhF`_;8
E]P=8DeO#26nTTK@;BFp%15is/g+_B@;0O=+<Y-%CLqO$A2uY8B5M'kCbB49D%-g]$;No?+EM+9
+EqL5FCcS9E+*6f+E2@4F(KB8@<?4%DBNk8%15*=3]&Q6>9GX0$4R>;67sBtBl7X%F_r7?EbTE5
+E2@4@qg!uDf-\>D]j+7Dg*=LH$O[PD.I0"A79RkF!)lPAS!!!De*9hALS&q3?^F<0d'[C3"63(
$;No?+EM+9+DPn<+EqO;A8c[5+Cf>-F)Pl++EM7CAKWQI@<H[1D..O#@j#B%EZf14DKU1WD.-p-
BlA&%$:B#N?YWq23Zp.80H`,-%13OO:-pQUA8`T.Dfd+BATMF)+DGF1H#IgJ@<,p%Ecl8;Bl7Q+
D/XH++EV:*DBNk8AKXT@6m-2]F*(i.@q?)VA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1
Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o
@rGjn@<6K4-Y[=6A1%fn%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m
3[\TZD.Oi6DfTV9FCfN8-OgDX67sB^84?EF5tsp63Zoe`Df'&5%13OO:-pQU-u!F7A18X4EcQ)=
0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(
+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>
F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(%15is/g+S5A0>DoCh7^"+E(_(ARfh'+D,Y4
D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"BF_Pr/%16NV4ZX]A+?CW!%16f]/g,@LG[FloDe*2t
4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqEA1e;u
.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N&0A7oq%+F,)@
Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@/$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;ASu$2
%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.A7]RiEc<.H
+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HV,+<V+#:-pQUEb/ioEb0,uARlp-
DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.lGWe)11E\_$0F\A'AhG2X/pClO?X[\fA7$HA-YdR1
B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\fA7$Hl
DETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%14LlCi"-'Aof(;I4cXTDCH\[/g+eE%14Nn
$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$0F\A'
AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$
/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'F`V,)
@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImisFCcS)F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-@:UL%
@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%F(HsH
C1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk%15is/g,7SE$-QJF`\a:Bk)7!Df0!(Gpsk[
DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u1+%$Q
G&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#+Du+>
+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+
Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!
+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC
+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"
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
:L\'M@rrh]Bk)7!Df0!(Gpa%.<^fnb8P`)E3[ZU63A*<P2(&h?7Sc]G78c90-YI".ATD3q05>E9
-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImis
CaTZ!7S-9B;a!/a0H`D!0F\A(De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\
DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%
Ec5Q(Ch7'aCG'=9Et&IkDe*<cCG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.
F"VQZF:ARlDe*Bs@kV\-@r?4,ATKJGG]XB%C2[WnDdtG>A7f@j@kVS8A8l'k/p)>[%16igA7^"-
F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKiCggdo05>E9Bl8$5D_>a=F:ARl
De*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S0eR0TEt&IkDe*Zm@WO2=@:Ebi
D/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%%14Nn$:I<]
6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bqEc5T2@;Tjq
DJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@FCh[d&ARlooBk)7!Df0!(Gp$X+
FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6tB.P09De!p,ASuU(DJ()#DIal3
ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M
%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!D/Ej%A7]9oFD,*)+F.mJ%16fe
F*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et6r-0M9gqfV+:SZlDKBo.Ci"/8
A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO7W3;iD/XH++DG_*DfT]'FD5Z2
+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8Ecl7BFD,5.Cggcq,"bX!+DbIq
+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(%172jAKXKSDImisC`mP&@N]/h
FCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A.8laDBO%7AKXZT@N]N!DKU"C
F`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-o
@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXH
B.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9+<V+#.1HW$
@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc
8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE3A`)m$:[fb6q(!:3[\QODImisCbKOA
A7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>
+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8E+EPi$7QDk;FO8J5uU38
3Zodt%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjH
BPCsi+CoD#F_t]-FE8RHBOr;Y:IH=HH#n(=D(Z8)%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+
BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3mFDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<
%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;
<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:
%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQUD..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E
3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!@q@"s$<BSn;b9b[4ZXrE/ibOE3Ai/n$:[fb6q(!:
3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?
7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16ig
A1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I
;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3
@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkF
Bl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF
@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$
Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)
E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*
+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR
6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7
FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)
F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;
DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&
DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9C
F)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^
E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;
FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT
@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9
Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=
+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"
.1HU                                                                      ~>
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
