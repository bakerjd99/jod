NB. sha256:2bbdd9ae1f0fa25375104a7cad947b51b2017b6cecb9b1957537cea545fb731c
NB. JOD dictionary dump: 05 Feb 2024 10:17:04
NB. Generated with JOD version; 1.1.0; 35; 05 Feb 2024 10:12:48
NB. J version: j9.5.2/j64avx2/windows/commercial/www.jsoftware.com/2024-02-02T18:42:49/clang-16-0-6/SLEEF=1
NB. JOD put dictionary path: /joddev/jod/utils
NB.
NB. Names & DidNums on current path
NB. +------+---------------------------------------+
NB. |joddev|335777767984232392329146217471784198516|
NB. +------+---------------------------------------+

9!:41 [ 1 NB.{*JOD*}
cocurrent 'base' NB.{*JOD*}
sonl_z_=: 'sonl__MK__JODobj i.4' NB.{*JOD*}
showpass_z_=:] [ 1!:2&2 NB.{*JOD*}
SOLOCALE_z_=:":>SO__JODobj NB.{*JOD*}
soput_z_=:SOLOCALE&put NB.{*JOD*}
soclear_z_=: '0 0 $ clearso__MK__JODobj 0' NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}


BYTESIZE=:15

CNMFDLOG=:10

CNMFPARMS=:7

CNMFTAB=:2

CREATION=:13

DPATH=:0 4$00

DPLIMIT=:64

DUMPMSG5=:'NB. JOD put dictionary path: '

ERR0161=:'cannot prefix hash ->'

ERR031=:'backup hash failure ->'

ERR213=:'cannot write backup hash file ->'

HASH=:17

HASHFSX=:'jhashes.txt'

HASHHDR=:'--sha256--'

IPYNB=:32

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.1.0';36;'05 Feb 2024 10:17:03'

JODVMD=:'1.1.0';36;'05 Feb 2024 10:17:03'

LASTPUT=:14

LEAN=:33

NAMECLASS=:12

OK010=:'close and reopen to activate - paths forced to ->'

ZIG=:34

jodliterateVMD=:'1.0.1';12;'17 Jan 2024 11:26:34 MT'

jodliterate_hashdateurl=:<;._1 '|68a0738c766e2b831526e807a4b956c1741724c7727f1e609daf797c8f0c5e75|17 Jan 2024 11:26:34 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


backnum=:3 : 0

NB.*backnum v-- updates backup pack count and backup/restoration timestamp.
NB.
NB. monad:  backnum iaNxtBack
NB.
NB.   backnum 11 NB. typical call

NB. HARDCODE: pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (y) 0}nums else. nums=. 0 , 6!:0'' end.
((0{nums) , 6!:0'') jreplace WF;1
<.y NB. integer result
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
NB.
NB.   14 bnl '.'  NB. display pack/backup dates
NB.   17 bnl '.'  NB. check backup files against hashes

WORD bnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (bnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT

NB. backup dates and hash checks first
if. spc=.(0{x) e. INPUT,HASH
    spc *. (,NDOT__ST)-:alltrim y do. x bnlsearch__ST y return. end.

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
if. badrc uv=. checkback DL do. uv return. else. bn=. rv uv end.

NB. search name pattern and requested backup
'pat rbk'=. splitbname y

NB. use most recent backup if none specified
if.     isempty rbk           do. rbk=. {.bn
elseif. 0 e. rbk e. DIGITS    do. jderr ERR010 return. 
elseif. -.(rbk=. ".rbk) e. bn do. jderr ERR103 return. 
end.

NB. nonempty patterns must be valid J names without embedded locales
if. #uv=. pat -. ' ' do.
  if. badrc uv=. checknames pat do. uv return. end. 
end.

bdot=. (,NDOT)-:alltrim y 

if. bdot *. INPUT={.x do.

  NB. show pack/backup dates
  ok <DL backupdates bn

elseif. bdot *. HASH={.x do.

  NB. check all backup file hashes
  hashbchk ''

elseif. bdot do.

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
NB. 19aug27 load task addon first for J 9.01

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
NB. load task addon before executing any JOD start up code - changed for J 9.01
hc=.head,'load ''task''',LF,'(9!:41) 0',LF

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

NB. prefix built script with SHA256 hash comment
s=. toJ s 
s=. ('NB. sha256:',sha256 s),LF,s

NB. test hash match
assert. (':' afterstr LF beforestr s) -: sha256 LF afterstr s

NB. save compressed load scripts
smoutput 'output file locations:'
s write showpass JODADDONFILE
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
NB. 23mar19 add SHA256 hash to generated script

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

NB. prefix built script with SHA256 hash comment
s=. toJ s 
s=. ('NB. sha256:',sha256 s),LF,s

NB. test hash match
assert. (':' afterstr LF beforestr s) -: sha256 LF afterstr s

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

chkhashdmp=:3 : 0

NB.*chkhashdmp v-- checks dump script hash against contents.
NB.
NB. monad:  pa =. chkhashdmp clFile
NB.
NB.   chkhashdmp_ajod_ '~addons/general/jodsource/joddev.ijs'

NB. j profile !(*)=. jpath
ijs=. (read jpath y)-.CR
(':'&afterstr LF&beforestr ijs)-:sha256 LF&afterstr ijs
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

    NB. cannot change dictionary parameters for older dictionaries
    NB. that are not fully binary compatible with J 9.04+
    if. badrc msgbin=. binverchk DL do. msgbin return. end.

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

    NB. Modify path settings in dictionary files ignoring any
    NB. READONLY settings. The primary use is resetting paths
    NB. in READONLY dictionaries that have been moved. NOTE: this
    NB. is the only option that does not respect read/write settings
    NB. it may also fail if the target files are locked down by the OS
    if. 'FORCEMASTERPATH'-:y do.
      if. badjr dat=. jread JMASTER;CNMFTAB    do. jderr ERR088 return. end.
      if. badjr dpt=. jread WF__DL;CNPARMS__ST do. jderr ERR088 return. end.
      NB. master file dictionary path HARDCODE 2
      NB. search must succeed as this dictionary is open
      mastpath=. ;2 { (>dat) {"1~ (0{>dat) i. <DNAME__DL
      NB. replace dictionary path prefixes with master path
      NB. HARDCODE _2 exploits syntax of JOD paths 
      dicpaths=. (<mastpath) ,&.> }.@;@(_2&{.)&.> <;.1&.> (>dpt) {~ PARMDIRS
      dpt=. <dicpaths (PARMDIRS)} >dpt
      if. badreps dpt jreplace WF__DL;CNPARMS__ST  do. jderr ERR017 return.
      else.
        ok DNAME__DL;OK010;mastpath return.
      end.
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

NB. note path of first (put) dictionary
head=. head,LF,DUMPMSG5 , ;{: 1 { >1{did~ 0

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

fopix=:1: i.~ [ +/@:e.&> [: < [: < ]

fullmonty=:[: ".&.> ([: < [) ,&.> [: locsfx ]

globs=:3 : 0

NB.*globs v-- analyze, report and store global names
NB.
NB. monad:  globs clName
NB.
NB.   globs 'word'    NB. list globals in locale word
NB.
NB. dyad:   iaCode globs clName
NB.
NB.   NB. stores global references of word in dictionary
NB.   0 globs 'word'
NB.
NB.   1 globs 'test'  NB. list globals in test

0 globals y
:
if. (,x)-:,REFERENCE do. 1 globals y
elseif. badcl y do. jderr ERR002 NB. errmsg: invalid name(s)
elseif.do.
  select. x
  case. WORD do.
    if. badrc uv=. checkput__ST 0  do. uv return. else. DL=. 1 { uv end.
    if. badrc uvbin=. binverchk DL do. uvbin return. end.
    if. badrc y=. checknames__ST y do. y return. else. y=. ,>}.y end.
    if. badrc uv=. (WORD;<DL) inputdict__ST <y  do. uv return. end.
    if. badrc uv=. WORD getobjects__ST y do. uv return. else. uv=. ,1 {:: uv end.
    if. 0=>1{uv do. ok '<',y,'>',OK002 return. end.
    if. badrc uv=. 0 namecats__MK ];._2 (>2{uv),LF do. uv return. end.
    (y;<DL) putwordxrs__ST }.uv
  case. TEST do.
    if. badrc uv=. TEST get y do. uv return. else. uv=. ,1 {:: uv end.
    NB. return references in stored test text
    0 namecats__MK ];._2 (>1{uv),LF
  case.do. jderr ERR001  NB. errmsg: invalid option(s)
  end.
end.
)

hashback=:4 : 0

NB.*hashback v-- writes a text sidecar file of backup hashes.
NB.
NB. dyad:  blclDcfiles hashback blcl

bckfiles=. x [ target=. 2 }. y [ bckpath=. ;1{y [ pfn=. ;0{y

NB. backup hashes NIMP: check for sha256 '' null hash - indicates failure
hashes=. ctl ;"1 (' ' ,&.> bckfiles) ,.~ sha256@(read :: ''"_)&.> target

NB. time and j version - object nouns !(*)=. DNAME DIDNUM
head=. HASHHDR,' ' [ dictid=. ' ',DNAME,' ',":DIDNUM 
hashes=. (ctl (head,(tstamp''),dictid) ,: head , 9!:14''),LF,hashes

NB. write hashes file 
sidecar=. bckpath,(":pfn),HASHFSX 
if. _1 -: hashes (write :: _1:) sidecar do. (jderr ERR213),<sidecar else. OK end.
)

hashbchk=:3 : 0

NB.*hashbchk v-- checks hashes of backup files.
NB.
NB. monad:  hashbchk iaBacknum|zl
NB.
NB.   hashbchk ''  NB. check all backups
NB.   hashbchk 42  NB. check backup 42

NB. put dictionary object
DL=. {:0{DPATH

NB. ordered list of backup numbers
if. badrc bnums=. checkback DL do. bnums return. 
else. 
  bnums=. >1{bnums [ bpath=. BAK__DL
end.

if. badil ,y do.
  NB. checks all backup files in backup directory 
  chktab=. (<bpath) hashrep&> <"0 bnums
  ok <chktab ,~ (<''),(<'(n)') ,&.> JDFILES
else.
  NB. tests a single dictionary backup
  if. bnums e.~ pfn=. 0{,y do. ok <bpath hashrep pfn
  else. (jderr ERR106),<":pfn
  end.
end.
)

hashrep=:4 : 0

NB.*hashrep v-- backup hash report.
NB.
NB. dyad:  bl =. clPath hashrep iaPfn

if. fex <jhashes=. x,(":y),HASHFSX do.
  NB. (n)jhashes.txt file exists - check hashes
  txt=. (read jhashes)-.CR
  txt=. <;._2 txt,(LF={:txt)}.LF
  NB. drop header lines
  txt=. txt #~ -. +./@(HASHHDR&E.)&> txt
  NB. split out hashes and files
  txt=. <;._1&> ' ' ,&.> txt
  NB. to pass the backup files must exist and the hashes must match
  filesok=. fex (<x) ,&.> 1 {"1 txt
  NB. compare hashes
  hashcmp=.(0 {"1 txt) -:&> sha256@(read :: ''"_)&.> (<x) ,&.> 1 {"1 txt
  NB. if any backup file is missing all fail
  y;<"0 filesok *. hashcmp
else.
  NB. (n)jhashes.txt missing - null result
  y;(#JDFILES)#<''
end.
)

htclip=:[ (] }.~ [: >: ] i. [) ] }.~ [: - [: >: [ i.~ [: |. ]

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

NB. allow older system to run but nag the user to upgrade
if. jvn < 801 do.
  0 0 $ (1!:2&2) 'WARNING: JOD works best with current J 8.x-9.x systems - upgrade!'
end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  NB. J's before 6.02 are beyond the pale
  msg=. 'JOD requires J 8.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 8.x-9.x and then reinstall JOD.'
  return.
end.

nc=. (4!:0)@<
ex=. (4!:55)@<

NB. spot check of J environment - we need core J utilities
NB. if the following are not present JOD will not work
if. _1 e. (4!:0);:'load conew coclass coerase coinsert cocurrent copath jpath UNAME IFWIN IFUNIX' do.
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

jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. NOTE: the format of  the string returned  by 9!14 has changed
NB. without warning over  the years. The latest change (feb 2023)
NB. has  been   to  a  (version.major.minor)  layout.  This  verb
NB. computes a floating version number.
NB.
NB. monad:  fa =. jvn uuIgnore
NB. dyad: fa =. cl jvn uuIgnore
NB.
NB.   v0=. 'j9.4.0-beta13/j64avx512/windows/commercial/www.jsoftware.com/2023-02-23T08:08:24/clang-15-0-7/SLEEF=1'
NB.   v1=. 'j903/j64avx2/windows/release-a/commercial/www.jsoftware.com/2021-12-16T15:15:09/clang-13-0-0/SLEEF=1'
NB.   v2=. 'j10.12.53/jwhatever'
NB.   v3=. 'j8.05/oldsys'
NB.
NB.   v0 jvn_ajod_ 0
NB.   v1 jvn_ajod_ 0
NB.   v2 jvn_ajod_ 0
NB.   v3 jvn_ajod_ 0

(9!:14 '') jvn y
:
NB. for empty version strings return
NB. 0 we don't know the version
if. 0=#x do. 0
else.
  NB. extract J version from (9!;14) string
  ver=. (x i. '/') {. x ,'0/'
  if. '.' e. ver=. (ver e. '0123456789.-/')#ver do.
    NB. version.major.minor layouts
    ver=. ver {."0 1~ ({. , <./@}.) ver i. '.-/'
    (0 ". 0{ver) + 0 ". '0.',((] }.~ (i.&'.')) 1{ver)-.'.'
  else.
    NB. version layouts before j9.4
    100 %~ , 0 ". (ver i. '/') {. ver
  end.
end.
)

makedump=:3 : 0

NB.*makedump  v-- dumps the current path as a J  script file. The
NB. dump script can be run back  into  JOD  to rebuild  a  single
NB. dictionary that contains all objects on the current path. The
NB. dump script is a simple ASCII file  that is intended for long
NB. term storage of J  words in a form that is immune to  changes
NB. in binary storage formats.
NB.
NB. monad:  makedump uuIgnore

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. create dump file in put dump directory !(*)=. DL
DL=.{:{.DPATH__ST

NB. dumpfactor is set from the put dictionary
df=. DUMPFACTOR__DL

NB. default dump file name is the put dictionary name
if. isempty y   do. dumpfile=. DMP__DL,DNAME__DL,IJS
elseif. badcl y do. jderr ERR0158 return. NB. error msg: invalid dump file
elseif.do. dumpfile=. y
end.

NB. HARDCODE: are we retaining object age?
if. 0=nc<'RETAINAGE__DL' do. rag=. 1 -: RETAINAGE__DL  else. rag=. 0 end. 

NB. HARDCODE: are we prefixing dump hashes?
if. 0=nc<'HASHDUMP__DL' do. hdm=. 1 -: HASHDUMP__DL  else. hdm=. 0 end.

NB. standardize path character
dumpfile=. jpathsep dumpfile

if.     badrc uv=. dumpheader dumpfile        do. uv
elseif. badrc uv=. df dumpwords dumpfile      do. uv
elseif. badrc uv=. (df,TEST) dumptm dumpfile  do. uv
elseif. badrc uv=. (df,MACRO) dumptm dumpfile do. uv
elseif. badrc uv=. (df,GROUP) dumpgs dumpfile do. uv
elseif. badrc uv=. (df,SUITE) dumpgs dumpfile do. uv
elseif. badrc uv=. dumpdictdoc dumpfile       do. uv
elseif. badrc uv=. rag dumpntstamps dumpfile  do. uv
elseif. badrc uv=. dumptrailer dumpfile       do. uv
elseif.do.
  if. hdm do. prefixdumphash dumpfile else. (ok OK0151),<dumpfile end.
end.
)

nextbaknum=:4 : 0

NB.*nextbaknum v-- next backup number with ordered list of backup numbers.
NB.
NB. monad:  il =. baObj nextbaknum uuIgnore
NB.
NB.   DL nextbaknum 0

DL=. x NB. put dictionary directory object

NB. next backup number HARDCODE: pack counter is in component 1 errmsg: jfile read failure
if. badjr nums=.>jread WF__DL;1 do. jderr ERR088__ST  
else. 
  NB. new dicts without backups do not have counts and date
  if. #nums do. pckcnt=. >:0{nums else. pckcnt=. 0 end.
  ok <.pckcnt,bnums__ST BAK__DL 
end.
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

  NB. return the currently registered dictionaries as a sorted (regd) script
  if. 0 e. $mdt=. >mdt do. 
    ok 'NB. No current JOD registrations: ',tstamp ''
  else.
    mdt=. quote&.> 0 2{mdt {"1~ /: 0{mdt
    mdt=. ctl ;"1 (<'regd ') ,"1 |: 1 0 2{ (<';'),mdt

    NB. prefix command to close and unregister all current dictionaries
    mdt=. 'NB. require ''general/jod''',LF,'0 0$3 regd&> }. od'''' [ 3 od ''''',LF,mdt

    NB. add JOD/j versions - useful when dealing with binary incompatibilities
    head=. 'NB. JOD registrations: ',tstamp ''
    head=. head,LF,DUMPMSG3__MK , ;(<'; ') ,&.> ":&.>JODVMD 
    head=. head,LF,DUMPMSG4__MK , ": , 9!:14 '' 
    ok head,LF,jpathsep mdt
  end.
  
case.do. jderr ERR001  NB. errmsg: invalid option(s)
end.
)

packd=:3 : 0

NB.*packd  v-- backs up and recovers wasted  space in  dictionary
NB. files.   Backups  are  stored  in  the   dictionary's  backup
NB. directory. Sets  of backup  files are prefixed  with an  ever
NB. increasing backup number, e.g: 13jwords.ijf. Dictionary files
NB. are NEVER deleted by JOD commands.
NB.
NB. monad:  packd clName
NB.
NB.   packd 'dictionary'

NB. only put dictionaries can be packed
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. is there enough space on the backup volume?
if. badrc uv=. packspace__DL 0 do. uv return. end.

NB. get next backup number 
if. badrc uv=. DL nextbaknum 0 do. uv return. else. pfn=. {. ,rv uv end.

NB. backup files
pfn packdict__DL y
)

packdict=:4 : 0

NB.*packdict v-- pack the current dictionary.
NB.
NB. At  the  end  of  a  successful pack  operation  the  current
NB. directory object is refreshed and subsequent  operations  are
NB. performed on the packed files.
NB.
NB. dyad:  iaNxtBak packdict clName

NB. object nouns !(*)=. DNAME UF WF

if. (,DNAME) -: ,y do.
  NB. clear current object
  dropall 0
  path=. SYS   NB. object noun !(*)=. SYS

  NB. store backup number
  pfn=.backnum x

  NB. copy object files to tmp files
  for_obj. OBJECTNC do.
    NB. code relies on the fact that (OBJECTNC),
    NB. (JDFILES) and (DFILES) have corresponding items
    tfile=. path,TEMPFX,>obj_index{JDFILES
    datfile=. ".>obj_index{DFILES
    if. badrc msg=. obj tmpdatfile tfile;datfile do. msg return. end.
  end.

  NB. copy reference file to tmp file HARDCODE file name index
  tfile=. path,TEMPFX,>5{JDFILES
  if. badrc msg=. tmpusesfile tfile;UF do. msg return. end.

  NB. move old data files to backup directory and rename
  NB. backup prefix number HARDCODE backup directory index
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS
  dcfiles=. JDFILES ,&.> <IJF
  source=.  (<path) ,&.> dcfiles
  bckfiles=. (<":pfn) ,&.> dcfiles
  target=.  (<bckpath) ,&.> bckfiles
  if. badrc msg=.source renamefiles target do. msg return. end.

  NB. hash backup files and write sidecar (n)jhashes.txt file
  if. badrc msg=. bckfiles hashback pfn;bckpath;target do. msg return. end.

  NB. rename tmp files to standard file names
  target=. source
  source=. (<path) ,&.> (<TEMPFX) ,&.> dcfiles
  if. badrc msg=.source renamefiles target do. msg return. end.

  NB. insure new directory is reloaded when needed
  dropall 0

  ok OK200;DNAME;pfn  NB. return dictionary & pack count
else.
  jderr ERR202
end.
)

prefixdumphash=:3 : 0

NB.*prefixdumphash v-- prefixes hash to dump scripts.
NB.
NB. monad:  prefixdumphash clDumpfile

if. _1 -: dumpscript=. (read :: _1:) y do. 
  NB. errmsg: cannot prefix hash
  (jderr ERR0161),<y return.
else.
  NB. standard LF line ends for hash
  NB. matches (chkhashdmp) verb
  hash=. sha256 dumpscript -. CR
  dumpscript=. (toHOST 'NB. sha256:',hash,LF),dumpscript
  if. _1 -: dumpscript (write :: _1:) y do.
    (jderr ERR0161),<y return.
  else.
    (ok OK0151),<y  
  end. 
end.
)

put=:3 : 0

NB.*put v-- stores objects in dictionary database files.
NB.
NB. monad:  put blclWords
NB.
NB.   put ;: 'it where the sun dont shine'
NB.
NB. dyad:  ilCodes put bluu
NB.
NB.   2 7 put 'GroupName';'Group documentation text ....'

WORD put y
:
msg=. ERR001 [ loc=. <'base'  NB. errmsg: invalid option(s)

NB. do not save decommented words - set PUTBLACK to 1 to override
if. -. PUTBLACK +. 9!:40'' do.
  NB. errmsg: white space preservation is off - turn on to put
  jderr ERR023 return.
end.

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _1&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc =. <x-.' ' end.
end.

NB. do we have a put dictionary open?
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. NOTE: j 9.04 introduced a new binary format for extended precision
NB. integers that is not backward compatible with prior versions of j.
NB. While it's ok to read jod binary files created in older versions it's
NB. not ok to write to them. JOD uses extended precision integers to encode
NB. GUIDs. In retrospect it would have been a better choice to encode
NB. GUIDS as plain old character data. HARDCODE:
if. badrc msgbin=. binverchk DL do. msgbin return. end.

NB. format standard (x) options
x=. 2 {. x , DEFAULT

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. (loc;<DL) putwords__ST y
    case. EXPLAIN  do. (WORD;<DL) putexplain__ST y
    case. DOCUMENT do. (WORD;1;<DL) puttexts__ST y
    case. NVTABLE  do.
      if. badrc y=. (i. 4) checknttab2 y do. y else. (WORD;<DL) puttable__ST y end.
    case. -INPUT   do. (WORD;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. checknttab y do. y else. (TEST;<DL) puttable__ST y end.
    case. EXPLAIN  do. (TEST;<DL) putexplain__ST y
    case. DOCUMENT do. (TEST;1;<DL) puttexts__ST y
    case. -INPUT   do. (TEST;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. (GROUP;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (GROUP;<DL) putexplain__ST y
    case. DOCUMENT do. (GROUP;1;<DL) puttexts__ST y
    NB. HARDCODE - lines inserted to maintain put/get symmetry for
    NB. the frequent argument cases 2 1 and 3 1 
    case. 1 do. (GROUP;0;<DL) puttexts__ST y
    case. -INPUT   do. (GROUP;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. (SUITE;0;<DL) puttexts__ST y
    case. EXPLAIN  do. (SUITE;<DL) putexplain__ST y
    case. DOCUMENT do. (SUITE;1;<DL) puttexts__ST y
    case. 1 do. (SUITE;0;<DL) puttexts__ST y  NB. HARDCODE
    case. -INPUT   do. (SUITE;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do.
      if. badrc y=. MACROTYPE checknttab2 y do. y else. (MACRO;<DL) puttable__ST y end.
    case. EXPLAIN  do. (MACRO;<DL) putexplain__ST y
    case. DOCUMENT do. (MACRO;1;<DL) puttexts__ST y
    case. -INPUT   do. (MACRO;<DL) putntstamp__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. putdicdoc__ST y
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)

putgs=:4 : 0

NB.*putgs  v--  stores  dictionary groups  and  suites.  Prior to
NB. calling this verb  names, path and put dictionary status have
NB. been validated.
NB.
NB. dyad:  (bacl ; ia ; ia) putgs blcl
NB.
NB.   ((<'6');WORD;GROUP) putgs ;: 'group and members'

'DL code gtype'=. x  NB. directory object !(*)=. DL

NB. check binary compatibility of target dictionary
if. badrc msgbin=. binverchk DL do. msgbin return. end.

if. badrc msg=. pathnl code do. msg return. end.
y=. /:~ ~. }. y [ gn=. {. y
if. *./b=. y e. ; }. msg do.

  NB. change/create group -- insure group directory is ready
  if. loaddir__DL gtype do.
    jderr ERR054  NB. errmsg: unable to load directory
  elseif. do.

    NB. depends on first char of index list matching (cP_DL) nouns
    fc=. {. ix=. (>dnix__DL gtype),'__DL'
    cn=. (>dncn__DL gtype),'__DL'

    NB. groups/suites are either new or replacements
    uv=. (".ix) i. gn
    dfopen__DL fc
    gp=. ".fc,'P__DL'

    if. uv=#".ix do.

      NB. group is new - create

      NB. EDGE CONDITION?? if another group with the same
      NB. name exists on the path copy the group/suite text
      NB. of that group to this new group.  Use of this system has shown
      NB. that this is desirable behaviour because of the common
      NB. practice of "regrouping" in the put dictionary new versions
      NB. of the same group that are deeper on the path.
      if. +./uv=. (<gn) e.&> }. pathnl gtype do.
        if. badrc uv2=. gtype getgstext gn do. uv2 return. else. uv=. (1;0 1){::uv2 end.
      else.
        uv=. '' NB. default script is empty
      end.

      gdat=. <gn , uv ; < y       NB. (cn)   name, script, contents
      gdat=. gdat , <gn , 3$<''   NB. (cn+1) name, latex, html, text, et cetera

      NB. append group
      if. badappend apcn =. gdat jappend gp do.
        jderr ERR058 [ dfclose__DL fc return.  NB. errmsg: append failure
      end.

      stamp=. nowfd now ''
      uv=.  stamp;stamp;<a:
      uv2=. CNPUTDATE,CNCREATION,CNEXPLAIN NB. NIMP group append
      if. badrc msg=.uv invappend gp;uv2 do. msg
      else.
        NB. update directory
        uv=.  (".ix) , gn
        uv2=. (".cn) , {. apcn
        if. badrc (gtype,gp) savedir__DL uv;uv2 do.
          jderr msg [ dfclose__DL fc return.
        else.

          NB. stamp good directory change
          (<(#".ix);now '') jreplace gp;CNMARK
        end.
      end.

    else.

      NB. group exists - update
      apcn=. uv { ".cn
      if. badjr uv2=. jread gp;apcn do.
        jderr ERR088 [ dfclose__DL fc return.  NB. errmsg: read failure
      elseif. gn -: 0 {>uv2 do.

        NB. update group list - group script is not changed
        if. badreps (<(}:>uv2),<y) jreplace gp;apcn do.
          jderr ERR056 [ dfclose__DL fc return.  NB. errmsg: replace failure
        end.

        uv2=. uv;nowfd now ''
        if. badrc msg=.uv2 invreplace gp;CNPUTDATE do. msg return. end.

      elseif.do.
        jderr ERR055 return. NB. errmsg: directory-data inconsistency
      end.
    end.

    dfclose__DL fc
    uv=. ,>dnnm__DL gtype
    ok(uv,' <',(>gn),'> ',OK059);DNAME__DL
  end.

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)

restd=:3 : 0

NB.*restd v-- restores backups created by (packd).
NB.
NB. monad:  restd clName | blNameBnum
NB.
NB.   restd 'backup'
NB.   restd 'backup';13     NB. restore backup 13
NB.   restd 'backup';13 17  NB. restore backup 13 ignoring hash failures

NB. only put dictionaries can be restored
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. next backnum with ordered list of extant backup numbers
if. badrc uv=. DL nextbaknum 0 do. uv return. else. uv=. rv uv end.

NB. next backup number
bklist=. }.uv [ nxtbak=. {.uv 

NB. if a particular backup is being requested check its number
achk=. (2 = #) * (1 = [: $ $) * 1 = L.
if. achk y do.
  'bkname bknum'=. y
  if. badcl bkname do. jderr ERR002 return. end.
  NB. HARDCODE: 2 forcing bknum to pair
  if. badil ,bknum do. (jderr ERR106__ST),<bknum return. else. bknum=. 2 {. bknum end.
  if. -.({.bknum) e. bklist do. (jderr ERR106__ST),<{.bknum return. end.
elseif. -.badcl y do.
  bkname=. y
  bknum=. 2 {. {. bklist NB. most recent backup
elseif.do. jderr ERR002 return. 
end.

if. HASH ~: {:bknum do.
  NB. check backup hashes
  if. badrc uv=. hashbchk__ST {.bknum do. uv return. 
  NB. errmsg: backup hash failure ->
  elseif. 0 e. }.;rv uv do. (jderr ERR031),<{.bknum return. 
  end.
end.

NB. is there enough space on the dictionary volume?
if. badrc uv=. restspace__DL {.bknum do. uv else. (}. uv) restdict__DL bkname;nxtbak end.
)

restdict=:4 : 0

NB.*restdict v-- restore backups created by (packd).
NB.
NB. dyad:  blclFiles restdict blNameNxtnum

NB. object nouns !(*)=. DIDNUM DNAME SYS

'bkname nxtbak'=. y

if. (,DNAME) -: ,bkname do.

  NB. clear current object directory - frees space
  dropall 0

  NB. NIMP: restore comes from the same volume as the
  NB. dictionary.  This code depends on the fact we
  NB. are dealing with a standard dictionary directory
  NB. that is contained on ONE volume.
  path=. ((justpath`justdrvpath@.IFWIN) SYS),PATHDEL

  dcfiles=. JDFILES ,&.> <IJF            NB. dictionary file names with extension
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS   NB. HARDCODE: 5 backup directory index
  target=. (<path) ,&.> dcfiles          NB. current dictionary files
  source=. (<bckpath) ,&.> (<":>x) ,&.> dcfiles  NB. lastest backup files

  NB. test backup files errmsg: missing backup files - restore aborted
  if. -.fex source do. jderr ERR207 return. end.

  NB. Check DIDNUM of backup dictionary against current object
  NB. they must match to maintain master/dictionary relationships.
  NB. WARNING: uses fact that the WORD file is first ON (source) list
  if. badjr dat=. jread (>{.source);CNPARMS do.
      jderr ERR088 return. NB. errmsg: jfile read failure
  end.

  NB. read alleged backup DIDNUM
  dn=. ((1&{::@>) :: 0:) dat
  if. -. dn -: DIDNUM do. jderr ERR209 return. end.

  NB. erase current dictionary files and copy last backup
  (1!:55) target
  if. badrc msg=.source copyfiles target do. msg return. end.

  NB. update restored pack count to prevent clashes with backups
  pfn=.backnum <:nxtbak

  NB. insure new directory is reloaded when needed
  dropall 0

  NB. name, restore number, new pack count
  ok OK201;DNAME;(>x),pfn  
else.
  jderr ERR202
end.
)

restspace=:3 : 0

NB.*restspace v-- checks space for dictionary restores.
NB.
NB. monad:  restspace bkNum

NB. object nouns !(*)=. BAK SYS

NB. all dictionary backup files
if. #back=. 1!:0 <BAK,'*',IJF do.

  maxb=. {. y NB. valid backup number


  NB. select files in backup
  back=. back #~ maxb nummask {."1 back

  NB. bytes required to store lastest backup
  bytes=. +/ ; 2 {"1 back

  if. bytes<volfree SYS do.
    ok maxb       NB. return backup number
  else.
    jderr ERR204  NB. errmsg: not enough free disk space for operation
  end.
else.
  jderr ERR206    NB. errmsg: no backups to restore
end.
)

setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets/creates paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore
NB.
NB.   NB. the monad returns the locations of JOD directories.
NB.   setbuilddirs 0
NB.   
NB. dyad: blcl = uuIgnore setbuilddirs uuIgnore
NB.
NB.   NB. the dyad creates all the directories
NB.   NB. required to build the JOD addons.
NB.
NB.   'test' getrx 'setbuilddirs'
NB.   1 setbuilddirs_test_ 0

NB. mask locale references to enable:  getrx 'setbuilddirs'
NB. !(*)=. jpath_j_ JODobj_ijod_ DPATH__ST__obj locsfx__JOD__obj

NB. assumes JOD is loaded with (JODobj) visisble to (ijod)
0 setbuilddirs y
:
obj=. JODobj_ijod_
locx=. locsfx__JOD__obj {.{:"1 DPATH__ST__obj
aliendir=. ".'ALI',;locx

NB. this directory typically holds LaTeX jod.pdf files
NB. https://github.com/bakerjd99/joddoc
JODDOCDIR=. jpathsep (".'DOC',;locx),'joddoc/'

JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath_j_ '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath_j_ '~addons/general/jod/jodexts/'

NB. main build directories required by (buildjoddistribution)
corebuild=. JODDOCDIR;JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR

if. x -: 1 do.

  NB. create build directories under (alien) - some dictionary directories exist
  stagedirs=. corebuild -. JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
  stagedirs=. stagedirs,<jpathsep aliendir,'stage/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/'

  NB. core addon directories
  stagedirs=. stagedirs,<JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodbak/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodlabs/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/pdfdoc/'

  NB. class source 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodijs/'
  
  NB. unit tests 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/smoke/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/basic/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/large/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/stress/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/crush/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/prepare/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/purge/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/extend/'
  
  NB. creation order matters
  showpass 'created directories'
  showpass >stagedirs=. /:~ stagedirs
  makedir"0 stagedirs 
end.

corebuild
)

setjodliterate=:3 : 0

NB.*setjodliterate v-- prepare LaTeX processing - sets out directory writes preamble.
NB.
NB. monad:  (paRc ; clDir) =. setjodliterate clWorkingDir | zl
NB.
NB.   NB. use the current JOD put dictionary document directory
NB.   setjodliterate ''
NB.
NB.   setjodliterate 'c:\temp'           NB. windows
NB.   setjodliterate '/home/john/temp'   NB. linux 
NB.
NB.   setjodliterate '~temp'  NB. use J defined folders
NB.
NB. dyad: (paRc ; clDir) =. clAuthor setjodliterate clWorkingDir | zl
NB.
NB.   NB. set LaTeX \author{...} text
NB.   'Bob Squarepants (\texttt{pinapple@undersea.org})' setjodliterate ''
NB.   'Batman (\texttt{dn@jl.com}), Dr. Who (\texttt{who@univ.edu})' setjodliterate ''
NB.   'First Author \\ Lowly Minion' setjodliterate ''

JLDEFAULTAUTHORS setjodliterate y
:
try.

if. 3~:(4!:0) <'badrc_ajod_' do. 0;'!error: jod is not loaded' return. end.
if. 0 = #DPATH__ST__JODobj   do. 0;'!error: no open jod dictionaries' return. end.

NB. if the path is empty use the current put dictionary document directory !(*)=. dob
if. 0 e. $y do. y=. DOC__dob [ dob=. {:{.DPATH__ST__JODobj end.

JLAUTHOR_ajodliterate_=: x

NB. profile (*)=. IFWIN jpath
JLDIRECTORY_ajodliterate_=: jpathsep`winpathsep@.(IFWIN) jpath tslash2 y

NB. write main latex preamble and cleaner iff missing
preamble=. 'JODLiteratePreamble.tex'  
cleaner=.  '00cleantex.',JLSHELLEXT
if. -.fexist JLDIRECTORY,preamble do.
  (toJ JODLiteratePreamble) writeas JLDIRECTORY,preamble
end.
if. -.fexist JLDIRECTORY,cleaner do.
  (toJ JLCLEANTEX) writeas JLDIRECTORY,cleaner
end.
1;JLDIRECTORY

catchd.
  0;'!error: (setjodliterate) failure - last J error ->';13!:12 ''
end.
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

NB. test existence of test dictionary or create it on a unique path
settdict_ijod_=: {{ if. (<y) e. od '' do. OK_ajod_ else. newd y;(jpath '~JODTEST/'), 'prune' , (;{.yyyymondd 0),'/',(":didnum_ajod_''),'/',y  end. }}

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
NB. 20jan19 added code to add icon files: jodcube.ico, jodcube.png
NB. 24jan02 paths changed to user config path (JODDOCTEX)
NB. 24jan05 removed config path - passing (JODDOCDIR)

'JODSTAGEDIR JODGITDIR JODDOCDIR'=. y
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

NB. copy jod icons from *.tex document directories - these binaries are not stored in JOD.
png=. JODDOCDIR,'jodgraphics/jodcube.png'
ico=. JODDOCDIR,'jodgraphics/jodcube.ico'
if. (fexist png) *. fexist ico do.
  assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
  assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'
else.
  showpass 'jod.pdf latex files missing'
  showpass png
  showpass ico
end.


smoutput 'JOD staging directories updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1-%372)QL3+?1K!1E\Y"1H-F:+>Yr!2]sn8+?1K!2]st#1,0n1+>Y\o3$:+5+>b2r1E\V!1,U15
+>Z##2'=Y6+>G\q2DZI10H`80+>Gbs1,C%-0d&8,+>t>t1*ALu1,g=4+>P_q3?U(6+>Y,q1*ALu
2)l^7+>kns3?U7=+>Ghu1c?I31E\P4+>GPm1b^%0+>Pes0ea_-0H`4q1GBq3+>bqu2'=\7+?1K#
1E\Y"1-$I9+>Ghu2BXe5+>G\q1G^./1E\M6+>k9!1E\Ir0fC.6+>beq0ea_-1a"Or1-$I7+>ktu
3$9t8+>G\q1-$I5+>bks2'=\4+>k8t2'=k$1Gg47+>Ynu0esk.1*A;.+>tqs0f:(13$9t2+>Yf?
=]@gg8QnQ$@VTIaF<GX=H=\4;E-,f4DBNG-A7\,'9h%NE:If81F*(u6+D,>(AKYK#3ZqsI@ruF'
DIIR2+Du==@V'R&Ci<rR:/+2S5uLEUD..L-ATAo*Bl%?'@r==MA8,OqBl@ltEd8dH@<,dnATVL(
F$i\s7T;Z?D..L-ATAo*Bl%?'@r==MD..-r+Co1rFD5Z2@<-W9FCAWpAOB?a5u^EO:2aTVARfg)
@rc-hFD5Z2+E)4@Bl@l3@rGmh6r60K87ZFEFD5Z2@<-W9E+*j%+EV%$Ch6"29M%rM<,H&gBl/!0
+Co1rFD5Z2@<-W9E+*j%+DbV,B67fT<D?:a;b&]_DffQ3+E2IF+Co1rFD5Z2@<-W9E+*j%+>"^Y
F(Js+C`mq8ASrW,Ddd0jDJ()&F_u(?F(96)E--.l5uU<`@:O(qE$/h&F(c\7E-,f4DBNG-A7\:t
;b0AV=CP]KCNXS=BOPsqATJu+Bl%?'F*2),Bm<07;b0GI;Jfi_CNCV3ART+\EZf14DIml3Bl5&&
@:O(qE$/h&F(c\.Bl%@%8PiPb6:uB>H$!V<+Du+>AR]RrCERP7FD5Z2+Cf>#AP%2?:IJo7FCfK)
@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(
Eb8`iALU2s8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+G
AKWCBATV[*A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=
6rZrX9N+td6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs
@;]TuA79Rk9L2TV:fUJ2@<6N5DdmHm@rri4F`\aEE-,f4DBNG-A7\G'5u)6-@;[3/Dfp)1AKYo1
FD5Z2+Cf>#APPNc770a7;c?:2DIIBn+Cf4rF)rIBE-,f4DBNG-A7\q97s\l^+EMIDEarZ'DfBf4
Df-\-De*Eg@:O(jF_u8?A79RkF!+q#@r$4++E1b!CER,*F`):D@;]Tu@UWb^F`9!SATMs3Eaa'(
Df-\>Bl.F&FCB$*@W$!uBleA=DdmHm@ruc7Bl5&4F`\a:Bk)7!Df0!(Gp$X+FCAWeF(HJ'@:O(q
E$/b,Ch7ZsDJXB*@<,jkF(Jd#@q]Fp+E2IF+Co1rFD5Z2@<-W9@UWb^F`8I@@;TQuCh[s4F!,(5
EZfF;D/a<&+Cf(nEa`I"ATAo0BleA=E+*j1ATD[0@WcC$A86$n@rH4'Eb0<5ARo7mBl%=$+CQC)
F_kl>+Cf>,E,oN2F(Jl)8l%htCi<`m+EV19F<GX7EbTK7@WcC$A86$nFDl)6F(9-*E,oN2F(Jlk
F_PZ&F!+t2D/aN,F)to'+Eh=:F(oQ1+E(j7FD,5.8l%htFDl)6F!+t/@<6K4F(96)E-,T'CM7-t
BOkt!@q]F`CNCV/F_u(?F(96)E-*49@<6*)@:s"_DKBnB@rH7,ASuU2A8lU$FE;#8+Co1rFD5Z2
@<-W9E+*cqD.Rg#EcYc6D/a0"@:Wqi@rc-hFCfM9FD,5.A9Da.Anc'm+CT.u+Eqj?FCfM9BOtU_
ATAo-DJ!g-D..O#Df00*E+sQ/Bl\9:+E)-?E+*j%+E):2ATAo0BleA=Bl7HmG\2)7Ci+*.FEqn<
FEMVAF!,:5F*)IGDe:,&Bl[cpFDl2F+E(_(ARfg)DJsZ8+Eh10F_,W,Ci<d(@;]LiH$X$Q+ED%4
DfTqB@;]TuF*)>@AKYW%Ddm-k+DtV)ATMNnF(f#k@r$:/Blmp-+CQC7AU&;>F(o/r@psC#Anc'm
+E(j7@UWb^F`8I:@<6*nF(f!'BOYIbCL_$h@r$-.BOPsqATJu4AftPk@r$4++D,>(ATMNnF(fT*
E+36cCNXS=BOPsq+ED%4DfTr5FCT-$E+<]uE-!.8ART*l@;]TuFCAm"+Co&"Bl.R+ARlp"BleB;
C2[X!Blmp,@<?']9gi`7A8Gt%ATD4$AKZ/-EcYr5DBNe)CLnVsDIal#@<?'qDe*ZuFCfK$FCefm
@<6*m@<?('Ebof1@4a5l2BZ[AF(c\7Afti,A8Gt%ATD4$AKZ&(EbTK7+C]J-Cige<DBNIuFCf3*
A8c@-F`M@B8l%htDf-\<ATN!1F<G:=+>G!QAfu/;@q0(kF(TQ2+CT.u+>=pVFD,6+GA2,0C3FJe
+Eh=:F(oQ1+Du==@V'Rs@;BFbF_u).F_u)=+EV:.+CfP7Eb0-1+E1b2BHU`)+CQBb+EM%5BlJ/:
Anc'mDIn'7@UX%iF_u#-G]Y';@:O(qE$0%@D.7's+EqOABHV56A7]dmA0>]&F*&OCAftPk@r$4+
+Du==@V'S$De*d*ASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;@)@:O(`@UWb^F!,UE+CT.u+ED%'
Dg#]4F!,[8F*(u(+EML1@q?csDBNJ(@ruF'DIIR2+D,>(ATMg!@r#Uh@ruZu@r!3/BOr;rF`MM6
DKI"3Bk)7!Df0!(H#Re8AncL#F_u)2@<6+$Eb/isG\(q=BOPsq+EVNEA9Da.+EM%5BlJ08E-68D
FDl22F!,C1C1UmsF!,17+Co1rFD5Z2@<-W9A79Rg@UX=h+D,>(ATMg5FD#Z9FDl22F!,"-@ruF'
DIIR2+D5_5F`;CE@;]TuF*22=ATMm'F*(r5ATMs3Eb0;7@UWb^F`;CE@rc-hFCeu*@X0(EE+*6l
A1;P1F*(r,@rua&F*)>@AKYGj@r$4+F!+t5ART[lA0>?,+=M2;@r#U(Eb0<6F)YPtARfCb@r$-.
F)YPtAKYT'EZen,@ruF'DIIR2+ED%7FDl22F)to7@WcC$A7TCpF)to7F"_$DART[lF!,F1FD,_<
F`V,)+C]U=8l%ht@WcC$A0?)7Eb'64ATV[*A8Gt%ATD4$AT2[$E+*cu+A?3CAQU'oEc5H!F)u&5
B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh7^"F*(u2G%ku8DJ`s&FE;#8F!,UE
+EV:.+=Lr=De(:>Ci<flCh4`$DfQt@F`))2DJ()6ATMr9@psFiF*2G4@<?'qDe*BmF*)G:@Wcd,
Df0]:A79RkF!,(/Ch7Z1Bl5%c:IH=9BleB:Bju4,Bl@k                              ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c$73+>P&o0H`)10Jst-2]sk32)ZR31E\D,2DQC01*A;12DZI11*A>12E,)_Cf>1hCLo1T:-pQ_
@W$!\D/X3$0JXbm/M/(n@W$!2+EV19F<G7*F(c\.@;0P#Eb-A(ATVKnFD5Z2/e&._67r]S:-pQU
@<6L4D.RcL%15is/e&._67sB'+>>5e@rH6sBkMR/ARloU+EV19F<G16Ch.*t+A,Et<(0_b/0K"U
@;]UaEb$:b+E_d?Ci^^IA8-'8+Co2,FE1r(.1HVZ67r]S:-pQU+<WBf+=M>CF*)/8A2#\d+Co1r
FD5Z2@<-W&$;No?+<VdL+<YQ5G@VgDFCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU
-Ql/N/g+YEART[l%15is/g)8Z+<VeIAS5Nr-Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8
C2[W:0IIu<67sC$AS5^uFCfJ8AU&<*DKH<p:-pQB$;No?+CfG'@<?'k3Zp131,NTS@PBSI$;No?
+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5
De!-?5s]R/DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`
Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-OgDX67sB4HW3F4<$5+=
5uL[1/I`$r$;No?+DGm>AoDKrATAo'Df00$B6A6+A.8l[F(8f)-[nZ`6rZTR<$r+^%15is/g,4H
F<G[:F*&O8Bk)7!Df0!(Gmt*lEZfF7FED&-@rri8A8,Oq4ZX]5FCfN8C2[W:0II;:%15is/g,1G
@:UKhDIal6EbTW,+C]V<ATJ:fEb/Zi4ZX]?+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"%17<"BlmoL
3Zp.#3\hg`?p$\,-o3V*5!UMP+Z_;+.1HUn$;No?+Cf5+F(HJ&DL!@CE+No0@;]TuDfB9*+EV19
F<G+.@ruF'DIIR2%16Ze+E(d5FC])qF<Fd11E^UH+=ANG$4R>;67sBlEaa$#+CT/5+CfP7Eb0-1
+EV19F<G+.@ruF'DIIR2+C\bhCNXT;%15Ks4ZX^43Zrc%6r60K87,_&<*s!):IK,1C(1M(+>>'Q
ATD4#AKW]MA8-',6:"7O?URR=-Rp_u-OgCl$;No?+Du*?@UWb^F`8I7EcQ)=+D#e:ARfgnA.8l`
ATAnJ1a$7FC`k)X-OgCl$;No?+DG_7ATDl8Ea`irDf$V*EcPT6F!)T7ATW--ASrW"@:O(qE-!.D
D]ib3F*2M7%15is/g+h9F(f-++DG^9FD,5.DJEinF(f-+/p)>[+EM7-ARf.h+D,>(ATJu)BkCsg
EX`@h@<6*q@:O(93ZpXE+>k9!,V^u,0JG17%16cWF(fE3B0A9u-Y@(5F*&O6@:O(qE$l)%ATAo8
D/a<0@j#`5F<DrE@<6*q@:O(#%16Ze+EVI>Ci<f+E-67F-YQq0BPhg'-OgDoEZf=0@r#TtFC])q
F:AQd$><jhBP:gaCHX^$5;aQ@+>kE!0JG170JEqCBOPsqD0'>Q3ZoekARfXrA0>>i@r$4+-OgDo
EZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze+E1b!CLeQ0
A8,Oq%13OO:-pQU@;Ka&BOPsqATJu8BQ&$0A0>i"F)qctATAo7BQ&*6@<6K4BOPsqATL!q+>Get
@W$!)-S?bU$7[Y]+?L]#+>G!e/g,1X?X[\fA7$Hm@<6*nEt&Hc$;No?+Cf>/Gp$O5A0>o(DIIBn
+E)(,ATAo&@:O(qE$0@CEb$;)Bl%@%+E)F7EX`@N67sBuATq^++C\bhCNXT;+>"^XBPDN1GA1l0
+DG_8Ec5K2@q?ck+D>2)BHUnqBl%p4AISu]GAhM4F$2Q,A8-(+Eb/f)6:"7O?URR=-RrkTDfTB0
/no'4-OgDtGAhM4F$2Q,-sSeU0d(fe0d(4TDfTB0.=5fRDfTB0%14M(ART*l4"u#.3bikWEb'5?
+Eqj?FCcRV0RJ.!C3OT:A9/1eATAo7BQ&*6@<6K4BObgk@<6*nF$2Q,0fL4aDJUFC/gh)8%15is
/g,4RD.Oi'@<6*nF!,('Bl"nD+>@jZBl5%J2]uRIC`k)X-OgD:+D!/J4!67#0d(ls+EDX4@;9^k
?Qa#lCM7-tBOu5o$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6
DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:FU$=\-lCh-mfDe*ZuFCfK$FCe36
/h1=QBl%<eC2[X!Blmp,@<?''F"Jsd@WcC$A0>;uA0>DsF*)G:@Wcd(+DPh*Ch\!&Eaa'$/no'A
%15is/g(T1:-pQU@rc-hFCeuD+>PW+0Q1HC0Js:H:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$;No?
+>PWh@rsC^+C]J-Ch+Y:C2[X!Blmp,@<?'0+CT.u+Co2-FE2))F`_1($;No?+>PWh@rsCb+=LuC
A8Gt%ATD4$ARB+ZF(f)mFCfT8CagK8A7T7^%15is/g)o'DJs\P2]sM`De*ZuFCfK$FCeg"Df9_H
+CSekARl5W:-pQU1,*6M@k]V[-u*[2Ch\!&Eaa'$<_Yt2+CSekARl5W:-pQU1,3<N@kob]@WcC$
A0>u.D.Oi,@<--pA0>f.+E27?F<GOCDe!@"F)Q(.$;No?+>P`]E,m]k+CSeqF`VXIFDi:8@;]Ul
AKZ#)@:V$0DJXS@E-67FA8,OqBl@ltEd8*$:-pQU1,EHP@koe^.!&sAC2[X!Blmp,@<?'0+Du+A
+E_a:F!,")Anc-oA0=JeAoDKrATDi$$;No?+>Pcg@;[eX+E_a:+Cf>-Anbn#Eb/c(AoDKrATDi7
FDi:=@;BEsD/XH++E27>FCAWpAIStU$=e!aCghC++EVI>Ci<fj5s[eODe*ZuF>,^8?TgFt5s[eO
De*ZuF>,^8-QlV9@rGq!@<6!&4=<E\6#(=KCh[uF3B8Gr$=e!gDKBB0F<DrFC2[W1%13OODf9PW
3Zri'A8,Qs0F\?u$?K]tDEU$'-YdR1Ch\!&Eaa'$-OgCl$9g.jDe'tP3[cC(Bl.F+-Qk!%+?M9(
Df9PC,:@2BAU#RO/12QTDe*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?14tq>*D/a<0@j#DqF<EY+
-Y[X3Afu,*@:UL)EbTW,+EM4)1,Us4F(fK9E+*g/+EV[H@;Ts+C2[X!Blmp,@<?'fBOPsqA79Rk
F`M:@C2[X!Blmp,@<?']9gg+4AoqU)F*)FF@V'.iEb0<6EZf+7Dg*==DJs`<Df^"J%13OO:-pQU
Bl8!'Ec`sTAT2Ho@q?clF_PZ&+EV=7AKZ&9@;Ts+Df-\:Df^"CE,ol,ATMp2EX`@>0RG0f@j#Z!
FsfF6+AG-h;GUY.C2[Wi+D58-+=Bu];cI*O/9><AD@Hq$1E\_$0I\+l-Qij*BkAt?0H`M$4tq=X
5snOG?X[\fA7$HuF`\`S4DJbPGAqJAF<EY#+F>5K@s0:D14:9_@s1!r+=qD?Fs(=6/e&.1+>G!C
+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+E27?F<GOCDdso3Bl.F&FCB$*
+Du+>+E_X6@<?'k-OgDoCia/?+>F<4ASu$2%14Nn$4R>;67sC'E+EC!AKZ/5A0<$D.OdM5+DPh*
Ch\!&Eaa'$<_Ysk$=[OSFCdTr+=M>QFCB$*+=ANc/12Q7<$re`67sC&G@b2u+D,P4+EV=7AU894
AISu]De*ZuFCfK$FCeKI6p3RR+=JX%3ZpU@HYRJ0Ch\!&Eaa'$<_Yt24(;`/FCcmD-nui".=E=R
De*ZuFCfK$FCeKI6k'JO1E\_$0I\+l-OgDsAhG2[+?^i20RInYE,9H&+E2IF+=CoBA8Gt%ATD4$
AQDMn-Qlr</e&.1+>G!C+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T+Eh=:
F(oQ1/o>$4AM.M%FCcS4Dfd+EE+EC!ARm/2+:SZhCia/?+>F<4ASu$2%14Nn$4R>`D/XQ=E-67F
-Xq44Ch.6tB-;A/EcYr5DBLMp+=B6cDe*ZuFCfK$FCeKI6k'J4$?BW!>9G;6@j#W0B-:f#Ch4tW
3c/\S+EM%5D@Hqn@j"tu-ZW]>DI[c94ZZ;'6W-]e@;9^k?Q`umF<Dr1:IIucC2[X!Blmp,@<?'f
D.G"'$4R=j1E\_$0I\+l-OgDX67sC'E+EC!AKXoB5r(;U+D>2)BHU`$A0>DkFCcRCD/XQ7FCAm$
+EV=7ALS`F-n6Z//g+nIA8Gt%ATD4$ARB+ZF(f)mFCfT8C^g_b@<6*F3ZrKW@59\u+ED%%A0>Ju
Ch4%_C2[X!Blmp,@<?'fBOPsqA79RkF`M:]3Zoha@<6*D@UrnhALS`M0H`)!I3<9CA8Gt%ATD4$
ARB+ZF(f)mFCfT8C^g_cAhG2[+?^i20RInYE,9H&+E2IF+=CoBA8Gt%ATD4$ARB+ZF(f)mFCfT8
CaU?9D_;J++<WB]>9J!#Dg-//F)rHOE-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Ke_8F(c\6
Dfd+EE+EC!ARm/2+:SZhCia/?+>F<4ASu$2%14Nn$4R=j1E\_$0I\,VBl%?BF(96.%14IpBl%?'
F(96.-Ts()Gmt*pAhG2[+D!/JBldcr-9`P74"akp+Cf"rAj%ah-Qmk1:IH=S8jPg;;^W\uD_;J+
+<W?\>9J!#Dg-//F)rHOAoDKrATB2?.3NMHF<G(3DJ!TqF`M&(3Zoe$@qK@c+ED%8F`M@P+:SZh
DIb@/$>F*)+D,20BleB'C0r*%F`]c!+=Lu5@r$-K3Zr0V@<?0iC0r)2IS)mn92dJk/9><ADCd.g
-RgTf@rcH<-SB+JF!i)@D_<.A$6UH>Eb/Zi+D,>(ALSaGEbTW,+EM47GApu3F!,CDF:AR"+=K<,
HSBea@rs.BGB.D>AKZ&-Dg-//F)rI=@:O(o/14Cm6r.0)De*ZuFCfK$FCd(AA1%fnASu$2+:SZ,
%13OO4tq>%A0>f/D]i7,1E^UH-RU#G$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?
5s]7(A8Gt%0KD.#%16QeBl%<eE-68EATDie67s`sF_PZ&?Z:.0FCfK6+EK+d+C]J-Ch+Z-F`__:
EcW@GE+EC!AKYYpF(c\,@<?'5%15is/g(T1:-pQU@rc-hFCeuD+>PW+11><<0K9LK:-pQU/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M.D=:-pQU1,E?XE\]Kp@:X+qF*&OHD]i_%DIdQp+ED%%A1qk=Cj@.BF`\a:
Bk)7!Df0!(Gmt*'%16T`@r,RpF!,RAE,9H&?U6tDE-68CF"fU7?TgFt5s[eUF`_YF0KD-@+Bosu
De3rtF(HIV-UC$aE-68CF"fU7-OgDmDeX*1ATDl8-Y[=6A1%fn%17#lD`p-(I4f&EA0<Q8$4R>`
@rcHM3ZoehF`__:EcWT;$4R>+0RI_K+=D;RBl%i<+BosE+E(d5-RT?14tq>*D/a<0@j#DqF<EY+
-ZWd,A0?):Blmo/F(fK9E+*g/+EM4)1,Us4@:jUmEcZ>C+C\noDfTE1FE/L=DJs_AC2Rs6E,Tf>
+EV=7ATMs%D/^UF/9><ADCd/BBOPsqA79RkF`M:G%13OO:-pQUBl8!'Ec`sTAT2Ho@q?clF_PZ&
+EV=7AKZ&9@;Ts+Df-\:Df^"CE,ol,ATMp2EX`@>0RG0f@j#Z!FsfF6+AG-h;GUY.C2[Wi+D58-
+=Bu];cI*O/9><AD@Hp^$7I\Q3Zp+*+=ANZ%16f]/g)hj4WlpBHVHdn;GUY.C2[Wi+E2IF+=K?e
DJs`<Df^"C4#.q*+Dt\4.3LBo+Dt\44ZX]:DI[i4A8a(0$6UHG+Bot0BQ&*6@<6K4-ZF3M+Co1r
FD5Z2@<-W9BlbD;ART+&Df0B:+>"^TDf^"CE,ol,+EV=7ATMs%D/^V8Dfd+EE+EC!ARm.t$>"$p
AM,)[%16ZaA1e;u.1HUn$?BW!>9G;6@j#W0B-:f#Ch4tW3c/\S+EM%5D@Hp^$7I\Q3Zp+*+=ANG
$;No?+E_X6@<?'';b0202)ZRj@<6*)@;]TuA79Rk+<V+#BOPsq4Y@juBONYR2B[$O@:UKmBl%>i
$7Kt*Ec*EU?YEkhBOkOnAT`$0-Rh2>+=Lo3F(dXWBl.F&FCB$*+=ANc+=Jod0e%Mn+tdqHEc*EU
?YEkhBOkOnAT`$0-OgDsAhG2[+?^i20RInYE,9H&+E2IF+EM%5DCd/BBOPsqA79RkF`M:G+CoCC
%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]G%G]8Bl@lAA79Rk
/ne[7BHV22F<G^FA79RkA1%fnAScF!/g)kX$>"*c/e&.:%13OO4tq>%A0>f/D]i7,1E^UH-RU#G
$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]I4FE2FV3B:FU$=n*sATUjfDeio<
0MXqe.V*L>ATUjfDeio<0HbHh/KcHPE-#T4.3M)U;F<lI5uU`O;G]YY80DGW@ruF'DIIR2+Dl%?
AKZ)+F*'#D$;No?%15is/g+SDF*2>2F#ja;:-pQB$;No?+<Vd\.3N\R@;]UaEb$:b+EM+8F(oQ1
+Eh=:@WNY?F(f-$CagK8G%#*$@:F%a%15is/g)8Z0e"4nC2[X)ATMs)E[`,FF!+m6Ci<`m+EM%5
BlJ/'$;No?+<Vd^.3O(3:IJ/N;cFlRF!+m6@rH6sBkMR/ARloqDerrqEX`@N67sB'%15is/g+SF
FD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[lA3(hg0JYJ"@;[e[%15is/g+Y;@;]^hF#kEq
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"
EcP`/F<Dr?@<6!-%13OO:-pQUD..3k+DPh*FCfN8ATAo*Ec5e;8l%htA8-+,EbT!*FD5Z2+Co1r
FD5Z2@<-'nEt&IO67r]S:-pQU+<YT5+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$;No?
+<VeDCi^^HC2[X)ATMs)E[M;'Ci<`m+=CoBA9;C(FCfJ?%13OO@rGjn@<6K4FDYu5De!-?5s]R/
DeioE3B:G03Zoe95s]R/DeioE3B8H0>9IEoATD4#AKX)_5s[eXD/X3$3B9)I%16T`Bl8!'Ec`EO
BkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,+=Cf?De(4W-V@0&-Ql/N/g*51+<XEG/g,FJD/Ej)+E)-?
%13OO:-pQU/ULGc;cFl<<'aD]I4Ym8%15is/g+YEART[l+CQC1ATo8>DJ=*5AKYMt@ruF'DIIR2
+:SZeEa`irDIn#T3ZoeeDg#]6ATMr@/0[,cBk2+(D-p^dDe*2t-RT?1ATAo2ATqZ-@WGmpA8Yt&
4)\qGCi<fH3Zr0V@<?0*-[nZ`6rZTR<%fUM@WGmpA8Yt&%13OO:-pQUDfB9*+CT.u+EM+9+AtWo
6r-QO=Ub^LEZf:2+C]A"DIdWrG9C*41E^UH+=ANG$>"6#A8lU$F<Dr/76s=;:/"e<%16Ze+>Y-Y
A0>?%@;]UnATnRj%15is/g,:SEb/ltF*(u6+EV:.+Co1rFD5Z2@<-W9@;]TuD/XT/+EV:.+D,>(
ATJu9D]iJ+DffZ(EZet4Ch.*t%16Ze+>Y-\AS5Nr@WGmpA8Yt&+:SYe$>sF!Ci<fH3Zr0V@<?0*
-[nZ`6rZTR<%i-#GAM2--S-H&A8,RlF_tJoC2[Wi+=ANG$>j3eARoLq?X[\fA7$HADIn$.Dds4`
%14L>+?CW!.3Kuc%16f]/g*_T<DH+f+<VdL+CoCC+>G!C+EM4-Cht58BQ&*6@<6K4-Z+#L-S01P
A8H0o/13(n-S0.HGAM2-%16Z_F(K&t/g*_T=%Q.0+CoCC+>G!C+EM4-Cht58BQ&*6@<6K4-Z*dF
AKW?ODers#Ddt=G+=A^XATqs/@grcVCia/?+EM47GApu3F!)iQDKBr>E,Tc=ARloZ;^W\l+>=oI
$>"*c/e&.:%13OO:-pQUEb/ltF*(u6+Co1rFD5Z2@<-W9Bl5&2ATo85De!3tBl@ku$>"6#Eb/lo
+C]A"DIdWrG<9\RGAM2-/13(u/7NX.DIdWrG7=lg$;No?+E)41DBNY2+Dtb7+Dbt+@<?4%D@Hqa
EZf:2+C]A"DIdWrG7=lg$;No?+CTA6ASlC.+EVNEF(KG9Eb/Zi06_GNFCcRH+EM47F_kS2Eb0?8
Ec*":@<6O%E\Cs;@ruF'DIIR2+Dkh6D..NrBFP;dATAo7BQ&*6@<6K4A8lU$F<Dr/76s=C;FshV
-OgCl$;No?+D,P4@q?d"@<6O%EZf=0FD)e2DKKe>A8,OqBl@ltEd8d9DIal"Ci=B+%16Ze+CoG4
ATT%B7ScoL786'H<(0\]5u^B&%16Ze+>Y-YA0<6I%13OO:-pQUEb00.ASrVB+EM47F_kS2@;Kau
G9Cp;@:V$8EbTW,+EM+9%16Ze+E(d5@WGmpA8Yt&%16Ze+CoG4ATT%B;FNl>=&MUh74/NO%13OO
:-pQU/ULGc;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!
@<6!&4EPFZCi<fj5s[eXD/X3$3B9*,Eb0<6A5d>`CLo1R:-pQ_Eb0<6A5d>`CLo1R+ET1e+=M8A
F*(qA+EV19F<G%$@r$4++ED%7FDl22F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<W?e
+Cf>-Anbn#Eb/c(8g&4eF*&O:DerrqEZdtM6rZTR<%K/5FCB&t@<,m$8g&7uBl%i5-tI%4/0JME
@<6!2+D,2*@<6!/%15is/g(T1:-pQU+<WBf+=M>CF*)/8A2#\d+Co1rFD5Z2@<-W9%15is/g)8Z
+<VeEATqZ--Zip@FD>`)0JFk9C2dU'BHS[O8l%iS78m/=FCfN8C2[W:0IIu<67sBjEb/[$AISuA
67sB'+<VdLEb/lo+=D8BF*)/8A2#\b4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFjs:-pQUEb/lt
F*(u6+D#e>@;^/r$;No?+<V+#:-pQU@rc-hFCeuD+>PW+1hL<.0Ja.F:-pQU@q]:gB4Z-F+>#/s
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4
ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd
3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1
%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])q
F?MZ--Zip@FD>`)0JFj`$4R>REZf:2+EV..@rrht+>Y-YA0<6I%13OO:-pQUATD4#AKYE!Gp$U>
EcP`/F<G[:F*&O8Bk)7!Df0!(Gp$R)@r$4+Et&IE9KbEZHTE9r/jrN%<(LA';cI+28l%in@VQ>Z
0H`%pAn?!kF(HIK+Co2,+@8@e?XH2p/12o".OPZ4%15is/g,%M+C\bhCNXS=ATDg0EZeq<E+NO$
ARl5WDImi20f1"^DJUFC/gh)8%15is/g+SEFCf<.F<G[D+ED%7FDl22+EqOABHV22+C\bhCNXT;
%16uaEZfC6F*(q8FC])qF:AQd$;No?+DG_7ATDl8Ea`irDf$V*EcPT6F!)T7ATW--ASrW"@:O(q
E-!.DD]ib3F*2M7%15is/g+h9F(f-++DG^9FD,5.DJEinF(f-+/p)>[+EM7-ARf.h+D,>(ATJu)
BkCsgEX`@h0g.Q?BOPsqBOPCd4ZX]M2'=b!2'an10JG170F\A&@<6+!F([Ws+=Cc8EcZ=F@UWb^
F`8];$>"6#FDYu5Ddso/F`\`RBOPsqBOPCd-OgDoEZfI@E,9H&+E2IF+=Ci2F(fE3B.",qATAo4
@:O(`+EV..@rr.e%16c(4ZX^!@<6*q@:O(93ZpXE+>k9!,V^u,0JG17%16cWF(fE3B0A9u-Z`j/
Df0).@UWb^F`8];$>"6#FDYu5Ddso/F`\`RBOPsqBOPCd-OgDoEZfI@E,9H&+E2IF+=Ci2F(fE3
B.",qATAo4@:O(`+EV..@rr.e%16c)4ZX^!@<6*q@:O(93ZpXE+>k9!,V^u,0JG17%16cWF(fE3
B0A9u-Zj$9Eb$;%@:O(qE$l)%ATAo8D/a<0@j#`5F<DrE@<6*q@:O(#%16Ze+EVI>Ci<f+E-67F
-YQq0BPhg'-OgDoEZf=0@r#TtFC])qF:AQd$;No?+CT)&+D>2)BOu6-F(fK7Ch+Z-@<6K!$>"6#
BOPsqATL!q0fL4aDJUFC/gh)8.P<@s4!67#0d(ls+EDX4@;9^k?Qa#jF(f-+%13OO:-pQU@r,^b
EZfFFDfTE"+Du+?DK?6oATD4#AKX&q-YQq0BP:gaCER;!F(fE3B.",q%15is/g+V3@r$4++Du==
@V'S$+D,Y4D'3k1@qBP"+EVNEDerrqF*%iuATAo&DKTf;4ZX]pDJUFC/gh)8@W$=*F$2Q,+tb3+
+=MXj+C]52D0%-K/M8A&4s24*-OgCl$;No?+ED%7FDl22+EV:.+D,>.F*&O6@:O(qE"*.cEZfC6
F*(q8FC])qF?=h1@W$=*Et&Hc$;No?+ED%3E+No0Eb0<6DfTE"+C\bhCNXS*$>"6#De'u4A8,Oq
+BosE+E(d5-RT?1%15is/g,"BF)tc&AKZ&-Dfol,+C\n)-Y@(5F*&O6@:O(qE$l)%ATAo8D/a<0
@j#DqF<DrE@<6+!F(Zj0$7BG"EcZ=F@UWb^F`8]N/NP"f@<6+!F(ZU)$4R>;67sBhEcPT6+EM47
F_kS2D..NrBHUo$EcZ=F%16Ze+EVI>Ci<f+B4Z0--YQq0BP:gaCF9PuBJCV]3Zr*EF(f5q@quM\
%15is/g,1G@:UKhDIal6EbTW,+C]V<ATJ:fEb/Zi4ZX]?+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G"
%17<"BlmoL3Zp.#3\hg`?p$\,-o3V*5!UMP+Z_;+.1HUn$;No?+Cf>/Gp$O5A0>o(DIIBn+E)(,
ATAo&@:O(qE$0@CEb$;)Bl%@%+E)F7EX`@N67sBuATq^++C\bhCNXT;+>"^XBPDN1GA1l0+DG_8
Ec5K2@q?ck+D>2)BHUnqBl%p4AISu79KbEZHTE9r/jrN%<(LA';cI+28l%in@VQ>ZC3OT:A90mp
+Co2,FE1r(+@8@e?XH2p/12o^GAhM4F"V0AAg\#pC3OT:A90mp+=LJU+>G!c+u(3TGAhM4F")HN
GAhM4Et&I)Eb/Zi+?M9(HTGncDfTB0.3NhTBlmo/4"u#./o#TKEb'5#$>"6#BObgk@<6*nF$2Q,
0fL4aDJUFC/gh)8%15is/g+kGA7^!.De:,$@:O(qE$0@=FD)e1@<6*)AmoCiF`M%&$=[FS@UWb^
4ZX]>+DEHW+=\us+u(2_4!HC%>p(jE0d(ls+EDX4@;9^k?Qa#lCM7-tBOu5o$=[FSDKTeZ3ZoV!
-p(mHA7AtWCERsHI4cXODJUFC/gi(j/M8.n/ghbN$4R>;67sBhFED)2E-*4ED]j(3FDl22+C\bi
+C\bhCNXS=/Ke_8F(c\.@;0P#Eb-A)G]75(FCetl$>sEq+ED%7FCZM9A8,Oq4(;W/DKTe*$4R>;
67sBpB5VX.AKYYpF(c\.@;0P#Eb-@F+Du+>+ED%'Df'?&DId<h+>"^,5uU;s4WlI<+Cf>#AISuX
EZfC6F*(q8FC])qF?<r?A8ZO,/4`'*87,e?De*2a$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm
%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2
?O[>                                                                      ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1G^.2+>P&o0H`/-+>Get1GU(-1E\J-+>GVo1c-=01*A>3@W$!\D/X3$0JY%cDJUaEFCfN8+D>2)
BHUnqBl%p4AKYMpFCes(Bl@luF_PZ&?YXLiCh\!&Eaa'$@WcC$A0>;uA0>DsF*)G:@Wcd(+DPh*
Ch\!&Eaa'$@WcC$A7':uFED)7F(09+Ch+Z-F`__:EcW@GE+EC!AKYYpF(c\,@<?'kE-#T4;f-Gg
AM>edA8lU$F=A>%:JsPK9gM]W78crJ<(J-BBk)7!Df0!(Gp$sBG%De<ATMs6ATMs(;f-GgAM>ed
Eb0<6A18XCATMr9@UWb^F`8IDATMs3Eb0:                                        ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f_'50f^@4+>G_r1*AD12)cX50H`+n1c@*L+>P_q1*AP82DQC02BXat0f([H+>G\q1*A;.3&)O1
0d&4o1cI<O+>PVn1*A;+0JXb*0H`+n1,_-H1E\D.+>P&s1,h*61,0n,+>GQ(0Jah2+>P&p2E*Q;
0f1".+>GQ-1a"M,+>P&u3&``<0eje++>G`00d&22+>P&o0JPR10fL41+>GZ02]sh1+>P&t3Aif>
2BXat0ekXE+>G\q1*A;-1H.p%6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>Yq8muT[1,(I?+>G]60etdI1("?q:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0f1"F@;[2C
0JYI-0f1pH1HI9F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's
3Zp@(+@KX[ANCqg3?Uq&DBL\g1,L+.1HI?K3\`;q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.;+A-'[+>PW+1a"M/3]/fV2)YdK$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[1,(I?
+>G`72)mWS0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
0H_K+@<?'A+>PVn8muT[1,(I?+>GW40fV3O2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>PVn8muT[1,(I?+>GW41bh$F2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>PVn8muT[1,(I?
+>GZ51bh$H2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>PYo8muT[1,(I?+>>f:1,M$G3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo8muT[1,(I?
+>>f:1b^sE3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
2BX,1@<?'A+>PYo8muT[1,(I?+>GQ20JGOD2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>PYo8muT[1,(I?+>GT31H.?P2[Tm!:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>PYo8muT[1,(I?
+>GT31cRNN0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t
3?TG4@<?'A+>PYo8muT[1,(I?+>GZ51bh$J1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>PYo8muT[1,(I?+>GZ52)I?L2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>PYo8muT[1,(I?
+>G]61GCjH0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
1*@]-@<?'A+>PYo8muT[1,(I?+>G]61H7EM1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Mm7V-$O1,(I?+>G`71c%0J0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>>Pn7V-$O1,(I?
+>GT31,1gH1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>Pn7V-$O1,(I?+>G]61,(aE3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>>Pn7V-$O1,(I?
+>G]61Gq3L3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u
3$9>3@<?'A+>>Pn7V-$O1,(I?+>G]61H7EN3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>Pn7V-$O1,(I?+>G]61c@BL0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>So7V-$O1,(I?
+>GQ21c@BP3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!
0d%T,@<?'A+>>So7V-$O1,(I?+>GT30ebXB1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qi
A7]p,+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>>So7V-$O1,(I?+>G]61,q<L3!p!":-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>So7V-$O1,(I?
+>G]61GV!I2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_K)F_PZ&+AR&r@V'R@+>Yhs+@KX[
ANCqf2'>A"@N[E[1,L+-3BB#R3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&+@:3bCh+Y`
F_tT!E]P=!2'=#0@<?'A+>>Yq7V-$O1,(I?+>GQ20etdH3!p!":-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP150H_K)F_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqf2'>A"@N[E[1,L+.0KLpI3\W>s8l%iS:JXY_
6<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS2'=#0@<?'A+>>Yq8muT[1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[1,(I?+>G]61,CsH
0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>Gl!8muT[1,(I?+>GZ51c%0I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ2@9cu:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[
1,(I?+>G`72)mWS0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0ea^m6t(1K3Zp13+A-'[+>PW+1a"M.3\`TT2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0H`trDBL\g1,L+.1-.6H
3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4
+<X'\FCdKU1,'hC@;[2C0JYI-0f(jI0fh'I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ1C=Hr:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp14
+A-'[+>PW+1a"J43\iNQ0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh0d'(sDBL\g1,L+-3BAuN3\WN#$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nD@;[2C0JYI-
0ebXB0KM!K$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t2]s52@<?'A+>PYo8muT[1,(I?+>GT31H.?P3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp14+A-'[+>PW+1a"M-3]&fW0e`qA
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[
ANCqh0d'(sDBL\g1,L+.1HI?I3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>PYo8muT[
1,(I?+>G]61GCjH0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1,9sp6t(1K3Zp14+A-'[+>PW+1a"M03\r`V0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf0d&qs@N[E[1,L+.2**QM
3\iDs$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17
+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E0fh-H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J2@9cu:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+3
+@]pO+>PW+1a"M03\iBM1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Pku+@KX[ANCqf1*B%t@N[E[1,L+.1cdEM3]&Mt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0JXb?ARZc;0JYI-
0f1pI3'&fS$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u3?TG4@<?'A+>>Pn7V-$O1,(I?+>G]61c@BL0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1GBpo6t(1K3Zp+4+@]pO+>PW+1a"M,3]&`U2)u!N
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[
ANCqf1E].u@N[E[1,L+.0fh$C3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>So7V-$O
1,(I?+>G]61GV!I2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1Gg3s6t(1K3Zp+6+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqf2'>A"@N[E[1,L+.0KLpD
3]&f'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K
3Zp+6+@]pO+>PW+1a"M,3\`QS0Ja&.:IJQ.@WQ+$G%G2kATDg0EcYT0G]Y\u:-pQ_8l%i^Ddmd!
Ecu#)?Y+7uDfTnAF"Jsd@Wc<+Ci<r/@;]TuEb0<2Df0W-F"Rn/%15is/g,L^FCB33/T55QDdmd!
Ecu#)/S/sCDfToI%13OO:-pQq4X`$6+CfG#F(dTWDf-\6AS5_!Bl.:#AKWC3DJUaE@<-"'D.RU,
+=LuCA1q[T0Jk3f$;No?+>Pr"9jr&b1,(C>+>GZ52)%'G1^sd$$6UH6+<WK`1*C+FC`k*9FXIV*
_R"8kDJLA+EcQ)=3Zr<V@ruSt$Gs+l+<YT<+D)`=+<VeEF^f6)@ruT2GqKO5%15is/j2BH0e"5W
Bm;Z]D/Ws!Anbge+EV:.+Eh=:@N[(0DJXB*@<,jk.3N_N+DG_7F`M%&$;No?+EV:*F<G"0Gp%!I
Cht58ARTUhBHV,*F*)IGE,ol9ATDU4+E)41DBO%>+Du=<C^g_H67sC&@:F%aF"SS7BPDN1AncL$
F!,R<AKZ#%DJLA+EcQ)=+>"^XBOr;rDe*Dg$;No?+EqaHCh+Z%@<Q3)AmoCiARlp%DBNk>BOu3,
@<-"'D.RU,+E1b2FCfK1F"AGF/nZdZ1E\FqA8Z3+-Xq"4-Qij*:-pQUGA2/4+Du*?F*22=ATJu<
Dfol,+D>2,AKYSnBl%?k+:SZQ67sB'2]tD*EZd+k0Jst-1cd<I3\iE!$4R=O$;No?4?Y)J.3N,@
@<6*C+EqL1DBNA0FCf<.FD5W*+EVNEEb/ltF*(u6+CQC3Eb-@c+>kc*1^sde67sBkBk)7!Df0!(
GqL3^<+oi`AKY].+CQC6Df'&.@VK^gEd8dADI[U%E+*j&@VKXmFEn<&:-pQUBOu3q+>"^HBk)7!
Df0!(Bk;?.@rc-hFCeu*@X0(g+>kc*1a$=I+Du+>+EM47G7=mS67sC&BPDN1ATDg0EZcqVBl7Hq
@psIjF!,@3ARloqDfQt;DfTD3Ec5E0F*&O9EcQ)=%15is/g,7V@;p1"DJ()+DBN@1An?0/Ec6)B
Bl7L'/e&._67sB93?V%)EZd+k0Jst-1cd<K3\rN#$4R=b+<Y]9B4N,4C3=E0-T`\c3a?E.Eb&lo
FD5Z2@<-'nF'NToFDYH#DHppbEc,H1D..-r-OgF"ZXduk@;0U%ATDg0E]P=X?ZK^dA.8m_ZQLA5
Ao_Ho4Y@j"+<YE+Eb/Zi+D<iK%13OO:-pQr4t&08+D,>43ZrNXAKY`"Bl%@%+Eh=:@WNZ#Eb-A2
Dg*=6@;KakA0>u-Ec6)5BHU`$%15is/g+S5G%G]8AKX#p+EVX4E,]B!+DG_8ATDBk@q?ckDIaku
Cht59Df?h8AThX$+Cf>1AISuA67sBQ:IH=LDfTB0+CT;%+CT)-D]j.B@;p0sA1euI<+oue+D#S6
DfQtEBl%T.F*),4C`mY+@s)f$$;No?+D,P4+DG_'Df'H%FD53#AKYGrDIIR2+D,>(ATJu'F`\a?
F!,@=G9CjFDfB9.Cj@.FEa`p+ARmD&$4R=O$;No?4?Y)K.3NhTDf02K+=Lc7F)WQNA8c%#+Du+>
+E2@>E+O'+Gp$X3F)Yr(Gp%6IBk)'lAKYMlFCB9:E+O)"$;No?+>b3,E,m'V0JG@,0f(jH1HI?I
%13OO+<VdLF_!Wr+E]^f-Zj$9F!,1<+E_R9@rGmh-OgD*+<V+#+<Ve;@<>q"H#R=;F^tpgF`(o'
De*Dg$6UH6%144#+E2IF+=D;B-OgF#R_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\K#<8ZKYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[E-67FBl5%F5/OX@F`)!3ZOI8ZJA[&X
J]!/YKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\J]!/YKYrJ\KYs2e$6UH6ATD4#
AKW@CA1%fn0b"I4+<Y<.F<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_S6Ne_Qtu6ZS<SHDfTA:F"&5BAS,XoARrZa%1:"'_h>pY_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>pq%144#+E_3($?TrqF!,1<+E_R9@rGmh%144#+Cno&@<?d6AKZ,+%175q
Bk)'lAISth+<V+#+<Ve;Ble59-ZrrI+AP6U+EM47F_kS2A8-+(CghT3FD,5.5uU-B8K`1fEcYr5
DBNP0Ci"$6Bl7Q+8g%V^DK]T/FD5Z2Et&JoR_sfrK#<8ZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYkJ5$Gs,'_QtCX:IH=:EcQ)=3ZqsEAnc-s
FD5Z2+D,%rCisc0_Qs[Y_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>pq%13OO:-pQr4t&39+D,>43ZrWbEbf_=Bl5&0@<?($+Eh=:
F(oQ1F!,C5+A*b.+EV19F<G(%F(HJ)Ble5nDJ<U!A7[GK0b"I!$4R=O$;No?4?Y)L.3N2BEc5tZ
+EV:.Eb-A-F!+m6Ci=3(+EMX5DIdI!B-;/6DdmNoD'4%:FD)dFDIIBn@psJ#.3N>B+EV:*F:ARP
67sB'A7]7e@<,pi+EM%2E+O)5@<,p%DJsV>@;L-rH#k*KATW'8DIm?$@rHC.ARfguGp!P'%15is
/j2BH1asPZBm;Z]%13OO%13OO:-pQq4X`0:+D#S6DfRl]-uEC.ALSaG@<3Q'@;0OlDJ()6D]i\(
DImisFCcS-Ec6)>F!,[?ASrW4BOr;sAT23uA7]Y#%15is/g+tEF*&O9D/aT2ARlp*BOr<!Ec6)>
+Dbb5F=n[Y%13OO+<YT5+=D;RBl%i<+BosE+E(d5-RT?1%144#1*BpZ+DkP&AKW@EDfTB#DfT]'
FD5Z2-OgCl$;No?4[(8O.3N5:GWHsWBOPdkARlo3D..3kB6,LEFDi:8@;]UlAKZ).BlbD,@<6!4
%13OO%15is/j)9F2CTb[D/aTB+D5_5F`;CE@<,p%DJsV>@rc-hFCeu*@X0):F`))2DJ()&F_u)=
@rc:&FE8R6ARf.kF(HJ,Ec<-KDIIBn-T`\'%15is/g+b7Bl%i5Df-\+DBNY2G%#3$A0>buD.P=B
%13OO:-pQr4t&<<+D,>43Zoh`F)>?$AT9.AD/Ws!Anbge+EVNEEb0*+G%De)DL!@9D/aT2ATJu+
Ec5e;DIIBnCh[s4+C\noDfTCu$;No?+CfG'@<?4$B-:i-Dfp#?+CT.u+EM[>FCfM&$4R=O$;No?
4?Y)O.3N2BEc5tZ+=LuCA79+^.3N>AE,ol9ATDU4+Co2-E,8s.F!,O<DJ*cs+DtV)AKYJr@<,dd
FCfJ8Ch[s4+CT;'F_t]-FE7lu:-pQU1-$IPDg!6Y0JGF.0ebXC3BAuS%13OO%144#+DPh*@:s-o
-Y.:?@<<k>+AP6U+CfP9F!,@/D.O.`ifoD]P^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP`Q=]ifo$Lifo&SP`4UdJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXOQ)LV%1;*ZJfs';K&W#H:18!Nifo$_@<?''7VQmaF<GOFFQ/O:6t(@^+D,Y4D'2;^
EcZ=FE-69^P_);3FCcRg@<6N5E-69^P_);3H#k*?Ec5e;9OW!a+E2IFifo&SP_'>Oifo$;ifo&S
Pap`tJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
Pe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
Pe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXUuIVj%1;*ZJfs';K&W#HA0<!;
ifo$M0JGF>3AE6@1a!n`+QAW;2`W!'+<VdL+<VdL+<VdL+<VfdP_(YE0K1[G0ek:;+<VfdP_(hS
+<VdL+<VdL+<VdL+<VdLifo&SP_'>Oifo$;ifo&SPa(0lJDufDifnuQP^qbX[,R=#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXR,X?^%1;*ZPi@pXifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDuf\%144#+:SYe$6V)H+DPh*@:s-o-Xq.=@<?Q<%1;*ZN8g(PifpP(P^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufT%1;*ZJhc8LK&W#RifnuQP^qbXJDufD
ifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufpifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifoPaP_'>Oifo$;ifo&SP_)Y=D.V^kJja$hAKXHVEcZ=F
E-69^P_);3H#k*?Ec5e;7VQmaF<GOFFQ/O:6t(1K+A?3bF<GOFFQ/O:6t(@^+D,Y4D'2M\F*&OD
F`cW-K&W#H%1;*ZJfs';K&W#bifnuQP^qbXJDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
Pe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifp7u
P_'>Oifo$;ifo&SP_*?e+<][.Jhf#62_[6H0eP:;+<VfdP_(hS+<VdL+<VdL+<VdL+<VdL+QAW;
1,(C@0KCjB/i5:*+QAW;2`W!'+<VdL+<VdL+<VdL+<][.K&W#H%1;*ZJfs';K&W#ZifnuQP^qbX
JDufDifph0P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDug#ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPdKG7JDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifohiP_'>Oifo\eP^qbX[,R=#ifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPaDme%16igA79+^+?MV3A92j$F<GU8@OE9@:-pQU
DegJ-DfQt:BleB;%13OO1E^FNA79+^+FPjb1E^4GC`k)Q%13OO%15is/j)9F3%5t]EcQ)=3Zr6W
@:X(iB-9fB6m-#_D/^V=@rc:&FE8R:@;0P!+EqL1DBNt2F*)>@Bl7Q+A9Da.+EM%5BlJ08%15is
/g,@PFD)e7ATo8=Bl.F&FCB$*F!*%WDJsV>@q]F`CM@[!+D,P4+E)41DBNJ(@ruF'DIIR"ATJu&
F<GXCD.Oi/DeX*2%15is/g)i*+AZKh+>PW*2'=S53\`?M1,04F%14d43\V[=-Y#1jC2[W9C2[X%
Ectu9D/aPLD.RZ=Bkh]:%13OO+>,9!/g,(LBlnH.A0>u*G]Y&\/hSac$4R=m/LrD)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$@FOT+\GNu+D#S6DfRl]DJpY.Bk)7!Df0!(Bk;?.DfB9*
HjpE5/LrD)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/I^$7d\Y/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+.h)i50RP$9:IH=:EcQ)=3Zr<Y+Co1rFD5Z2@<-'nF!,C?ASul)$7d\Y
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+.h)i5Ch7KsFD)e.EcQ)=3ZqsO%17J*+<Y;[
/jr9/:/+Yo?Y"(Z@6H4c+<Vdp:-hTC?XI>^%13OO:-pQr4t&B>+D,>43Zr<YG9CC/ARfLiDJ()(
DfQt=E+No0A8,OqBl@ltEbT*++DG^9E-682Ci"37%15is/g)i*+AZKh+>PW*2'=V13\`TT1-#dN
%15is/j)9F3@Q(^EcQ)=3Zoh`Ci<d(.3N>B@rHC.ARfguGp$^8@:sX(F)Po,+Dbt+@;I&pF)u&.
DJ`s&FE8RHD]j1?EHQ2AARl5W:-pQUBl7HqEb/a&+D5M/@UX(o+CT=6@3BE$G\(D.@<6L(B5VQt
DKIKR+@^9i+D#e+D/a<&3Znk=:-pQU0KC7O@rrhK0JPF-0etdI1cdHJ%13OO:-pQUFD,6+AKYE%
AKYl/+Dkh;ARlolF)u&.DJ`s&FE8Q6$>jL%ARnAMA8-'q@rt"XF(o9)7<3EeE]lH?+?CW!%14LX
ATVU(A3k6KF_t]-FE8lo/g)hW$7KM/DIY+Y3ZqWL.j-Mg.Ni"+$7QDk%15is/g+kFE,ol9ATDU4
+ED%8F`MA@+Dkh;ARlolF)u&.DJ`s&FE7luB5DKqF!)iIBm=3"8T&'QEb/a&6$%*]B5U.YEc5tG
%13OO:-pQr4t&E?+D,>43Zr9RG\(D.Bl7HqEb/a&+CT>4BkM=#ASuT4ATDg0EZet.G\(D.%15is
/g)l(+AH9i+>PW*2]sh23]&WR2)bsO%13OO:-pQq4X`$=.3N2BEc5tZ+Dbb0AKYf'D/")7AU%]r
ARo@_+Dbt)A8,po+E)(,+A,Et+CoV3E$-Q<@qdA$$;No?+>>Vp9jr&b1,(I>+>GQ22)I?M3=Q<j
67r]S:-pQU7;caPDIkjOC,mn'/ho"o2DeicGVUp_@<-R+D@HqJ67sBIF_PZ&3ZqpND/Ej)@qf@f
0/>4:1G(:9/M]7a0f;!I2EENN04Sg,DJ(OU1bCC50J??u77B[/0b"Ib67sBSBju*kEd9\g3A*-@
1,'.E:-pQU;03pP6q'-Z1+k751G:X=1+kC32D-a;1ark@:-pQU:i'Q^AoD^,3Zph!Ed)58+>u%c
$;No?+A$HlFCB!%ATBgSC,mn'+DG_7FCB!%%15is/g*`'F*(i,Cf"P^BK@7hF`V,7F"_9HBPq9f
CLqN>C,Rn%C,mn'%15is/g*N"DKK;sF?1OgGBYZSF)PZ4G@>N'/n8g:%13OO+<Vdq:1$CiCghU-
F`^tF3&!9H2Ea)U2`<K81,'t$9gqcF?V!aU:+&+N;aODL?V*X54"!`k9grDV9.)eK;aODL?VEaa
<*rBd9gpEk-W<?16=32R;H$P%:-hTC-T`\G;FaVl8OOpf-UVfiFE1f"F=0-t;aODL?VNme;I<Hr
:a\=P;aODL?W'<[6si>]-T`\E=@5J`8OOpf-Uh-)6sik`:Jt/!<(0ng-T`\M77BmW77KaR6rYNq
-V[#u9OC4^8Om,e=\qO74"!`k78.&_6W?rj;H$=<4"!`i<)R'k78lQ$4"!<n;d!I!6mk&D5u^cc
?UR=]6ROrC;IsfcEcaZeA7\,KART[l6t(1K-T`\RAT2R.F@0tWAP?NRFB*9j@<?'.4")d.0I](2
0i^_'7l<%h7Q!+P4!u^90JG1;3&<?<4!ua?1,h-L0JOq:-Uqff@q[5O-V\#iBl&'4-T`\00eb:8
0JG4/4"!QR1Gpj64")X-;^X"U-S[>/0fLa@0JPL/0etdD0KLmA/het5+@/^L4!uC;-VeT%+@1'i
BkM<pA1'Gd0eY771,(FB+>GW40JGOA0J5%50H`YU-T`\R8LHSI78>]o-T`\E:,O^J;FO/P+EoJ+
G&h4<6?6ih4!uC;-RUu'-T`\'4")d.0I](21f6(g91Cm.=Z/#_4!u^90JG1:2)R-:4!ua?1b^gA
2)-I?-UD9g-T`\D@<-:&-T`\00eb:80JG4/4"!QR1Gpj64")X-;^X"U-SmD22_Qp?0fU:11-.*C
3\W6?0JG1'5tr^g-UfmP-T`\S78P+IANCr"Cht4iFD,6++B(^*+@UHbDKKqB-quuMDf0B:.472)
1bUR:1,(FB+>GW40JGOA0J5%50H`YU-T`\C81-JH78trp-T`\E<%p!K/KdN'Df$UrEckq96>UdU
-T`\'4!uC;-RUu'-T`_1,VUZ/-T4pl1e1G&6rbp!-T`\00JG180f1UC-T`\12)I0I1Gpm74"!=)
Gpb[$87?U^Bk8YR-SR8/0JG170df%1822nX0IJq1/14@D.6An50/>I>1,(FB+>GW40JGOA0J5%5
0H`YU-T`\E2)lsF-W<H1+ED$S+@0g[+A[)mATAnl78P*qG%GQ5F!)l*5p1)`Cj@HW4!uj<0eY:9
0fU:11-.*C3\W6?0JG1'5tr^g-UUEP4"!Hr0JFk9-Ugug0H_qi7WNEa+B3B(AKX<UF_)p^-RUu'
-T`\'4!uC;-nlo#.6An3<Aug%7Pn.:2_laB-SR5.0JPCA2_ZU@-S[J:0JG=9/hRS?Hu*M6BlkJ/
EcQ)=/0JMKARfk)Bl7Q+D/X<#A0<QL3\W8t$@H8)F*VhKASiQ+Bl.R++Eq78+D#e-AS#C`A.8ln
+<VdL+<Vd\+Z_;34DJhDFD*%N8l%iO;H?1c9i+bA@Uj+)Bkh]:%17Je/N,Il+>7kYATDiFC2[d'
@UX%`E\D0GA1q\9A8lR4A9Da.F"_!4BeF+7Et&Hc$;No?4?Y)I0e"5VEcQ)=3ZqjJ@VKInF`S[D
F`_SFF<G16EZf4-CLnV9FD,B0DIIBn-OgDX67sB92'>2(EZd+k1,C%-2**QS3\WK%$;No?%15is
/g*T#B5)6p3Zr/t/i>78/Ri:5@50EM2DeicGVUprBl7I"GB43#:-pQU6?R!YA3(iCDf'?&Earfl
CbIOt1,CL91bCI<<&$6k0fM-J1,!-R@;]^00f:O:/N5=]9LVB>4Y[BQ:-pQU9PIsV@<-WS+?;&3
/hmeB:-pQU;03pP6q'-Z1+k751G:X=1+kC32D-a;1ark@:-pQU:i'Q^AoD^,3ZqL<DBLho%15is
/g*`'F*(i,Ch7WJ+DNnh2'?UNF*(i,C^g_H67sBPDKBo.ChupVFD*]X@lc8X2Dd'I/i=(F:-pQU
6Z6ja@:OC?+Er$R/o#HGAor6*Eb-k5Df#pj%16r\CLnV9FD,B0DIIBn-Ql/N/g+\CATM`:F<G"2
E+NHu+EVNEA8`T!DL$>;Bl7Q+%15is/g+kM-Z^DJDfd+3Ch7$q+EqL1Eb-A8BOr<)F`_SFF=\PK
AftN"Gq:(NDe3uB%13OO%13OO:-pQUHY%)*/T55QDdmd!Ecu#)/S/sCDfToI%15p-;cI+=De*Zu
FCfK$FCd3^$;No?:et"h?YXLiCh\!&Eaa'$+E27?F<GOCDe!@"F)Q(A-nR&#4ZWoWF)>i<FDuAE
+A#$g6Ua.!+=Jod3Zp+*$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3Zp131,L[>
0fNi%0etXC1^ZuE/g)_t/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.<)67sB[84c`V5u'gD
6QdKo+<Ve%67sBmF_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-Cht55@<?/i
:-pQUAoD^,BkCd`ATVL.+<VdL:-pQUAoD^,@<?Q5BR+Q.EboH-CLq$!@;]TuBPD*mCh[NqFCeu*
Bl8$(Eb8`iAKZ28Eb'4u:-pQUB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>
+=MLa$;No?+DGFr@qB^m@ruF'DBL&E+AP6U+DG_8ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5
B*qC#/g+k?@ium:+<VdL+<VdL+<XEG/g+bEEc#6,+DG_8ATDBk@q?cmDf'?&DKI"CAU&;(:-pQU
F(KH.De*ZuFCfK$FCcR;:-pQUE,oN/@<,p%9OUn3=<MR'De!@"F(oN)+>"^WATVu9Dfp.EA8-'q
@ruX0Gp%<OBlmp-+E2@4@;TIiAI;1!/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2E+NQ&CghEs
GT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-ONU8/g,@VEb'!#F<D\K
+<VdL+<XEG/g,">CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![6K.1-DlDe!p1Eb0-1+=CW,F(H^+
@rH(!F(KB6+<W%?C2[X!Blmp,@<?'.$481;+?CW!.3Kuc$?U<6/db??/g,:XAKYE!Gp%'7DIdZq
+EM+9+DG^9FD,5.8l%htE,ol/Bl%?'AoD]4FD,B0+DkOsBPD?q$>F*)+EqCA?X[\fA7$HA-W!]0
7R^3Q779s<:..lF?YO7nA7$],A8a(C$6UHj84c`V5u'gD6XO8:De*ZuFCfK$FCefB3Zq6s77K^D
;FNuM5u'gD6XOPBDe*2^AScF!/d`^DF)>i<FDuAE+=Bu`77K^D;FNuM5u'gD6XOPBDe*2tDJsV>
F(KG@$>"*c/dc<)/g)Ys00gp5E+*WpDdt.A74p#3E+*X-ATBpd+?M9(+?V_<?SWaGCh=e<F(f-$
C`l\J8Q/GO:..lF?X[\fA8Gt%ATD4$AR?u9+>#0gATDj+Df-pO+>#2g6W,%;D_;A>+EMC<F`_SF
F<DrRF(oN)+EV:2F!,F1DIdZq3Zoe$<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f$6UI4D/XQ=E-67F
-VdH:762Q"A867.F<GO2DIdZq+E1b2BHV#$+CfP7Eb0-1+Eh=:F(oQ1+=JTgE+*X-ATB=L.3N>G
+Du+>+?hq21+kR>0eP1.$6UI4D/XQ=E-67F-Y[H@F`(o<+EM4-Ci"/8FE2XLF(Jd#@q]RoB-;D4
FD*]XGA(Q.AKYr#DIdZq-OOF&A1e4!@<?!m/d`^DF)>i<FDuAE+=BTU;GU1O+E1b,A8bs#DJsV>
F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?RH1lDIb@,.10$M6r./^:IITH6XO\@
1,fXL+^8]"A7TUg+EVO4D]ik1F*(\9C2[WqEa`p#Bk)3;FDk].?YXLi/oY]@.3N"j:IITH6XV$9
:IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IITH6XVMU$<1\M+C\c#
AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<62n$=Rg_+DkP4
+CT5.ARTU%Bl5&3FD,6++B2-):EXIfF*)IU%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=3+[)C
DJ*co3H[&uAp/300kb5TG;M3qG$dF@+A$GnFD,5.@WcC$A8,po+A,Et+CT5.ASu$mGT^L4ARTUq
Gp$[CE,8rsDBNV2G9D!G+EDUB+CK8%FCKB,Ch.'jEcYV@+A!\jF`VXIF)Y].F<G!7An?/q$6UH6
BQ&$6F!,")@Wc<rBl7Q+@3B0)Cht5'F_PZ&+DG^9@3BH!G9CI7G%ku8DJ`s&F<GL>Cj@.FD]iS)
F(9-3ATAnb+EMI;G%G2,FD,B0+E2@>@VfUm%144#+F.O,EcW@3B5\o:Bln#2FD,B0+Eh=:@P/)s
%14jC+CI<=0Q(KE@;fh"0K",jH8RT?E&;Yr3-]*mG$dF@+B<Ak@<?''FD,5.?t<\f@<?d6ARHX(
ATD6&FDi:9DI[L*A7Zm*BOr<(ATo87F_t]1Bk&9-H#R>9+DG_8Ec5K2@qB0nGA2/4+A*b:/iF.G
%14mD+CI<=@5i"D13dkYG^)2kE&]k'2/d;J13G9a2.&OT+AucoBldi.FD,5.A8-'q@ruX0Gp$O5
A0>>qDIIR2+D,>(ATJu8ARfgrDf0V=GA(Q*+EV:.+D>2)BHVA1A7]7ZEZet.Ch4`'F!+n%A7]:(
%13OO1bKnY4C;SUG%+ujASGj4F_5E3F_5c6AoKYH@Vdi-5%#L2AThd/AKYAiDJW]3+CK5$F*(r#
+EM+(FD5Z2F!,RC+DGY.F`VYF@<?''F`V+:De:,*@<6*)F(o/r@psC1%13OO2(g"Z4C;Z7H>IP5
12:uAAmomnF)GH00l8U$3&c"f5%#L#Df0W1A7]d(Bl.g0Dg#i4B-:f)DKI"FASGdjFE8R=DBNn=
Bl8$(A0>E$@s)X"DKKqP+B3#c+D,P0F<G^IARl5W+<Ve=DfQtADfp)1AKYK$A7ZlnDfol,+C\n)
@3BB#FED>1+C]8*A7]d(/KeVGE+NNn@;Kb*+EV:.+Cf>+DfTE"+EV1>FE9&D$4R>#/g+Oa?Y"Fq
EcQ1ZEFNT<1372H2fj%b3GEMH@Q7^Y?m&!KEc#`4BmO>5@rGmh+Cf>+DfTnA@;]TuAoDR/F!+n$
Ec6#?+CK#,FDPZ4FD5W*F'p,!DIaktE+*WpDe!/tF*VYF@<`o)Des?4Bl7Q9%144#+@C9lEb0-1
Cj@.FBOu6r+E1b!CLLjeF!,UHAKYMtAnGUpASuT4AoDR/F!+n/A0>B#Ci=?8/e&-s$9'R[?p%dS
E\KLj3GrhMH89>G2`5]!G^*nBD.70u?Tqj?;It#cATo81Dg*=GD]iY7Ci"A>ASkmfA0>;sC`mb0
An?!oDI[6g+D,P0FE8R=DBNn=Bl8#8:ddco/e&-s$90X\+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;j
F?*cP@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9m
Bl7Q+BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$=I(LDIb>@De*cl?k!HB:IIuc8l%i^D.GC\%147_
C2[W*FDk].+Dbb5FBp;:De*cnC2[W8E,K;;+CIf;6sq-::IItf$9^O84Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4
+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"Rn/<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-
G%G\:FD,5.Ch[KmFD5T'+E(j7@3BZ#F)*B;$:8cOGB7=<FD,5.Eb0E.F(oQ1+D>J1FDl2F+E(j7
FD,B0+D,>(AKZ)5+ED%:Bk;K2@q]:gB4Z-:%15C;F)NTPEb/Zi+Br5eBleB7Ed99SA7/[kBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E905,'@FDl2F/o>,J%172q
+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4/g*u,@;^-/A8`T.Dfd+>ARf:mF('*'
Cj@.?@<?($BjkglH=\]<$4R>M>@M/VBl5MEDe*cl?k!GP$8F.U?p%dU11W(VF_#_OD),aB3&c";
GVF5b3G*&O?Tqj?6Z6j`Bk1dq+CSekBl7Q+@3B0#Ec#6,Bl7Q+DfBf4Df-\>D]iG)@;BF^+EV:*
F<G4-DImisFCfM&$6UH6A8-'q@rri(AS,XoBln'-DBNP0Ec#k?GA(Q*+DkP&Bl7Q+F(96)E--.R
+B3#c+Co2,ARfg)A7]@eDJ=3,Df-\0DfT\($6UH6BlbD6DfTD3ASbpj@;^00@;]TuBOPs)FD,5.
DJ<Tl+D,1nFEMV8+E(j7,%P8)F`2A9DJ(.9F(oN)Ch4`*Bl7K)AU&01Bk(k!F"AGF/nZdG$6UH6
IXZ`p%144#+AP6U+E;OBFCeu*F*(i.A79Lh+D#e:Ch[BnF:AR"+<Y]GG%>/o4ZX]A+?CVm?!o'U
<D6(\5uL?"?R\5m-n$WE;cZXn9M?l^/NP=S3\V[=4"akq-8%J)4?G0&1*Cii%144#+AP6U+Co"*
AoD^,%144#+EDOHA7]7]A3DsrH[?l@?mncM9MA/H;G/3@.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>
/mg@\/j:C?4"akq+F,)XI16N++<Z,^IXV_5+<Ve+BOr;rDf0`0EcYr5DBNP3Df$V<FCB&t@<,m$
AU&01Bm=?6+EVNEA7QfsF!,OGEa`ZpBQRj)Ed(r4A0><%+Dbt6B+51j+<Y*6+EV:.+Co%qBl7X,
Bl@l3A8c%#+Du+>+E_a:+CT/5+E(j78ge[&Eb0<'Ecu#)+CT;'F_t]-F<GI0D.Rc>%144#+CK=7
Fs(WEDI>(>+@.,[BOPdkAKYf'CLnW1BPDN1GAhV?A0>;sF)N18D/`onF<Ft+De*ZuFCfK$FCei&
@Wcc%$6UH6Dg#]4@;Ka&GAhV?A0>_tCLnV\+Cf>#AKYl)@qB['FDi:<Df9D6Blks:$4R=t/g+Oa
?Y+4eC34B*@52J>H>><K0l&^a1O1`n@<Q!A?m%gTDKBN&ATAo%A7TClB-:V*DIn#$$6UH6?t=4t
ATV<&DfBf4Df-\*7ScoL786'H<(0\]5u^B_+EV:*F<GdACht5.DJE`mF<G[=AKYK*EcP`/F:AR"
+<YN0F*(u6+D,>(AKYr#FD)e2DKKe>@3B)p@ruF'DIIR2/g+,,BlbD8E-,f4DBO.AF_kS2@;L$s
EZet.Ch7Z1FD,*)+CT;%%144#+EM+9+AtWo6r-QO=WhEr+A,Et/g+)2D.Rg&Bl7Q+FD,*)+A!\s
FE2)=AKX`D<$5.9+@K!J@Wcc8Bl5&8BPDN1@psFi+DGpFEt&I!+<Y60FD,6++Eqj?FCcS'+D,2/
+C]V<ATJu9D]iI2Anc'm+Co%nCgh?qA0=c=5t"LD9N`KVEZfC6@WcC$A0>u-AKYMt@ruF'DIIR2
%144#+D,Y4D'370A9Da./g+,,AKYhuBl5&9F(HJ<Dfol,+C\n)FDi:=@;BEsBlkJ/@<6-oEZfIB
+Dl%?AKYMt@ruF'DIIR2+Co2,ARfh#EbT*+%144#+CT;/F`(_B+@C9lEb0-1Cj@-q:IH=GASl!q
@V'S$+EqL1Eb-A8BPD?sF!+n3AKYE!A0?)0Bl7L'+DGF1FD,62+D5U8D/"'4Bl7Q9%144#+F\cg
ILQW,+<XEG/g,1GE,8rmATJu9BOr<*F`\a:Bk)7!Df0!(Bk;?.E+*j%+EqOABHUf-EcP`/FDQ4F
DfB9*+DkP.FCfJ8E+*j%%144#+CoG4ATT%B7ScoL786'H<(0\]5u^B&%144#+F\cgILQVn$8X:W
?p%e*CjKi7DDlYtAi!n,EATRh3-T1bFa>u'?Tqj?6Z6j`Bk1dq+D#e>ASu$mDJ()"Eb0<6A7-O%
D]j(3FDl22+E1b0FD56-Cgh?,@UWb^F`;CS%144#+@C9lEb0-1Cj@.;F<GU8F*)>@ATJu9BOr<'
Df^"CEb/`lDKI"1@:O(qE%W8!CiaMG+Cf>-F(o/rEZek*ARfLiDJ()6BOr<"@<6*nEt&I!+<Y3;
EbTE(+ED%7FDl22/g*_.GA1l0+E2@>@UW_^Gp$O3Ci=M?BOPsq+D,%rCisc0+EVNEEb0<6DfTD3
@Wcc8F`V,7F!,O;Dfol,+DYk5G7=m%+<Y`DD.Rg&Bl7Q+BOPs)@V'+g+EM%5ATqj+B-;D4FD)e=
BOtmu+C\bhCNXT;/e&.1+<Z,^IXV_5+<Ve%67sC$ATMs3Eb-A&@:O(qE$-tm%144#+ED%7FCZLA
@VKpoBP([_ALBPr1(=R5+<XEG/g,1GF*)>@AKYGj@r$4++>bhrBkM=%EbTE(+D>2)BHV/+F)>?-
@q]Fp%144#+ED%7FCZLA@VKpoBP([_ALBPr1*A;1%144#+F\cgILQVn$8a@X?p%dP@W=DO3I,[f
1N@OnF>bn#Bk(sn1,iih?Tqj?:1\VlDKTf-EbT#+A79RgFEqh:F!+n/A0>;'@rH7.ATDj+Df-\?
FD5Q*FEo!:@kM.3@<,p%@V'7kB+51j+<Y*'A7]9oBl5%c+?;&4+=K!!1,N`SDD3gp+EqB>DJs_A
BOQ'q%144#+CHj:DKKH&ATBLYBl8$(B4Z*=055<GAS5Rp1bWHWDdda%DJ(^XAo)BoFD5W*1bWHW
Ddda%DJ([^?m'Z,ASu(&ATAo8BOu3q+CT;%%144#+Cf(nDJ*O%+EVNE@VK^gEd8dADKKH1DII@&
+DGp?Bl.ft@ruc78l%i-+<X6'G%De)CiX)qA9f;2BlkJ++Cf>-G%G]8Bl@l3E,oN"Ble!,DBNM2
Ec5tN%144#+B3#c+EM+7Bjkg#A9Da.+D,P4D..N/F`V\6Ci"A>GAhM;F!,+6Bl7Q+AoD^6@<,m$
@Wcc88K_GY+Cf>-@qB[uARlol@W-C2+CfG'@<?4$B+51j+<Y3;D/^V=@rc:&FE8RHBOQ!*GA1l0
+Du+>+Dbt)A0>T(+E)(,ATAnc+Eh=:F(oQ1F"SS:Bl%T.BOQ'q+EVNEA7]puF(HJ8Df'&.F(8lp
D.O.`+<VeKD]iP.E+LX2$4R>"/g+Oa?TDn:1N-k]EHQ"T3H'.RD/2!cAns)CA27LU?m%gTDKBN&
ATAo%A7TClB-:V*BOPsq+EM7-ARf.h+D,>(AKZ)5+C]&&@<-W9@UWb^F`;CS%144#+B*!!+Du==
@V'RkA0>80/no'4?m'&qCh7Z1@<,p%@rc-hFCeu*@X0))+C\bhCNXSK+B3#cGp%0ADfol,+Dtb6
ATAo&AKYDtFCfK(A0>?,+A,Et%144#+CSnkBl5&%DIal!ASH$p+C\bhCNXT;+DG_8AS6$tFEo!C
F!+t5Bln'!@;IP=<+ohcF(o/r@psC#Anc'm+EqaHCh+YtAKZ&.D/a<&+EV1>F<G10Ch4%_+<VeN
Bln#2;b02+1,Us4BOPsqATKCFBeEsL%144#+F\cgILQW,+<WKrC1CpcF(f-+/p)>[%144#+AP6U
+Cf>#AKW]d+E)-?@W$!)FCfN8F!,R<AKYGj@r$4+F!+n(@;0V#F<G7*F(f-+%144#+>Get@W$!)
-S?bU$6UH6IXZ`p%13OO2D-+[4C:$nBJVS_3GWGG20WhHE,%3`@X<*8DJ_@?5%#L#Df0W1A7]d(
@:Wn_DJ()#+D>2)BHV5&C1Ums+D,%lBl%L*Gp%3B@<<W9Bl%T.F*)>@AKYD(;b02+1,Us4BOPsq
+EqL1DBNn@FED57B+51j+<YT3C1UmsF"SS,+CT+0FD,B+CM@[!+CT/+FD,6++E)4@Bl@l3@rGmh
+CHo_?m'Q)@<<W9Dfol,+Dk[uDBO"BDfTD3@3B5lF(c\7D@Hpq+<Y'2F`_"6DfQtBATMr9@3B5l
F(c\7DBN>"ATV;h$6UH6IXZ`p%144#+<XEG/g,@VEb$;,F!,FEF<G"0A0>;'BOPsq+DGm>F*)>@
ARlotDBN@1Eb0<'Ecu#)+EM@;F=n"0+<VdL0H`)/+E2IF+=DAOEb$O,$6UH6+AP6U+D>2)BHV#1
+Cf>,E+*cuA0>u4+Eh10F_)\9ATVs,AThWq+>"^IEcQ)=+DGF1D..NrBHUnqBl%iC%144#+<W?\
0fL4fATT%BGAhM4-OgD*+<Z,^IXV_5%15$H+CI<=@W-@*1NYBqA9<#SBlmoECMS3@BeV7uG$dF@
+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*Dg-7FAnc'mF!,C=+CoM,
G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6+DGm>De<T6+B3#cEb-V>
+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!$6UH6A9)C-ATJu'F`\a6
An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7Ch[Zr3XlE=+<Z,^IXV_5
+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0/no'4-OgD*+<Z,^IXV_5
+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\ABl7I"GB4mJH#n(=D0$hD
BOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&AM7V.BJ4+EDfTB0/no'4
?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/%144#+EqL1DBMtV:*=7l
+E(k(/e&-s$90X\?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?<+U,m+CJr&A8Gt%ATD4$
ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>&/g)9E4C:$+DgGu<EG0<;
F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5Cggdo+CT.u+DG_7F`M%9
FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdkARlotDBNt2@qBP"+A*c"
ATDj+Df0VK%13OO0eb4&+<Y&S?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A?m%gTDKBN&ATAo%
A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;+EVNEEcl7B8l%ht
FCfN8F"Rn/%14gE/g)8Z?p%e,0k>B<CLf.VH#RqC@<?BsBJOO82/%2P?Tqj?6Z6j`Bk1dq+CT)&
Dg,o5B-:T2045o2F!+m6E+*j%+E2@4AncK4Df-\7@:N)3+CT.u+A?KeFa,$MH#n(=D0%<P<+ohc
BQ%a!+Co2,ARfh#Ed8d;Df0`0DKKT2DBNk8+EV:.F(HJ8H#n(=D0$h6F!,L7F)Y]#FCeu*@X0)(
A8-'l/e&-s$=I(LDIb>@De*cl?k!HPF_PZ&C2[WnBleB:Bju4,Bl@lE0ht%f.UmO7Ch.:!A7TCq
FE2))F`_>9DBO!P/KeYJCht4d:IH=9BleB:Bju4,Bl@l3@WcC$A1e;u%15is/g+YEART[l+EV13
E,Tc*Ed8dODfTW-DJ().De!3lAISuVDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eO
De*="Bl%<?3B:G03Zoe95s]7(A7B[qCh,Od3@>qR+Cf>$Eaa$#+?V#;5s]7(A7B[qCh,Od3@>7C
@rH(!F(KB6+=Cl<De(4)$4R>;67sC$ARfY!A0>f0ASrW$Bk)7!Df0!(Bk;?.@;]TuDfB9*+A,Et
+Co1rFD5Z2@<-'nEt&IpDf7d"+FPjbA8,Qs0F\A-A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-Y
A1&`6$4R>;67sBnATT%e:IH=7F_PZ&+E_d?Ch\!*ATJu&DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8
Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<pDe(4)$4R>;67sC%ATT&*BleB:Bju4,Bl@l3A8-'q
@ruX0Bk;>p$>O*^BlZ?t+=BcW6psg<6qL9!8l%iR<'a#C6qL9!8l%iF8Q8)L;BSS-6rQl];F<lO
<'a#C6qL9!8l%iR<'a#C:ddc@8Q$[':IJ,\5t=@3:I@NA;C;n\C1LjhE]lH+C1LjhEZcnU-Ql#W
6q9gJ6r-0<8Q$[':IIK:6r-QG8Q$[':IJ,K;Fs\a6qL9!8l%iD=B&3e8Q$oY%14LuA7TCp.6T^7
F(KH&F_PZ&A8-(*+>=63%15is/g+e<DImisFCcS*BleB:Bju4,Bl@l3F(96)E--.1$?^;u@<?'q
De*]nDJ<]oF*&NY%15^'6rm#M+C]J-Ch.:!A7KOpE,oN2F(Jl)8l%iR<'a#C6qL9<8l%iF8Q8)L
;EIKH6pX4/:JO;L;EIKH6rQHN8PiAS8Q$!)8l%iS:JXY_<_Yt)@WcC$A86$nFDl)6F(9-*E,oN2
F(Jl)8l%iR<'a#C6qL9<8l%iD=B&3e8Q%WB:IJ,K;Fs\a6qL8c$;+)^<_Yt)F`:l"FCf3*A7TCq
FE2))F`_>9DBMPI6rR&N7n#g;;EIKH6q9gJ6qL9<8l%iC:I@NA;@Nt*:IJ5X6m-VkA79RkC2[X(
Dfp)1ARoq#E-!-o:IJ,W<Dl1Q;cH%Q779^F%15^'6rm#M+ED%0ARTXkC2[W*8l%iR<'a#C6qL9<
8l%iR<'a#C:ddc@8Q%WB:IJ,\5t=@3:I@NA;EIKH6q9gJ6r-0<8Q$!)%15is/g+\9F*)G@Gp$R=
Bl%<&Ci<flCh4%_@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#(=K@WcC$A2uY1
?O[>O$4R>UBleB7Ed;D<A26(Q$>3pfATD3q05>E9+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hnt4+>"^*AR]\&@<-W92(Tk*0JYI--qIcfBR(^p
@n:$LBP([_AKXEPBln'-DCH#%%144-+CI`+;b1:I+CIl35u(f1@;]Tu?s6,l?m';p@rcK1DfBf4
Df-\-De*F#+CSekARmD&$4R=b.Ni,0E-#T4?m'Q"CLqQ0@3BH!G9CgCFD5Z2+CIZ7;F<lI5uU`O
;G]YY873Q^BOQ!*AoD^"ATJu9BOr:q$6UH6+E1b2BHV#,+EV:.+DkP.FCfJ8Anc'm+DG_8D]j.8
AKYr7F<G+.@ruF'DIIR2+D#_-D@Hpq+<Ve@Afu2/AKYr7F<G+.@ruF'DIIR2+DGm>?rBEZ6r-QO
=^Wj)<+ohcD..-r+E_a:+E(j$$6UH6+CIZ7;F<lI5uU`O;G]YY873QSF!,RC+ED%7ATT&:BOr<#
DKKH1DII?(E+*j%F!,17+CJ)95t"LD9Nba4$6UH6+Co1rFD5Z2@<-'nF!,R<@<<W*@<Q3)@V'+g
+Dl%?ARmD96"Y4MEZet4Earg$B-;/%FD,_<%144#+<Yc>AKYMt@ruF'DIIR2+Dl7BF<G%(+Cf5+
F(Jl)@;]TuEb00.ASu'i/e&.1%144-+<XTsA7]7ZEZet.Ch7Z1De:+j83ng_2)ZRj@<6*nF!+n3
AKYl/G9D*MBlnH.DBNJ4EbTE(+:SZ#+<Ve9@:O(qE$/P-@:O(`?m'B,ATD4$Bl@m1/g)9+DfQt0
@:O(qE$-tm+EV:.+D,>(AKY].+CI#]C1q$sBOu6;FEhn8%13OO+=\KV5p1&VG9C:&DJW]'DfBf4
Df-\2@<3Q#AS#a%Bl.g*ASl!rFCeu*FDi:3BOt[h+C\bhCNXS=Anc'mEt&I!+<Ve8B45LlF*&OH
BOr<"@<6*nF!,OGDfTE"+DG^9FD,5.F(o/r@psC#Anc'm/e&-s$6UH6+<VdL+<WBt+C]5)+=Ach
+<XEG/g)l-+?^i<5uU;`$4R=b.NfjAEb0<6A7-NtDg*=EATMs3Eb0;7E+*d/Bk):%@<*K"@:O(q
E-!.9DKBo2@:UL!Afti2F*&N6$6UH6+EV:.+DbJ-F<G%$@r$4+/g*GrF)NTP@UWb^F`8I8Bl%@%
+CT;%+Cf(r@r#Xd+CSnkBl8!6%144#+<Yc>AKYYpF(f-++DG^9FD,5.@rHC.ATMg/DIdI!B-;80
A7]7ZEZet.Ch4_tDIal3BOr:q$6UH6+C\bhCNXS=BlbD*@W-:/ARlotAftN"Gp$d/F(f-++CoC5
DJsV>D..NrBJ'`$+<Vd9$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(;+<VdL:-pQUEb0<6DfTD3CghC,
+C\bhCNXS*$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(V0ejdn:-pQUEb0<6DfTD3@UWb^F`8HX0b"I4
+<VdL+<VdLEb0<6A0<71DIIBn-Ta%;+>Get+AP6U+ED%7FDl22+DGJ+DfTQ0B-:Yl@r$4++D>2)
BOu5o$6UH6+<VdL+:SYe$6pc?+>GK&/i#:,6#^jYC`kPc+>PW+1E\)EE,oZ1B-9c`A8,OqD.RU,
F!*n^Bln'-DCH#%%144-+CK(uG@Y)(DJs_AFCArrF!+k$E-#T4+=C&U<'a)N5t=?k4#(+c@;]Tu
?t=4tATT%B5uU-B8N8RT4#(+c@<3Q%AS,@nCij_-$6UH6+EqL1DBNG0ART[pDJ()0ATo8-Bk)7!
Df0!(Bk;?<%13OO+=\KV5p1&VG9Cj5Ea`frFCfJ8?q<R^846HP:gbDZ@<3Q#AS#a%@:Wn[A0>u4
+CJr&A8kstD0%=DC3*c8+B3#c+Co%q@<HC.%144#+<YB>+>GDiFEMVA+E(k(+EqOABHSu]+BN5f
DBLYV@3AK>5qOiL2BZ[AF(c\1F!,FBAS,Y$ARlp*D]j.8AKZ&9@<-H4De:,&F_u(,$6UH6+EM%5
BlJ08/g+,,AKYT'Ci"$6Bl7Q+FCfN8F!,(5EZen8D/^V=@rc:&F<G:8FCf**BlnV]%13OO+<VdL
+<VdL+Cf)#BOPsqA8Q9m@;9^k?Q^_F@:WneDK@IDASu("@;IT3De*p-F`Lu'05>E9A7]p:Bkh]:
%13OO+=\KV5p1&VG9Ca2@rcK1EHP]+BkD'jEZea]:g$O[?m&rtA7Zls@<3Q#AS#a%@:Wn[A0>K&
EZdtsE-ZP:EZf7<FCep"DejDH+AQisAR]RrCER5'Ch7Ys$6UH6+Ceht+C\n)F*)>@ARlolF!+(N
6m->T@rcL/+EqOABK?S0+<VdL+<VdL%144#+<VdL+<Ve%67sC$ART*lDJsW.@W-1#+CT.u+EMXC
Eb,[e+<VdL+<VdL+DGe?DIPai+E_d<3$<6Q@:UK.DJsW.@W-1#/no9MDIOt&$6UH6+<VdL+<WK`
E-67F-Z3jEAR]RrCL:dpH#@(=4%W7O:-r;rC2[Wi4)&YZDIO%^%144-+<XWsAKYr7F<G+.@ruF'
DIIR2+E1b2BHV#1+Du+A+DG^9FD,5.BOtU_ATAo'Df'?&DKKqBDe:+a:IGX!+<VdLA9Da.F"SS)
DfQt3G[YH.Ch4`2BOr;oC2[WnAThH(A8,OqBl@ltEd8d@@<3Q"+E1b2BK?S0+:SZ#+<VdL+<VdL
4$"a(De*BiFs(O<A0?#:Bl%i<%13OO+<VdL<+oue+E1b2BHVM-F!,@=F<GOCAThd+F`VAE+EM47
GA]#U%13OO+=\KV5p0WZB-:o+FE2;1F^nun+DG^9G%G]8Bl@l3-o!>./i#43+D>2)+C\nnDBNG-
EcP`$FCeu8+@.,\AS,@nCig*n+<VdLD.Rd0@:s-oG@>P8Bl7F!EcP`$FDQ4FF(KG9Ch7$cBl7Q+
FDi:00H`832BZs]F<DqYGAhM4-RW:EAmoCiF`M&7+=L/[7n>']%144#+<VdL+:SYe$6pc?+>GK&
/i#7+7V-%LF^]<9+>Po-+>PW+1E\)EE-WQm@;KauDf-[dA8-."Df.!5$4R=b.Nh>+3A*!B+ED%2
@;TRd+EVNE8g$,H1a$4EA0>u-AKYetH#IhI+E(j73?^F<1a%!NF!+t+@;]^hA0>u-Bla^j+<VeI
AT;j,Eb/c(@3B&n@;]^h+EVNE?tsk&?m'Z,Bk(g!@rH4'F`_29+CQC)Ci<a(Bl7Q+G%G]8Bl@l3
DKTf*ATBC4$4R=b.Ni+e:eXGT8Q9(?G@>P8@WcO,ARlp+E$07@+>u&/+A$/fH#IgJDImBi+Dl%;
AKZ).@;[2G1a$=C@ruF'DIIR"ATJ:f+<VeFDBO4CF`JTs:IH=E@<?0*H#IgJ@<,p%A8c1"B-;86
D.Rg&Bl7Q+GB.V>B-AB,$4R=b.Ni,<F`_8;?m&lgC3=T>ARlp*D]iP'ARfKu@VK^gEd8d;Df'H%
FD52uCh\!:+>"^QBle?,A0>u-BlbD2DBNn=BlA#7G%G]8Bl@lA%13OO%14=),9S]n0J5+:+A-'[
F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L++?;&.1ad>eF`V+:De:+r
7nlfc-tm^EE-"&n05#-@Ch[?2DfTJD.3N5@EZeq<FCf?#ARlp&Eb/`pF(oQ1+DG_8AS5RpF!(o!
+<Ve?@<3Q*DKKo;A9DBnA0>;'@VK^gEd8dADI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.1a$4E
A0>i3BlA#7G%G]8Bl@m1+E(j78hLP[+<Ve!:IH=HFDl22F!,%=FCf?#ARlp&Eb/`pF(oQ1+DG_8
AS5RpF!,17+Co1rFD5Z2@<-W9@VK^gEd8d8C1_0rATM63+A*b:/hf*k$6UH6@ps6tEb/Zi+E)(,
ATAo)G][M7A7]9oBl8$(B4Z+)+C]J8+DGF18g$,H0JjnrEbTW,F!,%=FCf?#ARlotDKKH&ATDi7
FDi:0C1_0rATM5g$6UH6@rH4'Df0-(FE8RCCh.*t+A+#&+Ceht+Du*?Eb/Zi+Dbt6B4Z*+FD,6&
/g+,,BlbD?ATDj+Df-\+A7Ta(@q]F`CNCV?D]iG,F`_"B%144#+CJhuDdmcq+CT.u+CJ`!F(KH$
+EVNEE,oN5ASuT4FD,5.D/"')@;]UlBl7Q+De:,0AToeGCh+YtBl7@"Gp$X+FC?;+DBNJ(@ruF'
DIIR"ATKI5$4R=b+<X`O;GKeY7lhc7D]j1AB6%EkAKZ)5+EV:2F!,X;EcYr5DBNk0+A,Et+ED%7
ATT&?Dfp(C8l%htD..L-ATAo*Bl%?'@X1!D$4R=b+<VdL+<VeCDdd0!-YI".ATD3q05>E9-OgCl
$6UH6+<VdL+AP6U+C\bhCNXS=H#IhG+CfP7Eb0-1Cj@.DAS5^uFCfK(A0>Ds@ruF'DIIR"ATJu&
DIal2BQ\D>8g%Y_GA[is+<VdL+<VdL-nui`Bk(p$2'?gJ+=ANc+D,h<Blmo/C2dU'BHS[O@:Wne
DK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$6UH6+<VdL+:SZ#+<VdL+<Ve%67sC$ATMs%
Ec`Er+CT.u+D#S%F(HJ9BOr;uBl%@%%144#+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4Ysl
Ea`c;C2[W9C2IC#FCfJFBkh6-%144#+<VdL+<Y9-Eaa$#+DPk(FD)dEIUQbtDf0VLB4YslEa`c;
C2[W9C2[W8BkhN5%13OO+<VdL+<VdL:-pQUEb0'*@:UL&BOr<,AS5^uFCfK(A0>Ds@ruF'DIIR"
ATJu5@<lR)B-:W)FCf?3Bl@l3%144#+<VdL+<XEG/g,7S+CT/5+C]&&@<-W9Bl7F!D/`p*Bjtdm
BlnVCD.Rd0@:s.m%144#+<VdL+<YK=@:UK.B4YslEa`c;C2[W1%144#+<VdL+<W?]3\W6B+?XCX
@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgCl$6UH6+<VdL+AP6U+EVNE
F`V+:Derr,-t6b"DfTD33A*!B.3N/8@ruF'DIIR"ATJu>Dfm1HBl%T.BOQ'q+EVNEF(KG9FD,6&
+:SZ#+<VdL+<Ve%67sBY76s=;:/"e5Bl5&%DBNk6A7]d(G%G]8Bl@l3De:+a+CT.u+EV:.DBNt2
B5)F/ATAo-DBMOo3A*!B%13OO+<VdL+<VdL:-pQUF(KG9A8,OqBl@ltEd8d*76s=;:/"e5Bl5&%
DBNk6A7]d(C(1Lm+<VdL+<VeFA0<7<Ch.'j@rs(-$6UH6+<VdL+CoG4ATT%B;FNl>:JOSd-OgCl
$6UH6+<VdL+AP6U+EV:.DBNY2+CQC1ATo7F8g$,H0Jk:/+A*bsAS5^uFCfJ8%144#+<VdL+<Y]9
B4N,4DerrpBk)644""N!06_)@Eb-nLDfp(RA8,Oq055JT%13OO+<Ve%:K0bD+DGF1H#IgJ@<,p%
Df0B:+DG_8ATD@'FCeu*Bl5&6F`))2DJ()%F`MM6DKI!n3A*!B+CT.u+Dtb7ATA4e+<VeMATDj+
Df0V=De:+a/g+;8FWb1&DBNJ4D/^VCDfp(CA8,OqBl@ltEbT*++CT=6A9Da.+EM%5BlJ08+CT.u
+ED%0Ddd/c$6UH6FD,6&+DG^9DIn$.Gp$U;ART[lA0=Je3A*!B+Co1rFD5Z2@<-'nF"SS7BOr;Y
:IH=B@;^3rC`m;6E,8rsDK?q6Dg*=GD]iS/+EV:2Et&I!+<YB9+EV:.+=^?5Ec,T/B-9fB6m+m?
D/^Ur@rc:&F<FP'Bk(q".Ni/=E+NotBm;6Q%13OO+=\L++?;&.1ad>e@q]:gB4Z-,FDi:DBOr</
F(HJ4Afu2/AKZ#)B6A$!EZeq<E,oN2F(oQ1+Dbb$Eaa!6+CJ#5;FN?K+D,P4@qB0nF)Po,+:SZ#
+<Y*'C3=T>D.RU,F!,RC+CK57F'pUC<GlM\De*E%@q]:k@:OCjEcW@3Eb-A8F`MA2A0>f&Afu;3
FD)e)Ed2_KAiLne?m'E/BlA#$$6UH6FDi:0Ed2Y5+EM+&EarcoF"SS7BOr<-ATW$.DJ()5BQ&$0
A0>>m+ED%7FDl22A0>;mFCfJ8?ugL5?m'K4DK?q0F`\`t+EqaHCh*t^+<Ve8A9M[.AKYJrARfLi
DJ()(DfQt1EbTW0@ps0r@rGmh/g+,9Ec,T/B-;,)Aft)kBk)'lAKYhuGp$p;D/")78l%i&F!+n#
Bl%L*Gp!P'+<VeKD]iS%@;I'1Bln#2F)Po,+CoD#F_t]-FE8R6F`\`u-Z^D1DJ<U!A7Zm)F`;;<
Ec`F;@<3Q"Cj0<5F!,F1Ecc#(Cb?/(+<Vd9$6Uf@?o9'FA0<6I?m&lgC3=T>ARlp*D]j+>Ec`FE
AS5^uFCfK(A0>Ds@ruF'DIIR"ATKI5$4R=b.NhW#B4Z<1ATDg0EcW?OATDg0EcW@;DBO%7AKZ#)
B4Z<1AU&07ATMp,Df.!HDJs_A%144#+EVX4E,]B!+CT.u+Cf4rEbT-"ARmhE-Rs=\Df028+ED^J
+FPjbA8Z3+-RT?1+<Ve'EbTH4+A,Et+Eh=:F(oQ1F!,:1F<GU8B4Z<1ATDg0EcW@9D]j.?+EV:.
+EVO@+DbV4AS`K2Ea`o>%13OO,9nEU0eP.41,9t(+@KdNASkmfEZd(k/0H]%1,0n":MjfUEc5h<
<ag#_@;^007:^+SBl@l<%13OO+=\KV?t!Mf?moH"C`m1q@r$4++Eh=:F(oQ1F"&5?A7T7^+>"^W
ARuulC2[W8E+EQg%13OO+=\KV@!-O%A7Bgl+Eq78+DG_'DfTl0@ruO4+D#e-Cis9&DJ()0@;TRs
+EqOABHS[0-Qm,@+ED%7F_l/@/g(T1%144-+<X'dEb/a&+CKPC?m%'S/g+PMI:+1.AS,XoBln'-
DK?q<Dg*=FF`;;<Ecbl'+>"^WARuulC2[W8E+EQg+<V+#+:SZ#.Nfj&A8--.@rH4$@;]Us+Co2-
E,8s.ARloqDfQsm85gXQD]j(3D/!lu+E_a:EcW@FD]iJ)Ci=M?@WHC2F(KA7E,T\<F`;CS%13OO
,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!b
CEQ&VBln'-DCH#%%144-+<Y',De*ZuFCfK$FCei&E+*WpDdtFo@8pf?+C\c#ARlooDe!p,ASuTu
FD5Z2+EVO?C`mk>A79RkA1SjEAS!n3$4R=b+<Ve2<HDklB-:r-A8Gt%ATD4$AR-]tFEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]
A8Gt%ATD4$AM.\9H#@(?%13OO+=\KV:1\Vl6#C%VDf-\:EbTE5ARlopA8-."Df-\9Afu2/AKWBn
+AZH]ARfg)6tp.QBl@ltEd9*<BQS?8F#ks-GB\6`@;TG!Df.1;Df%.<E%aO33))/$6;:3C>qQQn
+<VdL<+oue+DGm>@3B#tDegJ=ATDj+Df-\9Afu2/AKYMtF*)G:@Wcd(A0>8pDe(J>A7f4%+A$/f
H#IgJG@>B2+EVNEF*2G@DfTq/$6UH6+A,Et+Co&,ASc:(D.RU,/0JG@DKBN&ATAo4F`Lu*@<6.#
B-:V*@rH=3/g*_t+EV:.+E2@4@qB1bDJ().Bl7]/AmoCiEt&I!+<VeJARTUhBHVS=F`JU@De!3l
+@0jQH>d[DAoD]4?qF9`:+\1V3ZpFA3A!3J2)I<K0ekCA?uL'.6#C%VDf-[`;b9_,CLqc6?pZP,
9eo@.9hn)a%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)DI[BuB-9WR
Bln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e;u+<VdL%144#
+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&%13OO+<VdL<HD_`F_i14
DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI5$4R=b.Nfi^F(KH&
F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#EbT*+%144#+<Y]9EHPu9
ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#Bk;>p$6UH6
+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(T1%144-+<Y'#
A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE@")U(DJ!Tq>]Y!qEccGC
/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c/hen3+>"^(ARf:g@V'R&
3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$8l%htAn>Cm
F`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0+Cf>-F(o];
+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7Dg*=GBOr<!
DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^0Lo\r/no9M
DIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB0fU=;1a$:A
@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1rFD5Z2@<-'n
F"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u@<6!&AncL$
F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b.Ni+n6!-lJ
9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9F!,R<AKYhu
G\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c:IHfX8TZ(b
@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjAEc#28+CK53
FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm3A*<P3$9dq
7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*ASl!rFCeu*
/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)U;B6A$!
E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5DK?q=Afs]A
6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo:LeKb@V'R&
0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO+=\LAATV<&
@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:gB4YTr?u0I`
/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=:/aq^7:76Z
ATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlokC1D1"F)Pl+
/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;FD5Z2+EV1>
F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6@X3',F"SS7
BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet@V'@s+CT=6
?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>/e&-s$6pc?
+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@@:Wn[A0>8S
8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4EbT&q+EV%)
/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9F^eW)BQS?8
F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpJ
+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@6=jh=G%kl;
EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8gEZfIB+EV:2
F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1A0>u-ASrW!
A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#+CK8#EbTK7
F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;6TQl#F(KB505>E=DDEn"0J@0Z
A1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'BODr4@rH6s
BkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7F(96)E--//
+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)D/:h=C3'gk
+<V+#+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,/e&.1+<VdL
+<Vd9$6UI1Ci=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-+B*E%E,Tc=
+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_Eb,[e+<VeE
Dg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4Bl7HqEb/a&
+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78+D,%rCh[d"
+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;ARlolF)u&.
DJ`s&FE9&W+:SZ#+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c$6UH6+<VdL
+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`+<VdL+<VdL
.1HV,+:SZ#.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%@:Wn[A0>u4
+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;uDes6.GA1r-
+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A6m-\lEb'5D
%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q%144#+<VdL
+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL+<VdLA8XO_
+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$6UH#$6UH6<+ohcE,oN5
BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q+Cf>,D.RU,
Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7DD!%S+:SZ#
+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&?m&lgC3=T>
ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@DBN>%@rH7+
Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeKD]j+4AKYZ)
G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U+B2osF<G.*
Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"pDId[0F!,OL
F*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#ATMp$EbT?8
+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*FD5Pu4ZXr7
6TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO+=\KV?tsUj
/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/F*),+ALS&q
%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k+EV1>F<GI>
G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI@V$[)E+EC!
ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9BlkJ3DBNq6
Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_F`VXI0eb.$
1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,ARlp%F`\a7
F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL+<Vd]+E2%)
CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*2'=V/3\WBO
1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+A0sJ_I4cX\
A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM$6UH6+<VdL
+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA@W$!i+C\bh
CNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"F"Rn/%144-
+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*++D,P4+CJYr
Cg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lgC3=T>ARlp*
D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImisCbKOAA1(b;
%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j-ndV14ZZsn
BlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p+<Ve@DBN@1
GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!AftPoBl7Q+
F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psInDf.0M:L[pY
F(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q+EM%5BlJ08
+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)EZf10F)rI?
Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!ARlp*D[d$r
+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,ASuT4Bl7Hm
GT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloqEc5e;@!-R*
Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1-uNI1ALqq7
G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;FCSu,@UWb^
F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]pB4Z0-4?G0&
0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%
67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]@
+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<A0>c"F:AQd
$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdSEap50@rs(]
3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL+D#(+DI[bt
$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u+D#(tF:AR"
+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$@rr.e%13OO
,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2.1HUn$6Uf@
5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m+CT.u+CK/2
FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%htB4YslEaa'$
F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%@VTIaF<G(6
ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!+CoV3E$043
EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*+=_)I.NibS
DK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[lA0>f2+DbJ-
F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJBl.F&FCB$*
Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL-ZW]>B682B
4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?Eb-A&Dg5i(
+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL+<VdL:-pQU
Ao)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=Bl5&8BOr<-
ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*F!(o!+<VdL
+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL+:SZ#.Nh#"
DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE@rH7,Ec5b'
$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]TuBlbD<ATT&:
D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4+CoV3E$043
EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>@3BH!G9CF1
@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2@<-'nF!+t5
ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlomGp%-=@rc-h
FD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(iB-:`!@ruF'
DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH++Co&*@;0P!
/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7Eb0-1+CJr&
A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2
@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)+EVNEA9Da.
+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U+CoV3E$043
EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J%13OO+=\LA
D/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F;ID*d$6UH6
=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/ARlnm$6UH6
AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j+D,P.A7]d6
%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-Anbn#Eb/c(
?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNEF*(i.A79Lh
+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7E+*cqD.Rg#
EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\noDfTD3FD,B0
+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2@<-W9E+*cq
D.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b@rH6sBkMR/
ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<-OgCl$6UH6
+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSfAoDKrATA4e
+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdhCh[d"+D,P4
+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq%144-+CK87
AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,AU%T*Bl8!6
ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"AM.\3F'oFa
%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3Df0V=D.-sd
+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF--q.QcFCfJ8
7;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)@:Li29PJBe
GT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<Ec`F?@:C?h
BOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(@q]:gB4YTr
FDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>$6UH6<c;es
D.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb$6UH6AmoCi
+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-BkD'jA0>u4
+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/+CKM-Bl%@%
?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_Dg-7F@;]Tu
BlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,Ao_g,+DkP$
DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/A0?#6+EV:.
+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m6tp.QBl@lt
Ed:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?7qm'9F^cJ7
AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*C$D/aPL
@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0De!p,ASuT4
?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>%144#+BqH6
6m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%-_
0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<3Ahp2+A-co
AKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5A0>MrEcl81
+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`3Zoq\/RU%N
%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!+DG^9?tX:o
@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)0JPBn$4R=b
.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E./ib^1/Kdf,
G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#F<G.8Ec5u>
+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2+EV:;Dg-7F
@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&F"SRE$4R=e
,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(+CHoH@rH4'
C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUtA8,po+EqL5
FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./+C].qDJLA2
Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+@rGmh+CT=6
BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3rEd8c^3@l:.
0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9F^eW)BQS?8
F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9FE_XGEb03.
F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'+B3#c+CSek
Bln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$ASuU$A0=K?
6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%+<k<6D/aN,
F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=Bl7Q+Anc'm
F!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#$6UH6+<VdL
%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@BQ[c:@rH3;
@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`/g(T1+<Vd9
$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#+Cf(nDJ*O%
+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI@V$ZrDBN@1
?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE$6UH6+<VdL
+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/2((I?%144#
+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@Bl@l3GA(Q.
AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M/n]3D-RW:E
%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh+<Ve71*AS"
A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655ASlC&@<?''
F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0DJ*He+DGm>
@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"ATKmTF(Jo*
?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT+CKPF6%45i
/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&AKWC/H$O[\
D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/?m'!*@:UKh
A7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5FE2)5B-;5+
E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuulA8-+(+=D8B
F*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9<+ohP$6UH6
Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLgDKI"?@;0b'
/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b.Ni,9B4*85
?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*ARoLs+D>>&
E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9
C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F%144-+CJr&
A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-%144#+CT.u
+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$A2uY&GAhM4
E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(FCAm"Et&Hc
$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V+Co2-E$-MU
?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</Bl@lA%143e
$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*AjEcc#5B-;;0
AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>FDi:+D..I#
A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]%144#+DG_'
Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'0JP<l$4R=b
.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`RA8bs#/hSb(
?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W?o9'GF`\`R
/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+/no'A?m&iF
:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*+>,8o?m'N4
DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9AU&;L%13OO
+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%F)Pr4?[?'1
%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A+D#S%F(Jl)
@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%WnFDQ4FAoDg4
+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\GA93$;FCf<.
@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)@V'+g+Dl%-
BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%Bm=31+E(j7
F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'DIIR"ATJu9
BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'nF!,R<AKYhu
F*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2+Co2,ARfh#
Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO=^W@_Bk)7!
Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,G%G_;@;]Tu
@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6@:NeYF)rIC
@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^:IJ,W<Dl1Q
+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#D.RU,+CSek
Df.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.F*&O!@:LEi
Df'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9ATJtd+?(o,
0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9A8bs2D.-pl
DffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*FCeu*@<3Q"
%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-FC5Ob+<VeK
D]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=+CJr&A8#Oj
E*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8Bl@l3De:,"
C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#%144-+Dbb0
AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#.NiP9@WNZ7
E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq?tsUjE,o]1
/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<+?(o,0e"5a
Ec5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-+CJr&A7fb#
CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ+<Ve@DBNe)
Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0H=.k3De!3l
AIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_AAn?'oBHU`$
A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OCF<DqY+:SZ#
+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<2BXRo6tKjN
0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+Df-\9AftJr
De(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&+D,Y4D'3\(
Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A@q@9=BlIH4
+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D+ED%4Df]W7
DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;
FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*FDi:?DJXS@
GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6B-:S1/M8J8
3aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#+:SZ&,9n<b
/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.GAhM4F'p,!
+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-$6UH6%144-
+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et+CK84@<-I4
E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%A7]:(%13OO
,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-?m'Q0+ED%*
ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#D..3k?m&p$
B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&D.Oi-@;TQu
@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*@<?08%144#
+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm3A**1/KdZ.
DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.FCf?#ARmD9
<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"DKKqB@;]Tu
@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,Gp%$;+D,P4
D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5?m'Z-Cht5'
AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E./i"P$+AH9i
+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A6nTT]BOr;[
Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO+<VdL+<VdL
IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*DIjr$De!p,
ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)@V'+g+Cf>-
G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;rDf0`0EcYr5
DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY+EM@;GAMOI
AncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5?sP0oFEDI_
0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<tBl8'<+EML5
@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7Bl@l3De:,9
BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+@W-C2+A,Et
+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`Eb],F3A,Mo
Eb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7AKZ22Ch,.@
+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^KDIak^+?(o,
GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<AncK4De:,'
A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1/e&-s$6pc?
+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss2_Hd=+A,1'
+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhKASlK@%144#
+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$C2[Wj+DG_8
ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(/0J\GA8c'l
?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54FD,6++DG_8
ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rmARlp%DBO%7
AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>JuCh4`"Ble60
@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj/oY?5?m'K$
D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc+<Yl:F!+q;
+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5C2[W8E+EQg
%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.GA_58@:UKg
C2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9A7TUg05tH6
A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*DIjq_:IH=9
De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q3+*kG@:O=r
+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4?r^/q3++0f
%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d/g)8G$6Tcb
,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=DC3*c*E+*cq
D.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%+E_a:+CT>$
Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:2'?pNE,oN2
ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1@Wcc8BlbD<
Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$jF`V,8+CT>$
Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn+EV:.+EM7C
AKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5?k!GP$6pc?
+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qBD]ik7G@be;
@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e$6Uf@AncL$
A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%0K9LK%144-
+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8E+EQg+EVNE
A7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LSASl@/ARlp)
Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58@:UL%BmO>"
$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5+ED%(F^o!(
+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-+ED%*ATD@"
@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8/o5ZHFY70B
D-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_0fU^,1,(CA
%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='+DG\3Ec6,4
A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq/no'A?m&lg
A7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&,9n<b/i>78
+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&FCbmg+:SZ&
,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+Dfp"ABl5&$
C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8D]iG/FCB33
F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i+>Y`'+>PW)
3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.62]s[p9jr;i
1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&F`%Wq%14=)
,9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>,%5"mDf..@
H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4+C\n)D..=)
@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDBH#n(=D'3M#
DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%DBND"+Cf>-
G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o05>E=DJ`fl
Amo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6Bl7Q+@rH4$
@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdLE+*WpDdsnA
F!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%16c_F*)>@H"q8.A8bs52eQ]>
ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hnt4+>"^*AR]\&@<-W92(Tk*0JYI--qIcfBR(^p@n:$LBP([_
AKXEPBln'-DCH#%%144-+AQKl+CT5.ASu$mGT^pB+EDUBDJ=!$+A,Et+EV19FE8R5A7T7^/e&-s
$6Uf@:L\B`Ch7^"+A+O7B6%F"BPCs!Eb0*+G%G2:%13OO+=\L$BOPdkATJu9D]iFsDJW]3+CK5$
F*(r#/0J>>@:O(`?m'Q0+Du+>AKZ).AKYDlA8-."Df-!k+<Ve8DIal4F(HJ4Aft#C5qOiL2BZI;
@r$4++EM7-ARf.h+D,>(ATKI5$4R=b.Ni+i5uU<^/0J=o76s[V+CT.u+CJAE7pmHV@:O=r+E)4@
Bl@l3@rGmhF!+n%A7]9oFDi:D@:F%a/e&-s$6Uf@9keK`EZf(5E,ol?ASl!rFE8RHD]j"ADKL#2
@<?4%DBLMRFD,5.FEqhD+DPV(@:UKpF!,C=B5_L%B.aW#%14=),9S]n0J5+<+@0seBl"nK/0H]%
1,C%$;fHbkDJ((`DIdHkFDYT,FE8QnA8-."Df.!5$4R=b.Nh](AKYo3A7]d(De:,1E-,f4DBNG-
A7Zm*@:F%aF!,17+CT5.ASu$mGT]F-+D>2)%144#+C\nnDBNG&@;]^hA1f!(BOr<&@<-!lEZfI4
@VfTu0eskcF!,@=G9CgA+CQC6Bl7R"AISth+<YW3B4W3-D]ik-@<Q3)F)YPtAKYT'EZet:FEMV8
+Cf>#ATKI5$4R=b.NhZ.D.Oh>F`(`.@s)X"DKKH#.Ni5>A7]g)BOQ'q+C\nnDBN@uA7]9oFDi:D
@:F%a+>GW(%13OO+=\L5BOr;tDKKoE+D,P4+CJ`!F(KH$+D>2)+C\nnDBN@uC3=T>ARlp*D]j+7
Dg*<5$6UH6FD,5.DIn#7?q<R^846HP:gbDb@<,dnATVL(/e&-s$6pc?+>GK&/i#4*/KdYoDKTB.
Gp"k#/0H]%1,C%$7qHRKATAn_CisH&+@TgTFD5Z2.1HUn$6Uf@6Z6g\Df0-(F<E:n+DG^9?tsn(
Eb'6!+Du+A+D>\0A9/l8BOr;Y+CI2Q3\`I!+EMgLFCf;3F*)G:DJ(RE<+oue%144#+D>>&E-!-o
:IH=9ARTBtGA2/4+EV:.+C]&&@<-W9Bl7F!D/`p*BjtdmBlnVC@V'Y*AS#a%8g$,H0Jk.u+CT.u
+D"u%Ch[I$%144#+A+#&+D#e>ASu$iA0>i3ARfFqBl@l3Bl8$(B4Z+)/e&-s$6Uf@6Z7!cARfg)
?t!Mf?m'<)DII&u@<-"'D.RU,+>"^SDJXS@FCArrF!+t+@<,ddFCfJ8Ch[s4F"Rn/%14=),9S]n
0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%%144-+<Y'#
@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-+<X'dEb/a&
+Co%qBl7X,Bl@l3@;p0sDIdI++CSekARmD&$4R=b.NfjN@:N)302-(tFa,$J@<?1(+CSekARlp*
D]iP.DJ!TqF`Lo4Bl@l3F(Jj'Bl@lA%13OO,9nEU0eP.41*A.k:2b;eD.7's+?:tq1,(I;+=KNm
@<uj0+A*bP@VTIaF<Etc@ruF'DIIR2+@:!bCEQ&VBln'-DCH#%%144#.NhJtG9B1g@<uj0+E2@8
DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0
/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,
EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)
DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"
$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKY
EZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%144#.NhJtG9BM#E-ZP:EZf1,@N]W#AftMm
A7]9o?r_8^DJ)R[A8Gt%ATD4$AM.q4Amd25F(Jo*FD,5.A8-'q@ruX0Gmt)i$6X)&@<?0*-[oK7
A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%
1,'h!;f?/[@;I&SBleB)DI[BuB-9WRBln'-DCH#%%144#.Nfj6;G;-SBl5&$C2[W8E+EQg+Dl%-
BkD'jA0>u4+E_a:+@oI2:fAKNDKBo2@:UL!AfsWD<)>1V$4R=b+=\L3AS,LoASu!hF!,RC+A+pn
+Cf(nDJ*Nk+EVNEF`V+:E+*6n@;[3%DKBo2@:Uu"$4R=e,9n<c/hen3+>"^(ARf:g@V'R&3@l:.
0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144#.Ni,.B4Z0m+C\bhCNXS=B4Z0-F(Jj'
Bl@l3@:Wn[A1eu6$4R=b+=\KVE+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ8Cggdo+CSekARlo8+EM+*
+EV:.+Co2,ARfh#Ed8*$%144#+<VdL+<VdLC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"
DKIONA7f@j@j_]m%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b+=\LWATDj+Df-\,
F_u(?AoD]48g$,H0JO\ZATV?'E+*iuBJ'`$%14=),9SZm3A*<P3$9dq7V-%LF^]<9+>G](+>PW*
3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b+=\LAEd2Y5+EM+(FD5Z2+CSekARmD9%13OO,9nEU0J5@<
3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144#.Ni,9DJW]'F(Jj'Bl@l3@:Wn[A1e;u%14=),9SZm
3A*<P2'=In9jr;i1,pg-1,(FB+=KrqD/XH/@;I&S@<iu<E+EC!ALS&q%144#.NieS@<-H4De:,4
AThd/Bl@l3@sMR#AKYT'EZdssG%G]8Bl@l33%cmD.kV8<%144#.Nh>Z6m-)[Ch.*tF!+n/A0=K?
6m-;S@WNZ5@rc-lDBNFtE--5CATJu:E+EC!ARl5W+<VdLAoD]48g$)G0K1+H;,f.W$4R=b+=\LO
ATo8)F`(o'De*E9?m'Q:E+L/#A7T7^+EVNE89Jf_@<-'jDBNA,E+NotBm;6>$4R=O$6pc?+>>E.
/ibpJ+>"^1@<itN0e=G&0JPNr$4R=b+=\LGBl\9:+Cf>,D/")7FDi:>ATo7hF)PZ4G@>N'+@g-f
89JAaEb03.F(o`7EbT*+/e&-s$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+<W-V
ARoLs+CJr&A9Ds)Eas$*Anbme@;@K0C3*c*@;p0sDIdI++EVNE@V'Y'ATA4e+<VdLF*2G@DfTqB
F`V87B-9fB6m-2]+DPD)DKB`4AM.P=AKZ&*F)u&6DK@E>$4R=e,9n<b/ibOE3&_s3+AH9b@qZu?
0J">%0JPHp$4R=b+=\LNBl7j0+D#(tFE7lu%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI
%144#.Ni,.DJW]'@UWb^F`8I@@;TRs+Dbb5FE8RGARfgrDf-\+A7T7^/g)8G$4R=e,9n<b/ibOE
3%uI,+@1-_F`VXI0e=G&0JPEo$4R=b+=\LOATo8)@rH4'C1&0+@:p]j-ndV14ZZsnA7]glEbSuo
A.8kg+:SZ#+=\LAARo0kAU%X#E,9).De:,'A8-."DJ((?DIIBn/6cV#@<6Kq/9YH<F_*!EFCAWp
ATJu&A7T7^%144#%144#.NiGCA7^!.Bl.g0Dg#]/ASuU2+CT.u+Dkh1DfQt3A8-.,%13OO,9nEU
0J5@<3B&`:/KdZ.Cj@-[/0H]%0f9CI+:SZ#+=\LOATo8*E,]B+A8-92,#i]*DJ=!$+A,Et+@L?h
E$/(hEbTK7+B3Aq@r$-0+CSekARl5W%144#.Ni,3ATV<&@;]Tu?uU71?m&rm@;]^hF!,(5EZf72
G9D!AD.Rd1@;Ts+F*2G@DfTq/$4R=b+=\LJD/aN6G%G2,8g%V^A7ZlqDfT]'FED57B-;;0Ec6)5
BQ&$8+CJr&A1hh3Amc&T%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2%9m%$6UH@+Dkh1DfQt3
A8-.,+EVNEF*2G@DfTqBCggcqF`:l"FCfM&$4R=e,9n<b/ibOE2_cF,+AH9b@qZu?2(Tk*0JPEo
$4R=b+=\LGBm:b7DI[U*Eb/a&+D,P1FDc#=AKYf'DJK[g%14=),9SZm3A*<N+>"^1@<,jk+>P]'
+>PW*2%9m%$6UH@+Cf(nDJ*O%+EVNE?tsUjBOu"!?m'N9DKK<3+CoD#F_t]-FCetl$4R=b+=\LD
BOPdkATJu+DfQsm+?1u-GT_'QF*(u1F!+n/A0=KA<"00D$6UH@+Cf(nDJ*O%+EVNE?tsUjF)Q2A
@qB$jDJsW.A.8kT$6UH@+D,P4+Dl%;AKYMpFCAm"F!,O8AKZ).AKYGuDeC23Df^"C%144#+<Xl\
:IH=*E+EC!ANCr7ATDj+Df-[O/ibOE2_&)]BQS?8F#ks-@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;
1,(F?0/,181,:LtDe(GBE+EC!AM&(:EcYr5DCmOo3A!6M0.@>;%14=),9SZm3A*<K+>"^.F`(b5
0f1F(1,(F>%13OO+<W-V8jQ,nG%G]8Bl@l3Bl7F$ASl!rFCeu*F)N1/C2[WnDe!p,ASuTt+CSek
Df-\+E,]AsEcW@8DfQsm+?1u-GT_'QF*(u1Et&Hc$6pc?+>>E./ib^1/Kdf,G%GN"ATAnK1FsY(
0JP?m$4R=b+=\LTH#@,*Ec5i0H=\4,C2[W8E+EQg+Eh=:F(oQ1+EqOABHUi"F*)G:@Wcd(A0=K?
6m,oKA8c?<+:SYe$6pc?+>>E./ibU./KdYoDKTB.Gp"k#/0H]%0es1F%144-+CK)/?m'!*@:UKk
De!p,ASuU$A1e;u+:SZ#.NinGEcYr5DBNG-DKKo;C`m/*E+NotBm:b@AThd/ARlo8+CSekARlp(
AS,LoASu!h+EVN2$6UH6>=WCL89JBI-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"
E-!HN?tsUjA9Da.F'p,2AT2R/Bln96GqKO5+<Vd9$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%
0es1F%144-+Dkh1DfQt3A8-.,+>"^D9gMZM6r-lZ?m&rtA7Zl=2]uOHA0>8;+Co2-E$-MU?m'?*
FCeu8%143e$6Uf@FD,B0+CoD#F_t]-F<G(3DK]T3FCeu*FDi:+D..I#A8c[0>psB.FDs8o04\L3
Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*FJ$4R=e,9n<b/ibOD0H_qi8p+rq+>GZ'
+>PW*1(=R"$6Uf@Eb/ioEb0,uATJu9D]hb_@j#r+EcYr5DBNA*A0>8pDe*Bs@s)X"DKK8/@:Wne
DBN@uA7]9o%13OO,9nEU0J5@<2`;d1+A-coAKW`^/0H]%0es1F%144-+AbHq+A,Et+CoD#F_t]-
FCB9*Df-\=E,961+E(k(+DG_8D]iI2F(K<!Eaa'$+CSekDf.0M<+ohcD..-r%144#+D,>(AKYAq
De(J>A7f3lBlbD;ASbdsBm+'(Gp%0M@:F%a+CT.u+CT)'Df^"CFCf>4FD5T'F!,R<AKZ&.H=[Nm
+<VeFAfu2/AKYK$Eb-@c:IH=6A7TUr/g*`-+D>2)+C\nnDBNt2D/XT/A0>K)Df$V=BOr;rDfTD3
8l%ht@:WneD@Hpq+<YcE+ED%(F^nu*A8c[0Ci<`m+EV=7ATKIH>@;2aA1hh3AmemmBQS?83\N-q
@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.).1HV,+<Y?+F!+q'ASrW!G%#*$@:F%a
+E)-?FD,5.8l%ht:gn!J+D,P4+E_a:EcW@FD]iS/GA_58@:UKhDIak!$6UH6@rH=3+EVNEFD,5.
@rHC.ARfg)?tsUjBOu"!?m&uoEb/a&DfU+G@Wcc8GA2/4+EV:.+:SZ#+<YWDDes-"ATD4$Bl@l3
De:+a+E2.*FCoH3D0$h.DIak^:IH=KATDj+Df0V=FD,B0+DGm>B4Z1,Bl7Q+%144#+Dk\2F*TA\
8TZ>$+D"u&Bk;<-FDi:EF(HId5tiDCD]iS)F*)G:@Wcd(+EV:2F!,(/Ch4_tDIal"BOPdkAISth
+<Y',De*NmCiEc)FDi:<Df9D6Bl5&8BPDN1@:WneDC9KJA8-'q@ruX0Bk;?<%143e$>OKiCh\!&
Eaa'$?Z1+%ATqL'AU#sc,p7;CBlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=
FEDkEDe*ZuFCfK$FCfkC:Ng;iG%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?
Ch\!:+EM%5BlJ/:FD,*)+D58'ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%L
BkqE99PJT[Eaa'$?Z:%(B6%EtD/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;
>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8IY
8l%htA8,OqBl@ltEd<'UB6%p5E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$
@V'1dDL5r4F_t]1@<?(/%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8
Bl7Q+C2[X!Blmp,@<?''DJsW.@W-1#I4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!
Blmp,@<?'5BlJ?8@XS[m+C&f&Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5
E+ER/HW>-$DJ(),De*ZuFCfK$FCcRk6q2SW%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%
ATD4$AM.q4Apk*q+C&f&Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+ER/HUDprEb0-1
+A,Et+DkP)F^]*7/e&.1>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N.!Bln$2@P2//D(f@,CLqO$
A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7g6!$6WSkDfT]'Cia<:
AISuOASu%*ASuX-ATD4$AUP!p%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[mDKKH1
Amo1\I16Mm$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=%7iE+O'+Bl7^5
<(KSZ:dIiE:IBPW>Y]3XD..6[Dej]!84c`V5u'gD6QdKo+<Z)\>?l,UB4Z*pAp\6(@ldR[8Q/GO
:..lFI9dt#6Z6gYASuThDej]3F_kk:E+*WpDdso/@<?0*/Kf1WAKWC?@;]Uo@jrO7Afu#0+EM4-
Cht55@<?12%16?RH#R>8Ch[d&HY.2:D/!Tj@qBanG^XpD:2b/i@;Jn]CO9Z3Ec#N&@:NkjAU#=?
+FSZB>]=+aATD?oHYI)%3bE;ND/!Tj@qBanG^Wj?>XNFHD.RU,<,ZQ!AoD^,@<?Q5BR+Q.EboH-
CLq$!@;]TuBPD*mCh[NqFCeu*Bl8$(Eb8`iAKZ28Eb'6>%16?RH#R>8Ch[d&HY7A<Ch\!>HX'<a
Ec#6$<,ZQ!B6%s-BlkI?+<VdL+<VeTI9Trq@:s.lAS-:'An*l7Ec>i/FF@F;>XNFHD.RU,<,ZQ!
D..3k+DbJ.AU#>0DfQt5Ec6)>+=MLaI16NgBR+Q.EboH-CO9c-@:NkiARfgrDf0uM>Y]3XD..6[
Dej]6Amo1\F(Jj'Bl@l3+<Z)\>?l,UB4Z*pAp\6(@le=9@:NkiARfgrDf0u/+C%9PD/Ej%FB!0o
HYIA>ATDBk@q?d(ARfgrDf-\=F_tu(Ed8dKFE2)5B713r>\JD%ATDU$DJOT5An-79>Y]3XD..6[
Dej]6An)r++<VdL+<VdL+<Z)\>?l,UB4Z*pAp\6(@le=9@sqW*>XNFHD.RU,<,ZQ!AoD^,@<<W+
DKKH1Amo1\+Cf>,D.RU,+EV1>FF=T*>\JD%ATDU$DJOT?ATV[*A8Gt%ATD4$AUSo1:2b/i@;Jn]
CO:,6FD>`)Ch\!&Eaa'$+FSZB>]=+aATD?oHYI)%3cekSC2[X!Blmp,@<?(/>p*B>Df'?&DKJir
CO:#@AT2'uAKXZT<+T/SE,ol,ATMp,DJ((D+EM+9F!,CDF<G+.Eb/a&DfU+GGB.D>ATJu5Eb/Zr
@VfV(%16?RH#R>8Ch[d&HZaOK@<?(*Ao`*6Eb'6>HX'<aEc#6$<,ZQ!Fa%Y1FCf]/Ed)GBA9/lA
I9Trq@:s.lAS-:'An*lEGAL]0AU%g-GAhM4F+%=:>XNFHD.RU,<,ZQ!F`)DD@;p0sA0>\sFCf\>
Ao_g,+EqaEA90dSFa%Y1FCf]/Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@CV%16?RH#R>8Ch[d&HZsCK
A8Gt%I=#3oDfT]'CfG=gHZsCKA8Gt%+<VdL+<VdLI=5=)E+*BjEb/j0BkCj9GAhM4Ch\!>>p*B>
Df'?&DKJirCO9o,CLnW)@<?(*+D,Y4D'4%@Eb$;/BleA=.![7i%16?ODIe)bBkM*qBkM+$Bl7R3
%16?ODIe)mBOPF_A:4mo%16?]F^fE'@ruF'DL5W1AU&<=FF.b@A8Gt%ATD4$AUP\0DIak^:IKU?
$4R>IFCf]=FEDkEDe*ZuFCfK$FCfkCD..3kF!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bd
De*E%@;]Tb$=n'bF_t]-F<G[:G]Y'BF<GOCDe!@"F(KDF+A$Yt@<6L4D.RcL%13OO>[h8WBl89/
DKTf-Eaa'$I9SEY>n%-GBlmp'%144#6#:?[F)Q2A@q?cmDe*E%BlbD<FDl22A0>T(+A,Et+Co1r
FD5Z2@<-'nF"Rn/>\S:kD%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=@s)X"DKI"5Ea`TtASuU2
+CT;%+D#8/BOu3F%144#>[h8WBl893FCf<'H=_L6$6UHrBlmp'+AH9bCLh@-DBNS4Dfp"ACi=3(
+CoD#F_t]-FE9Jc>]s\!@XKpR3?VjHF)W6LB6%p5E,K*$ALDj7$6UHrBlmp'+C%TK<+T0:+EM[;
AncL$A0>_t@rcL/3Zq[NATD7-1a$=CF)W6LB6%p5E,K*$ALB#V?Z1+%ATqL'AU#SM%144#>\.e`
HYIS5D/"<-I16Mm$7-g"Blmp'%14C(+<XEtDCnI'@rGmh+DGm>@rH6sBl7Km+EVNEFD,5.8l%ht
B6%p5E$/h*@:Wqi>\7nmFDc#=AU@BiBla^j,p4<Q+<YK7D/"*#FD5Z2+DkP4+C\n)ARTXkA0>Su
+DGp?@V'%fD.Rc2@3B5tDIdcrDI[61I3;s9A0>T-+DkP-CLq#c$7-f;+EqOABHV88AT_O%/T>-9
A8bs#A7]RkD/"*'EcWiU7<W6_H$!_6DJ()+DBNG3Ebp"D>]aP%FEDVO>^K_(I16N0+<Ve9Ea`Hn
ATVu9AoDL%Dg-7FE+*WpDdso2Dfp)1AKYK$A7ZlsBkM*qBkM+$Bl7Q+@rH7.ASuU(Df0VK%14C(
+<Xp2AU&<=FF.b@A8Gt%ATD4$AUPqI+D>=pA7]d(@rH7,@;0V#+C%TK<+T0\@rGmh+EV:*F<G:=
+DkP-CLq$!Ch[Zr%14C(+<Yc>Blbm9$4R=g+C&AeB5)71G%G]'@<?4#I16N0+AP6U4?S(AIXWDd
+>.J=FCf\>DKTf*ATCIYDIml3F*(i2F@L:hD*9't+s;:C$7-fi67tGcIXZ`p+:SZ(+C&JqA:&K2
EaiI!Bl/8-$=%.[A:%m*F_t]1@<?(/%13OO>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!
Blmp,@<?(/I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<QQDK?q=DBN"pDId[0F"AG-Bl8'<+CT.u
+AH9S+Eh=:F(oQ1F!,C5%15][>\7nmFDc#=AU@[(AU&<=FF.b@A8Gt%ATD4$AUP\FBl%T.Ecl7B
Df-[i+?1u-0d'nBA0>>mH#IS2/q"09%16'Q+E_a:+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<fRFWbOD
F*'GP$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UH_DKBo.Cht4d:IHfE$6UHrBQ@Zr
HY@MCE-"&n04Sp2AM._=De=*8@<,p3@rH3;GA1i,00s,ZDf0VLB4YslEa`c;C2[X2HV.(%I3<6F
+CQBb%144#@:WneDD!&'F<G:=+E_aJ@;Kb*+DG_7FCB!%ARlp-Bln"t$6UHrBQ@ZrHY@MCE-"&n
04Sp2AM._=De=*8@<,p3@rH3;GA1i,02Q(eD..=1HZ3D'D..=1/e&.mBlmp'%144#8T&Tk@;Ka&
8l%iR:K::[74o#V+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@ID
ASu("@;IT3De*p-F`Lu'I="R^6rQl];F<m$%144#BlbD*CiaM;@3A/b@:WneDD!&'DKBo.Cht5.
F<GdAFD)e%FCf]=FEDkK@:O._DLF,[8TZ(bDf0Z*Bl7u7FD,5.8l%ha$6UI%Bk)7!Df0!(Bk;?.
Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$DK?6o+<Xp2AU&<=FF.b@
A8Gt%ATD4$AM/B?$=%:eAShk`+<X6nF*(i,C`m./@s)g4ASuT4G%G]8Bl@l3De:+sBQ@ZrHY@MC
E-"&n05t?;A8bs1DfTJDI=#pADIdZqI4bs9+<Xp2AU&<=FF.t8DIdZqI3<]EEcYr5DBN2+AU&<=
FF,bq3A*$=0mt0QDIal!AU/33A0;<g+<Y`JE,]`9FE8Qs+EMgGFCBD:BPD*mCh[NqFD5W*/g*u2
BlA#7G%G]8Bl@m1+ED%5F_Pl-A0>`-A8,Xi@psInDf.0M<+ohP$6UI'Des6.GA1r-+C]/*B-;/3
F*)IGE,ol?Bk1ctD/XH++DG_*DfT]'FD5Z23XlE=+<VdL+C&AeB5)71ASuX-ATD4$AUP!p#p:?q
Blmp'+C&T#AS-:&FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B
05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*qB4uC$DJ(VNHVJF!AKXSf:gn6PDdsngH#@_4GT]Ok
B4stQB4uC$DJ+A,$4.gt>]XCqBlJ08BmO>"$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_
FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$
Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJD1,(F<0/,C>1,(A#@;]Uo@kD.uF(Jl6C+XLPDKK<3/SJj2BP_Bq
BQRs+B.n[[:gn6PDdso!@<6!j+A*bTH#@_4GT]OkB4u*qB4uC$DJ+A,$4.gt>]XCqBlJ08BmO>"
$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA
0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*mCh[NqFD5W*07=9:+<VdL+<Xp,DfT]'Cia<:AIStQ
+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@9
0/,+6F(K3&/So-CATD4$AM%Y8A1r@X;e9f[/PKl#ATD4$AKXT@7"$Zs$4.gt>]XCqBlJ08BmO>"
$6UH6+<Ve3F`M;FBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90eb77
0e[TZD.tS<Blmp,@<?'4C2[W9I16N++<VdL+C&f&Ec#6$F(or3%13Ca+C&JqA:%m*F_t]1@<?(/
%16?SFCf:u$6UHXF_PZ&+C'#"G]\%LHYRJ0Ch\!&Eaa'$/q"jIFCf]=FEDkEDe*ZuFCfK$FCfkC
BlbD*+A*bhEc6)>/g*b^6k'JG+DkP&ATJtd+EM%5BlJ08+D,Y4D'3J3Dfp#?/g+,3+DkP&AKY6"
AU&<=FF.b@A8Gt%ATD4$AUP\3D`S=7%14C(>[h8WBl89@ATD6gFD5T?%14C(Eb065Bl[c--YI".
ATD3q05>E9-OgD/+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1,p7&@F!)iFDe*Zu
FCfK$FCcg/$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$
DJ+B%>n%-G:2b/i@;Jn]CO:)5EHPu9AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAB4Ysl
Ea`c;C2[WfFCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]<A0?;*94`BmDfTAfDej\]3dk73
FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iqFCf]=EHQ2AATMR'B5D.+
I=35C94`BmDfTAfDej](I3;c_ARebLCfG=gHS^(T:2b/i@;Jn]CO71BA0?;*;fm%oDJ)peCO9<.
AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;O$=$>EEc#6$<,ZQ!D/=89I9]]mEbTE(
<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR%16?ODIe)b
BkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+AZrfDBO%7AKXT@6m-#S@ruF'DIIR"
ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,/e&-s$7-g"@V'1dDL6P<
EaiI!Bl/8-$7-g5A0<rp-YdR1A7]p,C2[W*F`_>6F!i)7+>Y-YA0<6I%14C(>\.e`HZit@@UX@m
D1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[Dej]<A0?;*
94`BmDfTAfDej\]3dk73FE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?De*BiFs(O<A0?#:Bl%iq
FCf]=EHQ2AATMR'B5D.+I=35C94`BmDfTAfDej](I3;c_ARebLCfG=gHS^(T:2b/i@;Jn]CO71B
A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]
B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#9Q+?M+C'#"G]\%LHYRJ0Ch\!&Eaa'$
/q"j.AoqU)+DkP&Bl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/+DGp?@ps6t@V#uU+<YK=@:Wq[+Dbb-
AKYE!Gp#^%F(96)E-*]A$4R=g+C&AeB5)71G%G]'@<?4#I16N0+Dbt)A0<77De*ZuFCfK$FCcg/
$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G
:2b/i@;Jn]CO9l9@:UL/>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%
FE)GAFCfN-DJ*csH[U;O$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#
;e:%n@3Bc4EbfB,B-:`!Eb/a&DfU+U+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<06DImisFCfM&$6UHr
9OUn3=FOjrCh7Z?+@0g[+EM[8BHUo$Ch7Z1@<,p%GB.D>FCf>4FDi:DBOr;sBl[cpFDl2F+EML5
@qfOhARlomGmt*'+C'#"G]\%LHZNb?C2[X!Blmp,@<?'5I16Mm$7-g"@V'1dDL6P<EaiI!Bl/8-
$7-g9ATV[*A8Gt%ATD4$AKW?J+<XEG/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-
F<G+.Eb/a&DfU+4$4R=g+EM+9C2[X!Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"
GB43#,p78?FD>`)Ch\!&Eaa'$+=AgUDf'&=C2[d'06CcBE$lbN:-pQUCh[d0GRY!++C&JqA:&K2
EaiI!Bl/8-$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$>EEc#6$<,ZQ!
F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I9^l*G][qJDffQ3Bl7R"
AUAiR+<XoVDf'?&DKJirCO8fC/g+YHEcP`/F<F1O6m-GkF<G+.@ruF'DIIR2+CoD#F_t]-F<G+.
Eb/a&DfU,O%13OO>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5
F(oN)Ch7sA@ldk:AU&<+@:O(oCghBuH[U!ID/`a%AU&<:F`2A5F(oN)Ch7sAI39XT+<VdL+<Ve3
6Z6gYASuThDej\p67sC)Bl7I"GB80A$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_
Dej])FCf]=EHQ2AATMR'B5D.+I4o8PD.PA8DeO#AFCf<.>]aP%FE)GAFCfN-DJ*csH[U;b+C%9P
D/Ej%FB!0oHVQm[+Dbb0Fa/<D$=$>EEc#6$<,ZQ!F(KH.De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])
FCf]=EHQ2AATMR'B5D.+I=?9LD/`a%AU&<:F`2A5F(oN)Ch7sAI39XT+<VdL+<VdL+C%9PD/Ej%
FB!0oHVQm[+A*beAS,XoARloqDerrqEcZX<$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[
I16NgBlmp'+B)in+E)4@Bl@ltC`m//FD,T5.!$g[GA2/4+Cob+A8,Nr>]aP%FEDVOF(KH.De*Zu
FCfK$FCfkQ%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui%16?=FE2)5B2ieb
HX(Z(G][qJDffQ3Bl7R"AUAhl@<??pDHq9pG][qJDffQ3Bl7R"AUAiR>Y]3XD..6[Dej\BF(KH.
De*ZuFCfK$FCcSC>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I:G<CFCf]=@UWb^F)59+BR>/:
@<?!fG%Fp#AU&<:F`2A5F(oN)Ch7sAI39Y;6Z6gYASuThDej\p67sC%ATT%g@8pf?+CTD7BQ%o>
F"&5RAU&;>@;]TuA8-'q@ruX0H$p,/>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?S
FCf:u$6UHhF`&=,FCf]=FEDkBEc>i/FF>9MDBO%7AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,
/g+D@AU&<=FF.Y@E,961I16N++D58'ATD4$ATJu!9OUn3=FOjrCh7Z1Bl5&8BOr<1DfTW-DJ()&
Bl[cpFDl2F/g+,,AKZ#3Dfd+,9OUn3=FOjrCh4%_+<YB>+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!
%14C(>[h8WBl89@ATD6gFD5T?%14C(B6%s-BlkIFC2[X!Blmp,@<?'.+AP6U+DkP&ATJu/De*Zu
FCfK$FCd(HAU#=,$7-g"ASu%*G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*q
B4uC$DJ+B%>n%-G:2b/i@;Jn]CO9]7E,961+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi?
De*ZuFCfK$FCe^!AU&<:F`2A5F(oN)Ch7sAI3;c^Df'?&DKJirCO8fC/g,">CLqQ0C2[X!Blmp,
@<?'5FCf\>I16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`+<X[*AKY5O
@8pf?IWTKN@rH4'Bl%?'FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkBEc>i/F=qta%13OO
+<WrmF(f-$C`me/EbTK7+=LK:AU&<=FF.J*FF>9MEZeV/AU&<=FF/(BI46:QF!,[IBlnH.DBO%>
+EV:.+C'#"G]\%LHZNb?C2[X!Blmp,@<?(/%144#A8-'q@ruX0Gp%3B@<<W5BQ&*9+EV:.+EM+6
F_,H#AKYo'+C%TK<+T0:+Cf>,E+s,sFD5Z2+Cf>,D..<mF"Rn/+<V+#+<X-fCh7Ys$6UI.@<iu)
AKYr4De!@"F(Jl)GA2/4+C'#"G]\%LHZ3M-CghEsG^V+c>]aP%FEDVOG\(]"FCf]F+E)90$6UHr
FCf]=FEDkGF^])pFCf]F/g+;8F`JU7BQ%TpAKZ22Cht5'AKYMt@ru.$ARlomGp%3BAKYr4ATMF#
@q?d$Ado(i+B<;n@rGmh+Cf(nEa`I"ATDiE+@^9i+Dl%;AKYMpFCAm"F!,O8AKZ).AKYr4ARTFb
Ch4`$Bl%>i$6UHrFCf]=FEDk%:IIljFCfK$FCe9hARTFbCh55@AU&VGBl5&8BOr<1DfTW-DJ()&
Bl[cpFDl2F/e&.mASu%*ASuX-ATD4$AUP!p%16'JATD?)@<,p%F)Po,+C%TK<+T0\F(KH8Bl7R)
+F.mJ+DkP4+Eq73F<G[D+CSeqF`VXW%13OO>[h8WBl89/DKTf-Eaa'$I9SEY>n%-GBlmp'%144#
7:^+S+C'#"G]\%LHV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<WM+Cf(nDJ*N'FD,5.DKTf*ATAo3
Aftf*A7]up$6UI$DesQ5DK@EQ<+ohcA7]@]F_l.BBlbD=BQ@Zq+C]J8+EV:2F!,=.Gp%-=F*2;@
+DG^9G%G]>+Dbt6B-;)#D.Rc2Ecl8;Bl7Pm$6UI5DeEX'BOu3:+B38%A7]7kARTXk+E)9CBl7F$
ARTXk+DG_(AU#>-DesQ5DK?q1BOPdkANC8-%16?LAS5^pHZit@@UX@mD1)j#>[h8WBl897F_l/6
@rH1)I=!bu>?l5\@ruF'DCU!<Bl7HmG]$r,AURhn$=%.[A:&K2EaiI!Bl/8-$=%:eAShk`+<Xp2
AU&<=FF.b@A8Gt%ATD4$AUP\FEa`p.+Dbt6B-;86F`Lu'+Cf>#AKYf'DImlA+BNSlE,]N/B-:o0
%144#@rH7,Ec5c1ARlomGp$@6AU&<=FF.(e5u:6H9hA<4/g+,,AKYMpAmoguF<G:=+>GT)+Cf(n
Ea`I"ATDiE%144#6YKnGB4W3-BPDN1G%#30AKY]!+F.mJ+Cf(nDJ*N'AoDR/+E)9CE+*Bj+EM7C
AM,*,Ea`p+ARlp"Bl7L'+CT;%%144#E,oN"AS#C`A0?)1FD)e=BOr<-FE2)5B-:H$AU&<=FF.(e
5u:6D5t$,DGA2/4+Co%q@<HC.%144#>X<1;Ecb9!CO9<.AU&<=FF-2(/j=]3/e&-s$=%:eASiP!
$6UHrFCf]=FEDkEDe*ZuFCfK$FCfkCD..]4Bl7F!EcP`$FDQ4FBPD*mCh[NqF<Fh"D/a08GB.,2
E+NR.+C]86ARloU+Du+?DK?qBBOQ!*@rH7,@;0Tg$6UI.Bm=`BEb0;7De:,5FE2)5B6,2(DIal.
FD,6++E)@8ATAo8H#R>9/g+,,BlbD*CiaM;BQ%]tF!,(5EZfRH@;p0sA0>c.DJjB8DK?qBBOPul
$6UI$Df0Z*Bl5&0Df021ASkmfA7T7^+EMXFBl7R)/g+,,AKZ/-Eag.rFCf]=FEDkPGAL]0AU%g-
GAhM4F+#S^F(Jo*E+*BjIU$i#B4Z*pAp\6(@leaVCghEsG\1u?DfTB0I4Pg7+<Y0&DBND"+E_a:
A0>u4+D58'ATD4$AKY5hD/a08F`)DD@;p0sA:5S*9OUn3=Blt\DfQtAF^o)-GAhM4F!,R<@<<W%
@;[2sAKYhuDKTB(Cj@.IEa`p+ARlolDIal(DKBB0FCetl$6UI*DBO%7AKYT!Ch7Z1B4YslEaa'$
A0>?,+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4cXAEd8d9F!,[<+Dkh*BQPA<Df'&.D..=)@;I&tA8-."
DJ'Cc+<YB>+CT)1@<lo:DIm<hF)tc1Gp%<FFD)e%9OUn3==t$i%16?ODIe**DKTf-Eaa'$I16Nu
De*fqEc#kQ0ht%f.V`m4E+*d(F!,NU/KeS8AmoguF<G+.@ruF'DIIR2+E1b0@;TRtATDiE%15is
/e&._67sB[BPDN1Anc'm+DGm>F`V,)+EVNEF(KG9+EV:.+<Y3+AmoguF<D]:Bk)7!Df0!(Gp%'7
Ea`frFCfK6%15is/g,7E@VfTu+DG^9FD,5.D..L-ATAo*Bl%?5+BN5fDBL'1+<YQ5G9CF1@ruF'
DIIR2+DGm>@rc-hFCetl$;No?+EV:.+<YW3Ea`frFCfK6+<YB9+EV:.+<YN0F*(u6+D,>(AKYE%
AKZ,:ARlp*D]j+?ARfFdGp"5OBOqV[:-pQUE+*cqD.Rg#EcW@8DfQt/+E1b0FD56-Cgh?,A8,Oq
Bl@ltEd98[<+ohc+Eh=:@N[(0E-#T4.3N,/D@HqJ67sBiAKW*<F`V,)+<YcE+<VeDDe*QoGp"5K
@<,dnATVL(+<Y`:FED57B6,1<+DG^9+<YB9A8-4$A9D<s%15is/g+\=@ruF'DIIR"ATKIH+AH9c
FCfJ8+D,>(AKYr#Ea`frFCfK6+Ceht+E).6Gp$R-+Cf(nDJ*Nk+C]U*$;No?+D#(tFD5W*+EV:2
F!,(/Ch4_tDIal1ARfal@<?4$B-;;0AKYhuF*(u6+D,>(AM+E!:-pQB$;No?+B3#c+DkP.FCfJ8
Anc'm+Ceht+C\n)Eb/a$ART[lA0?)1FD)e=BOr;r@;Ka@%15is/e&._67sBjEb/[$ASkjsFC/Hk
De*2t8khTM<(0\l@;9^k?O[?;67r]S:-pQU=$]_Z8PVc:+CT)&+EV:.+<YW3Ea`frFCfK6+CfP7
Eb0-1Cj@.>BleB-A0><$AKZ#)EHPu9ARlomGmt*U67sC&BOr;Y:IH=HH#n(=D(Zr&AfuA;FWb^9
D/XT/+CT/5+E(j7FD,6&+A,Et+EqO9C`m5.@<6*7+B`W*%15is/g+Y4DBL'C@:j(eGp$O+A0>;k
A8-."Df0!"+E1b0@;TRtATDi7@Wcc8+F.mJ+<Y0&DJjB7+ELt'AScW$$;No?+ED%1Dg#\7@s)g4
ASuT4E+*cqD.Rg#EcWiB$4R>:5uU`O;G]YW9iF29+>=p!+>=63%15is/g+,,AKYT'Ec#6,+E(j7
FD,B0+E1b0@;TRtATAo*Bl%?'Blc<E$;No?+<VdL+DPe&D.OhO+=M>WE+LI@A7]glEbTK7Bl@l3
4!8]TCis:u$;No?+:SZQ67sB'+<VeADIIBn+DGm>@3B`%Ch[E&8g&"[D.O.`:-pQU+<VdL.!0`R
ALSa4ATM@%BlJ0.Df-\.De!p,ASuU2+EV:.+E1b0@;TRtATAnF+EVmJAKY].+ED%5F_Pl-A.8l@
67sB'+<VdL+<YT?Cj@-O.qrmCAS5Rp.3N>G+CfP7Eb0-1Cj@.7G\(B-FCeu*DffZ(EZfILE+O)5
GA1l0%15is/g)8Z+<VdL+C\n)E+*g/ARlolF!+t+@<,ddFCfJ8Ch[s4F!)lPARuupE-,MtCh5%J
%15is/g)8Z+<Yi9Cis;3BlbD*DBNM8ARfk)@:F%a+A*bfG]7\7F)u&6DBO%7@<<W2Ec5K2@qB^(
@3B`%Cis:u$4R>.;aX,J3&Mg$+<W`g-nB"LFCf)rE[`,TBOu'(0d(U[AKYE&@qfX:2'?UN+CoV3
E-!-M0Hb:S+>G;f+<VdL+<VdL+<Vdg+>Fu]%15Hu:g$7R6W?iZ+?L\o.qrmCAS5Rp.3N,=D/aE2
ASuU2+Cf>/Bk:ftBl5&3DIjr,Df9S;E+*g/+=Js,Gs!i=0I\+e+<W`g0eb9j$:IZW<D>nW<(';F
<$47F-nB"LFCf)rE[`,TBOu'(0d("@@ruF'DIIR2+CoD#F_t]-F<G:=+E2IF+=JodDfQsT.3K`U
+?L]#%15L!6WHiL:/k:d6rZ]"4!5q%Bl8$(B4Z*4+EqO1FD)e8Afti2F*),.Bk:ftA8bt#D.RU,
+EV1>F<Dte0KaVC1,Up<+<W`g2DGXJ6rcrX7R9C@:Jr;s+=JaSDKKH&ATB4BDdmHm@ruc7A9Da.
ARlotDBNk8AKYf-Df?h<@<6K4-o!i04>J`I.3K`U+<VdL4!6C7%15To<(9/@<)6C7+?L\o.qrmC
AS5Rp.3NhQEb'56Eb0?5Bk;I!A0>T(+E)./+Dbt7E$0+.F)rHP0eb_84>JTI3%5sm+<W`g1,U`p
$;a`%7R9C@:Jr;X4!5q%Bl8$(B4Z*4+EqaEA9/l7FDl22A0>T(+E)./+Dbt7E$0+.F)rHP0eb_8
4>JTI3%5sm+<VdL+?L]#0JEqC;FOPN8PVQA73E^7+=JaSDKKH&ATB4BGA(Q*+>G!\Bl.F&FCB$*
F!+n3AKZ&&G%G2,Bl5&(F_u)=+=JodDfQsT.3K`U4!66e$:mH]846HP:`pl'4!5q%Bl8$(B4Z*4
+EqL1DBLYV@3B5lF(c\1F!,FBAS,Y$ARlp*D]iS5D/aP=-nlc^EZd(c+<VdL+?L]#%13OO:-pQU
;GU(f7Sc]G78b7BF!,%2E--@J@X0),AS,@nCih9P8S0)ZF<G:=+EM+9+EVNE@3?t5E+*j%.3M5*
@rH6sBkMR/ARlnm$;No?+D,P.A7]d(;GU(f7Sc]G78b7HG%G]7Bk1dr+Co1rFD5Z2@<-W9Ci<fl
FD5Z2F!,(5EZccICi_$JB4YslEaa'$A0>r'EbTK7F!(o!;GU(f7Sc]G78b6i+=L`5@<,ddFCfJA
+ED%(Bl[cpFE8QQD/=8B+EM%5BlJ08+EVNE8g%_aCh.*t+?L\T$4R>;67sC&H#RJ-@;I'(Df0-'
E--@JF(KH8Bl7Pm$;No?+Au!2<(9YW6q'ur4!5q]BOPpi@ru:&.3NYBA8-'q@ruc7-uEdA.3N\A
EbTK7F!,RC+A*bgDerrqEZdFdIW]^CE\D0GA9)U,F<D#"%15is/g*GtGp$O+A7]9oE+*cqD.Rg#
EcW@3Eb-A7FDl22A0>T(+EV:.+DkP.FCfJ8Anc'm+EqL1D@HqJ67sBjEb/[$ARlolDIal#BleB:
Bju4,ARlp*D]hYJ6m-#SEb/a&DfU+GDdmHm@rucE+<V+#%15is/g+4];GKeY7lhc:BOu'(A7]@e
DJ=!$+A*bfG]7\7F)u&6DK?q0AKYJkEb/j*C`m.qDfp.EFD,5.4!8$H@<,ddFCfJ8%15is/g,7L
AKXT@6m,uXA7Zl3A8lX!@VfU)+EV:*F<GO2EcYf5+EV:2F!,OGEbTE(+DGm>Ecko,D.RU,@<-WG
%13OO:-pQU6VgN];FsAL<$47F-t?q!Ea`I"ATB4B4!6h*C`mb4B4uC.+ED%7ATDs*A.8l@67sBT
=\qC^5tsdI78b6i+=JaSDKKH&ATB4BFD,5.@;^.1ATAnT+>bh_$7QDk%16igA8lR(<HD_lCLqd4
1,Vfn/g,.U+E_a:Ebf63F!+t2DJ!Tq+D,P4+E2@>C1Ums+=M2LC2.Zt.4u&::-pQB$;No?+B)i_
+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq01o)`03*()E_Bth
Et&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-B5)H@@Vfsl05Y-=
FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk67sB'7Pd+\4&'F,
ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2F!hD(:-pQU+@C6k
Cb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJBkqE9<c;JV
@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J;eTlWF=Tg=+q4lS
67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$HmCb&FtBkDH;7Q2M#
$;No?+<j`tBkDH;7Q2M#$;No?%15is/g*nb<(/hj@rH7.DesQ<ARlo34==l^A7T7p-RgSp4==l^
A1&fW4=>8nBl%i<+CTG3Bk29-F`V+:De:+>4!u.\BOPpi@ru:&%15is/g*V?4"r`aAR]dp+B!?"
4(Mf@F`&<L-QmG@E,8rmARlp-Bln#23A*!@+EqaECLM7%F`(_!$4R>31-73P;Is]RCLnVUF`MM6
DKIsVDdd0!-YI".ATD3q05>E9-QlV9EbupH@WcC$A86$nA8-+,EbT!*FD5Z2-QlV9@r,^bEZc_W
%15IEEbm6q1-73P;e:%n6ZmEiASuTOEcW?NE,o].De(4<>9Iip+=CoBA7T7p-QlV91E^UH+=ANZ
>9IrtEHPu9AKW@5ASu("@;IT3De(4)$:AoUCb&FtBkDH;7P[%[4%+4.E$.u"F?=Ma+=C]BD/aH:
F=.M)7Pd+\4&TX0F_Pl-+A,Et4*"nPF_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.n2<V0fr9E@sMR#
AKXT@6ouf3De*d(+=nXMDe*cuAgniW%16$IBkDH;7Pd+\4%`::+@p'[E'%fQA8#OjE$-hD$:Zj6
0fqd7@Wc<+;KZk=A7BS%DBL;S%15Q_4#&frATMr9;f-GgANM878PN#(F)>i2AKZ)+F*&c=$<(VP
AooOm2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@C2[X%Ec5Q(Ch5@V:-pQ_C2[X%Ec5Q(
Ch4`1/M/);:IH=9Bk)7!Df0!(Gp%'HDe<^"AM+E!:-pQB$;No?+@0lfAU%X#E,9).8l%htE,ol/
Bl%?'F(96)E-*]T;dji\+EV:2F!,O6EbTK7+DG^&$;No?%15is/g,UOA7TUrF"_0;DImisCbKOA
A1nB!:-pQB$;No?+EqOABHVD1AKYl!D.Oi)De*g-De<^"AM.\3Et&IO67r]S:-pQU<+oue+EM%5
BlJ/:+DGm>+D#e/@s)m)A0<"'AoqU)+CT)&+Co1rFD5Z2@<-W9+E(_(ARfh'+D>2,AISuA67sBi
AS#a%@rc-hFCeu8+A$Yt+Ceht+<Y-)+E_a:A0<":D]g0DATT&;E$-9KDfp(CA7]@]F_l.B+A,Et
%15is/g,@VEbfB,B-:c'G%ku8DJ`s&F=n"0:-pQB$;No?+BLj,:.\2N3Zph/+Du+>+CoG4ATT%B
;FOMQ<)#e/+DGF1D/XH++EV:*DBNk8AKW*f:IH=I@<63,Bla^j:-pQU@:OCnG%E9K8S0)`DJXS@
Df0,/FCB6++DGm>@:OCnG%Ddo78lWS9gpFN+E2@4G%GQ5+CT/*Dg?&7B+52C67sBhCiX)qA9f;9
E+No0+Dk\2F(&]mF!,R<@<<W(Eb065ASuU+Gp%-=F*2;@+D,Y4D'3G/EbAs*FD5W*%15is/g,7S
+Cf5+F(HJ)Bk)7!Df0!(Bk;?.F`;8:+D#e3FD5W*+A+6q$;No?%15is/g*nb<(/hjFDi9E8g%YU
G%GK.E+O'2/g*G&F(f]<A8c[0+EM+3FCf?"AKWC0+Dbb0AKW+6Afs\g+EV:.%15is/g+kGFCfK3
Eb0?2EZcK9G\(B-FCfM9+C\noDfTD3+<Yc;Ec#N.@<?4$B.4rGGAhV?A0<"(AKW+=ATE&*$;No?
+E_a:Ap%oB%13OO:-pQUF(KG9GA(]4AKZ&5@:NjkE,oN2ATDs&FD5Z2+E)-,$997j1bg+W+>F<4
%15is/g,"FDJ<s1D'3e<Bl8#8E,oN"Ble!,DBO%>+EM47G9D0VH$O7DA7Qfn@<?(%+=M;BAKY`+
A79+^.1HVE+Z_>4+BosJ%13OO:-pQUF(KG9C2n><GA1r*Dg-7F@rH7+Deru-F(or3+>"^EF`_P=
@<?3n+D,P4+Dbb0Fa,QV@:Ls)DfZ?p6[*3NC0s+b+>Gc.+>Pb_$4R>;67sBkD]iq9F<GU8F(KG9
BkAK5Dfm12Eb-A6F`))2DJ()/DfTD3FD,*#+E)./+A,Et+DG_7FCB&sAISuA67sBtF_l/6E,9).
8l%htBl8!6@;]RdF!+n3AKYr'Ec#N4FCeu*@Wcc8DJsV>Eb/a!D/Ej%A7]9\$=n*sATT%B;FOMQ
<)#e/%13OO:-pQU8l%htBl8$(Eb8`iAKYf-@ps1b+>"]aBkhQs.3N>G+CQC*Df9//E,8rmAKYT'
EZee$+D>\'+A,Et+CSekDf0V*$=e!aCghC++=Cl<De(4)$4R>;67sC!G%G]7Bk1ct779L=:/aq^
73F0)F(KG9-u*71DKB`4AM.P=ALSa5A8-.(EZcqVF`V+:Ap%p++E1b2BFP;D67sBU8PN#B+CfP7
Eb0-1Cj@-l6pjaF;bp(U+DGm>GA1r*Dg-7FDf0B:+>"^WAS!!-ATD6&-tRKL+:SZH6pjaF;bp(U
?X[\fA9E!.CgT=d+=A@C3a>L%DeF*!D'2;^Ch7Zm9ke*XDf]i/F<FU_+@C'XAR&_`A7[B)G\&'H
%15is/g*SN6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g
.k=kBDffQ0@:Ul=/nK9=+t!g,%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<
+F>4m3[\TZD.Oi6DfTV9FCfN8-OgDa84?EF5tsp63Zoe`Df'&5%13OO:-pQU-u!F7A18X4EcQ)=
0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@fDe*3(
+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.DJsV>
F(KG@%15O%;FsJV6ngAZ3ZoeaDK]H)Bk/>7GUXbVARTUhBHVA<EbTE(-OgDY91_`O6ng;X3ZoOm
DJpY7@<?!mATK4.$;X;d8l%i/0g.Q?+=D&F+E(_(ARfh'-OgCl$;No?+CSek+Co&"ATVK+DdmHm
@ruc7Ao_g,+CfP7Eb0-1+D5_5F`8IAEZek7EcP`/F<GXIBlmnq$=RR13Zp4$3Zp*c$>F*)+EqCA
?X[\fA7$HA-YdR1B."g4D_</IDe*K'@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlj
+D#G$/e&.:%16Nb4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C-u*[2F#u0,+CSek
B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1e;u.1HVpB0A9u1E\_$0F\A'AhG3M
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:_rChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH
0JFV\DIb@/$7QDkA90mp+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QWDe*oN1FXGW
ASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%144#+:SZQ67sC$AS,Lo
ASu!hA0?)7Eb'56DJsV>Bl5&'F`MM6DKI"6Ec6)>%16ut4ZX]A+?CW!%16f]/g)_uG@c#+@;9^k
?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8Ec*KPASu$2%16f]/g+V3A9)0e
@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/$7K>!CiX*!F!)TR/g+eE.3L2p
+D5R$$7QDk+<Vd9$;No?+EqaEA9/l-DBNG3EcP`/F<G4:Dfp"AF`V87B-:V*GAhM4%175j4ZX]A
+?CW!%16f]/g)_uG@c#+@;9^k?Q_HYC2[Wq-Qlr</g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;Eb0?8
Ec*KPASu$2%16f]/g+V3A9)0e@;9^k?Qa!!4Y@jiEc<.9De*K'A8a(CB5Si4ATW'8DD!&CDIb@/
$@*b:F(JlkGp%Mf+D5R$$7QDk+<Vd9$;No?+D58'ATD4$AKYK*EcP`/F<G4:Dfp"A@;]TuF('6'
+Dbt)A0>r'EbTK7%17/h4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CD/=89C2[Wq
+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HUn$;No?+EVO@+=M2OF<G+.@ruF'
DIIR2.3NhQEb'5B+D5_5F`;CQ+EM[>FCfM9Bl5&6AThd/Bl@l3DfTB"EX`@tG<Iu0Eb0E4%172i
4ZX]@-?<[@D[d%qF$2Q,1F@-RG&Ifs%15is/g,1WDBO%0F`_P<DeF><@<3Q1Cgh$qFCfN8+>"^H
De3u4DJsV>F*)>>+E)-?DJsE=ATD]3Eb0<7Cij_-$?C5O3Zp1)EccC4$4R>;67sC$F`&=D@<H[1
Ci<s3+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcF6'0d^p_F:AQd$;No?
+EDUB+DkOsEc3(ABl%?uFDQ4F/Kf7OCht58BQ&);AU&01Bk)6-F)>i<FDuAE%17,s4ZX]?-?<r4
$4R>;67sC%BQ%p5+D>>&E$/b2EZf"8Dfp#?06;8MFCfM&$>='83ZqWf+D>S1DJUG"3Zri'+D5_6
%16ci4ZX]?+D>S1DJUG"3Zri'+>Y-QEc<.,%13OO:-pQUF(fK4F<G7.CiCM8DBNn@F<GL2C1Ums
F!,17+ED%:Bldir+E):2ATAo*Ec5e;@rGmh3XlEk67sB'+<Ve?EZd1]+AP6U+DkOsEc2Bo:-pQU
+<VdLBQ>4N+<XEG/g+eIDfp#?%15is/g)8k0Hb%L+>=o\:-pQUCghC,+EV14+EqaEA9/1eBQ?6s
+>Y-$+>=63BkAt?@UWef@p`YZDe*2tG<IQ$Gp%-=G&JKN-Qlr</g,?\Eb0?8Ec*KPASu$2%17A'
BP_X*C`n-Y+En8%3XlF1AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&C
DIb@/$@*b-CiF9.+F##U/g,Qp+En8%.1HUn$;No?+ED%1Dg#\7FE1f(Ch[d"+C].qDJLA8Dg-73
$?B]eFCK9/G<Iu0>p(A@+BplL/M8/M3Zon)0-W+n><3lV/h^H^+=A9Z-9VeF%15is/g+SAE+Not
F!,RF@;0OlDJ().Bl7K)An>Oa+Cf(nEa`I"ATAo-Aftu&@qB_&@<-W&$?U)r4ZZjk/0H>h0edr_
/h%uO+?^io3[l2"/g)Ps0RI4\.3`+.$4R>;67sC%BQ&);Ci=3(+CoD#F_t]-FE7lu:-pQU+<VdL
+D>S%+>=o\+<Ve%67sC)DfTB0%15is/g)8Z+<Ve?Ch+YD+<VdL+AP6U+D5_5F`;C2$;No?+<W?\
0d&.mBP_3%0H_J\:-pQUA8bt#D.RU,ARlp$Dfor=%15is/g)N:8PN#B-Qm)=A0<QK+AP6U+EqaE
A0>E$@ric:Bln#2F*)G:DJ((>:.\/V3[Y@D:-pQU+=LM</34mu5\OtE+ttGgBeCMc+AP6U+Cf>4
DKI"3De!i2Df-\:@<?/l$>=6d4ZX]5-RL*"+?Co-+?CW!.1HVuAhG38@:Wka?X[\fA7$I(+CoCC
+DPFuEcPMqC2[Wi+@T1+8P2cH0JXbkATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+Eot$+F,)?
DJUFC-Qlr</g,?\Eb0?8Ec*KPASu$2%16f]/g)i2,:5SsG<IQ$I4cXd+CoCC+E)%&@;9^k?Q`-;
8P2cH0JO\jATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+CmVf+=JXb/pSls3@Q(`ATT&=+CoCC
+ClU8ATW'8DD!&CDIb@/$=l:P+ClT>INU<e4<Pjq4s2R&HQk0eA3DOf4u%Cp%16f]/g)i1,Bt>A
D_</C4Y@jf+<u=X.kWJ?.!R(-/h&,2+>G!c+u(3N+D#G$/e&.90Hb]d0d(!U+=o,fEb/^%@WHC2
5U]o"/mg@_5]ggS5U\3:-::Z[-8%J)0d(fe0d(!9$7QDk%15is/g,4H@<,jk+EM47Ec`F;ASc<.
AoD]4F*)G:DJ()#DIal+BleA=D..NrBPD?s+EqaEA9/1e:-pQU+<VdLBQJ5;-Z`j1+Dbt6B."fE
+AP6U+EM+&Earc*GAhM4+EM47Ec`FGAU&;>%15is/g)8l+<Y?=F!)iOAS!!#Df028+<Ve%67sC%
ARTUhBHUr.Dfp"AF(fK4F<G[:G]XB%:-pQU+>b2`BQJ5;-ZF!FF=/1R+<VdL+AP6U+EM+&Earc*
D.-ppD]j+7DfTqBFCf]=+:SZkF)sK*+>>,f3ZpI31a"h%0I[G<BkAt?@UWef@p`YZDe*2tG<IQ$
GT^O7C`k)Q+<Ve;D_</V+ED%8F`M@P+D#G$/e&.u4Y@k%+D>S1DJUGD/g,?I$>F*)+>>r'G<IQ$
0d&YFHQZiA+<VdL+<VdL+<VdLA8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?
0KgY%4Y@jK/g)Pn3dE.s.kWJ!0gJ/[+Enr=D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$
/e&//-@6j^/j:Cg%14Nn$4R>;67sC%Bl7R"AKYf'DIjr%G]7J-DIIX$Df-[,$;No?+<VdLF)5E4
+=DAOEb$O?+<VdL+<VdL:-pQUGAhM4%15is/g)8n+EM@1GT\AKDe*m"B5)F/ATB.@+AP6U+DkOs
Ec2Bo:-pQU+>G![Ch7i6-Zj$9F*(u7F=/1R+<Ve%67sC&ATMr&$?L#pGWe)10IA&++?Co-+?CW!
.1HVuAhG38@:Wka?X[\fA7$I#CcsBnGT^O2F)W7I+CoCC+EM?AEb0?8Ec*KPASu$2%14M./3#($
E-67FGroVPEcZ>4Df'?&DKK5m8l%isDf9H5+EM?.$7QDk%15is/g,1GB4YslEaa'$+E2IF+Co1r
FD5Z2@<-W9GAhM4+CfG1F)rIEAS,LoASu!hEt&IsATD?o4ZX]A+?CW!%16f]/g+V3A9)0e@;9^k
?QaAP/g,1GG&JKN-Qlr</g,0WEb0?8Ec*KPASu$2%14M(/1tum+<u=X/M9+=HQk0eF$2-0+D5M/
@WNk[+EBUtI4fOL$7QDk%15is/g+h9DIe#8@r*8uDdso'ASc<sEcVZsA8bt!@ra^n+>Y-$+=CZ@
CgUUcDe*2t-oNeA0KUsM-RVYU/gi"q+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z/9rg"6W,9@
$=n'bFEhmj3Zp4$3Zoe[FDP;mC2[Wi+=K-&4"r`M4!uC'-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD
/mg=U9L^RY/M9Cg-OgCl$;No?+Co2-E,8s.+Du+?DBNk8+EM%5AS#a%@;]TuEb0?8Ec*";Dfoq?
G%#30AISufBQ&*6@<6KQ3aEk4+>G$#1+"ac$4R>;67sC"DfTr.@VfTu@W-K6A9)+&Bl7Q+@q]:k
@:OCjEcVZsE,Tc=@q]:kF$2Qg3ZpF+3]A0/.k<,#.k<,#.sror,$uHs+C,E`%15is/g,@PDId[0
F!,:A@qfI^+Cf>-F)Pl++C]86+CoM$GA1r-+Cf(nEa`I"ATDi$$?p3%Ch$sg@<-EP3a4Wf3?^FB
+=LYNH[[\-.qpUj0e";R+Boso%13OO:-pQUARoLs+Cf>,D..<m+:SZG:IA,V78?fL:JFPL:..6+
+=D5DDg-//F)rICEZc_WH[\_=I4$Bi%13OO:-pQUEb/Zi+=84TEbTW,+D,>(ATJ:fEb/Zi4ZY;@
3\_s0?!oc[/grM2-9a[C1Eee5.4H\T$?pN)FCdTr0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$?B]d
A8Z=.DEU$:+Z_AD-nul+0d\;S?p$\,-o3V*5!UMP+Z_;+.4H\T$?pN)FCf?.F`'?'-sJ_T1Eee6
+Bp9;-nul+1*Bk14?tMI1GU:@5U\E33\W!3.3Mn*$4R>;67sC$ART*l<'`hnA7]RkD/"*'A0>u&
@VfTuAnc'mF!*%WAmob&ATAo8BOPd$-urm-A9;?2+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WG
Ci_$7$?B]dA9;?;4ZZe.+?V_<?SWrl+=K6s@4iuO/1)u5INViU+?V_<?SWa.3ZohV+=nW`-o!E&
@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3L#n1OEO_.3L2pINU?g3\_s0?!oc[/grM2-9a[C1Eee5
.4H\T$4R>;67sC)EbTW,F!,R5@VfUs+CT=6<'`hnA7]RkD/"*'A0=Q8+EV18D/!lrFCeu*FCf]=
+>"^WAS!!#Df021A8bt#D.RU,+DG^9.!9WGCi_$7$?pN)FCfQ)1-I[(+=Jrf3\hg`?p$\,-o3V*
5!UMP+Z_;+.4K]g><3lT><3lT>p([@-n$f(HXSNU,$uHU+F?-u+FPjb-o!E&@4iuQ?R[+%3Zri'
5U\0K-o!%s/0Zet5U\3:5U\*703g+R0gI-M-79o`5[>ff.4HAa+=oc+-o!E&@4iuU-nHPs.6q/f
.3MhU+FPjd0d'[]+?Lc%+=K6s@4iuU/3kC?-8%J2+Bo9^%15is/g+b;FCSu,ARoLs+EV1>F>%K>
@rcL/+CT.u+CT>4De!KiFCcS)De*Dg$?UAQ3aEji+D5d*$>jlJ3aEji+>Peu?Q_EQB657=+AP6U
+=]!cG]XB%D/)3p>p)3O1,0t[+?L]YF<D\K:-pQU.P>FMEt&InA3DtZ+?L]$2^2TO4!80X+<Ve%
67sB1/o>$;CLh@-D@HqiEBQ?g+?L]%0HsjH4!80X+<Ve%67sB1/ou#K%16rs4ZZjk4!6:6,$uHS
+D5d=+<XEG/g)VrFCf\+$4R>;67sC0F`V,706CcBE$0(.C1Ums+EV1>F<E.XA7]@]F_l.BC*7S-
EbTK7%17#p4ZX]5Bkh]:-6tVp3ZohT3Zr0V@<?0*-[p2ZATBGGASlB>-Qjr_-mp,b+>#3p+C-E=
/0H;m-Qjr_-QjcZ/M;Jp>:C!g+:SZQ67sC$ART*lFCf]=+D,Y4D'3R9F`V,7+EV13E$/\*Eb/a&
DfU+4$>OZG3a4WfEb/Zi+E)<1$6Tcb:-pQU+Dbt)A0>V0F(96)E-*47Ec5e;C*7Y?ATAo8ASlAq
$>OB?3Zoh)+Z_;+5\bBM$4R>;67sBsDdd0!C*7S-EbTK7+D,Y4D'3>,DJ!TqF`M&(+DN$<@<?/l
$>ONC3ZqWf+>=s"0HaR\+?Uc]E+*j%%13OO:-pQUCi<`m+CT.u+EM47G9CWCF(96)E-*47Ec5e;
@rH6sBkMR/ARlp&@<?/l$>OO$4ZX]i3Zp+"3\W6B+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4
+E(_(ARfh'+>"^YF(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W
/hSb*+DGF1E,oN2ASuT!$;OA`;a!/a0ea%D%15is/g+\ID/^V.EbT].+>"^YF(Jl)@X0(EF`_>6
F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5ATMF#F:ARP67sBK<D?:k8PVZO<]rJd-YPOg%13OO:-pQU
A9Da.+E1b2BQG:J+E_a:A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?
+@K4(:f'GW83K!V-SK4QA1q\9A7Th"E-!Z[%15is/g*P^9i+Ya<_u(]83K!V-SK4QA1q\9A8lR4
A9Da.F"\mM$4R>;67sBjCh7$q+Co1rFD5Z2@<-'nF!*%WF`V,)+C]U=.!9WGCi_$JD.-ppD]gH<
Ch7$qE-67O+DGF1E,oN2ASuT!$;No?+@Agk5uL<C8OHE>3ZpLF-RT?1%15is/g,4HF<G!7E,oN%
ATDg&A0>],@ps0rE+*WpDdsn4/Kf1WARlomGp"MMDe*ZuFCfK$FCcmD/Kf.UGp"MZBOu3q+E1b,
A8bs,%15is/g*tg77K^D;FNuM5u'gD6TmIQ-UTq"<HD_lF'N?hDK9H$/p25HEa1nLE(",V@9cKE
@ps1Y:gn6PDe!$k@;]Uo@j_]m:-pQU:f9_O78d#P6r60E6r-053Zoe'F`VRVCi<flCbK73DD,s;
DIdZq-OgCl$;No?+A,Et+Eh=:@WNZ6H#RJ-@;Kb*+EDUB+D,Y4D'3q6AKYGjF(HJ1De!3lAKVEh
@rGk"EcP`/F<Dr?@<6!-%13OO:-pQUAU%X#E,9*,+E(j78l%htF(KE6Bl@l3F*(i2F<G^FF!*%W
F(fK9Et&IO67sBoDg*=GD]it;ASrW$Bk)7!Df0!(Bk;?.@;]TuBl8*4CLnW-Ec5](@rri1@:O=r
Et&Hc$;No?+EM+9+E_WG@s)g4ASuT4E,ol3ARfg)-nuicF`;;?ATMo88P^l[0Hb:S+D#A'A7]9o
A8-+(CghT<%15is/g)kkEbupHE,o]7D09K)@:O(eDJ(=>>9J!(Dfp/@F`\aEA0<rp-Za-IB4PRs
+EMCBB-;>=Bl%i<+BosE+E(d5-RT?1:-pQU0d(LR+=D,KC2IO$-QlV9De't<D.RZ6+BosE+E(d5
-RT?1D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIa
F<Etc@ruF'DIIR2-OgD`78d&U:JO&6-S[5./heX^$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S
7ScoV;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\
78l?1+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrG
Bkh\u$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i
@;@K0C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%
C2[WnDdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7E,K:t
$>OKiA8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9
A9Da./no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo
05P'+AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z
78?6L4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=
C1Ums+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K
8l%htF*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6
F!,(5EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=G
AT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3
F!,.1B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et
6r-0M9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3
AoD]48l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!
AoAeYF`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S
@WNZ#Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV
:IH=A@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>
D]iIu@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,
Bl@l3BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8
F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($6UH6BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E904Ja9@P;S,F*(u605>E9A8bt#D.RU,05tH6A8bs2C2[W8E+EPi$7QDkD..<rAn?%*C2[Wn
De!p,ASuTF0ht%f+DkP)BkCptF<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-
FCB9*Df-p3$<BSn;b9b[4ZX]50eP.41+*M<7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ
9L2WI:Jsnc4ZXr<%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCpt
F=q9BEt&IiBleB7Ed99ZG]XB%E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU:IIKZA8c@,
/oY?5%17&bAn5gi01o#.6=k4[:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.8T&WjDe+!#FD5Z2
9OVB_E+EPi$?0NfA8bs28l%iK@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.;f?f!@qA#GA7\/O
D/`E`EbTK7F%g"O/oY?5%17&bAn5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8XE+EQkDdtG#F(oN)
8l%iQAS6.%@<+e]E,oN2F(oQ1F"VEBAdo)dA7f@j@kUi'Bl7QUDe*ZuFCfK$FCd(DA7c8X.1HV^
78--9;aii1+=ANG$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2
/oY?5.3NhJBk(g!A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$;+)^+@L-XF_t]-F<G".F)N12
Df0Z*Bl7u7E+EQ'G%G]8Bl@m1+E(j78p,)uFCfJ%$>sd(AR]RrCNCV?BOQ!*F(fK9+D>\;+EVNE
F`V+:G%#E*Dfp+D8l%htAmo1`Ch\!*ATKI5$<(MI+EV:.+Co2,ARfh#Ed9\T$4R>WE+*j%+=DVH
A7TUrF"_0;DImisCbKOAA7TUgF_t]-F>%TDAn5gi-OgCl$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3
AKZ).AKXT@6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'
3XlE*$>=O'E-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A6t
$;=l-AQU'cDe!p,ASuT4F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1
@rH2n$7QDkD..<rAn?%*C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP
:JO&6-V@0&+AZH]ARfg)6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZX70eP.-%15R#9LM<I
4ZXs'ASu("@;IT3De*p-F`Lu'-OgDZ9L2WI:Jsnc4ZXs7Bl5&0Bl8'<+Cno$GA1qB%15cp6:4%<
77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IkDe*BiFtRKDEt&Ik
De(J7C3'gkF`_>6F"V0AEt&IkDe*p-F`Lu'F(KH9E%Yj>Et&I*%16!%9LV6G76N[Z-OgDN78QEJ
6rQ60+>=p!+>=63B4YslEa`c;C2[Vl$7QDk6q($A;Fs\a8P`)E3Zp+!3Zp*c$7KY-A92[3EarZ0
+Cf>-FCAm$F!,O8EbSruBmO?$+Co1rFD5Z2@<-W9A9Da.+EM%5BlJ08+:SZ+C2[WnATfV>De(DA
FD5Q4.4u`BBOu6r+CoV3E$043EbTK7F!+t2DKK<$DBNA(C`mh5AISuVDe*E1+EV19F<G(%F(KDD
+C]J-Ch+Z0@rc:&FE8uU@;]TuA8bt#D.RU,@<?4%DBO(CARl5WFDi:4AThX$Df?h-DIal,@;0V$
@;0U%8l%ht@;]TuEb0&qFCeu*F*VhKASlK@%13OO7!3?c+EM%5BlJ08+CT;%+DbJ,B4W2X+EM%5
BlJ08+EV:*F<GC<@:UKkBk)7!Df0!(Gmt+!@VTIaFE8R=DKKe>8l%htA8,OqBl@ltEbT*++EqL1
DBNtBDCuA*%15^'6m-PrF*(u1+Co1rFD5Z2@<-'nF!+n3AKYW(De'u%G[YH.Ch7Z1De:,*Dg*<r
:IH<7$=dL^+C\n)F`V,)+EVNE@WcC$A0>B#D/a<&GT]U$F*VhKASlK@%13OO8l%htEb065Bl[d+
+EV:.+=Lc/FC?h;Anc'mF"&5?A7TUr/g(T1%15^'6m-PhF`Lu'+Co1rFD5Z2@<-'nF!+t$DBND"
+EM+9+E_WGBl5&8GAeUJ@<loT%13OO0e"5CF`&=DBOr;Y+EM%5BlJ/:%13OO+<VeU@:WneDK@ID
ASu("@;IT3De*p-F`Lu'05>E9F)Q2A@qB^mFEMOTBkh\u$4R=b+<XWsBlbD2F!,R<AKZ#)@rH4$
ASu$iA0>`#FD,T'/g)QWDe*p-F`Lu'F(KH9E%Yj>F"&4@$6UH6@ps6tFCArr+CQC0Bl8'8AKYo3
+EMHDFDi:BF`&f@$6Tcb1+=>DF`&=DBOr;Y:IH=A@:C?'8l%ht;f?f!@q?cMDe*E%7!3?c+B)cj
BlJ08/g;DI$6UH68l%htCggdo+CT;%+DG^9FD,5.-q@idATD3q.3NG8@N]/hFCf*'Ed98[8S0)j
DflKr+<Ve;D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-A0>f.+EV:.+A?3Q+Dk\-F`S[JF(HJ9BOr;[
@:BZQ+<Ve9Ec6/CAKYH)FEDG=+EVNE@:NeYF)sAO$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA1q\9
A8G[`Et&Hc$;GGZAKY])AoD^,@<?4%DBNY7+CTG%Bl%3eCh4`-DBO%7AKXT@6m,<7B4W2oF?0j<
+<V+#+<Ve?FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*
$7QDkD0]l7A8lR-Anc'm1,2Nj/h1^`C2[X%Ec5Q(Ch4`1/M/)^Gp#^T6m-#S@ruF'DIIR2+E2@>
Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5
BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)
AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8
@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)
F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@nCigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,
/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./
+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)sAfu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[
743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(
DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:
AU%p2Bl7Q+8hLP[:-pQB$;No?+AQisAKZ)5+<X9!A7]pqCi=9(EcWiU5p15^F`_/4GA\OEASuU$
DI[6#-t+67Bl7K)+E(j78g#6uBOqV[:-pQUBl8$(Ec?&1FDl1B+D#e/@s)m)F!)T7AS,k$AKW*<
FCfK0Bl7@$Bl7Q4+<YlHF_kS2+C\n)+Eh=:Gmt*U67sC'F(Js+Cb?/(:-pQB$;No?+CTD7BQ%oP
+A-QcDBM>"+@9LPATA4e:-pQUASkjiCcW[]@UX%`Eb],F3C%4o@;0O1@rH2n$4R>;67sC%ATT&=
BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?
Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;
67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7
Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0
Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"RCijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4
D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1
Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o
@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=
.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@
Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZ
B6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*
FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3jDJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl
$;No?+=Lr=De(:>ATDg0E\APPATMp$B4W3-AU&;+$:Rij8P2cH0JGXN+=CZAEcP`/F<G4:Dfp"A
DIIBn+=LuCA7o7`C2[Wi.3NMHF<GX9F=.M)78d#T8l%i/0g.Q?-Y%:>Eb0-1+EM[>FCcS4@;TQu
-u*[2F'iWrDe*3(+Du+>+EM+9-OgDY91_`O6ng;X3ZoOmDJpY7@<?!mATK4.$4R>;67sBhA7Qfn
ASbq"AKYo#C1UmsF!,(8Df$V,F`MM6DKI"6Ec6)>+E)9C@s)g4ASuT4F*22=AISuTB0A9u1E\_$
0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+DPh*B-:VnA7oq%+F,)@Cia/?+DPFuEcPMqC2[Wi
+@T1+8P2cH0JFV\DIb@/$7QDk@<4Rm+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[X(-Qlr</g)QW
De*oN1FXGTA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2%14Nn$=md43Zp4$
3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</IDe*K'A7]RiEc<.H+D#A1AM,*?A7]e%?X[\f
A7$HJ;Gp(Y:IHlj+D#G$/e&.:%16We4ZX]A+?CW!%16f]/g,@LG[FloDe*2t4==l^A90+@A8a(C
-u*[2F#u0,+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk+<Vd9
$;No?+ED%*ATD@"@qB0nGAhM4F!,@=F<G:8+CfP7Eb0-1+D5_5F`7csDKn<*+>Y-$+>=63BkAt?
/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T8l%i/0HbCIFEMVA/g+_CA1e;u
BkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8F`M@P+D#G$/e&.9@;Kb#AS-!+
+FPjbB5T.@/M8/YD@Hq%%144#+:SZQ67sC)DfTB0+DG^9@s)g4ASuT4B6%p5E$0:EBl7Q+@3Bc4
Eb#UdF_<iu+>Y-$+>=63BkAt?/M;6YG[FloDe*2t4==l^A7m84A8a(CC1LmrEaN6iDe*2t78d#T
8l%i/0HbCIFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tB5Tjb+D5_6+DPh*B-:`'/g+eE+ED%8
F`M@P+D#G$/e&/5+E_a:A7Bg,I4cXTD@Hq%%144#+:SZQ67sBnASu("@<?''@s)g4ASuT4B6%p5
E$/S,A0>r%G%De4Ddd0!F(96)E-)NrF([Ws+>Y-$+>=63BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr<
/g,"IF!,49A7m#rCia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$4R>;67sC&Df?gI
E-67FA8,OqBl@ltEd9)VGAhM4F"AGHEc6)>F"AGTF_Pr/F!,17+ED%:Ble!,DBNk<A7]cj$?UJT
3ZrHSG&IfsFD!`t+>P9aAThu$$?U>P3Zp4*Eb0E4%13OO:-pQUEcl7BFCB<6Des?)Gp$O:+E2.*
Bl8$(F*&NV+CoD%F!,@=F<GXHDf?h;DBNh8DL,l7D]j(3F*2;@Et&IsF?MZ-1+%$`F:AQd$;No?
+EDUB+EV19F<GX=Ch7L+Cj@-T+E).6Gp%$JFDuAEF!,[?@<<W7F(KA7F(KH7%17,q4ZX]?-?=3M
%13OO:-pQUEcl7BD.-ppD]j+8Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N
3Zp.(Ebu6m%15is/g,4KDfTqBBOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC
+FPjbB6%r#$>=KD3Zp."BP_X*C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF
+E(_(ARfh'+DG^9Eb0E.F(Jl)DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-pp
D[d%K67sB'+<Ve?EZd+[+AP6U+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4
Et&IiE]lH+1E\_$0F\A'AhG38@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&C
DIb@/$@*b-CiF9.+FPjbG7=m?%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;
FEMVA/g+_CA1e;uGp$d:E,KJ7GT_>c+FPjbG7=m.%13OO:-pQUF(Jd#@q[!+BQ%p5+D>>&E$/b2
EZfFFEbTE(+CT.u+Dbb5F<GF/FCSuuDJ()9DfTB0%15is/g)8Z+<Y?=F!)iOAS!!#Df028+<Ve%
67sC%ARTUhBHVM;Eb$;6BQ%p5+EV1>F<D#":-pQU+>P&^BQJ5;-Z`j1+Dbt6B."fE+AP6U+EM+&
Earc*B6%p5E$048DfTqBFCf]=%15is/g)8n+<Y?=F!)iLDf^"J+<VdL+<Ve%67sC%ARTUhBHV/#
@rcK1F(fK4F<G[:G]Y&;$>=L%4ZX]A+?CW!%14d3BQJ5;Gmt*A%16f]/g+V3A9)0e@;9^k?QaPU
/g,B]A8Z3+-RU#Z+CoCC+EnrKATW'8DD!&CDIb@/$=l:P+F##BCiF9.+FPjbG7=mnAhG2[4X5/6
/g)kk5!XH;A0<!;+<VdL+<VdL+<Y35/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%16f]
/g)i2,BH"#+A"1.-nIE).3L,n0-W,974o^,+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&C
DIb@/$?IP@+=8^)+Ckog.1HUn$;No?+EM77B5D-%Ch[cu+D#e:Cgh3iFD5Z2+:SZQ67sB'+<Y`A
AU#=FGAhM4-QjNS+<VdL+<XEG/g,@VEb#Ud:-pQU+>b3^Ch7i6-YdR1Eb/ltF*(u6-QjO,67sBt
@:O=r%15is/g)8k+EM@1GT\AUBPDO0ATMr@+<VdL+AP6U+EV19F:ARuCh7iS3Zp4$3Zp*c$8<TD
Ch7i6Gmt*A%16f]/g+V3A7KF_@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/
$7L-M3%5thF`\aO4(`2IF*(o1D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''
E-67FA8,OqBl@ltEd8dODfTA2@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\bi
EarHbC2[Wi+EBUt+ED%:D]gDT+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]
4YAE2B5DKqF!a'nE]l%'/ohC..1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+
1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6U
GqCX9;C;n\A8bt"G]Z)0+>Y-$+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$
6uQOL+C.&]?SNZs7P&g:/jiMa%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8
DBNh8F`&=F@;L't%17/iDg-//F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+
DJ()%BOPpi@ru:&Et&IqDfTr0BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?
+EqO;A8c[5+Dc11Bk1Wp@rH7+Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)
><3le+Z_P)-t+`TIPE`2BeD+p.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV
9hdoK6p3RR-Z`s>GApu3F!,FB+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&Is
ART+43\_d=0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5
.4G]5Eb/ZiDJsZ84ZYAB3\irK0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/
><3l_+Z_>#>:C[C0d/S5+C/A;5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc't
Blmos+EV%$Ch4`$Bl%@%+>"^J@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4
Bl5%AF`_>6F"%P*Eb/ZiFC[-i3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM<
/0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*
5!UMP+Z_;+.4G]5%15is/g,@YBlmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$
ARlp*AU&;>/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk1
4?tMI1GU:@5U\E33\W!3.=NCD3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO
.3MhU+FPk--nIV30d\;"+u(N3-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q
/0Zet5[>ff+BplLI4c]u+BplL4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.
FCf]=05Y--Ec6"A@;]Tu@<6L.@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]Y
F<D\K:-pQU.P>gfF:ARoC-=U`+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS
+D5d=+<XEG/g)VrD..I#A8c[0%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji
+>P\r?Q_EQB657=+AP6U+=]!cAU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@n
Cige7+EM%5BlJ/'$?'uK3ZoeaC3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ
/M;Jp>q$mI+=Ach+=nW_+=A9`/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.
+Co2,ARfh#Ed8*$C32U"><3mIART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:
EZfI8D/]pkC2?$o+=Joe3\W!JC30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(
C*7J(FD)*jC2c<s+BplL0HiJ2+BplL4<SBX@<?/l$4R>;67sBuF_tT!EZf:4+E(_(ARfh'+>"^Y
F(Jl)@X0)>@<-(#F`SZRF`_>6F"&5K@:O=rF!)lPBmO?0F`]/W@:s.jF`]/W/hSb*+DGF1E,oN2
ASuT!$;OA`;a!/a0ea%D%15is/g,:XARlomGp%0HD.Oi,@:O=rF#kFF84?EF5tsp63ZpL<+F>4m
3[\TZD.Oi6DfTV9FCfN8-OgDa84?EF5tsp63Zoe`Df'&5%13OO:-pQUA9Da.+CoM,G%DdJ+E_a:
A0>?,+=MASBl%i>+DkOsEc3'KA9Da.E-67O+DGF1E,oN2ASuT!$;No?+@K4(:fg4`6rI&K3Zoe`
3[Y@D%15is/g+\ID/^V:@<?1(+>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=LcCD/aH:F=A>HAfu&5
ATMF#F:ARP67sBK<D?:d5u^B<3Zoe'C2[W9C2[WnF_u)=0..29:-pQU6rcrX:f:=j5u^B<3Zoe'
C2[W9C2[X%Ectu9D/aPL-OgCl$;No?+Cf5!@<*K$Bk)7!Df0!(Bk;?./Kf1WARlomGp"MXFD5Q4
.3NJ9@rcK1-t@()@<-=0F=A>HAfu&5ATMF#F:ARP67sBJ9LV6F8jl6<;a!/a4$"`:%13OO:-pQU
F(KG9@3BN0AS,LoEb/c(E+*WpDdso.DBO%7BlbD6@:NtbDIjqB+E_a:A0>?,+=LuCA8Gt%ATD4$
ALS&q:-pQU:f9_O78d#P6r60E6r-053Zoe;3a>[+ATDisB4Yt$Bk&c<F(KAs6#^d2@<>p_9Q+EL
Cg9eFDIdZq>]=+hA8bs*%13OO:-pQU8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#
AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=
FCB33+E_XE+>"^WBQ&*9%15is/g+hGG9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4
De`inF<GF/@rcL/%13OO:-pQUF(KG9F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB
+E)9CASc'kARlooBle60@<j:2$;No?+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4
+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:
AT0">>9G^EDe't<-OgCl$?1$#C2[W<0ht%f.WBECC2[W*F"JsdC2[W*E,ol3ARfg)F(KH9E%VS,
:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ67sBjEb/[$ARmhE;e9oiASkmfEZd+k
0K0FJ:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72fE2J0fL4`A7T7^+F7X6Ch7Ys$;No?+>>cn@rsF[
+CSekARloL;aX,J3&MghF_u)=%15is/g)i-De!lD1a$LMF(KB6ARloL;aX,J3&Mh"ATW$.DJ()+
DKKe>C2[WnATf22De'u5FD5Q4+E1b0@;TRtATDi$$;No?+>GleARdDP+ED%;EbTW;ASrW&DfQsm
+?;&.0d$o4:-pQU1,*TaFttru@:X+qF*(u(+D,P4+A*b:/hf%'%15is/g)o+An>F*0d'n8C3=T>
ARloqDfQsm+?;&30b"I!$=[O[@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F
.4ci]De*BiFs(O<A0?#:Bl%i<+:SZrA0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6
DKI"FDfTW-DJ())Ec6)>+>"^XG@b2u+CT=6DImBiARl5WC2[Wq?YO7nA7%J\+=CoBA1%fn%15is
/g+YHEcP`/F<GdGEbfB,B-;8<Blmo//Kf.ZART?s@<3Q/AS#C`A.8l\De*orBkhQs?TgFm-YdR1
F)>i2ATVL)FE8f=$4R>;67sBsDdd0!F`V,+F_i1CFD5Q4+DG_8D]gHBC2[W3%15is/g)NUC2[W1
+D58-+FPjbB6%r6-YII=@r,RpF*2S=Ci^s5$;No?+=Cl<De(4<B4Z0-I4cXTEc<-KA7B+pF=.M)
:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=ATqg%FCf3.@rc:&F=.M)-Y[=6A1&L4ATVs;+?MV3AnQ-,
BkCj&+:SYe$;No?+E2IF06hMKAfrZJBl8!'Ecc@FD/Ws!Anbge+A,Et+EqaEA9/l-DBNk,C1Ums
+Dbt+@;KKa$:IZW<D>nW<'sGU9gMNB?YO7nA7$HB3Zoh)+?CW!.1HW*D/XQ=E-67FE,m'KH[\_=
I4#I2ATD4#AKW@IISP??-OgD2-XeARC2[Wq?YO7nA7$c.B4Z0--[U;;IXNRQ$7QDk%15is/g,4H
F<F1O6m-VnATAo/AU/>>/Kf(FEHPu9ATJtd+ED%0Ddd0!FDi:1@ruF.@<?&i$?L'&F`_SFF<DrR
F(KAbAU/>>Eb0<'F=.M).!0Au:K(484!8l2+=nWi+E2%)CEPGVB4Z0--YdR1E,o\nF(KB-AU/>E
.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L@qK@$+:S[!D/XQ=E-67F-V@0&+E2@>C1Ums
+EM+9F`8];$@7#EC2[X"@;0UdFCf\P1*n&;@;0U%8l%ht.!g2cC2[X"@;0U3FCf\G+DbJ.AU#>0
Bl%?5+:SZ(%14C(8l%htF)Q2A@q?csF!+t2D/aE7ARlp%AftM)DKTf*ATAo3AftT"@<6L$F"SS7
BPDMs$7-g,Bl%?'@<6L$D.7<mF!+(N6m,uU@<6L$F!+n/A0>H.E,Tf3FDl2F+DkP/ATDKnC^g^t
+DG_8D]iI2F(oN)Ch4`1Dfp)1AKYK$A7ZloDe!p,ASuTB%14Bj$7-g)Df'H-Ch[d"+EV:2F!,(/
Ch4`0AT;j,Eb0;7E+EQs@<?(*/0K1KCghEsGRY!+%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e
,p4<QD..3kBl7HmGT_<YH>7A/D..-r%14C(+<YW6Ao(mtAU#=?H?smPDe*]nBl4@e,p4<QE+EQs
@<?(*+<YuVH>7A/D..-r%14Bj$7-g'Cij6/DIIX$G%GK8%14Bj$7-f;+Dc1/CghEsGT\,TH?s=E
A8PahD@Hq!+<VeD@;BFgDId='+F8?[C2[X"@;0Tg$7-f;+Dc1/CghEsGT\,TH?s=EA8PahD@Hq!
+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.
%16?KF`_;8EdLDsBPnq\/g*JhCLqO7%16?^Bln0&HX(Z(G]\%LHR!ug,BdX=F(oQ1,CY(d+A,Et
I3;I,F`Lu'+@C'XAKY5_+C&MsDffl8FCfN-H=\4(F`M;FBQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E906D5GAM7n/F*(u605>E9Bkh^;>]+J#D..7%BmO?=%13OO,p6]9D/E^!A9/l*DfQt/
A867.FD5W*+Co2-FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,DJ()#+EDU@AISuO
F(KH0ASu.&BR<uoDesQ5DKBB.I=!b]D1)j#>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@Ti
I16NgFE_Y5DesQ5D@Hp^$=%%OB5)71A8bt#D.RU,I16Mm$=%FVCLqU%FDPLt$=%[]@VfUoAn,as
FCf?3Et&I]Df0,rDesQ5D@Hp^$=%I[GApu'AISuOBl7m4FF/=[C2[X$G%kN3/p(ZLI16Mm$=%I[
GApu'AISuOBl7m4FF/=[C2[X$DD$$BG^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A//p(ZLI16Mm
$=%I[GApu'AISuOBl7m4FF/=[C2[X(FDl22/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[Wn
Ddk>@AU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8PajAM/(9G^U#.%16?XATr*%B4VMZ>\S(p
F`_tVH>7A/F`_>6/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X)Df9H5/p(ZLI16Mm$7/qp
ATr*%B4VMZ-!YA+ARfXpF_u"*$7/qkDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'
AISuOE+iZtFDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:FCf]=FEDjm
3di,BDId='I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%13                     ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekR/0f^@3+>G_r1,pC30H`/-+>P_q1,0n+2BXb5+>G\q2`)X30d&A6+>PVn1,g=10H`,1+>GYp
1H$@20d&50+?1K!3?U%5+>Z##0ea_*1*A;++>Pr"0f^@42]sh6+>Ykt0esk,2'=e"0fL401a"Y6
8l%iA<CokP84c`Z:Jt>9ARf:hF<F1O6m,r]Bl%<&BPDO0DfU+GCi<rY:IJ/X:J=\R<CokP84c`Z
:Jt>9ARf:hF<F1O6rZrX9N*'CF_PZ&+D>J1FDl2F+Dbt/8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhn:
F_;h5DeC2$DIal1ATMg/DKBB1:et"h?YXLiCh\!&Eaa'$C2[X!Blmp,@<?''E,Tf>+E2@>@qB_&
DfSfQ6r./^:IITH6XO\@F)Q2A@q?cpDfRl]BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A8bs2@Vfsl05Y-=FCfJG<)5nX?V4*^6r-0&D.HUA6r./^:IJQ,A92[3EarZ'AoD]N+D>k=E-"&n
05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r./^:IHgPA7B[qCh.:!A7TCq
FE2))F`_>9DJ"$-C`l>G6m-#SF*)G:@Wcd,Df-\,F_PZ&BPDO0DfU,<De*KlDImisCbKOAA0<HH
@q]:gB4W3!BleB7Ed;>4F*)>@H"q8.A8bsjASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0
DfU,<De*ZuFCfK$FCeftG%kN3?Z]k(C2[X!Blmp,@<?''Dg#]4G%kN3+A?3CAQW\cA8kstD0'6!
AmoguF<G+.@ruF'DIIR2+E1b0@;TRtATDj,De*g-C/o=dEbf63F)c:EF`V,7CLqd4+Cf>-Anbm#
AoD]4E,ol3ARfg)-ua3AC2[W3C2[X%Ec5Q(Ch6476m-#S@ruF'DIIR2+E2@>Anc'mD..<rAn?%*
C2[X%@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU/@:O._DBNe)
DJ<]oF*&O:DfQsm:IITH6WHiL:/i?EA7TUrD..<rAn?%*C2[X(Dfp)1AT2'fD..<)D..<rAn?%*
+D,P4+A,Et;bpCk6U`,+A7TUrD0]l7A8lR-Anc'm9mIjR:IH=9Bk)7!Df0!(Gp%'HDe<^"AT2[)
C2[WtDe'u0Ec5](@rri7ATW'6H?smPDe*]nBl7:"AU&66Dfd+<@<?(*+D,>(AKYT'EZek1D/a<&
FCcS0De'u3Dfp)1AKYf'F*),6B-:`'@s)X"DKG                                    ~>
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
zz=:zz,'dirs setjaddoncopy setjaddonpaths setjodinterface sha256 showpass s'
zz=:zz,'moutput timestamp toCRLF toHOST toJ tstamp updateJODTOOLSfiles upda'
zz=:zz,'teJODfiles updatejoddistribution updatejodmanifest updatejodsourced'
zz=:zz,'umps wie write''),(<<;._1 '' jod ALPHA BYTE BYTESIZE CNMFDLOG CNMFMAR'
zz=:zz,'K CNMFPARMDEFS CNMFPARMS CNMFTAB CNMFTABBCK CR CREATION CRLF DEFAUL'
zz=:zz,'T DEPENDENTSEND DEPENDENTSSTART DICTIONARY DIGITS DOCUMENT DODEPEND'
zz=:zz,'ENTS DPATH DPLIMIT ERR001 ERR002 ERR003 ERR004 ERR005 ERR006 ERR007'
zz=:zz,' ERR008 ERR009 ERR010 ERR011 ERR012 ERR013 ERR014 ERR015 ERR016 ERR'
zz=:zz,'017 ERR018 ERR019 ERR020 ERR021 ERR022 ERR023 ERR024 ERR025 ERR026 '
zz=:zz,'ERR027 ERR028 ERR029 ERR030 ERR031 EXPLAIN FREESPACE GROUP HASH HAS'
zz=:zz,'HFSX HASHHDR HEADER HTML IJF IJS INCLASS INCREATE INPUT INSIZE IPYN'
zz=:zz,'B IzJODinterface JDFILES JDSDIRS JEPOCHVER JJODDIR JMASTER JNAME JO'
zz=:zz,'DPROF JODUSER JODVMD JSCRIPT JSON JVERSION LASTPUT LATEX LEAN LF MA'
zz=:zz,'CRO MACROTYPE MARKDOWN MASTERPARMS MAXEXPLAIN MAXNAME NAMECLASS NVT'
zz=:zz,'ABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK006 OK007 OK008 OK'
zz=:zz,'009 OK010 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDEL PATOPS PUT'
zz=:zz,'BLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEXT UNION UTF8'
zz=:zz,' WORD XML ZIG abv afterstr alltrim badappend badblia badbu badcl ba'
zz=:zz,'dfl badil badjr badlocn badobj badrc badreps badsts badunique befor'
zz=:zz,'estr bget binverchk bnl boxopen catrefs cd changestr checknames che'
zz=:zz,'cknttab checknttab2 checknttab3 chkhashdmp createjod createmast ctl'
zz=:zz,' datefrnum dblquote decomm defzface del destroyjod did didnum dnl d'
zz=:zz,'pset dptable empdnl fex firstone fod fopix gdeps get globals globs '
zz=:zz,'grp gsmakeq guids guidsx host hostsep isempty islocref jappend jcr '
zz=:zz,'jcreate jderr jdmasterr jnfrblcl jodsystempath jpathsep jread jrepl'
zz=:zz,'ace justdrv justpath jvn lfcrtrim locsfx make makedir markmast mnl '
zz=:zz,'mubmark nc newd nextbaknum nlargs now nowfd obidfile od ok packd pl'
zz=:zz,'t put quote read readnoun readobid regd remast restd rv rxs rxsget '
zz=:zz,'rxssearch saveobid second sha256 tc trimnl tslash2 tstamp uses vald'
zz=:zz,'ate wex wrep write writenoun''),(<<;._1 '' joddob BAKPFX DFILES DFPTR'
zz=:zz,'S DIRCN DIRIX DIRNC DIRNMS DIRRFN DIRTS DIRVNS DSUBDIRS DTSIXCN ERR'
zz=:zz,'200 ERR201 ERR202 ERR203 ERR204 ERR205 ERR206 ERR207 ERR208 ERR209 '
zz=:zz,'ERR210 ERR211 ERR212 ERR213 HEADNMS OK200 OK201 REFCN REFIX REFTS T'
zz=:zz,'EMPFX backnum copydirinv copyfile copyfiles createdl dbakf dfclose '
zz=:zz,'dfopen dfp dncn dnix dnnc dnnm dnrn dropall dropbakdir dropdir drop'
zz=:zz,'inv dropnc dropref gettstamps hashback justdrvpath libstatus loadba'
zz=:zz,'kdir loaddir loadnc loadref loadstamps movefile nummask packdict pa'
zz=:zz,'ckspace puttstamps renamefiles restdict restspace savedir saveref t'
zz=:zz,'mpdatfile tmpusesfile volfree''),(<<;._1 '' jodliterate ALERTTOKPFX A'
zz=:zz,'LERTTOKWRAP BEGININDEX BEGINJODHEADER BEGINJODPOSTP BEGINNOTJ COMME'
zz=:zz,'NTTOKPFX CR DEFAULTPANDOC ENDINDEX ENDJODHEADER ENDJODPOSTP ENDNOTJ'
zz=:zz,' FAKETOKENS HINTPFX HINTWORDSPFX HYPERLINKPFX IFACEWORDSPFX IFACEWO'
zz=:zz,'RDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLBUILDTEXunix JLBUILDTEX'
zz=:zz,'win JLCLEANTEX JLCLEANTEXunix JLCLEANTEXwin JLCODEFILE JLDEFAULTAUT'
zz=:zz,'HORS JLDIRECTORY JLGRPLITTEX JLHINTWORDTEXBEG JLHINTWORDTEXEND JLIN'
zz=:zz,'SERTIFACEMD JLOVIEWFILE JLOVIEWSUFFIX JLOVIEWTEX JLSHELLEXT JLTITLE'
zz=:zz,'FILE JLTITLETEX JLWORDLITTEX JODLiteratePreamble LATEXTMP LF LONGCH'
zz=:zz,'RBEGPAT LONGCHRENDPAT MARKDOWNHEAD MARKDOWNTAIL MARKDOWNTMP NORMALT'
zz=:zz,'OKPFX PANDOCTOKPAT ROOTWORDSjodliterate STRINGTTOKPFX TEXTQUOTESING'
zz=:zz,'LE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLIMIT WRAPPREFIX WRAP'
zz=:zz,'PREFIXTEX afterstr alltrim beforestr betweenstrs boxopen changestr '
zz=:zz,'charsub ctl cutnestidx cutpatidx dbquote dbquoteuq fboxname ferase '
zz=:zz,'fexist firstones formifacetex formtexindexes fsize fuserows gbodyla'
zz=:zz,'tex gheadlatex gpostlatex grouplatex grplit ifacemarkd ifacesection'
zz=:zz,' ifacewords ifc indexgrouptex indexwraplatex jodliterateVMD jpathse'
zz=:zz,'p jtokenize latexfrmarkd long0d0latex markdfrghead markdfrgpost mar'
zz=:zz,'kdfrgroup markdfrwords markdj markgassign markgnonj patpartstr ppco'
zz=:zz,'delatex read replacetoks rtrim sethintblock setifacelinks setifaces'
zz=:zz,'ummary setifacetargs setjodliterate seturlsha256 srxm tlf toJ tslas'
zz=:zz,'h2 utf8 uwlatexfrwords wfl winpathsep wordlatex wordlit wrapQtlatex'
zz=:zz,' wraplix wraprgidx wrapvrblong writeas''),(<<;._1 '' jodmake DDEFESCS'
zz=:zz,' DUMPMSG0 DUMPMSG1 DUMPMSG2 DUMPMSG3 DUMPMSG4 DUMPMSG5 DUMPTAG ERR0'
zz=:zz,'150 ERR0151 ERR0152 ERR0153 ERR0154 ERR0155 ERR0156 ERR0157 ERR0158'
zz=:zz,' ERR0159 ERR0160 ERR0161 EXPLAINFAC EXPPFX0 EXPPFX1 GLOBCATS HEADEN'
zz=:zz,'D JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCLEAR SOGRP SOPASS SOPU'
zz=:zz,'T SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clearso clfrbtcl createmk '
zz=:zz,'ddefescmask dec85 dumpdictdoc dumpdoc dumpgs dumpheader dumpntstamp'
zz=:zz,'s dumptext dumptm dumptrailer dumpwords extscopes fap fmtdumptext f'
zz=:zz,'romascii85 getallts getascii85 halfbits htclip jnb jscript jscriptd'
zz=:zz,'efs makedump makegs masknb namecats nlfrrle nounlrep opaqnames pars'
zz=:zz,'ecode prefixdumphash putallts rlefrnl sexpin sonl tabit toascii85 u'
zz=:zz,'qtsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jodstore'
zz=:zz,' CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN CNJVERSION CNL'
zz=:zz,'IST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 ER'
zz=:zz,'R051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR060'
zz=:zz,' ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 ERR'
zz=:zz,'070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR080 '
zz=:zz,'ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ERR0'
zz=:zz,'90 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099 E'
zz=:zz,'RR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 ERR108 INVGR'
zz=:zz,'OUPS INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 '
zz=:zz,'OK052 OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 O'
zz=:zz,'K064 OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsf'
zz=:zz,'x apptable appwords backupdates badcn bchecknames bgetdicdoc bgetex'
zz=:zz,'plain bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit chec'
zz=:zz,'kback checkntstamp checkopen checkpath checkput closedict createst '
zz=:zz,'defwords delstuff delwordrefs didstats dnlsearch dupnames freedisk '
zz=:zz,'freedisklinux freediskmac freediskwin fullmonty getdicdoc getdocume'
zz=:zz,'nt getexplain getgstext getntstamp getobjects getrefs gslistnl hash'
zz=:zz,'bchk hashrep inputdict invappend invdelete invfetch invreplace isli'
zz=:zz,'b iswriteable iswriteablelinux iswriteablewin jdatcreate jwordscrea'
zz=:zz,'te loadalldirs loadallrefs loadwords mainddir mnlsearch newdparms n'
zz=:zz,'ewregdict nlctn nlpfx nlsfx nubnlctn nubnlpfx nubnlsfx opendict pat'
zz=:zz,'hnl pathref putdicdoc putexplain putgs putntstamp puttable puttexts'
zz=:zz,' putwords putwordxrs rpdtrim rplctable rplcwords sortdnub splitbnam'
zz=:zz,'e''),<<;._1 '' jodtester TESTYAMMER ereopen hfd hostsep iscf rmroot s'
zz=:zz,'howpass testenvironment yyyymondd''                                 '
zz=:6935{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1c?I7+>P&q+>Yc-2'=e"1,(XI+>GSn0f(^D1*ALu0fC^@+?1K#0JP=*3?U+51MUi=:-pQU.V`m4
+CcuT+DkP$DBMPI6m-#S@ruF'DIIR2+Cf4rF)rrC$;No?%15is/g*GrC`mY<BOu3,A8,OqBl@lt
Ed8d;CghC+ATJu&Eb-A)G][M7F(oQ1F!,C5+EV:.+Co1rFD5Z2@<-W9@r,RpF"Rn/:-pQU<+oig
+CT)&+E_a:+EMX5DId0rA0>B#DKBo.DKKqB@;]TuG%G]'F!,")Anc-oA0>T(+EV:2F!+t/@<6KB
%15is/e&._67sBJEb/[$Bl7Q+@3A0<6m-DWC1Ums+Co%qBl7L'+CQB@BkhQs.3NGF@ps1b+DG_8
ATDBk@q@8%$;No?+@Kd^FE2;FBl7Q+@3A0<6m-DWC1Ums+D#S%F(KD8FD,5.-u!F7A18X;De!3l
AKY])FCfK)@:Nk$%15is/e&._67sBJDf0Z*Bl7uQ+Co1rFD5Z2@<-W9F`_>6Bln'#F"AGDDf0W<
@;^1./0JYEFCfK)@:NjkG%G]'Et&IO67r]S:-pQU8T&W]Eb8`iANCq^G%G]'F!,=.A7ZllG%#*$
@:F%a+C]U=BkhQs+Dbt+@;KL(%15is/g)8Z@:FC&+<VdL@;Ka&@UWb^F`8IHATDj+Df-\8@;TRs
+:SZQ67sB'+C\tpF<D\K+D58-+E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bhCNXT;+:SZQ
67sB'+C]5)+<VdL+C\bhCNXS=DIIBn+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA7]R"+<VdL
A7]RgFCcS=DfTB0/0K%GF*)IS+D5_5F`;CQ+DkOsEc6"M+D#X;@qBanEa]Ca:-pQU+<Y3/A0<!;
+<Y3/@ruF'DIIR2+DG@tDKKT)Bk(RnBl@ku$;No?+<Ve;DJUF<+<Ve;Bk)7!Df0!(Gp%!5D.Oi+
BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y36F(KG9+<Y`:FE8R8Bk)7!Df0!(Gp%'7Ea`frFCfK6
%15is/g)8ZB4PRmF!)SJCh[s4+D5_5F`8I3DIal2F_Pr/+Co&&ASu$iDKKq/$;No?+<Ve>ATT%;
+<Ve>ATT&=DfTB0/0K%GF*)IS+DkOsEc6"M+D#X;@qBanEa^)&Ec5e;A8,OqBl@ltEd8*$:-pQU
+<Y<5Ddmc1+<YlHEb$;$DIal3ATMr9B5DKq@;I'(@;TQuEb/ioEb0,uATJ:f:-pQU+<Y<;E$-8G
+<Y07ART[l+CT.u+E;O8Ed8d?Ec6)>F!+n/A0>r9Blmp-%15is/g)8ZD..3k+<VdLB4YslEaa'$
+A*bt@rc:&FE8R5DIal#@<>pe@<6!&A9Da.Et&IO67sB'+Dl"4+<VdL+DkP)Gp$X3@ruF'DIIR2
+DtV)AKYf'F*)IGAo_g,+E1b2FCfK1Et&IO67sB'+Dtb7A0<!;+CfG'@<?''DIn#7A8,OqBl@lt
Ed8*$:-pQU+<YT5+<VdL+<YTAASuQ3@;]Tu@r-()ATJu)Bk)7!Df0!(Bk;>p$;No?+<VeG@:O(`
+<VeG@:O'qA8,OqBl@ltEbT*+%15is/g)8ZE-67F+<VdLE-67FGAhM4F"AGUATMs7/0Je<@rcL/
/0JMG+Ceu)ATD3%Bl8$2+Co1rFD5Z2@<-W&$;No?+<VeIAS5Nr+<VeIAS5^uFCfJGF`)52B5)F/
ATAo%+Co1rFD5Z2@<-W&$;No?+<VeIATMs(+<VeIATMs3Eb-A0@<6N5@UWb^F`8I5Eb/[$ARlom
Gp"MS@:O(`.1HVZ67sB'+ED^J+<VdL+ED%+F_kK,+D#e:Eb0<5Bl@l3F(Jd#@qZ;Y:-pQU+<YfJ
ATJt:+<YlHEb'56F`V,)+C]U=GAhM4F!+n/A0>u*F*)I4$;No?%15is/g*o-FCfMS%15is/g)8Z
7<3EeEZf41F)tc&ATJtB8l%htATDg0EcW?W0JG(41cZuo$4R>PDe!TlF)rHH-Xgb.A1%fn@rH(!
F(KB6+=Cl<De(4)$4R>;67sC&@<63,@:WneDBNb6@:Wq[+D,>.F*&O:DfQsm+?;&.0d$o4Eb065
Bl[c--Yd7-Ch7Z1Eb/lpGUFUV%13OO:-pQ_A7]^kDId<rFE8RL/M/)hDfTB0+Co%qBl7Km+DG^9
FD,B0+EM+(FD5Z2+D>2,AKZ#)CghEsA0>DoAnc-sFD5Z2Et&Hc$;No?+D>\7F<GXDARfFdBk&93
+Dbt+@;KKtDJsZ8F!,O8F<G+:EbTE(+A*bqEc5Q(Ch4`*Ddd0jDJ'Cc:-pQU-n6Z/3Zq!`=%Q.0
<DGhS73G/k8P`7o$4R>;67sBsBl7K)An>Oa/0JG2EcPl&B4W3+ATW'8DCcoP@:C?fDIal+Bl7K)
ASu%"%15cu4ZY;OHXSN9$:@]S3\`F;@4hur<'`i63]VOq/e&.T;G9PC3^Zdr9L]Hu%15is/g,">
@rcK1F(96)E-*4@E-,f4DBNG-A7]g)/Kf.R+CSek+Dl%;AKYDlA0>;'DIn#7DdmHm@rri'De*Dg
$;No?+CT.u+Dl%-BkDW5FD,5.AoDL%Dg,o5B-:_rAnc-sFD5Z2+E(j79gM-E:K1In71BSr;aXGS
:fKS=1,04F9L2WH=?S]#1(=R]<)$%L3\iK#$<U"r4ZY>T%16''=B%FE1,TLJ6<R8V4ZY>V%15fq
;G0DR=&(n>1,fXL<E)FI4ZY>X%15p7<(Ke[4ZY>Y%16$29KbEm0F\@];bp.O3\rK"$;"&s:-q*)
1GTCH9LV6B4ZYAT%16917m/mh1^sd$$;No?+DkOsEc3(BAU&;>FEqh:Et&IN5snOG<*<$d4ZZ26
6W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B<E)FI/5TJK85Du3;c-4>8lJM\
/4iZ@:-pL*76s[">"M3n$4R>;67sC!@VTIaF<G(3A7]fk$<L#$6p3Rb%16'';cGn@0b"I[;GU:h
4ZY>-$<'qr<(/r21CX[c5snOG4ZYD/$4R>;67sBkBk)7!Df0!(Gp%0>Ch=f1AS,LoASu!h%15Kp
6W?WQ:-hc\4ZYG0$4R>;67sC!@VTIaF<GI0D.Oi"CghC+/0JJ7E+NotF#kFF:JsS3<(0_b/4WT6
<DY5F<Cp.Y/58Dt;GR`/:I7ZB6W?fJ4ZZY?;FE'878m/:7oE,_:b5OF8Q8,09gM-E:CRX?$;No?
+C\bi+E(_(ARfg)@rGmh/0JJ7E+NotF#kF>6:s[6<),di$=[FSDdmHE3a4Wf/M8/M3Zon)0-FI[
+=nX@+D!/J:I7ZB6W?fJ,$tcd%15is/g,+AFD)e-ASc'tBlmp,+Cf(nEa`I"ATAn?+E1b2BHV8:
DI[d2@<?4%DBNG&@<,ddFCfK6%15ot<(KDG9KbEZ8OccQ:*=m+-SJ^P%15ot<(KAI;H#_>-QkH&
/LN)G5u^BC78+-t%15is/g,+AFD)e?ATD7$+>"^ID.7'e+>6tB@q]:kF!,")E+NotBl7Q+Df-\2
Df^"C:K%]0BQ%s6F(K;R3ZohB7TW/VHRCIO-RgAj-n%YV=%Q/6-X8;P.3M275WV%N>q(1N%13OO
:-pQUAU&<;@:OD#+E).6Gp%3BAKYr#FD)e/Ec5e;EHP]+BkD'jA0>JuCh4`,@;TRs%16imF*)A0
FD*fu><3mT3Zq]N,CUa`><3lY/g+@Z+=f&t>V7-H3[Z7;.3L)m+BplL.kWJ[/g*tV<(KDG9I;n3
$4R>;67sBkAS,@nCige:@<6O%EZf=ADe<^"AKZ,:ATAo0De!3tBl@m1%15is/g+nIA93$;FCf<.
@<?0*BlbD5AS-$,B5DKq@;I'"ATD?)@<3Q5BPDMs$;No?+Eh=:@N]B++Co%qBl7Km+DG^9C2[X$
DD#X<Et&IK9gM]W78c90C2[X(H#n(=D/`p*BHS[;D..L-ATB.-$;+)^:f:(Y4Z[=rA93$;FCf<.
@<?0*-YdR1E,ol/Bl%?5Bkh]:%15^'6rd/S;E['UDe*p7F*(u1E+*j%+=CoBA9Ds)Eas$*Anbm1
Bkh]:%13OO:-pQ_ASu$hAT23uA7]Y#Et&IkDe*Bs@ST6B+=_,EA7TUf+CcuT+Co2,ARfh#Ed8dG
@VTIaF<G(0@<6KN+D#e>ASuR'Df-\9AfrL:De*p2DfTD</e&._67r]S:-pQU6tp[Q@ruX0Gp%$7
C1UmsF!+n3AKYK'ART[lA0?)0ASrW$Bk)7!Df0!(Bk;?.@<,p%DfB9*ARl5W:-pQU@;]TuA7]h(
Ec657A0?)0ASrW4BOuH3@<,p%@r-()ARmD9+@KpaARfh#Ed8dG@VTIaFE8R7Df0Z*Bl4@e:-pQU
@3BW&F<GL6+Du+?DK?q/DIal5ATD7$+EV:*F<GF/DII0h+=]!XC1\T#Bl%?'A8-'q@ruX0Bk;?<
%15is/e&._67sBPDKKH1Amo1\+Du+?DK?pI+Eh=:@WOR>$;No?+<VdTD..=-+Du+?DK?q/Eb-A-
DIdI%ARfguGp$I$+ED%*ATD@"@qB1"%15is/g)8ZA7f=fDf]J4+<VdL@r-()AKYMt@ruF'DIIR2
+D,>(AISuA67sB'+Co)&E+No0+<VdL+E)41DBNJ(@ruF'DIIR2+D,>(AISuA67sB'+Co)'+<VdL
+<VdL+Co2,ARfh#Ed8d>Bl%?'E+*j%Et&IO67sB'+CoA"DBL&E+<VdL+DtV)AKYo'+DkP$DBNJ(
Eb/a&DfU+G@rH4'Df0-(F<GI>F`%Wq:-pQU+<Y34Bm:aC+<VdL+<YQ1D.Oi.Aftr!Bl5&(Bl[cp
FDl2F+DG_(AU#>8Dfoq,$;No?+<Ve;DJir,+<VdL+<VeE@;TQuDe:,%CghC++Du+?D@HqJ67sB'
+CoA-D'0rD+<VdL+EhI?Bjtmi+E(_(ARfg)DIIBnEt&IO67sB'+CoM2E+E['+<VdL+D#S%F(HJ)
Bl[cpFDl2F+Du+?DK?6o:-pQU+<Y38DfBT(+<VdL+<Y69@<6!&@r,RpF"_W\E+L/0Dfor=%15is
/g)8ZA9)U-Eb/i*+<VdLATD4#AKZ#)An?!oDI[6#DJsZ8Et&IO67sB'+D58-FE;P4D/aP=+ED%%
A9/l'Eb/[$Bl@l3@;]TuCghC,E-67FA79Rk+EV=7ATMs%D/aP*$;No?+<VeCDdd0eBlY==+<VeC
Ddd0!A8-'q@ruX0Gmt*U67sB'+Dbt)A8Ym"+<VdL+Dbt)A0?)7Eb$;$DIal,@:O=r+Cf4rF)s!V
H#R>9%15is/g)8ZCi<`mEb/i*+<VdLCi<`m+ED%*ATD@"@qB]j$;No?+<VeCDdd0tFCB$*F!)TA
Ddd0!FD5T'+EMX5D/aP*$;No?+<VeG@:O(`Bk)6-+<VeG@:O(o+Co1rFD5Z2@<-W9@;]TuF('6'
F!,C;A0>JuCh7Z1@<3Q"+C\bhCNXS*$;No?+<VeG@:O(oE+*6f+<VeKATMs7+D,P4+EM[;Anbah
ASuT4@UWb^F`8IEE+*6f%15is/g)8ZE-68EF*(i-E-!-EF`:l"FCcS/DK]T3FCeu*@rc-hFD5Z2
+CT.u+DbJ-FDuAE+EV=7ATMs%D/aP*$;No?+<VeIATMs(Bk)6-+<VeIATMs3Eb0;7D/XK;+ED%'
ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`Bk)66%15is/g)8ZEb0<6F)YPtAKW*<FCfN8F!,(5
EZfFGAnGaeBk;1(+ED%7FDl22+EML1@q?)V:-pQU+<Y`6G%G2uEZcJI+<Y`6G%De,Bl[cpFDl2F
%15is/g)8ZF('6'Eb/i*+<VdLF('6'+ED%*ATD@"@qB]j$;No?%15is/g*o-FCfMS%15is/g)8Z
7<3EeEZf41F)tc&ATJtB8l%icDdji0@;]^h+>PW)/M].C.1HUn$=e!aCghC++=CT4De*Bs@ODTl
@rH(!F(KB6+=CT4De*p2DfTD:%13OO:-pQ_A7]^kDId<rFE8RL/M/);:IJ`3@N]2mE+NotASuT4
A7]@eDJ=3,Df0V*$4R>;67sBkBl[cpFDl2F+Du+?DBNh*D.Oi/Eb/isG\(q*$:IH`:/+YM3]oJV
?SNZN+BM?:6m,Gt;cFl0;GU:h+B)93<(.p(5snOG-OgCl$;No?+Co2,ARfh#Ed8dFDfoq?F*2),
Bm=31+>"^SEb&a%+DkP/FCfK6%15L&;b:(Y:-CX#4"akp+=A:2;]nY6+@AmO%13OO:-pQUFD5T'
F*(i-E%E,GDId='+Dbb5F<G"0A0>B#D/aE2ASuT4DJsZ8+DtV)ATJ:f-p'I;6qL9U;]nJ";Fst5
6qL9D:+%JR3ZpO/0d(j)+@Je!:/+Y0/1)u50-EY^;b:(Y:(7O>$;No?+DtV)AKYK!@<6K4@;]Tu
D.-ppD]j.IE+L/0Dfoq?DIIBnEt&IE8Q&;N4ZY\e/mg=U-QlJd;FF8I+AG-h;GU%T-OgCl$;No?
+ED%*ATD@"@q?d$@VTIaFE7lu6qL9S7SZ*-4?G0&0d%hd=&2^^;FO%t<(0_b;FO&&%13OO:-pQU
Eb/ioEb0,uAKZ)/D.Rd1@;Ts7+DG_(AU#>6BleA=@;]Tu@rH4'Df0-(F<GI>F`&=>@;TRs%14LF
3[[fo7T<;/;FO&H=<LL17RKou.6T^74<cL&Ho`B<8Q&GU:*;)7/j:p26r[)V=@5gm$4R>;67sa!
DId9hE+NotASuU2C2[X!Blmp,@<?'U67sa&De*ZuFCfK$FCcS9/M/)XASu("@<?(%+Dbb6ATD4$
AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q@ruO4+D,Y4D'2GH6m-,_Dfp#?/e&._67r]S:-pQU
G%G]'@<?4#3ZrKTAKZ).AKYT'Ci"$6Bl7Q+@Vfsq+E27?FE8R5DIal&Bln$2@N]8sCh7Ys$;No?
%15is/g+hLFDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&
/So-CATD4$AM%Y8A1nB!:-pQUBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\
0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF@<aA;BkM*qBkM+$Bl7Q:%15is/g+hLFDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%
ATD4$AM.q4Ado)B67sBoFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%
E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9H#@(#$;No?%15is/g+kGFCfK)@:Njk
GAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB'<(KSZ:dIiE:I?6I+<VdY+D,b4
C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sB'AoD^,BkCd`
ATVL.+<VdY+D,P4D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0
%15is/g)9LEc>i/F<D\K+<VdL+<W6YD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g)9NAmo1\
F(Jj'Bl@l3+<W6YBl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(%15is/g)9NAn)r++<VdL
+<VdL+<W6YAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sB'F(KH.De*ZuFCfK$FCcRH
+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFb
Ch4%_:-pQU+E_mE@<?(*Ao`*6Eb'56/Kf1RGB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEs
G\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sB'GAhM4Ch[u6+<VdL+<VdY+DkP&AKYetFCf\>
Ao_g,+EqaEA0>]&F*&NQGps10:-pQU+:SZQ67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBj
Eb/[$ARmhE1,(F<De!lC0b"Ib67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB812gZE0Jah"GUXbJ
Ec>i/F<G"4B6A'&DKI"0A7T7^+EVNEF*2G@Eb0<5+EDC=F<G[:GT^pJATE!8Blmp-%15is/g)l(
De!lC1a$FODfp"A8Oc!579<8_6rR`=Dfp#:@;TQuBR+Q.EboH-CLq#c$;No?+>GWi@rsC^+ED%4
CgggbA0<rp+E1b0F(oN)+EqOABHS^IAo&n=/Ke_8DIdQpF!+q#A0>V0@rGmh%15is/g)l(De!lC
3$;X?A7]9oATDg0EZf%(DIdQtDJ((D+ED%4CgggbA0<:EEbTW,.3NhKFD)dFGB.D>ARTX/%15is
/g)l(De!lD0d'n8C3=T>ARloW@8pf?+E2@4@;TIiAKWQI@q]:gB5)6r+Dl%7De<p*FE7lu:-pQU
0f!ZWF>5Nn@:Wn[A0<:A@WZO(ASuQ<+>"^YF(Js+C`m>.EZee.@;L48Bl7Q+@rGmh+EV1>F:ARP
67sB812gZE0fL4`A7T7^+=MGS@;pC1@Vft#B.4rT+Dbt6B-;86F`Lu'+Dbb0ATJu3Dg*=JEa`p+
ARl5W:-pQU0f*?O@kp%e@:Wn[A0>u4+=Lu5@r$-7+@g-f89JAaEb03.F(o`7Ed8*$:-pQU1,*QR
Gq_0"@:X+qF*(u(+EqaEA0>K&Ec#6,Bl@l3.!K9>.3N5@EZdss3A*!?%15is/g)o'D..]D3$<?_
A79RkA0>K&EZek7EcP`/F<DuN@;]Uo@jrODATDj+Df0V*$;No?+>PWcF`&ll+CSekARlo3AoD^,
BkCd`ATVL..3N_N+DG_8ATDBk@q?d,DfTB0%15is/g)o'DJs\P0d'n8A7]9oB6%F"BPCst+CT.u
+DG_'Cisf5Df0V=F*1r&Bl[cpFDl2F+EVNEE,oMuD.7<m%15is/g)o'DJs\P0d'_1AS5^pHXq&)
F_t]-FF>9KDg#]&+EVNEEc5l<+D,>(AKYT'EZe/$ATCIU@:h-%Df#pj:-pQU1,*TaFtb`q.!&sA
C2[X!Blmp,@<?'0+Cf5!@;]Xs+EM%5BlJ/F+CTD7BQ%o>F"&X_ASkjiC`m.sA7]9\$;No?+>PWg
Dg!ij+=M2J@rGmhCghEsGUXbDA7T7^+EVNE@:X+qF*&O7Des?4Bl7Q+De:,9Ea`p+ARlp"Bl7L'
%15is/g)o'A7]7)0d%leGAL]0AU%g-GAhM4F"&5?A7T7^+:SZQ67sB90k=j*1,0n"8k_TG76s[J
79F\MBm;0O8k_QO8PDNO79F\MBm;0O8k`/S78-BD=B$^l@:Wn[A.8l@67sB911><<0K:1'F(KH,
Bl8$%Ci<g!.3N&0A7]9oFDi9MB6%s-Blkd5$4R>PDe!TlF)rHH-Xgb.A8Gt%ATD4$AL@oo@rH(!
F(KB6+=Cl<De(4)$4R>;67s`uAT23uA7]Y#Et&IO67sBkARfObEb/c(B5DKq@;I'"ATD?)FDi:1
G&M)*+Cf>-Ap&0/DJ((c@8pf?+DtV)ATJu<Bln#28g&"[D.Rbt$;No?+=J]g4ZX]X9N4S_9LVoL
=<L40:KC%U=&_Uj+A,<o<CokP<(0n38k_`Q:eXG[<(0n38k`;^;FF2M<)c:g+:SZQ67sB/.OdMA
+A,Et9PJT[Eaa'$:i^,UD.7<m+A,<p9LV6B<(0n38k`/S78-BD=B$D89L;`N9LMiK=ESLqGRY!T
67sB/.OdMA+A,<p9LV6B<(0o3DJ=><8k_QO8PDNO79FbJDBMPF6VKp7:/jYaGA1q;%13OO:-pQU
;K$2ZEZdnqBd[sEGAhM4+D,P4D..O#Df-\=FCB9&+DkOsBPD?q+>"^WBl.R#Bjl$)FDi9`3ZqmS
F:ARP67sC"@<-F#F!,R9G]Y'PBln#29La(S+ED%8@;0V#+EqL5FCfN4@:Njk@;]TuBOPdhCh7Z1
DfB9*+E;OBFCfMG%15is/e&._67sC(ATD6gFD5SQ+Du+>AKYMtAnGUpASu!h%15is/e&._67sB'
+<Yl?CaU_d+DEGN1,C%1/0H;f:JaJT+Al-7<(//D$;No?+<VdL4$"`>0-Fs]+>P_q2(Tjt-VmQ-
:*<D6:K0b1%13OO:-pQUBPD!g+EM%5BlJ/:Ci<flCi^^B-n6Z//g,"CC`me2C`j/oD.[TI/g)o,
2C't!+<VdL+<VdL+<VdL+<VdL+<VdL+<Ve%67sB_+E)@8ATA4eD.[TI/g)kk+=K6$@4l7H-Qjcc
+<VdL+<VdL+FS*=C`jiq67sBZ+EqL5FCfN4@:Njk.!'?9@q?ckDIal'DfTQ<Df0Z*C`mh.@OV`n
D.[TI/g)nl+=Jch@4l7H-UD/g.4[&c/i#=6+FS*=C`jiq67sBH+@.S_+CQjJ+D#e-Cis9&DJ((e
+@6MED.[TI/g)qm+=LYNBeCc.-Rg/\+<VdL+<VdL+FS*=C`jiq67sBU+EV:.+DbV2FCfJ8:(7PI
Ao'U_+>b2`-t+`B/git5.3K`U+<VdL+<VdLI;NS4+<XEG/g*J'FD,5.Ch7^1ATAn[%16raCcsBn
2'="i@4l7H-SR811GgsI2`Ng)-Rg0dD.[T,+AP6U+?:QTBkM.%F!+n/A0>4g$>jBk4Y@j8+<W(@
/nlpc/gi(j+<VdL+<VdL+<Z)LAo&S4:-pQU6m+)k$>jBk4Y@j9+<W(@/nlpc3[Z@!+<VdL+<VdL
+<Z)LAo&S4:-pQU6QeE!$>jBk4Y@j:+<W(@/nlpc-RU8j+<VdL+<VdL+<Z)LAo&S4:-pQU;'9k$
DffP"$>jBk4Y@j;+<W'e1FXFh+<VdL+<VdL+<VdL+<Z)LAo&S4:-pQU6W+@#D.[TI/g)l&+=Jru
.3K`U+<VdL+<VdL+<VdL+FS*=C`jiq67sBS7L]\6$?Kfq4Y@ja10n-/0d(ls+tbr0?SW`P0H`D!
0I[G<-QlM6+<VdL;]m2*+@.+m+<XE%+<Vdn+<VdL3?TFe+@I=p+<X#o+<Ve(+<VdL6W,$L+<Ve#
7N`g$>qc]p+>Fun+<WBo+>Fu]1*A:o+>Y,p+<WE^0d%Ss+>Fu]0d&1n+>Fun+<WTc0d%Sn0H`(m
+<WB]0d%S]:-pQU0H_KPDJ=3,@;HA[+>Fuo+<WBo+>P&^1*A=p+>Y,q+<WE^1*@\t+>P&^0d&.m
+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0d%TWFD,6+%1444+>P&^0esk,+<WE^0H_Jn+>=o\
1*A7n+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)nl+CT)*05boL%1444+>P&^
0esk,+<WE^0H_Jn+>=o\1a"Ip+>P&n+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)qm
+AN@Q+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\2'=Rq+>Fum+<WTc1*@\o0H`+n+<WB]
1*@\^:-pQU1a!o964F8E3?U!u+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm+>=o\0d&.m+?:Pu
+<WBm+>P&^+>Fuo+<Ve%67sB<+<XEG/e&.10d&:q+>GYp0H_Jr+>=o\2BX[r+>t>r+<WQb0H_Jr
+>=o\0d&.m+?(E"+<WBm+>P&^+>Fuo+<Ve%67sB=+<YQED%-gp2]sds+<WTc0H_Js+>=o\2]sds
+?(Ds+<WTc0H_Js+>=o\2]sds+?1Jt+<WBm+>P&^+>Fuo+<Ve%67sB>+<W$@$6V&G1*@\o0d&4o
+>P&p+<WH_1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>=o\0ea_*+<Vd]+>P&^+AP6U+?1Jd-RT?1
+?:Pu+<Vde+>=o\3?U!u+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Jm0H`+n+<WB]1*@\^
:-pQU3?TGSDf'?&DKH<p+>Fuo+<WBn+>P&^1*A=p+>b2r+<WE^1*@\t+>P&^0d&4o+>Fuo+<WTc
1*@\o0H`+n+>GSn0H_J\:-pQU0ea_;;@NsU0d&4o+>GSn1*@\p+>P&^1a"Or+>P&p+<WQb1*@\o
+>P&^0d&4o+?(Du+<WBm+>P&^+>Fuo+<Ve%67sB80d&h]9L]Hu+>Fuo+<WBo+>=o\1*A=p+>Y,q
+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc1*@\o0H`+n+<WB]1*@\^:-pQU0eskmE+*6f%1444+>P&^
0f'q++<WE^1*@\q+>P&^1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o+<XEG/g)l)
+EML1@q?ckAoqU)+Du==%14Nn$4R>;67sC)DfTA2AoD^,@<?4%DBNP0EZf14DImku$?p)u4ZX]6
0KX>fCccKGCagJR+?MUn$4R>79LMHM771$M;HZ.D+=ANG$4R>79N+JN9M@lW<'<8b4%VnC8PXUo
3[\u^+C\c$-OgCl$;No?+Eqj7E,]B!+Dbb0AKYr4AS,Y$%16075u:6D5t!js-U'.84spdH%15is
/g,+ADIdZq+EVX4DKBE.Ec#Au+Eqj7E,]B!+Dbb0AKYf#@:UL&Deip%%15Bp78d)a:J4be5u9^*
+=CD[Ch7X/<,ZQ!-S/=s5u:6D5t!7OI4#I2:-pQ_ASu$hAT23uA7]Y#Et&Hc$;No?+EM4-Cht58
@rc:&FE8RHBOQ!*ATD4#AM7M8Bl%<&9OUn3=<M3iCh7Ys$4R>;67tA_IXZ`p+F>4`F(c\E%15^$
6<-TN6rZTWF`(o<4ZX]>+?CW!%14=&F(K?6ASu!h+E(j7CghEsGT^L7D/E^!A9/l8BOQ!*B4Ysl
Eaa'$+AbHq%14=&@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3DBO%7AKZ28EbfB,B-;/%FD)*jCis0&
@<?(*+<Z+XIV3\>F`;dSILQX$@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>
INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/.1HUn$;*uZ9LV6B<(0o3DJ=>Y3Zp+!3Zp*c$6p[6
ASl@/AKYetFCf\MFCf\>FCf<.+D,>(ATJ:fEbupK/n&mI%17,m+=]!Q@VcJ\EbupK/nB->%17,m
+=]!_Et&IsD'1;\Bk2Gt$?Bu+.P>X^F:ARtD'1;\Ci<qq$?Bu+.P>g]@grccD'1;\Ci<np$?Bu+
.P>OUC^g_lD'1;\Ci=D)$?Bu+.P>FQA.8ldD'1;\Bl%Dk$?Bu+.P>1HB+52gD'1;\B6k!o.1HVZ
67tGcIXZ`p%13OO:-pQq4FVa.INWt[/n/72+FO\+8k_QO8PDNO79FbJDEU$'0H`D!0F\A0ASiQ2
AT;j(DI[6#De:,.@<?(*+Cf>,D..<mF!,R<@<<W)ASu("@<?'':ddb^$?B]p+CT>4F_t]2+DbJ.
AU#>/G\(q=@<,p%Df-\>BOr<1DfTW-DJ()2@<?/l$?Kd#Ci<flC^g_]A0<O9+=2JIE%h_.Cis0&
@<?(*+<Z+XIV3\>F`;dSILQX$@;BFgDId='+FYPaB6%p5E.0$\%16oo@;K@oAU#=?INs;SEc6)>
INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/ASu$pDe!3l%14Nn$4R>79LDKB5u(BJ=EeIs4ZX]>
+?CW!%17,eD'3k1D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IeAS`J=/n&mI%16WWC`k2[@Ua-_
$=m^a+=]!SG%hBmA7]R".P>[]%16WWC`k2[Bk2Gt$=m^a+=]!^F`\'"A7]R".P>OUB+52YAS`J=
/p)#A%16WWC`k2[Ci<np$=m^a+=]![DeojiA7]R".P>OUF:ARfAS`J=/no36%16WWC`k2[Bl%Dk
$=m^a+=]!QChF1aA7]R".P>@[%16WWC`k2[B6kt8F`VgW%14Nn$;No?5!FFEIXV_5%14L>+?CW!
.46JP$>F*)+<VdL+A#%(8PUBNA8a(0$6UH`9LDKB5u(BJ=?S\f8k_TG76s[J79FbJD@Hpq+A,<o
<CokP<(0nP3Zq$g6<-TN6rZTWGA1q;+:SZhCia0%AhG2t7TE2T=<M-m/e&.1+A,<p9LV6B<(0nP
3Zq$g6VKp7:/jYaF`(o<%144#8k_QO8PDNO79D]6+A,<o<CokP<(0o3DJ=><%16Z_F(K&t/nAlQ
%144#F)>i<FDuAE+=BcT6VKp7:/jYa01no)<CokP<(0n3F(96)E--.DDJsV>F(KG@%16ZaA1e;u
.1HUn$;No?4?S(AIXWDd+>.J=FCf\>I16Mm$;No?+D5_5F`8IFBln0&+CT.u+CTD7BQ%o6/Kf+V
@;]UaEb$:tD..3kFD5i5AISu=9N4S_9LVoL=?S\f0H`D!0F\@8+DbJ.AU#>+F`_;8E\&>TBln0&
/0JkMFD5Z2@;I'/Eblk,DIal'@<6)k$=%"^FD,T5H[[2g@<H[*DfU:OINTqA>R_#d>[.^F-!YM.
@;Ka&>]k('H[[2gBkh^3Ebp1LIXN>D>R_#d>\7nmFDc#=ATMR3AKY6"AU&<=FF-qW5qOiL2EDt0
,CX]I@59\uINs;i+C&f&Ec#6$F(or3%17Lm$=%[eFDPN8>]aP%FEDVOINs;SEc6)>INs;i+@gHj
F`;a<$7QDk%15is/g+eIDfp"ADg#]4G%kN3+D>=pA7]cj$;*uf<_5_]<(0nP3Zp+!3Zp*c$7-g:
BPDN1C2[X!Blmp,@<?''Dg#]4G%kN3%16?]ARfgrDf0o,FCf]=FEDkY,CX9GDfp#J,CY%`:Ng;i
G%kN3I16N4%13OO:-pQUB6%p5E$01>Dfd+DAU#=L+Cf>+F_u#;+DkP4+Dtb%A0>;kC3=T>Bl7Pm
$;*u^;G^%Y<)c:g4ZX]>+?CW!%14C(9jqaR+DPh*Ch\!&Eaa'$+=LlCE,961.3NG8FCf\>Anc'm
/g)QTEc>i/F=A>FASu("@<?(%+<kH=Dfp"C%14C(DIIBnA0?&,EcYr5DK?q=Afu2/BlbD/Bl%?'
AoD]4ART(^+A,Et+D5_5F`8I;F<GOCDe!@"F(KDF%13OO>\S(pF`_t&:IIljFCfK$FCe9hARTFb
Ch55@AU&V4$4R>I@V'1dDL5o4@s)X"DKL:9$4R>IBl7m4FF/H]IV3\>F`;dSIWT:GCh55@AU&V4
$=%FVCLqU%FDPLt$=%[]@VfUoAn,asFCf?3Et&Hc$=%I[GApu'AIStm+Cf>,D..<mF!,(5EZee$
C3=T>Bl7Q+A8-+,@;]Rd%14C(@V'Y*AS#a%@rH1+D/OD;@;]TuBl8!'Ecc#5B-:V*Ecl20%14Cd
F(KH0ASu.&BR<uoDesQ5DKBB.I=!b]D1)j#-!YM&FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0J55%
FF=T*-!YP9De!^%F_u"*$=%:_E-68LINs;SEc6)>INs;[G%kN3/p(ZLI16Mm$=%I[GApu'AIStm
>]4Lk@rH1+D/Kdi>\S(pF`_tZ,CX9GDfp#J,CX-@A7[B8AU&V4$4R>IDIn$2@:s-\$=%O`@;^1*
D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<+A$H]AU&V4
$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*.1HUn$;No?+EqaEA0>]&F<GUBDfd+DAU"Xk
8k`;^;FF2M<)c:g4ZX]>+?CW!%14C(9jqaR+DPh*Ch\!&Eaa'$+=MGPEb'!#F=A>K@<?(*+D,>(
AM,)7$4R>IBl7m4FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U#.%16?LAS5^pHXq&)F_t]-FF=T*
%16?XATr*%B4VMZ%14C(@rH4$@;]Us+D,P4+CSeqF`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#
DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$7/quATVa"DJ+')HX('!CisT4F(K<=HS]5MI16N0
>]XIuCh7KsFD-#+@rH1+D/OE+E,p);AUSnZ/i@TiI16N0>]b1.@rH1+D/Kdi%14CdDf0,rDesQ5
D@HqXBl7m4FF/H]IWT.GDIIBnINs;ODe*E3FCf]F%13OO>]++sE+*Bj%16?ZBOPe#Df'Q,@ruF'
D@HqX@:WnYDf0Z.DKKr9Bl7L/FDkZ;HZNb.FD5Z2I=#4@AU&<=FF-/3I3;+!A7^"6%16?ZEbTE5
Bl7HmGRXuh$=%.[A:%j*@s)X"DKL:9$7QDk%13OO:-pQUD..-r+DPh*Ch\!&Eaa'$+A?3CAQU'o
Eb/Zr@VfTb$;+)^9PJT[Eaa'$:i^,UD.7<m4ZX]>+?CW!%14C(C2[X!Blmp,@<?''CghEsGT^sG
ARTFbCh54A%14C(%14C(<+oue+D,>(AKY].+CQC+BkM*qGp$U>F*)>;BmO?$+Eh=:F(oQ1+E(j7
FD,5.E,oMuD.7<m%14C(D..NtEbSru+D58'ATD4$ARlomGp%'7DIdZq-Z^C^F!,C?FD5Z2+EqL1
DBNn=De+!#Bl7Q+%14C(/p(ZL+E)CEE-67T+E1b,A8bs#BPD*mCh[NqFD5W*+DGm>Dg#]4EbT&p
ASrW!DIa1`,p7;CAKZ&9@;]UaEb$;,DId='+DGm>Eb/cmAnc-oA1eu6$4R>IA8bt#D.RU,@r,Rp
F'C@SE-,B4@<-I(@r,_)%13OO>]k+!E+*6l@:s.UCgh3lF(8WtAR0XqAT)EsFE2YT%16?_F(K<!
@r#LcAQrhZ@:X(iB6.@*Ap%p+E+*BjI16NgF`V,5@:O(]B4ZF+D/WrrEc-:7$=%^pAT2'fCLLje
HXUc4F*VV3/7EC:D..O"I16NgF`V,5@:O(]B4ZF(Ap@m/AU#b?Ao)TuFCf]F%13OO,p7/IDg#i*
ATJu!FCf]=F*1r5@rc:&F:AR^F`V,5@:O(]B4ZF%Bm=H9GVWiY+:SYe$7-g-Ea`p#Bk)3,Bl7Es
F`V88DK?6o>]k+!E+*6l@:s.uB6%F"BPCt$/9>rCAnbn#Eb-eCBk1db@;pW($=%4a@;omo@rlTt
FD-#J/h^pV@r-:/Bl@m107A6X$4R=g+E_a:+Dkh&Ec6&FE+L/+AftN*@;0Od@VfTb$=$/77VQ[M
7<iNfFE;eGBk)1%FEqh:/ou,[I=#4AF(K<!@r#LcAUA9.@rcL0H#R>CI=$AO$=%:WDKTe=0O/=(
G\(u.GT\_GAnbLaAo)TuFCf\>0jJ=)4YS!)+DGF1E+ER&AU"Xk+<Xp3F(K<!@r#LcAQs;!AiO(C
Bl7m4FCf?"I16NgAScF!+=/.EAfto4@<?(*+E)9CG\(]"FCf\+$6UHrF`V,5@:O(]B4ZF%Df0Z<
E+NO-%144#>\RepATVL.%144#+<Xp3F(K<!@r#LcAUAZ<FEhnJ@4ZYGDJ<U!A7^/u$6UHrAn_\]
+<Xp"AS,@nCij9-DKKK%@<?X4ATN2m@;p1"DJ)+SAU#eKAU&;J;e'6PAN`arFCSuXDg,c5@psFi
I16N++=/.NAT2Ho@q?cO<DlUm6QgSeFD)e>DJ<U!A7ZlpF`MCC@q]:k@:OCjEZbeu+<VsQBkAK5
Dfm1?AS#BpFD,B0+Cf(nEa`I"ATAnF+EV:.+E2@4F(K6!AKYo'%144#,p7;CBlbD<Bl7R"AKYJr
@<,ddFCfJ8Bl5&8BOr<*Eb/Zr@VfTuAoD^"ATJu:F(HJ4Afu>0CghEsGUstRF^])pFCetl$6UH;
>]++s@rH4$@;]V&>\/%uDgct$<DlUm6[^("+:SZ#+=/.?@;[3/ATT&5FD,6++Dl%7Df]l+@q?cp
Df0Z<+DGF1FD,62-ZWc@@<Q'nCggdhAISth+=/.%+ECn4BOu3,Ch[Zr+B*3$EarZ'6Z6LH+Ad)s
+EM+*3XlE=+=/.DFEDI_0/$dNDeF,D@:X:cAM.J2D(g!VE+3X%B6%F"BR)6d0JP=90KCe-Dfp)1
AM%D1A7[?3Ec3RDFDYh'$6UH;>]XIuD/X<1AoDR/HU`$eAPI)\Dg`'%+<Vt8F(KH1Df0K*Df0ZD
;f?f!@q?cMDe*E%:i^K&%16?PBakCY$7-fmARo@aBl7K)CggdaCj0T(FD)e/DfQt:BleB;4!8H`
BOu4.Bldi:+EV:.+D#G5D.R`rFCcS6@:O(]B4W30Bl%T.@psM$AIStm+DkP-CLqO-+EVNEAU&<.
DIal!AU/33A0>u-AKYf#Aoo/4@<-!pDCuA*>]!nbART[sATW$*Ea1nP6=jeDDFADQF_t]-FF,;C
$6UHrEb0-"G@PQ.D..<mHX&gPBleB1I16N++<VeR>]XIuCh7KsFD-#+CggdaCj0T(FD-)L1hCNP
I16O3>]!nbART\!FD,6+%16?_F(K<!@r#LcAUA!+F_t]1@<?(/%13OO,p7;DB4uC'BleA=@rH4$
@;]TuAoD]4Ch[s4+EML1@qfgn%16?ZEc6,8A7]7hD/E^!A:%R'BkM+$Ch[s4I=!7L$6UHrF(KH0
ASu.&BR<uuFCf<1AT3'E0Q;,^>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\I=2P3%14C(@WcC$A0>E$
@s)X"DKI"8DId='%16?_F(K<!@r#LcAUA9&CLq3jG^U#.%14C(@rH1%EcVZs>]k+!E+*6l@:s.u
@rH1%Ed\B(>\%DXBl7KlDes?4HZNk/A7]7hCi=?BHW!@#I=!_+3%QgA3%QgA3.25C,p6qF@rH7,
Ec5b:F*)GF@ruj6ATJt'$=%+QAnc-o@rH1%EdMS5H$<b:Ci=?BHZEb.I=!Y#0f(@7/i#F<0J54=
I16N0+DN$1G]7J5@qg$-@<-"'D.RU,F!,]MGp$rHDBO'EFq"d`A7]@eDIm<rCi=?@A79Rg@rH1%
Ed`:TB4?:90J5(9/2/\33@lj:2)BXi$7-g0+Du==@V'S$+>"^ECht59H#R>9+EM+*+DNNRD/9Xg
>\%DXBl7KlDes?4HXp\tG%5H,DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%16?NAS,XoARfXpDfU26
@<6!t@rH1%Ed`:TB4?:90J5%5/2/\10J"n13&,gj$=%+QAnc-o@rH1%EdMD7Ddd`tDes?4I=$!I
@XWSW/het10J5%5/2/\90msK<,p6qFCi<flC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@@q]:k
@rH1%Ed`:TB4?:90J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdMkLEbTE(@rH1%Ed`:TB4?:9
0J5.9/2/\70J"n10J\%c$=%+QAnc-o@rH1%EdM;7D/Ej%FCT6*DfU8QEbAj0HS@'02CpO71Gp^;
/hf#.%14C(E,oZ0Bln'4AKYDlG%G]'F!+n/A0>B#DJF<3@ruF'DK?6o-!XtlAnc-o@rH1%EdM_H
BOu3oDes?4I=$!I@XWSW/i>O<0J5.=/2/\10mt/e+:SZ_A7]@eDIm<rCi=?@DffZ(Eas$(DfU8Q
;Fa'%HS@!)/2B(?I16N0+D5M/@UX'q@<6L(B5VQtDKKq/$=%+QAnc-o@rH1%EdM52ATDm&Des?4
I=$!I@XWSW/iba>0J5(</2/\22LQ#A,p7/IBl.R+Bm+&18g&:gEaj)4@;]TuDJsZ8+DtV)ATJ:f
>\%DXBl7KlDes?4HY.D<@q0FnDfU8QEbAj0HS@'+0J"n10JG%3/heu-+<VdL+:SYe$=%^pAT2'f
CLLjeHY-](@sN6<@XS[m>XW.8Bl7K\BQ%p5<b6;\>@VSgD..<m@q]:kF$3c5>^K_(?$fh(I16Ng
6tKtEDIlj[EaiI!Bl-:VG%ku8DJ`s&FF-PmB4u*qB4uC$DJ+BE<b6;\@<?4#I=#IBD/E^!A7K:]
EcXBK>[2V\I=2P3,p5KaA0<6NAoDR/F(or34^<&F@;Ka-+D,P4+Dl%;AKYJr@<,ddFCfK6+E1n4
+Dbb0AIStU$7-g6@;]Uo@j#DqDImisFCeu*F*VYF@<`o)Des?4Bl7Q+@rH4$@;]Us+>"^R@;TRs
%14C(@<,p%AncL$A0>T(+D58'ATD4$ARlonDe*E%@Wcc8A7]@eDJ=3,Df0V=D..]4%14C(@V$['
ATT&:D]iJ+Gp%9=Ch[E&FCf]=+D,P4D..O.Bl7Q+@rH4$@;]Tb$=%^pAT2'fCLLjeHY.;,D.R7+
%16?XATq^'G%ku8DJ`s&FF-r"@:Wq[I=$BhI16NgDIn$%Df'?"DIe*!94`BmDfTAfDejc*0jT-2
FCf]=@rH1%EdMS5H$<b:Ci=?BHX(Z(G][D,H[?tlI=6Nl%14C(GAhM;F!+q'FED)7+EqOABHU5l
F`Lu'+@C'XAKXfiD[d%">]++s@rH4$@;]V&>YAXRGAhM4<,ZQ#>;9E1>]aP%FCT6*DfU2?AU/K0
Des?4I=$;c0n"Iu%16?XATqX&D/E^!A:%QL@<>pWH#R=oDejc*0jT-2FCf]=@rH1%EdM>*FCAZt
Ci=?BH[?tlI=6MQ$7/qpATqX&D/E^!A:%QLARebLCfG=gI9SF3HX(Z(G][G6Ci=?@A7]7o@rH1%
Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6tKk/@;Jn]COKDA?$goC0n"Hm%16?XATqX&D/E^!A:%QJ
@<6!T<,ZQ#>;9E1>]aP%FCT6*DfU26@<6!t@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!7Vm!O
FB!0oI9SF3HX(Z(G][G6Ci=?@Ao)BoFCT6*DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XN15E`?sm
I9SF3HX(Z(G][G6Ci=?@@q]:k@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3>]++s@rH4$@;]V&>Z5`b
Bl7Q_Dejc*0jT-2FCf]=@rH1%EdMkLEbTE(@rH1%Ed`:],;FUpI16NgDIn$%Df'?"DIe*!6Z6gY
ASuThDejc*0jT-2FCf]=@rH1%EdM;7D/Ej%FCT6*DfU8Q>]aP%FD5iDHQt7nI=6MQ$=%I[G@PQ.
D..<mHX'?gBOu3`Dejc*0jT-2FCf]=@rH1%EdM_HBOu3oDes?4I=$;c0n"Iu+:SZ_DIn$%Df'?"
DIe*!6#:+QFB!0oI9SF3HX(Z(G][G6Ci=?@@;KLqFCT6*DfU8Q>]aP%FCJj/HQt7nI=6MQ$7/qp
ATqX&D/E^!A:%QNF`(]2Bl@lgDejc*0jT-2FCf]=@rH1%EdMD@DI[0pCi=?BH[?tlI=6MQ$=%I[
G@PQ.D..<mHX'$_DI[d&Df/NmCOKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'H[B5):%9jr'XATCag
COKDA?$goC0n"HZ$=%I[G@PQ.D..<mHX'![Ec5ttDejc*0jT-2FCf]=@V0t6,;FUpI16NgDIn$%
Df'?"DIe*!:2b/i@;Jn]COKDA?$goC0n"HZ$4R=g+A,Et+E):7ASuU$A0><'G\Lu.@<-W9@rH4$
@;]Us+D,P4+E27?F<GOCDe!@"F(oN)+E1b,A8bs#B4YslEaa'$A0>\sFCf\+$=%I[G@bZ8Bl\-0
D.RU,HV.(%7riNjE(FPKA7]e0H[U6h%16?XATq^'G%ku8DJ`s&FF-VU6r7fCFAR!r@qB_&DfU8Q
I=$AO$4R>IF`V,5@:O(]B4ZF%@;]S#BOl.3%16?Z@:s.mFEq\6HY-](@sNJ3$4R=g+Cno&AKYPm
@q[!(@:s-\$=%U`Df9`E>\.bkBR=!+De*:%I=2P3%16?SAp@m/AU"Xk+<Xp3F(K<!@r#LcAQs4e
FDtZ$ATMR3ANaX6Cia/=+=/.L@:s-oF(or3+Co%qBl7Km+C]U=G\(u.GRY!&+<VdL+<VdL+<VdL
+E_R9@rGmh4_A,=F(HmF+<VdL,p7>JBk)'lAKYH&ART@q+EqL1DBO(CARlp-Bln#2G\(u.GRY!&
+<VdL+<VdL+<VdL+F%I>AU%L-BR+Q.EcP`'I16NgAScF!%144#>]k+!E+*6l@:s.UF`(o'De*EB
FE2M8?$g71E+O'1AS-?"$=%1W%13OO>\JD%ATDj'FEMPL@WH$gCM[^&CNDX\EckqE%144#+<VdL
+<VdL+<Y-3Dej2uEbf_ZFE2M8/.Dq/+<VdL+<VdL+<VeGA7f7mFD,T54aVT.%144#+<VdL+<VdL
+<YW6Aoqa/Ch5bVI4Pg7+<VdL+<VdL+<VdL@rH1%EboH-CNDX\EckqE%144#+<VdL+<VdL+<YfI
Ch%C"DfS!MCis;?%144#+<VdL+<VdL+<YK7DJNa#Ci=>WD..'gDKK;<%144#+<VdL+<VdL+<YW6
An#\!A7]dEHS?Qr+>A4l%16?]ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16NgF(KH0ASu.&BR=!'
@<-F)BlJKI2K3a\E,9Z<+>RnX+Dkh1F`SZ[E--L;$=%X`FDPN+B67g6>\.b`EbAs$@sN-;Eb0?&
BRP4`ASli<+=/.LEb0E*DKI">G%G]+F_kk:Ch[cuEt&I]F(KH'Dfor>ATE-=ARfV#D.I3sFD-)L
0RXB;%14C(Eb0<'F<GC.FCf\>Bl7HmGT_*H+E_a:+EV:;ARuuoDesQ5DK?pP+Co%q@<HC.+DGm>
FE_X4$7-g=BPCsi+ED%7F_l/@+DG^9Ci=E:+E(j7G@>Q7ARlp&@:s-oF)YPtAKY])+DbJ(A926h
E+KIc,p5rY<(/hj@:X+qF*&O=Aftf*A7^!.DIIBnF!,LGDBO%>B4Z0uATAn&$7-g,Ec5eU+D>k=
E&oX*GB\6`CghEsGV*EDD/FE5BlnVQDfTJDG%kN3FDl,4@kM_6E'Iqt1a[<-0fLmG%16?_F(K<!
@r#LcAUA9:CijB$Desh2$=%FVCLpprCh7^1ATA4e>]OCnATq^'G%ku8DJ`s&FF/+CASH$mAU&V4
$6UI<>\Re8FE_Y5DesQ5D@Hpq+<VdL+C%0PATMs3DIm<rCh@*lF(Gdf+<Ve3AScF!%144#+<VdL
>X3=@F*)><ARfXpFE2M8%144#+C&Mm%144#+C&u!FDPN+B67g6>[q\gF_u#;AT2[4Ch8$A0Q;,^
%144#+C&u!FDPN+B67g6>[q\gF_u#;AT3'E1Gs,nI16N++<VsQ@q]:gB4W2A+EVNEA7]grEb/c(
DKTf*ATAo3Aftf*A7^!.@rH1+D/OD($6UH6>[h8WBl897F_l/6@rH1)I=!bu>?l5\@ruF'DCU!<
Bl7HmG]$r,AURhn$6UH6>]!niCLV4(BR<uY@;BFSE,]B/@psFi>\S(dAU&*$D.S,A%144#+<VdL
+<VdL+<Z#99jqgK<H)ngEarO!AR&qeA7^"'@;TS(,n12(+<Xp2BPDO,@:s.mFEq\6HZ3e0Bl8>.
$6UH6>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$6UH6>]XIuCh7KsFD-#+E+*d.CM@a9HSBD\
+E2.>F!*.h1N7Ga%144#+C&quCghPt$6UH6>\mtn>\S:kD-T>?A9_g1ASliA%144#HX(-"A:&09
CijB$DesKC>\Re8Eb0<6Df0,rDerZsDIm<rCisT4>\._mAR&_]ARTUu@:s.VAncZ&$=%FVCLppr
DffZ(EX`?b$=%FVCLq3tA7]up$4R=k%15is/j;IJIXZ`\De*]nCLp7-/g)WYDe*]nCLnVu/M/)d
@rc:&F<GF/CM@[!+=84@De*E%D..<rE-5u*FD5Z23Zr!YFCf?2Bl@l3De:+?C2[W3/e&._67r]S
:-pQU<+oue+EM[7@r,RpF!,")Anc-oF!,UIBl%L*Bk;?.AoD]4D..3oDJ()5@rc:&FE8R:Ec5e;
%15is/g+eIDfp#?+CT.u+EM[>FCfMG+<X6t+CT)-D]iP.DKK<$DK?q1De*E%AoD]4@;]LiH$X1B
B-7Wj:-pQUDIIBn+ED%*ATD@"@qB^(Bl5%c+EqaEA90@G%15is/e&._67sBPDKKH1Amo1\+Du+?
DK?pI+Eh=:@WOR>$;No?+<Ve>ATV?sCij_@+<VdL+D58-F!+n-C`mh6D.Rd1@;Tt)%15is/g)8Z
D..3kA9Da.+<VdL+<Y3;D/aP=DdmHm@ruc7Df-\:@<?0*FDi:@F`\a:F_u(?A8-'q@ruX0Gmt*U
67sB'+DkP&AS6',+<VdL+<VeD@;BEsB6%p5E$/S,A0>r9Blmo/F(96)E--.1$;No?+<VeE@;TRc
@<?Q5+<VdL+Cf4rF)u&-Bk;?.DIIBnF!,17+A*bdDe*Dg$;No?+<VeGF`_&.Cij_@+<VdL+E2IF
F!+n-C`mh6D.Rd1@;Tt)+>"^WARuu4B4Z0nCi"37.1HVZ67sB'+EqpLAU&;>+<VdL+<VeNDfTA2
@;]TuFCfN8+EV1>F:ARP67sB'+Eqj:B5DKq@;L!-+<Ve<G][t7@ruc7B5DKq@;I'(@;TRs+D,Y4
D'2Fn@rGmh%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,-u*[2D..3k+ECn.
B4W2?2)$U:3B8Mt$4R>PDe!TlF)rHO@;9^kD..3k-OgDmDeX*1ATDl8+=CT4De(4)$4R>;67s`u
AT23uA7]Y#F!,]Z/Ket@C1UmsF!,[@FD)e-AS,XoBln'-DBNJ$E+NotASu!lATJ:f%15is/g,7E
B6,1f:IH=9F_u(?F(96)E-*4CAR]drCh+YuDf'?"DIdet$:Ilg:fK_N4ZXr5:-pR[.S<K).X`ZR
$4R>;67sBs@<-!l+EV1>F<GdJ@;m?2ASlC)Eaa!6+Du+?DBNh*D.OhuDIal+Bl7K)GA1T0BFP;M
;F+,Y9i+n_6p3RYH?pr#2E)'P%15is/g+_ME,oN2F(oQ1+EV:*F<G(0ARTV#+EM%5@<?!m+E(_(
ARffk$<'_f9LV6F4ZXr7/otr@Ch7$q-S.Yc9i+eT7h#e7$;No?+D#e:Eb0<5Bl@l3FD,*)+ED%&
F_PZ&F!,+9Dfp#?+CT.u+EM[>FCfM9Ao_g,+EM%$FCSu,DdmHm@rri(@<>oe$<'_j;G]M;-Qm&B
E$dak+tau^/g)Mh-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K-QlV9@rGk"EcP`/
F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5FDl22F!,[FEb'56Bl5&8
BOr<-@rc""@q[!'@VTIaF<G:8+A,Et%16$0:fUIX3[\ueE-67F+tb5jDJWZ--S/1l9M\#A9LUK[
-XS!1/i4q'+BosuDe!p1Eb0-1+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*
F<GXHDfTE1+=M,9D.P8?AU&;G+EV%$Ch7Z1Bl5&7@rc""@q[!'@VTIaF:ARU:Jb%j<(0ng4ZXr5
E-67F+tau^/gi"o/1<]//ltq::fL.c=%Pe//14dP-S/1l9M\#A9LUK[-XS5K+BosuDe!p1Eb0-1
+=AOG@<6!--RUH5<D?:h5t;@k%15is/g+_ME,oN2F(oQ1+EV:*F<GXKBlmiuATJu9D]iq?D.7's
ARlp)@rc""@q[!$De!3lAISuF:K(=d<'s2>3[\EU@s)g4ASuT4;bpb-8l%in@VR8A6rcrX<'a"`
$4R>;67sa!DId9hE+NotASuU2%13OOC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXCEa`Tl+E(_(
ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</DId=!CjB`4
B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2+E(_(ARfh'
/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*D]iP'@;]^h
+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1Amo1\3XlEk
67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2FCfK1F!)SJ+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0qBk([l@ium:B4Z0-
@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9@s)X"DKI!D+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFCf]9Cgh$q+<Y<.F<G%$@r$4++Eh=:F(oQ1F!,C5+EM47
Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9
B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\EcW?G+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oDdmHm@ruc7+D58-+E(_(ARfh'
+D,Y4D'3:r@r$4+F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'+C]5)F(Jd#@qZu-+<Y`:@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)@r$4++DtV)
AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DK?6o:-pQU+<Y-2F_u1B+<VdL
+<VeIATW'8DK?qCDJ=*5AKYGj@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9@UWb^F`8I@
F_tT!EcW?G+<VdL+<VdL+<Vd9$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"Gp$X3@ruF'
DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%+CSnkBl8!6
+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:+E1b2BHUi"
@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+F(KD8A8,Oq
Bl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(ARfh'%15is
/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+Ch7^"+E(_(
ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/@<?0*Bl7O$
Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0%15is/g)8Z
B4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01@;0U%+<Y<.
F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-B6%p5E$/S,
A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGCART[pDf-\+
DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIaFE7lu:-pQU
+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;Dfp"A@;]Tu
F*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1UmsF!,17+E2IF
+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg%15is/g)8Z
Bl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?+<Y9-FCSu,
Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>DkFC>Uc:-pQU
+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is/g)8ZDfB9*
A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*DIIBn+Dbb5
FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?6o:-pQU
+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2AFCB$*+<VeJ
FDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeGF`__6@VfTu
+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f:-pQU+<YWG
FED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=AKZ)+G]\!9
$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJF*)>@AKZ28
Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;ATMp$B4Z-,
-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`Bl8!'Ec`EO
@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,XoFD5Z2Et&Hc
$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1@;Ts+D..I#
%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(AU#>6BleA*
$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'Df0-(F<GC6
F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>3^ZY:5uL?,
6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+EqaEA0>bu
D.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'Df0-(F?1Og
BOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(AKYK$D/aE2
ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm0d%T667sBm
Bl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG/g+b?Ch4`!
Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQUAnc'm+Cf>,
E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'767sC$AS,Lo
ASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2ASuTN+ED%*
ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm+Cf>,E,TW*
DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,A0>r9Blmo/
A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE:JNH.:.88]
9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+A0?)7Eb$;'
@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*:.%oJ5u^EO
:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:ATDm(A0>u*
F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P:eX/H:(7O>
$;No?+DtV)AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<-S?bh%13OO
:-pQUFE2)4+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'845m?%17,p
A9;j+D*9pc+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0F<G%$@r$4+
+DtV)AKYr#FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#<$l$cFCfK6
FE/f>$4R>;67sa!DId9hE+NotASuU2C2[X)ATMs)E_\qR.V`m4FCfN8ATAo+/M/)[De'u4ATMr9
F(96)E-*4FFD5Q*FD5<-/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-h
FCeuD+>PW*0l:?E0f'7G:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU0em9O@PK\^-u*[2FCfN8ATB4BDJs_ACi<`mARlot
DKKe>-u!F7A18X;De!3lAISuA67sB80lCoQ0fU:(FCfN8ASu[*Ec5i4ASuT=+Cf(nDJ*Nk+EVNE
@rc-hFCcRCATB=EDImi>+EV19FDtZ0F"&5GDBL?AC2[W3%13OO@rGjn@<6K4-Y[=6A1%fn    ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H?R:+>P'!+>Yu"1E\G1+>t?!2]sh0+>u)"2]st6+?1K#0H`@u1,WN`Bl%<pDe+!4Bl%i5F`V,)
+EVNE@WcC$A0>;uA0>DsF*)G:@Wcd(+A,EtC2[X"@;0U%8l%htA8,OqBl@ltEd8d;CghC+C2[Wn
Ddm6kEb/a&DfU+GDdmHm@rri'CghC+3Zr!YFCf?2Bl@l3De:+?C2[X(FDl22.;Ed3Ch\!&Eaa'$
B4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfguGp$^>Df$Uh:IH=<
Ec6)>F)#W(D..3kF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7
-u*[2.;Ed3F*)>@ATMs3Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.;Ed3FCfN8
ATDO(A0>u*F*&OG@rc:&F<G^JBl%L*Bk;>                                        ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0eje*+>P&o0d&>/3&>;fA8Gt%ATD4$ARK7kA8Gt%ATD4$ARHWpF!+m68g&7uBl%L*Gp%0<EbTK7
+EV:*F<G4-DImisFCfM9.Vrg@ATD4$AL\f3$=n'bF_t]-FE8R8Bl[cpFDQ4FAo_g,+A,Et+Co1r
FD5Z2@<-W9B6%p5E-!W@$4R>IF*1r5ARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC8T&W]Eb8`i
AUP!p%17Q5IXWDd+>.COI16NrEc>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A
.![6N$?Kd#C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$@[GQILQVn$=%Xp
@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?7"#LO%16KXDe*ZuFCfK$FCei&D..3k
F!,OBD.OhuF)uJ@E-,f4DK?q/@W-C2+EV:.+A*bdDe*E%@;]TuA8bt#D.RU,%172gG]Y'BF<GOC
De!@"F(KDF+A$Yt@<6L4D.RcL%13OO0eOS7Cht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&-s$8O4V8l%htB6%p5E$/\0@s)X"DKKqB?nrib+Co2-E$-N@Ec6)>DIIBn
-X\'*Eb-@tE+*WpDds4`+<Ve:Df'H%FD53#AKYhuEbf3(GA^\7BQS?83\N.$DeO$*@:NnXEbo0%
AM.k3F>%TADIdZq02b5)6qp*&BQS*-,B.(/A8bt!/T"p:CLh@-DCH\;$6UH6FCf]=+D,Y&B5M3t
FE9&W.TC(qF!,1<+EV:.+Dl%<F<GX9EbTH7F!,:5D/"*#FD5Z2+E(j7?tsUjCh\!&Eaa'$?nNo<
$6UH69lG)p+E(j7D0[7:Ec6)>+CoD#F_t]-FE8R5Eb-A2Dfd+=@<--oDg-(O+A!\aD'3n9Dg-#C
%144#+Cf>-G%G]9Bl7Q+FD,6&/g*_t+F.mJ+Cf>,E,Tf/+D5_5F`8I6De!p,ASuU2+E_a:+:SZ#
+<YW3DIdZq+DkP-CLh@-DBNA*A0>8pDe*ZuFCfK$FCei&GA1l0+C\n)@3BB)F<GF=Eb-A9F(Js+
Cb?/(%14mD+@0mj+D5_5F`8I5CghC+>@'-l+DG_8ATDBk@q?csF!+m6F(oK1Ch4_]+Eh=:@UX@m
D'3;(De!Q*FD,*)%144#+DGm>D..I#ARlp-Bln#2@3AfK@8pf?>Te*!@ruF'DBNG-D/E^!A1eun
G[YH'DIj7a+<VeKBPDN1B6%p5E$o]LA8bt#D.RU,+CHrI3?VjHF)W6LC2[X!Blmp,@<?'.?m''"
EZee.%144#+D#e+D/a<&/e&.1+<V+#+<VdL+<VdL,p7#4FCf\>F(Jj'Bl@l3%144#+<VdL+<Xp1
F^fE'@ruF'DL5W1AU&<=FF.Y@Dfp#:@;TS(+A$HmATDBk@qC&t$4R=b+<VdL+<VeUIXZ_gHQXqU
I16N++<VdL+<Ve>Ec>i/F<D\K+<VdL+<Ve%67sBt@;BEsCghEsGT^U:EZf"8Dfp"A.![6N$6UH6
+<VdL+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+D,P4+E2@>@qB_&Bl7Pm$6UH6+<VdL+F\cg
IXWC^%13OO2(g"HDf..!+Cf>#AKY].+Cf>-Anc-oA0>u4+EV:.+A,Et+D5_5F`8I:ART+\Ea)j+
>p*QnA0>T-%144#+DkP-CLq$!GA2/4+E2C5F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+
B-:o++CfP7Cj@.2H[T92$6UH6@WGmeCLqU/+D,P.Ci=N=+E1b,A8bs#F)Q2A@q?cmDe*E%BPD*m
Ch[NqFD5W*+Cf>-G%GQ5Bl@m1/e&.1+<Y',De*ZuFCfK$FCei-F!,.-@:Wqi+Cf>-FCAm$F!+^]
@8pf?>TdNpA7Zm*BOQ!*BlbD6@<--pA0;<g+<VeCBkq9&FD,B0/g(T1%144#+<VdL+<XEG/j)7F
IXZ_gHQXqW@<?(*+Du==@V'RRBl7L'+EMX5EcackDf%W]0d7`g%144#+<VdL+<XEG/j;IJIXZ_g
%13OO>]Y$sF(Jj'Bl@m9;KZkpBl7Q+>]aP%FEDVOC2[X!Blmp,@<?(/I16Mm$=IUeA8Gt%ATD4$
ARHX$F`)7CDf-\!Bl7I"GB5;X9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=Afs\u>@'$i%13OO<,Wn%
F(HJ%C2[X!Blmp,@<?'g+F.mJ+Dl7BF?0j<%14gB+A$HlFCB!%+A,Et/g+@j:IJJ:BQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>FfA7TUrF"_0;DImisCbKOAA18X8F!+m68g%PQA8c?<%144#
+A$YtBlbD>F*1o-Cj@.;DKBo.Ci!Zn+EqOABHUMO5tkQ4BQS?83\N.1GBYZSF)PZ4G@>N'/n8g:
05>]FCM>Fo5ti^[%144#+:SZ5/g*`'F*(i,C`l>G6rQl];F<l*+BqH66rQl];F<lY-tm^EE&oX*
GB\6`C3+<*FE_/6AM.J2D(fXJBkqE96"FMEDK@IDASu("@;IT3De*p-F`Lu'.1HV,+<YB>+CT)-
D]iI28g%PQA8c?<+A$HlFCB!%+DGp?GA2/4+A+pn/mDX;>p)^\+Cf>-FCAm$F!,R<AKVEh+<Ve!
:IH=9Bk)7!Df0!(Bk;?.Eb065Bl[cq+EVNE@WcC$A0=K?6nTTS:IJ,W<Dl1Q+CT)-D]iP.DKK<$
DK?6o+<Ve7C2[X!Blmp,@<?'5?k!Gc+<V+#1G0eKATW'6+CQC9ATDj+Df-\9Aft;s@;]Uo@pLKr
FEDI_0/%'YBPqZq@qK.iCgh3m/oG6B05t?;A8bs2.1HV,+<Yc>@<<W5F`;;<Ecc@F8g&2#DKK<3
+D>J%BP_BqBQRs+B.b<*AS!!+BOr;qCi<r/E,Tf>+:SZ#+<Xlb@;]Uo@j#5hF(Jl)8g%&XDKK<3
+@p3ZBP_BqBQRs+B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(dXu0etC93A3-A05t?;
A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:.3K',+<Ve=DfQt2ATV?pCi_3<$6UH6%14pE
+@:3bCh+YrC2[X!Blmp,@<?'5?m$S"C2[X!Blmp,@<?'g+DGm>@3A/bB6%p5E%W8*:IH=B@;BFq
%144#+A*bt@rc:&FE8R:Ec5e;B6%p5E-!WS<,Wmr@;BEs?tsUjCh\!&Eaa'$?m&uu3XlE=+<VdL
+<Vd9$6UH6+<VdL+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn+<VdL+<VdLDe'tP3[\Z\A7T7p+DPh*
+E_d?Ci^sH>9G^EDe't<-OgD*+<VdL+<VeDCi^^HC2[X!Blmp,@<?'.%144#%14sF+AZrfDBO%7
AKXT@6m-#S@ruF'DIIR"ATJu(Df0Z*Bl7X&B-;;0AKYW+Dfp"AH#IgJG@>B2+EVNEA8bt#D.RU,
/e&-s$6UH6+<VdL+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5-RT?1+<V+#2D-+GDdd0!
?tsUjCh\!&Eaa'$/moefAoqU)+DkP&Bl7Q+?tsUjCh\!&Eaa'$?m'0*+Ceht+C\n)Ci<`mARlp"
Bkq8h$6UH6@;^?58g&1bEbTK7/e&.1+<V+#+<VdL+<VdLCi<`m+=CoBA8Gt%ATD4$AL@oo+<V+#
2_H4OATT&'+EqaECM@[!+Co2,ARfh#Ed98[?tsUjCh\!&Eaa'$?m')nDImisFCfM9D..I#A8c[0
+CT.u+C%TK<+T0:+D,>(ATKI5$6UH66#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMt
Eb/a&DfU+GF)Y]#BkD'jA0>?,+CK8%FD>`)Ch\!&Eaa'$/mo+q+<Vd9$6UH6+<VdL+EM+9C2[X!
Blmp,@<?''-Y#2BFCf<.-QjNS+<VdL+<Ve%67sC)Bl7I"GB43#+<VdL+<VdLF(KH.De*ZuFCfK$
FCcRB05,9@AM7e:BPoJFASlB6+<XEG/g+tEDKU15$6UH6+<VdL+EM+9C2[X!Blmp,@<?''-[p/K
D/^jF+<VdL+<VdL+<Ve%67sBQ+Co%qBl7Km+D,P.A7]e&%144#%15'I+B!?"+CJi&E,961?m'B*
+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%144#+CJi&E,961?m')nDImisFCfM9>YJR*
AQW1[Anc'mF!,17+EV:.+EqaECM@[!+Co2,ARfh#Ed98[<+ohcEc5l<%144#+C%TK<+T0:+D,>(
AKY].+D5D3ASrW4BOr<!Ec6)>+DtV)AM+E!+<Vd9$6UH6+<VdL+D5_6Ch[u6-YdR1Ch\!&Eaa'$
-Ql/N/g,">CLqQ0C2[X!Blmp,@<?'5FCf\>%144#%15*J+B<Jo+C%TK<+T0:+EVNE@rH4'Bl%?'
FD,5.Anc'mF!,+,DImisFCeu*@X0)(B6%s-Blkt8+:SZ#+<X-fCh7Z1D..]4@V$[$Ec5H!F)to'
+EqOABHU]%A7fXdFCf])/0J>FASbdsAU%T*DfQt.Cis0&@<?(*?nMlq+<Ve0Dfp(C@q]dp@q?d,
Bl%T.@V$ZmBk)6nFCeu*@X0)<BOr<*Eb0<'DI[6#De:+lDJ<U!A7ZlnBOPpi@ru:&F"Rn/+<Vdr
DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AKYAQ:IIljFCfK$FCe9hARTFbCh55@
AU%Sl$6UH6Bl5&8BOr<1DfTW-DJ()&Bl[cpFDl2F/e&.1+<V+#<+oi`AKYE%AKZ&4D.Ohp9OUn3
=BltiATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D$4R=s/g*SnBlkJ*8l%iKBlmp,@<?'W
Eb/Zr@VfU.FCf])+EVN2$6UH6@q]:gB4W3-BOr<(F_tT!EZf:4+DG_(AU#>-DesQ5DK@E>$6UH6
<+ohcA7]@]F_l.BBlbD/Dfp(C@Wcc8FD,B0+DkP4+ED%7F_l.B%144#+DG^9Ci=3(+DtV)ATJu7
F`))2DJ()6DeEX'BOu3:+:SZ#+<XX%+Co%nEb/[#AKYo3+DG_'Eb/[#AKY])A7^!.@rH1+D/OD;
@q]:gB4X+5$6UH6%144#+<VdL+<XouAS5^pHYmnAFD56'Cib#O1jrS5F(Jj'Bl@l=HX(9&A7^"'
@;TS(>n%,`+<VdL+<Vd9$8O4V?tsUjCh\!&Eaa'$?m'Z6@;p91Ci=3(+EMIDEarZ'@rGmh+Dbb0
ATKIH=)q_gE+s3&+DGm>@rH7,Ec5c1ARl5W+<Ve9Gp$Kr;F+,Q8PMcU?nNR$BOr;sAS,@nCige6
F!*1l0Hak=@<,ddFCfK6/g*Mp@;]^h+EV:2F!,X7Cis;3%144#+DGF1H#IgJ@q]:gB4W2tDf0Y>
DfQt>@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,p%E,oN"AS#C`A.8kg+<YlBFD)e=BOr<-FE2)5
B-:S`;F+,Q76s=L+EqOABHUhsAmoguF<FgSCh7X/<,ZQ!>]aP%FEDVO4t\H?5(.i3%144#+<V+#
%16<G0jQg_?tsUjCh\!&Eaa'$?m'Z-Cht57F`&=?DBN"pDId[0F!,X;EcYr5DK?q=Afs\g2D-[=
+CT.u+C\o-Df0)<%144#+<VdL<+ohc9PJBeGT^F4A0=TT@j#r+EcYr5DK?q=AftJrDe*ZuFCfK$
FCei&Eb065Bl[c-8g$&F0JO\YDIal!AU/33A1euI%144#+:SZ^?8>eI+AZkt2DcOcBlkJ@ATDj+
Df0V=De:+a+EV:.+EMX5DId0rA0=K19H\%eF*(i,C`mY.+A,Et;bpCk6U`,7@<iu-@;0O1%144#
+<VdL;e9M_>?#9I+A-Q_+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8
A1_b/B4W_@@rH4$ASuTA1,1I3%144#+<VdLAoD]4@;[2rCij6/DIIWu+DG_7FCB!%+Dk\3BQ%E6
+<V+#%16<G1L3$a<+oue+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j+DGF1BlkJ,ARfXqATJu&+D>J,
A9)*r@q@88%13OO>@'-l3Zp^2.VEd?F`8I5CghC+.NiGH+CQBb:IH=<Ec6)>+EqOABHU_+A7]7e
@<,pi+Dbb5F<GL6+DG_8ATDBk@q?)V+<VdL+<Y*1A0>o2Dfd+GDfTB03Zqg%7R9C1=&2^^;d_(f
Ec6)>DIIBn.Ni/;A0>8X:JXqk:JsSZ?n,f0Dfp#:@;TR*/e&.1+<VdL+B!,rF<GdGEb'56@;Kau
G9C:%Ci"-'Aoh?&FDi:6Bl7H(@;Ka&FD,5.GAhM4F!,R<@<<W$ASc:&B-;;7%144#+<VdLFD,5.
B6%p5E%W8#CghC++D5_5F`;CEFEqh>@ps1iGp$pA@:UKpDKKe>Ci<flCh7Z?+CJr&A8Gt%ATD4$
AM.\3F'oFa+<VdL+<YB>+CT.1AU%X#E,9).De:,#+Cf4rF)rI:Ec6)>/e&.1%13OO%13OO%13OO
%13OO%13OO%13OO%13OO%13OO%13OO%13OO                                       ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,',<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bnlSmoke0'
zz=:zz,'1 bnlSmoke02 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode0'
zz=:zz,'0 dnlSmoke00 dnlSmokeMacroTexts dpsetSmoke00 edSmoke00 globsSmokeAs'
zz=:zz,'sign000 globsSmokeDD00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00'
zz=:zz,' mnlSmokeArgs00 newdSmokeBadArguments00 odSmokeArgFail00 restdSmoke'
zz=:zz,'00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''                         '
zz=:377{.zz
showpass 3 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
3?U%!1*A;-+>Y]dDe*p+Deip+ATMs7F)>i2AKZ)+F*)IG/Kf4JEd8d:@<6-m+EV19FE7~>
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
