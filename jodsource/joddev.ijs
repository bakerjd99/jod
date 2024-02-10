NB. sha256:d03f2608e863b95283f24ea2b83922e690c4f19c40dd4c5985ba0d571e054aa9
NB. JOD dictionary dump: 10 Feb 2024 12:01:53
NB. Generated with JOD version; 1.1.1; 10; 10 Feb 2024 11:43:27
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

JODTOOLSVMD=:'1.1.1';10;'10 Feb 2024 12:01:53'

JODVMD=:'1.1.1';11;'10 Feb 2024 12:01:53'

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

case. 6 do.

  NB. open entire put dictionary path - shallow recursive
  NB. closes current dictionaries and makes first (y) put
  if. isempty y do. jderr msg return. end.
  uv=. 3 od '' [ opd=. }. did 0
  uv=. <;._1 ; {: 1 { rv did ~ mdt=. od ;0{boxopen y
  if. uv -: ,a: do. mdt NB. empty path
  NB. attempt to reopen original dicts on error
  elseif. badrc uv=. od uv [ 3 od '' do. uv [ od opd 
  elseif.do. uv end. 
  
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
2)$.2+>P&o0H`)10Jst-2]sk32)ZR31E\D,2DQC01*A;12DZI9+>PZ-3$9q2+>Pi52e$Z@;f-Gg
AM>l767s`sDJW6gDeio<1*CZj/KcHNDJUaEFCfN8+D>2)BHUnqBl%p4AKYMpFCes(Bl@lA%15is
/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\,SDf00$B6A6+A0=JeFCfN8+D,P.A7]d(8l%iS
78m/:+EMX5DId0rA0=JeF`_>6F!)lABlYaIA8-(+Eb/f2%15is/e&._67sB'+>G;f.!0$AFD>`)
0JFpuA8,OqBl@ltEd8*$:-pQU+<VdL+Dtb7A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)
F*)/8A2#\b+AP6U+CfG'@<?&i$;No?+<VdL+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N
;cGDlATMs.De(OU-Ql/N/g,1GB5)F/ATAo)G][A3F:ARP67r]S:-pQU@rc-hFCeuD+>PW+1hL<.
0Ja.F:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!Tl
F)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE
3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m
<(0_b+B)6*;H/&r%13OO:-pQUBlbD/DerrqEZek1DJ!TqF`M&(%16fj@qHi2IS*C(<(0_b-OgCl
$;No?+EM+9+EV19F<G+.@ruF'DIIR2%16Ze+EM+9FC])qF<G[9Bk)6J3ZoelATMs.De(OU-OgCl
$;No?+ED%%A0>;uA0?):Blmo/@X3',Et&IsART+43Zp.#3\_s0?!oc[/grM2-9a[C1Eee5.4H\T
$?pN)FCdTr+>G$#1*Bk14?tMI1GU:@5U\E33\W!3%13OO:-pQU@r-()AKYE!Gp%$EASrW!DIal.
E+No0FCfN8+Co1rFD5Z2@<-W&$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+_G@<6!&@;^?5
@s)g4ASuT4FCfN8+Co1rFD5Z2@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL
%14d30I17AEaa$#+>G!LBlY=_5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*
@ru9m%16uaEZd(n+C]5)+=Ach%13OO:-pQUBl8!'Ec`FE@;]UoD'38-Eaa67+<Y-)FE_;-DBNCs
@r$4+F!,RC+DG_7F`M%&$;No?+D>2)BOu6-Bl5&8BOr<(C1q$sBOu6;FEhmMF(o/r@psC#Anc'm
F!,"-AnGUp%16cWF(f5q@r"4g+?q_+2'=b%0eb:80JG0i$><jhBPhg'4ZX]5Anc:,F<G%$@r$4+
-OgDoEZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze+E1b!
CLeQ0A8,Oq%13OOBOPsqBOPCd4ZX]M2'=b!2'an10JG170F\A&@<6+!F([Ws+=D5A@rH6q+C\bh
CNXSD%16Ze+EVI>Ci<f+E-67F-YQq0BP:gaCF9PuATAo8D/a<0@j#`5F<DrE@<6+!F(Zj0$>"6#
E+*6lA0>u)Bk)5o$4R>;67sBhCht5-@<6*nF!,O;Dfol,+E1b1Et&IfEZfF:Dg-//F)rI;@<6*n
F$2Q,0fL4aDJUFC/gh)8.P<@s4!67#0d(ls+EDX4@;9^k?Qa#jF(f-+%13OO:-pQU@rH=3+CT.u
+ED%2@;TQuDerrqEZeh"@r$4++EqaEA0>JuCh7Z1Dg#]4%15is/g,%CG@be;@UWb^F`;CE/Kf.K
BlbD@Bl%T.Bl8$5De+!#AKYD(BOPsq+D,%rCisc0%16ioDfTB04ZX]rBl\<9ARuuN5tbQl6qf-Z
.Va0GEb'5DBkh6-%16ioDfTB04ZX]6>WNu^+F>:e+DQ+=Eb'5?HYRbCEb'5#$7Kq+@:UKB0RJ.-
C3OT:A901BGB.D>AKX&gH[@A[GAhM4Et&IfEZfF:Dg-//F)rI;@r#adF(f-+4ZX]?2]uRIC`k)X
-OgCl$;No?+EMI<AKYYpF(f-++D,%rC`k;P0QS@NDBLYm+C]5)+=Ach%14d3AM,)e+>Fun+FPjb
EcteuC2[Wi+D>8#BOPsqATJ:f%15is/g)`m<(0_b+B)9-6UapP7TE-1/I`%uEb00.ASrVE%13OO
@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6$$m]CLoLd3F<4&@WcC$A7'(iA8Gt%
ATD4$APPQE.UmO7Ch-mfDe*ZuFCfK$FCcS9/M/)SF_PZ&+CT.u+Co2-FE2))F`_1;C2[X!Blmp,
@<?'5Bkh\u$;No?+:SZQ67sBjEb/[$ARmhE1,(I;De!lC2%9mf67sB4/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/KbK0:-pQU1,*WVF>,Qp@WcC$A0<:8De*ZuFCfK$FCcmD@;]TuA8-+,EbT!*FCbmg:-pQU1,*WV
F>,]t-u*[2Ch\!&Eaa'$?YEkhBOkOnAT`$0.3N&0A7]9\$;No?+>PWgDg!fn+=LuCA8Gt%ATD4$
ARBIrDfdEN@:Wn[A.8l@67sB90P"a)0JO[uC2[X!Blmp,@<?']9ggEQ@:Wn[A.8l@67sB90k=j*
1,0n\F_PZ&+EV=7AKYhuEbf5s+E)-?E,Tf>+E2@>@qB_&DfQ9o:-pQU1,E?XE\]Kp@:X+qF*&OH
D]i_%DIdQp+ED%%A1qk=Cj@.BF`\a:Bk)7!Df0!(Gmt*U67sB91Lt',1,9t#F(KH.De*ZuFCfK$
FCcmDDJs_AF`V,8+Co%qBl7Km+A*bgDerrqEcVZs:-pQU1,N`SDD=$lF`V+:@rH6sBkMR/ARloq
DerrqEcW@FD]in*CLnW*DfTD3E,Tc=@:F%a%13OO@rGjn@<6K4FDYu5De!-?5s]7(A8Gt%0KD.#
4ZXrV5s]7(A8Gt%0KD-@+BosuDe3rtF(HIV-UC$aC2[X!Bll$h3@>7C@rH(!F(KB6+=Cl<De(4)
$4R>\Df7d"+FPkQBk/>?%13OOF(96.4ZX]5C2[X!Blmp,@<?'.%13OO4tq>%A0<rp-n$HWD.Rr>
+>#Vs4"u#"Df7'L-Y[F/GUFpk-Qm/BA7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgDH0RInYE,9H&
+D58-+?MV3Bldcr+ED%%A0?):Blmo/F(eu;2)ZRuBQ&*6@<6K4FE;P4D/^V4De*ZuFCfK$FCefm
@<6*m@<?('Eblk5De*ZuFCfK$FCeKI6m,oMFCfK6FE/L5AS,k$ATMs6+DPe4G9CX<Dg-/=F*&c=
$4R>;67sBpDKBB0F>%ZGE,8rmAKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159Q
HREiD+Dt\4-TsL59gM-E:L@OFDe*2tB4Z0--W!T;<*q"(F(96.%14L>+?CW!.3Kuc+:SZlAhG2[
+?^i20RHM[6W-]e@;9^k?Qa<1F<DtoC2Rs6E,Tf>+?M>$HQ[39Ft"OhI3<E;G!.l//8es@+CoCC
%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`EGp"[]E,Tf>+E2@>@j#l-
D.Rd1@;Ts+DJsV>F`:l"FCeu1%16Z_F(HsH0b"J$DIb@/$7QDk%15is/g,:UA79Rk+EhU4+<`-_
.6T:+C2[X!Blmp,@<?']9gfEt@UrnhAN`'s.!0NP@;Ts+-RU>o-Ql,_-Ql/N/g,7[ART?sAoD]4
FD5T'H>d\4%16igA8Gt%ATD4$AQDMn4ZX].-n%8?+?hN,C2[X!Blmp,@<?']9ggEl@UrnhALS`M
0d&5#I3<9CA8Gt%ATD4$AQDMn%14L>+?CW!.3Kuc%16f]/g)hj4WlpBHZX+DCi<f+E-67F-YdR1
Ch\!&Eaa'$<_Yt0+CoCC%144#0d'[CF(fK9E+*g/+=D,NF<G+.@ruF'DIIR2+DGm>Eb/Zi05k`E
Gp"[]G%G]8Bl@lAD..3k/nAC4AKYl/F<G^FA79RkA1&KB%16Z_F(HsH0b"J$DIb@/$7QDk%17/n
Dfp/@F`\`R@WcC$A8,po+Eh=:F(oQ1+>#c"-Tc']A8Gt%ATD4$AQDMn%13OOEap4r+=D2>+Dl14
+D,>(ALBW%D/=89F(96.%17,c+Bos9Eap50@rs(]3__n-;GUY.C2[Wi+D58-+=C,a6r.0)De*Zu
FCfK$FCefrA1%fn%14L>+?CW!.3Kuc%15is/g,:UA79Rk+B(fs1,Us4BOPsq+CT.u+Cno&AKWC<
Dfor>@;0U%FD5T'.3Kc^.OdM5+DPh*Ch\!&Eaa'$?YEkhBOkOnAT`$0%16cWF(d]t+EM4)1,Us4
Eb/Zi+D,>(AISu]De*ZuFCfK$FCefm@<6*m@<?('Ebmm"+=Lo3F(dXEA79Rk.3L#m+>G<n+DPh*
Ch\!&Eaa'$?YEkhBOkOnAT`$0%16f]/g)hj4WlpBHZX+DCi<f+E-67F-YdR1Ch\!&Eaa'$?YEkh
BOkOnAT`$0-Qlr</e&.1+>G!C+EM47GApu3F!)iLF`\a:Bk)7!Df0!(Gp$gB+ED%%A1qk=Cj@-T
+D>2)BHV22F<G^FA79RkA1&KB%16Z_F(HsH0b"J$DIb@/$7QDk%14L>+?CW!.3N5:Ch5\L@rcGr
$7BG"Ch4`1@rcH74Y@k&%16f]/g)hjAM,*>F(8f/4s2sL/mg=U@qK@c4Y@j)+FZpY6m-qN5sn:D
-Qlr</e&.1+>=pB+EM47GApu3F!)iBDerrqE[YuX+Du+>+Cf>-Anbn#Eb/cB+=A^MAnP]uEb0?8
Ec*KP%16ZaA1e;uBkAt?An?4$F*(c(?Qa90F?M6!-u*1#CNDX"+DPk(FD,#r?Q^_F8jPg;;_KLL
F(96./13(u.4fOMEc*EU/no'A-Qlr</g(T1+<W(QART*lAnc'm.3NhTBlmo/F(fK9E+*g/+E)CE
%144#-p'220RI\IF=A>VEbTW,+EM47GApu3F!,4+@r$-:-WEl0:L@jTA8Gt%ATD4$AM.h1-OgDo
DIb@B%14Nn$4R>+0RI_K+E)1:+BosE+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6#(=KCh[uF3B:FU$=\-lCh-mlF`__:EcXuB/h1=QBl%<eE-68EATDi7F"Jsd@WcC$
A0>i6FED)7F!,UEA79Rk+D>2)BHUhoFCd'6$;No?+:SZQ67sBjEb/[$ARmhE1,(I=@<H3:3"63i
67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB91LY6C1,U1_A867.F<G[D+D>2$A8Gg"Eb/Zi05k`E
Gp%'KF<G+.@ruF'DIIR2%143e$=e!aCghC++EVI>Ci<fj5s[eUF`_YF0KD.#4ZXrV5s]I4FE2FV
3B8H0>9IEoATD4#AKX)_5s[eUF`_YF0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$4ZX^6/nA[,
+>=63%17/dEc+$$+=D,NFED)7F!hD(%159QHZ*F;-ZsNFCi^sH>9G^EDe't<-OgDH0RInYE,9H&
+D58-+?MV3Eb/Zi+Eqj?FCcS9BQ&*6@<6K4F(eu;2)ZRcAoqU)F*)FF@V'.iEb0<6EZf+7Dg*==
DJs`<Df^"CFD5T'F*(i-E$-MZF(96./14e<@<6*m@<?('Ebm*4$4R>;67sBpDKBB0F>%ZGE,8rm
AKYH)Bl%<&FD5T'+EMX5D/^V9DBNn:F*&ODEc5H!F)u8?%159QHREiD+Dt\4-TsL59gM-E:L@OF
De*2tB4Z0--W!T;<*q"(F(96.%13OO-o2u,+>>5e-RU#G$>F*)+>=p$+?hK+9gM-E:L@OFDe*2t
E-67F-p26^Dg-/=F*&Nd1*CodDI[i=+>S?fDI[iQ3Zotk@s/u*D_;J++<WB]>9J!#Dg-//F)rHO
E-67FA8,OqBl@ltEd8dAF!,L7@:V$0DJXS@/Kf"NF*&ODEc5G1FD5T'F*(i-E$0%:F<G^FA79Rk
A1%fnAScF!/g)kX$>"*c/e&.:%13OOEap4r+=D2>+Dl14+D,>(ALBW%D/=89F(96.%13OO-o2u,
+>>5e-RT?1:-pQUF`:l"FCcRn83o!g2BZ[AF(c\)DIal#@<?''+:SZk@<6*F/g,4K@59\u+ED%%
A0>JuCh4%_.!&m=DCd/BBOPsqA79RkF`M:G.6T^7-tm%1BKL<MD.Rd1@;Ts+-RU>c-nlbu.=E<_
/otNCDCd/BBOPsqA79RkF`M:G%16f]/g)hj4WlpBHZX+DCi<f+E-67FF(96./14e<@<6*m@<?('
Ebm*GA8a(0$6UHG+Bot0BQ&*6@<6K4-ZF3M+Co1rFD5Z2@<-W9BlbD;ART+&Df0B:+>"^ZATDj+
Df.1<@<?'5BOPsq+Du+>+E_X6@<?'k-OgDoCia/?+>F<4ASu$2%14Nn$4R>+0RI_K+E)1:+BosE
+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf6#^sgEcWop3F<4&A8lU$
FAm$pCLo1R:-pQ_A8lU$FAm$pCLo1R+ET1e+=Lc>F(KGB+@].)6Ua^8;cH1`:dJ&O+Co1rFD5Z2
@<-W9D/XT/+EV19F=n"0:-pQB$;No?+CT>4F_t]23XlEk67r]S:-pQU+<W?e+EMX5DId0rA0=Je
F(KE6Bl@l3G%G]'F!)lPBOu!r.3N&B@;0Od@VfTb$;No?+<Vd].3L$RDe*s$F*(u6.3N>G+CQC/
Ddd0!F(96)E-)Nr:-pQU+<WEg+FZpY6rZTR<$5mr+CQC&Df00$B6A6+A0>K&Ch.*t%15is/g)8G
$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'@<?'k3Zp131,N`SDD=-\$;No?+Cf(n
DJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`
$4R>PDe!p1Eb0-1+=CW,F(H^.$4R>;67sBt@;BEsC2[X)ATMs)EZet7Df$Uh:IH=9BleB:Bju4,
Bl@l3A8,OqBl@ltEbT*+%15is/e&._67sB'+E(d54$"a(De*BiFs(O<A0?#:Bl%i<+BosE+E(d5
-RT?1:-pQU+<YN;F!)iFDe*s$F*(u6-OgE!Ddd0!-YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&+AP6U+?M;#+AP6U+F.C4
D.R`1Df-[,$4R>;67sB4HW3F4<$5+=5uL[1/I`$r$;No?+CfG'@<?''@3BH!G9D$GBlS9,+Co1r
FD5Z2@<-W9%16Qb@;]UnATp9u+=D#EG%Gc,F*&c\,!'7KA8ZO,?X[\fA7$H,-OgDoEZf72G@Vh*
Ea`irDIn#RDers#Ddtpk+DPk(FD)dEIS*C(<(0_b0./;[Ea`irDIn#$$4R>;67sC!E+No0@;]Tu
F(KG9;FNl>:JOSd%16Ze+E(d5@WGmpA8Yt&+BosE+E(d5-RT?1ATAo(E-#T4+=C&U5t"LD9N`_P
$>"6#1E^UH+C]A"DIdWrG7=lg$;No?+E_RBAS5^uFCfJ8FD,5.A8,OqBl@ltEd8d9DIal,Dg#\7
FD,5.Anc'mF!,RC+CT/+FD,6++D,P.A7]cj$>"6#1E^^LB4N,oEa`irDIn#7%13OODIn$.Ddtpk
+DPk(FD)dEIS*C(<(0_b05b?FCi<f2/0[,cBk2+(D-p^dDe*2t-RT?1D..3kA8-'k@;9^k?Q_IK
ATqs/@grbS$7I\Q3Zp+*+=ANG$>F*)+A#%&:.\P1+<VdLA8a(C0d'[CF(f-$C`me4Dg-//F)rHO
D0@$L/8o?8Ci<f7-SHSi/8f$CCi<em$>"$pASGa/+A#%(8PUBNA8a(C0d'[CF(f-$C`me4Dg-//
F)rHOD/XT/+=A^YCh.@#@k8uM-S0.HGAM2-%16Z_F(HsHF(fK9E+*g/+=D;LF*2G@DfTr2A0=ZH
-QlV90H^f3ASu$2%14Nn$4R>;67sC$AS5^uFCfJ8A8,OqBl@ltEd8dADBNh.G9C^?@psInDf-!k
ATAo6AS5Nr@WGmpA8Yt&4)SVRCi<f7-SHhu@WGmpA8Yt&%13OO:-pQUDfB9*+DG^9DIn#7Ci<fl
FD5Z2%16Ze+E(d5@WGmpA8Yt&%13OO:-pQU@<?U&D/aS>FDi:CATT&8ART+&GB.D>AKWQIF(fK7
Ch+Z/ATW'8DBNe)F*(u604\d,FD5Z2@<-W9D/"'.@<?!m%16uaEZfF:Dg-//F)rI7E-#T4+=C&U
5t"dP8Q8,+%13OO:-pQUAoD^"AKYhuF*(u6+E1b2BHV#,FDi:4Bk)7!Df0!(Gp$O5A0>AuDf]J!
$>"6#A8lU$F<Dr#:JsPK9gM]W78crJ<(JAG$>"6#1E^UH+=ANG$4R>;67sC$AT)O!DBLMRF(fK7
Ch+YsCi"$6+ED%%A1r.IBlmo/F(KG&$>"6#De'u"Ea`irDIn#$$>"6#A8lU$F<Dr/76s=C;FshV
-OgCl$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h
-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:GbA5d>`CLo1R:-pQ_De)d`Deio<0HbHh/KcH[
A18XCATMr9DfB9*Bl7Q+De:,'DKKT5AKYr#FD)dF2BZpK.3NPJFD5Z2/e&._67r]S:-pQU@<6L4
D.RcL%15is/e&._67sB'+>>5e@rH6sBkMR/ARloU+EV19F<G16Ch.*t+A,Et<(0_b/0K"U@;]Ua
Eb$:b+E_d?Ci^^IA8-'8+Co2,FE1r(.1HVZ67r]S:-pQU@rc-hFCeuD+>PW+1hL<.0KBRL:-pQU
@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M.D=%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c--YdR1FCfN8ATB.-$4R>PDe!TlF)rIGD/a<0
@p_Mf6$$m]CLoLd3F=p1+=BH@6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!g
DKBB0F<DrFC2[W1%13OOFCfN8ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*
;H/&r%13OO:-pQUBlbD/DerrqEZek1DJ!TqF`M&(%16fj@qHi2IS*C(<(0_b-OgCl$;No?+E)41
DBNA(C`m8&@ruF'DIIR"ATJu4DBL?9A8Yp,+E1b2BHSlLG%G]>+Dbt6B-:r-A0>i"FD)*jATAo7
ATW$)Bk)6--XgP'A1&K/$>"6#F(fK9E+*g/+>t?\A0<7.A8Yp*%13OO:-pQU@UX=l@j#5hA0><$
B6A'&DKI"CATMs7%16Ze+>Y-YA0<6I%16uaEZd7_De't<-OgE#ATAnO+E(d5-Y..,F)Go<AU%p1
F=.M)DImi22BZpK+>bks+AP6U+DG_:@;KXg+DtV)ATJ:fDImi22BZpK+>Fut,U[kGA76hp$4R>;
67sBmBl\9:+Co1rF<GL;+>"^SFD,6+F!,10DJsQ,A0>H,ASrW)AftPkA.8lWEZd7_De't<@:X7d
-T`\72`NcV3B9)[3B9)[3B8Gr$4R>;67sBmBl\9:+Co1rF<G%$A.8l`ATAnO+E(d5-[0TLDJ*Em
FCSu34""HIDIb+($>sEq+>t?\A0<6Y2`NcV3B9)[3B9)[3B9)[0IJq0@:X7d-OgCl$;No?+EM+9
+EV19F<G+.@ruF'DIIR"ATJ:fATAo7ATW$)Bk)6-FC])qF>,j=+=D8BF*)/8A2#\b%16Ze+EM+9
FC])qF<G[9Bk)6>4ZX]5FCfN8C2[W:0ddD;ATAo7ATW$)Bk)6-FC])qF>?!?+=D8BF*)/8A2#bd
%13OO@r-1-@UWb^4ZX]A+?CW!%15is/g+Y?Df]J4@;^?5DfB9*+CT.u+E)41DBO%4F*&O8Bk)7!
Df0!(Gmt*/-Y?e$C`mY8ASu4"B-8ci+=A^c.3N&?F(KB6+D#R9De'u9+BosE+E(d5-RT?1%15is
/g+Y?ARTU%@;^?5@s)g4ASuT4E+*j%%14L2AmoCi+E1b2BHUf$ARTUnDJ((D4s24(GpskEF)to5
F<G.8+CoG4ATT%B6VKp7;G]YY81+iR%15is/g+_G@<6!&@;^?5@s)g4ASuT4FCfN8+Co1rFD5Z2
@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%14d30I17AEaa$#+>G!LBlY=_
5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*@ru9m%14Ip@;0O#@UWb^F`;CE
AoDg0A1&L.F)to5F<GI4EZd(n+C]5)+=Ach%13OO:-pQUG@`.BAKYW(De':a0b"I=%13OO@r-1-
@UWb^+EV..@rsC6$=dmmFCJZgCER_0Bk)6>%16T]Ecbc!@r!3/A8,Oq1(=R"$;No?+E)41DBNA(
C`mh2F*&O8Bk)7++CT.u+CfG'@<?''@3B3'Dfp"A/Kf.KBlbD0Bm+'/+EV:.+E2IF+Co1rFD5Z2
@<-W9@3BMtFD)*jATAnL+E(d5-RT?1ATAo3A0>u)Bk)6=4*5"I@rsFeFC])qF>=sJ$4R>ODf7d"
88iE03bD/`4ZX^"/g*"\$>"6#FDYu5Ddso/F`\`f3[\BTD]hShD]iXf:F?SYATAo+Ec<-_3[[I:
Db"hdF`8I4Df6ahDf6b1:JW>\%13OO:-pQUE-67FA8,OqBl@ltEd8dH@<?/l$?0Np@<?0G3ZpM2
3\bu%G$eZmDe*2tA8,QsINU<R$4R>REZd.\De't<-OgDoEZd7_De'u4A8,Oq0F\A-A2\C8FD*fu
+?Op20mdqa?X[\fA7$HiBk/?8+>=63%15is/g,+AFD,_<F(fK7Ch+Z*@<?!m%17&bE+*j%+>#Vs
De(bF@<?/l$4R>;67sC&BOu6r+Co1rFE8RGBQ&$0A0>PoG%De-D/aTB+E1b2BQFUiATAnL+E(d5
-RT?1ATAnO+E(d5FC])qF>443-SHhi4Wlh53\bu%G$eZmDe*2tA8,QsINU<R$4R>REZd.\De't<
-OgDoEZd7_De'u4A8,Oq1(=R<0..l*+?Op20mdqa?X[\fA7$HiBk/?8+>=63%13OO:-pQU/ULGc
;cFl<<C9,B;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZ
Ci<fj5s[eXD/X3$3B9*,%17,eF*(qkD/X3$0JH6g/h1mQF*(qkD/X3$0JFVk/M/(nEb0<6A18XC
ATMr9@UWb^F`8IDATMs3Eb0;E%15is/e&._67sBhF)uJ@ATKmA$;No?%15is/g)8Z0I\,SDf00$
B6A6+A0=JeFCfN8+D,P.A7]d(8l%iS78m/:+EMX5DId0rA0=JeF`_>6F!)lABlYaIATD4#ALns9
ATD4#ALS&q:-pQU%15is/g)8Z0e"4nFCfN8C2[W:0I\,TBk)7!Df0!(Gp!P':-pQU+<VdL+Dtb7
A0<7AATMs.De(OU-Tc'^@<?0*-[nZ`6rZTR<%i?)F*)/8A2#\b+AP6U+CfG'@<?&i$;No?+<VdL
+<Y]9B4N,4FCfN8C2[W:0IJqsE+*j%+=DV1:IJ/N;cGDlATMs.De(OU-Ql/N/g,1GB5)F/ATAo)
G][A3F:ARP67sB'%15is/g+YEART[lA3(hg0JYIsAR[>L%15is/g+Y;@;]^hF#kEq/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%13OO@rGk"EcP`/F<Dr?
@<6!-%17,eEHPu9AKW@8De*s$F*(u6-OgCl$=e!aCghC++EVI>Ci<fj5s[eXD/X3$3B9*,4ZX]5
5s[eXD/X3$3B9)I+BosuDe3rtF(HIV-UC$aF)>i2AN;b2-OgDmDeX*1ATDl8-Y[=6A1%fn%172g
F*(u2G%ku8DJ`s&F<DrDDf9/64"!Wr6miEN:-pQU/ULGc;cFl<<'aD]I4Ym8%172fBk)6J3Zoel
ATMs.De(OU-OgCl$>"6#De'u4A8,Oq+BosE+E(d5-RT?1%15is/g+_G@<6!&@;^?5@s)g4ASuT4
FCfN8+Co1rFD5Z2@<-W9@UWb^F`;C2$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%14d30I17A
Eaa$#+>G!LBlY=_5tbQl6qf-Z.P<1u%13OO:-pQUDJpY,@:O(qE$/_4Ec5t@AU&0*@ru9m%16ua
EZd(n+C]5)+=Ach%13OO:-pQU@<?U&D/aS>FDi:BATMs3Eb-A;Bln#2DJpY,@:O(qE,uHqDImi2
Eb0<6A0>u)Bk)5o$4R>;67sBpDKBB0F<GU4DId[&+CT;2@<lo:+C\o(G@b?'+C\bhCNXT;+EVNE
Bl8!7Eb,[e:-pQUBOPsqATJu.DBO%7AKYl*BOPsqATKJGG]Y'LBk1db@<*K&Bl%@%+Co1uAn>ul
$>;.W3Zr*EF(f5q@r"4g+?q_+2'=b%0eb:80JG0i$><jhBPhg'4ZX]5Anc:,F<G%$@r$4+-OgDo
EZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze+E1b!CLeQ0
A8,Oq%13OOBJM_3+D>2)BP:gaCHX^$5;aQ@+>kE!0JG170JEqCBOPsqD0'>Q3ZoekARfXrA0>>i
@r$4+-OgDoEZfI@E,9H&+E2IF+=Ci2F(f5q@r!G$$>"6#FDYu5Ddso/F`\`RBOPsqD0'>;%16Ze
+E1b!CLeQ0A8,Oq%13OOBJVe4+D>2)BP:gaCHX^$5;aQ@+>kE!0JG170JEqCBOPsqD0'>Q3Zoel
BPDKt+C\bhCNXSD%16Ze+EVI>Ci<f+E-67F-YQq0BP:gaCF9PuATAo8D/a<0@j#`5F<DrE@<6+!
F(Zj0$>"6#E+*6lA0>u)Bk)5o$4R>;67sBhCht5-@<6*nF!,O;Dfol,+E1b1Et&IfEZf%(F(f-+
4ZY;V+C]5)+=Ach%14R;0-E>!0d&1nI4cX_G$eZmDe*2tBOPsqATJ:f%15is/g+Y?ARTU%F*)>@
ARlp$Dfor=%16Ze@<6!&4$"a&@<6*q@:O'qBOPsqD0'>;%13OO:-pQU@UWb^F`8I@F_tT!EcW@8
Ec5e;Eb/`lDKI"CD]it7A7]h(%16Ze+C]52D0%j$+C]5)+=Ach%16Q^F_u1_3ZoV!-9`P#I4cXO
DKTf;.3L2p-8%J)-S?bU$4R>;67sC$ATMs3Eb-A8BOr;uBl\9:+C\bhCNXS*$>"6#Eb0<6A0>u)
Bk)6HHTGVRF_u1/$4R>;67sC$AT)O!DBNt2F*)>@ARlom@:O(qE"*.cEZf:2+EV..@rrht+>Y-Y
A0<6I%13OO:-pQUD.Rd0@:s-oF(fK7Ch+YtAKW@4Bl\9:+C\bhCNXSD%16Ze+EVI>Ci<f+B4Z0-
-YQq0BPhg'-OgD1Anc:,F<G%$@r$4+-Qk!%+D>2)BPhg'+:SYe$;No?+CT;2@<iu:BQ&$0A0>_t
FCSu,Anc:,F<D#"ATAo8D/a<0@j#DqF<DrE@<6*q@:O(#%16c'+>#VsBOPsqBOPCd%13OO:-pQU
Eb/Zi+CT.u+Eqj?FCcS(H$!V=%17,e@:VM^+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5GB.D>
AN`'s0d/S5+C/A;5V=H@1+#1M-o3#-0I\F[$4R>;67sBjDfBtE@;]TuEb0,sD.Oi.Ch.*t+C\bh
CNXS=GAhM4+D,>(ATJu4G%G\'$;No?+Dtb7ATAo&@:O(qE-!-R+EV:2F!,[@Cht5.DKKo;A9DBn
+CQC+@<6*)AmoCiF`M%&$:IQN3Zrc1+F>_/:dJ&O?XH`2?XHE$6uQOL%16ioDfTB04ZX]rBl\<9
ARuuN5tbQl6qf-Z.Va0GEb'5DBkh6-%16ioDfTB04ZX]6>WNu^+F>:e+DQ+=Eb'5?HYRbCEb'5#
$7Kq+@:UKB0RJ.-C3OT:A901BGB.D>AKX&gH[@A[GAhM4Et&IfEZf%*CM7-tBOu6J3Zp.9+C]5)
+=Ach%13OO:-pQUBl7HmGT^p:+C\bhCNXS=GA2/4+D>2)BHUnqBl%p4AISuU@:WhU@r"4g+>=pP
/q+om/h\D'+<W`i0d'aE0d&1nI4cX_G$eZmDe*2tBObgk@<6*nEt&Ic@:X7uD*9p&+tb9*@UWeV
@:O'qHQ[_h+C]5)+=Ach.3L2p+=Ach+:SYe$;No?+CTA6ASlC.+EVNEEb0?2Eb-A&@:UKi@:O(q
E$-_TBOPsq+D,%rCisc0+D#e:ARfgnA.8l`ATAo6ATMs(+EV..@rseA@:X7uD%-g]$;No?+DGJ+
DfTD3BOPsq+D,%rCisc0+>"^RDfd+BARfXqD.RTqARlo8+@nds80C&<0fL4bDe*Dg$>"6#Eb0<6
A0>u)Bk)6H@UWebF_r[#5uU<]@;9^k?O[>O$4R>;67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#
E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rtF(HIVFDYu5De!-?5s]R/DeioE3B:FU$3  ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o0H`/-+>Get1GU(-1E\J-+>GVo1c-=8+>bu!0esk,3+?cA;f-GgAM>kf@W$!2+EV19
F<G7*F(c\.@;0P#Eb-A(ATVKnFD5Z2@WcC$A7'(iA8Gt%ATD4$AR]drCh+YsDIal#BleB:Bju4,
AKY`+A8Gt%ATD4$AR]drCh-mlF`__:EcY]4Bl%<&E-68EATDi7F`:l"FCcS.@<6*)A79RkA8lU$
FAm$pCLo1R-tI:<ATT@D7ScoL786'H<(0\]5u^AtA8,OqBl@ltEd8dEDg#\7FCfN8De)d`Deio<
0IUjM.3N_DF*&OCE+Np$DJ()1AftZ&FD5c,+E1b2BHS]]+E(d>+E)4@Bl@m0ATMs(;f-GgAM>ed
Eb0<6A18XCATMr9@UWb^F`8IDATMs3Eb0:                                        ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f_$40f^@4+>G_r1*AG43B/-:0H`+n2*!BJ+>P_q1*AP82DQC02BXat0f([H+>G\q1*AS;0H`))
+>P&q1,q381,'h++>GT)1*A;*+>P&p2`*?I+>GYp1*AG13&r*:0d&4o0eb:81E\Y"1*A>12`Dj6
1a"Or0ebIA+>GPm1*AM90fC./0d&4o0f:aA+>Gl!1*A;*0f^@22]sju0f([G+>GVo1*AJ82)ud;
+>P&o1,Up30f1".+>GZ.2bHk66<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=#+<X'\FCdKU0JstF@;[2C0JYI-0f1pG1-.9J$47,867sBZ
H#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqg1a#D!DBL\g
1,L+.1cdBJ3\iAr$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@
+?(Dc6t(1K3Zp.;+A-'[+>PW+1a"M/3]&WR0e`qA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"
+Co&,+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ2@9cu:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0f^@K@;[2C0JYI-
0f;!L3'&oN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.2
+<X'\FCdKU1,'hC@;[2C0JYI-0etdE3'&oU$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.3+<X'\FCdKU1,'hC@;[2C0JYI-0etdH0fh!H$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,'hC@;[2C0JYI-
0f(jI0fh'I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.5
+<X'\FCdKU1,0nD@;[2C0JYI-0KD0K1cdHL$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.6+<X'\FCdKU1,0nD@;[2C0JYI-0KD0L1cd<N$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,0nD@;[2C0JYI-
0KD0N0KLmI$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.8
+<X'\FCdKU1,0nD@;[2C0JYI-0ebXB0KM!K$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.9+<X'\FCdKU1,0nD@;[2C0JYI-0ek^F2``fT$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nD@;[2C0JYI-
0ek^G3'&cJ$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.;
+<X'\FCdKU1,0nD@;[2C0JYI-0f(jI0fh-J$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp13+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU1,0nD@;[2C0JYI-
0f1pI0KM$F$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp15
+<X'\FCdKU1,0nD@;[2C0JYI-0f1pI3'&cM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU0JO\>ARZc;0JYI-0f;!K1HI9G$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0JXb?ARZc;0JYI-
0ek^E0fh-H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp18
+<X'\FCdKU0JXb?ARZc;0JYI-0ek^E2``WN$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0JXb?ARZc;0JYI-0f1pH0KLsL$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU0JXb?ARZc;0JYI-
0f1pI2**NR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp1;
+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI3'&fS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1<+<X'\FCdKU0JXb?ARZc;0JYI-0f1pJ2EEQI$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0Jah@ARZc;0JYI-
0ebXF2EE]T$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp45
+<X'\FCdKU0Jah@ARZc;0JYI-0ek^D0KLmD$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp47+<X'\FCdKU0Jah@ARZc;0JYI-
0f1pI1-.3M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K
3Zp+6+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heCj6?R!YA0=Wi
D.7's3Zp49+<X'\FCdKU0JstBARZc;0JYI-0ebXC1-.6O$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp+6+@]pO+>PW+1a"M,3\`QS0Ja%C$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>>bt7V-$O1,(I?
+>PZ40KD0N1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU0K:1EARZc;0JYI-1,1gG1HI3E$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt5+>"^H
ATf1=6?R!YA0=WiD.7's3Zp:&+@KX[ANCqf3$:\%@N[E[1,L+/0fh0N3\WQ$$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+9+@]pO+>PW+1a"P/
3\iQR1,'%B$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2]s52
@<?'A+>>eu7V-$O1,(I?+>>f:2*!]T3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"
+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d&%jA7]p,
+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0KC7FARZc;0JYI-0ek^H3BAuP$47,867sBZH#n(=D)re3
:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hnt5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqf3?Ue&@N[E[1,L+.1-.*E
3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>GPm
7V-$O1,(I?+>GT31c%0J2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*F_PZ&+AR&r@V'R@
+>GSn+@KX[ANCqg0H`hr@N[E[1,L+.1-.*D3]/]#8l%iS:JXY_6<-TN6qBmJ<)6Cp1,TCG:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>>Yq
8muT[1,(I?+>G]60etdI1("?q:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS2BX,1@<?'A+>G\q8muT[1,(I?+>G]61,CsH0a\6p:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Gl!8muT[1,(I?+>GZ5
1c%0I0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS
3$9>3@<?'A+>Gl!8muT[1,(I?+>GZ52)[KQ2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'
/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A+>Gl!8muT[1,(I?+>G`72)mWS0FA-o:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp13
+A-'[+>PW+1a"M.3\`TT2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh0H`trDBL\g1,L+.1-.6H3\WH!$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp.4+<X'\FCdKU1,'hC@;[2C0JYI-
0f(jI0fh'I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<t1E[f.@<?'A+>PYo8muT[1,(I?+>>f:0f1pJ1C=Hr:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f1!q6t(1K3Zp14+A-'[+>PW+1a"J43\iNQ0KBII
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>G_r+@KX[
ANCqh0d'(sDBL\g1,L+-3BAuN3\WN#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU1,0nD@;[2C0JYI-0ebXB0KM!K$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>PYo8muT[
1,(I?+>GT31H.?P3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS0fU9u6t(1K3Zp14+A-'[+>PW+1a"M-3]&fW0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gl!+@KX[ANCqh0d'(sDBL\g1,L+.1HI?I
3]&Z#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp13
+<X'\FCdKU1,0nD@;[2C0JYI-0f(jJ1cdBL$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>PYo8muT[1,(I?+>G]61GCjH0a\6p:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,9sp6t(1K3Zp14
+A-'[+>PW+1a"M03\r`V0f'.D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>P_q+@KX[ANCqf0d&qs@N[E[1,L+.2**QM3\iDs$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp17+<X'\FCdKU0JXb?ARZc;0JYI-
0ek^E0fh-H$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u2'=#0@<?'A+>>Pn7V-$O1,(I?+>GT31,h6J2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,^6t6t(1K3Zp+3+@]pO+>PW+1a"M03\iBM1-#[K
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pku+@KX[
ANCqf1*B%t@N[E[1,L+.1cdEM3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^H
ATf1=6?R!YA0=WiD.7's3Zp1;+<X'\FCdKU0JXb?ARZc;0JYI-0f1pI3'&fS$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP150H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u3?TG4@<?'A+>>Pn7V-$O
1,(I?+>G]61c@BL0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&
:3CD_ATBgS1GBpo6t(1K3Zp+4+@]pO+>PW+1a"M,3]&`U2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP.&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y_p+@KX[ANCqf1E].u@N[E[1,L+.0fh$C
3\W>s$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hnt4+>"^HATf1=6?R!YA0=WiD.7's3Zp46
+<X'\FCdKU0Jah@ARZc;0JYI-0f1pH3'&cR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP15
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P=!1E[f.@<?'A+>>So7V-$O1,(I?+>G]61GV!I2[Tm!:-pQU
;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>GK'/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp+6
+@]pO+>PW+1a"J43]/]S0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP.&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>Ykt+@KX[ANCqf2'>A"@N[E[1,L+.0KLpD3]&f'$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hnt4+<X!nBl%<&:3CD_ATBgS1H$?u6t(1K3Zp+6+@]pO+>PW+1a"M,3\`QS
0Ja%C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>P&^
6t(1K3Zp+9+@]pO+>PW+1a"P.3\WQT1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp+9+@]pO+>PW+1a"P.3\rQQ0JNnA$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp+9+@]pO
+>PW+1a"P.3]/iW0KBII$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&
+AR&r@V'R@+>k8a6t(1K3Zp+9+@]pO+>PW+1a"P/3\iQR1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+>t>b6t(1K3Zp+:+@]pO+>PW+1a"J43]/oY
2)u!N$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'/KeS8Fs%noF_PZ&+AR&r@V'R@+?(Dc
6t(1K3Zp+:+@]pO+>PW+1a"M-3]/oY1boCF$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00eP1'
/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp+:+@]pO+>PW+1a"M.3\W<M1b]7D$;No?+B*Q,
FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00eP1'+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU0ea_>ARZc;0JYI-
0ek^G1HI9M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP150d%T*F_PZ&+AR&r@V'R@+>GPm
+@KX[ANCqg0H`hr@N[E[1,L+.1-.*D3]/]#8l%i^Ddmd!Ecu#)?Y+7uDfTo+FEhm_2,6Ij.S<K)
?Z0CpATDs*A7&ngEc5u>+EK+d+C]J++Dbt/+CT.u+ED%7E,TW8ATKI5$4R>;67sC-F*(i2F=hEC
/T5*>ATDs*A1_A5Ec5u>I16Mm$;No?4?Y)I.3N,@@<6*C+E)-?Ch76nFD5T#FCcRCA8Z34+CT;'
F_t]-F<DuHDe(M92)$j9%15is/g)o0+AH9b+>PW)2'=V03]/TP0f0=H%144#+<Vd`+>P'MDJUFC
A9B7/$Gs,i@;]j'ATDg0E]P=\Ch%R)%19tY+<VeFCER43+<VdLDKTE+Ch%R)+F,RK$4R>;67tDb
-o!.nAncKN+Dl%-BkD'jA0>u-AKZ/-Eag.>A8Z4)ARTUhBIP'GD]ib3F*2M7%15is/g,7L@<<W#
DL!@BF_kk:F(Jd#@q[!$BleB;+E2@>E+O'+Gp%$EASrW4D]iq?ChsOf:-pQUFCAWpATKIH<+oue
+D,>4ATJu9BOr<,@;]j'ATDg0EZcqVFD,5.@rGmh%15is/g,@VF_kS2BOQ'q+D,%rCh7-"Df-\9
FD,6++CT;'F_t]-F<GO2FED)7DK@?OAM.UJ+>Y,q+CoA++=CW:D^QY:$;No?+EqOABHV22+EM[>
FCfM9GAhV?A0>PoG%De.@;0OhA0;<g:-pQU+?(E/E,m'V0JG@,0f1pF1cdBH%13OO%15is/j)9F
1+=>UEaa$&3ZrW[ASrW!FED)2E-,f3B-;;7+ED%+BleB-EZed5E,oM48g#uD0Jj4G:-pQUA8,Oq
Bl@ltEd98[+B3#cEb-A-F!+m6F)Po,+C]&&@<-W9Bl7F!D/`p*BjtdmBlnV0$;No?+D>>,AKWQI
A8,OqBl@ltEbT*++CfG'@<?'k+C]U=8g#uD0Jjn_D]iq9F<GX<Dg)Wt:-pQUFD,B0+D#S6DfQsP
+DG_(Bk(RnATJu3AS#BpAoD]4D/XH++EDC0F`VXIATDg0EX`@N67sC&Ea`p+Bl7Q+Bl5&%+D,2/
+EDCCFD5W(F"Rn/:-pQU1-$IO@<*JG0JG@,0f1pF2EEWL%13OO+<VeIAS5Nr-YddACF;1k@ldk0
@<,mm@ruF'DIIR"ATM*oATVctBl70j@<-6sFDYH#DC5l#_R!ckD..-r+D#S6DfRl]C0u!m@:TfS
_Qt@-+D,Y*AN_Xg+<VeA?ZK^dA0>PIAdo(V$;No?4[(8L.3N5:GWHshBOr<$Anc'mF!,X;Eaj)4
@<,p%DJs_A@ps1iARlp*BQA$6B4rDrD@HqJ67sBhA9MO)F(HIT3ZrNb@;p0sA0>T(FCfK)@:Njk
@;]Tu@;Ka&FDl+@Ch7d$C`m5+Eb,[e:-pQU8l%htGAhM4F!+n3AKYDtF)N1CEa`p+ARmD9+B3#g
F!,%7Ec5t@GA1l0+EMX=Cht54@q0Y%%15is/g+bEEZf(6@rH4'@<?3mCh4_uBl7@"Gp$^5Ch7Z1
@Wcc8BlbD7Dg*=CEc5o.Ebp"DFE1f/E+NQ4%13OO%15is/j)9F1FXGjEc5i.3Zoh]Ble5B+CoD%
F!,@=F<GOCDfB9.Cj@.6Ble60@<iu<DJ<U!A7Zlo@<>q"H#R>9%15is/g)tn6#^ie1,(C>+>GZ5
1G_'K0b"I!$6UH6+E_3X3ZrQ++=D8EBlbD2F!,UCBk)'lAL@oo+<Vd9$6UH6A79RgFEqh:+E_3(
$?^6#@rGmh%144#+:SZ#+<YWGF<DrRA1%fn_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h,dZ_h>p\_h>nA%19tY0uC7O+EqaEA12LJ+E2IF+DG^9/O%%XC3=E0_Qs[Y
_goXX_h#^Y_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h#^Y_h>p\_h>pq%144#
+D#S%F(HIAF^uj/$8Dts+<Ve>ATT%BF^uj/$H&=MKYrDZKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYkJ5$Gs,(_Qts>GAhM4.!$g[A7]@eDIm@qZOI8ZJA[&XJ]!/YKYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10KG+<Yf;%172jBlbD2F!,UCBk)'lAISth+<Y3'FCB9:E+L/7
A.8lgDJ<U!A7Z2W+<Vd9$6UH6A8-+(+=D;B-Ql/N/g,4KDfol,+Co2-E,8s.+EV:.+@/pn8P(%J
ATDj+Df-\0Des6.GA1r-+A*bdDf0`0DKKT2DK?6o_j\Jr_h,dZ_h>p\_h>p\_h>p\_h>p\_h>p\
_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>p\_h>nA%19tY0Z(.>8l%htATDg0E]P=R
AS,XoBln'-DBNP"Bl%p4A\tb_$H%D3KYrAYKYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\
KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\KYrJ\R10K4$;No?4[(8M.3N5:GWHskDfTW7+DG^9CghEs
EZfO:EcYr5DK?q=Afs\g/Kf.HF*&O7@<6!&A8-+(<GlM\De*E50JO"D%13OO%15is/j)9F1asPY
EcQ)=3ZrNXATD?)BlbD*+Dbt6B-;8;@;]UiDJ()2Ec5E'ASiQ6Bln#2-uNI1ARf.jF"&5GDBO%7
@<;qc:-pQU+Co%nCgh?qA0>r'DfB9/+CT;%+Du+>+CT)1@<lo:Eb0?8Ec,H!+Cf>1Eb/a&Cj@-4
$4R>;67tDb-o<@qAncKN+:SYe$4R=O$;No?4?Y)M.3N2BEc5tZ+=M)8CLnq;G@>P8AmoCiBl7Q+
FDi:7ASu("@<?''B6%p5E-!.GBOu'(FD,5.A7]^kDId<rF:ARP67sBsBleA=ASlC.Bk:ftFD,5.
B6%p5E$/t2F*'#W+:SYe$6UI0A0<7BFD5Q4-QlV91E^UH+=ANG$4R=b+>P'H1*CFBCLnV9GAhM4
AoD^,@<?4%DC5l#%15is/j2BH2(9Y[Bm;Z]@q]:gB4YTr-uEC.AS6'5+EVNEBOPdhCh4`2BPDN1
@psFi/e&-s$4R>;67tA`-oNLsASlC.Gp$a?Dfp#?+CT;%+Du+>+CfG'@<?'k+C]U=Ecl8;Bl7Q+
A9Da.F(96)E--.D@V'%XF`V+:B6%r6-Z3@0ALBPe-OgDX67sBm@;0P!+E)-?@;[3%DK]H)Bk/?(
@;TR.+:SYe$;No?4[(8P.3N5:GWHrqB6.ouCLqK7+Dl%-BkD'jA0>u4+ED%1Dg#\7@;^?5ASlC.
Bk;?.Ao_g,+DtV)ASc(%F<G%(AoD^$%15is/g+YEART[pDJ())Ec6)>F!+n/A0>r9Blmp-%13OO
%15is/j)9F2^ok\EcQ)=3ZohcDe*9hALSa9D/aN6E+O'+Gp$X3F)Yr(H#k*LBl7R"AKYl!D.Oi"
BOPpi@ru:&+Dbb5F<G"4B6A'&DKKq/$;No?+>Pr":2b:u1,(C@+>GQ20f_9O2%9m%$4R=b+<YE;
A79+^+=C]@FCB8=+<XEG/g+YHFE8RB@;TQb$K@;/ifnuQPcWl/JDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifoN6$K@;%1#eFLifoD]P^qbXJDufDifnuQPcWl/JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXXQ#IpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP`XmhJdi(HP_(%;P_.nZJkf`kA`Ar+6t(1K+@^'cF*&ODF`cW-Jja$mF!,(8
Df$UdBl\9:+E2IFifo$_@<?''9OW!a+E2IFifo$_@<lo:Ao_g,+A?3bF<GOFFQ/O:ifo$($K@;%
+QAW;ifotmP^qbXJDufDifnuQPe?"?JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQPbd<'Jdi(HP_(%;P_.nZ
Jn,uH+QAW;1,(C@0KCjB/i4[n+<][.Ji>\4+<VdL+<VdL+<VdL+<VdLifo$M0JGF>3AE6@1a!n`
ifo$R3?TFe+<VdL+<VdL+<VdL+QAW;ifo$($K@;%+QAW;ifo\eP^qbXJDufDifnuQPdKG7JDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbX[,R=#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQPaLHpJdi(HPa(0lJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXQjjBF+<V+#%1445+<YE;A79+^+=CW>FCB94-OgFBP`4UdJDufpifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXO:;QVP_(XLP_.nZN8g(PifnuQ
P^qbXJDufpifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXXQ#IpifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifpP(P^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufTifo$($K@;%+QAW;ifo$i@;TT8P_);3FCcRa
Bl\9:+E2IFifo$_@<lo:Ao_g,+@^'cF*&ODF`cW-Jja$hAKXZTF*&ODF`cW-Jja$mF!,(8Df$Uj
@<6N5E-69^P_.nZJdi(HP_(%;P_.nZSDoc`ifnuQP^qbXJDug+ifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifnuQP^qbXJDufDifnuQP^qbX]],0+ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufDifq+8P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX
JDufhifo$($K@;%+QAW;ifo%(+<VfdP_(YE0K1[G0ek:;0d%S]ifo$R3?TFe+<VdL+<VdL+<VdL
+<][.Jhf#62_[6H0eP:;+<][.Ji>\4+<VdL+<VdL+<VdL+<VfdP_.nZJdi(HP_(%;P_.nZPi@pX
ifnuQP^qbXJDug#ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbX[,R=#
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifph0P^qbXJDufDifnuQP^qbXJDufD
ifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDuf\ifo$($K@;7ifnuQPdKG7JDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifnuQ
P^qbXJDufDifnuQP^qbXJDufDifnuQP^qbXJDufDifof>$4R>WDe*9hAKX&q-Y.:?@<<W4AR[#0
+AP6U+E)$<AoD]4Ch[s4Et&Hc$8Wf>De*9hAKZCR+>Y-NDJUFC-OgCl$4R>;67tA`-o`XuATDg0
E]P=ZDdd0jDJ((a:IH=9F_u(?F(96)E--.DAmoCiF!,[?ASrW2ATMs3EbTE(+CoV3E$043EbTK7
Et&IO67sC)Bln#2DIn#7FD5T'F*(i-E-!-R+Du+>+Cf(r@r#drB-:f)EZf:>ASrW$Bk)7!Df0!(
Bk;?.@<<W5Df'&.E,TH.F:ARP67sB72'>\)F<E=m0f:(-3BAlL3\iE!$4R=r+Z_;"4==W"05>E9
05>E9E,p,4F_u)=05Y9>/no'A-OgCl$6UrR/hS8bD/"*6ARlp*AU&;>/hSb/%13OO.kN8'/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%17J:Hm)*X6m-&]Ec5tZ+Du*?A8,OqBl@ltEbT*+
+E)41DL;m#.kN8'/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P)%14U;.kN>)/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hn]pk8l%htATDg0E]P=\D]iS)@ruF'DIIR"ATJu4E+Np7
%14U;.kN>)/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/Lq8;Hu*A3B67f0ATDg0E]P=RD[d&$
+<Ve>4YB,o;GKqb?XI>^>@BZI+<VdL6r$$B7:0D4D[d$_$;No?4[(8R.3N5:GWHsbDg*=6BOt[h
Bl7Q+AoD]4DfB9*+Co1rFD5Z2@<-'nF!,17+E2IF@;Kb%Et&IO67sB72'>\)F<E=m0f:(.1cd?N
3\i])$4R>;67tA`-oi_!ATDg0E]P<kB5DKqF"&5GDI[U*Eb/a&Cj@.8Cggst+EMI<AKYf-@ps0r
@<6L(B5VQtDKKqBFDi:EDK0f;FCetl$;No?+DG_(Bl[cpF<G44Ddm-kF!+n4+CQC0Bm=3"+CT>4
BkM=#ASuTB+<X-lEZeq<@;Tt"ANCqC$;No?+>>eu:LeJh1,(F?+>GW42)I?N0b"I!$;No?+EV:.
Eb-A%Eb-A2D]in2G\(D.@<6L(B5VQtDKKqB%16rdG\(DWDIdI%ARfgJF)u&.DFJSdDfS!%1a"h%
0F\@;9kAE[De).SB6A'&DKKqK4Y@j2%14LqF`(\<4ZX]i+=eQg+=\L>%14Nn$4R>;67sBpD/aN6
E+O'+Gp%-=FEMVAF!,=6G\(D.@<6L(B5VQtDKKq/$>40n@WNY>D/"6+A4^ZLBl[cpF?sthBkM<P
EcQ)=-OgCl$;No?4[(8S.3N5:GWHsaBm=3"+DG_(Bl[cpF<G"5F(o9)D.RU,+D#S6DfQt4Bm=3"
+:SZQ67sB81*B;"Gp"jr0fL401HI?K3]/i*$4R=O$;No?4?Y)I0I\,UEcQ)=3Zr6QDIjr,Bl.R+
+D#e-AS#C`A0>],@:X(iB-;,/A0=K?6m-#_D/^UG@Uj+$%15is/g)i)+AH9b+>PW+1E\D+3]/`T
1H>mO:-pQB$;No?+@U0\Bl7KC+DNnh1bLL9C,RnWG'GbqA79M&Bl4@e:-pQU6?R!YA3(iCDf'?&
EarflCbIOt1,CL91+b7?<&$6k1,_0I2_SZW@;]^00f1I9/MJhV9LVB>4Y[BQ:-pQU9PIsV@<-WS
+?;&2/i#*i$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5/i5!d$;No?+Acl_FCoH3D)re-@<-R+
DBLho%15is/g*`'F*(i,Ch7WJ+DNnh1a$LMF*(i,C^g_H67sBPDKBo.ChupVFD*]X06M>IEcWmK
DeO#t@;BFp05<C%05<L"1^sde67sBJDf0Z*@rsaSGB\6`C3+<*FE_/6AM.J2D%-g]$6UH678@2X
<bu2iDfp//0fUjG1,_9V0fM!I+>PVr-V[$(7:/SW6V]!j-W<?16=3;P-T`\M7863X6VAdg-W<?1
6=3DP;cI+!5tscq4"!rn;aOh\8Q&Jd?VWm]741/E7oDiT?V*X54"!C6DKKo-@rs([-W<?16=3GS
<)R((8Pgcr-W<?16=3VZ6UY9L<$saT79DoF?V*X54"!I!6UY9[85E,_?W9Hr<$saT9gqKE?U[FR
?URj@4"!`k78.&W9M%`]<*<$d-T`\M77BmW9g_lX?W'ft-T`\M6W?rj6q($A-T`\A<)Zq,8OOpf
-UC^1=^OQc;aVoo-W4MpDfTqeDe*EHEb/[$AOKsKALBPe;IsfcEcaZeA7\GCF*(E$A79Rk-T`_1
,VUZ/-S\Uk3(Gh]6Uipl-T`\00JG171cR9I-T`\12)7*L2)$a44"!L3DI[?-4"!a2EbT?8DC7Ln
0JP780JG18-T`\H0f([@-T`_--W;BA4!ua;0/5C=1,(FA+>GW40JGOA0J5%50H`YU-T`\'4"!dA
F<EkjF(o9)ARm/M-S[8/0/>493$9q23\W6K0JG+50JFV89d`"M;Fr5t-Ugcf0IJq078>]o+AtX"
:*=a66[!K_+@:*a-T`\'4!uC;-RUu'-T`_1,VUZ/-T"[W2bQV"6Wl<&-T`\00JG171Gq$F-T`\1
2)I!F0JtR44"!=)Gpb[$6t(+SCaV:l0JP780JG18-T`\H0f([@-T`_--W;BA4!ug;1,gjA0JPO0
0etdD0KLmA/het5+@/^L4"!HS3%$d8;ajM*Eb.9S6#:?[:NU8]EZe:L:`r2MASuU2+=KrM+E).6
Gpt+&-T!J20/>493$9q23\W6K0JG+50JFV89d`"M6V&Rd-Ugug0IJq078trp+>"^*Ec5e;<-!+m
+@9meALBPe-T`\'4!uC;-RUu(0I/>$4!upc6o7D32agY"2CCR60JG170ekL>2CCR60f:dF1c%!D
-T`\AA9fOa-V.ZfFD5;64!u^:0JG170JOq:-V,sJ2)$C>-nH`E-Rh,)1G:LB0/>493$9q23\W6K
0JG+50JFV89d`"M75[%P4"!rq:`sdi3Zp_)C`lMqBOu3,;ajM*7<W6[FE8QQ9gKn?DJXSI-T`\4
0/5+80JPO00etdD0KLmA/het5+@/^L4"!Bd-T`\E<%p!R4"!Hr0JFV$+@^BiD'2euF_)[^Cis;:
4!uC;-RUu'-T`\'4")d.0I](20i^.j5t3\382i:O4!u^90JG4<2)d3:4!ua?2D?gA/hSac$@HZ(
D/")7ATDg0E\&>EG\(B-FD5W*+Dl%7@:UK7+Z_;3%17Jk+EMgLFCf;3Ch[a#F<Gd9F!,%=@qB4^
ARl5WHlsOS+<VdL0HiJ20g'2i@<?01IS*C(:f:=^<D?:g04JF*/no'A-OgE1>:h`j>p(eCF(KB5
05>E=DIR$iATBG=De(M9De*g-G%>`4E-![A@qdQ0C3'gk%15is/j)9F0ek+"ATDg0E]P=OD.73l
Dfp+DDfp/@F`\a<DfQt;@;BEs-Zj$9F)GE'AL@oo:-pQU1,U1?E,m'V0JYF,0f;!K3BAiQ%15is
/e&._67sBLDJ*[$ANCrK3A*0A0J-aFFC?mWC,RnWG'GbqGA1r*Dg-73$;No?+@:3bCh,RL@rH4$
ATD9p@;ISP0JYF90Jk@:1/otc3\`QS0etClCgh3o/MT+70J,4:;bTVK7QiI8$;No?+A?KYEaa!6
3ZpF82(gTm$;No?+Am5'8OQ!.+>PQ'/i,.=/i#%9-oN\5/i5!d$;No?+Acl_FCoH3D)re@Bl5%O
1^sde67sBPDKBo.Ci!['3Zr/t/i=bcDKBo.ChsOf:-pQU8T&Tk@;KaV@<?0D+CdGcC,Rn%3A*/u
$;No?+@C'bFCA[$3ZrWjG:mWODe=*8@<,p3@rH2n$4R>Z@;BEs-Zj$9F)GE'ALATq67sBkDe4!-
-ZgJ>E,]AsEZfIB+CoC5@;^@4BPD?s+:SZQ67sBpF=2,PDJsV>@r,^bEZfR>ATD?)FD,5.Dfp/@
F`]/WBkAJrDL!cUB5_@&/e&-s$4R=O$;No?+F@[;A1__3/T5*>ATDs*A1_A5Ec5u>I16N[:K(5"
C2[X!Blmp,@<?'90a^ZB/l5>B<*sBYA8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?+=Jfo.6T^!$?L'&
F`_SFF<F.E5sn((3Zoh)+?CW!.1/g:/g)QWDe*ZuFCfK$FCcmDBl8$(Eb8`iAKZ28Eb$S>.68S,
0JYI=0ekV%0ekFA1GfG667sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O]:-pQU<(KSZ
:dIiE:I?6I+<VdL:-pQUAp%p++E1b,A8bs#E+*j%+>"^YF(HIBE+*WpDdt4=BkAK+DBO"6ASc0*
E+*j%$;No?+D,P4D/!Tj@qBanGT\+O+AP6U+D,P4D..O-+D?%>ATDU$DJNfo+CT.u+D>J%BP_Bq
BQRfr+DG_8ATDBk@q?d,DfTB0$;No?+D5_6Ch[u6+<VdL+<VdL+AP6U+DkP&AKYetFCf\>AoD]4
B6%p5E$-QS.1/g:/g+k?@:NkiARfgrDf-[?+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9
F*)G:DJ';O67sBpAn)r++<VdL+<VdL+<Ve%67sBmDfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=
$;No?+EM+9C2[X!Blmp,@<?''+AP6U+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE
+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh3rK67sC'GAL]0AU%g-GAhM4F!)T#67sC'DKg,0E,]B!
+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gp`qo67sC)DfTB)
BlkI?+<VdL+<Ve%67sBt@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLa$7Q;h@rGk"EcP`/F<Dr?
@<6!-$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OL2/1E\_$0I\+l-OOs9GqKG!67sC'F(HJ&DL!@D
@;]Uo@j#i(F<G:8+EV:.+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAI<-`/g,@LG[FloDe*2t
4=<s'77K^D;FNuM5u'gD6XOPBDe*3&+CoCC+:956<(KSZ:dIiE:IAJtC2[X!Blmp,@<?'f4ZX]^
;FO&D;GoqO:dIiE:IAK'C2[Wi$>"$pAM+<4+EMC<F`_SFF<Dr-;FO&D;GoqO:dIiE:IAK'C2[Wi
+Du+>+EM+9-OOF&A1e4'AhG2V/h]I<-ZEL3A8bs*-:KO9+E1b,G%G\W/g*50HQYF4/mg@VFDPP3
.!''5Cht4n84c`V5u'gD6XO8:De*ZuFCfK$FCef1-QjumG%G]8Bl@l:.3L2p+@B$LA8a(-+<Y`B
Dfp/@F`\`RF`V87B-;;0BlbD9@;]Uo@lb_[/6#/3;c#bT6r-0W@;9^kCh\!&Eaa'$?O@nuF)>i<
FDuAE+=Bo[<(/hj@:X+qF*&OD@;]Uo@j#`!FD)e2AftT+EcP`/F<Ga<EcYr5DBL>T/9#$8G%G\F
-Rg0PF!,@=F<Eb1+>PQ0/hnt5-OLt=F)>i<FDuAE+=Cl@+E_R9GT_'@ASc1(+EVXL+EM+&Earcs
DJ()9Bln#L+EqL1Eb-A4@;]Uo@j_UpDIb@,@psIhBJ'W7+EMC<F`_SFF<Dr";Gp:g3ZrBMDIdZq
+Du+>+EM+9+>"^EA867.F<FOR8Q/GO:..lF?X[\fA8Gt%ATD4$AR?elASu$2$7Q<]:IIuc8l%iC
:IAK+A26(Q$6`VgDe*Bs@j#l3A8`T,BleB%-u*[2B6%F"BPCst06D,CDdR6tA1hh=B.4s28l%iC
:IAM4<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%iC:IAMB%16'J
AKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;AKYf'An?'uD.Oi.AftM)FCB6+%16N]
A0>_tGp$O7E+NHu+DG^9DffZ(EZe=W6r+qABleB;/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa
?Xdh0A8O&>2/mCjDIIg"CbRk]@PrISH?W^[?m%gTDKBN&ATAo6AThd!GA1r-+DkP)F^])/FCf]=
+EqOABHVJ,EbTH7F!,RCDesJ;Ch[Zr+@gH\D/E^%CjA)bBlk_D+Du+>%144#+E)4@Bl.9p+D,P4
+A?3CAQU'bDe*E%@Wcc88LJ[m+D,P7DIal"@<6"$+EqL1Eb-A-F<G:7E,ol?ATJu5F`(]2F^]B+
Df.0:$6UH6<+ohcFEqhD+DPV(@:UKuAThX*+D#G$F"Rn/%14jC+CI<=ASQO-E+^q@G%,&lG@P]3
@WaDB0JkaJG$dF@+@C'bF(o/rEZf(5E,ol?Bl7Q+AoDR/+EqC2B4uC.+DG^9E,oZ1FCeu*A8bt#
D.RU,F"SS7BOr;uDf0Y>F`V,)%144#+D,P4+EMIDEarZ'@rGmh+Cf>4Ch+YtAKYD(Ch\!5Ch4_u
DerrqEZcqVATMg%@qf@fCj@.FBOr;rDes?4ARlp*AU&<</e&-s$8X:W?p%e,H"_5=E]7uIBJ_Jc
C2>hMF*K]ZEbAi@?Tqj?87?OUDf098AKYK$A7ZlnDes?4F!+n/A0>K&DKKqB@:O=rF)rI3Cia]7
BleB1DJ+#u+CT.u+CK.sDIdZq?m'N9DKK<3+Cf>+DfTQ0B.aW#+<VdoF`MM6DKK]?+EV:.F(HJ5
@:O(]B4Z-,F`V+:A8,XfATD@"F<G16DKKqB@;]Tu@rH1%EcWiB$4R>!/g+Oa?T)pY3GgcoEG0YR
D.,@\FEDbPBQ@s!BQ7BC?m&?YG%kN3+D>\;+EVNEAp%p+Gp$[8@V''m@;Ka&Eb/ioEb0,uARloq
Df0Z<+DG^9E,oZ1F<FCJ7WU0k$4R>M>@h\_/TboADd?`[$<0eh:L?^i6sjeA1,fXL+^8]"A0>u4
A8`T,BleB%.!0B<DdR6tA1hh=B.4s28l%i_+B2-):CRXo4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%13OO:h=NTBl7Q+@;]Tu@rH7+Bk1dqARlonBOPdkATJu+DfQt.8l%i_
+CT.u+DGq=+EM[7@r,RpF(KDF%16'JAKYGjF(HIM2BYLi8OO\:AU,D4F!,OG@:F%a+E)F7EZfI;
AKYf'An?'uD.Oi.AftM)FCB6+/e&.SEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7Ed8dGAfu2/BlbD/
Bl%?'FDi:BAThd!G9CC/@;]^hF"Rn/6#:U\/0JtE@:UKb?ta7qFDl2F/o>-,>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De(M7BleB7Ed99SA17rpFDi:CAS!!.
BOQ!*.Uch/F^]*&Gp$a<F<G:7E,9*&ASuU$A1B2S:i'QXF!,"3+Du+>+Dtb#ATMp$EbT?8+DkP/
ATDKnCh\3,/e&-s$=I(IAS5^p/TboADd?`[$4R=s/g+Oa?TD[VASbj62/m_N0JmZc12UfN0f3ii
EbSlE?m%gTDKBN&ATAo%A7TClB-:V*DIn#7?uKR`+E)4@Bl@l3FD,*)+E)41DK?qBBOr;tDKKT5
AKYr#FD)e8Afu&8F<G+.@ruF'DIIR"ATKCFAM.UJ/.Dq/+<Z,^IXV_5+<Ve%67sC!E+No0ASuU(
Eb-A4@<?/l$6UH62BZpK+=CT.DIb+($6UH6IXZ`p%13OO1+j\W4C:''A2%nDA9]hG11tMb2g.$&
0Q_S#AnuWu5%#L#Df0W1A7]d(@:Wn_DJ()#+D,P4D..O#DJ()1E-,f4DBO%>+CK%pCLplrFD,*)
+D58'ATD4$ATJ:f+<Ve;Bl[cpF<G+*Anc-sFD5Z2+D,P4D0$hDBOu'(D..3oDJ()5@rc:&FE9&W
<+ohcA8-'q@rri(AS,XoBln'-DBNP0Ebu6m+<Ve@F!,=<Eb-A)Ch76fDKI"0DIal'@<3Q5BOr<(
Bk(]sAn>CmF`M%9De:+9A7]b'Dff]2B-JI>Bl7R"AKYf'DIjr%G]7J5@qg%+/0JLVB.aW#+<VeU
IXZ_T$6UH6:-pQUEHQ2AARlp)FCB&t@<,m$AU&01Bk(k!%144#+EDOHA7]763Zp4$3ZoeU?mncM
9MA/H;G/3@.6oL6-nJ7p<_cXg9IV;?3[m``0H`J>/mg@\/j:C?4"akq+F,=D$6UH6:-pQUA7Qfp
DfT\($6UH6EcZD7ARf7]4ZX^4HQZU%-r*c99MIfN9-R^l5V=H5/5fDI:/st].4-W-.82cV+?V_<
?SWr\4s2sL/mg@VGp%N`%144#+F\cgILQW,+<XWsAKYK$DK]T3F(oQ1+D,Y4D'3nA@;]UaEb$;(
G]7J5G\M7BFDi:4A0>T-+EMXF@;0@fFCoH3G@>N&+CT=6Ci=3(%144#+CT=6FD,5.A7]@eDJ=3,
Df-\.De3u4DJsV>F`V+:@;^?5De:+a-Z^DNATMF'G%G2,@<-"'D.RU,+DtV)ATKC3$6UH6@!*T8
+Di6=?nNQE5p0ZN@;]^h+Dbb-AKZ).BlbD@Dfol,+CT)-D]ib2E+*6u+CJr&A8Gt%ATD4$ARHWi
F`\'"+<VeFG%G]&Cht5<Dfol,+DkP&AKXSf@rGmh+Dtn'ATAo8D]ik7DegJ0F=n"0%14mD+CI<=
1Lb>aFuahhF>IoZ1NYN1H>-l*BehV[G$dF@+AQKl+Du==ATDKp+Cno&@<?d6ATJu&DIaku+Cf>-
G%G]8Bl@l3F`_>6BlnVC?t1fs+CT;%+C\nrDJ'Cc+<Ve8A7T7^+DG^98g$,H2BXD'0JYJ"@;[bS
.3NhG+Du+A+D>2,AISth+<Y&FBl8$(B4Z*<055<GAS5Rp1,!?ZFCf)rE\oF]Ci<a(Bl7Q=04o$=
@<?4$B/D8RCi<a(Bl7Q<2IIYOBOu'mG%G\:FD,6+AKYE%AISth+<Y0-@;]^hF!,RC+C]&&@<-W9
Bl8$(Ec,<%F!,1=+DG\3@:OD#+A,Et/g)9.-['&D@;Ksq@:XX+BPDQ2@3B&uDK]T3F(oQ1+E2@4
@qg!uDf-\/EcQ)=/e&.1+<XWsAKZ&*EbSru+CoV3E$/b2Ec#6,+E_aJ@;Kb*+EqaECNCV2DeX*%
+D,P4G@>N&+C]J8+A!\aD'3>,DI[6uDIm?$@:F.tF<G(6ART[pDJ'Cc+<Ve;F_u(?F(96)E--.D
FD,*)+EqO9C`mV6F<GC<@:UKpDBNk6A7]d(8g&:gEcYr5DK@EQ=(uJe+D>2,AKZ)5+Co&,Bldi.
F)Po,+EM%+ASkuf$6UH6FDi:3DfB8?%13OO1bKnY4C:$nBJVS_3GWGG20WhHE,%3`@X<*8DJ_@?
5%#L#Df0W1A7]d(@:Wn_DJ()#+D>2)BHV5&C1Ums+D,%lBl%L*Gp%3B@<<W9Bl%T.F*)>@AKYD(
;b02+1,Us4BOPsq+EqL1DBNn@FED57B+51j+<YT3C1UmsF"SS,+CT+0FD,B+CM@[!+CT/+FD,6+
+E)4@Bl@l3@rGmh+CHo_?m'Q)@<<W9Dfol,+Dk[uDBO"BDfTD3@3B5lF(c\7D@Hpq+<Y'2F`_"6
DfQtBATMr9@3B5lF(c\7DBN>"ATV;h$6UH6IXZ`p%144#+<XEG/g,@VEb$;,F!,FEF<G"0A0>;'
BOPsq+DGm>F*)>@ARlotDBN@1Eb0<'Ecu#)+EM@;F=n"0+<VdL0H`)/+E2IF+=DAOEb$O,$6UH6
+AP6U+D>2)BHV#1+Cf>,E+*cuA0>u4+Eh10F_)\9ATVs,AThWq+>"^IEcQ)=+DGF1D..NrBHUnq
Bl%iC%144#+<W?\0fL4fATT%BGAhM4-OgD*+<Z,^IXV_5%14sF+CI<=@W-@*1NYBqA9<#SBlmoE
CMS3@BeV7uG$dF@+A+#&+D,>(AKZ/-Eaj)4D..]4BOPdk+EqL1DBN@t@qB_&Bl7Q+GA1r*Dg-7F
Anc'mF!,C=+CoM,G%G_;@:NeYF)to'+C]U*$6UH6<_uO6@rH7&ARfgrDf0V=GA(Q*+BD<6+DGm>
De<T6+B3#cEb-V>+Du+>+Dl72BHToC6m,uJDBNJ.+D,P4+DkP+E+NQ&-u<I:FCfJ?ARm5!$6UH6
A9)C-ATJu'F`\a6An?4$F*(e4AThX&FEM#.Cj@.DATW'8DK?pS+D,P4+BD<6+EM4)Eb0;7Ch[Zr
3XlE=+<Z,^IXV_5+<VdLAn?4$F*&NP0/%'PF(Aj*0JkG(BOPpmF"_9HA1q\9A1q\ADfTB0/no'4
-OgD*+<Z,^IXV_5+<Ve!:IH=8Dfol,+CoC5@3BQ4Bk(p$AU%p1FCf?"AKYJrARfKuDf-\ABl7I"
GB4mJH#n(=D0$hDBOu'(BlkJ=AS#p*F`)&)E,]B!%144#+EM4)Eb0;7?nX0SDf'&=F(f!&AM7V.
BJ4+EDfTB0/no'4?nNQE<+oue+EqO9C`mV6F<G7.CiCM/DfQt$:ei-M@;p0sA0>E'Bm+'/%144#
+EqL1DBMtV:*=7l+E(k(/e&-s$8sLZ?p%dP0m#BcDe=61H#RnK@:j=sGAhI[3&GSn?Tqj?<+U,m
+CJr&A8Gt%ATD4$ARHX!DBNe)@o$#G@;]TuCh[d0GV1+<G@b2u+DGF1DImBiARmD&$4R>$/g)9E
4C:$+DgGu<EG0<;F_>]8B6&,T2*#>ZEH![?5%#L)D/aN6G%De)DIal$G][M7A0>8P:IJS5Cggdo
+CT.u+DG_7F`M%9FD,62+EDUB+E)-?CghEsEZdssF*VhKASlK@+A?3QF!,.)G%De+BOPdkARlot
DBNt2@qBP"+A*c"ATDj+Df0VK%13OO3%c<r+<Y&S?Xtm%FCo<!0f4/pG&1T/DI[?8E+(V;GAghP
?m%gTDKBN&ATAo%Ci"$6Bl7Q+@"'b:+CT=6@3BMtFD)e9Eb/isGT^pB+DkOs:K&BEDIak`Bl8'<
+EMgLFCf<1/g+,,AKYZ)D.Oi#Bl[cpFDl2F+Cf>-G%GQ5Bl@l3Df-\>BOu6r+EMgLFCf<1+DGm>
Eb0<2ARfgnA0>?,+CJ_oEaUL/$4R>M>@h\_/TboADd?`[$=\-lCh.:!A7TCqFE2))F`_>9DDEqA
67s`sF_PZ&C2[WnBleB:Bju4,Bl@l3F"JsdAp%p++A,Et+Co2-FE2))F`_>9DBND2Bl%<4%13OO
:-pQU@rc-hFCcS:ASlC)Eaa!6+EqaECM@[!+Dbt+@;KKa$=e!aF`MM6DKI!K@UX=h-OgDmDe!Tl
F)rIGD/a<0@p_Mf6#(=K@WcC$A2uY1?TgFm-UC$aC2[WlF_PZ&3B9)I+BosuDe3rtF(HIV-UC$a
C2[WlF_PZ&3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?+ED%'DfTA2DfB9*+Co1rFD5Z2@<-'n
F!+n/A0>f0ASrV_:IH=9Bk)7!Df0!(Bk;>p$?'j$4ZX^6/g+\=A0<Q8$?'Gt4$"a(De*BiFs(O<
A0?#:Bl%i<+BosE+E(d<-OgCl$;No?+D58-+A,Et+C]J-Ch+Z2FD5Q*FD5<-+CT.u+Eh=:F(oQ1
+EVX4@r#drB-;)1F`)70$?U-(Ci<f+B4Z0-I4cXTEc<-K@WcC$A86$n-OgCl$;No?+EM+9+Co2-
FE2))F`_>9DBNJ(Eb/a&DfTQ'Et&IkA7TCp4ZX]58l%iC:I@NA;BSS-6rR&N7n#g;;BSS-6q9gJ
6qL9!8l%iR:K::[78m/O7n#g;;BSS-6rR&N7n$6B7RTgG+A,Et;cH%Q779p=6qL9(%16i\A8-'I
3Zr0JA8-',/0H;_8l%iF8Q8)R6UXLD+A,Et5t"+::..ZO+A,Et;aXGS:fKhS;BSS-6q(3W;aa2T
-Qij*-u*:'BlYXc3ZrKTFCKB,Ch.'jEcW?W%13OO:-pQUB4YslEaa'$+Co2-FE2))F`_>9DBO"1
EbTK7Et&J!E+EC!ASQ-oD..<rAn?%*+>=638l%iU9gg+5F_PZ&C2[WmDf'H6ATMp(A0=K?6rR&N
7n#g;;EIKH6q9gJ6qL9<8l%i@6psgG6qL9<8l%iR6W-KP<(';U%15^'6rZrX9N+td6m,r]Bl%<p
De*s.DesK)Df'H6ATMp(A0=K?6rR&N7n#g;;EIKH6q(3W;aa2T4%`::;aXGS:fKhS;@Nt*:IJ5X
6m-VkA79RkC2[WnBleB:Bju4,Bl@l38l%iR<'a#C6qL9<8l%iF8Q8)L;EIKH6psg<6qL8c$;+)^
<_Yt)F`:l"FCf3*A92[3EarZkF_u)=+A,Et;bpCk6UapQ5t=@38Q$!)8l%iU9gg+EASbpdF(K*)
A0=K?6rR&N7n#g;;EIKH6rR&N7n$6B7RTgG4%`::;cH%Q779p=6qL9<8l%iF8Q8)R6UXLD%13OO
:-pQUA7]h(Ec64G@WcC$A0>],@ps1b%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj
5s[eODe*="Bl%<?3B:FU$4R=O$>=-pFDl2FC2[W<2[p+,ASu("@;IT3De'tB+Cf(nDJ*N'BPDO0
DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/hnL.J<M*FAR]\&@<-W9
0eb.$1,(I?+=L!'/Ria/Bl7L&+AHEU+CfP1E+'kXA8-."Df.!5$4R=b.Nfj"+Dtb7+CK+u?m'B,
FD5Z2+E)41DK?qBBOr;tDKKT5AKYr7F<G+.@ruF'DIIR2+E1b2BJ(E,BPDMs$6UH6+DGm>F*1u+
+CQC7Bl.F&@<Q@&B-;)1/Ria/Bl7L&+A!qt+D#D!@<-BsF)to'+D,P4+Du+>+EV:2DJNs(B+51j
+<VeFAftf0+F.O,EcW@3B5]C3$4R=b+<VdL+<VdL2BZpK+=CT.DIb+;:-pQUDfB9*F!+n-C`mY6
+=LZ/DIb1=E+*j%+>"^Q@;BFq+=LZ/DIb1=E-673$6UH6+<VdL+<WQbDe'tP3[\QZF!,O@F_;h>
FD5Q4-Ql/N/g,(OASuQ3@;Ka&Df-[GB5ho@+E1b2BHSlLD..3kF!)lDE-!HNE-67F+<Vd9$6UH6
+<VdL+<YT6E*m<oDe*3<3Zp=-De't5:-pQUA7]@eDIjr(@;]V$+EM47Ecbf6F<G:8+A,Et+DG_8
ATDBk@q?d!De!3lAKW*)$4R=b.Nfj/ATo8=ATMr9@psFiF!+n/A0>Aq@;]^hF!,RC+CJr&A9;C(
FCfK#+EVNED..3k+EV19FE8RADfTD3E,Tc=@:F%a/e&-s$6pc?+>GK'/heD"+@]pOEckf2Gp"sq
+>PW+1a"2;@<6+-+AH?:@<6*o@:Njk7:^+SBl@l<%13OO+=\LA83p0F?n<F.9LV6B?m&lqA0>8`
8Om/2D.-ppD]it;FD5Z2+Cf>#ATJu&A7T7^/e&-s$6Uf@?t=4tATV<&FCArrF!+m6DIn#7DfBf4
Df-\*7ScoL786'H<(0\]5u^B_+EV:*F<G16Ear[%+EV:.+:SZ#+<VeG@<?0*Bl5&8BOr<'@<6O%
EZet.Ch4`'DKKe>FD,5.E-67FA8,OqBl@ltEd8d=G%GP#$6UH6+DGF1FD,5.E-67FA8,OqBl@lt
Ed8dAF!+jg76s=;:/"eu/g+,,AKYhuBl5&9F(HJ4Ado(i+<Ve77ScoL786'H<(0\]5u^B_+DGm>
FDi:BATMF)+EV:.+DG_8ATDZsC`m\*FD,_<Bl5&$;FNl>:JOSd?k!Gc+<Ve;Bk)7!Df0!(Bk;?.
FD,*)+D>2,AKYGnASrW-Dg#]&/g*GlFCfJ8AoD^"Bl7Q+E+*j%F!(o!+<VdLFD,5.A8,OqBl@lt
Ed8dEF`VXI@V$ZlCi=B+A0>;uA0>o(DfB9*ARmD&$6Tcb+=\KV;e]cR@psC#Anc'mF!,C5+B(fs
/M]1A+D>2)BOu6-@<,p%DJs_AGB.D>FCf>4A9Dp,DJ(($$6UH6+C\bhCNXS=?uTOaCLgfqDfB9.
@<?4%DK@EQ+@^9i+C\bhCNXS=1bp1qBOr;uBl%?'BlbD)1brfZ@<6*nF"VQZFC5Ob%144-+<Wrm
DIn#7?t+"i?m'B,FD5Z2+D>2)+C\nnDBNY1E,9*&ASuU$A0>u4+Cf(r@r!2r@:O(qE$/b,Ch7Ys
$6UH6+CSnkBl8!6+EV:.+D>2)BOu6-F*)>@ARlotDBO%7AKZ&.A7]7ZEZet.Ch54.$4R=b+<VdL
+<VdL0fL4aDJUFC/ghba:-pQU0fL4<+@nds8.>n8$6Uf@+CK5$F*(r#+Du+A+ED%7FDl22F!,F1
Ecc#*F_kK,+C\bhCNXT;+DG_7FCelk+E(j7C3=T>+:SZ#+<VeKBOr<&@<6N5@UWb^F`8rU6#:U\
/0JD1@r$4++D,>(ATJu&Eb-A'BOt[hARlolB45LlF*%iu+<VdLFD,5.BOPsqATJu.DBO%7AKYK$
EcP`4E,TW)Bl7Q+F(o/r@psC#Anc'm+CT.u+EV:.+:SZ#+<Ve9@:O(qE$/k9+CS_tEcbl'+DGF1
@;^?5BOPsqATJu)D]iq9F<GF/FCSu:%144#+:SZ#+<VdL+<VdLEb0<6A0<71DIIBn-QjNS+<XEG
/g,1GF*)>@AKYetF*&O6@:O(qE"*-s+<VdL+<VdLEb0<6A0<71DIIBn-Ta%;+<XEG/g,1GF*)>@
AKYGj@r$4++>GS[$6UH6+<VdL+<Y]9F*(q8-Y.+'D.P(V0eje*2]s5<67sC$ATMs3Eb-A-B5VX.
Bl7Q+@UWb^F`8I:@<6*nEt&I!+<VdL+<Vd9$4R=e,9n<c/hen52'>2(EbT>41b9b)0JYF,-rY)*
Bl7Q+8T&'Q@ruR!DKKqB7:^+SBl@l<%13OO+=\LADIn$&?m'?*G9D!9CLqQ0?t=4tATT%B;FOPN
8PVQA741/O?m&lqA0>8jE-#T4+=BHR6V0j/2((I??m&m!+Co%q@<HC.Et&I!+<VeNBOu'(@rc-h
FD5W*+Dtb7+Co1rFD5Z2@<-'nF"Rn/%144-+<WrmDIn#7E+*cqD.Rg#EZea\5uU<B<D?:t+D>2)
+C\nnDBN@uA7]9oFDi:0C2[X%@<-4+/no'A?nNR$BOr;sAS,@nCig*n+<VdLBlbCO/0K%WEc*"<
AnE00Bln#20J4JLBOu'(0d'mI;b02+1,Us4BOPsq+DGm>E,oN%Bm=3"+EVNEFD,5.F*(i2F<GL6
+CoV3E"*-s+<VeJ@rc:&FE9&W<+ohcAoDL%Dg,o5B-;;-F*)IGAoD]4A9Da.+EM%5BlJ/:Bl8$(
B6%^.GrcBA%144#+<VdL+<Ve:BPV9iF(f*$E*m$gDe*2t-[oK7A8c@,05"j6ATD3q05>E9F)Q2A
@q@<.De*BiFtRKDF!hD(%144-+<WrmDIn#7D.-ppD]j%B@;KXiBk;<-?qF0t:-r>2@rGmh+D>2)
+C\nnDBN@uA7]9oAoD]48p,)uFCfJ8DJsW.@W-1#F"SS1DffQ"Df9D6Anc'mEt&I!+<Ve:@;[2s
AKZ&9DfTE"+CT=68l%htD.-ppDf[%FBln#L%144#+<VdL+<V+#+<VdL+<VdL+AP6U+ED%%A0>c.
FCep"DegJ(DIal2FDl22%144#+<VdL+<Ve@E-Z>14ZX^.FCmKTEb/Zi+=D&FFCep"Degt>E-Z>1
-OgD*+<VdL+<VdL1a$a[F<DrKDffQ"Df9DuBlJ?8@OF6/:g$O[?X[\fA7%E4E-Z>1%13OO+=\KV
<+ohcE-67FA8,OqBl@ltEd8dH@<?0*BlbD7Dg*=<DBO%7AKYYt@:Wqi+Cf>,D.RU,F!,C5+A,Et
%144#+<Y3;D/aPK+@^9i+D#e+D/a<&+EV:.+CJr&A7T7p?m&uo@ruF'DIIR2+D>2)+CQC3@<?0D
%143e$6UH6+<VdL+<Wa,-YdR1A7]p,C2[W*F`_>6F!hD(%144#+<XWsBlbD9@<?0*G@>P8DJsV>
E,oN5BlA-8Cj@.EBQ&*4/g(T1%144-+<Wrm@Wc<+Bl8$5De+!#ARlotDBO+6EcYr5DBL>^/hen5
1FXG[@<3Q#AS#a%@rHC.ARfgnA1euj+Co%q@<HC.%144#+<YN4F)tc&AKZ2*F!,17@rHC.ARfgu
Gp%0>F<GC2@:X(iB-;;7+CHlG2E!H9E-67F-RX+VEb$OF?m'&iBl%p4ATJtB;b9JM.4u&:+<VdL
+<Vd9$4R=e,9n<c/hen51a#8!@WHU"Ed8c_3%Q1-0JYF,-rY)1+@9LQCi=60+@TgTFD5Z2.1HUn
$6Uf@8g$,H0JjnmAStpnARlp*D]hXp3A*-2@;]TuFD,5.CghU-F`\aEAfs)W3\`H6G@>P8@q]:g
B4YTrFD,B0%144#+ED%5F_Pl-A0>;'@q]:gB4W3-D]iG&G&C\1GA(]#BHUf'D/aW>ATJu&+D,G.
@<?4$B-;A/EcYr5DBNh>D.7's/e&-s$6Uf@?pmgb8PMcU?m'Z%F!+q7D/a&s+E_WGFDi9[1bKnB
AfuA;FWbR5ARlp#DfTD3FD,*#+>u&!A8,OqBl@ltEbT*+%144#+E)-?H#IhG+A,Et+E1b2BHVS=
FWb+5AKYN%Bl7Q+F)Po,FD,B+B-;D=Df022+:SYe$6Uf@?uU71B6.H'@:X+qF*(u(+EVNE@q]F`
CER)#DIIR2+Cf>,E+*j&@VKXmFEnu\+Dkh6F(Jl)FD,B0+DG^9E,oZ2EZfO:EcYr5DCuA*%13OO
,9nEU0eP.41,C%F@;^3rEd8c_2Cot+0JYF,-q@idA7]d(7Vm3]A0=<OBln'-DCH#%%144-+A*b:
/hf+0F!,UHAKYo'+Bq?1:gGJ_FEDJC3\N.!D/a<*@P2S>B.k\VAoD]4AU&<.DId<h+E2@4@qg!u
Df-\3DKKH&ATDi7%144#+D>2)+DG_8Ec5K2@qB0n@3B#nDIIR2+DG_'Df'H%FD52uCh\!:+C\o(
G@b?'+A*b:/hf+)@;]TuE,oZ2EZfO:EcYr5DK?q=Afs\u%144#+A,Et+EMXCEb0;7AU&<.DId<h
+E2@4@qg!uDf-\3DKKH&ATDi7Bl5&(Bk)7!Df0!(Gp$R1DIIR2+CJqrBl%@%?nNQo+?;&.1^sd7
+<Y0&DBNt2@:UL!Ch.*t+D#e>ASu$iA0>T(FCf)rEcW@4F`\a?Afs\g3A*!B+Eqj?FCfM9AU&<.
DId<h+DG_8AS5RpF!,RC+CJqrBl%@%?k!Gc+<Y04D/aE2ASuU2+E)(,ATAnc-Z^D?@;[3*D]j(3
@:UKsDf03!EZfI;ASj%B<+oue+Eh=:F(oQ1+CSekF!+t+ARfLs+EVNE?uU71?n;`o+<Ve7B5DKq
F'p,!DIaktA8lU$FC655D]j">AThX&F<G[=AKYi(F(f!"A8GstB-;,)+Dtb705kZ;+C]&&@<-W9
A79Rg+DG^9A8,OqBl@ltEbT*+/e&-s$6UH6=$]_Z8PVc:+EVNEF`:u6@:WplFDi:DBPDN1G%G]8
Bl@l3De:+a:IH=GATMF)+F.mJEZdtM6m->TF*(u6+D,>(AKYH-3XlE*$6UH6+<VdL+Dbt)A0<74
ASu("@;IT3De(4)$4R=b+<VdL+<Ve%67sBi@:O(qE$0FEF`JU7F`MM6DKK]?+ED%+BleB-Eb/c(
A8,OqBl@ltEbT*++CT.u+EM4=F<F0uA8c[0%144#+<VdL+<W'e+E2%)CEPJWDe't<-Rg0MGB.D>
AKY`,@<?0*-[oK7A8c@,05"j6ATD3q05>E905>E9Eb/ltF*(u6/no'A-OgD*+<VdL+<Vd9$6UH6
+<VdL+AP6U+ED%7FCB33+A*bbDIal$Eaa$#+EV:.+D,>(ATJ:f+<VdL+<VdLAn?!kF(HJ/E+*j%
+=DVHA7TUrF"_0;DImisCbKOAA1q\7@<6O%E\;'@Ag\#p+<VdL+<VdLAn?!kF(HJ/E+*j%+=DVH
A7TUrF"_0;DImisCbKOAA1q\9A1hS2DC5l#%144#+<VdL+<XEG/g,1GCi<`m+EV:.+ED%+BleB-
Eb/c(A8,OqBl@ltEbT*++E1b7Bl7Q+@<?U&DKKT2DBKAq+<VdL+<VdL:-pQUFDi:1DL!@6Bl7@"
Gp$g=@rH4'@<?3mBl%L*Gp$s8F)tc&ATJ:f+<VdL+<VdLCi<`m+=Cf5DImisCbKOAA1%fn+<VdL
+<VdL0HiJ20JO\4C2dU'BHS[O@:WneDK@IDASu("@;IT3De(M9De*m"B5)F/ATBD;C3(a3$4R=b
+<VdL+<Ve%67sC&D]j1DAKYo-A0<:0AS,k$AKWuc0Jk4$A8,OqBl@ltEbT*++F.mJ+EqO9C`mD"
G%De<D]j+4F<G[=ASiP!$6UH6+<VdL+AP6U+AtWo6r-QO=WhEr+CT.1DerrqEZfO:EcYr5DBNk0
+A*bbDIal3BOu'(Eb/ltF*(u6+DG^98g$,H0Jj4G%144#+<VdL+<XEG/g,4HF<G+.@ruF'DIIR2
+AtWo6r-QO=WhEr+CT.1DerrqEZf*+$6UH6+<VdL+E(d5-Z<g3A8,Oq-OgD*+<VdL+<Ve;E-#T4
+=C&U5t"LD9N`_P$4R=b+<VdL+<Ve%67sC&BOu'(Bl5&%+Dtb7+=Ki)3A*!B.k)T5+ED%+BleB-
EZbeu+<VdL+<VdLEb/lo+=D)DA7TCaF=0-t@lc8eBOu3q06qJYE\Cs;@rsA<F!hD(%144#+AP^3
762Q*AfuA;FWb+5AKYo/Cj@.;DKKH1ATMs)A0>T(+EDUBDJ=!$+CfP7Eb0-1+A+XH0Jjn\DIal-
ATq^+%144#+Eh=:F(oQ1F!,C5+A+7/=`8F*@ps6tA9Da.+F.mJEZen,@ruF'DIIR"ATJu&F!,"9
D/^V=@rc:&FE8R5DIal1ASc9nA.8kg+<Yc>ASiQ(DBNh.GAMOI@rc-hFCeu*8g$,H0Jjn_Bk)7!
Df0!(Bk;?<+B3#c+A,Et+DkP)F^])/AU&01@;0V#+D>\;+EVNEA8`T4BPDMs$6UH6Bl5&8BOr;9
<-<5!Bl7Q+8l%ht7!3?c+B)cjBlJ/:<,u\_CNCsJ@;p0sDIdI+/g(T1%144-+A*b:/hf+0F!+t+
@;]^hF!,RC+EV:.+E_a:+E(j7FD,5.Eb/m+Cgh?,AU&07ATMp,Df-\6Bju*kEd8d8:d\,L1125:
DfT?!A0>r3D.Oh!$6UH6@:X+qF*)81DKKqBFDi:0Ed2Y5/g+/3Bk)'lAKYJr@<,ddFCfK6+CT;%
+EVaHDIm?$De<T(GA2/4+CK57F`_4T+>@1GE,oZ2EX`?u+<YcE+CK57F'p,3ARTUhBOu6;+B3#c
+EM+9FD5W*+EM47F_kS2@V$[&ATMs3Eb/c(@:jUmEZeb1G]R78Ecl8@+C]J8+A!]"Dfol,%144#
+CSf(Bldi.@q]F`CM@[!+D,P4+CfG+FD55nC`m5+A7[A9<-<5!Bl7Q+De<T(<GlM\De*E%D..]4
Ch[a#F<F1O6mm$u@:EqeBlnVC%144#+EVNEA7]1c+EqOABHVA7D.Oi#De!p,ASuU2+C]J8+A+#&
+B<;n@rGmh+EM[EE,Tc=+D>2)+CT)1@<lo:E+*d/Bjkg1%144#+:SZ#.Ni+V+E(d5-RW:E@:X+q
F*(u(+EVNEF)Q)@+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+/e&-s$6Uf@;IsKPGT^R<Ec5u>+=LfA
Ec5u>+DG^9FD,5.Eb/lpGT^RBE,oN2F(oQ1.3NMHG9@>%+<VeKEa`p+ARlolDIal"Cgh?uAnbge
3Zoe"GB.V>B."gBG]P!U/g+\BC`k)Q%144#+Ad)mDfQsm:IH=KATDj+Df0V=Ch7]2Eb/lpGT^R<
Ec5u>+D5U8FDi:DBOr<.Df?h8AThX$+EVX4E%VS,%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%
1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+
Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7
G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!
@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=ARlo8+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgT
F<G(3D/E^!A9/l(Ble60@<lEp+D,P4+A,1'+EVNEEb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86
EZf=>E$0:BF"Rn/%14=),9S]n0J5+'/Kdf,G%GN"ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)
6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+=\KV?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a
@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu6+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,
@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,
@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OV`n%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(t
FD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T
681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*
?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+
Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&
Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO520f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0
+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=),9S]n0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f
+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[WmF^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.Y
A7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^WA7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj
%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+
/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26
ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<
Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:Wne
DK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:
@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&
/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&NbFD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>
@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^h
F!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]TuDfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*
Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+
/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'
@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOsEc6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+D
E,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A
@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iu
BHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2
/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'
Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22
A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdLG%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s
$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO
,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5
?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q0
1,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0GH#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6
G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<
3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3
Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAlA8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-
+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-
+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/io
EcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p
@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@
ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdL
FD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&
Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1
$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&
F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%htEb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6
AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QHAor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5
$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9VkATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:
$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#
+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\
$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*
Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()
EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0DE`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!
+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9
%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ
=CuSTE-Q59/no'A%144#%144#+B3#gF!+t2DJ!g-D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1
@:WneDK@E>$6UH6+<VdL+:SZ#+E2.8F<D\KIUQbtDf0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk
+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp
3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*
D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKq
F"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%
DJpY7Bm=3"+CT>4BkM=#ASuU2/g)8G$6UH6+<VdL+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+
1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg
+=\L>%144#+<VdL+<W*B$6UH#$6Uf@5p1&VG9Cd3D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)
+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP
+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's
+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB
-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k
%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"
+:SZ#+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5
ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@uA7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1
E+*j1ATDZ@+<Vd9$6UH6+<VdL+<Vd9$6pc?+>>E./ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO
+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha
$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl
$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL
+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8
+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2
Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U
?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtBGW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=
+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@
+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'
ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_
+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqBFD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL
:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7DDfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL
+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWj
Df'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#
+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9
F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1GEHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL
+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(I
Bl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=),9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI
%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4
A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'
DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LA
De*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@
B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7
+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4
F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7
FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWsAKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$
F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7
ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHYF`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o
$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g
+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o
+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1
Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-
DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL
:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!
F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@sAR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"
F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL
+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6
+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6
+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:UAM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*
+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-s
DJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL50H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL
+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<ita
A8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4
+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5f
DBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'
Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26
GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.D
D]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)
@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<
FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#
+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mW
B682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u
%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&
FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7
ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#
+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSek
ARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@
F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+
A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA
7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(
Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(n
DJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(
Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97
EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeK
BOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4K
Dg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'
F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL
+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD
@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr
<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^
DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;o
C2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>
@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;
ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;
@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$
ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:
Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7M
D]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=
De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNE
FD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0
EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555
C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8
F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUj
E,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]Tu
Eb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd
+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?
=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0
+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LA
DIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>
H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+
F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$
A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$i
DI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"
+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$
D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums
+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#
+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3e
Ch4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFp
C1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5
+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*
B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=)
,9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp
+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2
F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+
F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_
+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e
,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4
E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@e
DJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(n
Ea`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+
@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8
ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3
FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2
@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-
+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/
+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,
ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOA
BHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+
Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&
FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$
F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2
F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8
E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC
3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?
7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRt
ATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#
+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRt
ATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B
5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&
DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!
A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@
Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@
?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!
B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,Oq
Bl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgW
IT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8
E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#
+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5
F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0
+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!
F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4
CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8
-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC
<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUr
F"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'
1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&
Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*
@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6
AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9
$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb
+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#
+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--o
Dg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq
+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?
+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5
BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&
A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\
F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4
DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*
FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!b
Eb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-o
F!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?m
H=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq
?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3
AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;
A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!
Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,Oq
Bl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i
76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n
+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1
+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et
+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3
De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO
+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6
Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3
De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1
F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[Wn
De!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`
$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)
AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0
E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8
%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#
.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6
A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;
%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr
@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0f
A0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF
?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL
+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=)
,9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu
+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7
ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJr
De*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_
:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&
GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'
D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$
ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaE
A1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o+
+CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNE
D..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"
+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%
F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7Hm
GV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4
ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6
FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#
+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#
,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)
@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%
6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1
G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAq
De(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e
,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1
+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*
3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b
.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/
+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#
+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!
+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5g
De(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>
F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMp
F(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'
FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*
+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t
2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@
D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*bt
H#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>
A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+
GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4
+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS
?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A
+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!
F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*
@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#
.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>
A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l
@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*
@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;
C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#
.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#
.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK
3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,
Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%
@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.
+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc
@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?
Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-
F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6
Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%
De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$
F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums
-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj
1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k
+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK
%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*
A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8
E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA
%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOs
Gp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+
/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg
+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7
@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg
%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3
@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5
Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^V
AS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>
+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=)
,9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$
DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7
Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&
BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.
+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,
ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$
BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.
AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL
+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0
DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?+>GK'/hnJ#+@]pOEckf2Gp"gq/0H]%1,L+%
:2_^nEa`["ATAnfARQ]kF_l#*+@TgTFD5Z2.1HUn$6Uf@?uKR`+EM+(FD5Z2+D#(tFCeu*AoD]4
DIn#7?oB-GA7-NuE-,f4DCuA*%14=),9S]n0eP.&/KdMo@WHU"Ed8cb/0H]%1,L+%87?RQGp#gk
87?RQAmo1\+@TgTFD5Z2.1HUn$6Uf@:1\Vl@;p0sDIdI++E)-?Ecl8;Bl7Q+8l%htFCfN8F!+n%
A7]:(%13OO+=\L0@WQI(ATVK+8i@f)Ea`p#Bk&9+ASl@/ARmD&$4R=b.Nh)l@;]^hF!,RC+CJYr
Cg\e:?ufh"FC\c1+CK.s@r#U_+EVNEDJsW.+EV:.+CSekBln'-D@Hpq+<Y*1A0?#9AKYo'+B(fs
/M]1A+C\bhCNXS=F(o/r@psC#Anc'mF"Rn/%144-+CI`+;b1:I+CIl35u(f1@;]Tu?s6,l?m';p
@rcK1DfBf4Df-\-De*F#+CSekARlp*D]j.1@VfU.%13OO+=\L.Bl7j0+DG\3Ec6,4D.RU,F!,RC
+E2I@FEM)%FD5Z2+>"^XBOr<.H#R[EC2%?iA0>T-+E).1DeX*%/e&-s$6pc?+>GK&/i#:,6#^jY
C`kPc+>PW+1E\)EE,oZ1B-9c`A8,OqD.RU,F!*n^Bln'-DCH#%%144-+B3#c+E):2ATAo3Afu#2
FD5Z2+Cf>#AKZ)'@VfUs+DG^9@;p0sDIdI++@Rn*BOPrk$6UH6@V'+g+Cf(nDJ*Nk/g+,,AKYet
EbAs(+EV%$Ch4_D1*C:P+Du+A+E)-?@3BW*DJ*cs%144#+E1b%AKZ)5+DbUtG%De;E+*6f+D,P4
+D,b<F`M%9@rGmhF"Rn/%144-+B*2qAKWIFDIdZqF_t]-FCeu4+Cf>#ATJu-@<Q3)@V'+g+CSek
ARlp*D]j.1@VfTu0et?j$4R=b.Nh](AKYQ%FE2XLAoD]4?t=4tATV<&BOPs)@V'+g+CSeqF`VY9
A0>u4+EM47G9@>%+<VeKBOr<(ATo8)83p0F6rcrX?m'DsEa`frFCfJF%13OO,9nEU0eP.41,C%)
+A-'[F^]<9+>Pi++>PW+1E\)9ASu$iEZdhfF_PA/7:^+SBl@l<%13OO+=\L$Df'H3DIm^-+>GVo
Bl5&$C3OT:A92-$DJs_ABQ%]tF!,R<AKXSf?o]Ak0f38\F*VhKASiQ2FE2)5B.b<+BPDMs$6UH6
BOu"!F!+(N6m-#O@;I'1Bln#2FD,5.@VK^gEd8dADI[U%E+*j&@VKXmFEo!<ATW--ASrV_+?;&.
1ad>e@;]TuARTUqBk;;o$6UH68ge[&AU&<.DId<h+E2@4@qg!uDf-\3DKKH&ATDiE%13OO+=\L$
DfTl0@rri$@:FCf+Dl%7@:UKhEbBN3ASuT4/KetLCj@.F@;BFq+Cf(nEa`I"ATAo0BleB;/e&-s
$6pc?+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*-r4\o@rcL*+BDokBjkn$+@TgTFD5Z2.1HUn
$6Uf@+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@
+@KpaARfg)A7]@eDJ=3,Df-\+E,]B+A8-92@:Wn[A1e;u%144-+<YN0@o$#V9PJBeGT^s6FD,_<
@:Wn[A0>u4+Cf>-Anbn#Eaa'(Df-\=ARfgrDf.0:$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.
0JY=)-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6UH@+AQKl+@0jQ
H>d[DE,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums+@KpRFD5Z2@<-WB>A/,#E-"&n06_Va
/n&U*H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3De:,6
BOr;sBleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D+EM[EE,Tc=%144#+<X9P6m-#O
G%GK.E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&
+D,%rCi^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N
1,1L<2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?k!GP$6UH@+AQKl+A-cqH$!V<+DbIq
+E1k'+CSekARlok<HDklB1d)QCh\!&Eaa'$/oY?5?nELBAS!!+BOr;sBl[cpFDl2F%13OO+DPk(
FD)dEIUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<c/hen4+>"^1@<,jk
+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>
A7f3lD/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!
+EVNE8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLd
ATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9
ATT&9ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[
A0<HHF(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinG
EcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e
,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s
$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5
Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&
+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue
%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO
,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8
@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq
$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJ
F`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p
9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp
+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@
ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30
ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+
8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%
+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*
+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-V
D/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f
/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/Kdbr
Earc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W
%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0
C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6
$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2
/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"
DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmf
EZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))
F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o
+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH
@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u
+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(
+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.
F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-
FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%ht
A8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6
Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.
+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6
AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0o
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtE
FDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[Km
Eaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6
D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq
@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6Tcb
C2[X!Blmp,@<?'fDg#i+G@,H'GVV$#+EV:2F!,49A8Gt%ATD4$AKYo7ATDs.ATnRj-!YM&@ruF'
DL5W1AU&<=FF.b@A8Gt%ATD4$AUP[sG%G];Bk;L:%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+DGm>
@3A/bF`_>6BlnVCF(96)E-*4EBOQ!*B4YslEaa'$Et&I]BQ@ZrHY@MCE-"&n04f#RGA1i,E+NQo
@4lJ=B.nICCM>FqBlmp,@<?'fE,ol0Ea`g%Bl7R3HYdD<ATD4$AUP\3De!p,ASuU2+Co2,ARfgu
Gp$^>Df$V%BQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7
E+*Bj07A1>:IH=9Bk)7!Df0!(H$pfJEc6)>F"Rn/%16$FAKZ).AKYT'Ci"$6Bl7Q+AoD]4A7]jk
Bl%iO%16?LAS5^pHY%);D.R`rFCfk0$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%ATD4$AM.\9
H#@)>HW>-$DJ(),De*ZuFCfK$FCcS4DffQ"Df9E>/g(T1+C&ttEbTK7F(or3%144_F`M;FBQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)
,r./hDe*ZuFCfK$FCd(=E-Z>1I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!
Bln$2@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7QUDe*Zu
FCfK$FCd(DA7g7:<HDklB-:r-A8Gt%ATD4$AKXf;7XZlu$6WSp@rc:&FE;/BAISth>]k('HY@MC
E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDkl
B1d)QCh\!&Eaa'$/oY?5I16N+>]+J#D..7%BmO>"$=%:eAShk`+C&T#AS-:&FEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7g7:
6ZmEiASuT48l%htD..=)@;L?E%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*Bs@s)X"DKIONA7f@j@kVS8A1hh3Apk*q+C&f&
Ec#6$F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$
I3;+!FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%
ATDU$DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O8Q/GO:..lF+<VdL+FSZB>]=+aATD?oHYI)%
3`JXA;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:
+E)-?F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,BkCd`ATVL.I=#3oDfT]'CfG=gHY.2:D/!Tj
@qBanGT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`ATVL.I9dt#6Z6gYASuThDej]3DfT]'FE8R<
H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA93/.$=%7iE+O'+Bl7^5B6%s-
BlncM>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE,961I9dt#6Z6gY
ASuThDej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk:
:2b/i@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+aATD?oHYI)%3b`27@qB^m@ruF'DLGe5>XNFH
D.RU,<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-CO9c-@sr]/
:2b/i@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3b`29I9dt#6Z6gYASuThDej]3
DfT]'F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3o
DfT]'CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*BjEb/j0BkCj9F(KH.De*ZuFCfK$FCfl++C%9P
D/Ej%FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,
F!,FBARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/Ed)GBA930G>Y]3XD..6[Dej]BGAL]0AU%g-
GAhM4F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?DfTB0I9dt#6Z6gYASuThDej]BDKg,0E,]B!
+DbJ.AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpe"L$=%7iE+O'+
Bl7^5GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6+<VdL+<VeTI9Trq@:s.lAS-:'An*lGDfTB)
Blnc/+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGq".N$=%.[A:$j]B4u*q
B4uC$DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9
A0=K?7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.E
FD,5.8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I
@V'1dDL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^9
8l%htA8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+CoD#F_t]-F<G19
@:sFgDKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>ASl.-AUP!p+<Xp'FCf;39jr'XA8c[0+D5_5
F`8I>Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*
AQW1[F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ
$6UHrASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:D
BOr;Y:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn
@<6!j+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5
F_#DBE+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(
+<Y-6@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2
DK@E>$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%
FD,*)+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq
4FVa.INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(
>\.e`HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=
FEDkEDe*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#
DKU1H@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`J
Cht57F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/
+F.mJ+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU
+<Xp&Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C
8l%j'+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0
BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_
DKBo.Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>Ff
A7TUrF"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'
F*(i,C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'
DIIR"ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"
G]\%LHYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>l
Eb/j0BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1
+C'#"G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$
Bl7Q9+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+
@Vfsq+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$
I16Mi+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:
0J>+80/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]q
DKK<3+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,
H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TC
B4u*qB4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]Li
H$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDG
BPD*mCh[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r#p:?qF(96)
E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o
0etC93A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$
F(or3%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD
1,(F<0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bs9#p:?qF(96)
E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o
0etC:0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#+<VdL>]+J#D..7%BmO>"$4.gt>\.e`HY%);
D.R`rFCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%
ATD4$AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%
D..3k+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g8AT;j,
Eb-@@B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+Dkq9
+=CoBA8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`
BP_BqBQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"
AUAi<ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-f
CO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5
F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5
B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]:Ci^_I
>Z5`bBl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O
$=%.[A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#:N0l_+EV:.+A,Et+Co1r
FD5Z2@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%13OO,p6H%
AS5^pHZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g"ASu%*
G%G]'@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]
CO9u1+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*
+E_d?Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'
CfG=gHQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3
>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!
Blmp,@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)
A7]9oCh[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(Ci<`m+=CoBA8Gt%
ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,
@<?'cFCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?S
FCf:u$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$
ATJ:f+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&
DfU+GF)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO,p6H%AS5^pHZit@
@UX@mD1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9
A8bt#D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG
/g,@PDId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBsBl8'<%14C(
>\.e`HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3X
D..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GA
FCfN-DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(
G][qJDffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I<9%;E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL
+<VdL+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+
;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@AM7e:BPoJFASlBkFCf]=EHQ2AATMR'B5D.+
I=34\>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAIWT.<E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL+<VdL
>XNFHD.RU,<,ZQ!:-pQU8g%YUAnc-oA0>K&Ch.*tF+"K)>\.e`HUqj`BP_BqBQRs+B713r>\.e`
HW+TdA7];"%16?SFCf;3;e:%nDfBf4Df0!"+CTD7BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkN
ATV[*A8Gt%ATD4$AUQ0?$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MO
EbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[S4hFDYH(>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]
CO71FATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(o
CghBuH[T@3FCSa&AR'=gG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S
@<H[*DfR7I.3N_DG]Y':DIal#Bl[cpFDl2FI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTM
ARp2u$=%:eAShk`+<XR)DBN2+AU&<=FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4
De!p,ASuTB+C'#"G]\%LHY7A<Ch\!>%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28
EbfB,B-:`!Eb/a&DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"A
DIIBn/e&-s$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g-Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3k
F!,49A8Gt%ATD4$AM/(9GT[G&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^p
HUqj`BP_BqBQRs+B73ui%16?8DfT]'CfG=gHY7A<Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-
DJ*csH[TXIA8Gt%ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/
De*ZuFCfK$FCd(HAU#>G%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp
+B<Jo+C%TK<+T0\FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961
/q"iO$4R=b+@.,kBOu!r+EM%5BlJ/:-sUk*G]\%LHX^E*I3<HK+C'#"G]\%LHZNkK.3N>G+Eqj?
FED)3+EVNEFD,5.>]aP%FEDVOF(KH.De*ZuFCfK$FCfk0$6UI%Bl[cpFDl2F+EV:*F<GX<Dg-7F
FD,5.F(K?6ASu!h+E(j7>YJR*AQW1[@rH4'Bl%4"Bl@l3@rH4$@;]Us/e&.1+:SZ#+@^']ATJ:f
+<YN0Gp$R-+E2@>@qB_&ARlp-Bln#2>]aP%FEDVOE+EQs@<?(*I4QLGFCf]=FEDkSASbdsAU&VG
DfQ9o+<Xp2AU&<=FF.hH@;K@oAU&VU+B`W*EZek*DeW]m+EqO9C`m1u+Co1rFCB9&A0>?,+EV:.
+E2@4F(K6!AKYo'%144#<GlM\De*E%@q]:k@:OCjEcWiU7W3;iD/XH++Co&*@;0P!+EM+*+EV:.
+E2@4@;TIiAKYT!Ch4%_+<Xp2AU&<=FF-VU6qh<:ATD4$APdDY@;TIiAM/(9G^U]KDBO%7AKZ28
EbfB,B-:`!Eb/a&DfU+U%16?ODIe**DKTf-Eaa'$I16Mm$<1\MEb-A%Eb-A7Df'&.>YJR*AQXD&
ATW$.DJ+#5H#IgJD..]4G@>B2+EVNE@:X+qF*'#D$4R>I@V'1dDL5r4F_t]1@<?(/>;7a9%16?S
FCf:u$6UH[A8--.>]aP%FEDVO8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F+EVNE@q]:gB4W3-BOr<(
F_tT!EZf:4+DG_(AU"Xk+<Y04CisT4F"SS7BOr;sAS,@nCige6F!,R<Eb/f)@Wcc8FD,B0+DkP4
+ED%7F_l.BBl5&:ATE&=Ci=3(+DtV)ATJu7F`))2DJ'Cc+<YcEB4Z0uATBCG<,WmiARfal@<6!&
DfQt7DI[]u@<6!&Bl7HmGT^L7CisT4F!+t+@;]^h3XlE*$=%%OB5)71G%G]'@<?4#I16Ng@V'1d
DL65CCijB$DesKCHS^(S>]XIdFD5Z2.XPE7DId='DIIBnI9d9h>\.e`HZit@@UX@mD1)j#>\S:k
D%-gp+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<`S@;p91Ci=3(+EMIDEarZ'@rGmh+Dbb0ATKIH=)q_g
E+s3&+DGm+$6UI$Df0Z;Des6$A0>?,+C'#"G]\%LHWO*2:eXGT8Q:*j+B3#c+Co%q@<HC.+DGm>
0ek@)@q]:k@:OCjEcWiB$6UHYBOPdkAKZ).BlbD?@;L't+DGF1H#IgJ@q]:gB4W2tDf0Y>DfQt>
@:s-oF(or3/g+59@;p0sA0>]&DIml3@<,og$6UI1Eb/`lARo@_+EqOABHVD1AKZ&9EbTE(+C'#"
G]\%LHWO*2:eX;D7"$2%Bln#2A7]@]F_l./$6UHr6#:+QFB!0oHX(Z(G]\%LHTj&75(.i3%13OO
>\S:kD'08p+<Xp2AU&<=FF.b@A8Gt%ATD4$AUP\<@<iu0DI[U*Eb/a&Cj@.:BkM*qBkM+$+C&Jp
E+jTBEa`p+ARp33@W-L&A0=JeDJsZ8F!,R<@<<W%Df0Z*Bl4@e+<YN8G]\(KATJu4Afu/:EbTE(
F!+n/A0>f4BOu3,DffZ(EZfILE+O)C+B3#gF!+n-F)N17Ders*+D,P4+Eqj7E,]B!+Du+8DJsZ8
F!,R<@<;qc+<Y04DKK<$DBNb6DJ()'D.7'eA7]9oF*)G:DJ+#C+B3#c+Eh=:@N\otAU&<=FF/.S
CghEsG\1u?DfTB0I4QL^AS!!'@:s/#>]=+aATD?oHYI)%3d#X_@<?(*Ao`*6Eb'6>/.Dq/+Ceht
+C\n)F`V,)+EVNEB4YslEaa'$+C&JpE+jT@DKg,0E,]B!I3;cg@8pf?>TdWsEZfFG@q[!/DfTB0
+EV:*F<G(%DBND"+DkP)F^]*&Gp%<O@;p0sA0>;uA0>T(F(KB6ARl5W+<YB9+EV:.+D,>(ATJu,
ASu("@<?'k+C]U=>]aP%FEDVOC2[X!Blmp,@<?(//g+,6Gp$O:+EqB>D/!WrF<GXCD.Oi,@;^3r
C`m;"Bln',B+51j+DGm>@;L-rH#k*GARf:mF('*7+EqOABHUPR@8pf?/e&-s$=%.[A:%m*F_t]1
@<?(/%16igA8kstD0%He:-pQ_C2[X%@<-4++EK+d+Co%q@<HC.+Co1rFD5Z2@<-W9E+*cqD.Rg#
EcWiB$;No?%15is/g+,,BlbD/Bl%?'BlbD>F(Jl)FDi:CATT%;FD,5.+Co%q@<HC.+<Y3/@ruF'
DIIR2+E1b0@;TRtATDi$$;No?+EV%$Ch4_3Bl5&8BOr<'@<6O%EZet.Ch54A=(l/_+<Y)8+Dtb7
+Co1rFD5Z2@<-W9BlbD,Eb/[$ARl5W:-pQUFD,5.+E1b0@;TRtATDi7+DG^9FD,5.+DkP.FCfJ8
Anc'm+CT;%+E_a:A0>u4+EML5@qfP#+<Yc>AISuA67sC"@<,dnATVL(F!,(5EZed5E+*d/Bk):%
@<*K$Bk)7!Df0!(GqL4=BOr;/G%G]'+=Lc>F(KGB+Ceht%15is/g+V7+<VeLF(Jl)+EVNE+<YN>
A8,Y$+<YW3Ea`frFCfJ8+EM+9FD5W*F!)SJBl5%9+DG_(Bm+3$F^](q$;No?+Co1rFD5Z2@<-'n
F"SRX9jr*bATAn9Anc'm+E1b0@;TRtATDi7@ps6tDf0B:+C\n)@q]:gB4YTr@X/Ci:-pQUARoLs
Bl7Q+FD,B0+D,>(AKYE!A0>o(@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm/e&._67r]S:-pQU<+ohc
D..L-ATAo*Bl%?'@ps6t@V$[&ARfal@<?'k+EqOABHVD1AKYJkChu-A$;No?%15is/g+YEART[l
D..L-?X[\fA7$HO9gM]W78dK$C2[Wi%15is/e&._67sB^5uLHL:.I>f@;Ka&FD,5.+E1b0@;TRt
ATDi7@s)g4ASuU+Gp$p;F*(u(+CT;%+ED%5F_Pl-A0>?,%15is/g,7LAKXT@6m-PrF*(u1/g*_t
+F.mJ+ED%1Dg#\7@;^?5De:,6BOu$'8l%htGA1l0+CfG#F(d0K=`8El$;No?+Ceht+<Y`6An>e(
+CSek+CSekBln'-DII?(E+*cqD.Rg#EcW@4F`\`KH#IgJ+CehtDJsV>F(&ZlCj?Hs:-pQUEb0*+
G%De+F`MM6DKI"?@<,dnATVL(F"Rn/%15fq;cH1`:dIuR;a!/a0H`D!0F\?u$;No?+B3#c+D,P4
D..N/De:,6BPDN1E+*cqD.Rg#EZet.Ch4`'F#ja;:-pQU+<VdLC2RHsAKX&W.!0`RALSa4ATM@%
BlJ0.Df-[Z+Eh10F_)!h:-pQU%15is/g)8Z+<YE:@;TQuBlbD*+Eh10Bk/>Y+DtV)AISuA67sB'
+<VdTFEqh:.3N/4F(96)E-,f4DBNJ.@s)X"DKKqBFD,5.E+*cqD.Rg#EZcqVFEqh:+DGm>Eb065
Bl[cq%15is/g)8Z+<VdL+E).6Gp"LcBl8$(B4Z*4+DGm>@s)g4ASuU+Gp$[CARfk)ARlp%FD,6+
+EVmJATJu<Bl%Sp$;No?+<VdL+<VdL@V$[$@<6L$A0><%+Cf(nEa`I"ATAo0BleB;+=M;BAKYN&
FCAWpALT5@$;No?+<VdL+Eh10F_)\0F!+n/+D#e/@s)m%@VfTu8g%\iE,oN2F(oQ1+EV:*F<GOC
De+!#ATJu&+Eh10F_)!h%15C"6V0j/2'="a+?L\o.qrmCAS5Rp.3NhJASrVF+E_a:+CT>$Bk]Oa
+DG^9A9Da.F!)kb+E)9C0e"4f+<VdL+<VdL+<W`g0d%SJ$:@Tc=[k\E<)6C74!5q%Bl8$(B4Z*4
+Cf>,E,TW*DKKqB@rH=#ARlotDBNk8AKYf-Df?h<@<6K4-o!i04>J`I.3K`U+?L]#0JEqC6r-0M
9gqfV6qKaF+?L\o.qrmCAS5Rp.3NhJASrVF+Co1rFD5Z2@<-W9A8bt#D.RU,+DGm>E-67F-nlc^
EZd(c+<VdL4!66e$:IZW<D>nW<*)XZ<(J,n+=JaSDKKH&ATB4BGA1T0BHV5*+DQ%?FD5?$ARloo
De!p,ASuT4FCf]=+=K!!4F'%E2)Qg*+?L](0b"IX<D?:Z5snUI;BS%D-nB"LFCf)rE[`,L@VTIa
FE8R8F_u)/A0>T(+E)./+Dbt7E$0+.F)rHP0g'_D1,L[6+<VdL+<Vdg+>kh^$:dNa7R9C@:Jr;X
4!5q%Bl8$(B4Z*4+EqaEA9/l6ATVs,AThWq+DG^9Df0,/Ci=62+E1b1F!)kc0KaVC1,(OE.3K`U
+?L]$2)#IH:fUIa5snUI;BR)D+=JaSDKKH&ATB4BGAhM4F!,OGDfTE"+DG^9Df0,/Ci=62+E1b1
F!)kc0KaVC1,(OE.3K`U+<VdL4!6730F\@e78uQE:-hB=+<W`g-nB"LFCf)rE[`,TBOu'(0d(RP
D.Rd1@;Tt)+CT;%+ELt7ARlotDBNJ4D/aP=-nlc^EZd(c+<Vdg+>F<483p0F6rcrX+<Vdg+=JaS
DKKH&ATB4BGA(Q*+>G!I+D>2)BHV#1+E2@4AncL$A0>u4+CoV3E-!-M0Hb:S+>G;f+<VdL4!66e
$4R>;67sBY:JXqZ:J=/F;BT[p+D#D/FEo!<Gp$X/AmoguF=n\-Aftf0+DGm>F(KG9FDi:1+=LuD
@<?03+A*bdDf00$B6A6+A0;<g:-pQUAoDKrATAnk:JXqZ:J=/F;BTn$ATDg*A7]g)A8,OqBl@lt
Ed8dDDe!3tBl@m1+D,P4+=M)CF"&5EASu("@<?'k+EM%5BlJ08+:SZU:JXqZ:J=/F;BS%D-t?q!
Ea`I"ATB4BEb/cqEb/a&F!)lJCi_$JF(96)E--.DFDi9o+D,P.A7]d(4!4t>%15is/g,7]E+rfj
C`mV6DIm[(FEo!MATW$.DJ'Cc:-pQU;GU(f7Sc]G78b6i+=L`5@<,ddFCfJA+ED%(Bl[cpFE8QQ
D/=8B+EM%5BlJ08+EVNE8g%_aCh.*t+?L]pF`V,705>E9Ec5l<+:SYe$;No?+@0mj+CSekARlp&
@<,dnATVL(F!+n3AKZ&9DfTE"+DG^9FD,5.D..L-ATAo*Bl%?'GA(Q*%15is/g+YEART[lA0>;u
A0>DsF*)G:@Wcd(A0>u4+A,Et+Co2,ARfh#Ed8dG@VTIaFE9&W+:SYe$;No?+BLj,:.\2N3ZrW[
ASrW$AS,XoBl7Q+8g%\iE,oN2F(oQ1F!+q'+Cei#AS-($+CS_tF`\aJBOr;J+Cf(nEa`I"ATAn&
$;No?+EV:.+A,Et+Cf>#AKWC3E-,MtCh5%<FD,*)+E1b0F(KD8FD,B0+EMXFBl7Q+BlbD;F_#3'
ASuTuEd98H$4R>;67sBJ:Jb1l8Ol<N+?L\o@q]:k@:OCjE[`+m+@0g[+ED1/BQS;<Eb0<'Ecu#)
%15is/g*kk:dIuF9gr#M;BS%D-nB"LFCf)rE[`,QBOr;pDKC#5EZdFd1boLI.1HUn$>OKiE,o\n
F(KB-AU/>P2,6Ij+E;KGF`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3AC2[W3/e&._67r]S
:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`
<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";
Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+
1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX
67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]F
CM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#
.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+q
AooOm2^/\<:-pQU,#`/hAooOm2^/\<:-pQB$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3
.4cl0-YdR1-RgT/-ZsNFCi^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4@<,ddFCfJ%$;No?+@\1L0KV[6
@Wc<+;KZk=A7BS%DBL;S+ED%4CgggbA0?)1FD)dW/hf%'GAhM;@<-:/DIa1`%15Q[4#&fpASkjk
AKX?_EcP`/F?=;W@:UK.B4YslEa`c;C2[W1+Bot/D'138F_PZ&C2[WnBleB:Bju4,Bl@l:+Bosu
Ch7$q+=ANG$:AoUCb%t14#&fqATT%^F`MM6DKIs\F!)iLEb]?-A1&L(+E(d5-YdR1A7]p3+BosE
+E(d5-RU$@+ED%5F_Pl-+=Cf5DImisCbKOAA1%fn6Zd?b.oU+qAooOm1-73P7!3?c+Ad3&4*#Bb
-Y.@:E,]rA-OgDP1HR<Q;IsijBl[c-8l%i:Eb065Bl[c--YI".ATD3q05>E9-OgDMFE21J7Pd+\
4&TX"H"1Z%+A,Et4"+i^A8c?./0J\GA8c'l.3L>S$<(VPAooOm1HR<Q8l%ht87cUV4)/\EBOu"!
+>=637Pm1]4%*XhF_;gpF`'9O@WHU/+=ANG$:Zp80fr?GF*&O'D/X3$4"!cp9i)sRD/X3$+EV19
F=.M);eTlWF=Tg=4#&frATMr96=FqL@ll&58PN#(@UX=l@j#l)F*&dEDe*g-De<^"AMPu867sa&
De*g-De<^"AKZ%G/KdY]6m-#S@ruF'DIIR2+E2@>Anc'm/e&._67r]S:-pQU6#IfVG[YH.Ch4_]
:IH=EEc5Q(Ch4`1@rc:&F=n\7@<Q3)FD,B0+EM%5BlJ/:Bl4@e:-pQB$;No?+F[a0A8c@,05"j6
ATD3q05>E90+A7`67r]S:-pQUGA2/4+EV:.+DtV)AKY`+A8lR-Anc'm/no'A%15is/e&._67sB[
BPDN1F(96)E-*3FBlbC>AU%crF`_2*+<Y*)FCfJ8@;Ka&A8,OqBl@ltEd8cMDdmHm@ruc7BOQ'q
%15is/g+V7ASrW#Eb/[$ARmD98TZ't@ps6t+C\n)F`V,)+<YcE+<Y`:F<G^F+<YrJF`JU8AS,@n
CigdB8l%ha$;No?+EqaECM@[!+D#G6Bl\-0D.RU,/e&._67r]S:-pQU=$]_Z8PVc:+@L,jDJsV>
A8lU$F<Dr/78lWS9gpEPBkAK)DfTD3FD,*#+E)./+<X9P6m-S[F))n4Et&IO67sBh@ruF.AM,)s
Afu#0Cj@.ADIjr4@<63,BlbD*@ruF.AKXl>;ajY[743.!E,oN5ASuT4@;]t$H"h//%15is/g+S=
Eb/ZiGp%$EASrV5D.Rd0@:s.m+EV:*F<G19AT;j(DKK]?+ED%7F_l.BAo_g,+D,P4B4Z1,Bl7Pm
$;No?+EVNE@r-()AKYMt@ruF'DIIR"ATJu:E,TV:AU%p2Bl7Q+8hLP[:-pQB$;No?+AP^3762Q5
D]g/p+Co&,ASc:(ATDiE+@.,kBQ\E-Dg-(AF(K62ASu!h+=LY@Ch[cu+<YT7+A*b!FD,4p$;No?
+DG_8ATDa1ATVj2+<Y6?ARfk)ATJt:@V'.iEb-@9+EV18D/!lrFD5W*.3KaWDfol,+<Y-)+<Yi=
Ed8*$:-pQUF`V,+F_iZ>$4R>;67sC%ATT&=BPDR"+EML1@q?d%Eb0<'Ectl5Bl@l3Df-!k3?^F?
0d'[C0b"I!$;No?+Dkh1Bl/!0+E2@8DKI"?Eb/`pF(oQ1+EVNEF(fK9+F/6XH#7D/A0>DkFCfM9
.!&s2+DPh*@:s.#%15*=3\`?3>9Gm7$4R>;67sC%ATT&0EHE=IBl7I"GB4m:Df0W7Ch4`1BmO>5
/KeJEFDl#)FD55-AoD]4Ch[d0GV<oB@kVP7Et&IDGA(>u?TgFm0fC^.1,KFI%15is/g+\C+Du+>
+ED%7ATT&/AfuA;FWb+5AKZ#9DJj0+B-;&0Eb-A8BOPd$Df0,/8l%htBl8!6@;]Rd%15is/g,"R
CijB1Ch4_]:IH=>DKBo.DI[7!+CT;%+E1n4D/"*6ARlomF`\aDDfd+BARfXqD.RTqARl5WA8lU$
F<Dr/78lWS9gpE=$4R>;67sBQ:IH=>DKKH1Amo1\+Dbt+@;KKt/KcHUC2[W3+DGm>@3B3$De'u0
Cgggb+D,P4+CSe'BQ%B'8l%ht@:WneDK?6o@rGjn@<6K4-Y[=6A1%fn%15is/g,(UATDg*A7ZlP
6pjaF;bp(U+>"^WATT%CC1D1"F)Pl+/nK9=.3N24Bln96+>"^YF(HJ+F_kk:E+*j%%15is/g*n\
9i*kn@s)g4ASuU+Gp#OD6VgHU:J=2"BlbD@Bl7I"GB4mFDJXS@/Kf+GAKZ/-Eag.>ATT@D%15Nl
6VgHU:J=2a@;9^kF`_>6?TgFm-R*%]>YoHZB6%Et+@^']ATM*NBk)1%F)PZ4+BDD`6Z6LH>[q\_
AM.P=AKiK2$;No?+@S[c:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF!)lU3&W3j
DJsW.E+*9-.pQt1FCfE"A1K/_AU%c1-OgCl$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?
9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>ATMr@%160-78cQ?9h@K/+=Ci@D.P(($4R>;67sB/BkhQs
.3N2BEc5tO+Dk\2F(&]m+EV1>F:ARG;Gp(Y:IHlj4ZX]5@s)g4ASuT4B6%p5E$0%,D.Oh<C2[Wq
?YO7nA7$c.DJsV>F(KG@%15O%;FsJV6ng>Y3Zoe[F`MM6DKI"BF_Pr/+DtV)AKWC9De*orBkhQs
?R[+8Dfd+CATT:/$:Rij8P2cH0JYdP+=Cl@G%#3$A0<:F.3N\C@<,jk+EMXFBl7Q2%15m(8P2cH
0JGXN+<W%LD]in*FCSuqF!hD(:J48O:IHlk4ZX].-Z3iFDdmHm@ruc>%13OO:-pQU@:WmkA7]Rg
FCcS5@VTIaFE8R:Ec5e;@s)g4ASuT4B6%p5E$0(>+CfP7Eb0-1+EM[>FCbmg@:q_a+>Y-$+>=63
BkAt?G@c#+@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#nA7T=nE$0EKAScF!/g+n>ATDfu@;9^k?Q_d8
;FsJV6ng;;ASu$2%14Nn$=S!=3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(
4#8<.@:Wn]Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/e&.:%16WY4ZX]A+?CW!
%16f]/g,@LG[FloDe*2t4==l^A7m84A8a(CC2[Wq+Co&"B6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t
78d#T8l%i/0HaqEA1e;u.1HVpF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuC
A90gg.3N/4ChId-+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@B%14Nn$6UH6%15is
/g,1GAn?!oDI[6g+EqaEA9/l2Dfd+9DBNG3EcP`/F<G4:Dfp".$>t)O3Zp4$3Zp*c$>F*)+>#3i
AU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH0JFViATW'8DD!&CDIb@/$>F*)
+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA/g+_CA1e;u-t-q.Eb/j(+<Z(b
+D5R@+>#2gB5S.c.1HV,+<V+#:-pQUGAhM4F!,17+CfP7Eb0-1+D5_5F`8IGF(oN)+CQC:DfT@t
$?]uE3Zp4$3Zp*c$>F*)+>#3iAU%QjC2[Wi+?V#dDe*K.+CoCC+DPFuEcPMqC2[Wi+@T1+8P2cH
0JFViATW'8DD!&CDIb@/$>F*)+C\biEarHbC2[Wi+D5RT/g+eIE$/n6A7m#qD_</FDBNt2FEMVA
/g+_CA1e;uGp%6NARo7q+FPjbB5S.c.1HV,+<V+#:-pQUB4YslEaa'$+CfP7Eb0-1+D5_5F`8I3
DIal2@<Q3)Ci<`m+EM%5BlJ/'$?KiC3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1B."g4D_</L
Ci^_6De*K'AScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng><ASu$2+:SZ,%13OO:-pQUDfB9*+D#G4
Bl[c-.![6aE+*j%%17#bE'66)2C<?Q%13OO:-pQUFDl+@-ua<N+Co1rFD5Z2@<-WB+EqaEA90:E
B6%p5E-!QQF*22=ATJu.DBNt2G%l#3Df-\9Eb&a%%173$4ZX^+AThu$$?ToD3Zp1)Eb0E4%172u
4ZX]A-?<[@D[d$_$;No?+EDUB+EV%7FDku6B6bV.F!,F<@;0V$ATMr9/KeSBATJu3Dfd+CFDl+@
Df-\8Df0l4Ec3(@ATN!1FE7luEcaH*+>P9aFE@s!%15is/g,1WDBO%0F`_P<DeF><F(oH%DKK]?
+>"^[Bl%T.F(fK9+D#e:Ch[C$+EMC<F`_SFF:ARtEBQ?;-?=3M%13OO:-pQUEcl7BD.-ppD]j+8
Ch7L+Cj@-T+EqO9C`me4Dg*=8G]7J5@rri7D/XQ=E-673$?C2N3Zp.(Ebu6m%15is/g,4KDfTqB
BOu"!+D,P4+D5_5F`;CTF*22=ATJ:fBP0Ih+BplLBP_X*C`lqC+FPjbB6%r#$>=KD3Zp."BP_X*
C`lqC+FPjb1E^=NE$/Eq$4R>;67sC%BQ%p5+D>>&E$0(:+E2IF+E(_(ARfh'+DG^9Eb0E.F(Jl)
DfTB"EZet7Df$V,De*E?%15is/g)8Z+<Y?<+>b2`:-pQUD.-ppD[d%K67sB'+<Ve?EZd+[+AP6U
+D5_5F`;C2$;No?+<WBm+D>d<0H_K567sBs@<6N5FCf>4GAhM4Et&IiE]lH+1E\_$0F\A'AhG38
@:XCg?X[\fA7$I'4Y@k&+ED%:D]gDT+CoCC+EnrKATW'8DD!&CDIb@/$@*b-CiF9.+FPjbG7=m?
%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7
GT_>c+FPjbG7=m.%13OO:-pQUEb0*+G%De<Ea`ZuBl7Q+@VfIjCERY9GB43#Eb/^%@WHC24ZX]k
+<u=X><3lY/g+@Z+=\us+u(3E3Zon)03g+P-Qjc`4Uh`-$;No?+CT5.ASu%"+EVX4Bl%L$B-;#)
DIjr&AS#Bp@q]:k@:OCjEZf(.+Dtb#ATMp$Ed8*$FDPPP3aEjZ+=JWm0RI4\.3`+A4Wo)4.3O$k
+=JruHXSNU,$tcd%15is/g,4KDg*=?Df021A8bt#D.RU,Et&IO67sB'+<VdLBP_3%0H_J\+<XEG
/g,@VEb'5#$;No?+<VdL+<Y?6A0<WM+<VdL:-pQUB6%p5E,uHq:-pQU+>=om+>=pOCh+YB+<Ve%
67sBkDe!p,ASuU$A0>c.F`)70$;No?+=BoU9i*ku+D>S%+>=o\:-pQUGAhM4+CoD#F!,[@FD)e<
FE2)5B-8Qs8PN#B-OgDX67sB'-s[rH3ZoY4BP_3'0I\,Y/g*"o:-pQU@rHL-F<G+4@ric2DBNn,
FD)*jBP_3B3Zodt-6tVp3[cg-3Zp+*%16f]/g+V3A7KF_@;9^k?QaS9A8a(CC1LmrEaN6iDe*2t
78d#T8l%i/1*CUKFEMVA/g+_CA1e;uBkAt?@UWef@p`YZDe*2tG<IQ$Gp$X8C`k)Q+CoCC+EnrK
ATW'8DD!&CDIb@/$>F*)+>>r'-9`Pr4Y@k*/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0d(LJFEMVA
/g+_CA1e;uBkAt?@UWef@p`YZDe*2tA3DOf-n'EpGpt:).3N87F<GcMA8a(CA0>o(FEMVA/g+_C
A1e;uA3DOfA0<+G+>=p#+<r3s+>G!c+u(3N4Y@j@0mdF?$>F*)+>>o&GT^O8/g+[f/g+[I,CUac
/h]I<GU>j3.4.5$0d(fe0d(!LASu$2%14L;+F>:e+CloD/1r&cAR]ajEc6.e-s\ne?SX&qFDPPS
-nR%u6W,?[/j:C4+F>:e+Ckog.1HUn$;No?+EM+&Earc*F(fK4F<G7.CiCM/DfQtAFE2)5B-:W#
A0>]&F*&OA@<?!mBl7Q+GAhM4Et&IO67sB'+<Ve?F)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@q[!/
DfTA2F(fK4F<G[:G]Y&;$;No?+<WE^+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+D5_5F`8IE
BQ%p5+EV1>F:ARP67sB'1a!oSF)rHOE,Tf>-QjNS+<VdL:-pQUF(Jd#@q[!%@:O=r+EM47Ec`FG
AU&;>%16ciF$2Q,0IA&++?Co-+?CW!.1HVuAhG38@:XCg?X[\fA7$I'4Y@k%+CoA++=ANZ+<Y35
/g,?\Eb0?8Ec*KPASu$2%16W//g,B]BP_X*C`n-Y+En8%BkAt?0KgY)4Y@j3+?i&;+ClT;+<VdL
+<VdL+<Ve;D_</NCL:LbDe*2t:J48O:IHlj+ED%8F`M@P+D#G$/e&/%AhG2[4X5#2/g*_<+=Jd%
Gpsjd/h\D'5Xd:JG9CF7/g,(J?X[\fA7$HT91_`O6ng;;Eb0?8Ec*KPASu$2%17/'HQXXf4s4AF
$7QDk%15is/g,4LDJ*cs+Dbb0AKYQ/E,8s#@<?4%DBKAq:-pQU+<VeJCh7i6-[0KLA1&KB+<VdL
+<Ve%67sC)DfT@t$;No?+<WK`F)5E4+=CoBA9)6oBleB-E[MtP:-pQUD.-ppD[d%K67sB'0d(OR
AU#=FFD,B0FCfN8-QjNS+<XEG/g,7IF*%iuF)5E44ZX]>-6tVp3[cg-3Zp+*%16f]/g+V3A7KF_
@;9^k?QaE+4Y@k%+Co2-E$0EKA8a(CF)2t>ATW'8DD!&CDIb@/$7L-M3%5thF`\aO4(`2IF*(o1
D/Ej%FC/BI:IK;CDesJ;F)29m.1HUn$;No?+ED%+ASu("@<?''E-67FA8,OqBl@ltEd8dODfTA2
@rcL/F!,L7An?!oDI[7!%17,eEb/iG3Zp4$3Zp*c$>F*)+C\biEarHbC2[Wi+EBUt+ED%:D]gDT
+CoCC+EATFATW'8DD!&CDIb@/$7KpG/orHa,CUae/itb6+u(3]4YAE2B5DKqF!a'nE]l%'/ohC.
.1HUn$;No?+D>2$A9f;-C`m8,@j#GrCiEs+Et&IeDe!iuE]lH+1E\_$-Y%77?X[\fA7$H-2DI9I
4"r`D-Vcu\-RU>cA8bsfF>@31<E*=48l%in@VR#k4"akp+A>6UGqCX9;C;n\A8bt"G]Z)0+>Y-$
+=CZ@CgUUcDe*2t-oNeA0KUsM-RU8h.3N/>@q0U9?XHf4?XHE$6uQOL+C.&]?SNZs7P&g:/jiMa
%13OO:-pQUA8-+(CghT3DJsZ8+E)-?F(96%ASrW!DIal1ATW'8DBNh8F`&=F@;L't%17/iDg-//
F)sK*>p*>o0d/S5-8H#;%15is/g,+OEcb`!Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&IqDfTr0
BOPq&4ZZe.+?:T+2]sIu.k<,#.k<,#Hn?]i?Q`Pq>n%,M$;No?+EqO;A8c[5+Dc11Bk1Wp@rH7+
Deru-@W-K6A9)+&Bl7Q+@q]:k@:OCjEcVZsGA1r2@q01\EcXB)><3le+Z_P)-t+`TIPE`2BeD+p
.3`+A>9I2\$4R>;67sBlA8--.@rH4$@;]Tu%15L!6WHiL:/jSV9hdoK6p3RR-Z`s>GApu3F!,FB
+=AO`ISP??-RU8N$4R>;67sC$ART*l-6RMQBlmo/Anc'mEt&IsART+43\_d=0d\;S?p$\,-o3V*
5!UMP+Z_;+.4G]5GB.D>AN`(/+Z_A$?!oc[/grM2-9a[C1Eee5.4G]5Eb/ZiDJsZ84ZYAB3\irK
0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.4G]5GB.D>ASuF/DEU$/><3l_+Z_>#>:C[C0d/S5+C/A;
5V=H@1+#1M-o3#-0I\G"+C,E`%15is/g,1G@:UK[5sc])ASc'tBlmos+EV%$Ch4`$Bl%@%+>"^J
@<6O%EZfI;@;[29Eb/ZiFCZgC/Kf+GAKYf-DJ()&De!p,ASuT4Bl5%AF`_>6F"%P*Eb/ZiFC[-i
3a4Wf4?G0&1+#1--olW_/h%no-8%K2+BplL4?G0&1*Bd^+=LM</0H>h0edr_/h%uO+?^io3[l2"
/g)Ps0RI4\.3`+J+=Js#HXSNU+>#3p+>G$#0d\;S?p$\,-o3V*5!UMP+Z_;+.4G]5%15is/g,@Y
Blmp-+EV%$Ch7Z1@<3Pj5sc])ASc'tBlmos+A>6IFCfK0Bl7@$ARlp*AU&;>/Kf+GAKYf-DJ()&
De!p,ASuT4Bl5%AF`_>6F"%P*GB.D>ATVH<4ZZjk-nul+1*Bk14?tMI1GU:@5U\E33\W!3.=NCD
3ZohT3ZohV+=nW`-o!E&@4iuQ?Q_KSHTESuI4cWj0edr_/h%uO.3MhU+FPk--nIV30d\;"+u(N3
-nR&:-n6i&>V73T5U\cB-Qjd%>q%3O.3KiX/3kU30edr_/h&+q/0Zet5[>ff+BplLI4c]u+BplL
4!HC%-olW_/h&+u5U&69/j:^,>7CoK$;No?+D,2,@qZurA8--.FCf]=05Y--Ec6"A@;]Tu@<6L.
@qf@nAKYK$A7Z2WFEBZ,>p)3OB64RiD0.p%>p)3O1,U7_+?L]YF<D\K:-pQU.P>gfF:ARoC-=U`
+?L]$0d9sI4!80X+<Ve%67sB1/no'A%16r_4ZZjk4!6:;,$uHS+D5d=+<XEG/g)VrD..I#A8c[0
%16rl4ZZjk4!6=5,$uHS+D5d=+<XEG/g)VrF)c"*$>k#N3aEji+>P\r?Q_EQB657=+AP6U+=]!c
AU"Xk%15is/g,UcF(KAFFCf<.+E(_(ARfg)FCf]=+>"^HAS,@nCige7+EM%5BlJ/'$?'uK3Zoea
C3(aL,W[&/+=LGT+DPk(FD)dEIW]^CE\DNGD/_-U+=nW`-QjcZ/M;Jp>q$mI+=Ach+=nW_+=A9`
/q+pI.1HV,%15is/g,1G@:UL&AU&;>Ao_g,+DN$AF(KA7FCf<.+Co2,ARfh#Ed8*$C32U"><3mI
ART*lDfZ?p+:SZQ67sB'Ci<`m+DN$?@rc:&F<G19Df$V3+E_a:EZfI8D/]pkC2?$o+=Joe3\W!J
C30ml%15is/g+tK@:UKq+EM%5BlJ/:Ao_g,+Cf>-Anbn#Eb/c(C*7J(FD)*jC2c<s+BplL0HiJ2
+BplL4<SBX@<?/l$4R>;67sBsDdd0!@;]TuF(fK9+DN$?@rc:&F<G19Df$V,Df00$B6A6+A0>i"
FD)*jC2e5W3ZqWf+>=s"0JG4(><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1W
ARlomGp%9=EbTH7F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'
DKH<p:/=2T4ZX]?0F\?u$;No?+CoV3E$/\3Bm+&1/Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;
E,]rA.3N>:+E2@4F(K62%15is/g*P^9i+n_:..u\4ZX]5BK@LM$4R>;67sBkF_u(?E+*j%F!*%W
F`V,)+C]U=.!9WGCi_$JD.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX:dJ&O4ZX]5
05>E905>E9A9Da.F"\mM$;No?+@K4(:f(%j:dJ&O4ZX]505>E905>E9E,p,4F_u)=0..29%15is
/g+Y?ARTU%A8,OqBl@ltEbT*++>"^YF(Jl)@X0(EF`_>6F"&5K@:O=r+=L`9ARTUuF`]&TBkAK,
Eb0<'DKH<p:-pQU6VKp7;G'>K6W6-/+?MV3-OgCl$;No?+EM+9+CQC3Eb/ioEcP`%+Dbt+@;I'*
@;]Uo@iumG+E_a:A0>?,+=LuCA8Gt%ATD4$ALS`R+EVXL+=MGIATD?)E+*WpDdt4*$;No?+Abs)
7R^3Q779s<:..lF4ZX]56TSIPF(KB5>\@VcEbT#9F`V,7>X<=J6t(1G>YK'G@;K1F@;]Uo@pEt]
DIdZq-OgDX67sBW;FO&D;GoqO:dIiE:I@9++=AgbF)ipMDe!3l04JX505t?;A8bs*%13OO:-pQU
8l%htG%G]'F!,RME+rfjCi"A>Ecl7BAo_g,+EV:.+C\c#AKYf-@ps1b+:SZfDe!p1Eb0-1+=CW,
F(H^.$4R>;67sBlG[YH.Ch7Z1De:+a:IH=HATMp,Df-\=FCB33+E_XE+>"^WBQ&*9%15is/g+hG
G9D!G+E)41DBNJ(@ruF'DIIR"ATJu&DIal(DK]r6AKYr4De`inF<GF/@rcL/%13OO:-pQUF(KG9
F`8I5F`MM6DKI"?Ec5](@rrhA0d(O[E,]i/F)rHq:FmVB+E)9CASc'kARlooBle60@<j:2$;No?
+>G!ZD'13FEb]Z4F_>Ar@r#drB."g++EMC<F`_SFF<GL4+?MV3F)?&4A7]p,F)?&4+E_d?Ci^sH
>9G^EDe't<-OgDX67sB8+ED<A-ZF*@D.RZ6+Bot,A0<7:AT0">>9G^EDe't<-OgE"@;]dkATMs.
De(UX:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht8g$o=C1Ums+@KpRFD5Z2@<-W@
%16-);H$._:-CWc0eP150ddD;7Sc]G78c90-YI".ATD3q05>E9-OgDZ9L2WI:Jsnc4ZXs7Bl5&0
Bl8'<+Cno$GA1qB+<VdL+<V+#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A(
De(J7C3'gkC2[X%@<-4+/no'A%16igA8lR-Anc'm/no'A%16r\DJ<]oF*'$KC3'gkBPDO0DfU+U
FEhm:$>OKi@UX%*C2[X%@<-4+@UX%)Bkh\u$>OKi@UX%*C2[X%Ec5Q(Ch7'aCG'=9Et&IkDe*<c
CG0F@A9Ds)Eas$*Anbme@;@K0C3'gkC2[WnDdtG:Bl8'<DJsW.F"VQZF:ARlDe*Bs@kV\-@r?4,
ATKJGG]XB%C2[WnDdtG8De*@#@V%0+@rDe`C2[WnDdtG8De*@#@V%02DJ'CcC2[WnDdtG>A7f@j
@kVS8A8l'k/p)>[%16igA7^"-F"_9HA9;a.Ci_4CC3'gkC2[X!@:F:2C2[WnF_u(MBkh`!$>OKi
Cggdo05>E9Bl8$5D_>a=F:ARlDe*Zm@WO2;De*<gF*'$KC30mlC2[X!@:F:2CggdaG[YH.Ch5:S
0eR0TEt&IkDe*Zm@WO2=@:EbiD/_+AC3'gk.1HV^78--9;aii1-RT?16q'p@:./#D3Zp+!3Zp*c
$=mRe@4uA-Bl%@%%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@lt
Ed9)VBlbD*+A*bqEc5T2@;TjqDJ()#DIal1AS,@\FDl26DJ(($$?U3)Cb?i&:IH=HF`;;<Ecc@F
Ch[d&ARlooBk)7!Df0!(Gp$X+FCAWeF(KD8@;]TuE,ol?Bk1dr+:S["Df9H5+D,P4+C]J-Ch.6t
B.P09De!p,ASuU(DJ()#DIal3ATMs-DJ((a+EMgLFCf<1/g(T1%15^'6m-M]EHPu9ATJu9BOr;7
A79Rg05>*5Ch7Z:+CSekDf.0M%13OO8S0)jDfm1:DKBo.Cht4d:IH=>F<G:=+D>J%BP_r:Eb/a!
D/Ej%A7]9oFD,*)+F.mJ%16feF*(i,C`mh5AKZ#)CghEsA0>;kA8c?.8l%iC:IA,V78?f7+A,Et
6r-0M9gqfV+:SZlDKBo.Ci"/8A7]jkBl%?k+AbHq+CoD#F_t]-FCB9*Df-\0DfQsm:IHfX%13OO
7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z-,-qS;gD]hAhFEDG=.4bo8
Ecl7BFD,5.Cggcq,"bX!+DbIq+A,Et+A$HmEc5K2@ruF'DB^2T+A,Et+DbIqF!+n3AKZ,5A7]d(
%172jAKXKSDImisC`mP&@N]/hFCf*'Ed98[8S0)jDfm15D]iq9F<GX9AKXT@6m-;S@WNZ.BleB-
A.8laDBO%7AKXZT@N]N!DKU"CF`V+:FD,5.9OVBQ@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od
@VfTuDf-\>BOr;Y:IH=%@:s-o@;]Tu7qm'9F^cJ%F?0j<+<V+#+<Ve?FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W_*$6UH6BQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9+<V+#+<Ve?FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=
FCfJGC2[WnDe!p,ASuTCE+EQkDdtG8De(J>A7c8X.1HW$@;]dkATMs.De*Bs@s)X"DKIWg:-pQU
D..<rAn?%*+D,P4+A,Et6r-0M9gqfV%15Hg:fL"^:-CWc8l%ht6uQRXD.RU,@<?4%DC5l#<^fnb
8P`)E3Zoe)/hnt5-OgDP:J=/F;E[&gB4YslEa`c;C2[WnDe!p,ASuT;%15p*5u^<L;GC(Q3[Z9a
$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16c_F*)>@
GqO2`F:ARrA7f@j@kVS8A1hh3Ado)dA7f@j@kU/kBl%<oDJ)R;6pY?oDf0VKE+EPi$?0NfA8bs2
8l%iAATMriEa`I"Bk(^q9OVB_E+EPi$?0NfA8bs28l%iHDKKo;A9DC(Bl@l_@:Cj.A7c8XE+EQk
DdtFm:IIlb@WQ7$8p,)uFCfJFE+EPi$?0NfA8bs28l%iRDfp)1AOCBHAOLZXE)U7eBlJ089OVB_
E+EPi$?0NfA8bs2<HDklB1brf6=FA>F`9i^F=qNCAdo)dA7f@j@kUi'Bl7QU:IJ)lB6A$!E^b4l
Eb0<5Bl@m1/oY?5%17&bAn5gi03*(-DJ)R[A8Gt%ATD4$AM.q4Ado(r%16!%9LV6G76N[S-RT?1
6q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuq
De!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRXD.RU,+CT)-D]iP.DKK<$DK?q>A7cs-
ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt
:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA%16ih@<?0*-[oK7A8c@,05"j6ATD3q
05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8
BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%13OO9OUn3=<M-m@s)X"
DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q%13OOBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFpC1K=b5\FqBBl#D3Df#pj.1HW$@;]dk
ATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M
@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5./hn^_$:[fb6q(!:3[\QODImisCbKOA
A92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("
@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16igA7T7p/no'A%16igA1hS2Et&J!FD5Q4
/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%
ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7
BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,ATME*
A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7
F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1
ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)
A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^
+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)
F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-
Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@ltEbT*++Ceht+C\n)F(KG9F`8I;DBO%F
D]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b+<Z,AA7TUrF"_0;DImisCbKOAA92[3
EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6
+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*
+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?YA7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!
:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%AS5q%GqL42AfuA;FU\[#+<Y35+Du+>
+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86
+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`
+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^
0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K".1HW$H"q8.E,ol/
Bl%?90ht%f.W'HGDe*g-De<^"AKZ%G/KenU+A,Et+Co1rFD5Z2@<-W9E,ol/Bl%?5%15is/e&._
67sBHDBNM8@;Tt"AKXT@6m-GhDe<^"AKZ&(EbTK7/g+)$G%De<BPDN1F(96)E-*4:D@HqJ67r]S
:-pQUIUQbtDf0VLB4YslEa`c;C2[W9%15is/e&._67sC)Bln#2FD,5.DIIBn+DPh*E,ol/Bl%?5
Bkh\u$;No?%15is/g+,,BlbD<@rc:&F<D]?F!)T:G\(B-FCeu*+CSl(ATAo%Cht5)Bk)7!Df0!(
Gp"5J@VTIaFE8R<@<Q2k$;No?+C\nnDBNG0ART[lA1eurF<D]9@;[21@V$[)F(Jl)+EVNE+EM+9
+E_WG+F.mJEZen(AmoguF<D\u:IGX!:-pQUGAhM;Bl7Q+ASu[*Ec5i4ASuTB%15is/e&._67sB^
5uLHL:.I>f6uO2cDfd+4E-#T4+=C&U;ajY[7403lAftr/Eb-A8BOPd$Df0,/+A,Et+EV%5CER>4
%15is/g+S4FD5o0/g*_t+E).6Gp%$CAKZ)'F))n4F!+n$FD5o0+AtX,78uuM-Z^DLEb0E*DKI"0
DJjB<Bl7Pm$;No?+CT),ART+p+E)41DBL'=ATMp$B4Z-,FD,*)+D,Y*EHPi1FDQ4FEb0<7Cige3
Ec5e;AoD^&ATW$.DJ'Cc:-pQUFDi:3Ci=B++Co1rFD5Z2@<-'nF!,UEDf-\/G\M86DJ((a/e&._
67r]S:-pQU:2b5c+EVNE+A*beAThX$DfB9.F"SS$+EM4=FC]<6DBO"3DKKH-@q?c2@3BB#DIjq5
De:+a+<Yc>AISuA67sBpDKKH1E,oN3DfQsCAU%crF`_29+<Y-)AoD^$+<VeKATDX%DIIX$DJ(C@
+EqaHCh+Y2@V$Z)G%G]>%15is/g,:XAS-($/e&._67r]S:-pQU@<H[*DfRl]8oJB\+@Ih)6=FY@
EX`@N67sBlD..-p3ZoPS@;BFpC1K=b5\FqBBl#D3Df#pj%15is/g,4HF<Gd@Blmo/F)YPtAKYr4
ATMF'G%#K,Df-\9D@Hq5+Z_G7+BosC%13OO:-pQUD/!m%D09\<E,oZ1F<GOCARfFqBl@l3FDi:C
BQ&);H$O[\D/Efo+Cno&ATJtBF(Jo*C2[WkB4WM$$997j0ejeT+?0f;%15is/g,4HF<G=<F<GdA
DId[0F!+t2DKB`4AKZ&.H=\3N+CTD7Df&p)Bk&8tDfQt:Bl8'<05Y--055?G%15IHBO>L]4ZX]?
2D?7/1^sd$$;No?+CoC5DJsV>Eb0<'F<G:0+F.mJ+CT;%+EDUBDJ=!$+Dl%;AKZ).@;[3+DIjq_
:IH=>DKBo.DI[5e$;No?+Dl7;FD5]1AKXT@6m-2]F*(i.@qB^(@<,p%E+O',BlnH.A0>?(F<GI>
F<GU8@rH4$ASu$iA.8lVE-#T4+=C&U;ajY[74/NO%15is/g*b^6m-2]FCfK)@:NjkCi<flCh4_@
+=Lr=De(:>BlbD*+D5V2A0>i-@:NjkAoD]4@:UKoDdsn^:IH=6A7TUrEt&IdDe!TlF)rHOBkhQs
-OgCl$;No?+E)F7EcPl)AKXE06VgHU:J=2"/Kf+GF<DuH@rH7+Deru;AU%c8+D#(tFDl1B/Kf1W
AKYT-Cht55@<?/l$;No?+APL&:c]_/F`MM6DKK]?+@S[c:JOha9LU(<F!,[@DId[0F!,C=Cj@-T
+EM+*+Eh=:@N[(1F=A=A$:R?M:JOha9LW;sC2[X*FD5Pu4ZX]5,%EZ=:i^JeEa`f-7VQ[MF'MFR
@rcL/De=)6<`:,.De*Ea@rGmh/nK9=+t!g,:-pQU779L=:/aq^7:0J<De+!4Bl%->3Zodo@ldjk
Ec5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO:-pQU-u!F7A18X4
EcQ)=0-G+CF)tc&AKZ)+G]XB%78d#T8l%i/0KhH>-Y%:>Eb0-1+D5_5F`8I@@;TQu-u*[2B4#@f
De*3(+Du+>+EM+9-OgDO;Gp(Y:IHlk4ZX]5@s)g4ASuT4F*22=AKYl!D.Oh<C2[X(?YO7nA7$c.
DJsV>F(KG@%15m(8P2cH0JGXN+<W%LD]in*FCSuqF!hD(%15is/g+S5A0>DoCh7^"+E(_(ARfh'
+D,Y4D'3>2EcP`/F<G4:Dfp"ADfQt1F`MM6DKI"BF_Pr/%16NV4ZX]A+?CW!%16f]/g,@LG[Flo
De*2t4==l^A7m84A8a(CC2[Wq+CSekB6%r6Gp$[7F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0HaqE
A1e;u.1HVmF$2Q,1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*o:+CoCC+=LuCA90gg.3N&0A7oq%
+F,)@Cia/?+DPFuEcPMqC2[Wi+@T1+8P2cH0JO\]DIb@/$7QDkA7n%d+>Y-$+>=63BkAt?G@c#+
@;9^k?Q_HYC2[Wq-Qlr</g+nIA7m#qASc""E$0EKAScF!/g+n>ATDfu@;9^k?Q_d8;FsJV6ng;;
ASu$2%14Nn$=n3@3Zp4$3Zp*c$>F*)+EqCA?X[\fA7$HA-YdR1F!i)@D_<.\C2[X(4#8<.A7]Ri
Ec<.H+D#A1AM,*?A7]e%?X[\fA7$HJ;Gp(Y:IHlk+D#G$/g(T1.1HV,+<V+#:-pQUEb/ioEb0,u
ARlp-DfTB0+Du+>+DG^9@s)g4ASuT4B6%p5E"*.lGWe)11E\_$0F\A'AhG2X/pClO?X[\fA7$HA
-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P+D#G$/e&/%AhG38@:XCg?X[\f
A7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%14LlCi"-'Aof(;I4cXTDCH\[/g+eE
%14Nn$6UH6%15is/g,@VEb'56Bl5&'F`MM6DKI"6Ec6)>+E_a>DJ()#+EqaEA.8lgB0A9u1E\_$
0F\A'AhG2X/pClO?X[\fA7$HA-YdR1B."g4D_</IA7]e%?X[\fA7$HJ;Gp(Y:IHlj+ED%8F`M@P
+D#G$/e&/%AhG38@:XCg?X[\fA7$HlDETTpB6%r6C2[Wq+CoCC+D5R7Eb0?8Ec*KPASu$2%17A'
F`V,)@X0)E/g+eE%14Nn$6UH6%15is/g+e<DImisFCcS)F`MM6DKI"6Ec6)>+CT.u+ELt7AKYf-
@:UL%@rc:&F:ARuB0A9u1E\_$0F\A'AhG3MAU%QjC2[Wi+?V#dDe*K.+CoCC+Dkq9+DPh*B-:c%
F(HsHC1LmrEaN6iDe*2t78d#T8l%i/0d(%FA1eu6$7QDk%15is/g,7SE$-QJF`\a:Bk)7!Df0!(
Gpsk[DfTB0/0JSGDfp#?/0K"VBlmp-+DG^9Eb0E.F(oQ1+E):2ATA4eFE]l/+ED%:D[d%qB0A9u
1+%$QG&IfsFE9T++>Y?bAThu$$4R>;67sC$F`&=D@<H[1Ci<s3+CT=6E,8rsDKKH2F<E.XA8c%#
+Du+>+EMXCE$0(:+Du+8H=_,8+ED%7F_l/@%17,t4ZX]@-?=3M%13OO:-pQUEcl7BFCfN8+EM75
ASuU+Gp"[]Df0B:+E)CEE-68D+EqL-F<G^IATAo7ATVu&$?C,L3Zp.(EccC4$4R>;67sC$F`&==
@:O=r+EM75ASuU+Gp"[]GA1l0+EM47G9CIAE,95uF<GXADfp/@F`\'"EcXB)+>G3`D%-g]$;No?
+EM47Ec`F;ASc<.AoD]4B6%p5E-![RF_Pr/Et&IiB0A9u><3m?CiF9.+BplLI4cXTEc;HpBQH<t
+>G!PCiF9.+BplLI4cWu+D5_6+C,E`%15is/g,4KDfTqBBOu"!+E)-?E-67FDdmHm@ruc7Bl5&6
AThd/ARlp%Eb&a%+D,Y4D'3>,A7[e2$;No?+<VdL+D>d<1a!o967sBt@:O=r%15is/g)8Z+<Y?<
+>P&^:-pQUB6%p5E,uHq:-pQU+>GPmBQ>4L+<XEG/g+t=F*&OHASrW7DfTB0%16ch4ZX]A+?CW!
%16f]/g+V3A9)0e@;9^k?QaPU/g,E^Eb0E4+=ANZA8a(CG9Cp;FEMVA/g+_CA1e;uGp$d:E,KJ7
I4cXd%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F,)MAThu7-RU$ID_</V+ED%8F`M@P+D#G$/e&/5
+D>S1DJUG?+F>^`I4cXd%14Nn$4R>;67sC%ARTUhBHVA0DfTqBBOu"!+D,P4+EMXFBl7Q+@;]Tu
Ch[s4+DkP/@q]RoB-;D:Eb'5#$;No?+<VdL+D>h;+=D5AAKYf-DJ(=>+<XEG/g,4H@<,jk+EqaE
A0>r,DfTqBFCf]=+:SZQ67sB'1*@]QF)rHOF(Jo*Ci=3(-QjNS:-pQUF(Jd#@qZutEc6)>+EM47
Ec`FGAU&;+$;No?+<WK`+D>h;+=D,HF*&cP+<VdL+<XEG/g,4H@<,jk+DkOsEc3(ABQ%p5+EV1>
F<D#"BQJ5X3Zp4$3Zp*c$8<T9F)rIL%15-*$>F*)+C\biEarHbC2[Wi+Eot$+F##>DJUFC-QjNS
A8a(CG9Cp;FEMVA/g+_CA1e;uA3DOfGT^[9E,KJ7I4cXd%16f]/g)i2,Bl:'+>G!&5^OVa+<VdL
+<VdL+<VdL+CoCC+E)%&@;9^k?Q`-;8P2cH0JFViATW'8DD!&CDIb@/$>F*)+>>r'F$2,u8M2,6
/38&*+=f&t+u)>O/g,?\A8a(CDei]gC2[Wi+AYX%8l%i/0HbCIFEMVA/g+_CA1e;uF!c5V-8%J)
A.8kp%13OO:-pQUF(oN)Ch4`*Bl7K)AU&01@;]LqBl@l3%15is/g)8Z+EM@1GT\AXDfTA9+<VdL
+<VdL+AP6U+EqaEA.8l@67sB'1a$jUAU#=FC2[X'AS5^uFCfJ?+<XEG/g,">@rcJs$;No?+<WB]
F)5E4+=D8EBleB-F*&cP+<VdL:-pQUFCfN8%17/mAU$@!+>Y-$+>=630HbFQAU#>C%15-*$>F*)
+C\bi@r,L\C2[Wi+EM?^/g,B]A8-+(+F,)?D_</RC`mb0FEMVA/g+_CA1e;u.!R:&.3NSPF<Gij
Anc:,FCT6+D.RU,?XHE$7!*?cCi^_?C^g_#%13OO:-pQUEb/lpDImisFCcS6F`\a:Bk)7!Df0!(
Gp%<LEb$;&Ec6#?+ED%*ATD@"@qB]j$?B]uAS+(d+>Y-$+>=63BkAt?@UWef@p`YZDe*2tE]l#t
Eb0E4+=ANZA8a(CEZfC6FEMVA/g+_CA1e;u-upjkF"&4VINU3p4"u"*0d(O#/heD\Ci<d(-9`Pm
4YD.8EX`@)%13OO:-pQUBOPdhGp$U5+CoD#+D>>&E+O'2%16Wa@rl.#4ZX]A+?CVm@ruNo@;9^k
?Q^aT0fq'N0KUX0:-pQ\-Rg0KDe!:!11+Bg<*s!):IK,1C*6eD/mg=U9L^RY/M9Cg-OgDnDe!m6
F?MZ-1E\_$-Y%77?X[\fA7$H-2DI9I4"r`D-RU8j+CoD#@rsJ5?WC'4?V4*^DdmH(>rsZG0d'.Z
/9rg"6W,9@$4R>;67sBkBle60@<iu5Dfoq?Df-\=@rc-lDBNA*A0>o(FEMVA+Du+?DBO+2Cis:u
$?Km!GApu3F$2Qi+BosC+Z_A*1(=R"$;No?+E27>FCAWpAKYH#GT^O;@<ZF'B-:\t@<,ddFCfK6
%17&mEcbf)@<-EP3a4Wf3?^FB+=AZi.k<,#.k<,t/LM`L+Boso%13OO:-pQUGA1r*Dg-7FCis6%
A76TjDf0W7Ch4_uDg3C8Eaa0+DJ()%BOPpi@ru:&Et&J#Bl7`s@q]:kF$2Qg3ZpF+3]A00@4lnU
0fCOr/ho(0,$uHs+C,E`%15is/g+_9BlkJ-Df'?"DIak!$:IZW<D>nW<'sGU9gMNB4ZX]5F(fK9
E+*g/+E2?D-RX7i:4@U=-RT?1%15is/g,1G@:UK-+Eqj?FCcS,Bl%@%%17,e@:VM^0d/S4-7E/-
4?tMI1GU:@5U\E33\W!3.1HW.EbTW,4ZY;@3\hg`?p$\,-o3V*5!UMP+Z_;+.1HW)ART+eDfoq\
3\qp?1-d6B+Z_>)-s^4C5V=H@1+#1M-o3#-0I\G".1HW.EbTW,DJsZ84ZXuq3Zp4%3\_a].3L#n
+Z_A$?!oc[/grM2-9a[C1Eee5.4H\g>n%,M$;No?+ED%%A0=i;66KfMCh[a#FCeu*FCAWpAKYT!
Ch7Z1/KeY6F*(u6+EV:*DBL?JART+kA18WQ+EM+*+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW)
ART+kA26;/><3lh4"akq-9`P#3I>0e.3L/g/j=_,><3lh4"akq+BplL-s[rH+=JWm0RI4\.3`+A
4Wo)4.3O$k+=JruHXSNU,$ucA-o!N)@4iuO/M;Jp0d/S4-7E/-4?tMI1GU:@5U\E33\W!3.1HUn
$;No?+Eqj?FCfM9FCAWpATJu&F!+FJ66KfMCh[a#FCeu*9L^.HATDX%DIIWuA0>u*G]Y&[+EM+*
+Dbt6B-:`'@s)X"DKI"8DBL?MFD5Q4.1HW.EbTW,FC[-i3aEjV0d/S5+C/A;5V=H@1+#1M-o3#-
0I\G"INViU+=LGT+=LM</0H>h0edr_/h%uO+?^io3[l2"/g)Ps0RI4\.3`+J+BplLI4dc5/3kU<
-7CDh0e#@9/M9::.P<AZ/g<#8-p8n)+=BE[.4H\p+<r![5U\$80RI4\.4-Go+u(N3>q%3F><3mT
/g<"m><3lg+u(2g3I>0e.4-T2,!%&'4t.UY%13OO:-pQUAn?'oBHUksBlkJ>AU&;MD.-ppDf[%0
DIakuF)u80Bjl*p+Cf>#AISugF?MZj+?L]YF:ARoF?MZj+?L]$2'QBM4!80X+<Ve%67sB1/p)>[
%16re4ZZjk4!6:5,$uHS+D5d=+<XEG/g)VrBkh\u$>j<:3aEji+>Pl"?Q_EQB657=+AP6U+=]!\
@<--oDg-(.$>jcG3aEji+>Y\q?Q_EQB657=+AP6U+=]!bEGQ'kD0S3)>p)3O1,:%\+?L]YF<D\K
:-pQU.P>gSGRXuh$;No?+F\HSATBGGASlB/DdmHm@rri8AU&;>/KeS8AmoguF<G<@F(96)E-)Nr
Df\'&+=Cl<F!i:[3ZpI+-sJ_TC2dU'BHS[OF`V,706CcBE%`R]/0H>g+=A9`/q+pK.3L/a-S?bh
/0H;_-QjunINViD%143e$;No?+ED%%A0>u*G]Y'?Ec5e;C*7Y?ATAo8ASlB/A8-'q@ruX0Gmt*q
F?MZh3ZrHS@:UL!Et&I!%15is/g)9QDdd0!C*7S-EbTK7+D,Y4D'3R9F`V,7+EV13E"*.hCcsg%
-nlf*0I]8%F:AQd$;No?+Dbt)A0>V0F(96)E-*47Ec5e;@rH6sBkMR/ARlou+E1b2BFP;`E'66)
><3l\+Z_;"><3lh+DPk(FD)*j%15is/g,%SD.7's+E(j7DdmHm@ruc7/Kf1WARlomGp%9=EbTH7
F!)lRFD5Q4.3NJ9@rcL/+=M;FH=_&<F=\PCB4Z%)F=\Oe/hSRqBkAK,Eb0<'DKH<p:/=2T4ZX]?
0F\?u$;No?+E_a:A0>?,+EMI<AKYhu@rcL/3ZqKp78cQ?9h@K/+?M8"HQYC2-YRF8AKZ28Ebce>
ATMr@%160-78cQ?9h@K/+=Ci@D.P(($4R>;67sBkF_u(?A9)C-AKWQIF`V,)+C]U=.!9WGCi_$J
D.-ppD]gH=F_u):F`]&TBkAK,Eb0<'DKH<p:-pQU6rcrX=%Q.T;H>qA+=Ch`-OgCl$;No?+CoV3
E$0+.FD,_</Kf1WARlomGp"MXFD5Q4.3NJ9@rcK1-tII;E,]rA.3N>:+E2@4F(K62%15is/g*P^
9i+YP<(K/5+=AgWDe(M9De*C$D/aPL-OgDX67sBK<D?:d;H?U[<(K/5+=AgWDe(M9De*g-G%>`4
E-!Z[%13OO:-pQU@r,^bEZen,@ruF'DIIR"ATJtG+E_a:A0>?,+=MASBl%i>+DkOsEc3'K@r,^b
Ec?/C.3N>:+E2@4F(K62%15is/g*MT76sgD6qKaE4ZX]I3[Z9a$4R>;67sC%ATT&'+E2@4An?"'
ARlp&@;]Uo@j#]-+EV:2F!,=.@q]RoAKWQIF`V,)+C]U=-u*[2Ch\!&Eaa'$.1HVZ67sBW;FO&D
;GoqO:dIiE:I@9++=BN;>ZGiVEcYJuASuO&@kMnFATD$AE,\3RFCAEJDe!3l>YnjHA8bs_E+*Wp
Ddt.($4R>;67sBQ:IH=KATD7$+EVmJBk(RfCj@.DF`&=6Ec5e;FD,5.@UX=h+Dbt+@;KKt%16T`
@s)g4ASuT4-XpM*AL@oo%15is/g+_M@;Tt"ATJu4Afs]A6m-P^F)u&6DBO"B@<-H4F`;CE/Kf+J
Dg-73$;No?+D>\;+EVNEDfB9*+Co1rFD5Z2@<-'nF!+n/A0>T(G&M/-+E2@>C1Ums+DkOsEc6".
$4R>;67sC%ATT&;E$/Y5EcP`/F<GOCDe`inF<Dtd+EM[EE,oN2F!+%M/0HVhDfQt3Ch[EkA0>Ds
F)Yr(Gps10:-pQU0d(LR+=D,KC3+67B4t^`CM@[!-QlV9F)>i<FDuAE+E(d54$"a1D09K%ATf2;
D09J6F`_>6F!i)7+>Y-YA0<6I%15is/g)kkEbupHE,o]1AT0">>9Iip+=D#;E$lc4+>Y-YA0<6I
%13OOE,o].De(UX:-pQ_E,o].De'u3/M/)[De'u0Ec5](@rri7ATW'6/e&._67r]S:-pQU@<H[*
DfRl]+A-QcDBM>"+@9LPATAn9%15is/g+YEART[lA3(i3AT2a&D.7's+>PW)2[p*h67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+%15is/g)i,De!lD2]uO>A7]9oH=gl-ATJ:f:-pQU0K<u\F>5Km@:Wn[A0=0:6V0j/
2'?FPD/aP*$;No?+>>cn@rsF^+DG_7ATDm(A0=0:6V0j/2'?sOFED57B-:o+FDi::De*BiFs(O<
A0?#:Bl%i5E+*cqD.Rg#EcVZs:-pQU0f`cU@k]e`Eb0H8BlnH.DBNP0EZdss3A*!?+:SZQ67sB9
0Q(fP1,^7`A867.FCeu*AoD]48g$,H0JXa[$;No?+>PccAR[>J+CSeqF`VY9A0>K&EZdss3A*0D
%15is/g)o+An>F*3$9VaDe*BiFt"PPDBMkD<^fSS79Eo2C2[Wi%13OO@Us1_F'iWrDe*3<3ZpLF
-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p+DPh*+E_d?Ci^sH%17#a+C\kq@rl!k
C2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`
A.8l\De*KfBkhQs?TgFm-YdR1-OgCl$;No?+CfP7Eb0-1+EqaECM@[!+EM[>FCcRH+EVg=@;?uo
F!,@3ARo@_%16igA92*lC2[Wi4ZX]5C2[X(D/X3$FCfN8F!hD(%16$"<^fSS79Eo2C2[Wi4ZX]I
3[\Z\A7T7p-OgCl$;No?+Dbt)A0?#9AS-($+E_d?Ci^_5DKKe>-u!F7A17rp:-pQU-Y[=6A1&L4
ATT&C/g+eIE$-N@Ec>N)@<6L4FD5Q4-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]/AU&;E%15is
/g)NUC2[W1+D58-+FPjbB6%r6-Y-e4BPDR"C3*m*BlJ/A%14IsC2[W1+D58-Ed/]g3[\NPEZf(.
@j`B.$4R>;67sC"F`]9]Eb/i*/KebFF(KB6F!,=<A8,XiARloU:IH=LDfTB0+DG^9DdmHm@rri0
De!3lAISu7:IA,V78?fL:JFPL:./H'C2[Wi+?_b.-nlc)+>>5R$?L'&F`_SFF<GOC+=DMb:4@U=
%16Ze@<6!&-[U;;IXNRQ$7I91-S0"NA7o7`C2[Wi.3N87F<DrXISP??-OgD3%13OO:-pQUF(KG9
8l%htF`V,7+DYP6F!*%WEb065Bl[d++A*bsASc9nA0>u4+CSc%Bm*p,AISufD/XQ=E-67F-ZsKA
E_BthF!,L7F(KG@%14M*Db*Z&<$47FHTE9#+>G!XBk(p$1a$FBF<DrGDe*g-C/o=dEbf63F!iCZ
GB.D>AKY`,@<?0*-[oQDDJ!Tq06M>IEbf63F"Us7B."f2$?L'&F`_SFF<Dr':IH=EEc5](@rri7
ATW'6-OgE/H?s=EA8PahDI7KsGVV$#+AH9YDBMPI6m*n(H?s=EA8PahDD$$BGUXbO@<?(*+D,>(
AM,)7$7-,g,p5fU6m-PhF`Lu'+DGm>@rH4'Df]K#+E(j7@3BH1D.7's+E(j7@r,RpF(KDF+B3#g
Et&I&+D,>(AKYE&F(K2tCh7Z18l%ht@r,RpF(KD8@;]TuAU&04F(o`7Ed8dE@<?($Bjkfe$7-g/
DKKe>@3BW*DJ*cs+EMIDEarZ'@rGmh+CoD#F_t]-F=n"0,n12-+Cf>,E+s-&DJ()6BPDN1Anc'm
+ED%5F_Pl-F!,F4Ao(mtAU#aKG\(]"FCf\+$7-,g,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14C(
+<YN0CLq3tA7^!.H?smPDe*]nBl4@e,p4<QE+EQs@<?(*+<YuVH>7A/D..-r%14C(+<YW6Ao(mt
AU#=?H?smPDe*]nBl4@e,n12-+CT).ATDZsFD5o0Cj?Hs,n12-+<VeCF^])pFCf\>+F8?[C2[X"
@;0Tg$7-f;+DkP&ASH$mAU#>DH?s=EA8PahD@Hq!+<VeCF^])pFCf\>+F8?[C2[X"@;0Tg$7-f;
+Dc1/CghEsGT\,TH?s=EA8PahD@Hp^$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO
>[_bsBQ%p<8oJB\+@Ih)6=FY@Ed\B(>]a\%Ch7ruFCf]=FEDjSIXWMbATDj+Df-eKINot-:IKUR
;f?f!@q?cMDe*E%>[/CVAoDU0DJsW.F(or3+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr
3B8a-De(MCEb/f8D..L-ATBG=De*QsF+%;2DfT]'Cia<:AUP!p%14C(@rH4$@;]Us+D,P4+CSeq
F`VY=DJ()&BleB)DI[5e$7-g(ATW--ASrW#DesQ5DK?q/DIal(DKBB0FD5W*+CQC5F_kUu$=%X`
FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%16?]ATVa"DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;
$=%[sDe!^%F_u"*$4R>I@V'1dDL5o4@s)X"DKL:9$4R>ID..3kFD5i5AISuOFCAWpAT)0jDf0Z.
DKKq/$=%LeARfXpF_u"*$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8cX*ATobKAU&V4$4R>IDIn$2
@:s-\$=%:_E-68LH?s=EA8c?<FCf]F%13OO>]++sE+*Bj%16?SDK'`?H[:!QDe(JBAU&V4$4R>I
DIn$2@:s-\$=%:_E-68LH?s=EA92j2Eb-kFAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA7TUf
/p(ZLI16Mm$=%I[GApu'AISuOBl7m4FF/=[C2[X"@;BF,FCf]F%13OO>]++sE+*Bj%16?SDK'`?
H[:!QDe+!4Bl#DDAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA9;a.Ci_4NAU&V4$4R=g>]++s
E+*Bj%14CdDf0,rDesQ5D@Hq!>\S(pF`_tZ,CX9GDfp#J,CX-@A7[B8AU&V4$4R>IDIn$2@:s-\
$=%O`@;^1*D0'8uFD5Z2%16?KA7T1gDKKH-FE;84DIn0:De"3BF(Jj'Bl@m;HX(Z(G]\%LHTaE<
+A$H]AU&V4$=%OjBl8$,DId='%13OO>\.e`HXq&)F_t]-FF=T*                        ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekR/0f^@3+>G_r1,pC30H`/-+>P_q1,0n+2BXb5+>G\q2`)X30d&A6+>PVn1,g=10H`,1+>GYp
1H$@20d&50+?1K!3?U%5+>Z##0ea_*1*A;++>Pr"0f^@31a"M3+>Ykt0esk,2'=e"0fL401a"Y6
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
C2[X%@:O._DBNe)DJ<]oF*&O:DfQsm:IH=6A7TUrD..<rAn?%*C2[WnDe!p,ASuU,@;]dkATMr9
AoD]48l%iC:IA,V78?g!@;]dkATMs.De*p-F`Lu'E+*6n@;[3)@;]dkATMr9AoD]48l%iR:K::[
73H#LA8c@&H"q8.E,ol/Bl%?TGp#^T6m-#S@ruF'DIIR2+E2@>Anc'mE,o].De*U$A0>i3De`in
F<GX9FEMPKH?s=EA8PahDI7KsG]I_@F<GC.FCf\>Anc'm+D,P4+Cf>,E,9*-AKY`+A0>r3F`Lu'
+Dbb5FD5W*+CoD#F_t]-F8                                                    ~>
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
zz=:zz,'e''),<<;._1 '' jodtester TESTYAMMER assert ereopen hfd hostsep iscf r'
zz=:zz,'mroot showpass testenvironment yyyymondd''                          '
zz=:6942{.zz
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
zz=:zz,' mnlSmokeArgs00 newdSmokeBadArguments00 odSmoke00 odSmokeArgFail00 '
zz=:zz,'restdSmoke00 rxsBadSmoke00 rxsSmoke00 rxsgetSmoke00''               '
zz=:387{.zz
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
