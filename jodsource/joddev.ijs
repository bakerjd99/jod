NB. JOD dictionary dump: 11 Dec 2021 15:48:52
NB. Generated with JOD version; 1.0.22 - dev; 31; 11 Dec 2021 15:33:34
NB. J version: j903/j64avx/windows/beta-w/commercial/www.jsoftware.com/2021-12-05T18:28:44/clang-13-0-0/SLEEF=1
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


DDEFESCS=:;:'{{}})'

DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.

IFACEWORDSjodliterate=:<;._1 ' THISPANDOC formifacetex grplit ifacesection ifc setjodliterate uwlatexfrwords wordlit'

IzJODinterface=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODinterfaceSTANDARD=:<;._1 ' abv bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODtoolsSTANDARD=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.22';32;'11 Dec 2021 15:48:35'

JODVMD=:'1.0.22';32;'11 Dec 2021 15:48:27'

OK0256=:'jod.pdf not installed - use pacman to install the addon general/joddocument'

ROOTWORDSjodliterate=:<;._1 ' DEFAULTPANDOC IFACEWORDSjodliterate ROOTWORDSjodliterate grplit setjodliterate wordlit'

WRAPPREFIXTEX=:'\RegionMarkerTok{)}\KeywordTok{=.}\RegionMarkerTok{)}\KeywordTok{=.}'

jodliterateVMD=:'0.9.98';7;'11 Dec 2021 13:01:55 MT'

jodliterate_hashdateurl=:<;._1 '|d844e2046e7554be6ab44f985f5be93e27614224cd172852a00012dfa53829d6|11 Dec 2021 13:01:55 MT|https://github.com/bakerjd99/jacks/blob/master/jodliterate/jodliterate.ijs'

jodliterate_root=:'C:/jod/'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


abv=:3 : 0

NB.*abv v-- all backup version names.
NB.
NB. Returns all  valid backup  names  matching  name prefix  (y).
NB. Names are listed from most recent backups to older backups.
NB.
NB. monad:  (paRc ; blclBNames) =. abv zl|clPfx
NB.
NB.   abv 'ch'  NB. all words in all backups starting with 'ch'
NB.   abv ''    NB. all words in all backups
NB.
NB. dyad:   (paRc ; blclBNames) =. il abv zl|clPfx
NB.
NB.   2 abv 'jod'  NB. all group names in all backups starting with 'jod'
NB.   4 abv ''     NB. all macros in all backups

0 abv y NB. word default
:
if. badcl y do. jderr ERR002 return. end. NB. errmsg: invalid name(s)
if. (1 < #,x) +. badil x do. jderr ERR001 return. end. NB. errmsg: invalid option(s)
if. -.isempty y do. if. badrc uv=. checknames y do. uv return. else. y=. rv uv end. end.
if. badrc uv=. x bnl '.' do. uv return. else. bn=. }.uv end.

NB. names matching prefix in all backups
pfx=. (<a:) -.&.>~ }.@(x&bnl)&.> (<y) ,&.> bn
b=. 0 < #&> pfx

NB. return backup names from most recent to older backups
ok \:~ ;<"1@;"1&.> (b # pfx) ,"0&.> <"0 b # bn
)

createmast=:3 : 0

NB.*createmast v-- creates the dictionary master file.
NB.
NB. The master  file holds the  master  dictionary directory  and
NB. dictionary parameters.  The master  file  tracks the state of
NB. dictionaries.  In  this  system  only  one task  can  open  a
NB. dictionary read/write. When opening a  dictionary  the master
NB. file is  checked  to determine if  the  dictionary  has  been
NB. opened read/write by another task. Dictionaries can be opened
NB. read/only by any number of tasks.
NB.
NB. monad:  createmast clFile
NB.
NB.   createmast_ajod_  JMASTER_ajod_  NB. recreate master

fn=.  hostsep y
if. IFWIN do.
  syp=. PATHDEL ,~ (justdrv , ':'"_ , justpath) fn
else.
  syp=. PATHDEL ,~ justpath fn
end.

if. badappend jcreate fn do.
  jderr ERR011 NB. errmsg: error(s) creating dictionary master file
  return.
end.

fn=. jopen_jfiles_ fn
cn=. (<0;now '') jappend fn     NB. c0 use bit and last change
'jodversion jodbuildcnt'=. 2{.JODVMD
cn=. cn, (<jodversion;jodbuildcnt,didnum 0) jappend fn  NB. c1 version, build #, unique id
cn=. cn, (4 0$'') jappend fn    NB. c2 dictionary directory
cn=. cn, (4 0$'') jappend fn    NB. c3 directory backup
cn=. cn, (3#<'') jappend fn     NB. c4,c5,c6 RESERVED

NB. parse parameter settings --- sets (MASTERPARMS)
try.
  0!:0 <syp,PARMFILE
  parms=. <dptable MASTERPARMS    NB. created by 0!:0 !(*)=. MASTERPARMS
catchd.
  jclose_jfiles_ fn
  (jderr ERR027),<syp,PARMFILE return.
end.

cn=. cn, parms jappend fn       NB. c7 active dictionary parameters
cn=. cn, parms jappend fn       NB. c8 active parameter backup
cn=. cn, parms jappend fn       NB. c9 default parameters
cn=. cn, (i.0) jappend fn       NB. c10 dictionary log
jclose_jfiles_ fn
if. 0 > <./cn do.
  jderr ERR011
else.
  ok {: cn  NB. return last component
end.
)

ddefescmask=:3 : 0

NB.*ddefescmask v-- direct definition escape token mask.
NB.
NB. Returns  a  bit mask  of direct  definition )? tokens.  These
NB. tokens  would  be  seen  as globals  if passed  to  JOD  name
NB. analysis verbs.
NB.
NB. monad:  pl =. ddefescmask blclJTokens
NB.
NB.   toks=. 3 pick parsecode__MK__JODobj jcr__JODobj 'ddef00_base_'
NB.   toks #~ -.ddefescmask toks  NB. escape tokens

p=. >:I. (0{DDEFESCS)=y      NB. first token after ddef starts
b=. (2{DDEFESCS) e.~ p{y     NB. ddef )? escapes
0 ((b # p),b # >:p)} (#y)#1  NB. escape token mask
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
  
  NB. J6 no longer supported 
  NB. if. */ wex ;:'IFJ6 IFWIN'  do. 
  NB.  if. IFJ6 * IFWIN do. smopen_jijs_ file return. end. NB. J 6.0x win systems
  NB. end. 
  
  if. IFQT do. open file  NB. jqt ide

  elseif. IFJHS do. 
    NB. show edit command in JHS to remind users to adjust
    NB. browser pop ups and keep a handy recall line
    0 0$(1!:2&2) 'edit_jhs_ ',(quote file), '  NB. allow browser pop ups'
    edit_jhs_ file  

  NB. running in jconsole on Windows systems 
  NB. WARNING: there is no indication of fork failures 
  NB. testing the existence of (EDCONSOLE) and the alleged
  NB. (file) for every edit operation would slow down normal use
  elseif. IFWIN *. IFJHS +: IFQT do. fork_jtask_ EDCONSOLE,' ',file

  NB. remaining editors are marginal, deprecated or rarely used with JOD
  
  NB. iPhone/iPad  
  elseif. IFIOS do. je_z_ file     
  
  NB. GTK systems are deprecated and no longer supported
  NB. elseif. wex <'IFGTK' do.
  NB.  if. IFGTK do. open_jgtk_ file  else. jderr ERR0255 end. NB. GTK 

  elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
  end. 
 
catch. jderr ERR0255  NB. errmsg: unable to open TEMP/*.ijs for editing
end.
)

firstperiod=:3 : 0

NB.*firstperiod v-- returns the index of first sentence period.
NB.
NB. monad:  firstperiod cl

NB. first period in at most 500 chars
y=. (500<.#y){.y

NB. inflected names have been long deprecated in J
NB. there is no need to mask them in later code 
NB. args=. ;&.> , { (<<"0' ([{'),<;:'m. n. x. y. u. v. *.'
NB. y=.' ' (I. _2  (|. !. 0) +./ args E.&> <y)} y

NB. first period
y i. '.'
)

flipQtwraps=:3 : 0

NB.*flipQtwraps v-- adjust tokens within quoted latex.
NB.
NB. This verb scans wrapped latex and marks quoted text. The mark
NB. crosses wrap breaks. Tokens within strings are set to string.
NB.
NB. monad:  clNeTex =. flipQtwraps clTex

NB. scan text and mark quotes
b=. ~:/\ TEXTQUOTESINGLE E. y

NB. index table marking start and end of quotes
t=. (I. firstones b) ,. (I. lastones b) + >:#TEXTQUOTESINGLE

NB. split into quoted and normal
c=. (1 p} 0 #~ #y) <;.1 y [ p=. 0,,t

NB. flip tokens in quotes
q=. p i. 0 {"1 t
;((STRINGTTOKPFX;ALERTTOKPFX)&replacetoks&.> q{c) q} c
)

jodhelp=:3 : 0

NB.*jodhelp v-- display PDF JOD help.
NB.
NB. monad:  jodhelp uuIgnore
NB.
NB.   jodhelp ''  NB. display JOD help - start PDF browsing 

jodpdf=. jpath '~addons/general/joddocument/pdfdoc/jod.pdf'
if. fex<jodpdf do.
  NB. jod.pdf is installed and local
  pdfrdr=. pdfreader 0
  if. UNAME-:'Darwin' do.
    NB. require 'task' !(*)=. shell
    ok OK0255 [ shell pdfrdr,' ',qt jodpdf NB. msg starting PDF reader
  elseif. fex<pdfrdr do.
    NB. spawn PDF browse task - requires configured PDF reader on host
    ok OK0255 [ jodfork pdfrdr;jodpdf
  elseif.do.
    (jderr ERR0260),<pdfrdr NB. errmsg: PDF reader not found
  end.
else.
  NB. jod.pdf is not installed advise user to download joddocument addon
  ok OK0256 NB. msg: jod.pdf not installed - use pacman to install the addon general/joddocument
end.
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

NB. allow older system to run but nag the user to upgrade
if. jvn < 801 do.
  0 0 $ (1!:2&2) 'WARNING: JOD works best with current J 8.0x-9.0x systems - upgrade!'
end.

sp=. ] [ 1!:2&2
if. jvn < 602 do.
  NB. J's before 6.02 are beyond the pale
  msg=. 'JOD requires J 8.01 or later.'
  msg=. msg,LF, 'J is freely available at www.jsoftware.com'
  0 [ sp msg,LF, 'Download and install J 8.0x-9.0x and then reinstall JOD.'
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

markdfrwords=:3 : 0

NB.*markdfrwords v-- markdown text from word list.
NB.
NB. This verb takes a  blcl of JOD word names and returns a UTF-8
NB. encoded cl of  word source  code in markdown format. Markdown
NB. is  a simple but versatile  text markup format that is almost
NB. ideal for documenting program source code, see:
NB.
NB. http://daringfireball.net/projects/markdown/
NB.
NB. monad:  clMarkdown =. markdfrwords blclWords
NB.
NB.   markdfrwords ;:'go ahead mark us up'
NB.
NB.   NB. markdown text from JOD group words
NB.   mtxt=. markdfrwords }. grp 'jod'
NB.
NB. dyad: clMarkdown =. paWrap markdfrwords blclWords
NB.
NB.   mtxt=. 0 markdfrwords }. grp 'jod'  NB. suppress wrapping

1 markdfrwords y 
:
NB. require 'jod' !(*)=. WORD_ajod_ NVTABLE_ajod_ badrc_ajod_ get wttext__MK__JODobj
if. badrc_ajod_ src=. (WORD_ajod_,NVTABLE_ajod_) get y do. src return. end.

NB. commented source code (name,source) table.
if. badrc_ajod_ src=. 0 0 1 wttext__MK__JODobj >1{src do. src
else.
  src=. x&markgassign&.> {:"1 >1{src
  NB. similar to (markdj) but faster here
  utf8 ; (<LF,MARKDOWNHEAD,LF) ,&.> src ,&.> <LF,MARKDOWNTAIL,LF
end.
)

markgassign=:3 : 0

NB.*markgassign v-- mark j code for latex indexing.
NB.
NB. This  verb  tokenizes  j   code  and   replaces  all   global
NB. assignments with syntactically incorrect j strings that  will
NB. be transformed by pandoc into  easily located  latex  strings
NB. that will then be  converted by a post pandoc processor  into
NB. valid  latex  index commands. This works  because regex based
NB. pandoc coloring does not "understand" j's parsing rules.
NB.
NB. monad:  cl =. markgassign clJcode
NB.
NB.  jcode=. 'markgassign=:' , 5!:5 <'markgassign'
NB.  markgassign jcode
NB.
NB. dyad: cl =. paWrap markgassign clJcode
NB. 
NB.  0 markgassign jcode NB. suppress long line wrapping   

1 markgassign y
:
if. 0=#jcode=. y -. CR do. y return. end.
if. 1-:x do. jcode=. WRAPLIMIT wrapvrblong jcode end.
jtokens=. jtokenize jcode

NB. only interested in global assignment lines
if. #gix=. I. ; (<'=:') e. L: 1 jtokens do.
  jgl=. gix{jtokens
  jshp=. $jat=. >jgl
  jix=. I. jat = <'=:' [ jat=. ,jat
  NB. extract global assignments 
  NB. ignoring interleaving blanks
  jat2=. (jat -.&.> ' ') -. a:
  anames=. (<:I.(<'=:') -:&> jat2){jat2
  NB. (0{FAKETOKENS) and (1{FAKETOKENS) are invalid in j
  faketoks=. (0{FAKETOKENS) ,&.> anames ,&.> 1{FAKETOKENS
  jat=. <"1 jshp $ faketoks jix} jat
  jat=. (#&> jgl) {.&.> jat
  NB. adjust last LF
  (-LF={:y) }. ;;jat gix} jtokens
else.
  y
end.
)

parsecode=:3 : 0

NB.*parsecode v-- parses J word code.  Normal result  is a  three
NB. item boxed list of boxed lists containing declared  names and
NB. parsed tokens. Will return  an  error if  given syntactically
NB. invalid J code.
NB.
NB. monad:  parsecode cl|ctJcr
NB.
NB.   parsecode jcr 'wordname'

if. 0 e. $parsed=. tabit y do. ok'' return.
NB. possible quoted single line explicit
elseif. 1=#parsed do. parsed=. uqtsingle parsed
end.

NB. end with a blank and compute comment mask
parsed=. parsed ,"1 ' '
mask=. masknb parsed
locs=. gbls=. ''

NB. if any declared names extract them
if. 1 e. '(*)=' E. , parsed do.
  'locs gbls'=. mask opaqnames parsed
  olap=. locs -. locs -. gbls  NB. intersection
  NB. errmsg: confused declarations
  if. 0<# olap do. (jderr ERR0150),olap return. end.
end.

NB. blank comments, clear mask and remove blank rows
mask=. 0 [ parsed=. parsed jnb~ -. mask
parsed=. parsed #~ parsed +./ . ~: ' '
parsed=. (;: :: 0:)&.> <"1 parsed  NB. parse code
if. parsed e.~ <0 do.
  jderr ERR0151  NB. errmsg: word syntax
else.
  if. (0{DDEFESCS) e. parsed=. ;parsed do.
    NB. remove any direct definition escape tokens
    parsed=. parsed #~ ddefescmask parsed
  end.
  parsed=. ok(<gbls),(<locs),<parsed
end.
)

ppcodelatex=:3 : 0

NB.*ppcodelatex v-- post process generated source code latex.
NB.
NB. This verb applies final adjustments to generated LaTeX source
NB. code In particular it alters the syntax coloring of long J (0
NB. : 0) character nouns, long wrapped quoted 'long ....' strings
NB. and wrapped comment lines.
NB.
NB. monad:  clNewTeX =. ppcodelatex clTex

NB. adjust any 0 : 0 text
'idx strs'=. (LONGCHRBEGPAT;LONGCHRENDPAT) cutpatidx y
if. #idx do.
  lg0strs=. long0d0latex&.> idx{strs
  y=. ;lg0strs idx} strs
end.

NB. adjust any wrapped alert lines
if. ALERTTOKWRAP +./@E. y do.

  NB. all code lines and start/end table of wraps
  wrgx=. wraprgidx +./@(ALERTTOKWRAP&E.)&> rlns=. <;.2 tlf y  
 
  NB. classify wrapped lines: comment, quoted string
  cm=. {.&> (COMMENTTOKPFX,'NB.')&E. &.> (0 {"1 wrgx){rlns
  qm=. *./"1 +./@(TEXTQUOTESINGLE&E.) &> wrgx{rlns

  NB. comments override quotes and normals
  if. +./cm do.
    cx=. cm wraplix wrgx
    rlns=. ((COMMENTTOKPFX;ALERTTOKPFX)&replacetoks&.> cx{rlns) cx} rlns
    if. *./cm  do. ;rlns return. end. 
  end.

  NB. quoted text - works for simple forms
  NB. a general solution requires re-pandoc'ing
  NB. line breaking nouns - especially complex 
  NB. boxed arrays that mix strings and other types
  if. +./qm=.0 (I. cm)} qm do.
    qx=. qm wraplix wrgx
    y=. ;(wrapQtlatex&.> qx{rlns) qx} rlns
  end.

end.

y  NB. adjusted latex
)

ppcodelatex2=:3 : 0

NB.*ppcodelatex2 v-- post process generated source code latex.
NB.
NB. This verb applies final adjustments to generated LaTeX source
NB. code In particular it alters the syntax coloring of long J (0
NB. : 0) character nouns, long wrapped quoted 'long ....' strings
NB. and wrapped comment lines.
NB.
NB. monad:  clNewTeX =. ppcodelatex2 clTex

NB. adjust any 0 : 0 text
'idx strs'=. (LONGCHRBEGPAT;LONGCHRENDPAT) cutpatidx y
if. #idx do.
  lg0strs=. long0d0latex&.> idx{strs
  y=. ;lg0strs idx} strs
end.

NB. adjust any wrapped alert lines
if. ALERTTOKWRAP +./@E. y do.

  NB. all code lines and start/end table of wraps
  wrgx=. wraprgidx +./@(ALERTTOKWRAP&E.)&> rlns=. <;.2 tlf y  
 
  NB. comments override quotes and normals
  cm=. {.&> (COMMENTTOKPFX,'NB.')&E. &.> (0 {"1 wrgx){rlns
  if. +./cm do.
    cx=. cm wraplix wrgx
    rlns=. ((COMMENTTOKPFX;ALERTTOKPFX)&replacetoks&.> cx{rlns) cx} rlns
    if. *./cm  do. ;rlns return. end. 
  end.

  NB. normal and quoted text(s)
  if. +./qm=. 0 (I. cm)} 1 #~ #wrgx do.
    qx=. qm wraplix wrgx

    NB. remaining wrap blocks
    wb=. 1 (qx i.(-.cm) # 0{"1 wrgx)} 0 #~ #qx
    wx=. wb <;.1 qx [ wj=. wb <;.1 qx{rlns
   
    NB. quit if remaining code quote free
    if. 0 = +/wb=. +./@(TEXTQUOTESINGLE&E.) &> ;&.> wj do. ;rlns return. end.
    
    NB. remove blocks without quotes 
    wx=. wb # wx [ wj=. wb # wj

    NB. flip tokens in quotes and move to first position
    wj=. flipQtwraps&.> ;&.> wj
    rlns=. wj ({.&> wx)} rlns [ rlns=. (<'') (;wx)} rlns

    NB. adjusted latex
    y=. ;rlns
  end.

end.

y  NB. adjusted latex
)

usedby=:4 : 0

NB.*usedby  v--  returns  a list of words from (y)  that DIRECTLY
NB. call  words  on  (x). The  result of this verb depends on JOD
NB. dictionary references being up-to-date.
NB.
NB. dyad:  cl|blcl usedby blcl
NB.
NB.   'wordname' usedby }. dnl ''
NB.   ('word';'names') usedby }. revo ''
NB.
NB.   'putgs__ST' usedby }. dnl ''

NB. (uses) is expensive for large word lists.
if. badrc uv=.uses y do. uv
else.
  uv=. >{: uv
  wnames=. boxopen x

  NB. BUGFIX: 21sep10 - was not returning names like: EMCS_END_CHECK_sql
  NB. search object and locale references if _ occurs in any name
  NB. col=. >: +./ '_'&e.&> wnames
  NB. ok /:~ ({."1 uv) #~  ; (col {"1 uv) +./@e.&.> < wnames

  ok /:~ ({."1 uv) #~ +./"1 ;"1 (1 2 {"1 uv) +./@e.&.> <wnames
end.
)

uwlatexfrwords=:[: latexfrmarkd 0 markdfrwords ]

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:s61,g=2+?1K#2]sh1+?)/#1,0n-3?U%5+>u"u1,9t21*A;*+>u"u0fU:72]sh5+>P_q0eje,
0d&@s1,9t-0H`/.+>GYp2_cF2+>Pbr0ea_+1a"M-+>Ykt0eje-1*A;++>Yer2]sk0+>G\q1G^.2
+>kqt0esk,3$9q1+>Y\o3?U%9+>GSn1b^%,1*AD-+>t?#1a"M0+>toA6q'R6;aXJoBl[cpF<G+*
Anc-sFD5Z2+D#V(@;od#FDkr+DK?pP+E):2ATAo1@<?U&EcXWE6WHiL:/jqR;G/EUG:=YGA8--.
FCf]=+EV13E,8s)AKWQIF*)>@ARlotDBO%7BlbD/DfT\;FDi:@Eb0<'Ecu":ASkmfA7T7^+Cf>,
D.RU,F%Jhe6Ub'P;FFGuDe*ZuFCfK$FCf0(FCfK)@:NjkGAhM4F!,(5EZccFDe*ZuFCfK$FCcmD
B6%p5E(P@J:IJo7FCfK)@:NkYDfTD38l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ
+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s8l%ihDKKH1Amo1\;cH%X6pX^=F*(i.A79Lh+Cf>1AKXT@
6m-2]FCfK)@:Njk/Kf1WARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)
7!*?cCi`3E6rZrX9N*'JDKKH1Amo1\+>"^PDdd0fA0>T(FDi9MBkhQs.3L2bF(Jo*.!&sAC2[Ws
DKKH1Amo1\.7nhX:IK;CDesJn<'a8I5uL*lFCB&t@<,m$@rHC!+A,Et<)6:`;]odlFCfK)@:Njk
/Kf1WARlomGp"MVATV[*A8,q'ATDBk@q@)3A9Dp,DJ((a:IH=7F_PZ&8U=!)7!3TcDKKH1Amo1\
C2[X*FD5P6Bl8$(Eb8`iAKZ28Eb'5`:IJ/X:J=\f9ghTL6rZrX9N*'WATDj+Df.*KD..3k+CT.u
+Cno&AP,`d<_Yu*ATDj+Df.*KD..3k+CT.u+Cno&APu<"<*)jn6rRi=A8Gt%ATD4$ATD^-F<GdG
Eb'56AoD]4-u*[2Ch\!&Eaa'$.3N8DDfp##;F+,U;FO&H=B%^kE+*WpDdsn`@8pf?+D,Y&B5M3t
F<G19Df$UF=&M=\:f9_O8Q[Da/Kf.KATME*F*)G:DJ+#5D09oA+Cf>1Eb0<2Df0)o@Wl0rC`m1q
@r$4++Eh=:F(oQ1+DtV)ATM@%ART[lD..L-@rc-hFCfM9FD,5.A8,OqBl@ltEd8dE@<6O%EZet.
Ch7-fAS,Lp@r5XqCLh."ARfg)A7]@eDJ=3,Df-\/F(8WtAKZ)5CLqB+D..L$Anc:,FDtf3Bl@O&
ATW'8DK?qBBOr<#DId='+E(j7Anc:,F<GX9DKKH-@q?d%ATDL'A7fXlE)C_$Ea`p.@:X+qF*&OH
Deip%F!,[@FD,B++E;OBFCeu*CghEsG\V/-BOu"!A8-+(CghT3:ddbq8l%htBOu"!C2[X!Blmp,
@<?']9gi`7A8Gt%ATD4$AKZ/-EcYr5DBNe)CLnVsDIal#@<?'qDe*d(FEMVA+A,Et+E)-?Eb0<7
Cige6F!*1[BkAK/F^nomF)tr9C`m/(A0<QKDffZ(Ed)5=ASkjrCLh$tGAhM4F)>?+CLh@-DBO%4
G]Y'?Ec5e;GAhM4+Dbb5FDYH,CM.'sF(o9)D..I#+DN$/De*E%AoD]4CghEsGT^^<A7^""DJ*os
EcYf%De*Eu@<-F#F!+'tGAhM4+Cf>#AT2TuDe*Eq@<?(*E,Tf>+E2@>@qB_&+D58'ATD4$ARlp)
Dfp)1AKYK$A7Zm"@<?(*E,]<*A7]RcFCf\PE,Tf>+E2@>@qB_&+D58'ATD4$ARlp)Dfp)1AKYK$
A7Zm"@<?(*F`V,)@X3!*FEMVAF!+m6Ch[s4+E(j7GAhM4F!,(8Df$UFGpskXBOQ!*6qL9F6W?`^
+CehrC`mq?Eb'56Df-[GGU[cZCghEsG\1u?DfTB0F`)DD@;p0sA0>\sFCf\>Ao_g,+EqaEA90dS
Fa%Y1FCf]/Ed)GBA9/kT3[],_+Eqj7E$0:9Cj@BN                                  ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1Gp:3+>P&o0H`/,2`2^42BX_22`Mp72BXb42)cX41a"S70f*6IG#N6rCLo1R:-pQ_@:FCYD/X3$
0JFVk/M/(n@:FC/+CT;'F_t]-F<GXADeio,FCfN8F"Rn/:-pQB$;No?+CT>4F_t]23XlEk67sAi
$;No?+<Vd].3L$\ATMs.De(OU.3N/8@ruF'DIIR2+:SZQ67sB'+<VdLEb/lo+=D8BF*)/8A2#\b
4)/_CFD)dEIS*C(<(0_b06CcHFD>`)0JFj`$;No?%15is/g)8Z1+==oC2[X)ATMs)E[`,FF!+m6
Ci<`m+EM%5BlJ/'$;No?+<V+#:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD
+>PW+0Q(fP1,]RK:-pQU@q]:gB4Z-F+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%16T`@s)g4ASuT4-XpM*AL@oo%15is/g,">CLnW'De*s$F*(u6
+D,Y4D'2GH6m-#SF*)G:@Wcd,Df-\.Bk)7!Df0!(Bk;>p$;No?%15is/g)8ZDe'tP3[\Z\A7T7p
+DPh*+E_d?Ci^sH>9G^EDe't<-OgDX67sB'+Dkq9+=CoBA9;C(FCfJ?%16oi@:UK.C2[X)ATMs)
E[M;'%16T`@r,RpF!,RAE,9H&?U6tDF)>i2AN;b2?TgFm-UC$aF)>i2AN;b2-QlV9@rGq!@<6!&
4=<E\6$$m]CLoLd3@>7C@rH(!F(KB6+=Cl<De(4)$4R>;67sC%@<Q3)F)>i2AKYf-@:UL&ATMr9
F(96)E--.1$?BW!>9G;6@j#T+@:W;RDeio34ZX]?+D58-+?MV3Ci<`m;f-GgATVL)F>+hRDdd0T
D/X3$FCfN80ddD;.!mQj0d(:N@:W;RDeio54ZX^43[-:$Ci<`m;f-GgAIStp1a+n;2(9Y03[\rX
+Dbt)A5d>`CLnk&$4R>aATMs)DK]`7Df0E'DKI!KB5_^!-T`\J:IHQQ:-pQU4#%j#:-pQUH!tQ,
ATAo3DBKAq%16QUAoD^$F*)Fc3Zq]NHS0ai0d\;_/q,67-sIf_/g+FK%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R>;67sB4HW3F4<$5+=5uL[1/I`$r$;No?+E;OBFCdTr-RU8h-7hD1/1)_l-RU?.
-mO0`4utqW4XMO(-RU>l%15is/e&._67sBU67sBnASu("@<?''@;Ka&E,Tf=Bjtmi+Eh10Bk/>7
@:FC/+CT;'F_t]-F<GO2FED)7DK?6o:-pQB$;No?+DPe(4ZX]]6:s[6<),ef@;9^k?O[?;67r]S
:-pQU:-pQUG%#3$A0>]"Aoo.DGUXbDEbBN3ASuU2+>"^MDI[L*A8,po+D#A'A7]9o.!R0M$;No?
+DbJ,B0A9u-p22r0I\+q+=K>r0Hb+J@jrN0$;No?%15is/g*nU/g,=GCh[E&EbT0"F<DuW.3N&>
B6A'&DKI"?@<?U&Ec,q@/Kf"K@;0U%8g&"[D.Oi/Eb/isGT^F4A0>H#E--@J-RT?1:-pQUEaa!$
4ZX]5DIIBn-QjNn+=ANa-RU8a%15is/e&._67sBU67sC(@;KXg+=LZ-Ft"PBEbBN3ASuT4E+*j1
ATD[0%15is/g+n;Eb@Nr+?Ui&+?Lc%+<iin/j:C4+>=on+F>:e+<Wij-p/k"@:FC&-Rg/h+A=g=
0d&"iHQX_!Cgh?s.3L/a4=G2lDffP;/j:D+3c\YLB.4rS+F?.i@<,ui$4R>;67sB'@:FC&-Z3@0
ALAT0$;No?+<Y*%Fs&.[+<VdL+:SZQ67sB7+CS`&+=D&8D.P(($;No?+>=pH@WikA-QjNS+:SZQ
67sB8+CS`&+=D&8D.P(($;No?+>G!I@WikA-QjNS+:SZQ67sB9+CS`&+=D&8D.P(($;No?+>P'J
@WikA-QjNS+:SZQ67sB:+CS`&+=D&8D.P(($;No?+>Y-K@WikA-QjNS+:SZQ67sB;+CS`&+=D&8
D.P(($;No?+>b3L@WikA-QjNS+:SYe$9g.jDe'u4A8,Oq+BosE+E(d5-RT?1%15is/g+\9Ch7^"
+CT)&+EqaEA90:EB6%p5E-!QQFCfN8F"AGTF_Pr/F"AGN@:O=rEt&I2+Bot,@WNZ&AS`\W+>G!e
/g`27+E(_1+CoA+-8%J)-mNY>F$2-<+tt-R/g*##,<R>$%13OO:-pQUATD4#AKYE!Gp$R)@r$4+
F!(o!6qfa)+F?.r/g*PY5u^B^?W0p2?V4*^DdmGj$8EYS/0H>q+Z_J<.3L>fA8-',6:"7O?URR=
-Rp`_C1\h&$4R>;67sC&Ed8dKARTUhBPD?s+EqL1DBO%7ATD?)@<,p%DJpY,@:O(qE-!-R+D#e:
ARfgnA0>H(Ec5t-$>sEq+CS`&+=ANZ+<VdL+<VdL+AP6U+Du+>BPD?s%16uaEZee"Fs&/SDf]K$
-OgE#ATAo%@WikABOu3q-OgCl$>sEq+>P'J@WikA-QjNS+<Ve%67sC%FD5Q-+DtUu@1<Q]ATAnM
+CS`&+=DGQFXJ:S+AP6U+E1n4F(o];Bl7Q+%16uaEZd(Z@:FC&-YI.:AT_r>%13OO:-pQU@rc-h
FCcS:BQ@Zq+C\bhCNXT;%13OO:-pQUAnc:,F<GL2C1Ums+Cf>+Ch7*uBl@l3/KeVAE--@7$9g.j
E+*6lA0>u)Bk)5o$4R>;67sC%ARfXrA0>f"C1Ums+Cf>+Ch7*uBl@ku$8EZ-+=JWl+Z_>30I\,*
3Zqca3[l1fDdd0TD/X3$FCfN80F\@Q0RIbI@r#TtFC])qF:AR"%15is/g,7LBl[`,DdmHm@rri'
Des6$@ruF'D@Hq-+Bos:-nlf*0eb:1+?DP+?SOSj+Dbt)A5d>`CLqU!F*',G$9g.jE+*6lA0>u)
Bk)5o$4R>;67sC(@<-(#F`S[>DK]H)Bk/>pEbBN3ASuU2%16uaEZd4^@:FC&-RT?1DImi2@:FC&
1boLIDImi22ek2m@:FC&-RT?1DImi2-YddFF<GdJDf028+CS`&+=D)C-OgCl$;No?+Eh10Bk/?*
@<?U&Ec,q@GA2/4+CfP7Eb0-1+C\bhCNXT;%13OO:-pQU@:FC&-RU#Z+AP6U+DG@tDKKT7Gp%<E
ASrW.DffZ,DJ()#A7T7^+CSl(ATAo0@<6N5@UWb^F`7cs0H`M$,9SC_/g+\BC`k)Q.3L2p+=Ach
-=UOuDfTE1FE/]\4s49CFseXH$4R>;67sBh@WikADIIBn-OgD:+F>:e+=Jd%-ULU)9L2WR9d_A4
74o]H+FPjb@:FC&-ULU)9L2WR9d^AW%15is/g)hj@:FC&-Z3@0AL@oo0Hb]d0d%kq3[\WZF=/L[
74o]H+FPjb0Hae5Fs&/HDKI68$4R>;67sB8+CS`&+=ANG$8<Sc+<r!WI4cWs+CoA++=ANc+>#2g
-S?bn@V'.iEb0<6E[ED&+>G!I@WikA-OgCl$;No?+>G!I@WikADIIBn-OgD:+F>:e+=Jd%-Za-C
CLnkB+@Rn*4s58++>G!I@WikAF)>i2AL@oo%15is/g)nl@:FC&-RT?10H`M$,9SC_/g)nlA8Z3+
-RU>c/M8.n/ghuTAS,k$ATMs6-8%J)1*C"7Fs&.[%13OO:-pQU1*C"7Fs&/M@;TR'%14d3HQk0e
-nID,Bl8$6D/X3$-Rg0,/g*>#I4cWt+CS`&+=Cl@FE;;;CLnk&$4R>;67sB:+CS`&+=ANG$8<Sc
+<r!WI4cWu+CoA++=ANc+>#2g-S?bn@V'.iEb0<6E[ED&+>Y-K@WikA-OgCl$;No?+>Y-K@WikA
DIIBn-OgD:+F>:e+=Jd%-ZaEEFCcgK+@Rn*4s58++>Y-K@WikAF*22=AL@oo%15is/g)tn@:FC&
-RT?10H`M$,9SC_/g)tnA8Z3+-RU>c/M8.n/ghuTAS,k$ATMs6-8%J)1a$49Fs&.[%13OO:-pQU
1a$49Fs&/M@;TR'%14d3HQk0e-nID,F)>i2ALAoL74o]H+FPjb1a$49Fs&/RD/X3$-OgCl$4R>;
67sB4HW3F4<$5+>6UO:@;asb\I4Ym8ATD@#E+No00F\?u$=e!aF`MM6DKI!K@UX=h-OgDmDe3rt
F(HIVFDYu5De!-?5s]R/DeioE3B:GUF_PZ&C2[X!Blmp,@<?'U67s`sF_PZ&C2[X!Blmp,@<?''
F"Jsd@WcC$A0>;uA0>DsF*)G:@Wcd(+DPh*Ch\!&Eaa'$/no'A%15is/g(T1:-pQU@rc-hFCeuD
+>PW+0Q1HC0Js:H:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/(S$;No?+>PWh@rsC^+C]J-Ch+Y:C2[X!
Blmp,@<?'0+CT.u+Co2-FE2))F`_1($;No?+>PWh@rsCb+=LuCA8Gt%ATD4$ARB+ZF(f)mFCfT8
CagK8A7T7^%15is/g)o'DJs\P2]sM`De*ZuFCfK$FCeg"Df9_H+CSekARl5W:-pQU1,*6M@k]V[
-u*[2Ch\!&Eaa'$<_Yt2+CSekARl5W%16T`@r,RpF!,RAE,9H&?U6tDC2[X!Bll$h3F=p1-UC$a
C2[X!Bll$h3@>qR+Cf>$Eaa$#+?V#;5s]7(A8Gt%0KD-@%16T`Bl8!'Ec`EOBkhQs-OgCl$?'j$
4ZX^6/nA[,+>=63%159QHZ*F;4$"c<-Y[F/GUFUc3ZpL<HZ*h@.3g3SD.Rr>.4chhC2[WnATf22
De'u5FD5Q4-QlV91E^UH+=ANG$9g.jFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+EM4)1,Us4F(fK9
E+*g/+EV[H@;Ts+C2[X!Blmp,@<?'fBOPsqA79RkF`M:@C2[X!Blmp,@<?'fEc5l<+DPh*Ch\!&
Eaa'$<_Yt0%17,c+Bos9Eap5/F(ZV-Bl%?.4Z[FrF!)iFDe*ZuFCfK$FCcg/$?BW!>9G;6@j#Z!
F=0449gM-E:L@OFDe*2tB4Z0--WEl0:L@jTA8Gt%ATD4$ARB:b-OgCl$;No?+E_X6@<?'';b020
2)ZRj@<6*)@;]TuA79Rk+=M)FF`);0Bl5&8Bl.E1+<`-_.6T:+C2[X!Blmp,@<?'fBOPsqA79Rk
F`M:-$><jhBK\C!F(eu;2)ZRtART*lAnc'm%16QT@<?'D3ZohmF*(i-E$-MU.4chh9iNJL$>OKi
Ch\!&Eaa'$?YEkhBOkOnAT`$04ZX]6BOPsq4(;`/FCcmD-nlbu.=E=RDe*ZuFCfK$FCefm@<6*m
@<?('Ebl0l4tq>*D/a<0@j#`5F<DrGDe*ZuFCfK$FCefm@<6*m@<?('Ebm*4$4R>;67sC'E+EC!
AKZ/5A0<$D.OdM5+DPh*Ch\!&Eaa'$<_Ysk$>OKiCh\!&Eaa'$<_YtF3ZoOn-pB[74u%D!De*Zu
FCfK$FCeKI6n(3,A79Rk.3L#n+>PBo+DPh*Ch\!&Eaa'$<_Ysk$9g.jFDYu5Ddso/F`\`RC2[X!
Blmp,@<?']9gg?<$4R>;67sBkAS,@nCige?Df9_?/KetTATDg*A7T7h+C]U=A8,OqBl@ltEd8dN
@;L't%15is/g+nIA8Gt%ATD4$ARBIrDfe-'+=CY[05>E90..29%14L>+?CW!.3N5:Ch4%_BkAt?
An?4$F*(c(?Qa90F?M6!-u*1#CNDX"C2[X!Blmp,@<?'fEc5l</151@@r$-=C2[X!Blmp,@<?'6
-RgSoC2[X!Blmp,@<?'5Bkh]:+CoCC+:SZ#+=M8A@:UL+.3NhTBlmo/F(fK9E+*g/+E)CE%144#
-p'220RI\IF=A>VEbTW,+EM47GApu3F!,4+@r$-:-WEl0:L@jTA8Gt%ATD4$AM.h1-OgDoDIb@B
%14Nn$4R>+0RI_K+E)1:+BosE+E(d<-Qij*@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0
@p_Mf6#(=KCh[uF3B:FU$>40n@WOkEF(o,P6tKsa0MXqe.VER9@WOkEF(o,P6tKsa0HbHh/KeM2
F(o,,A8-'q@rri(AS,XoBln'-DBL??Ci<d(.3N_DF*)IU%15is/e&._67sBI@<6-m+EV19FE8QI
De:+a:IHRO+D>2$A8GstB-8=8Afr46ATo7>-qYU)3A*!@+CT.u+<Y*%Dg#\@%15is/g+\=Eb/a&
+Co%qBl7X,Bl@m1/e&._67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@q]:gB4Z-F
+>#/s/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=:-pQU
0f!9N@kfY[F*(i2F<GL6+EV19F<G(%F(KD%$4R=O$=e!aF`MM6DKI!K@UX=h-OgE'AT;j,Eb-@@
C2[X)ATMs)E[M;'%13OO@rGjn@<6K4FDYu5De!-?5s\sgF(o,E3B:G03Zoe95s\sgF(o,E3B8H0
>9IEoATD4#AKX)_5s[eG@<6-m3B9)I%16T`Bl8!'Ec`EOBkhQs-OgCl$?Tj#FCf?5Bl\-0D.RU,
+=Cf?De(4W-V@0&-Ql/N/g*51+AP6U+EVNEF(fK9+EV19FDtZ0F!,L7F*2;@Et&IO67sB4HW3F4
<$5+=5uL[1/I`$r$=m[YAhYo%3\qm>+>=63%15is/h1CBAS*VM+Ef=g+EqaEA0?)1FD)e-Bl[cp
F<G+*Anc-sFD5Z2Et&IO67r]S:-pQUD/X<#A3(hUA7T7`0JFVlF\-4`DfTCu$4R>;67sBQ:IH=A
De!3l+Co%nCgh?mFD5Z2%15is/g+mOE,ol/Bl%?'+Xefh4Y@juD/XQ=E-673$4R>[A7]@93dZ2r
+FSYI$4R>[A7]@.4Z[q:+=VIVI=2P3%16u`AS*_]3dZ2r.:Weo+FSYI$4R>[A7]@04Z[q:.:aQL
I16Mm$;No?+EV:;Dg*<r+D#S6DfQ9o:-pQUDIR$b4Z[q:.<ffNDJ+BG%13OOA79"3/g,Lf+F#"Z
+F,)XI16O*ATMs4@<6K40ea_\@:UK81(=R"$?Tj#FDtZ0F!,gV+F,([+C].oF?M6!H!W9LI=35P
3Zp1#0ea%D%16rjD*9p&H[?kaD%-h#4?P!(Eb/[$B6%EuA1'Ha.6Aq?-YII.DIb+VGpth#+FSYI
$?Tj#FDtZ0F!,=<D'13CDffZ(E[M;'%16rjD)+78+FAGXGT]'jD/X86D/X86Gp%N`%172gF*)A0
F)rHOH!t5l-Qm8ED)*4]D/XN0ATB.-$4R>YDe!X&D*9KoH[?k`4?P!-De!3l?Y=Cj@<?.&@;]U'
4*`8:-p/knDe!3l?Y=CfDIb+VGpth#+FSYI$4R>;67sC"Bk(p$F`8I>De!3l+Eh=:@LWZ]Df%9n
/g,Lf+E]:ZFY4e^+FSYI$?Tj#FDtZ0F!,:;@r6.$+Dl%61E\&]De!3l?Ys_'BOu33%13OOF(o\Y
3Zrcr+=M@T1E\.iGpsjt+=M@T1*A%hGpsjt+E\fP+FSYI$?Tj#FDtZ0F!,O<F!,0L+>jT8%17/j
F##m>+FAGX.!7-b1E\.iGpsjt+=M@b+>P&h+F,CY4!8Yu+F,)XI16O*ATMs4@<6K4F(o\N+>"^M
/g+LW%13OOCia<34ZX^4HQXbI%172gF*)A0F)rHOBl5&0F(o\C%16feCia<34Y@j4+=\LY%16WY
?[$'E3b2l1@<,pB3b2l1B5DKq@;J(f+=C]1AS*&tCi<ckCi^s5$>FBoF(o\<4!5r!/g,Eg+?L]h
+EelN+E\fP%145+I16O*ATMs4@<6K4/1r&&+=J`n+Dc+5F!)to.3N=W+>PV[$4R>ODf9<-D`p..
HQXbJ%172gF*)A0F)rHOBl5&&Df9<-D^Pu$@VfChDfe,p@VfClARTCkGs*chCgV!s@ps1:/n/X(
FDkMsA7]@,0Kh$9@W,n%F!,:;@ps1p-OgE-+=\LZ+=eR[%145+I16O*ATMs4@<6K41*C%EDeO'-
+>aN7%172gF*)A0F)rHT/g)Yt>Te*%F!,0L+>PV[$=\$o4ZX^4HQXbJ%144#+<VdL+<Yc;F*)A0
F)rHOBl5&&Ec3<7$6UH6+<VdL+F#"Z+F,(Z+F,([+F">&+FSYI$?Tj#FDtZ0F!*=_@WHB01^sd$
$:\rS?Z]sm?YjY(ARB@f?Uo$F?VPHVFE1r6DfRunH[?2/.:`kp@psFo4Y@j4%17;nDIksl+FAGX
-mC]s.4f`qF)YPuAN_Xn+Ceu"ASuT;I=2P3Bl.g3DJ=3<4Y@j=3[\TP+D>1o+DGp?@rH3uDJ(=+
$>+3s?Y4+m@kJm<D/aW8BlnVCA8a(0$6UI5ATMs4@<6K44(`;I@grcVDIb@/$?LE&ATV:"AThX&
B4X4e+Cei$CERh8DIjq<G@bkD%17N3%13OO0d'4X/g*q_%14Nn$4R>2G]75(FCeuQCi<ckCi_a#
+>5d)+?MV3DId<j+Dt_$AhkKHA7]@/+Dt_$Ai(WIDf$V6Df%6PF(o\<F(o\N+Dc+5F!+q1DeO'-
+C]A0+Co+lG@_n-B4#(fAKYMr?Y=1n@UX'qGA1r++EMa<ATV:"AThX&B4W3-ATMs4@<6K;%15OK
E+NO$ARnJQ@ps1p4ZX]=3dr253[\HHA0>>t?Z[E-Df%9Q@VfChDfd+9DJXB.F!,:;@r6.$+C].o
Eb/ZqCj@.4CgV!s@ps0r@VfCnDdR$cAS*VM+EMC<F`_SFF<G(%F))n4D/aW8BlnVCF)YPuAKYT$
DdsnZDfT3,BOtOeDg#]!De<?HDe*3LDf0Z;ATMd1-OgCl$=m[YAhYn]-RT?1%15is/g,1GAn?!*
FDi:4AS,XoBln'-DBNY2+EV19F<GC<@ps1b%16Ze+EV19FDtZ0F!*thDdmccATN!1F?MZ-0eje`
Ci<d(+=C]1AS*VM?RICHD/a<0@k9!7-OgCl$;No?+Cf(r@r!3)@;TQuCh[s4Et&IHCi<d(;Isol
Cihg$+?hN,7r3*QF&HRjF_l./$:T2YARfgnA4LHS@UX(o+>#Vs004P)4#)(9HUhmj@WPFYF*2;@
%15OKE+NO$ARnJQ@ps1p+>#Vs004P)4#)(:HUhmj@WPFYF*2;@%13OO:-pQU/ULGc;cFl<<C9,B
;c?.c9RSK%$>"6hDfB9*+>=63%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eG
@<6-m3B9*,%16`aDdmcdD/X3$6pr^_:-pQ_B5DKqF&QpoCLon%0JFVk/M/)UBl[cpF<G+*Anc-s
FD5Z2+=Ll=Ddmc:+EMC<CLnW1ATMs7/e&._67r]S:-pQU6tp[Q@rrh]AS,XoBln'-DBL??Ci<d(
.3N\KDeio,FCfN8F"SS-:IH=C@;TQu@;]LiH#m\@+E(j78du,&67sC)DfTB0+<Ve:Df0Z*Bl7X&
B-8<>A8-'q@rrh9+<Y3+Anc-sFD5Z2F!)SJ+EqO9C`jiC+ED%5F_Pl-%15is/g,"LA8,Xi@psIn
Df.0:$;No?%15is/g,=KEaiI!Bl,mRDIn#76pr/<F_kW1+D,P4+Dbt+@;I&pDIal&Ci<ckC`mV(
D.Rc@%15is/e&._67sB8/g*ntD.Rc2Bl5&?HQXpn/g,Rj+CT;%+Dbt+@;I'.D]j.8AKXB/+CT.u
+CT;%%15is/g)8Z+D#P8Bm*p$ASuT4FDi:>@;TRs+DG^9@ps1iARlp-DfTB0/g+)2+=Ll=Ddmc:
+Dl7BF:ARP67sB'+<Y6?@r-9uAKYDtC`mP4@ps1iGp$O:F(o9)ARloO6m-AUD.Rc2Ao_g,+E)CE
ATA4e:-pQU+<VeJ@rH<t+Dbt+@;I&pF)u&.DJ`s&FE9&W<+0QR+Cei#AKZ21ASqqa:-pQU+<VeR
HQXpn/g,Rj+DtV)ATJu2@<?!m+DtV)ATJu.DBO%7AKYo6FCfJ8F(9--AM+E!:-pQB$;No?+<VdL
:N^bjE`[1"A3Dsr1E\_$0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG/g)QVDF?lA
+DGm>Ci<flC`mh<+EV:.+@JU?@;]TuDJsV>@rH7+Bk1dqARl5W:-pQU+<Ve%67sBh+Dbt+@;I')
AfrKtF`_28=)W+i.3NhJBl%?'-uX6M:18!N.3N>G+CQC/De!3l%15is/g)8Z+E)CE:18!N4Y@k(
HQ[SV.NiGC6ps0j+>bhrI=35P/g)qm1^sde67r]S:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is
/e&._67sB9/g+/3@<6L(B5V9k+DtV)AKZ#)An?!oDI[7!+CT@7@;^?5A7]_%BHV#,+@JV=+EqO9
C`m1u+Cf>-F(o/rEb/bj$;No?+<VdLB5DKq@;I',AS,LoASu!hF!,17+=L$.FCfK:DfTA;/e&._
67r]S:-pQU+<Ve&F`_28=)W+i4ZX]B+?CW!%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z
+AP6U+=MDEEaia#6prIHBlbD=Eb/[$ARlp"Bkq9&@3B3!Ddm-k+ED%*ATD@"@q?csDBL?'F`_28
=)W+i.1HVZ67sB'+<YTFFA?7]AN_Xg+F##8+FAGj+FAGXGT\LZG%G]'Bl6=,+F,)XI3L?fGp"RZ
BeCM_0Hbdl+>jT8:-pQB$;No?+<VdLDfp.s@;TQb$;No?+<VdL.1HVZ67r]S:-pQU1G0eF@;TRs
+Dbt+@;Kb*+CT>4BkM<pA0>T(+E_XBATAo?HQXpn/g,Rj+EM%2E+O)5@<,p%DJsV>@rH7+Bk1dq
ARl5W:-pQU+<Ve>Ci<ckC`mb0An?!oDI[7!+DGF1FD,62+CT;%+ED%*ATD@"@qB0nBl5&0Dg,c5
+EM%2E+O)C%15is/e&._67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D'
:-pQB$;No?+<VdL:-pQU-tHn#E)UjeFCcmDBlbD;AS,LoASu!hA0>T(+CQC'AS#glEZfF5DfB81
FD,*#+EV:.+E)./%15is/g)8Z+AP6U+DG_;BPCsi+DGm>G@>P8Ci<flCi"A>@<6L(B5V9k/g+,,
BlbD*E,]6+ASuT4B5DKq@;I',AS,LoASu!h%15is/g)8Z+AP6U+DGm>@:OD%@;Kb*+CQC/De!3l
AKZ#)An?!oDI[5e$;No?+<VdLDfp.s@;TR=/g)9]+C61;HSQ^jHQ[Z^A7]=k;flGiAKWQIGT\IY
Gp%N`+=eRFAS#gZFCB9&4Y@k#ATD6oDF?l8Gp%N`+tt-b+=\LJ/g)l&+FSY\2%9mf67r]S:-pQU
+<VeFF`^AeD.O.`:-pQU+<VdU%15is/e&._67sB;/g*Z#Ddm-k+DtV)AKYE&F(o9)D.RU,F!,17
+@JV=/0JAC+CT/5+Dtb3FD5W*+Co&&FD*37$;No?+<VdLGA1l0+C\n)FE1r$FCeu*@<3Q(Ci<ck
C`m/-F(o9)D.RU,F!,C5+=L$.FCfK:DfTA;/e&._67r]S:-pQU+<Ve&F`_28=)W+i4ZX]B+?CW!
%15is/g)8Z+EMC<F`_SFF<Gi<$;No?%15is/g)8Z+AP6U+=Lc3AT1Ri@<?'0+DGm>FE1r$FCeu*
Ch[Zr+CQC*Ci<ckC`m/-F(o9)D.RU,+E(j7-r4u-ATCjjEb$U.$;No?+<VdLDfp.s@;TR=/g)9]
+C61;HSQ^jHQ[PU.j/A6AT1Ri@<?'D3ZrTWEaia#6pr/C+FSY^0HbW`.NiFX+>GPmI=34q%15is
/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is/g*#(+A$/f@3BGrD.Oi(F!+n4F(o9)
ARlp"De!3lCj@.;DBNA*+E_XBATAo7@rH<t+CT.u+D5M/@UX(hGp$g=+CQB%$;No?+<VdLCi=N/
EZfF5DfB81FD,5.B5DKq@;I&pF)u&.DJ`s&F<GLFATDg*A7]g)FD,5.Ci<flC`m/(A0>T-%15is
/g)8Z+EVX8@<?'k+CT=6@3B3!Ddm-k+CT>4BkM=#ASuT4De:+?:N^bjEd)GBA901P%15is/e&._
67sB'+<XI&FCfJoDfTAO3Zp7%3Zp*c$;No?+<VdLF)>i<FDuAE+F+D':-pQB$;No?+<VdL:-pQU
-tHn#E)UjeFCcmDBlbD0Ci<ckCi"A>@<6L(B5V9k+DG^9@3BB)G@be;F(9--AKZ).@;[30BOr<)
DIj7a:-pQU+<Ve%67sBpDKfc.@q[!!F!,[8F!,:;@ps1iGp$O:F(o9)ARmD9<+oue+DGm>FE1r$
FCeu*@<3Q"+D5M/@UX'q@<6L(B5VQtDKI">AfrL?F`_28GAhM4.4u&::-pQU+<VeFF`^AeD.Pj_
+<YnO?6FTA1*Cpj+FAHGAS#gZFCB9&4ZX^1+=\LZ+FSY\.j/A6AT1Ri@<?'D/g,=KEaia#6pr/C
+FSY^0HbW`.NiFX+>GPmI=34q%15is/e&._67sB'+<YTFFA?7]AISuA67sB'+<W*B$;No?%15is
/g*&)+A$/f@3BGrD.Oi(F!+n4F(o9)ARlorCi<ckCi"A>Bl5&%DBO(@E+O&4F(9--AKYE!A0>],
@ps1iGp$g=+CQB%$;No?+<VdLCi=N/EZfF5DfB81FD,5.Ci<flC`m/-F(o9)D.RU,+DGm>FE1r$
FCeu*@3B3!Ddm-k+ED%*ATD@"@q?d$AfrKtF`_28=)W+i.4u&::-pQB$;No?+<VdL:N^bjE`[1"
A3Dsr1a"h%0F\@a67sB'+<Y`BDfp/@F`\aO%15is/e&._67sB'+<XEG/g)QQAS#gZFCB9&.3N>G
+D5M/@UX(hGp$O:F(o9)ARlotDBNA*+E_XBATAo7@rH<t+CT.u+Dbt+@;Kb*%15is/g)8Z+AP6U
+DG^9@3BB)G@be;F(9--AM,*)BOr<(@;TQuBlbD=Eb/[$ARlolF!+m6B5DKq@;I&pF)u&.DJ`s&
F<GL6+=L$.FCfK:DfTA;/e&._67sB'+<YTFFA?7]AN_Xg+F##8+FAGj+FAGXH[B:7AT1Ri@<?''
GT\IYGp%N`+=eRFAS#gZFCB9&4ZX^/ATD6oDF?l8Gp%N`+tt-b+=\LJ/g)l&+FSY\2%9mf67r]S
:-pQU+<VeFF`^AeD.O.`:-pQU+<VdU%15is/e&._67r]S:-pQU@<6L4D.RcL%15is/e&._67sB'
+>G;fAnc:,F<G[:F*&O5F)uJ@E-,f4D@HqJ67sB'+>PAgF(Jj"DIal3ATMr9@<6L4D/aT2Df-!k
:-pQU+<VdL+<VdL+<W9h/hRS?:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqMq$;No?+CfG'
@<?'k3Zp131,*6M@k]nP$;No?+Cf(nDJ*O%3Zp"+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$4R>PDe!p1Eb0-1+=CW,F(H^.$?B]tF_Pl-+=CoBA9;C(
FCfJ?%13OO:-pQUFCfN8+DG^9@r,^bEZeh"F(HJ.Afu2/BlbD/Cggs!BlbD9Eb0<'DKI"0DIal2
ATT&:D]gbD$;No?+>=p$+=K&i3\W!*4=<`s6pjX:5uLKO?YO7nA7$\n$;No?+>Fuj3ZoV!-V@0&
6VKp7;GTqmBkhQs?RH9i:-pQU@r,^bEZc_W%13OO:-pQUFCfN8+DG^9FCf<.DfT9,Gp$jEDJLA2
De!3lAKWQIDJsV>@;Ka&8l%ha$;No?+EV19FE8R7@;[2sAKYr'Eb961D.R6#Bl5&.F`(t;Ci<fl
Ch7Z1F)Po,+Dl7BF<GUHDBNY2+C\c#AISuVDe!TlF)rIGD/a<0@p_Mf6$$m]CLoLd3F=p1+=BH@
6$$m]CLoLd3@>qR+Cf>$Eaa$#+?V#;5s]R/DeioE3B8Gr$=e!gDKBB0F<DrFC2[W1%13OOFCfN8
ASu[*Ec5i4ASuT4-YI@9A1'Gd8l%i&%15is/g)`m<(0_b+B)6*;H/&r%13OOFC])qF?MZ--Zip@
FD>`)0JFj`$4R=O$;No?+>%q>78m/.;cQ1P78m,S<D7fm%16ZeAT)O!DBLVB$4R>PDe!p1Eb0-1
+=CW,F(H^.$=e!cEaa$#+?Xa_E,9H&?U6tDF)>i2AN;b2?N                           ~>
)
showpass 1 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,g=4+>P&o0H`,/+>Gbs1GU(-2BXe7+>G\q1H/`OG#N6rCLo1R-t-S..3N&>B6A'&DKI"BD/X3$
+EV19FE:o6Bl%<pDe*ZuFCfK$FCep(Bl%<&@;]TuA8-+,EbT!*FCcS0De*ZuFCfK$FCf*$DdmcS
@<6-m6ptTu0JHsEF(o,,A8-'q@rri(AS,XoBln'-DBL??Ci<d(.3N_DF*)J9Ci<d(;f-GgAOJp?
0P"m<ARfg)A7]@eDJ=3,Df-[GB5DKqF"&5QD/X3$+EV19FE7                          ~>
)
showpass 1 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1,1R-1,0n-+>G_r1*AD60f:(/0H`+n1c[EN+>Gbs1*A;,0JO\)1a"Or3B&f<0eje++>P]+0H`)1
+>P&p1GLj30f'q-+>Pc60H`,*+>P&o1H%*50f:(/+>GQ03$9q0+>P&p0fD!L+>GYp1*AD/0fL40
1E\Fq2`!-J+>Gl!1*A;-1GU(.0d&4o3Ar]K+>G\q1*A;+1Gp:00d&4o0f1aG+>Gl!1*A;*0f^@2
2]sju0f([H+>GPm1*A;*2`2^9+>P&o0f:p50f1".+>GZ+1J1G26<-TN6qBmJ<)6Cp1,TLJ:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#pj:-pQU<b6;mBl@lM+>GK&/i"Ol6?R!YA0=WiD.7's3ZpF*+@KX[ANCqf3?V(8Fs&Oo1,'h)
3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2n$;No?+BE&oF(oQ13Zp.00J5+'+@:3bCh+Y`F_tT!E]P<t0H_K+
@<?'A+>GVo:2b:u1,(I;+>GT31,:mH2[p*'$4R>;67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D%-hI67sB]ATDj+Df.TY0eP.41,U1+
+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp.:+AQiu+>PW+0H`)*3\`EO1,fXL$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo
1,'h*1-.6J3]&T!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp1#+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.9L3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqh2'>Y4Fs&Oo1,'h*2**QQ3\rGs$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp7%+@KX[ANCqh2BYb5Fs&Oo
1,'h*1-.0I3\rMu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3Zp='+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh*G3]/l($49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh2]tk6Fs&Oo
1,'h*0fh*I3]&f'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's
3ZpC)+@KX[ANCqh2]tk6Fs&Oo1,'h*0fh-G3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9
+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.2+<X'\FCdKU0JXb=ARci<
0JY=)0ebXC1HI?I$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<t0d%T,@<?'A+>G\q6tKjN1,(I;+>>c92)73J3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+@KdN+>PW+0H`).3\W9L0JWtB$;No?
+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg0d'D+
E$-ni1,0n+1-.9O3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=Wi
D.7's3Zp.6+<X'\FCdKU1,0nI@rrhK0JY@*0f;!I2EEWN$47,867sBZH#n(=D)re3:IH<J6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt
:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS0fC-s6t(1K3Zp14
+AZKh+>PW+0d&2.3]&TQ0K9CH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>Get+@KX[ANCqh0d'8%F<E=m1,0n+2**QN3\`W%$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp.:+<X'\FCdKU1,0nI@rrhK0JY@*0f;!K3'&`Q
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A
+>PYo:LeJh1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!n
Bl%<&:3CD_ATBgS1,'gn6t(1K3Zp14+AZKh+>PW+0d&2.3]/ZR1,]IH$;No?+B*Q,FCf;M+A,Et
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>PYo+@KX[ANCqf1*Atr@j!N\1,0n+1-.*L
3\W5p$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp15+<X'\
FCdKU0JXb=ARci<0JY@*0f(jH2EE]S$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs:-pQU;gEG+ASjIN
8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS1,L*r6t(1K3Zp.2+@KdN+>PW+0d&/1
3\rHN1boCF$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pes
+@KX[ANCqg0H`bp@j!N\1,0n+0KLpD3]/Su$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^H
ATf1=6?R!YA0=WiD.7's3Zp19+<X'\FCdKU0eje=ARci<0JY@*0KD0O2**KN$47,867sBZH#n(=
D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN1,(I<
+>GT31,_0I0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
1,pC!6t(1K3Zp.3+@KdN+>PW+0d&2*3\rcW1,K=F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqg0d&kq@j!N\1,0n+2**EF3\rW#$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp44+<X'\FCdKU0eje=ARci<
0JY@*0f;!I3'&fS$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P=!0d%T,@<?'A+>GSn6tKjN1,(I<+>G`71G_'J1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
1,9sp6?R!YA0=WiD.7's3Zp46+<X'\FCdKU0eje=ARci<0JY@*0f;!K3'&fR$;+)^<)6:`;aOJU
9LMEC;cHOj=Y_iD$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqf3?V(8Fs&Oo1,'h)3'&fK3\WE#$4R=O$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+
EcYr5DE8mp/hen5+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqg1*B>1Fs&Oo1,'h*0fh'F
3\r]($4R=O$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:%15is/g+2+EcYr5DE8mp/hen52'=InA7]p,+@:3bCh+Y`F_tT!
E]P<t0H_K+@<?'A+>Ghu:2b:u1,(I;+>GW40f(jG2[p*$$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3Zp."+@KX[ANCqh2'>Y4Fs&Oo1,'h*1-.6J3]&T!
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\
FCdKU1,U1LDg!6Y0JY=)0etdI1cdEK$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(
+Co&,+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>Pes:2b:u1,(I;+>G`71cIHO0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp19+AQiu
+>PW+0H`)*3\iNQ1GT:E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!Y
A0=WiD.7's3Zp:&+@KX[ANCqh2]tk6Fs&Oo1,'h*0KLsG3\`W%$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,g=NDg!6Y0JY=)0ek^F
1-.9P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.41,9t(+Co&,+<X!nBl%<&:3CD_ATBgS
2]s52@<?'A+>Pku:2b:u1,(I;+>GT31Gh-L3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp1:+AQiu+>PW+0H`))3]&QP0fTLI$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5+9+>"^HATf1=6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh
2]tk6Fs&Oo1,'h*1-.*D3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,
+@:3bCh+Y`F_tT!E]P<t0H_K+@<?'A+>>Pn6tKjN1,(I;+>GQ20f(jI1("?q:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GSn+@KX[ANCqg1a#1t@j!N\
1,'h)3'&oP3\i]&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`
F_tT!E]P<t1*@]-@<?'A+>Gl!6tKjN1,(I;+>Gc80JPUB1^XQs:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>GYp+@KX[ANCqg0d'D+E$-ni1,0n+1-.9P
3\W5p$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?
CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t
2'=#0@<?'A+>PYo:LeJh1,(I<+>G`71H%9N2$sZt:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqh0d'8%F<E=m1,0n+2**QL3\WN#$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A
+>PYo:LeJh1,(I<+>G`71c.6J3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\
/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8
Fs%noF_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh0d'8%F<E=m1,0n+2**QR3\WQ$$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>PYo:LeJh
1,(I<+>G`72).-H0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&
+AR&r@V'R@+>PVn+@KX[ANCqh0d'8%F<E=m1,0n+2**TM3\iT#$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Pn6tKjN1,(I<+>GW4
0KD0J0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ
@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P\p+@KX[ANCqf1*Atr@j!N\1,0n+1HI<M3]/l($49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>Pn6tKjN1,(I<+>G]61H7EP1^XQs
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr+@KX[
ANCqg0H`bp@j!N\1,0n*3BArM3]&T!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.k
A7]p,+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>GPm6tKjN1,(I<+>GQ20etdI0FA-o:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pht+@KX[ANCqg0d&kq
@j!N\1,0n*3BB#T3\iT#$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3b
Ch+Y`F_tT!E]P<u2]s52@<?'A+>GSn6tKjN1,(I<+>GT31,_0I0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqg0d&kq@j!N\1,0n+
0fh*N3\iQ"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!
E]P<u3?TG4@<?'A+>GSn6tKjN1,(I<+>G`70JGOD2[Tm!:-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>GK&/i#1)/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqg0d&kq@j!N\1,0n+2**KP3\iZ%
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen51*A.kA7]p,+@:3bCh+Y`F_tT!E]P=!0d%T,
@<?'A+>GSn6tKjN1,(I<+>G`71G_'J1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/i#1)
+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>GSn6tKjN1,(I<+>G`71cRNP2%!/U;cI+=De*ZuFCfK$
FCd3^%15is/l5>B<*sBYA8Gt%ATD4$AKYr1F*&ODEc5H!F)u8?+=Jfo.6T^$$4R>`D/XQ=E-67F
8Oc!576N[S-nlc)+>>5R$;No?+=LuCA8Gt%ATD4$ALSa9DKKH1Amo1\+EqaEA12LJ3XlEk67sB4
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/O`$;No?+B1m';c#bT6r-/m+<VdL+AP6U+D,b4
C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,+DGF1Df-\=BOu!r+E1b2BFP;D67sBmDfT]/Amo1\
FCf\>+<Ve%67sBmDfT]'FE8R<H#R>8Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaE
A9/1e:-pQUB6%s-BlkI?+<VdL+<VdL:-pQUD..3k+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g+k?
@:NkiARfgrDf-[?+<XEG/g+kGFCfK)@:NjkF(Jj'Bl@l3F*2>:@<-W9F*)G:DJ'Cc:-pQUBkCit
+<VdL+<VdL+<VdL:-pQUAoD^,@<<W+DKKH1Amo1\+Cf>,D.RU,+EV1>F:ARP67sC%ATV[*A8Gt%
ATD4$AKW*j67sC"Eb02uEb-@e@8pf?+E2@>@qB_&Bl7Q+/Kf+GFE8RCF`\a:Bl[cpFDl2F+Eqj?
FCfM9E,oMuD.7<m%15is/g,:\CghEsG\1u?DfTB0+<XEG/g,:SGB.,2E+NQ&CghEsGT^U=Df$V@
DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX67sC)DfTB)BlkI?+<VdL+<Ve%
67sBt@;BEsCghEsGT^U=Df$V@DfTA2Ch[s4+=MLa%14Nn$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!g
DKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$7I\Q3Zp+*+=ANG$?U<6/e&._67sC'F(HJ&DL!@D@;]Uo
@j#i(F<G:8+EV:.+A,Et+E2@>Anc'm+D,P4+EV:2F!,=.@q]RoAISu\AhG3MAU%QjC2[Wi+?V#J
;FO&D;GoqO:dIiE:IAK'C2[Wi-Qlr</g++a8Q/GO:..lF?X[\fA8Gt%ATD4$AR@S]+Abs)7R^3Q
779s<:..lF?YO7nA7$HjDIb@/$>F*)+=f&t5U\"!@;]Uo@j`Tl/h%o^@;^7"E]l#t4"u"(4?G0&
1*C[TAfrLCBOu!r+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?S!QI/M2-WEcYr5DC6kU/M8/5;BTLg
/e&.1+EMC<F`_SFF<Dr+:K0bD+CSeqF`VXIE+*WpDdso/@<?0*BkAJtF`MM6DKI"EATDj+Df-[G
-S04FDK]T3/12khBlbD7Dfd*c4WlL43A*$=0ddD;ASu$2%16TRFCSu:%144#F)>i<FDuAE+=BTU
;GU1O+E1b,A8bs#DJsV>F(KG9/KeJ4C3=T>+B1m';c#bT6r-0W@;9^kCh\!&Eaa'$?RH9iASu$2
%14Nn$<0eh:L?^i6psg<?Ys=/2[p*;>AA(eA8bs#FDk].+Dbb5FBp;0De*L$@;omo@rj;FDe*cn
C2[W8E,K;;+CIf;6psg<?m&EE6r+7!4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%+D,P4
+CIf;6psg<?nMlq<+ohc@UX=h+>Ynu7o`,K+DYP6+DGm>F*(i"Ch4`-G%G\:FD,5.Ch[KmFD5T'
+E(j7@3BZ#F))3l@;]TuD..]4@;p0s@<*K)DBNk>BOu3,<)5nX+Dbb5FE9&D$4R>M>@M/VBl5ME
De*cl?k!GP$8F.U?p%e-C3j]8B/44F@V0%m@rlNsFYR_e1cRF;?Tqj?6Z6j`Bk1dq+DG\3Ec6,8
DJ()(Df0Y>G@bK$BQS;<Bl5&4EbTE5ARlooDe!p,ASuU2/g+,,AKYT'DKI"DF(Jkk$6UH6AoD]4
F)Q2A@q?cmDe*E%@rHL+A0>>m+CQC/BlnH5AKYH#Ch.*t+>"^IF)Y]#BjkgoGp%3BAKYK$Ci=?*
A0>u*G]\!Z%13OO1+j\W4C;WEBQA-62fW;?1bs,eCc?EVGWBJYB4<i-5%#L(@<-4'DJ=E.+Cf>#
AKYK$Ci=?8+CT.u+D,P0FE8R5@rcL/F!+k,F*)54F*),6B6.H'@;]Tu?uTOlA8bsc+EMgGFCBD:
@rH1%EbTE(/e&.1+<X$oEcP`/FDQ4FFD,6,AKYr#@r#LcATJu:F(HJ)BkCsgEb0-1+D,P0FE8R5
DIal"Des?4F"Rn/%14mD+CI<=2KCK3D)lKRBR2FN@5g&cFEi%DEc#9!EF1n;+AucoBk;K2BQ&);
FDi:6F_kl>+D#D!ARlolCht57AS,LoASu!hA0>K&DKKqBBl5&4EbTE5+AbHqF"Rn/%14pE+CI<=
@qB4/H8%0lFD!OPD)cAl@q]g?0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^
F`8IHATDj+Df0VF+EVNE8l%iC:I?`D$4R>"/g+Oa?T)\3C2[R#G%*@DCNFf7H>tZV3HR8iF^e]A
?m%gTDKBN&ATAo%A7TClB-:V*DIn#7@;p0sDIdI++EVNE?tsUj/oY?5?m&ukF(96)@VK^m+D>\;
+EVNEEcl7B8l%htFCfN8F"Rn/%16KIASu$1FDk].?!n*K<)5nX?V4*^?Ys=/2[p*;>AA(e+EVO4
D]ik1F*(\9FDk].?YXLi/oY]@.3N"j:IJS5<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztq;$4R>=ASu$mDJ()#DIal"Df0W1A7]dmA0>Aq@;]^hF!,(5EZea^:IJS5
@;]TuBlnD=F*1r%CghC+ATKI5$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5@VfTuDg#]4+EV:.
+Dbb(ATVX'AKYo'+CQC7@<63:%15FBDg-86+EV:.+ED%:Ble!,DBNV,F*)>@Gp%$;+EV:2F!,(/
Ch4`2D]j(3G%kN3+Cf(nDJ*O%/e&.RCiaMG+ED%%A0>)aBPDO0DfU+UD.I$[-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\D0GA1qV1F*)>@GqNrE.1HW+D]j+4AKZ21
@<<VA@:OD%@;Kb*+D5V7+DG\3Ch7HpDKKH#.P;i?Cgh4&+CoC5DJsV>DIm<hF)tc1Bl&&;D..Nt
EbSruBmO>C%13OO?s@)OB5)68FDk].?!n*K%14gB+CI<=@l.k03H-]qEGR=J13dJRCc68nEbTi1
B4!i1+B2onF<G+.Eb/a&+Co%qBl7X,Bl@l:F!,16E+*6u+E)-?8l%i-+B3#c+Dtb7+Co2,ARfg)
A7]@eDJ=3,Df-\0@:O"fBlnVCBl5%c+DG_8Ec5K2@qB^(@3BH!G9CF1B6%F"BHU]0HXIt(I=5KG
A7]RkD/"*'A0>`#@;^-/De:,&AS,XoBl7Q+Bl7a$DIjr.Dfor=/0K+IEaj)@+CSf(ATD7$+CT.u
+Cf>-C3=E(FD5Z2F"SS0@;BEsF*2M7+A,Et+Ceht+D>2$A8Gg"@;Ka&FD,6,AKYl%G9CL9Ec#kM
%13OO1+j\W4C9dVAS$.'H=]!FFu2.$Bl.j93-&qQ2.L?-5%#L3Bl.R#@<-10+DkP&AKZ&:Eb-A$
C2[X!Blmp,@<?'g+EqaECNCV1DfQt2Bl[cpFD5Z2+Co%qBl7X,Bl@m1/0K"FANCqV>@:E+6r.0)
De*ZuFCfK$FCd(AA7/[kBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-
ATBG=De*ZuFCfK$FCd+):IIucC2[X!Blmp,@<?'5D.G(J%13OO1G0eX4C9m!F?!fLApA-;E-6;3
Ao)O4DfI]q1iRD@5%#L4ATMr9?tsUjCh\!&Eaa'$?m'B*+DkOs:K&BEDIal+Bl8'</g+,;ART?s
BkAK*AS#C`A1e;u%14pE+CI<=2`GZ$ATi',E-cY>EH>c5FZD<>BOYt#11*4Q+A$EhEc6,4+CT.u
+D#e>ASu$$?qO3_?m'8o@WNZ#DIal(DKBr@AKZ).AU,D=F`&=?DBNb(FCfJ88g&2#F*(u1F"SS/
@:F:#BOQ'q+Cf(nDJ*Nk+DG^9Eb/`lDKI!n+Eh=:F(oQ1F"Rn/%14sF+CI<=@qB4/H8%0lFD!OP
D)cAl@q]g?0Qh,R2.&OT+@C'bF(o/rEZee$A8,po+CJVeG$lF@@;Ka&@UWb^F`8IHATDj+Df0VF
+EVNE?qO3_FDl)6F'pUC<+oue+Eh=:@N]B++E2@>G%ki,+EMHDBOPdhGp$gC+EM47F_kS2@V$[$
@<-H4De:,6BOr<-FCB&t@<,m$F(KH9E%VS,%15!G+CI<=2JZo>Ddm[/@Q%q9F*_JFEA;;jF?*cP
@UD<,+@C'bF(o/rEZee$A8,po+CQC1ATo8*E,]B+A8-92FDi:0C2[W8E+EQg+Co&)@rc9mBl7Q+
BQ&);FDi:BF`&<o:IH=IATMs7/e&-s$9'R[?p%dS0PiX^CN=E13AbD`1LbJ]H?j"@@qoj9?Tqj?
<+ohc@!-R*Ci`u,G%G]'+CJeoEaU"<Anc-n+D5_5F`8IDDf9`=.3N/>ATJu3Dfd+1E,]AsEZfIB
+D>2$A8Gg"8g&"[D.Rc2GA2/4+E_R4ATDj%DfTE1+CJPa+E2@>E+O'+GqL42DK]T4FD5ArFCcS'
DIal%Bm;6Q:/=hX3ZqgBB6%B&BlbD7Dfd+1+E1b0F<GL6+A,Et+C]J8+DGm>G%G]>+D>2$A9f;A
BOu'(@rc-hFD5W*+CT.u+DkP$DKK<$DJ=!$+=^l;@<6K4B6%p5E-!K]%13OO3%c=]4C;T>1N[/E
3,rgp0kG0GATD9mCbR\aFu<r?5%#L#Df0W1A7]d(@:Wn_DJ()#DBNA,E+NotBm:bBD]iG&De(J>
A7f3lA7]glEbSusDJ()*Dg*=EAS,LoASu!hF!,17F(o/r+Co2,ARfg)A7]@eDJ=3,Df0V=@<,p%
BOPdhCh7-0%13OO3A)F^4C9pS@V'h.E+q7U2fpo61NPO%Cbp6P0PNOS5%#L#Df0W1A7]d(@:Wn_
DJ()#+CJYhBle6$+Eh=:@N]c+@<<W9Dfol,+EqaECERG-CLnVrA8-+(?m&p$F<GX<Dg*=B@VTIa
FE8R=DBNCs@r$4+F"Rn/%14gD/g+Oa?Xtm%FCo<!0f4/pG&1T/DI[?8E+(V;GAghP?m%gTDKBN&
ATAo%Ci"$6Bl7Q+@"'b:+CT=6@3BMtFD)e9Eb/isGT^pB+DkOs:K&BEDIak`Bl8'<+EMgLFCf<1
/g+,,AKYZ)D.Oi#Bl[cpFDl2F+Cf>-G%GQ5Bl@l3Df-\>BOu6r+EMgLFCf<1+DGm>Eb0<2ARfgn
A0>?,+CJ_oEaUL/$4R>M>@h\_/TboADd?`[$<0eh:L@jTA8Gt%ATD4$ARB:b1,fXL+^8]"A0>]&
FCfK$FCcS2Bl@lp-u!R/Cisf5Df0VLC2[X!Blmp,@<?'sBl@m*BlnH5AM.q>B.75'De*ZuFCfK$
FCei&<)5nX%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%
+D,P4+CJr&A8Gt%ATD4$ARI,"$4R>MC2[X!Blmp,@<?'g+DGm>@3AcH01o#.>psB.FDu:^0/$aO
@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM5JT@r,RpF!,+9Dfp"AFD,*)
+E2@>G%kJuEt&I\Ch\!&Eaa'$+E2@>B6%EtD/!m#>psB.FDs8o05P?EATD4$AT2[.B6%EtD/!m#
/n8g:055<7AU#h@FDYhC+EM[EE,Tc=%16]cEZdss@rGmh+EMXCEb/c(Bl5%c:IH=9Bk)7!Df0!(
Bk;?<%13OO<+oue+CoD#F_t]-F<G[G@:O(o+E1n0A8,po+CT.u+Cf>-F(o/rEb/c(@q]:gB4Z-,
AoD]4?tsUjCh\!&Eaa'$?nMlq<+ohc@UX=h+>Ynu@psFi+DG_7ASuR'FD5o0+@fF'6m-8VGp$gB
+EMX5@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+A$YtF`(o5F_,B7%16o[@V'@s+D"tk
BHVD*F))n,DIal,@;BFq+DGp?E,Tf=Bjtmi+Cf>,E+s-"+Co&*@;0OhA0>Aq@;]^h+D>J1FDl26
ATJ:f@X0)<Ec5c1Bl7Q+Dg#]4+EV:.+Eh=:F(oQ1+D>J1FDl2F+E(j7FD,B0+D,>(AM+E!%16KI
@V'1dDCosKA8ba]%13OO0eOSV4C9sk2/H_ZB6J!%G'Z)lG'%m_@PDp\0JG:i5%#L2AThd/AKYE!
A0>u*F*&O:DfQt2Bl[cpF<G+*Anc-sFD5Z2/g*b/3A*!@+DG_8Ec5K2@qB0nA8-'q@rri(AS,Xo
Bln'-DK?6o+<VeKBOQ!*@<,p%A7]RkD/"*'A0>?,+CKPC?m&j*I:+ZM<+ohcA8,[s@;on$+CT;%
+CT.1AU%]rE-,f4DBO%>+A+#&%144#+DG_*Ch7*uBl@l3F(8lpD.OhuDIal6Bl%T.EbTK3Ch4`2
BQA$6B4rDrCht4d+Cf>#AKYr#EcYr4B-;;7DesJ;Bl7EsF_#3(B+51j+<Y',De*ZuFCfK$FCei4
%13OO1+j\W4C:$'G%Yl91j(X#G;EZED09PI2.L0.@=!$&5%#L)DK]T4FD5ArFCcS=BR(_CDId=!
@UX:"@q]:k@:OCjEcW?G?sd:aBl5%c:IH=<Ec6)>+DtV)ATJu'Eb/Zp+A?3CAQU'oEc5H!F)u&5
B.b;rDfQt<Dg*==F`VX6$6UH6A8c?5F<G^IAKZ,5A7]dj@<*K#BOPpi@ru:&F!,17+D5_5F`8I@
@;TRs/e&-s$8X:W?p%dSFD><1BeqG&F)5MG2_o5YDK0i22dn[S?Tqj?6Z6gYASuU2+EqOABQ&$8
+EqL5FCfN4@:Nk"+D!0</g+Os68!.o+EML1@q?coBP:crD..]4DJsV>@rH1%EZf=ADfB9.Cj@WU
<HD_l+CIr2/g,4S@:NjkE,9)oF(J`3%13OO1bKnY4C;PTF*D,:C3F-51j=(fG'%DACGdq)An,Xa
5%#L3H#@_4GT^L7Ci=?.DJ()1Afu;<@;p0sA0>?"G\(D.BOu9sEc5T%DJsZ=+CT;2@<lo:D..]4
DJsV>@V$ZlDfTl0@rs=4$6UH6IXZ_T$6UH6+<VdSEHQ2AARlp)FE2)5B."f`+=KGs1,'h+0I/A,
0I\,++?MV3EHQ2AARlp)FE2)5B6,2>Bln#2DKTf-EbT$)-OgD*+<Z,^ILQVn$8jFY?p%e4BJF@B
0fF/0Ecj0PD)?*Q2_f&cG@G`&5%#L3Bl.R#@<-10/0K.W@;p1"DJ()0Df0H2F`)7CGA2/4+Dbt6
B-:c&@V'(\ARlp'F`2A5A0>r8EbTE(F!,=.Gp%!CF<G(3Ci=>:E,ol9ATDU43XlE=+<Z,^ILQW,
+<VdL+AP6U+A#Ku:+\1V+Cf(r@r$..D%-gp+<VdL+<VdL?T9_^?!JL_Ble59-YY:k@q6qr$6UH6
+<Ve@0f*<M4ZXrE3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E
0ea%D+<VdL+<W[(2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=
3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ea%D+<VdL+<W[(2`<NM1GU[=3B/rU2)I*E0ebUI
2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ebUI2`<NM1GU[=3B/rU2)I*E0ea%D
+<VdL+<W[(2`<NM-QmaYINU?f1E\Cp1E\Cp1E\Cp1E\Cp1E\Cp1E\2$+>,,d-SR811GgsI2`NfF
+DEGN>n%,`+<Z,^ILQW,+<XET<(/hj9Q+f]+Dbb0ATJu&Eb-A;Ea`p+ARlomAS,k$AKYW(Bl7Q+
FDi:@@;]Uo@kJm'BPDN1@ps6tCh7$c+EVNEE+*WpDds4`+<Ve8F)u&.DJ=!$+DG_%@q0Y%@<?''
FDkr+DK?qBBOQ!*@ps7mDfd+2AKWI6@<6.!Gq'qU@<?!mARlolAoqU)G@>N&F"SS)Bm:'o+<VeK
BOu6r+DG_*Eb065ASuT4DdmHm@ruc7GA2/4+DkP)F^])/9OUn3=<M0cBlnDW+EM+*+CK>9CghEs
G\1u?DfTB0?nMlq%16KIASu$1FDk].?!n*K@WcC$A86$nCghEsGVV!K67s`sF_PZ&C2[X!@<?(*
+EK+d+<Y<.DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T/a%15is/e&._
67sBMBl%@%+CT;%+Eqj?FED)3+EVNEFD,5.E-67FA8,OqBl@ltEd9$R+CoD#F_t]-F<G+.Eb/a&
DfU+U%15is/e&._67sBhF)uJ@ATKmT@s)g4ASuT4G%G]8Bl@m1+E(j7E+*WpDdsn<E+*WpDdsnF
/ibO=/hnJeEZf1,FCfJA%15is/g)8Z+<VdL+<Ve:BOt[h+Du+?DBL?,84c`V5u'gD6R`HO:-pQB
$;No?+AQhtATDg0EZek*ARfLiDJ(R2$;No?+AucjF_Pl-F!,OG@;]UaEb$:b+E2@>Anc'm%15is
/e&._67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sB4/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)o'D..]D1*CUKG%l#/A0<:HH?s=EA8Pah
DI7KsGUX(/:-pQU1,*QRGqh&s.!g2cC2[X"@;0U3@UX@-+CSekARl5W:-pQU1,*QRGqh)t-no.I
ARTIuAU#b8@<<q@@:Wn[A.8l@67sB90Pt6D0fU:dBle60@<iu)F_PZ&+C\c$+D,P4D..O.ARlp*
D]j(CD@HqJ67sB90Q(fP1,U1_A7T7^+=LuCA7'7uBk;KqFCf\G%13OO@rGk"EcP`/F<Dr?@<6!-
%17,eEHPu9AKW*<-YdR1Ch\!&Eaa'$-OgDmDe!TlF)rIGD/a<0@p_Mf6#(=KCghEsGW@cE?Q_Km
+=BH@6#(=KCghEsGW@cE-QlV9@rGq!@<6!&4=<E\6#(=KCghEsGW@cE-OgDmDeX*1ATDl8+=Cl<
De(4)$=e!gDKBB0F<D\R@;9^kCh\!&Eaa'$-OgCl$;No?+D,2,@qZu-@WcC$A0?#:Bl%L*ATJu&
DIak^:IH=>DKKH1Amo1\+Dbb5FE7luFDYu5Ddso&ATT%V3[\rZ@:UL)EbTW,+C\noDfTE1FE/L6
BOPdkATMs6+A,Et<_Yt)8U=!)6tpO\ATDBk@qAS<5u'g6;FDX!H:gt$FDl)6F&Q%(:..BG6m,'I
8l%itFD5W7ATDBk@qAS<5u'g6;FDlA$4R>;67sBjF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"
DKI"3Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj+F?.r/jrN%<(LA';cI+28l%in@VQ>Z
-VA;jDBM>"+@9LPATB.@F(KH.De*ZuFCfK$FCcS*Dds4`%17,oDfg)4GWe)1-[L)bC2[X"@;0U,
%13OO:-pQU-[L)b-Qm87CLqQ0FD,B0+D,>.F*&OCDBNt2G%G]8AKYMtEb/a&DfU+GAnc'm+DtV)
AKZ&4Ecc@3$7Bk(+EV1>-TsL59gM-E:L@OFDe*2tB4Z0-Ec5l<FCf\J-XUt,GUEq-FCf\[3ZpM2
3\5AaGRY"%AU$@!+=JTj,CY(dG%G]8Bl@l6IXWLp-S.>5HV.(%<_Yt2+Cf(nDJ*O%FE/LGAU"Xk
.!0B"+EV1>.3NhTBlmo/A8bs/Ec5l<FCf\J-SBLPGUEq-%15is/g+b;FCSu,Dg#]4G%kN3+DbJ.
AU#>+DIal"Ch7$q+DG_8ATDBk@q?d)AU&;+$7Bk(+E)FFAU#Rc3Zq-_6W-]e@;9^k?Q`umF<DrG
De*3nG%kN3?Z]k(-OgDsAmo1\FCAfF3Zoe4.k?!^De*Qo@:Nkr/M0.6%17#sFCf\[3ZohbAmo1\
FCAf)@V'.iEb0<6EZdGj3\52mFCf\G/88^)@qBajB+51W$;No?+CT5.ASu$$@s)g4ASuT4Bl8$(
Eb8`iAKZ&*@ruF'D@HqfAmo1\4ZX]=3dr3#/kL@]:IJo7FCfK)@:NkI<'a8I5uL*%8U=!)7!*?c
Ci`NS5u'g6;FE'-H:gt$F`_>8FCfK)@:NkI<'a8I5uL)[$?(*0AU$@!+E)FFAU#aS1*]I^.4clZ
DfT]/Amo1\FCf\>C1^maALT/c,>:Q9$7L"78g&%qFCf\G+Eqj?FCcS*Ddt=GH?s=EA8cX*ATobK
AU#R3$4R>;67sBQ:IH=8CghC+ATJ:fC1D'C3ZpLF-YdR1Df-\4De'u*De*p2DfTD3C2[WnDdji(
De*]nCLnW'De+!4Bl"o,De*s.DesJB%16onGWe)1B6%p5E,8s)AU#OS4s4TMC^g^\$;No?+EM+9
+DG_8ATDBk@q?crH#R>8Eb/i*FCB3&ATVu&$>ag/4ZX^#Amo1\-?Ea?BkCd`ATV@$B6,CP4s4Z`
GRXuh$;No?+E_a:+=DJ]-QmAKAS,Y$+EVNE@<QR'A0>Au@<6*nF!,[@FD)dEC2[W1+>,9"A8bt#
D.RU,+D,>(ATJ:fFCf]/Bl%@%4ZX]64CiA?.3L/g/j:C+4=>H$-Rg/h-8%J)C1D'&/1)u5+?V#(
FCf\E+:SZoFEepPEbTW,-8%J)FCf]/Bl%@%%13OO:-pQUB6%p5E$/V4Bl%<&@UX@gBHVA+EbTK7
+>"^P@<?(*+E_d?Ci^_@BOQ!*@rH4'Bl%?'B4YslEaa'$A0>JuCh7Ys$>OBdF_PZ&FCf\[/g)Pi
07G-pB6%p5E.0$\0./;kDf9`>AU#XH@q]:gB4Z.+EZdtJ6<-TN6rZTW%14M*Db*Z&<$5pl@WcC$
A9;C-.3NhTBlmo/C2@@%Bl%<h@<=Xb+CoD#/95ZIFED)=/13&Z@<<k+$?L'&F`_SFF<DrPBOu!r
+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL-RU8h+AP6U+AbHq+Cf>,E+s-"+C\c$%13OO:-pQU
BOPdhGp$R)FCSu,F(96)E-*4EBOQ!*Eb0*+G%G_;FCf\MCghEsGT_*>D/^V0Bl%@%%14J'@j#Z4
F=044+AG-h;GUY.C2[Wi+D58-+=CZ8ARTIuAU%Qk@<<k+$7L"785E/`+?Op2/8fWQ.3NhTBlmo/
A8bs/-SR5aCh7$mFCf\L@UX@+%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*WD/a<0@p_Mf
6#(=KCghEsGW@cE?Xe.lCh.:!A8Gt%ATD4$ASbdsAU#sb:-pQ_@WcC$A86$nCh\!&Eaa'$CghEs
GT_&Z/Kc0KASu("@<?(%+EMgGFCBD:BPD*mCh[NqFCeu*C2[X!Blmp,@<?''F)Q2A@q?cV@8pf?
/e&._67r]S:-pQU7VQ[MF!+n3AKZ2;BlnH.DBO%>+EV:.+E2IF+Co1rFD5Z2@<-W@F!,"3@s)X"
DKI"3Bl[cpFDl2F/e&._67r]S:-pQU@<6L4D.RcL+CfP7Eb0-1+Eh=:F(oQ1F!,C5+E1b,A8bs#
-u`U4A8bs#1+kR>0eP1'DfQt:@<?($.1HVZ67sB'+<VdL+<VdL@q]F`CERM5F`&<M<(KSZ:dIiE
:I?Q?$;No?%15is/g*o-+D#S6DfQt1BOt[hBl7Q9%15is/g+&'EHPu9ATJu8FCB&t@<,m$8g&(n
De<^"AISuA67r]S:-pQU@<H[*DfRl]+A-QcDBM>"+@9LPATA4e:-pQU@rc-hFCeuD+>PW+0Pt6D
0ea%D:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/I`%^67sB90Pt6D0eskmBQ&);Df0B:+=LuCA8Gt%ATD4$AM.G#F=@Y+:-pQU1,*QRGqh9$A8-+(
CghT3@WcC$A0>>iF<G16Ec#6,FCeu*FDi:BF`%Wq%16T`@s)g4ASuT4-XpM*AL@ooEb065Bl[c-
+<W%HDe*ZuFCfK$FCcg/$=e!aCghC++EVI>Ci<fj5s[eODe*ZmFCf\W3B:Fh4ZX]55s[eODe*Zm
FCf\W3B8H0>9IEoATD4#AKX)_5s[eODe*ZmFCf\W3B8Gr$=e!gDKBB0F<D\RBkhQs-OgDmDeX*1
ATDl8+=CT4De*ZuFCfK$FCcg/$4R>;67sBjF`MM6DKI"?F`\a:Bk)7!Df0!(Gp$X9@s)X"DKI"3
Bl[cpFDl2F%16Wa@m)jq6r-0W?Y"(a+Bot!Ddkjj+F?.r/jrN%<(LA';cI+28l%in@VQ>Z-VA;j
DBM>"+@9LPATB.@F(KH.De*ZuFCfK$FCcS*Dds4`%16`gE,K*$AN`'s-YdR1Ch\!&Eaa'$-OgCl
$;No?+D58'ATD4$AKYW+Dfp"ACghEsGRY!pChI<s4ZX]uEc>i/F<G4:E,K*$AIStoEapdGC2@p/
Dfd+:CijB5Ch4`(Ci=K2ATo83Ch%BoAKY`(@WcC$A7Ath-TsL5C2@NoD@Hp^$;No?+D>2$A9f;,
@<?!m+EM%5BlJ/:FD,*)+ED%1Dg#]5+EV1>05P'=AU#>>ASlB/Anc'mEt&I(EapgHDK^+L4ZX][
5snOG?X[\fA7$HlATT%B@r,^bDKKH7?XdGc-OgD2FDj]G;cFl$HTE]qG'#/UGB.D>AKYN%@k8u]
0Onp1@;^0uGV3H6F=.M)%15is/g,%?D.RNpF)rIIATD5h$7I\Q3Zp+*+ECsG+=\udEapg5$>F*)
+>GH/Gp$X9/e&.1+EMC<F`_SFF<DrPBOu!r+=ANa/1>%<EHQ2AAT_u8C2@@%Bl%<h@<<qL-RU8h
+AP6U+AbHq+Cf>,E+s-"+C\c$%16Z_F(Hs5$6UI4D/XQ=E-67F-Ugp2:Js4rB4YslEaa'(DJ((c
@8pf?+>#c"-Tbs]E,K*$AISuXDIb@B+:SZ,%13OO@rGk"EcP`/F<Dr?@<6!-%16T`ATD4#AKX*W
D/a<0@p_Mf6#(=KCghEsGW@cE?Y!_[@<HC.<HD_lCLqd41,Vfn/g,:XATDQtH#kTJAnMP[:-pQB
$;No?+B)i_+EqO8BcqA'B4W30GBYZSF)PZ4G@>N'/n8g:05>]FCM>FlF_PAtF"]n!DJ!Tq01o)`
03*()E_BthEt&IO67sBhCiaMU+D>k=E&oX*C3+<*FE_/6AM.J2D(fO9FDPZ4F>%WUBk1d-B5)H@
@Vfsl05Y-=FCfJGCh[?3@UX=h06M>IEbf63F"UsAE"*.L67r]S:-pQU7<i6XE,9*,3XlEk67sB'
7Pd+\4&'F,ATN',AT24$4)AhDA0<7K@:WneDK@ID@;TRs05YE@ATN',AT24$06LuQA1hS2F!hD(
:-pQU+@C6kCb&%<0KVd@Df]u.Ed9`UEc6/CARB1Z-YRUDE&oX*GB\6`C3+<*FE_/6AM.J2D(fXJ
BkqE9<c;JV@WcKqEd9<.Ci=B9@<-W@%15is/e&._67sB)6Zd?b.n2E@%15is/g)?*FE21J;eTlW
F=Tg=+q4lS67sB);eTlWF=Tg=+q4lS67sB)7Q2M#$;No?+<j0pEbm6q2^/\<:-pQU,"$HmCb&Ft
BkDH;7Q2M#$;No?+<j`tBkDH;7Q2M#$4R>;67sBOASuO6-Z^CS@Wcd7/Tk]BGp4@k/hf%'GAhM;
@<-:/DIdet$;No?+?:T+1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b3ZpF+
3\iZB-Rg/h+=AT\>9GpL3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a-RU8h
%15is/g*.t3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fN
FCcRT+Z_A:,VTZ7%15Q[4#&fpASkjkAKX?_EcP`/F?:jF8PN#(Eb0)rCLnVuF`MM6DKI68$:AoU
Cb%t14#&fqATT%^F`MM6DKIrf:.\/V+EM+9+CfP7Eb0-1-OgDMFE21J;eTlWF=Tg94#&fbF_u(?
:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1%15IE
Ebm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<rASc<I
C2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4
+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ77Q*=_4&fd4F<FM!DeioG-Vd6-:`sgrDeio,
FCfN8-OgD]BPD(#.n2EY0fr?GF*&Nk@<6-m4"!cp9i)sA@<6-m+EV19F=1a9F*)>@H"q8.1,fXL
B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]
%14=),9S]n0J5+9+>"^(ARf:g@V'R&0ek4%1,(I<+=L$&Bk)1%DBMtgEbSs"F<F"_Bln'-DCH#%
%144-+<Y'#@Wl--@;Ka&@UWb^F`8IHATDj+Df0VF+CSekARlo8+EM+*+CJr&A1hh3Amc&T%144-
+<Y'7F(JlkH!hb=@<3Q*DI[U*Eb/a&Cj@.7G[kQ4A8,po+DtV)ATJu<Bln#2-XS5DBl5&6ATN!1
FE9&W%13OO+=\KV6tp[Q@rri$H[B-C/hSb!@"!H2+Co%qBl7X,Bl@m1+Du+A+EM[EE,Tc=ARlo8
+EM+*+CJr&A1hh3Amc`(%143e$6Uf@+@TgTF<G(3D/E^!A9/l(Ble60@<lEp+D,P4+A,1'+EVNE
Eb0*%DIal4F(KB5+EVNE@;KauG9C@8Dg-86EZf=>E$0:BF"Rn/%14=),9S]n0J5+'/Kdf,G%GN"
ATAnR/0H]%1,'h!6#C%VDf-[i+AZH]ARfg)6tp.QBl@ltEd8coDf9D67:^+SBl@l<%13OO+=\KV
?tsUjCh\!&Eaa'$?m'DsDIdZq02,eRAQU'a@<6!j+CoD#F_t]-FCB9*Df-\>Df9G7F`:l"FCeu6
+EM+*3XlE*$6UH6+BqieBl7Q+C2[X!Blmp,@<?'d-tm^EE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F
3A5,U@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@OV`n
%144-+<XEjG9B1g@<uj0+E2@8DKKH#+D#(tFD5Z2+E(j7FD,5.-qYUX@VTIaF<Etc@ruF'DIIR2
.9gJ-FDu:^0/%NnG:m<@@<uj0/n8g:04]#T681An1.sr.:./A?%144#+<XWsBlbD2F!+m6@W-1#
+Eh=:F(oQ1+E(j7FD,5.A8-+,EbT!*FCeu*?tsUj/oY?5?nNQnAfuA;FWbm:DKI"CD]j+DE,]`9
F:AR"+<Ve!:IH=9AThX$DfBQ)DKIEP@rH7+Bk1dq+E2ID@q]:lBl7Q+@3B&uE-X&Y8S0)eBOr<*
Eb/`lA8,po+Dbb0CER4tBl%i"$6UH6+EM+&Earc*H#IhG+Dbt+@;I&PD..a/DBNP0EZea];aO52
0f(j53B&rM3&NQM3AN<D0fNKYEZdYb@<uj0+@/pt:*==`Gp$K]0K;c^90u?J6spH2%14=),9S]n
0J5(&/KdbrEarc*1,pg-1,(I;+=L0,@qf@f+@KpbFCB&sBl7Q+7:^+SBl@l<%13OO+=\LAC2[Wm
F^eo7Bk)'h+CT.u+CJr&A7KakAM.q>B4,.YA7]:(%144#+<V+#+<VdLF(JoD+CJr'@<?0*-[m^W
A7TUrF"_0;DImisCbKOAA1q\9A7TUg-X[Aj%144#+<X[*AS-($+D,P4+EM+9FD5W*+AYoYBk)(!
F!,R<@<<W$Ea`ir+A,Et+Co2,ARfh#EbT*+/e&-s$6Uf@+=M;BFCKB,Ch.'jEcWZPD/Ws!Anbge
+EVNE@rc-hFCcS'Cht59BOr;sBl[cpFDl26ATJ:f+<VdLEb065Bl[cq+C]U=FD,5.D.-ppD]gH;
F_PZ&C2[WnBleB:Bju4,Bl@l</g+,,BlbD<Bl.g*BkD'jEt&I!+<VeJATW$.DJ()7E$0%0G9Ca2
@q]RoATJu+DfQt0F_PZ&Bl7Q+8l%ht@:WneDK@EQ%13OO+=\KV?t!SVCi<`mF(96)E-*gB+Du+A
+DG_7F`M&7+EM%5BlJ08+CSekARlp*D]iG:@rH6sBkL[lFCB33F`8sIC3*bl$6UH6+D>2,AKYA5
Bkh]s+D#e>ASuR'Df0VK+:SYe$6pc?+>GK&/heD"+@KdNASkmfEZd@n+>PW*3?T_>ART\'Eb-@\
Df'H0ATVK+;IsZU@<6!/%13OO+=\LA@V97o?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?m&Nb
FD)e=BPDN1@:Wn_FD5Z2+CT)&%144#+<YW>@;]soA0=K?6m-)Q@<?X4ATJu&Eb-A'Df'H0ATVK9
+@^BiD'3_7G9CgA+A,Et%144#+<Y0-@;]^hF!,[@Cht5(Df0W1F*&OCAftQ*B-:f#G\(q=@;]Tu
DfBf4D/"<)FD5Z2F"Rn/+<VdL;flGWBl%L*Gp$gB+Du+A+EV:.+D5V$Cb?/(%144-+Br5_B4Z0m
+A-cqH$!V<+A?3Q>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=
De*a(FCep"DejDI<HDklB-f;e8l%i$1,)%'@r$4+,r./EATTP=E-Z>1.1HUn$6Uf@F)Po,+DkOs
Ec6"A@;]TuFCfN8F!+n%C3=T>ARlp*D]j+DE,]`9F<E:t+Z_G&@q]:gB4Z-:%13OO+=\LOATo8)
@V97o?m'Q&F*&O7@<6"$+DG^98l%htF)Q2A@q?cnBk)7!Df0!(Bk;?<%13OO,9nEU0J5@<3B9)B
/Kd?%B6A9;+>Pr.+>PW*3=Q<)$6Uf@E+*iuBHV>,Ch7$rAKYT!G\(q=F*(i2FEMOFAmoCiF`M%9
AoD]48g$,H0JO\ZATV?4BHU`$A0>>mH#IS2/e&-s$6Uf@?qiph:-hTC?m'0$@rc-hF(Jl)FDi9V
1,pCgEc5e;2D?a+<+oue+E1b0@;TRtATAo'Df0Z;DesJ;FD,5.D..['D09\)$6UH6+DbV,B67f0
De:,,+DtV)ATJu9BOQ!*@ps6t@V$['FDl22A0>T(+A,Et/g*`-+Ceht+C\n)F(KG9FDhTq+<VdL
G%#30ATJu'ATW--ASrVF+CT.u+>Pf3/e&-s$6Uf@+CK5,?n<F.EccD2+CSeqF`VY9A0>u4+EM[E
E,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO,9nEU0J5@<3B9&A/KdMo@WHU"Ed8c^1b9b)0JPR1
-rsbmASuU(DIk2:+@KX`.1HUn$6Uf@?ugL5?m'0#E,9*&ASuU$A0<HHF(Jo*?tsUj/oY?5?k!GP
$6Uf@>@;JrF'p+_F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E904Ja9
@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB;IsK`Cgh?11,).AE,oN2F(oQ1F"V0G
H#@(?%13OO+=\L+F`;VJATAo2DffQ"Df9D6G%G]8Bl@m1+E(j78l%htCggdo+EM+*3XlE=+<Xl\
:IH=A@:C?sDffQ"Df9E4>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(MCEb/f8D..L-
ATBG=De*a(FCep"DejDC%13OO,9nEU0J5@<3B8u?/Kdi!FDkW"EZd(n/0H]%0fTUL%144-+CK&(
Cg\B"D/a<&D.RU,ARlo8+EM+*+CJr&A1hh3Amc&T%144-+CJc&?m&lgC3=T>ARlp*D]j1DAKYAl
A8--mC1qZq?m'T0A7]d(?qNsg?nMlq%144-+<Y0-@;]^hA0>8rB4*85?tsUjDf/r*FDi:CF`;;<
Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%144-+CIW+6VgHU:J=2b+EM+9+DG^9?uU.)Anc'm/no'A
?m%$DF`V,+F_i14DfQtAATW$.DJ()2Eb/ioEcP`%+CJqoDf0W7Ch551G\(8*ARoLsDfRH>$4R=b
.Ni+k;bp.r/0J=s=]@pf:1,Uq?rKor?m';p@rcK1DfBf4Df-\>AU&;>@rGmhF!+n%A7]:(+@0g[
+A,Et+DkOsEc2Bo+<VdLFCf]=+DGm>F*)>@ARlolF!+q;FCfMG+B3#c+Cf>#AKY].+CQC/@:Eea
/g*`--Z^DQF(Js+C`mh<+CT5.Cj?Hs+<VdLFD,5.CggdaCi^_-F!+j_;aXGS:fLgFFCf]=+DGm>
AU%crF`_2*+EqL5Ch4`-FD,6++EVmJATJu&Eb-A2DfdT@$4R=e,9n<b/hen<3Ahp2+AH9i+>Po-
+>PW*3$9VDASl@+Bjkg#6t(?`F`:l"FCcm1$4R=b.Ni/1A7]9o?qj3p779pP78dM9DJsZ8+EVNE
?uBCiARf.jF'p+B+Dkh;ARlolF)u&.DJ`s&F<GLFATDg*A7Zm*@:q2%$4R=b.Ni>;EcZ=F8l%ht
Eb0&u@<6!&FDi:DBOr<(ATo8$8ono_FE_/6AKXKWF@^O`>psB.FDu:^0/$sPFD,f+/n8g:05>QH
Aor6*Eb-[B@:WneDBNt2E,Tf3FDl26ATKI5$4R=e,9n<b/ibOE3AVd0+AH9i+>PZ&+>PW*3$9Vk
ATMr9De:+aF)PZ4G@>N'+@f"&+ED%4Df[?:$4R=b.Nh&hBOQ'uDfp(CDe:,"A8lU$F<Dr/:JXqZ
:J=/F;C=ORIR6_(7jh[e@q]:gB4YU++:SZ#+<XL$BlA#7FDi:DBPDN1Eb0&u@<6!&Eb0&qFD5o0
+EDC=F<G16Ch.*tF!,[<Eb-A)G]7)/A7]9\$6UH6@;]TuFD,6'+CSekARlp*D]j.8AKYB%@rc:&
FE8QPFsgZ?Ch[s4/g+,,BlbD;ATN!1FCeu*Bl4@e+<Ve7F(96)E--//+Dbb0ATJu1Bkq9@%144#
+<VdL+<V+#+<XWp=CuSTE-Q59+<X$403*()EcWmKDeO#D0JG16C2[W9A8bt!06:WDBlJ/I<+T0D
E`[4)D/:h=C3'gk+<VdL+<VdL%144#+AQj!+CJr'@<?0j+=^l>DJ!TqF`M&(.NieSEbTE(F!+n3
AKYl/F<G.>E+*WpARlp(ATN!1FD5W*+DG^9%144#+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL
+<VdL%144#<+T0DE`[4)D/:=;IR6_(7k[hQ=CuSTE-Q59/no'A%144#%144#+B3#gF!+t2DJ!g-
D0$hAD]i_3G9C:7@rc:&FE:h4BOPdhCh7Z1@:WneDK@E>$6UH6+<VdL+:SZ#+E2.8F<D\KIUQbt
Df0VLB6%F"BPCst05t`GF>%TLDfdUGC3'gk+<V+#+=\L4F`;;<Ec`F9DfQsm+>ti+0d(%FA7]9o
@;]Tu@;Ka&G%G]8Bl@m1+E2@8DfQtBD]hXp3%cmD+CT;%%144#+Du+A+E)-?Ch[Km+EM[EE,Tc=
/e&-s$6Uf@?uBCiARf.jF'p,#BOPdkARlp*D]iY+GT^^<A8-'q@rri1Bm=3"+CT>4BkM=#ASuT4
ATDg0E\7e.+:SZ#+<VdL+<Ve%67sB/B5DKqF"&5U@<3Q'@;0OlDJ()1DBO+6Eaj)4Ch[Zr+EV:2
F!(o!+<VdL+<VdL:-pQU/Kf.KATD?)@<,p%DJpY7Bm=3"+CT>4BkM=#ASuU2/g)8G$6UH6+<VdL
+Dkh;ARnAMA8-'q@rt"XF(o9)7<3EeE]lH+1a"h%0F\@3+<VdL+<VdT9kAE[De).SB6A'&DKKqK
4Y@j2%144#+<VdL+<W(EF`(\<4ZX]i+=eQg+=\L>%144#+<VdL+<W*B$6UH#$6Uf@5p1&VG9Cd3
D.OhuDII@,F(o\<FCAf)?mn,u.6T_"+D>2)+C\nnDBN@uA7]9oFDi:0DIIBn@psJ#?m'Q0%144#
+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqP+B3#c+D,P.Ci=N3DJ().AS5_!Bl.:#AKXSfE+*j1
ATDZ2%144#+DGm>F`V,)+DG^9@3BH1D.7's+E(j78l%htGAhM4F"Rn/+<Vd9$6UH6+<VdL+AP6U
+E)F7EcPl)AKYi(G\(D.@<6L(B5VQtDKKqB-p0O>4ZX#Z+<VdL+<VdL:-pQU-tI3E+CT5.ARTV#
+EVNE@V$ZkDffY8Ci<flC`m/(A0>N$Ddm-k%144#+<VdL+<Y344Y@j*4C9jl/noPZ+=nil4s36m
;b:(Y:(7OQ+<VdL+<VdTA8WhZ3ZqsAF:AR"+:SZ#+<XWsAKYr4AThd+F`S[8BOPdkAKYQ/E,Tf/
A0>u-BlbD2F)uJ8+DG^98l%ht@rGmh/g*r5ATDg*A7ZlnDf'?&DKKq/$6UH6BOQ'q+C\nnDBN@u
A7]9oFDi9o:IH=LDfTB0+E_a>DJ()6BPDN1E+*j1ATDZ@+<Vd9$6UH6+<VdL+<Vd9$6pc?+>>E.
/ibpG+>"^*AR]\&@<-W91,ga,1,(FA%13OO+=\LAATV<&@:X+qF*(u(+EVNE@V'Y'ATAo7F`;;<
Ec`F8A8-."DJ()9BOu'(Ecl8;Bl7Q+8l%ha$6UH6+DG^9?ts1iDKB`4AM.P=ARHX%ATMp,Df0VK
+B)i_+CJr&A9Ds)Eas$*Anbme@;@K0C3*bl$6UH6+EVNEF(Jo*BQ&);FDi:3Df00$B6A6++Cf>,
D..<m+Dbb0AKYPpBln96F"SRE$4R=b+<VdL+<Ve%67sB[AU&;>ARoLsDfQtBD]j1DAKZ21ASrW2
F`))2DJ((a:IH=>DBL?B@rH7+Deru;AU%c8+E)-?=(uP_Dg-7FF*VhKASlJt$6UH6+<VdL+AP6U
+Al)k8k;l'@rH6sBkMR/@<?4%DK?q/Eb-A2Dfd+>ARf:mF('*'Cj@.3E,]W-ARloqDfQsKC1D1"
F)Pl+/7j';.1HV,+<VdL+<Vdq6pjaF;bp(U?X[\fA9E!.CgT=d-R(o=>YoHZB6%Et+@^']ATJtB
GW7T1>]+J%AT2'g.k=kBDffQ0@:Ul=/nK9=+t!g,%144-+<Y',De(J>A7f3lF`:l"FCeu8%13OO
,9nEU0J5@<3B/r?/KdbrEarc*1,(7%1,(F@+=M;LCh[s4Bk(^'%13OO+=\LAATV<&@:X+qF*(u(
+EVNEF*2G@DfTqB?u]pqA7].$+A,Et+D58'ATD4$ARlp*AU&;>DJs_.$6UH6DfB9*F!,17+CK2(
Bk1d_+D#(tFDl1BGA1r*Dg-7T+CK2(Bk1d_+Dl7BF<G%(+E_X6@<?'k%144#+EVNEF*2G@DfTqB
FD,B0+D,1nFEMV8/e&.1+<V+#+<VdL+<VdL:-pQUARoLs+DG^9EGB2uAISth+<VdL+<Ve<A0<7D
DfTB+@;TR'%144#+:SYe$6pc?+?;&7/ibmL+>"^%F_>i<F<E:l/0H]%0f9CI%144-+CK+u?m'K$
@:X+qF*(u(+>"^EA7T7^+CK5$EHPu9ARHWjDf'?&DKKH#+E)CE+CT=6?ufguF_Pl-?k!Gc+<VeD
@<iu5Dfd+1Cj0<5F!,%=ARfk)AM+E!%144#+<VdL+<VdL+>G!XBk(p$2'?gJ+=ANG$6UH6+<VdL
+AP6U+A,Et+ED%+BleB:@<?4%DK@i]0ea_9F_;gP0JPF-0etdD1cdHM%144#+<VdL+<XEG/g,1G
EHPu9AKW@5ASu("@;IT3De(4)$6UH6+<VdL+>Y-\AS5O#4s58++E(d<-QlV91E^UH+=ANG$6UH6
+<VdL+ED%+A0<7BFD5Q4-T`\c3\P5dA1r(IBl%iD-OgD*+<VdL+<VdL+<VdL+<W9h/hRS?%14=)
,9SZm3A*<O2'=In6$6g_F*&Nb/0H]%0f9CI%144-+CJYrCg\Ap@:O(qE$0%,D.Oi+BleB;+DG\3
Ch7HpDKKH#3ZrKTAKYAqDe(J>A7f3lAoD]4A7]jkBl%iC%13OO+=\KVDIn#7FCfN8+EM%5BlJ08
+CSekARlp*D]iG&De*p-F`Lu'?m&uo@ruF'DIIR"ATJu+DfQt.@W$!i/e&-s$6Uf@?tsUj/oY?5
?m'T2A79RkA0>K&EZeb!DJW]5%13OO+=\LADe*5u@:X+qF*(u(+EVNEE,oN%Bm:b@AS5^uFE1f3
Bl@l3@rH4$@;]Us+EqOABHU]'AT;j,Eb-@@B4YslEa`c;C2[W1?nMlq%14=),9SZm3A*<O0H_qi
6$6g_F*&NZ/0H]%0f9CI+<V+#+=\L"+Dtb7+EV%)+CHTN3[m3Q?m'0)+ED%'DeEs%H=^V0@X0)(
@rH4'C1&Y:=(l/_+EV:2F!,R5B-:o0+E2@4F(K62%144#+DG^9@3Bc4Eb$;/De!3l+DtV)ATJu&
Eb-A3@V0b(@psIjA0>?,+CJ\tD/a5t+DG_7FCelk+E(j7@V'7kB-;8/DfTr2DIm?2+:SZ#+<XWs
AKZ)'B-:S1/M8J83aa(KG%G]7Bk1dr+E(_$F`V&$FD5Z2/g*r!Ap&0)@<?4%DBNFtDBND"+E_a:
Ap%o4AoD]!$6UH6GAhM4F!,R<@<<W4F`&=7ASu("@;I'-@rc:&FE8RKBln#2?n``b0OQLU+AZHY
F`V&$FD5Z2+DkP&ATJu3@;TQu@r,RpBOu5o$6UH6Amo^&Ch7[/+Dbb-AScWE+B3#c+CJ\tD/a5t
+D#G4Ed8dADBN>%De(J>A7f3lBOPs)@V'+g+E_X6@<?'k+EVN2$6UH6A7]glEbSuo+EV:2F!+t+
@;]^h/g(T1%144-+E(_1Des!,AKYAO<)$%o+CoD#F_t]-F<G:8A7^!.Eb0*+G%G2,Ao_g,+Cf>1
AKXT@6nSoU%144-+DbJ,B4W3'Dfor=+ED%1Dg#]&+D,Y4D'35/FD5Q4?m'Q0+ED%(F^nu*A8c[0
Ci<`m+EM7CAM+E!%144-+CJbk?m'?*G9CR-DIdQpF!)lK@;TR,FCf]=.3N&:A0<:<@;TR,@r,Rp
F"DEEG]YAWFCAWpATKIH%13OO+<VdL+<VdL:-pQUAn?'oBHUbm@r$4++Eh=:F(oQ1F!,C5+CQC:
DfTA2@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+C\tpF<E\-/mg=U-QmG@@P0Dj+ED%&0f^@s
AR[8G3?W?R@P0>n-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$/e6
Dfp"ABOtU_ATDi7@;]TuARoLs%144#+<VdL+<W%P@j#Z!F=044+>P&o+C\tpF<E\-/mg=U-Qm&8
ART+%0eje[Df76_0d(+BART+%0KCKi$6UH6+<VdL+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq
+C\bhCNXS=D.-ppDf[%0DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL51a$7?ATT%W4"akp+=A:U
AM,\n+CT;%/hf:.@UWb^ARmDI1E^gZ-OgD*+<VdL+<Ve<A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,
@q[!(@<?0*GAhM4F!,[@FD,T8F<G+*Anc-sDJ()#DIal$A8-,p$6UH6+<VdL+=D2>+Dt\2-TsL5
0H`)(+D58-+FPjbA8Z3+-ZWcG%144#+<VdL+<Y6++Dt\2%13OO%14=),9SZm3A*<N1E\7l8p+rq
+>bVl1,(F?+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3
@rGmh+CJP21ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqB
FD5T'F*(i-E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#
+EqOABHU]"@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,
@;]^h%144#+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8
F(KH7%144#+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;s
Bk)7!Df0!(Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b
+<VdL+<Ve%67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK
-TsL50Ha^W1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nl
Eb0E4+=ANG$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj
.3NM:D.Rc2Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@lt
C`m7sGp"MIF=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%
67sC'E+EC!AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK
%144#+<VdL+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`fr
FCfJ8?rBEm5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1
@;Tt)/g+5/ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%
D/aP=@<,p%F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.
%144#+Eh10F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(
+CT.u+EqO9C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1
G%G]8Bl@lA%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.
Ch4_sC2IC#FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=
@rc:&FE9&W;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[Wn
De!p,ASuTt+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1
+<Vd9$6UH6+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8
Bl7R)%13OO+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdL
A8lU$F<Dr/78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%
DdmHm@rri8Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1D
AKYl%G9C:(E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9
AU%p1FE8R5DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,
F!,+,DImisFCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F
;ICVXDe3u4DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#
+D58'ATD4$ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*t
F"Rn/+<Ve7;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3
F*&O=D@Hpq+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6
+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO
+<VdL+<VdL:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL
+CoG4ATT%B;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k
+EM%5BlJ08+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$
Dfp#:@;TR'%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKo
Ddt7>GAhM4F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+
G%G2,Ao_g,+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6
@;]Tu?u:-r+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$
B-:o*E,ol?ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ
6nSoU%14=),9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-
+A,Et+DbIqF!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.
Bl7j0+Cf(nDJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E.
/ibj5/KdbrEarc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5
AKZ&.H=_.?GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%
DfT\;E,TZ8Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+
A0N.8CghEtDfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li2
9PJBeGT_'QF*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4
H=gl-ATM6%A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!
%144-+CJ/[F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[
<+oue+EM77B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043
EbTK7+C]U=AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXC
Eb/c(Bl5&$C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$K
C3*Z/BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrG
Bkh]<%13OO+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@
7W3;iD/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l3
0J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"
FCd%IATDj+Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LA
AU&<<@rH<tF'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@
%144#+<VdL+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)
BP8bV/g)BH,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//
+DtV)ATKI5$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNE
F*2G@DfTqB8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#
$6Uf@?uBI^+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)
ATKI5$6UH6+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4
DIIBnF!,%=@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*
0JP+$1,(F=%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';
ASl@/ATJ:f+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBn
Et&I!+<YNDCijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#
FCB9*Df-!k+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$
ASuT4@r-:0FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMID
EarZ'@rGmh+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_
$6UH6+B3#c+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#
+<Vd]/g+A5De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;u
Bl%@%%144#+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G
?tsUjBkh]s+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWs
AKZ&9@;]UaEb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#
+<VdL1+j\RC2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%
ChsOf+<VdL+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&
FD,4p$6UH6+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht
>Bb"+CM@[!+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=
.3K',+<Ve8Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#
G\(D<+A$YtG@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1r
FD5Z2@<-'nF"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''
FDi:3BOPdkAKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B
;FNl>=&MUh7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#
Ble?0DJ()".!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$
/g*#Z/g+50FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:
F(fK4F<G4:Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(
CghU1+Dbt6B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4
+DkP/@q[!,BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9
FD,4p$6UH6A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6
<+ohcFCf<.CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1
A0>9,IT&X`I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=
DfTqBA79Rk+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'
D.RU,+DGm>%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*
F<G"4AKYE#E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUm
EZfI8D/a<"FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6
+EV:.+EMXFBl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7
@;]^h,>CTO@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%
FC653ASl@/ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=B
E-,f4DII?tGp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2
$4R=e,9n<b/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3
A7T7^/g+)(AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcU
D.tRqBlmp,@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.6
0JP5%ASl-5Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOs
Ec3(BAU&;>@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5
+E)F7Ea`d#+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3
Amc`mA8-.,+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0
Ecc#5B-;&0F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("
B4bjuAR](aCbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"
DKIL8?85^p$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,
ASuU2+EM+9+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B
-X\'*Eb-A2Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;
Des6$A0>?,+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeK
BOQ!*A7]joEc#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#
+Co%q@<HC.+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3
De!3lAKYN+D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3G
F)Q#?FC0?$?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7
A9Da.+EM%5BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.
H6@$B@ps1b3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$
BQ&*6@<6KsH=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0
BOu3,D..L-ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9
E+*j%F"SS)DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/
@q[J;7W3;i?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki
+EV:.+EMXCEb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62
+Co1uAn?!8+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rm
ARlp%DBNb6@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@I
F(KB5+EV:*F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%
78QEJ6rP4LARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R
%143e$6Uf@?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=)
,9SZm3A*6J+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3
De:+a:IHfX<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC
$4R=b+<VdL+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@
?tsUj/oY?5?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n
@:WneDD!&'DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3l
Bl5&8BOr;sBl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6
Df03!EZf1:DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#
.Ni>;G\(D.@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)
E-*47Bl%@%+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&
@;]Tu9PJBeGV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.K
BlbD5@:C@"AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1
+<V+#,9nEU0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*
?YX[kF),,j+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#gu
CLA9.ATD7$+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In
6tKjN0f^d-1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@lt
Ed8d<De!p,ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#
D.RU,+EV:2F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&
A8#OjE*sf-DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j
79C[@DIak\<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&
$6UH6FDi:BARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8
Eb-A%G%#*$@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I
+A,Et+AcKZAR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1
+<V+#+=\LA@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+
C`m24+:SZ#+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.
+EV1>F<GL6%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;
%13OO+=\LGBm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<
D/aTB+Co1rFD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$
B-;;0@<<W2Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?
9PJBeGV0F4+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot
/0H]%0ej+E%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6
Bl7K)A8bt#D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#
@;0O#GA(Q*+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn
+Cf4rF)to6+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u
+D#e>ASu$mDJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LP
DJX$)AKYN%@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-
FE7lu+<Ve8Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.
+EqC++E)90$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4
Eb$^D85r;W/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1
Ci!ZmFD5W*+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;
EcZ=F9PJBeGT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeI
AT;j,Eb0;78g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOA
A1q\9A7TUg05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdh
AKZ/1@3BZ*AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#7
7rN<YCh4_WDe!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDt
C`mh5AKY])FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)
AnGjnDIjqe6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&
ARmH,@;9Cs2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8
+DGm>F*),4C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_t
F`]5F$4R=b.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6
@<Q'nCggdhAKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8
AoqU)+CQC5Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+
Df-\9Afs]A6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=)
,9SZm3A*$//KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:B
F`&=?DBND,FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-
0JP9k$4R=b.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;
EcYr5D@Hpq+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et
-Z^D<H=.k3De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-Ac
G9CF-Anc-oF!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;
FCf<.@<?0j+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%
Eb-A(AS,XoARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&
F!,O8@<,jk+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0
C2dU'BQIa(?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1
AKXT@6m,oKA8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD
@<-H4De:,6BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86
A0>f./So-=AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/
Cgggb+DGp?Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth
+<YK=@ps0r:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!
ARlp*D]j(3Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdk
ARloqEc5e;1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOs
Ec3(A@rc:&F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o
/0H]%0K9LK%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)
@<<W%Df0Z;DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm
@rucE+<X'`AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*
+E2@>A9DBnF!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q
@<HC.+Dk\3BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$
DfBQ)DKI"3Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t
/e&.1+<V+#+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%
0K9LK%144-+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP
+CT.u+EV19F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$
C2[W8E+EQg%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr
@psFi+E(j7?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f
%14=),9SZm2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'm
F!,(8Df$V-Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?
6m-#SEb/a&DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg
%13OO,9nEU0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8
E+EQ'?k!Gc%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:
/n8g:.3N24Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3
@rc:&F<G.*BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#
+A-cm+>PZ&+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u
+Du+A+CoD#F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63(
$6Uf@?tsUj/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$
+>PW)3"63($6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,
@LWYe%144-+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&
+CK8#EbTK7F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"
FCcS:D]ik)F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J+
+D,>4ATJu.DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.
1,(CA%13OO+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1
F!,FBBlA#$$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=
%144#+CSe4BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$
/e&.1+<V+#+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4
D..O-+EqOABHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq
0.AL_$6UH6+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL
9hZ[QATDj+Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--o
Dg-(A/T2bFBleB7Ed;D<A1hP;D/9XgBPDO0DfU,<De*Bs@kouUASu("@;IT3De*Bs@s)X"DKI!Q
+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Uh`-$6pc?
+>GK&/i#1)/KdGm@qBLdATAnJ0e=G&0JY@*-r4\o@rcL*+BDokBjkn$+@TgTFD5Z2.1HUn$6Uf@
+CJVeG$l_,Cht5'@:O(qE$0=8EcYr5DK@6L@:Wn[A0<HHF(Jo*?tsUj/oY?5?k!GP$6Uf@+@Kpa
ARfg)A7]@eDJ=3,Df-\+E,]B+A8-92@:Wn[A1e;u%144-+<YN0@o$#V9PJBeGT^s6FD,_<@:Wn[
A0>u4+Cf>-Anbn#Eaa'(Df-\=ARfgrDf.0:$4R=e,9n<c/hen5+>"^2Dg#]/@V'R&3@l:.0JY=)
-p_]YH>d[D8g$o=C1Ums+@KpRFD5Z2@<-W96>pdX+@TgTFD5Z2.1HUn$6UH@+AQKl+@0jQH>d[D
E,oZ1FCeu*ARoLsBl@l3De:,6BOr;78g$o=C1Ums+@KpRFD5Z2@<-WB>A/,#E-"&n06_Va/n&U*
H>d[R@rH3;A8j1g0K;c^90u?J6sVDS$6UH6+B3#gF!,1<+CQC%Df9D6G%G]8Bl@l3De:,6BOr;s
BleB:Bju4,ARlokC2[W8E+EQg/g*_t+F.mJ+Eq73F<G[D+EM[EE,Tc=%144#+<X9P6m-#OG%GK.
E,B0(F=\PEDf0W1A7]d(E-622BOPsrDJ()#+Cf>/GqL42Afu2/AKYr4ARf:^Bl7Q+Ch[d&+D,%r
Ci^$m+<VdLF(Jd#@q[!1Dfp(CCi<flC`l#\@<uj0+D,P4+CIc>6;B*e1HHX=2`WHL2)R3N1,1L<
2dgQE+@0jQH>d[D5uU?M+DYP6+CIMi3))/$6;:3C?k!GP$6UH@+AQKl+A-cqH$!V<+DbIq+E1k'
+CSekARlok<HDklB1d)QCh\!&Eaa'$/oY?5?nELBAS!!+BOr;sBl[cpFDl2F%13OO+DPk(FD)dE
IUQbtDf0VLB4YslEa`c;C2[WnDe!p,ASuTCE+EQkDdt.($4R=e,9n<c/hen4+>"^1@<,jk+>Po-
+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>A7f3l
D/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!+EVNE
8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLdATAnR
/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9ATT&9
ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[A0<HH
F(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOAA7TUg
F_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinGEcYr5
DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W90f1F(
1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e,9n<b
/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s$6pc?
+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5Ec`FB
Afu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&+CT.u
+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue%144#
.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO,9nEU
0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8@<,p%
7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq$4R=b
+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJF`;;<
Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p9jr'P
BHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp+>PW*
2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=),9SZm
3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@ATM@%
BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30ALSaD
@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*$4R=e
,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+8l%ht
7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%+D,P4
+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*+EV:;
Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-VD/!m+
EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f/0H]%
0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/KdbrEarc*
1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W%144#
.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0C2[X(
Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6$6UH6
+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#F)rsD
Df%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2/KdZ.
DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"DKK8/
@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmfEZd+n
/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))F`_2*
+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o+Cob+
A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH@:Wn[
A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9
A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u+>GZ'
+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(+=AOE
+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^EE&oX*
A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.F_l=G
0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-FC65"
A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%htA8bt#
D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6Anc'm
+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.+EM7C
AISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6AKYK$
Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0oFEDI_
0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2@;0Od
@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtEFDi:D
BOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[KmEaa'(
Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6D.Rd0
GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq@;]^h
%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6TcbC2[Wi
Dg#i+G@,H'GVV$#+C]A*AS*''G%G];Bk;K2De:,6BOr;Y:IH=HH#n(=D(Zq?$7-g=BPD9o+CT>4
De!KiFCeu*GA2/4+EV:.+A,Et+D5_5F`8IFBPDN1Dg#]4G%kN3+:SZ(+CT5.Ch[I%+EVNEFD,5.
ASuU(Eb-@c:IH=HH#n(=D'3n2AKZ).AKYhu@rcK1-t7=5Ch.:!A8G[rAU#X5$4R>IF(Jj'Bl@m9
8l%ht:Ng;iG%kN3I16Mm$;+)^+=Ki):L\'M@rrh]Bk)7!Df0!(GpskMF!+m6>\J.hAp\35FDu:^
0/$gRA7[B.F)PZ4G@>N'/n8g:06_,GBeMb_A8c@,05"j6ATD3q05>E9I="R/@:WneDLF,H$4R>@
AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/%16?SFCf:u$6WSe
Eb/j0BQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)I="q,
AKXT@6m,<7B4ZKD+:SZ#>]XCqBlJ08BmO>"$6WSrEbp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*
FD,5rEbT].CbBXHB.n@?AM%Y8A1_b/B4W`E%144_DJsQ4@;L"!H=[Nm>\S:kD%-gp>\J.hAp\35
FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0GA1hh3Apo#*BOr;Y
:IH=B@;^3rC`lu)AU&<=FF.b@A1hh3Apo([%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%E\D0GA1hh3Apk*q+C&f&Ec#6$F(or3
%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HV.(%+B<JoEZdqkFCfK)@:Njk=)W+iF+"K)
%16$PD.Oi.Afu2/AKY])FCfK)@:NjkGAhM4F!,:5F*(u(+D>>,AKYE%AKYl/F<G+4@s)X"DKKH#
+DG^9FD,5.>\J.hAp\35FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@kV;-DdkA:@<6O%
E\D0GA1hh3Apo"u:IH=B@;^3rCjdoY%15X;Gq:(ZE,oZ1CM[^&B-;86F`Lu'+Cf>#AKZ22FD)e)
@!-?tDe!p,ASuU$A0>Jq@<?X4ATK4H+CT.u+CJSG@<6O%EZde`B6,FJ+D,P4+CTA6ASuU(G%De:
ART+\EcVZsBlbD*+Dbt6B6/0'DIdI!B-;86Aor6*Eb-A(AThX$DfBQ)DKI"+ASlC"HY%):Bk(^k
ASuU</e&-s$7-g,Des6.GA1r-+Cf>#AKYVsDImisFCeu*@X1!WAoD^,BkCd`ATVL.+>5d)+FYq7
H:gt$Bl8$(Eb8`iAQ)Po:..BG6nCoU8l%isDf9H5;cH%X6pX^=/4k.[:IK>IBl8$(Eb8`iAQ)Po
:..BG6k'JL+?V/)HtmS1BkCd`AUH']4q.i.$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[Nq
FD5W*I9Ttd$=%7iE+O'+Bl7^5@:FD.HX'<aEc#6$<,ZQ!@:FC&+<VdL+FSZB>]=+aATD?oHYI)%
3alK@I9dt#6Z6gYASuThDej].Cht5'@:O(qE$0=8EcYr5DBNh*D.Rd:%16?RH#R>8Ch[d&HXUGq
B6%s>HX'<aEc#6$<,ZQ!@:Wn]Ec<-D+FSZB>]=+aATD?oHYI)%3alQ0B6%s>>p*B>Df'?&DKJir
CO9K#A0?)7Eb'5EFCfN8F!,RC+D5_5F`9!TF_Pr/I16NgBR+Q.EboH-CO9K+Ci3ZuATN9H>Y]3X
D..6[Dej].Ci!utD.Rc2I=5=)E+*BjEb/j0BkCj9@;Kat@;TRsI9dt#6Z6gYASuThDej].Cht53
@;TRs+D,Y4D'3tBATKmT+CT)&DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO9K+CiX*!
F+&C?:2b/i@;Jn]CO9K+CiX*!F!)TRI9Trq@:s.lAS-:'An*l1Ci"-'AoiB++C%9PD/Ej%FB!0o
HXU`,+Du+8Ci<flCh4`,@;TQuEb/ioEb0,uATKmT@;Kb#AS-!+4$"a0ATW'8DBNeA+ED%*ATD@"
@qB^/I16NgBR+Q.EboH-CO9N'ATW?I>Y]3XD..6[Dej]/B4Z0-+<VdLI=5=)E+*BjEb/j0BkCj9
@V97oI9dt#6Z6gYASuThDej]?ATVs,AThX++E(_(ARfh'+D,Y4D'3e?F<G+.@ruF'DIIR2+C\bh
CNXT;I16NgBR+Q.EboH-CO9N.CjgY8:2b/i@;Jn]CO9N.C`jiC+<VeTI9Trq@:s.lAS-:'An*l2
DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+E2IF+Co1rFD5Z2@<-W9A79Rg@UX=h+C\bh
CNXS=Anc'mF+"K)>\JD%ATDU$DJOT/Df'H.I=#3oDfT]'CfG=gHXgu2E,$L<+<Z)\>?l,UB4Z*p
Ap\6(@le+<D/a6<>p*B>Df'?&DKJirCO9Q0D/aN,F)to6+Du+8DJsZ8F!+q;+ED%1Dg#i4B-;D3
Blmo/F)YPtAKYE!A0>r,DfTr2DJ=!$+Dbt+@;I'#A7]Y#BkD'jEcZX<$=%7iE+O'+Bl7^5A7^19
>Y]3XD..6[Dej]1AKW*<+<VdLI=5=)E+*BjEb/j0BkCj9A7^0p+C%9PD/Ej%FB!0oHXpi3E,8s.
+A,Et+ED%7F_l.BGA2/4Dfp.EEb0?8Ec*"0De*F-%16?RH#R>8Ch[d&HXp](I=#3oDfT]'CfG=g
HXp](+<VdL+<Z)\>?l,UB4Z*pAp\6(@le.3CjfS3>XNFHD.RU,<,ZQ!A7]RgFCfM9DdmHm@ruc7
Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%I16NgBR+Q.EboH-CO9T'ChId-I=#3oDfT]'CfG=g
HXp](B6%r6+<Z)\>?l,UB4Z*pAp\6(@le.3ChId-I9dt#6Z6gYASuThDej]?ASl@/AKZ28Eb'5E
FCfN8F!,(8Df$V0Ec6)>F"_TWBlmp-I16NgBR+Q.EboH-CO9T+A:8f0:2b/i@;Jn]CO9T+A0<!;
+<VeTI9Trq@:s.lAS-:'An*l4Bk2Wt+C%9PD/Ej%FB!0oHXpi#FD5Z2@<-W9Bk1dmFD5?$@psIn
Df-\+DIal2FCB9*F*),+F+"K)>\JD%ATDU$DJOT0Ble6AHX'<aEc#6$<,ZQ!A8-+(+<VdL+FSZB
>]=+aATD?oHYI)%3b2rGE.)"7>XNFHD.RU,<,ZQ!A8-+(CghT3A8,OqBl@ltEd8dG@VTIaFE8R5
F!,R9G]\?C$=%7iE+O'+Bl7^5A8Z43HX'<aEc#6$<,ZQ!A8Z3++<VdL+FSZB>]=+aATD?oHYI)%
3b3,EI9dt#6Z6gYASuThDej]9BleA=DdmHm@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%
I16NgBR+Q.EboH-CO9T1@sr]/:2b/i@;Jn]CO9T1@ium:+<VeTI9Trq@:s.lAS-:'An*l4De"3$
+C%9PD/Ej%FB!0oHY.2:D..O-+CoD#F_t]-F<G[:G]Y'NF(oN)+EV:.+Cf>-G%GQ5Bl@m1+E(j7
FD,5.-tI7+@rs.BG%G]'I16NgBR+Q.EboH-CO9T2F(KHAHX'<aEc#6$<,ZQ!A8lU$F<D\K+FSZB
>]=+aATD?oHYI)%3b32NATW?++C%9PD/Ej%FB!0oHZNb?+Co1rFD5Z2@<-W9E+*cqD.Rg#EcZX<
$=%7iE+O'+Bl7^5ARp49>Y]3XD..6[Dej]2A0<!;+<VdLI=5=)E+*BjEb/j0BkCj9ARp3p+C%9P
D/Ej%FB!0oHY$`%F<G+.@ruF'DIIR2+E(_(ARfh'I16NgBR+Q.EboH-CO9W7I=#3oDfT]'CfG=g
HY%:A+<VdL+<Z)\>?l,UB4Z*pAp\6(@le1CI9dt#6Z6gYASuThDej]2A8--.FCf]=I16NgBR+Q.
EboH-CO9Z7ASupC>Y]3XD..6[Dej]3F(K53+<VdLI=5=)E+*BjEb/j0BkCj9AohO$I9dt#6Z6gY
ASuThDej]3Bl\9:+CoD#F_t]-F<GX9DKKH-@qC&t$=%7iE+O'+Bl7^5B4PRmF+&C?:2b/i@;Jn]
CO9])AT2]5+<VeTI9Trq@:s.lAS-:'An*l7A7]_$I9dt#6Z6gYASuThDej]4Ec6)>+CT.u+EM[>
FCcS*AT23uA7]Y#F+"K)>\JD%ATDU$DJOT3ATW?I>Y]3XD..6[Dej]4ATT%;+<VdLI=5=)E+*Bj
Eb/j0BkCj9B4Z15>p*B>Df'?&DKJirCO:)5FE2),G%G_;DdmHm@ruc7Ao_g,+Co1rFD5Z2@<-W9
A79Rg@UX=h+D,>(ATN8/$=%7iE+O'+Bl7^5B4Z1*G^XpD:2b/i@;Jn]CO9]*FE2UK+<VeTI9Trq
@:s.lAS-:'An*l7ATVs;I9dt#6Z6gYASuThDej]4ATT&8AT;j,Eb/c(FDi:5G\(B-FCfk0$=%7i
E+O'+Bl7^5B5DKqF+&C?:2b/i@;Jn]CO9]1Ddmc1+<VeTI9Trq@:s.lAS-:'An*l7Ci<d(I9dt#
6Z6gYASuThDej].DII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF+"K)>\JD%ATDU$
DJOT3Ec?GR>Y]3XD..6[Dej]4Ec<-D+<VdLI=5=)E+*BjEb/j0BkCj9B6%s>>p*B>Df'?&DKJir
CO9Q3ART[l+CT.u+Dl%-BkDW5B6%p5E-$F:$=%7iE+O'+Bl7^5B68QK>Y]3XD..6[Dej]4F<D\K
+<VdLI=5=)E+*BjEb/j0BkCj9B68Q-+C%9PD/Ej%FB!0oHY6o3+A*bt@rc:&F<G[:G]Y'?Ec5e;
8g&4eD/^V.Bl[cpFDl2FI16NgBR+Q.EboH-CO9`2E,KK?HX'<aEc#6$<,ZQ!BP_X*C`jiC+FSZB
>]=+aATD?oHYI)%3bW>KDJX`,+C%9PD/Ej%FB!0oHXpi3E,8s.F!,O;DfTqBA7]glEbTK7Bl@m1
+E(j7DdmHm@ruc7Df-[GGq".N$=%7iE+O'+Bl7^5C2[WkB4ZL<>Y]3XD..6[Dej]7De*9hAKW*<
I=5=)E+*BjEb/j0BkCj9C2[WkB4ZKs+C%9PD/Ej%FB!0oHXpQ1F!,O<DI[6#CghC,+Cf(nDJ*N'
@;]Tu@rc-hFD5Z2+E(j78l%htDdmHm@rud?%16?RH#R>8Ch[d&HYRJ0BOu"!I=#3oDfT]'CfG=g
HYRJ0BOu"!+<Z)\>?l,UB4Z*pAp\6(@le@CA8#OjE.)"7>XNFHD.RU,<,ZQ!A8-+(CghT38l%ht
BOu"!I16NgBR+Q.EboH-CO9l1I=#3oDfT]'CfG=gHYd=;+<VdL+<Z)\>?l,UB4Z*pAp\6(@leF=
I9dt#6Z6gYASuThDej]:@;BEs@;]TuCi<`m+A,Et+D5_5F`;a<$=%7iE+O'+Bl7^5Ci<frEc?GR
>Y]3XD..6[Dej]9De!F#E$-8GI=5=)E+*BjEb/j0BkCj9Ci<frEc?G4+C%9PD/Ej%FB!0oHYdD;
F<G4:Dfp#?+CT.u+EM[>FCfM9GA2/4+DtV)AUP!p>\JD%ATDU$DJOT9@;BG&HX'<aEc#6$<,ZQ!
D..3k+<VdL+FSZB>]=+aATD?oHYI)%3c/;@AURi,>XNFHD.RU,<,ZQ!D..3kF!+'tF(96)E--/L
%16?RH#R>8Ch[d&HYmS?I=#3oDfT]'CfG=gHYmS?+<VdL+<Z)\>?l,UB4Z*pAp\6(@leICF+%=:
>XNFHD.RU,<,ZQ!D..3k+Dbt)A0>r'EbTK7I16NgBR+Q.EboH-CO9o9CjgY8:2b/i@;Jn]CO9o9
C`jiC+<VeTI9Trq@:s.lAS-:'An*l=DJX`,+C%9PD/Ej%FB!0oHYdD;F<GL2C1UmsF!,17+CT)&
+ED%+BleB-Eb/c(A8,OqBl@ltEbT*+I16NgBR+Q.EboH-CO9r1G@Z,K>Y]3XD..6[Dej];ATqZ-
+<VdLI=5=)E+*BjEb/j0BkCj9DIn$&I9dt#6Z6gYASuThDej]0Eb/[$ATJu&+Dtb7+Co1rFD5Z2
@<-XA%16?RH#R>8Ch[d&HZ!b5G]8(X>Y]3XD..6[Dej];De404+<VdLI=5=)E+*BjEb/j0BkCj9
DJs*2E.)"7>XNFHD.RU,<,ZQ!Eb0?8Ec,q@@3BB#F*&OCAfu#$C1UmsF!,[@FD)e7D]iV9E,8s#
@<?4%DKC48$=%7iE+O'+Bl7^5DJsW0Ec?GR>Y]3XD..6[Dej];DffW4E$-8GI=5=)E+*BjEb/j0
BkCj9DJsW0Ec?G4+C%9PD/Ej%FB!0oHZsCKA9/l3EZfI8F*)IGAo_g,+=MLa+EV:*F<G"4AKYl/
F<G:8+D5_5F`;CEDfQtAF_Pr/F+"K)>\JD%ATDU$DJOT:FFAL@:2b/i@;Jn]CO9r@+<VdL+<VeT
I9Trq@:s.lAS-:'An*l>FF@F;>XNFHD.RU,<,ZQ!ARoLs+CQC1ATo8=ATMr9F(96)E-*4FF(oN)
+A,Et+Cf>-G%GQ5Bl@m1I16NgBR+Q.EboH-CO9rCI=#3oDfT]'CfG=gHZ"$M+<VdL+<Z)\>?l,U
B4Z*pAp\6(@leLOI9dt#6Z6gYASuThDej]2A8--.@3BH!G9CIAE,95uBlkJADfTA2F`V87B-9fB
6m,uXDK]T/FD5Z2F+"K)>\JD%ATDU$DJOT;@W#UkATN9H>Y]3XD..6[Dej]<@W#UkATJt:I=5=)
E+*BjEb/j0BkCj9DdmTmD.Rd:>p*B>Df'?&DKJirCO9u/C1Ums05PQ:@;KKtDIIBnF!,(8Df$V>
F(KDR+<Y*/Ci3ZuATJtM0d(U[ATJtADIIBn-[cF2>\JD%ATDU$DJOT;A:8f0:2b/i@;Jn]CO9u1
+<VdL+<VeTI9Trq@:s.lAS-:'An*l?A:7`+>XNFHD.RU,<,ZQ!DfB9*F!+n/A0>AuDf]K2+Co1r
FD5Z2@<-'nF+"K)>\JD%ATDU$DJOT<@:O(`I=#3oDfT]'CfG=gHZ3D'CLeP1+<Z)\>?l,UB4Z*p
Ap\6(@leR;@r#V'>p*B>Df'?&DKJirCO9N!@r$-.F`8I3DIal1ARfY%ATDi7G@>Q7ARlp)E+*6f
+DG^9A8,OqBl@ltEd8d>Bl%@%I16NgBR+Q.EboH-CO:#@I=#3oDfT]'CfG=gHZ4!J+<VdL+<Z)\
>?l,UB4Z*pAp\6(@leRLI9dt#6Z6gYASuThDej]=F`\a7DIal"Ec6#?+ED%*ATD@"@q?d,DfTB:
%16?RH#R>8Ch[d&HZ4+LI=#3oDfT]'CfG=gHZ4+L+<VdL+<Z)\>?l,UB4Z*pAp\6(@leROFF@F;
>XNFHD.RU,<,ZQ!F*)>@ATJu4@VTIaFE8R=DBNJ(@ruF'DIIR2+Cno&@:EYdAKYT!Ch7[9%16?R
H#R>8Ch[d&HZE\0DIIBnF+&C?:2b/i@;Jn]CO:)5Ao;$oATJuBI9Trq@:s.lAS-:'An*lBAS,gg
D.Rd:>p*B>Df'?&DKJirCO:)5An?!oDI[6g+Du+8Ci<flCh4`,@;TRs+D,Y4D'3tBATKmT+CT)&
DIIBnF!*7n+E_a:F!)iJ@;TR'I16NgBR+Q.EboH-CO:)5B4QF;>Y]3XD..6[Dej]?AS5Nr+<VdL
I=5=)E+*BjEb/j0BkCj9Eb/loI9dt#6Z6gYASuThDej]?AS5^uFCfJ8@;]TuF`)52B5)F/ATAnc
:IH=9Bk)7!Df0!(Bk;@6%16?RH#R>8Ch[d&HZE\=FC]fH>Y]3XD..6[Dej]?ATMs(+<VdLI=5=)
E+*BjEb/j0BkCj9Eb0<6A:7`+>XNFHD.RU,<,ZQ!Eb0<6DfTE1+EV:.+Dl%<F<GU8@qBP"+C\bh
CNXS=@rc-hFCeu*@X0(EE+*6lA1;p9$=%7iE+O'+Bl7^5Eb0E4I=#3oDfT]'CfG=gHZE\@D]g/F
+<Z)\>?l,UB4Z*pAp\6(@leXAG&Me7+C%9PD/Ej%FB!0oHZE\-ASuU+Gp%-=G%l#/A0>f"C1Ums
F+"K)>\JD%ATDU$DJOT>ATi!0AU&WM>Y]3XD..6[Dej]?ATi!0AU#=?I=5=)E+*BjEb/j0BkCj9
Eb0E4DIn'@>p*B>Df'?&DKJirCO:)5FEMVAF!+m6Ch[s4+E(j7E-67FA8,OqBl@ltEd8dG@VTIa
FE8RKBln#2DJpY/G]7J-DIIX$Df0WE%16?RH#R>8Ch[d&HZEtOHX'<aEc#6$<,ZQ!EbupA+<VdL
+FSZB>]=+aATD?oHYI)%3c](c>p*B>Df'?&DKJirCO:)EDK?pm+DkOsEc3(A@rc:&FE;j>$=%7i
E+O'+Bl7^5EccDOHX'<aEc#6$<,ZQ!EccCG+<VdL+FSZB>]=+aATD?oHYI)%3c]=aI9dt#6Z6gY
ASuThDej]?F`)7C8g&4eF*&OG@rc:&FE;j>$=%7iE+O'+Bl7^5Ed2YRHX'<aEc#6$<,ZQ!Ed2XJ
+<VdL+FSZB>]=+aATD?oHYI)%3c]IdI9dt#6Z6gYASuThDej]?AS6.%@<*K%G]7\7F)u&6DBO"3
@<,jkI16NgBR+Q.EboH-CO:,HAU&WM>Y]3XD..6[Dej]@G@c"A+<VdLI=5=)E+*BjEb/j0BkCj9
F*D2?I9dt#6Z6gYASuThDej]2G][t7@rri7Bl7R"AKYf'DIjr%G]7J-DIIX$Df-\0Ec5e;GAhM4
+D>=pA7]d(@rH4$ASuT4@;]TuF('6'I16NgBR+Q.EboH-CO:2FARo7qI=#3oDfT]'CfG=gHZaC@
A7Bg,+<Z)\>?l,UB4Z*pAp\6(@leaRARo7qI9dt#6Z6gYASuThDej]?ATW'8DK?q/+Dbb5F<GL6
+EqaEA9/l*Ec5e;.![6aFD,*)+@Je!771$J=Wh3_Cht5<DfTB0+E)-?.!R1h%16?RH#R>8Ch[d&
HZaC@F+&C?:2b/i@;Jn]CO:2FATJt:+<VeTI9Trq@:s.lAS-:'An*lEF(KE@>p*B>Df'?&DKJir
CO:)5FEMVAF!,[FEb$;5AS,LoASu!hF+"K)>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"
C2[X!Blmp,@<?'\F(KB-AU/>P2,6Ij+E;KGF`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3A
C2[X!Blmp,@<?'0/e&._67r]S:-pQU;e9M_GA1i,+E1b%AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-
BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:
05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)@<6!5F`V,7CLqd4/n8j>%15is/e&._
67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&OCi<`m+=DVHA7TUrF"_07D.RcAD/!m!
F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*F)tc1GroJUDg-86?YWpqBQS?83\N.1
GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(Df]u.Ed9#A$;No?%15is/g)?*FE21J
7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#.n2E@%15is/g)?-2^/\<:-pQU,"$Hm
Cb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/hAooOm2^/\<:-pQB$;No?+AP^3762Q$
Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4
@<,ddFCfJ%$4R>;67sBOASuO6-Z^CS@Wcd7/Tk]BGp4@k/hf%'GAhM;@<-:/DIdet$;No?+?:T+
1-$I*0e"5L+?:T+1,g='A7BS%DBL2Y+BosK+Z_A=+=JT[/0H>b3ZpF+3\iZB-Rg/h+=AT\>9GpL
3\iW:-RU8a/0H>h,CUb>3ZpUI+=ANa-RLu*+?:T+1,^L-.3L/a-RU8h%15is/g*.t3\i^$0j?X]
3\iWAA7BS%DBpo?3?^F=3F+!`-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ7%15Q[
4#&fpASkjkAKX?_EcP`/F?=;W@:UK.C2[X!Blmp,@<?'.+BosC+EDRG+=CW@Bl%<pDe*ZuFCfK$
FCcgB>9IElARTU%-RT?16Zd?b.n29U0fr<FF<EqnEcP`/F?=Ma+=D,KC2.ZtCh\!&Eaa'$-QlV9
De(7Y-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH>9G^EDe't<-OgDMFE21J;eTlWF=Tg94#&fb
F_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,Eb-@@B4YslEa`c;C2[W1
%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4;eTlWF=Tg:4#&fh:IH<r
ASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i^$0j?X]3\iWAA7BS%DBpo?3?^F=3F+!`
-mC]4+Z_A<,VUYu-X/SS3\iWA/9,fNFCcRT+Z_A:,VTZ77Q*=_4&fd4F<FM!DeioGEccCG-YdR1
Ch\!&Eaa'$;f-GgAM>ec%16$IBkDH;7Q*=_4&fd4F<EnYF(o,GB6%s-BlkIFC2[X!Blmp,@<?'[
Ec6)0Ch6=LCLqO--QlV9F(KH.De*ZuFCfK$FCcRB-YdR1Ch\!&Eaa'$?Z1+%ATqL'AU#sc,p7;C
BlbD3De*ZuFCfK$FCcS5G%G];Bk;Jt$7/quARfgrDf0o,FCf]=FEDkEDe*ZuFCfK$FCfkC:Ng;i
G%kN3I16Mm$=%[aG]\%LHYRJ0Ch\!&Eaa'$I3<6F+CQBb+E_d?Ch\!:+EM%5BlJ/:FD,*)+D58'
ATD4$ATJ:f>\J.hAp\35FDu:^0/$mS/pD#FBlIWoBjiW4Eb@%LBkqE99PJT[Eaa'$?Z:%(B6%Et
D/!m#I=#dEFCfK$FCfkCA8bt#D.RU,F!,"-Eb/a&Cj@.8Ec5e;>\J.hAp\35FDu:^0/$aO@;L48
ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM8IY8l%htA8,OqBl@ltEd<'UB6%p5
E-!W@$4R>@AS!!+BOr;uDes6.GA1r-+D,P4+Co&*@;0P!3XlF$@V'1dDL5r4F_t]1@<?(/%16?S
FCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<Ci<c9D..L-ATBG=
De*ZuFCfK$FCd+*F(oN),r./hDe*ZuFCfK$FCd(=E-Z>1I="t8Bl7Q+C2[X!Blmp,@<?''DJsW.
@W-1#I4cWO$6WSp@rc:&FE;/BAISth>]k('HY@MCE-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,U
@r$-=@Vfsl05Y-=FCfJGC2[X!Blmp,@<?'6<HDklB-f;eC2[X!Blmp,@<?'5BlJ?8@XS[m+C&f&
Ec#6$F(or3%16?SFCf:u$6WSeEb/j0BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05=p*CND.<
Ci<c9D..L-ATBG=De*ZuFCfK$FCd+*F(oN)8oJ6VBlmp,@<?'5E+ER/HW>-$DJ(),De*ZuFCfK$
FCcRk6q2SW%144_F(96)E--/8H=[Nm+C'&0CjTi;FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
@:O(o04Ja9@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Apk*q+C&f&Ec#6$
F(or3%16?ODIe**DKTf-Eaa'$I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;+!
FCfK)@:Nks%13OO>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>\JD%ATDU$
DJOSu84c`V5u'gD6[a;d:2b/i@;Jn]CO9#O8Q/GO:..lF+<VdL+FSZB>]=+aATD?oHYI)%3`JXA
;c#bT6r-0u>p*B>Df'?&DKJirCO9Z9Cht55@;]Uo@j#`!FD)dK+E_a:+=M2;DIdZq.3N>:+E)-?
F(f-$C`m\*FD-(3$=%7iE+O'+Bl7^5AoD^,BkCd`ATVL.I=#3oDfT]'CfG=gHY.2:D/!Tj@qBan
GT\+OI=5=)E+*BjEb/j0BkCj9AoD^,BkCd`ATVL.I9dt#6Z6gYASuThDej]3DfT]'FE8R<H#R>8
Ch[d&ARlolDIal'BkM*qBkM+$ARlotDKKH1Amo1\+EqaEA93/.$=%7iE+O'+Bl7^5B6%s-BlncM
>Y]3XD..6[Dej]4Ec>i/F<D\K+<VdL+<Z)\>?l,UB4Z*pAp\6(@le7CE,961I9dt#6Z6gYASuTh
Dej]:@;BEsCghEsGT^U:EZf"8Dfp"A.![7i%16?RH#R>8Ch[d&HYI)#@qB^m@ruF'DLHk::2b/i
@;Jn]CO9c-@:NkiARfgrDf-[?+FSZB>]=+aATD?oHYI)%3b`27@qB^m@ruF'DLGe5>XNFHD.RU,
<,ZQ!Bl8$(Eb8`iAKZ&*@ruF'DBO"CD/E^%Gp%0MEbTE(I16NgBR+Q.EboH-CO9c-@sr]/:2b/i
@;Jn]CO9c-@ium:+<VdL+<VdL+FSZB>]=+aATD?oHYI)%3b`29I9dt#6Z6gYASuThDej]3DfT]'
F<G:8FCfK)@:Njk@rH4$ASuT4FCf]=I16NgBR+Q.EboH-CO:,6FD>`)Ch\!&Eaa'$I=#3oDfT]'
CfG=gHZNb?C2[X!Blmp,@<?''I=5=)E+*BjEb/j0BkCj9F(KH.De*ZuFCfK$FCfl++C%9PD/Ej%
FB!0oHZ4":E+*cu+A?3CAQU'oEc5H!F)u&5B-8cKF(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FB
ARTFbCh8#($=%7iE+O'+Bl7^5Fa%Y1FCf]/Ed)GBA930G>Y]3XD..6[Dej]BGAL]0AU%g-GAhM4
F!,mZ>?l,UB4Z*pAp\6(@leaVCghEsG\1u?DfTB0I9dt#6Z6gYASuThDej]BDKg,0E,]B!+DbJ.
AU#>0Ec5e;GAhM4F#kFdGAL]0AU%g-GAhM4F!*P*-[0,EGB.,2+E_=5Gpe"L$=%7iE+O'+Bl7^5
GAhM4Ch\!>HX'<aEc#6$<,ZQ!GAhM4Ch[u6+<VdL+<VeTI9Trq@:s.lAS-:'An*lGDfTB)Blnc/
+C%9PD/Ej%FB!0oHYm2,AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGq".N$=%.[A:$j]B4u*qB4uC$
DJ+A,$=%.[A:%6g@:Wq[I16Mm$=%Xp@WQ*jFD5Z2HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3;s9A0=K?
7"#LO%16?^AU&<=FF.b@A8Gt%ATD4$AUP\<@;BFq+EMI<AKYE&F*2>=FD5Z2F!+n#Dfp.EFD,5.
8g%V^A7ZllDIa1`A8bt#D.RU,+EV1>F<G:>+E2@>@qB_&ATKIH8TZ(`F)uJ@ATKmA$4R>I@V'1d
DL5r4F_t]1@<?(/>;7a9%16?SFCf:u$6UHWCht58Dfp)1AKYK$A7ZltF!,OGDfTE"+DG^98l%ht
A8,OqBl@ltEbT*+/e&.mBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+CoD#F_t]-F<G19@:sFg
DKKqB@<,p%ASH7"ATBg@$6UHr@V'1dDL6)>ASl.-AUP!p+<Xp'FCf;39jr'XA8c[0+D5_5F`8I>
Df021A8bt#D.RU,F#kFKG%G]'Hnlg)+Co2-E$-N@Ec6)>DIIBn-[Z@1+<Xp'FCf;3>YJR*AQW1[
F*2),Bm=3"+DkOsEc6"[+C')$EajDQ+Co2-E$-N@Ec6)>DIIBn-S-WPDg#i+G@,H'GUIkJ$6UHr
ASu%*Blmp'BmO?=%13OO,p6H,FCf:u$7-f;+AQim/P7-qDe*E%BlbD,Df00$DIm?$FDi:DBOr;Y
:IH=<Ec6)>+D>=pA7]ddAoDU0DJsW.HW4ZmEt&I&+<VdL+Dbb/Blmd*Bl@l3D..]4@V$Zn@<6!j
+DGF1BlkJ,ARfXqATJu&+D>J,A9)*r@q@9@+CT.u+DGm>D..I#ARl5W,p4<QGA2/4+E2C5F_#DB
E+*WpDdso#ASc'tBlmp,F"SS(G%G]>FD,B+B-:o++CfP7Cj@..FCf]=FEDk7HX(uI%14C(+<Y-6
@:O(aFE8R:Des6.GB4mG@;]Uo@j#i2F`Lu'+Cf>#AKYZ#B4u*qB4uC$DJ()%Df0`0DKKT2DK@E>
$7-f;+C'#"G]\%LHYRJ0Ch\!&Eaa'$I4'(YBOtU_ATAo'Df0Z*Bl7u7>YJR*AQXCkDe*E%FD,*)
+DGm>D..I#ARlp"Bkq8h$7-f;+EV:2F"Rn/%14C(>[h8WBl89@ATD6gFD5T?%14C(:-pQq4FVa.
INWt[/o4s<AU#>8F_tT!E_L1bATJu8FCB337WNEa4X)U)+FO\+,p5rL/j;IJIXZ_g%14C(>\.e`
HZit@@UX@mD1)j#>\.e`HY%);D.R`rFCfk0$4R>IF*1r5ARfgrDf0o"F`))2DJ((sFCf]=FEDkE
De*ZuFCfK$FCflK%13OO>]aP%FEDVOC2[X!Blmp,@<?(/+EDUBF!,C=+BN8pA8c[5/0IW#DKU1H
@;]Tu9jqNSG%G]8Bl@m1+E(j$$;)pUAoDU0DJsW.HX(Z(G]\%LHYRJ0Ch\!&Eaa'$I3<`JCht57
F`&=?DBMOo3%cm>+CT.u+C\o-Df0)<I16Mm$<1pdF`V+:>]aP%FEDVOC2[X!Blmp,@<?(/+F.mJ
+Dl7BF?0j<%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X6nF*(i,C`l>G6nSoU+<Xp&
Eb/j0BQS?8F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE96"FMEDK@IDASu("@;IT3De+9C8l%j'
+DGm>@3A/O$6UI"A7TUr/g*`-+DGm>F`V\6Ci"A>Bl8!6@;KakA0?)1FD)*j+<Xp&Eb/j0BQS?8
F#ks-@rGmh/o#HGAor6*Eb-k5Df%.OBkqE9:gmjN@;^L?E+*6n@;^KG%16?SFCf:u$6UH_DKBo.
Cht4d:IJ,W<Dl1Q/e&.1+C&T#AS-:&FEDJC3\N-rDe*E3C3+<*FE_/6AM.J2D(g*ICM>FfA7TUr
F"_0;DImisCbKOAA92[3Ear[/HV.(%;bpCk6UcD4$6UI*F!+n-F)N10+A*bbA7TUr/g*`'F*(i,
C`mG6+EqOABHUQ%AU&<=FF.t8@r5XlI4cX6F<G(3DKK<$DK?qBBOr;Y:IGX!+<Y3/@ruF'DIIR"
ATJu7AT;j,Eb/c(FDi:2F_PZ&+A,Et/g*b^6rQl];F<kq@;L"'+Cf>-FCAm$Et&I!+C'#"G]\%L
HYRJ0Ch\!&Eaa'$/q"09>\S:kD%-gp+A$HlFCB!%+CQC&F`MM6DKI"EATDj+Df-\9Aft>lEb/j0
BQS?8F#ks-E+*WpDdtD<Eb@%RHZ3D2A8bt+/e&.1+C'#"G]\%LHZ3D2A8bt++Eh=:F(oQ1+C'#"
G]\%LHSR36/hnt5I3;s9A0>>mH#IS2+:SZ#+EM[EE,Tc=F!+'tF*VYF@<`o.BkM*qBkM+$Bl7Q9
+Ad)mDfQtDATDj+Df0V=Eb065Bl[cq+Dl%-BkD'h@<?4%DD!&2BOqV[+<Y97Ci"$6Bl7Q+@Vfsq
+E27?FE8RDEc6,8A7Zm#DfTD3Bl7O$Ec#6,Bl@lM%144#+<VdL>[h8WBl89/DKTf-Eaa'$I16Mi
+<Xp'FCf;3>\J.hAp\35FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC0/>4:0J>+8
0/5I?D/XH+/SZkV@;]Uo@kDbIDKK<3/SJj2BP_BqBQRs+B.n[[9lG&`+A*bQ@;]Uo@j"]qDKK<3
+@p3ZBM<,QBQRs+B713r#p:?qF(96)E--/8H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23
ARo4k@;^"*FD,5rEbT].CbBXHB.l"o1,(@81+t@B05YWJAM%XKE+*WpDdtA?H#@_4GV*TCB4u*q
B4uC$DJ(VN%144#+<VdL>]+J#D..7%BmO>"$4.gt>\S:kD'3(sEb/j0BQS?8F#ks-@;]LiH$X%D
BOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JP=90KCdA0J@BRDIdZq/Ri.0ARmB-/TZ2TFCBDGBPD*m
Ch[NqFD5W*07A1D@;]Uo@j#5hF(Jl)8g%&XDKK<3+@p3ZBP_BqBQRs+B713r#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC9
3A3-A05t?;A8bs0@UX=hA1_OJF*VYF@<aA;BkM*qBkM+$Bl7Q:I16N++<VdL+C&f&Ec#6$F(or3
%13Ca+C&W&ASiPpBQ@ZrHY@MCE-"&n04Aa,CjC><FD,5r@<>pqDfg)7ARogqG%GJBDfTJD1,(F<
0/5.60JP5%ASl-5Ch\!&Eaa'$/S]3707A1GASl-59PJT[Eaa'$+A,EtI4bs9#p:?qF(96)E--/8
H=[Nm+<VdL+<Xp3Ebp)9FEDJC3\N-pDII@,H=_23ARo4k@;^"*FD,5rEbT].CbBXHB.l"o0etC:
0J>+706:]ABe=.8FCfK$FCd%=De(ML%144#+<VdL>]+J#D..7%BmO>"$4.gt>\.e`HY%);D.R`r
FCfk0$=%:eAShk`+<X!nBl%<&>]aP%FEDVOC2[X!Blmp,@<?'5I3;d:AU&<=FF.b@A8Gt%ATD4$
AUP\8F!+m68g%beDfp"O+A,Et%144#D..3kF!+'tF(96)E--.DAo_g,+D5_5F`;CS+B38%D..3k
+C'#"G]\%LHYRJ0Ch\!&Eaa'$I3<'=3XlE*$7-g"@V'1dDL6P<EaiI!Bl/8-$7-g8AT;j,Eb-@@
B4YslEa`c;C2[W1%14C(De'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH>9G^EDe't<-OgD/+Dkq9+=CoB
A8Gt%ATD4$AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_Bq
BQRs+B73ui%16?8DfT]'CfG=gHZE\;F_Pl-+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi<
ASu("@;IT3De**pAU&<:F`2A5F(oN)Ch7sAI16Ng:2b/i@;Jn]CO9u1+FRKfAU/K<Eb&-fCO8-(
I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?Ci`j'AU&<:F`2A5F(oN)
Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=gHQ[6;+FRKnFE2)5B2ieb
HX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>Y]3XD..6[Dej]:Ci^_I>Z5`b
Bl7Q_Dej])FCf]=EHQ2AATMR'B5D.+I;3\2Ch\!&Eaa'$>]aP%FE)GAFCfN-DJ*csH[U;O$=%.[
A:$j]B4u*qB4uC$DJ+A,$=%.[A:%6g@:Wq[I16NgBlmp'%144#:N0l_+EV:.+A,Et+Co1rFD5Z2
@<-'nF!+t2DKK<$DJ=!$+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB%13OO,p6H%AS5^p
HZit@@UX@mD1)j#,p7,:+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH+=ANG$7-g"ASu%*G%G]'
@<?4#I16Ng@V'1dDL5;q@:Wq[I16Ng@V'1dDL4ogB4u*qB4uC$DJ+B%>n%-G:2b/i@;Jn]CO9u1
+FRKfAU/K<Eb&-fCO8-(I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA7T7p+DPh*+E_d?
Ci`j'AU&<:F`2A5F(oN)Ch7sAI3;cfAU/K<Eb&-fCO996+C%<G@od#S<,ZQ!1OWM'DfT]'CfG=g
HQ[6;+FRKnFE2)5B2iebHX(Z(G][qJDffQ3Bl7R"AUAi1FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`
HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u$6UHbDdd0!>]aP%FEDVOC2[X!Blmp,
@<?'5I3:gfFCfJ8D..3oDJ((sFCf]=FEDkEDe*ZuFCfK$FCfkCBlkJ-@;[2sAISth+Dbt)A7]9o
Ch[Zr+CT/5+A*bt@rc:&F=n"0%14C(>[h8WBl89@ATD6gFD5T?%14C(Ci<`m+=CoBA8Gt%ATD4$
AL@oo,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+B73ui
%16?8DfT]'CfG=gHYdV/A0?;*;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sAC2[X!Blmp,@<?'c
FCf]=EHQ2AATMR'B5D.+I=2P3>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?SFCf:u
$6UHiATT&'+EqaECM@[!+Co2,ARfh#Ed98[>]aP%FEDVOC2[X!Blmp,@<?(/+D58'ATD4$ATJ:f
+<Xo_@8pf?IV*;1ATKIH6#:?[F*1u++D,>(ATJu&Eb-A;EbTW;ASrW4D]j.8AKYMtEb/a&DfU+G
F)Y]#BkD'jA0>?,%144#>]aP%FEDVOF(KH.De*ZuFCfK$FCd(Q%13OO,p6H%AS5^pHZit@@UX@m
D1)j#,p78?FD>`)Ch\!&Eaa'$+=ANZ+AP6U+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#
D.RU,+Co2,ARfh#Ed8*$%14C(F(KH.De*ZuFCfK$FCcRB@ldk:ASlB6+<VdL+<VdL+<XEG/g,@P
DId[0Et&I&+EM+9C2[X!Blmp,@<?''-SK.OD.PA8DeO#AFCf<.-QjO,67sBsBl8'<%14C(>\.e`
HZit@@UX@mD1)j#>[h8WBl88rBOPF_A:4mo>[h8WBl88gBkM*qBkM+$Bl7R3>?q[F>Y]3XD..6[
Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA>]aP%FE)GAFCfN-
DJ*csH[U;b+C%9PD/Ej%FB!0oHVQm[+CfP7Eb0-1+A,Et+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,
+Co2,ARfh#Ed<'B$4R>I:2b/i@;Jn]CO:,6FD>`)Ch\!&Eaa'$+FRKnFE2)5B2iebHX(Z(G][qJ
DffQ3Bl7R"AUAi83a?c<G][D'@r$.%@<6+/I<9%;E*RKrG][qJDffQ3Bl7R"AUAiR+<VdL+<VdL
+<XoVDf'?&DKJirCO8fC/g,@PDId[0F+"K)>Y]3XD..6[Dej]@ATV[*A8Gt%ATD4$AKZD+;fm%o
DJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA05,9@AM7e:BPoJFASlBkFCf]=EHQ2AATMR'B5D.+I=34\
>XNFHD.RU,<,ZQ!:-pQUCh[d0G^U#.>\.e`HUqj`BP_BqBQRs+B713r>\.e`HW+TdA7];"%16?S
FCf;3;e:%nDfBf4Df0!"+CTD7BQ%o>F"&5UBln#2A9hToBk&8jFCf]=FEDkNATV[*A8Gt%ATD4$
AUQ0?$=%%OB5)71;eTTMARp2u$=%%OB5)71882^MCh[NqFD5W*I9Ttd$=$MOEbTE(<,ZQ!>]aP%
FE)GAFCfN-DJ*csH[S4hFDYH(>]aP%FE)GAFCfN-DJ*csH[U<I:2b/i@;Jn]CO71FATV[*A8Gt%
ATD4$AKZD+;fm%oDJ)peCO9<.AU&<:F`2A5F(oN)Ch7sA@ldk:AU&<+@:O(oCghBuH[T@3FCSa&
AR'=gG][qJDffQ3Bl7R"AUAiR+<XoVDf'?&DKJirCO8fC/g,4HF<F7c<+T/S@<H[*DfR7I.3N_D
G]Y':DIal#Bl[cpFDl2FI16NgASu%*882^MCh[NqFD5W*I16NgASu%*;eTTMARp2u$=%:eAShk`
+<XR)DBN2+AU&<=FF.Y@E,961I3<HG+EV:.+D5_5F`8IKDfm1H@;^00FDi:4De!p,ASuTB+C'#"
G]\%LHY7A<Ch\!>%144#B4YslEaa'$F!+^]@8pf?IV*;1ATJu.DBO%7AKZ28EbfB,B-:`!Eb/a&
DfU+U+B3#c+EDC=F<Fg^@8pf?IV*;1AISth+DGm>B5)O#DBO%7AKYW+Dfp"ADIIBn/e&-s$7-g"
@V'1dDL6P<EaiI!Bl/8-$7-g-Ec>i/F<DrGDe*ZuFCfK$FCcgB:-pQUD..3kF!,49A8Gt%ATD4$
AM/(9GT[G&,p6H(DIe*;ATD6gFD5T?%16?LAS5^pHW+TdA7];"%16?LAS5^pHUqj`BP_BqBQRs+
B73ui%16?8DfT]'CfG=gHY7A<Ch[u6I9]]mEbTE(<,ZQ!>]aP%FE)GAFCfN-DJ*csH[TXIA8Gt%
ATD4$AR'=gG][qJDffQ3Bl7R"AUAiR+C%9PD/Ej%FB!0oHVQm[+DkP&ATJu/De*ZuFCfK$FCd(H
AU#>G%16?ODIe)bBkM*qBkM+$Bl7R3%16?ODIe)mBOPF_A:4mo>\S:kD%-gp+B<Jo+C%TK<+T0\
FDi:3Df'H-Ch4`2BOr;uBl%@%+D58'ATD4$ARlomGp$@6AU&<=FF.Y@E,961/q"iO$4R=b+@.,Z
@<?!m+C'#"G]\%LHX^E*I3<T@EbTK7+DGm>GB.D>FCf>4FDi:DBOr;kFCf]=FEDkNATV[*A8Gt%
ATD4$AUP!p+<Y3/Eb/a&DfU+GFD,*)+EM47GB4mKBOr<-AT;j(DI[6#De:+s9OUn3=BltYDf'H-
CghF"Df-\-Df'?"DIdf@%144#%144#7VQ[MEt&I!+DkP4+C\n)E,ol,ATMp(A0?)1FD)e%FCf]=
FEDkKA7fXdFCf]F/0J2>AU&<=FF/7DCghEsG^U]QEX`?u+C'#"G]\%LHYdh5CghEsG^V1e=`8G'
+Cf)'Bk(]sGA1l0+C\n)A8,Oq@<?'k+C]U=FD,5.E,oN2ASu!h+E(j$$6UHkDJ<U!A7ZlnBOPpi
@ru:&F"SS)DfQt;DfTD3A7]jkBl%i5F(Jo*FD,5.E,oMuD.7<m+D,>(AISth+C'#"G]\%LHV.(%
9PJT[Eaa'$:i^,UD.7<m/p(ZLI3<6A+EV:.+EqaECM@[!+Co2,ARfh#Ed98H$=%.[A:%m*F_t]1
@<?(/%13OO<+oi`AKYE%AKZ&4D.Ohp9OUn3=FP=&FED57B6,2@Dfm1>@<iu>@;^00FDi:1A867.
F=n"0%16?LAS5^pHY%);D.R`rFCfl)0eQ`@$=%:eAShk`+<X*`BlkJ&FCf]=FEDk%:IIljFCfK$
FCe9hARTFbCh55@AU&VGFDi:3BOPdkAKZ).AKYl5D.7's+E(j7Bl7HmGRY!&+Cf>+F_u#;/g+,,
AKYMpAmoguF<G:=+EV:;ARuunF`\aJBPDN1D..]4Eb0<7Cige6DBO+6Ed8dDDf021DIIBnF!,LG
DJj0+B+51j+EVO7ATVTsE\8J6D]iS%@rc-hF(HJ4EZf(6@rc-hF(HJ.DId='+Cf>+F_u#;+Cf(n
DJ*NA%13OO>[h8WBl89@ATD6gFD5T?%16?LAS5^pHYmnAFD56'Cib#O1OWJ4F(Jj'Bl@l=HX(9&
A7^"'@;TS(>n%-GASu%*G%G]'@<?4#I16NgBlmp'%144#>]aP%FEDVOC2[X!Blmp,@<?(/+Eqj7
E-!.<Df021F)Q2A@q?cmDe*E%Ch[cuF"SS:Ea`p+Bl7Q+Bla^j+<Y04DKKo;Ci!Zn+C]U=>]aP%
FEDVO=&M=\9M%rM<.-AA<+ohcA7]@]F_l.BBlbCO0ea_[BOPpi@ru:&F"Rn/+<X$b@;]^h+EV:2
F!,X7Cis;3BkAK5Dfm14BOPdkAKYT'DKI">EZf=0B4W3,BmO>C+BNSlE,]B!+Dbb0ATJu&Eb,[e
+<YWDARf:_A7]9oGA2/4+EV:.+EMXFBl7Q+>]aP%FEDVO=&M=\9LV68I3<`JFD)e-AS,@nCig*n
+<XoTCh7X/<,ZQ!>]aP%FEDVO4t\HOI=3^W$4R>IBlmp'+:SZ#+C'#"G]\%LHYRJ0Ch\!&Eaa'$
I3<B8Gp$g=@rHC.ARfguGp$d7B4u*qB4uB0>\.bkBR=rD@;p0sA:5S0Dg5i(+A*boDfor=+EV:*
F<G(3DKK<$D@Hpq+Dkh;FEMV8F!,C5+EMXFBl7R)+CT.u+E)@8ATAo3FD,6++EVmJATKIH<+oue
+CT)-D]i_3Ch.T0AoD]4GB.,2E+NQ&DJsE1Dfor=+EV:*F:AR"+Cf>-FCAm$+Dbt6B-:c&@V'(\
ARlp)FE2)5B6,[J<+ohcG%G]'+C'#"G]\%LHZaOK@<?(*Ao`*6Eb'6>/0K"FAKYr#B4ZNsE+*Bj
Eb/j0BkCj9Fa%Y1FCf]/Ed)GBA93/M%144#@ps6t@V$[)F(Jl)FDi:7ASu("@<?''>\.bkBR=l>
GB.,2E+NR.+C%TK<+T0:+D,P4+EM[8BHVM;Eb'56FD,*)+Ceht+C\n)D..=)@;Kb*+Eqj7E,]B!
+CT.u+DG_7ATDm(A.8kg+DG^9FD,5.Anc'mF!,+,DImisFCeu*@X0)$FCf]=FEDkEDe*ZuFCfK$
FCfkQ+B3B,+CT=6G@_n6BkM+$+EMI<AKYhuDKTB(+D#(tFD5W*%144#BlbD*Cj0<5F!,@3@qB_&
@<-W9GA2/4+C%TK<+T/a%13OO>\.e`HY%);D.R`rFCfk0$>OKiE,o\nF(KB-AU/>P2,6Ij+E;KG
F`V,7CLqd4+Cf>-Anbm#AoD]4E,ol3ARfg)-ua3AC2[W3/e&._67r]S:-pQU;e9M_GA1i,+E1b%
AKZ2@G:mWODe=*8@<,p3@rH3;C3OB-BeMu!Bk1dr010YqAnbm28l9[`<HD_l94`Bi%15is/g+S=
F)O)^BQS?83\N.$F)PZ4G@>N'/n8g:05#!@Ch[s406))JA7[B+Bll";Ci<c9D..L-ATBG?Bjr`)
@<6!5F`V,7CLqd4/n8j>%15is/e&._67sBLG[YH.Ch7ZK%15is/g)9+1HR<Q9keKVF*D2,E+O&O
Ci<`m+=DVHA7TUrF"_07D.RcAD/!m!F*D2,E+O&CF_Q&1/no'A-OgDX67sB'6Zd?b.nD`U4%F+*
F)tc1GroJUDg-86?YWpqBQS?83\N.1GBYZSF)PZ4G@>N'/n8g:05>]FCM>G&De!3bF_kK,GqV[(
Df]u.Ed9#A$;No?%15is/g)?*FE21J7Q)G"$;No?+<j0pEbm7)BPD(#.n2E@%15is/g)?:BPD(#
.n2E@%15is/g)?-2^/\<:-pQU,"$HmCb%t6+q4lS67sB)6Zd?b.oU+qAooOm2^/\<:-pQU,#`/h
AooOm2^/\<:-pQB$;No?+AP^3762Q$Df0`:Cisi2A0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNF
Ci^sH@<QR'A9/l9F(HJ4AfrH_-Qlo4@<,ddFCfJ%$;No?+@\1L0KV[6@Wc<+;KZk=A7BS%DBL;S
+ED%4CgggbA0?)1FD)dW/hf%'GAhM;@<-:/DIa1`%15Q[4#&fpASkjkAKX?_EcP`/F?=;W@:UK.
B4YslEa`c;C2[W1+Bot/D'138F_PZ&C2[WnBleB:Bju4,Bl@l:+BosuCh7$q+=ANG$:AoUCb%t1
4#&fqATT%^F`MM6DKIsYA0<9_-YdR1A7]p3.4cl0-YdR1-RgT/-ZsNFCi^sH>9G^EDe't<-OgDM
FE21J;eTlWF=Tg94#&fbF_u(?:j$kAEcW?NA9Da.E-67M%15Q\4#&fpAT;j,Eb-@c:II9bAT;j,
Eb-@@B4YslEa`c;C2[W1%15IEEbm6q1HR<Q;Is?`@r,^!8l%i:-u*[2Df-[K+DPh*De<T1+>F<4
;eTlWF=Tg:4#&fh:IH<rASc<IC2[WrASc<.0F\@Y1cmBQ6tKhMB-:)pDEBj%3\i]<-o!.n>9GpL
3\iW:-Y-\,F`&<I0HaRB3?^F=3?T^t+=nW`,!$i,+Z_A<-RU>c/0H;h+BosK+Z_A;+=ANa+=nW`
-mO0`><3lj3Zodt-RU6(.3LVo3\iT@-Rg/h+=ANa-OgDP2ENWT<+U,m+B*,qCLoSJFEAWQ@:FCY
D/X3$0JFj`$<(VPAooOm2ENWT<+U,m+@9LXBk'4P:.\/V+C\c#Bk&9-ATMr@D..<rAn?%*C2[W<
0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc@ruF'DIIR2-OgD`
78d&U:JO&6-S[5-/i#10%15R#9LM<I4ZXs'ASu("@;IT3De(4)$;aD^<(9Y]9iF29-[09B+Dbb0
Fa,$>@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi
/no'A%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`
F:ARlDe*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*
C2[X*F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3
/p)>[%16igA7TUg05>E9@s)6l/nng6%16igA7TUg05>E9@s)6l/oY]@%16igA7TUg05tH6A8bs2
C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9HA7Th"E%Yj>F:ARlDe*Zm
@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`F"_?<@V'dmD/a<&0JG46
Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A"
@<>p2C1_0rATJ:f.1HVP78lQO8PiAX:JO&6+>=p!+>=638l%ht-qYUX@VTIaF<Etc@ruF'DIIR2
.3N>G+CQBb+E2@>B6%EtD/!m#+CT.u+ED%*@:OCtEbTE(+:S["Df9GE+A,Et+EM[EE,Tc=F!,:5
DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=hF!+n/A0>i3Dg#i*ATJt'$?U3)Ci^_2DfQt0F_PZ&Bl7Q7
+CoD#F_t]-FD5W*+CT.u+EV19FD5W*+A*btH#n(=D0%<P%13OO8l%htEb065Bl[d++EV:.+=Lc/
FC?h;Anc'mF"&5?A7TUr/g(T1%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$
ASu$iA0>u-@<<W;DflKrBl8!6@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH
6WHiL:/i>F$>FC!FCB!%F!,")FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RC
EZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,u
DBO%7AKYet@NZje:IH=A@:C?O:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeu
FD,5.7qHRLEa`c,Cggcq@psIjB5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl
$?'f)FD,5.9OVBQD.RU-F!,UHAKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#
+F[a0A8c@,05"j6ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdh
AKYo/+EV:.+A,Et+AcKZAKYE!A0=BVF@^O`+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r
@<>pqDfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A72+<Y?>FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De't5%14Nn$>j3hBkCptFD>`)A8bt#D.RU,1,2Nj/g,">DJ<]oF*&O:DfQsm:IITH
6WHiL:/hZ06U=OJ8P`)E3[[Nq6m+m9@s)X"DKK</Bl@l:%16-);H$._:-CW\-S[5-/i"d`$:[fb
6q(!:3[\QODImisCbKOAA7TUgF_t]-F=.M):eX/S7ScoV;a!/h-OgDV5sdq)<(0;Q;HZ.D-V%`c
ATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$KC3'gkBPDO0DfU+UFEhm:$?0NfA8bs2C2[W8
E+EPi$?0NfA8bs26?R!YA8,po8l%i@A7TUrF"VEBAdo)dA7f@j@kUGM6pbI+FAR!d@ruEpATLOR
@P2V1Ado)dA7f@j@kUGM6qM9<Ec5K2@ruF'DG4JJ/oY?5%17&bAn5gi01o#.9OVCOBl6OcE-ZP:
E\;<AAdo)dA7f@j@kUGM6rS#HEarZJDe*EIF_u(r@rc:&FE:,a@P2V1Ado)dA7f@j@kUi'Bl7QU
:IINX@r$4+7qHcpE+EPi$?0NfA8bs2<HDklB1brf;IsK`Cgh?QG]7\7F)u&6DK@FLA7c8XE+EQk
DdtG#F(oN)8oJ6VBlmp,@<?'5E+EPi$7QDk;FO8J5uU383Zodt%15Kl;aXGS:fL"^:-CW\0H`D!
0F\@]:IH<nDe!p,ASuT4@rH7,@;0V#+=LuCA1hh3AgnjHBPCsi+CoD#F_t]-FE8RHBOr;Y:IH=H
H#n(=D(Z8)%15^'6m+m9@s)X"DKI"0CiaM;@rH7,@;0V#+E1k'+Eh=:F(oQ1F!,C5+A-cqH$!V<
%16ukFCep"DejD:FD,*)+EM47G9CR;G9D!G+E_a:+Eh16BlA-8+A,Et+D,%lBl%L*Bk;?<%16$F
AKZ).AKYMtEb/a&DfU+a%13OOC2dU'BHS[O@:WneDK@IDASu("@;IT3De*Bs@s)X"DKIONA7f@j
@j_]m%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=AS!!+BOr;Y:IH=LBkqE*E+*BjEt&I)8T&-Y+@:3m
FDl%G+E)9CG%l#3F<FOrAKXT@6m,<7B4W2oF?0j<%16cjFDu:^0/$aO@;L48ATVTsA79RgDJsW=
BOt^pBm+'(/oPcC06Cl=/S]37/T>-2AM4K"%15d;<+T/SA8bt#D.RU,+EMIDEarZ'BlbD*G%#*$
@:F%a+E)-?7qm'9F^cJ%F?0j<%16cjFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De*Bs@grbS
$;,5MDBM8SCLqMq$=[FZATDNr3B9?;D..-p/n8g:%14Nn$>j3hBkCptFD>`)F)Q2A@q@DM:-pQU
D..<rAn?%*+D,P4+A,Et;bpCk6U_Fk6U=OJ8P`)E3[[Nq6m,97C1Ums+@KpRFD5Z2@<-W9;f?f!
@q@"s$<BSn;b9b[4ZXrF/hen51+*M<7Sc]G78c90-YI".ATD3q05>E9F)Q2A@q@"s$;aD^<(9Y]
9iF29-[09B+Dbb0Fa,$>@<-R+DC5l#9L2!45u^9C:Jt=Y3[[F/DImisCaTZ!7S-9B;a!/a0H`D!
0F\A+@;]dkATMrGBkh\u$>OKiA7]p:Bkh\u$>OKi/no'A%176"Bl%iCBkh\u$>OKiF)Q2A@qB^m
FEMOTBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L4ZX]>+?CW!%16`ZDImisCbKOAA.8kp%15Kl
;aXGS:fL"^:-CW\0H`D!0F\@;C2[X(Dfp)1ALSa3Df0Z*Bl7u7F(KB+@;KY(ARlooBk)7!Df0!(
Gp$X?D/^V=@rc:&FE8Q6$7KY-A7T7p/8B*6/9Q&KCi_$X+B3#cF(HJ)F_u(?F(96)E--.D@rH7,
@;0U%@;Ka&FD,4p$=e!bALnsGATMr9@psFiF"AGCF_PZ&+EM%5BlJ08/0JA=A0>E$@s)X"DKK</
Bl@l3F`V,)%172q+Co&,ASc:(+CT.u+DkP$DKK<$DBMPI6m,oUA0>o(CghEsA0>r=F*(u1F"Rn/
%15LGD/^V=@rc:&FE8R5Eb-A0@<-!l+A*bt@rc:&FE8RHBOQ!*Ci<`m+Co1rFD5Z2@<-W&$?'Bg
ARfh'+DG_8D]hYJ6m-#S@ruF'DIIR"ATJu<BOu'(Ecl7P%13OO8l%htF*VhKASiQ#Bk)7!Df0!(
Bk;?.@<,p%B5_^!+D#e+D/a<&F!,C5+D>\;+A,Et+:SZf@;[2sAKZ,:ARlp*D]iM3Bl%<&@rH4'
Ch7i68g&2#F*(u1F"Rn/%15^'6m-M]EHPu9ATJu9BOr;7A79Rg05>*5Ch7Z:+CSekDf.0M%13OO
8l%htF)Q2A@q?cnBk)7!Df0!(Bk;?.@ps6t@V$['ATT&;E$/k4+EVgG+Eq7>F#ja;%14g=+B!?"
+EV:.+A*bt@rc:&F<D#"%144#+F[a0A8c@,05"j6ATD3q05>E9F)Q2A@q@<.De*p-F`Lu'F(KH9
E%Yj>Et&Hc$6UH6<+oue+DGm>FD,5.Eb/a!D/Ej%A7]9oD.Rg&De(IC-u*[2F)Q2A@qB^mFEMOT
Bkh]<+:SZ#+<Y0&DBO%0CLnVs+Dkh1F`_1;DfQtAD]j.?+EDUB/e&.1%14j>+B!?"+EV:.+A,Et
+DbIq+<jER6m,EHF`Lu'+@C'XAKXB`D/^Ur@rc:&FE9&Y+:SZ#+<X9P6m-;S@WNZ#Eb-A-DBO%7
AKWBkASu("@;IA8Cggcq@psIjB5_g9/g*_t+F.mJ%144#+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5
FCeu*Df-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q%144#+C]A0GB7=<@Wcd7Df-\>D]iIu@qB_&
3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3BlbD*
G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT@Q%144#%144#+D>k=E-"&n04Aa,CjC><FD,5r@<>pq
Dfg)7ARogqG%GJBDfTJDFD,5;C2[W7E+*Bj0+A7;%17&pC1Lmf@<HC.1,2Nj/h1g\C1Lmf@<HC.
+EK+d+Co%q@<HC.+E2@>C1Ums+EM+9F`8rB$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp
+<V+#:-pQU@rc-hFCeuD+@KdNASkmfEZd+k1,'.E:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`$r$;No?+C\kq
@rl!kC2[Wi4ZX]I3[cC(Bl.F+-S7AC0mdGFA0<QT,:@2BAU#=F.4ci]De*BiFs(O<A0?#:Bl%i<
+:SZQ67sC!A0>>lBk)3kBkhQs?Q`Pq1E^UH+=ANG$4R>;67sBjF`MM6DKI"FDfTW-DJ())Ec6)>
+>"^XG@b2u+CT=6DImBiARl5W:-pQUC2[Wq?YO7nA7%J\+=CfBDfp"H%13OO:-pQU@s)g4ASuT4
GAhM;Bl7Q+F*22=AKWQIFE_;)CER&,+Dtb%A7]9\$;No?+DPh*F'iWrDe*3<3ZoekF_Pr/-OgCl
$;No?+CfP7Eb0-1+EqaECM@[!+Dbt+@;KKt/Kf.ZART?s@<3Q/AS#C`A.8l@67sC&EbB3,@p`qb
De*3<3ZoedDe!3lAL@oo%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<
De(4<B4Z0-I4cXTEc<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+
-OgDX67sB.BkhQs-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.BkhQs-Qm&5FE2UK
4$"a$B6#,/An*22%13OO:-pQUE-67UG]IA-+>"^MDKBB0FE8RADe*QoBk:ftGAhM4F!,17+EV%4
B4Z0-Ci<flCh4%_6r-0M9gqfV6VgEN5u'gTBkhQs?Q_Km+=Jod3Zp+*%17/nDfp/@F`\aFEZc`V
ISP??-OgDoEaa$#+=DMb:4@U=%15is/g,7VB5DKr?YO7nA7$HlATT%BH[\_=I4#I2.1HUn$;No?
+EM+9+A,Et+E_a:EZf./H#k)[+ED%5F_Pl-F!+'tEb0'*@:UL&D]iIuFD5o,FCbmgF)>i<FDuAE
+=D;QATCFTH#k*KATMF)+>"^VATMs%Ec`Er+D,P4+Cf(nDJ*O%-OgD2FDj]G;cFl$+F?-l/0HYi
E+rft+>b3RATT%BA7]@]F_l/"F(KB-AU/>E.3NhTBlmo/C2dU'BHS[O@rH6sBkK)AF(KB-AU/>L
@qK@$+:S[!D/XQ=E-67F-Y-e#@<HC.+E2@>C1Ums+EM+9F`8];$?1$#C2[W<0ht%f.WBECC2[W*
F"JsdC2[W*E,ol3ARfg)F(KH9E%VS,:-pQB$;No?+CTD7BQ%oP+<X9pBPnq\/g*JhCLqN/+:SZQ
67sBjEb/[$ARmhE;e9oiASkmfEZd+k0K0FJ:-pQU/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%^67sB72fE2J0fL4`
A7T7^+F7X6Ch7Ys$;No?+>>cn@rsF[+CSekARloL;aX,J3&MghF_u)=%15is/g)i-De!lD1a$LM
F(KB6ARloL;aX,J3&Mh"ATW$.DJ()+DKKe>C2[WnATf22De'u5FD5Q4+E1b0@;TRtATDi$$;No?
+>GleARdDP+ED%;EbTW;ASrW&DfQsm+?;&.0d$o4:-pQU1,*TaFttru@:X+qF*(u(+D,P4+A*b:
/hf%'%13OO@Us1_F'iWrDe*3<3ZpLF-n$HWD.Rr>/NQ'MHXpi$+>>5h-Y[F/GT\@_/151NA7T7p
+DPh*+E_d?Ci^sH%17#a+C\kq@rl!kC2[Wi+BosE+E(d5-RT?1%15is/g+YHEcP`/F<GdGEbfB,
B-:i-Dfp"A/Kf.ZART?s@<3Q/AS#C`A.8l\De*KfBkhQs?TgFm-YdR1-OgCl$;No?+CfP7Eb0-1
+EqaECM@[!+EM[>FCcRH+EVg=@;?uoF!,@3ARo@_%16igA92*lC2[Wi4ZX]5C2[X(D/X3$FCfN8
F!hD(%15is/g+tK@:UL'F(Js+C`mkBBl%i5Bl8$2+=Lr=De(:+$;No?+=Cl<De(4<B4Z0-I4cXT
Ec<-KB6%s$CghC+F`_>6F!hD(:-pQU-Y[=6A1&L4ATT&C/g+eIE$-N=@V'e+-OgDX67sB.BkhQs
-Qm&5F<Gua+D5_6+=C]2GA(]4ASQ9rEbTK7-OgDX67sB.BkhQs-Qm&5FE2UK4$"a2F!,(-EZf(.
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
DIn$2@:s-\$=%:_E-68LH?s=EA92j2Eb-kFAU&V4$4R>IDIn$2@:s-\$=%:_E-68LH?s=EA8Paj
AM/(9G^U#.%16?XATr*%B4VMZ>\S(pF`_tVH>7A/F`_>6/p(ZLI16Mm$=%I[GApu'AISuOBl7m4
FF/=[C2[X)Df9H5/p(ZLI16Mm$7/qpATr*%B4VMZ-!YA+ARfXpF_u"*$7/qkDK'`?H[[2gB6%p5
E.0$\@rGmh/p(ZLI16Mm$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cu
HZX19I=$$H@ruF'DLHk:FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,
ASuU<%13                                                                  ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0etO-1,'h++>G_r1,pC30H`/-+>Gbs1,^701a"P-+>GSn2E)a53?U(7+>GYp1c6C20d&>0+>G_r
1c-=00H`/-+>GYp1c-=03?U.;+>PYo1,^701a"S7+>GSn1-$I33?U+:+>Get1Gp:00H`,-+>t>s
2]sh3+>YoJ:IINL8PDNC8Q/Sa;H\$O@qBP"+A,Et+C]J-Ch+Z%BleB7Ed8dDDeD[<6rZrX9N+8X
8PDNC8Q/Sa;H\$O@qBP"+A,Et<)6:`;]oOlBl%<&BPDO0DfU+GCi<r_:K(5"C2[X!Blmp,@<?'q
De*ZuFCfK$FCcS6Df^"CE,ol,ATMp2E`>h&:L?^i6psg<?Ys=gDe*Bs@j#VsEbf3(GA\O&:IIuX
:IIuc8l%i^D.I^+F`Lu'+D,P4+D>k=E-"&n05#!@BQ[c:@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:
@<6O%E\CBf6r./^:IHgPA5l>m:L@jTA8Gt%ATD4$ARB:bC2[X!Blmp,@<?''D..I#A8c[0+B2-)
:L\H\Ch.:!A8G[rAU%j!DImisFCfM9F*VYF@<`o.BkM*qBkM+$ARloU:IH=HDfp)1AKXZT<+T0@
F_PZ&C2[X!Blmp,@<?'s@<?(*B4YslEaa'$F!,OLDKK<3+D>J%BP_BqBQRfr+DPh*Ch\!&Eaa'$
+EMIDEarZ'9OUn3=CbuT@<HC.<HD_lCLqd4EHE=GF(KB-AU/>>AoD]4A7]@]F_l.BE,ol3ARfg)
-ua3AA7]@]F_l.KBPDO0DfU,<De)I96m,oKA8c?.BPDO0DfU+UFEhmMBl5&1@<--oDg-)6De*3n
G%kN3?Z]k(8l%htDg#]4G%kN3+A?3CAQU'rAS!!$@:O=r+=L]ABl%<pDe*ZmFCf\GC2[X!Blmp,
@<?'\F(KB-AU/?:F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A8Gt%ATD4$ALVA4
A8Gt%ATD4$ARBA!Bk;KqFCf]3De*ZuFCfK$FCcS5G%G];Bk;K29OUn3=DDbbE,o\nF(KB-AU/?:
F<G^IATDQtH#k*<Df00$B-:f)EZf=ADe`inF<DuNEb]?-A1;A(DJ<]oF*)/8A8kseD..<)D..<r
An?%*+D,P4+A,Et+CSekDf0E#DJ<]oF*)/8A7TUgF_t]-FDtYuD..<)D..<rAn?%*+D,P4+A,Et
6r-0M9gqfV+CSekDf0E#DJ<]oF*)/8A92[3Ear["@:O._DBNe)DJ<]oF*&O:DfQsm:IJ,W<Dl1Q
+CSekDf0N7C1Lmf@<HC.A7]@]F_l.QFCf<.CghEs+E2@>C1UmsE,o].De*U$A0>i3De`inF<GX9
FEMPKH?s=EA8PahDI7KsGYMU\DBMPI6m*n(H?s=EA8PahDD$$BGUXbO@<?(*+D,>(AH       ~>
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
zz=:zz,'PT JSON JVERSION LATEX LF MACRO MACROTYPE MARKDOWN MASTERPARMS MAXE'
zz=:zz,'XPLAIN MAXNAME NVTABLE OBJECTNC OK OK001 OK002 OK003 OK004 OK005 OK'
zz=:zz,'006 OK007 OK008 OK009 PARMDIRS PARMFILE PATHCHRS PATHDEL PATHSHOWDE'
zz=:zz,'L PATOPS PUTBLACK PYTHON REFERENCE SQL SUITE SYMBOLLIM TAB TEST TEX'
zz=:zz,'T UNION UTF8 WORD XML abv afterstr alltrim badappend badblia badbu '
zz=:zz,'badcl badfl badil badjr badlocn badobj badrc badreps badsts baduniq'
zz=:zz,'ue beforestr bget bnl boxopen catrefs cd changestr checknames check'
zz=:zz,'nttab checknttab2 checknttab3 createjod createmast ctl datefrnum db'
zz=:zz,'lquote decomm defzface del destroyjod did didnum dnl dpset dptable '
zz=:zz,'empdnl fex firstone fod fopix gdeps get globals globs grp gsmakeq g'
zz=:zz,'uids guidsx host hostsep isempty islocref jappend jcr jcreate jderr'
zz=:zz,' jdmasterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv j'
zz=:zz,'ustpath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc ne'
zz=:zz,'wd nlargs now nowfd obidfile od ok packd plt put quote read readnou'
zz=:zz,'n readobid regd remast restd rv rxs rxsget rxssearch saveobid secon'
zz=:zz,'d tc trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),'
zz=:zz,'(<<;._1 '' jodliterate ALERTTOKPFX ALERTTOKWRAP BEGININDEX BEGINJODH'
zz=:zz,'EADER BEGINJODPOSTP BEGINNOTJ COMMENTTOKPFX CR DEFAULTPANDOC ENDIND'
zz=:zz,'EX ENDJODHEADER ENDJODPOSTP ENDNOTJ FAKETOKENS IFACEWORDSPFX IFACEW'
zz=:zz,'ORDSjodliterate IFCPFX JLAUTHOR JLBUILDTEX JLCLEANTEX JLCODEFILE JL'
zz=:zz,'DEFAULTAUTHORS JLDIRECTORY JLGRPLITTEX JLINSERTIFACEMD JLOVIEWFILE '
zz=:zz,'JLOVIEWSUFFIX JLOVIEWTEX JLTITLEFILE JLTITLETEX JLWORDLITTEX JODLit'
zz=:zz,'eratePreamble LATEXTMP LF LONGCHRBEGPAT LONGCHRENDPAT MARKDOWNHEAD '
zz=:zz,'MARKDOWNTAIL MARKDOWNTMP PANDOCTOKPAT ROOTWORDSjodliterate STRINGTT'
zz=:zz,'OKPFX TEXTQUOTESINGLE THISPANDOC UBARSUB WHITESPACE WRAPLEAD WRAPLI'
zz=:zz,'MIT WRAPPREFIX WRAPPREFIXTEX afterstr alltrim beforestr betweenstrs'
zz=:zz,' boxopen changestr charsub ctl cutnestidx cutpatidx dbquote dbquote'
zz=:zz,'uq fboxname ferase fexist firstones formifacetex formtexindexes fsi'
zz=:zz,'ze fuserows gbodylatex gheadlatex gpostlatex grouplatex grplit ifac'
zz=:zz,'emarkd ifacesection ifacewords ifc indexgrouptex indexwraplatex jod'
zz=:zz,'literateVMD jpathsep jtokenize latexfrmarkd long0d0latex markdfrghe'
zz=:zz,'ad markdfrgpost markdfrgroup markdfrwords markdj markgassign markgn'
zz=:zz,'onj patpartstr ppcodelatex read replacetoks rtrim setifacelinks set'
zz=:zz,'ifacesummary setifacetargs setjodliterate seturlsha256 srxm tlf toJ'
zz=:zz,' tslash2 utf8 uwlatexfrwords wfl winpathsep wordlatex wordlit wrapQ'
zz=:zz,'tlatex wraplix wraprgidx wrapvrblong writeas''),(<<;._1 '' jodliterat'
zz=:zz,'eTroubleMakers IFACEWORDSjodliterateTroubleMakers MASTERPARMS ROOTW'
zz=:zz,'ORDSjodliterate ROOTWORDSjodliterateTroubleMakers jodliterateBadBoy'
zz=:zz,' writetd2''),(<<;._1 '' jodmake DDEFESCS DUMPMSG0 DUMPMSG1 DUMPMSG2 D'
zz=:zz,'UMPMSG3 DUMPMSG4 DUMPTAG ERR0150 ERR0151 ERR0152 ERR0153 ERR0154 ER'
zz=:zz,'R0155 ERR0156 ERR0157 ERR0158 ERR0159 ERR0160 EXPLAINFAC EXPPFX0 EX'
zz=:zz,'PPFX1 GLOBCATS HEADEND JARGS MIXEDOVER OK0150 OK0151 PORTCHARS SOCL'
zz=:zz,'EAR SOGRP SOPASS SOPUT SOPUTTEXT SOSWITCH WRAPTMPWID btclfrcl clear'
zz=:zz,'so clfrbtcl createmk ddefescmask dec85 dumpdictdoc dumpdoc dumpgs d'
zz=:zz,'umpheader dumpntstamps dumptext dumptm dumptrailer dumpwords extsco'
zz=:zz,'pes fap fmtdumptext fromascii85 getallts getascii85 halfbits htclip'
zz=:zz,' jnb jscript jscriptdefs makedump makegs masknb namecats nlfrrle no'
zz=:zz,'unlrep opaqnames parsecode putallts rlefrnl sexpin sonl tabit toasc'
zz=:zz,'ii85 uqtsingle wraplinear wrdglobals writeijs wttext''),(<<;._1 '' jo'
zz=:zz,'dtools AGEHEADER CR DOCUMENTMARK ERR00400 ERR00401 ERR00402 ERR0040'
zz=:zz,'3 ERR00404 ERR00405 ERR00406 ERR00407 ERR00408 GROUPSUITES IzJODtoo'
zz=:zz,'ls JODLOADEND JODLOADSTART JODTOOLSVMD LF OK00400 OK00401 OK00402 O'
zz=:zz,'K00403 OK00404 OK00405 OK00406 POSTAMBLEPFX TESTSTUB WARNING00400 W'
zz=:zz,'ORDTESTS addgrp addloadscript addloadscript1 allnames allrefs betwe'
zz=:zz,'enidx createjodtools dayage delgrp firstcomment firstperiod fsen ge'
zz=:zz,'trx hlpnl jodage lg locgrp mls noexp notgrp nt nw obnames onlycomme'
zz=:zz,'nts pr refnames revonex swex today todayno updatepublic usedby yyyy'
zz=:zz,'mondd''),<<;._1 '' jodutil ASSUMESMARK AUTHORMARK CREATEDMARK CWSONLY'
zz=:zz,' DOCUMENTMARKS DYADMARK EDCONSOLE EDTEMP ERR0250 ERR0251 ERR0252 ER'
zz=:zz,'R0253 ERR0254 ERR0255 ERR0256 ERR0260 ERR0261 ERR0262 IzJODutinterf'
zz=:zz,'ace MONADMARK NAMEALPHA OBFUSCATE OBFUSCCNT OBFUSCPFX OK0250 OK0251'
zz=:zz,' OK0252 OK0255 OK0256 PDF PDFREADER PDFREADERMAC ROOTWORDSMARK SCRI'
zz=:zz,'PTDOCCHAR VERBATIMMARK blkaft changetok compclut compj compressj cr'
zz=:zz,'eateut ctit de dewhitejcr dewhitejscript disp doc docct2 docfmt2 do'
zz=:zz,'ctext docword ed et exobrefs gt jodfork jodhelp ljust obtext pdfrea'
zz=:zz,'der qt reb revo rm rtt textform2''                                  '
zz=:4924{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1cQU9+>P&q+>Y`20H`))+>GW12_Z@01a"M-0f^@8+>Gc.1*AP!0f_3N+?(Dt2*!L.De)U0/g)WY
De'u#/M/)^@;0U%8l%htA8,OqBl@ltEd8d;CghC+/e&._67r]S:-pQU6#:?[DffZ(EZen,@ruF'
DIIR2+Cf4rF)to6+CT;%+D#e>ASuR'Df0V=De:,6BOr;sBk)7!Df0!(Gp$U5@<6KB%15is/g+,,
AU,D,Cht5:F(HJ8FCB&t@<,m$@rH7+FCB'/F!+n/A0?&,Eaj)4A7]@eDIm?$Bl5&8BPDN1@r,Rp
F"Rn/:-pQB$;No?+@C0\@<?4$B-:V*8l%htDdmHm@rri(AS,XoATJu&+=Lr=De(:>Ci<flCh4`'
DKKH1Amo1\/e&._67sBKATMs6Dg?&7B-:V*8l%htDdmHm@rri)Eaa$#F!,R<AKWC8C2[W3+Dbt+
@;KKtBl8$(Eb8`iAM+E!:-pQB$;No?+@C'bFCAm$F#kFSBk)7!Df0!(Gp%6OBl%L*Bk;?:+Cf>-
F*(i.FE8uUBl8$(Eb8`iAKZ/-Eaj)!$;No?%15is/g*`'FCfK)@:Nk0+=MDEEaj)4D.-sd+CTG%
Bl%3eCh4_uGp$g9De'u,De!3lALS&q:-pQU+<Y*%Fs%nM+<Y*/C`m1q@r$4++Eh=:F(oQ1+DtV)
ATJt'$;No?+<Ve9B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2
$;No?+<Ve9DJUF<+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC
+<Y3+Ch7^"+EqaEA90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs
+<VdLA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn
+Dbb5FE8R:Ec5e;E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#
EcVZs:-pQU+<Y<-AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-
+<VdL+D58-+EqaEA90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is
/g)8ZB5DKqF!)SJGAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6
+<VdL@rc-hFCcS'DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImis
FCcRe+EM%5BlJ08+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@lt
Ed8dF@;TQuCh[s4F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'
DIIR2%15is/g)8ZDe't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!
CLeP1+E1b!CER/%@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-pp
Df[HPATT&)ATVL(@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/lt
F*(u6+CQC'Bk)7!Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k
+C]U=-u`U)CLek'$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8Z
F`V,8+<VdLGAhM4F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU
+<X*nEc5t@D.Rd0@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`
Bl8!'Ec`EOBkhQs-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,e
EHPu9AKW@8Anc'mF!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlot
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
BHS[;De+!3ATD:!DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X!Blmp,@<?'U67sa&
De*ZuFCfK$FCcS9/M/)XASu("@<?(%+Dbb6ATD4$AKZ&4F`Lu'+Cf>#AKYN%@s)X"DKKqBA8-'q
@ruO4+D,Y4D'2GH6m-,_Dfp#?/e&._67r]S:-pQUG%G]'@<?4#3ZrKTAKZ).AKYT'Ci"$6Bl7Q+
@Vfsq+E27?FE8R5DIal&Bln$2@N]8sCh7Ys$;No?%15is/g+hLFDu:^0/$aO@;L48ATVTsA79Rg
DJsW=BOt^pBm+'(/oPcC0/>491+t@90/,+6F(K3&/So-CATD4$AM%Y8A1nB!:-pQUBQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@$\0JY=80JY:93A55fEb-h;/T>-9A8bs0F*VYF
@<aA;BkM*qBkM+$Bl7Q:%15is/g+hLFDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-@:O(o04Ja9
@P;S,F*(u605>E9Ch\!&Eaa'$03*(-DJ)R[A8Gt%ATD4$AM.q4Ado)B67sBoFEDJC3\N.!Bln$2
@P2//D(f@,CLqO$A2uY'C11UfF"_!=DdkA:@<6O%E\D0GA8Gt%ATD4$AM7&)Bl7Q01,*H]A8Gt%
ATD4$AM.\9H#@(#$;No?%15is/g+kGFCfK)@:NjkGAhM4.!$gu+:SZQ67sB4/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/I`%^67sB'<(KSZ:dIiE:I?6I+<VdY+D,b4C`m\*DIdZq+E1b2BHSlLF`V+:-u`U4A8bs,
+DGF1Df-\=BOu!r+E1b2BFP;D67sB'AoD^,BkCd`ATVL.+<VdY+D,P4D..O-+D?%>ATDU$DJNfo
+CT.u+D>J%BP_BqBQRfr+DG_8ATDBk@q?d,DfTB0%15is/g)9LEc>i/F<D\K+<VdL+<W6YD..3k
+DbJ.AU#>0DfQt5Ec6)>+=MLa%15is/g)9NAmo1\F(Jj'Bl@l3+<W6YBl8$(Eb8`iAKZ&*@ruF'
DBO"CD/E^%Gp%0MEbTE(%15is/g)9NAn)r++<VdL+<VdL+<W6YAoD^,@<<W+DKKH1Amo1\+Cf>,
D.RU,+EV1>F:ARP67sB'F(KH.De*ZuFCfK$FCcRH+E2@4E+*cu+A?3CAQU'oEc5H!F)u&5B-8cK
F(KH7+E)CE+Co2,ARfh#Ed8dOEbTW,F!,FBARTFbCh4%_:-pQU+E_mE@<?(*Ao`*6Eb'56/Kf1R
GB.,2E+NQ&CghEsGT^U=Df$V@DfTB03ZrQhCghEsG\1u?DfTB0+?MV3G@_n@Ea`o0F_>N9-OgDX
67sB'GAhM4Ch[u6+<VdL+<VdY+DkP&AKYetFCf\>Ao_g,+EqaEA0>]&F*&NQGps10:-pQU+:SZQ
67sBhF`_;8E]P<c8oJB\+@Ih)6=FY@EX`@N67sBjEb/[$ARmhE1,(F<De!lC0b"Ib67sB4/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/I`%^67sB812gZE0Jah"GUXbJEc>i/F<G"4B6A'&DKI"0A7T7^+EVNEF*2G@
Eb0<5+EDC=F<G[:GT^pJATE!8Blmp-%15is/g)l(De!lC1a$FODfp"A8Oc!579<8_6rR`=Dfp#:
@;TQuBR+Q.EboH-CLq#c$;No?+>GWi@rsC^+ED%4CgggbA0<rp+E1b0F(oN)+EqOABHS^IAo&n=
/Ke_8DIdQpF!+q#A0>V0@rGmh%15is/g)l(De!lC3$;X?A7]9oATDg0EZf%(DIdQtDJ((D+ED%4
CgggbA0<:EEbTW,.3NhKFD)dFGB.D>ARTX/%15is/g)l(De!lD0d'n8C3=T>ARloW@8pf?+E2@4
@;TIiAKWQI@q]:gB5)6r+Dl%7De<p*FE7lu:-pQU0f!ZWF>5Nn@:Wn[A0<:A@WZO(ASuQ<+>"^Y
F(Js+C`m>.EZee.@;L48Bl7Q+@rGmh+EV1>F:ARP67sB812gZE0fL4`A7T7^+=MGS@;pC1@Vft#
B.4rT+Dbt6B-;86F`Lu'+Dbb0ATJu3Dg*=JEa`p+ARl5W:-pQU0f*?O@kp%e@:Wn[A0>u4+=Lu5
@r$-7+@g-f89JAaEb03.F(o`7Ed8*$:-pQU1,*QRGq_0"@:X+qF*(u(+EqaEA0>K&Ec#6,Bl@l3
.!K9>.3N5@EZdss3A*!?%15is/g)o'D..]D3$<?_A79RkA0>K&EZek7EcP`/F<DuN@;]Uo@jrOD
ATDj+Df0V*$;No?+>PWcF`&ll+CSekARlo3AoD^,BkCd`ATVL..3N_N+DG_8ATDBk@q?d,DfTB0
%15is/g)o'DJs\P0d'n8A7]9oB6%F"BPCst+CT.u+DG_'Cisf5Df0V=F*1r&Bl[cpFDl2F+EVNE
E,oMuD.7<m%15is/g)o'DJs\P0d'_1AS5^pHXq&)F_t]-FF>9KDg#]&+EVNEEc5l<+D,>(AKYT'
EZe/$ATCIU@:h-%Df#pj:-pQU1,*TaFtb`q.!&sAC2[X!Blmp,@<?'0+Cf5!@;]Xs+EM%5BlJ/F
+CTD7BQ%o>F"&X_ASkjiC`m.sA7]9\$;No?+>PWgDg!ij+=M2J@rGmhCghEsGUXbDA7T7^+EVNE
@:X+qF*&O7Des?4Bl7Q+De:,9Ea`p+ARlp"Bl7L'%15is/g)o'A7]7)0d%leGAL]0AU%g-GAhM4
F"&5?A7T7^+:SYe$=e!aCghC++<W%?C2[X!Blmp,@<?'.%16T`Bl8!'Ec`EOBkhQs-OgCl$;No?
.V*+0ASu$iDKKq/$;No?+Co%nCgh?qA0>N$Ddm-k+D>>,AKZ)5+CTG3Bk/>rDf000F(oN)+A?3C
AQU'm@;TRs+EqOABHTniDIIBnEt&IO67sB/.OdMA+A,=,8Q8AP<(0n38k`#]8OZ][79C[)9L;`N
9LMiK=<L407oE/W8Q8YX=<L40=&2^^9M&2_79CZA$;No?+=J]g4ZX]X:IIljFCfK$FCe9hARTFb
Ch4_]9LDKB5u(BJ=<J%[%15is/g+&1B4Z*+89JVoF!,[FEb$;)DfT]'FD5Z2+EMX5FCcS3@:Ntb
DIjqB+EM76Bl%KlEZfIB+?MV,@Wcc%$;No?+E1b0F(KD8FCf]=+EqOABHTu<F"AGSATV?pDK?qE
BPDR"F)YPtAKYE!A0>PoDIdQpF!,C?ASrW1F`2A5F"Rn/:-pQB$;No?+Eh=:@UX@mD)reWDffP5
A8,XfATD@"@q?)V:-pQB$;No?+<VdLG@kY=.k`#Z/g)o*+>k\m-RV\d78=t&<DQR_-OgDX67sB'
+<Wa,-S$hmBeCM`1E\P++=AO4:dn,%;,pCk74/NO%15is/g+hAA7Zm)@rc:&F<GC<@ps1p+<`-_
.6T:+D.[T,F(T52%16raCcsBn1,Us80H_J\+<VdL+<VdL+<VdL+<VdL+<VdL+AP6U+BTb)FD,6+
%16raCcsBn0d%Se3@nSkBeCbU-Rg/\+<VdL+<VeTD.[T,+AP6U+B'D,BPDR"F)YPtAKWCBE+*6f
+CT.u+D>\6BmO]8FCAu.FCAW-%16raCcsBn1*@\f/1=pZBeCc!@4*KS053$o2CTbsD.[T,+AP6U
+@.,9/Qs9*/UAONG[kQ4A8,po+AO%G%16raCcsBn1E[eg@4l7H-Vc$<+<VdL+<VdL+<VeTD.[T,
+AP6U+AO&$BOr<&ATW$*EZe*d$>jBk4Y@j6+<W(@/nlpc6743)+<VdL+<VdL+<Z)LAo&S4:-pQU
66LA`AKYf#FED)7+@6MED.[TI/g*"o+=LYNBeCbe0etOA2)[BQ3F=-_+FS*=C`jiq67sB@+Co2!
BlnD=@;]Tu?O[?ZAo'U_+>t>b-t+`B/gi8!.3K`U+<VdL+<VdLI;NS4+<XEG/g*P)/e&/)Ao'U_
+?(Dc-t+`B/gi\-.3K`U+<VdL+<VdLI;NS4+<XEG/g*M(3XlF5Ao'U_+?1Jd-t+`B/gi"o-Rg/\
+<VdL+<VdLI;NS4+<XEG/g+"6EHQ2AAISu`Ao'U_+?:Pe-o!M,+<VdL+<VdL+<VdL+<VdLI;NS4
+<XEG/g*MZ%16raCcsBn0ea^u0eb%!+<VdL+<VdL+<VdL+<VeTD.[T,+AP6U+A>66$4R>`Ao'U_
+C?m0>TtmFI4c]r4"akq+=Jod3Zp+*%14I*=<J_/+<XT*+<Vdm+<VdL:*:Z%+@71n+<WZe+<Vdp
+<VdL6QdKo+Aj7(+<X$L+<VdL+A>6I+=CGK%1444+>Fu]0esk++<WE^0d%Sp+>Fu]1*A:o+>t>s
+<WB]0d%Sn+>Fu]2]sgt+>GPm0d%S]0d&1n+<XEG/g)hj+DG_-FD50"%1444+>P&^0esk,+<WE^
1*@\q+>P&^1*A=p+>t>t+<WB]0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)kk+E)@8ATA4e
+>Fuo+<WBo+>P&^1*A7n+>P&n+<WE^0H_Jn+>=o\0d&.m+>Fum+<WTc1*@\o0H`+n+<WB]1*@\^
:-pQU1*@]JCiD%FF_qQp+>Fuo+<WBo+>P&^1*A7n+>P&n+<WK`0H_Jn+>=o\0d&.m+>Fum+<WTc
1*@\o0H`+n+<WB]1*@\^:-pQU1E[f8%1444+>P&^0esk,+<WE^0H_Jn+>=o\1*A7n+>P&n+<WNa
0H_Jm+>=o\2]sju+>GPm1*@\^0d&4o+<XEG/g)tn+AP64$6V>O0H_J\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+>Fum+<WB]0H_Ju+>=o\0ea_*+<Vd]+>P&^+AP6U+>k8a:-pQB$6V&G1a!nq1E\@o
+>t>r+<WQb0H_Jr+>=o\2BX[r+>t>r+<WB]0H_Js+>b2`0ea_*+<Vd]+>P&^+AP6U+>t>bDKTe*
$6V8M0H_J\2]sds+?(Ds+<WTc0H_Js+>=o\2]sds+?(Ds+<WTc0H_Jt+>=o\0ea_*+<Vd]+>P&^
+AP6U+?(Dc-OgD*0d&4o+>GSn1*@\p+>P&^1E\Fq+>P&p+<WQb1*@\o+>P&^0d&4o+?(Ds+<WBm
+>P&^+>Fuo+<Ve%67sB?+<W$Z%144<+>=o\+?:Pu+<WZe0H_Ju+>=o\3?U!u+?:Pu+<WZe0H_Ju
+>=o\3?U!u+>GPm1*@\^0d&4o+<XEG/g*.s+Cf>,D.RU,%1444+>P&^0eje++<WE^1*@\r+>P&^
1*A=p+>t>t+<WB]1*@\o+>P&^2]sju+>GPm1*@\o0d&.m+<XEG/g)l&+@B$9$6V&G1*@\o0d&4o
+>P&p+<WK`1*@\p+>P&^2BXat+>Fuo+<WB]1*@\u+>P&^0ea_*+<Vd]+>P&^+AP6U+>GSn6W-TI
%1444+>P&^0esk*+<WE^1*@\q+>P&^1*A=p+>t>r+<WB]1*@\o+>P&^2]sju+>GPm1*@\^0d&4o
+<XEG/g)l(+EML1@q?)V+>Fuo+<WBp+>=o\1*A=p+>Y,q+<WE^1*@\t+>=o\0d&4o+>Fuo+<WTc
1*@\o0H`+n+<WB]1*@\^:-pQU0f'qnE+*6f+CSl(ATAo2F_qQp.1HUn$;No?+EqaEA0>K&Ec#6,
Bl@l3AoD]4Ch[cuEt&J#Ao'Uk+=Jp*F(T5MD.[T5+=83m3XlE*$;*u[8Q%uE<)6Cp4ZX]5-OgCl
$;No?+Eqj7E,]B!+Dbb0AKYr4AS,Y$%16075u:6D5t!js-U'.84spdH%15is/g,+ADIdZq+EVX4
DKBE.Ec#Au+Eqj7E,]B!+Dbb0AKYf#@:UL&Deip%%15Bp78d)a:J4be5u9^*+=CD[Ch7X/<,ZQ!
-S/=s5u:6D5t!7OI4#I2:-pQ_ASu$hAT23uA7]Y#Et&Hc$4R>;67tA_IXZ`p+F>4`+C\c$+FO\+
%15is/g,4KASc0*F(96)E-*4EBOQ!*ATD4#ATJu9ASlC)EcPT/Gp#dh<+T/SAnc'mEt&IO67sBU
8PN#B+D58'ATD3qBmO>5AoD]4Ch[d0GV<oB@rHE2%15^$6VKp7:/jYa4ZX]>+?CW!%17,eD'3k1
D/XT/+DbJ.AU#kMAU#>>ASlB/Anc'mEt&IeAS`J=/n&mI%16WWC`k2[@Ua-_$=m^a+=]!SG%hBm
A7]R".P>[]%16WWC`k2[Bk2Gt$=m^a+=]!^F`\'"A7]R".P>OUB+52YAS`J=/p)#A%16WWC`k2[
Ci<np$=m^a+=]![DeojiA7]R".P>OUF:ARfAS`J=/no36%16WWC`k2[Bl%Dk$=m^a+=]!QChF1a
A7]R".P>@[%16WWC`k2[B6kt8F`VgW%14Nn$;No?5!FFEIXV_5%13OO:-pQq4FVa.INWt[/o4s<
AU#>G%13OO:-pQUB6%p5E$07:FDPM2@;]Tu@<H[*DfQsP+EMX5DId0rA0>,o@;BFrBln0&%15^$
<(U%_78u]X4ZX]>+?CW!%14C(CghEsGT^F;FD,T5/0K%KFDPM>+E)4@Bl@ltC`mk@C`m/(A0>Po
F(c!i>[_bsBQ%p<INs;MF`_;8Edf6^+=18t%14Cd>R_#d>]XajCht5!F`M;FINs;UC3+N<CjmUX
I3;d"%14CdAoDU0DJsW.F(or3+C'#"G]\%LHW*I$/M]1A3ZrkrIWK121,Ut=,CY%`>]+J#D..7%
BmO>"$@N?j>]a\%Ch7ruFCf]=FEDkY,CX9GDfp#J,CY%`7riNjE.&0&.1HUn$;No?+D5_5F`8IA
G%G];Bk;K2BOtU_ATA4e8k`#]8OZ][79D]6+>=p!+>=63,p7;CBlbD3De*ZuFCfK$FCcS5G%G];
Bk;Jt$=%X`@ruF'DL5W1AU&<=FF/H]IV3\>F`;dSIXN>7G%G];Bk;L:%14Nn$4R>;67sBs@<?(*
+D5_5F`8I4F_PZ&+EM%5BlJ/:%15^$6<-TN6rZTW4ZX]>+?CW!%17,eD'3n2EHPi1@q?d$Aftnu
FCf\>@rH4$@;]Us+EV:*F<G4-DImisFCcRk6q.UmEb0)1@<6L4D.Rc2CghEsGT^RBATJu&Eb-A3
DBO%7AKZ28EbfB,B-;/%FD)*jF(KH0De!3l%16TU+>77J-%9BD0F\A*F^])pFCf\>+FYPaB6%p5
E.0$\%16r\CLq3tA7^!.INs;SEc6)>INs:N$>ainCghEsGT\,X,CX9GDfp#J,CU(/Cis0&@<?(*
+<Z+XIV3\>F`;dSILQWqDIdR%@ps0_$7QDk%15is/g+eIDfp"AEc5l<+EV1>+>"^GDesQ5DK?q;
@<iu5AS#Bp@:X+qF*),6B+52?9LhuW9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRC
B6%s-BlkdHCghEsGT^U4Ch54A-tdR>Ch[u?+D58'ATD4$ATJt<B6%p5E$>_u,p7)6D.R6#G%G]8
Bl@m1+E(j7FD,B0+D,>(AKYT'EZeq%@qZuW:IH=<Ec6)>+DGp?E,ol,ATMp(F"Rn/%16?SDK'`?
HV.(%9PJT[Eaa'$:i^,UD.7<m/p(ZLI16Mm$=%%OB5)71A8bt#D.RU,I16Mm$=%:_E-68LINs;S
Ec6)>INs;`Bln0&/p(ZLI16NgD..3kFD5i5AISuOFCAWpAT)0jDf0Z.DKKq/$4R>IDIn$2@:s-\
$7-g)Df'?"DIdf2AoD]4@:X+qF*),6B-:`!F*(i.@q?)V,p6Z.FE_;-DBNG-CisT4F!+n/A0>T(
F(KB6Bl7Q+@3BT5Ch4%_-!YM&FDPN+B67g6>[q\gF_u#;AT3'E1M(EO%14CdF(KH0ASu.&BR<uo
DesQ5DKBB.Ecl20I=!Y#2/mYc%14CdFE_Y5DesQ5D@HqXBl7m4FF/H]IV3\>F`;dSIW'CDATobK
AU&V4$4R>IDIn$2@:s-\$7/qqDIm<rCisT4%16?SDK'`?H[[2gB6%p5E.0$\@rGmh/p(ZLI16Mm
$=%I[GApu'AISuOE+iZtFDl#;ARfgrDf-!k>[_/R@rH7,ASuU2Ch[cuHZX19I=$$H@ruF'DLHk:
FCf]=FEDjm3di,BDId='I16NgE,oZ1FD5W'AU"Xk%16?ODIe*)De!p,ASuU<%14Nn$4R>;67sC)
DfTA2Ch[u6Ec5l<+EV1>%15^$=&2^^9M&2_79D]6+>=p!+>=63,p5ojBl5&.De*ZuFCfK$FCcRC
GAhM4Ch[u?+DbJ.AU#>0Bl%?5+:SYe$=%:_E-68L8l%iKBlmp,@<?'WEb/Zr@VfU.FCf]F%13OO
>[h8WBl89.De!p,ASuU<%13OO>]++sE+*Bj%13OO,p6]9D/E^!A9/l*DfQt/A867.FD5W*+Co2-
FCB&sAIStm+C\o(G@b?'+Cf>+F_u#;+CT.u+DG_7ATDm,DJ()#+EDU@AIStm>]XIuCh7KsFD-#+
@rH1+D/OE+E.*'hASli)$7/quATVa"DJ+')HX('!CisT4F(K<2F_kW;HS@'0E--L;$7/r!GAgu0
CisT4%13OO-!YA+ARfXpF_u"*$=%:_E-68LINs;`AU&*$D.S/@IUd;,AM/(9G^U#.%16?XATr*%
B4VMZ>]=@bDKKf6F(Jj'Bl@ku$=%"MA7KOqFCf?3F)5Q.AUAN;@sr]FARfgrDf0uM>]aP%FEDVO
4Z\!68T&'MG^U#.>]=^tDKKT1A7]up$4R>IASu%*A8bt#D.RU,I16N4%13OO%15is/g,">Bl5&.
De*ZuFCfK$FCcRg@8pf?+E2@4@;TIiAISu=:IIljFCfK$FCe9hARTFbCh5aj+>=p!+>=63,p6r@
A8Gt%ATD4$AKYetFCf\>E,oMuD.7<m/g(T1,p3X(,p60#BlbD/Bl%?'BlbD*+D>J%BP_r:@s)j7
Df'37ARlp,ATDj+Df-\9Afu2/AKYr4ARTFbCh4%_,p7&5FCfK,@;I'!ASu("@<?'k+C]U=E+*Wp
Ddt/9+>%XWDfBf4Df-\ABOu'(E,ol-F^o-'B-7Wj,p4g^AU#>9F`_SFF=n\T@;]Uo@j#H!B4u*q
B4uC$DJ()+F!,CEATDg*A7T7h+CT.u%14C(FD,5.F*(i.A79Lh+DG_(AU#>3F!,L7A7]@eDIm?2
+:SYe$=%+[@s)X"DKKB)@<6Ko0f!]i?$g"#FD56$AUP!p%16?_F(K<!@r#LcAQrtZDIdfu@;od`
HY6o.D.Rg0H$p,/>]k+!E+*6l@:s.UBOtU_Bl7R)?$g1+Ci"'!B4ZK#$=%^pAT2'fCLLjeHYdP;
A7]e!I16NgF`V,5@:O(]B4ZEuD0'cDD.5&)D0'Q&FD-(3$=%^pAT2'fCLLjeHYI):ATVL./88^4
F^]B'G^U#.%14C(E,ol?Bk1dr+C'#"G]\"L@WQ%"BlJ/'$=%^pAT2'fCLLjeHY-u:CijnWAUP[1
$4R=g+D5_'E+irqF!,17@r-:/Bl@m1%16?_F(K<!@r#LcAUA'1@;omo@sBPGF^ersB6A6+I16Ng
B6%F"BPCstE+*j%H[@@uBl7EsF`V88DK@IZI16Mm$7-g;F(HJ2Bk)1%FEqh:+DGF1@<Q'nCggdh
AISuO8S1G+Ch6%[BleB;HYmJ,Ec6&FE+LYCFEr:]>]k+!E+*6l@:s.uD/!L#Dfg8DAUSuRI16Ng
BkD7*D'1N;BkDU$FCf\>0jJ=)>\RedF^]B'GT\_GAnaC^+=/.EAfu&'AoqU/%144#>]k+!E+*6l
@:s.UF`_4T?$g:'E-686DI\)($=%.YF(HI?+DGF1Cis0.AU#>9EZfU<CghEsGRY!&+C'&1AT2'f
CLLjeHY.26FE;D4@sndn+<Xp'Ap@m/AU"Xk+<VdL>]k+!E+*6l@:s.uG\hJHFE1e@G]dn<@rGmh
I16N++C&Mm%144#>\%DX@<HC.AoDR/An>CmF`M&7HVIpfE+s3&4`k7[/TbQKF=^@#@;KL<9jr-R
BM<>gATD9hF(Kb/$6UH;+ED%4Cgggb+@T:.:K9b)GA2/4+E_R9@rGmh+D#\9D]iP'@<,ddFCfJ8
%144#,p6o6+F.mJ+Dtb%A0>u-BlbD,BOPpi@ru:&+>"^XBOr<*Eb0<'DI[6#De9Fc+<VsQFD,B0
+EM77B5D-%@q]:k@:OCjEZf(6+EV:.+E2@4@;TIiAKYT'Ear[%+E_a:+E(j7G\(]"FCf\J+Dc1/
CghEsA.8kg+=191ATqX&D/E^!A:%QmF`MDKHUUq4:K9c1+<Vd9$6UH;+Ceht+EM+9+E)@8ATAo1
Df0K7E+*6f+D,P0FE8R=Afu2/AU,YDAKYE)@;0Od@VfTb$6UH;+A!\r@<?0oEZf14CLnVeDfp)1
AKX?YA7Zl[Ec3(AAS!n3$6UH;+D>k=E&oX*@VfsqF"Um3Ddm91@rH3;FEqh7Ci<s,@;on*0/>49
1+t=A06;&SEarZ4@rGmh/T>`K/nf?DC^g^o+=196ATVd-DJs-*DKL4pEb/fVDf0KA%144#-!YM&
FDYr6De<p*FF-r)F`Lu'+@C'XAKXfiDg`'%>\7[Z$4R=g+Auc]AS,XoAKYet@V'A"Bk2=!+D,P4
+Dbb5FE9MdDffZ(Ed)5=ALnsGBOr;tDKTf-Eaa'$+E1b!CLLje+EqO9C`m4rF`V+'$7-g3@<--p
EcW@FD]iV9FCf?#+C\o-Df0).FD,5.Ch74#+DkP-B5)69%16?W@;BF_FDPN1FCfJt6$,G)B5)6O
De!p,ASuU:,n12(+C&quDIn$%Df'?"DIe*!5\t.UFD6.4$6UH6+F@@7ATVa"DJ+')HX(Aq@V'A"
Bk2=!I=!e^D1-gA$@Q/r@;BF_FDl87ATA4e>]k+!E+*6l@:s.uASuX-ATD4$AUP!p%14C(FD5B$
FDPZ4F<G(3D/E^!A0>K&EZf14F*&OGE+*6jDJ'Cc>]=_%G%kJu@rH4$@;]V&>]a[mBQS')F*)hW
,n12(+C&u!FDPN+B67g6>\S:kD0'9-I=!YeFF@D8ATVa"DJ+')HX(MuEcZ#1E.*'eE--MV%13OO
,p6Z>Bl%<&A8bt#D.RU,+DG_(AU"Xk>]k+!E+*6l@:s.uD..3kBk2I:%13OO,p6]9Ci=?8%16?_
F(K<!@r#LcAU@p*Ci=?B%16?NAS,XoARfXpDfU2GBOPF_@rH1%Ed`:47m_WN1,LsA1,LsA1,Lt=
%14C(C*7#)DKKo;C`me@Eckl6F`M&7+:SZ_A7]@eDIm<rCi=?@CLqd8@rH1%Ed`:TB4?:90J5(9
/2/\33@lj:2)BXi$7-g0+D#e:Ch[BnF<G"4B6A'&DKKqBGT_8SD'3^=FWbi:$=%+QAnc-o@rH1%
EdM>*FCAZtCi=?BHZEb.I=!Y#0f(@7/i#F<0J54=I16N0+DN$:F_tT!EcW?T+CT)&+EVmJATJu8
AS!!!/pM5L%16?NAS,XoARfXpDfU28ARfmnDes?4I=$!I@XWSW/het10J5%5/2/\90msK<>\%DX
Bl7KlDes?4HX^E)ASu!rCi=?BHZEb.I=!Y#0JG%3/het10J5=>I16NgA7]@eDIm<rCi=?@Ao)Bo
FCT6*DfU8QEbAj0HS@'+0J"n10JG%3/iYS6%14C(C*7>2@ps0r@<6L(B5VQtDKKq/$=%+QAnc-o
@rH1%EdM;0@<,jrCi=?BHZEb.I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@F*)G:DJ*Ht
Ci=?BHZEb.I=!Y#1GLF7/iGC70J5%7I16NgA7]@eDIm<rCi=?@@rH4$ASuU"Des?4I=$!I@XWSW
/i>O<0J5.=/2/\10msK<,p7/IBl.R+Bm+&1@:XOmEaj)4@;]Tu@rH7"F`(]2Bl@m1%14CdA7]@e
DIm<rCi=?@DffZ(Eas$(DfU8QEbAj0HS@'02CpO71Gp^;/hf#.+<Vd9$=%+QAnc-o@rH1%EdM_H
BOu3oDes?4I="j^6@F27/2/V12)Tdk$7-g-Ci<ckC`m/-F(o9)D.RU,Et&I]A7]@eDIm<rCi=?@
@;KLqFCT6*DfU8QEbAj0HS@'41b:=50fCR:/ho84%14C(E,oZ0Bln'4AKXSfG%G]'F!+n/A0>c.
F`&=>@;TRs%16?NAS,XoARfXpDfU2:F`(]!Des?4I=$!I@XWSW/het10J5%5/2/\10RY&d+<Vd9
$4R>IF`V,5@:O(]B4ZF%@;]S#G&h&?%16?.AS,XoAQ*8\Ecb>nEai6_Df'?"DId6j@<-EP>[1N\
>^]n)>^Ur/$=#u1Anc-o<b6;\@<?4#7;d9_Ec5i4ASuU:882^MCh[NqFD5W*I=#"+EaiI!Bl/9F
@rH4$@;]UcBOPq&4^;5sHX(uI%14C(6"FLK-S/kJDKKr6H=]6EF)>?%CaU?;DfQt;DfTD3@q]:k
@:OCjEcW@BATAo0Bl7Jk$4R=g+E1b,A8bs#B4YslEaa'$A0>r=DKK<3+Cf>+DfTQ0B-:]&D/E^!
A9/kF+DtV)ATJ:f,p6W:AKYT!G\(D.Bl5&+ASu("@<?'k+Cf>#AKYH)F<G+*Anc-sFD5Z2F!,=.
Gp!P',p6Z.+EM+9+EVNE@;^?5G%#3$A0>u*G]Y'?DfT]'FED57B-:]&D/E^!A.8lNF`V,5@:O(]
B4ZF%Ea`frA:4mo>]++sASu[*Ec5i4ASuU:;eTTMARp49I=$AO$=%I[G@PQ.D..<mHX'3TH$=1I
A5mJ_I9SF3HX(Z(G][G6Ci=?@CLqd8@rH1%Ed`:>FCf]=@V0t6,;FUpI=2P3,p7DMEbf_=@V'Y'
ATAo;Bln#2;f?f!@q?cMDe*E%:i^I`$7/qpATqX&D/E^!A:%QSAU/K<Eb&-fCOKDA?$fguAU&<,
Des?4HY[2<G@PQ-DfU8QHQt7nI=2P3>]++s@rH4$@;]V&>XW"B@8qMkAQ3S`I9SF3HX(Z(G][G6
Ci=?@A79Rg@rH1%Ed`:],;FUpI16N0>]++s@rH4$@;]V&>XW.5<affDDejc*0jT-2FCf]=@rH1%
EdM>.@s2@#Ci=?BH[?tlI=6MQ$=%I[G@PQ.D..<mHX&sM@od#S<,ZQ#>;9E1HQt7nI38t+>]++s
@rH4$@;]V&>XDk?APQ3CCOKDA?$fguAU&<,Des?4HX^E)ASu!rCi=?BH[?tlI=6MQ$=%I[G@PQ.
D..<mHX'$VDdd`eDejc*0jT-2FCf]=@rH1%EdMD7Ddd`tDes?4I=$;c0n"Iu%16?XATqX&D/E^!
A:%QKBOPp\Dejc*0jT-2FCf]=@rH1%EdM;0@<,jrCi=?BHX(Z(G][D,H[?tlI=6Nl%16?XATqX&
D/E^!A:%Q[FE2)5B2iebI9SF3HX(Z(G][G6Ci=?@F*)G:DJ*HtCi=?BH[?tlI=6MQ$=%I[G@PQ.
D..<mHX&pVD/Ej%FB!0oI9SF3HX(Z(G][G6Ci=?@@rH4$ASuU"Des?4I=#4@AU&<2FF/?Z0n"Iu
I16NgDIn$%Df'?"DIe*!:NU8]E`?smI9SF3HX(Z(G][G6Ci=?@DffZ(Eas$(DfU8QHQt7nI=34I
$=%I[G@PQ.D..<mHX&jQATDllDejc*0jT-2FCf]=@rH1%EdM52ATDm&Des?4I=#4@AU&<+Ap\kL
0n"IuI16N0>]++s@rH4$@;]V&>XijR@ruF'DH(OiI9SF3HX(Z(G][G6Ci=?@Ap&!$@rH1%Ed`:]
,;FUpI16NgDIn$%Df'?"DIe*!7WiTYFD5Z2<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!;IsKT
Df/9XEbf6,<,ZQ#>;9E1HQt7nI16NgDIn$%Df'?"DIe*!7<3EeE`?smI9SF3HX(Z(G][D,H[?tl
I=6MQ$=%I[G@PQ.D..<mHX'<aEc#6$<,ZQ#>;9E1HQt7nI16Mm$7-fe:IH=DEbT*&FCeu*@<Hg/
Ch[<uGp$U8D/E^!A9/l*DfQt>Df^"CE,ol,ATMp,DJ()2@;]Uo@j#DqDImisFCeu*CghEsGRY!b
DIn$'DK]`7Df0E'DKL4t:II]nDfp"iART+\Ed`:_H[Q>1>]++sASu[*Ec5i4ASuU:8l%iODf^"s
Ec5H!F)u8?I=$BhI16Mm$=%^pAT2'fCLLjeHY-](@sM`uEd\B(>]=+aATMs=Ch7s*@;]S#I16Mm
$7-g*@<?''ART(^+E1b%AISuOEb96.FF.8(D/a08>]amp@<m9L%13OO>\RepATVL.%144#>]k+!
E+*6l@:s.UF(KH4@:s.mBmO>RAmoLsALnrM+E1b%AKZ&.H=\40AS,XoARlomGp%?CFCf\+$6UH6
+<VdL+<VdL+<VeLDJ<U!A7[o9@;L!r/0H&X+<VsQF`(o'De*E%@WH$gCNCVBBOu'(F`V,)+EqOA
BHVP2FCf\+$6UH6+<VdL+<VdL+<VeOATVL.?$g71E+O'1AS-?"$=%.YF(Gdf+<Xp3F(K<!@r#Lc
AQs:pBk)'lANb-UF_+j*BR+Q.EcP`'I16NgAn_\]%16?RH#R>8F(KH9E-l&7ART@jBl7^-4`k^e
ALn8t+<VdL+<VdL+<VdL@W-1#D..I#F$4VcF_**5$6UH6+<VdL+<VdL+E1k'@<H[*DfS!fI4Pg7
+<VdL+<VdL+<VdLE+ER&Bln0&4aVT.%144#+<VdL+<VdL+<Y04Ci=?1Bl7^-4`k^eALn8t+<VdL
+<VdL+<VdLF`M;.Des?44^r5MALn8t+<VdL+<VdL+<VdLCh[d&@rH1%E]n8JB4Yt&@4Vip+<VdL
+<VdL+<VdLE+EQiDfTB"E]nb'+>=olI=2P3>]XIuCh7KsFD-#+E+*d$DId<rFFAKiE--L;$=%X`
FDPN+B67g6>]=+lF),K/I=!kkF<GO=F`SZ\E-*4>Bl8'7+>IhWI16NgF(KH0ASu.&BR<uqD.Ra#
ASu"'F*)G6FCT!4HS]5MI39XY+E2@4G%GQ5+E)F7Eb9H1C`mP.DImku$=%X`FCT63DKKH1HZNb.
DKTf,AT2a)I=!Yr%13OO,p75>F(KG9CghEsGT^^<A7^!.FDi:EF(HJ9BQ@Zq+Cf>+F_u#;+>"^H
AS,@nCige6F!,RKD[d%"+EqL5@q[!*ATN!1FE8R=DBNb6FE8RCAfu;+F*(u(+E1b%AKZ&5@:Njk
Bl5&0@;]Us@ps=f%14C(:/=hX3ZqjAC3=T>+DGF1Bl7HmGT^m4D.Rc2Ecl7BFDkf'FD,6++:SZ(
+D,Y4D)reQFEDI_0/%NnG:m]?FCf\K@rH4$F`(o8GqO#UB.nFBATr67E+rf7E+j2TAj%stF?M?;
1GoUK>]k+!E+*6l@:s.uD09Z:Bk)'tI16NgD..3k@<?<sFED)7%16?\ASu('ASu[*Ec5i4ASuU:
FD,6"DId='I16N++F@@-AjCH^De!^%F_u"*$6UH6+<Ve35]UFWFDl&.@rH0q@;L!r%144#+C&Jo
F(Gdf+<VdL+<XoSEb0<6Df0,rDesN9F_)!h+<Ve3An_\]+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.
Ecl20I=!YeFF=T*+<Ve3F(KH0ASu.&BR<uoDesQ5DKBB.I=!b-E--L;$6UH6,p6]2@;]^h+>Y-^
D]iS%F(oZ+A0>c4D.7's+E(j7Bl7HmGT^L7CisT4Et&I!+<XouAS5^pHYmnAFD56'Cib#O1OWJ4
F(Jj'Bl@l=HX(9&A7^"'@;TS(>n%,`+<Xp+@<--mDffZ>>YSXBAQ<\gATD9hF(JTjDId='DIIBn
I3f=0+<VdL+<VdL+<VdLHX'9RCLpLbE+O'"@<6!bBl7HmG]$r,AUPj6$6UH6>]aXnF)YQ#ATMs=
Ch7s4Cgh$qI16N++<Xp1ATVa"DJ+')HX(MuEbTE%ASuU<HSBD\I16N++<Xp1ATVa"DJ+')HX(Mu
EcZ#1E.*'eE-*4ACiseA0J5/#FF=T*+<Ve3Eb0&qGRY!&+<Xp*ATV0kFCf;o5\XbRBlmp'I3f=0
+<Z#9ASu%*D09Z:Bk)'tF+%;-AjCBJF*)><ARfXp>]4Lk@rH1+D/NTiCia/m@r,^bEc>H"AR&h]
I16NgD..3k@<?F0BOu2n$4R>ID..3kBl7HmGRXuh$7QDk:-pQs5(7s0IVNe3Ch\!&Eaa'$<,uo"
@VfUM@;BFpEt&Hc$;No?+BLj,:.\2N3Zr6WDJ().Bl7K)@WH$gCM@[!+@f=*<DXf/76s=1;BTdi
DIml3A8`T.Dfd+GEa`o0E,ol9ATDU4+UncR67sBP+CT+0@q\YVF(oN)+Du+>+EVNE,%bP6+s:u@
BlbD+ARf.kF(HJ-ART+\EcW@?@<iu5AS#BpG%G]>+Dbt6B-;#)DIml3F)Po,FD5T'F"Rn/%15is
/g*_t+F.mJEZf%,@:Wqi+D>2)+Eqj7E,]5pCh4`*Bl7L'+EV:2F!+n%C3=T>+EV:.D'3;!AoD^$
+E_a>DJ(),De*ZuFCfK$FCcU)$4R=O$;No?+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-
+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9
@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0
C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*H!tN*+EqaE
CER&'A0>c.F<GO=@<iu4@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3k
F!,3?@3B*'Cht5'Dg<I6Cht5<DfTV9@;]TuDJsV>E,8s.+DkP&ATJu/+CQC'F_kk:@W-N7@;Ka&
GAhM;+CT.u+Du+>+E2.*Gp$s4CLqQ0C*6q-A9D^)+C]87+CT)&+EqaECER&'A0>c.F<GO=@<iu4
@;BFq+DN$-+CoV2C`m2*Gp$O3C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg>c-
C`mq?Ebce+DIal-Dfd+@CghT3D..3kF!,3?@3B*'Cht5'Dg;d!%15is/g+jNA8`T7BOQ!*8K_P^
+C\nl@<HX&+DDs,D'4%9@<<W++CT+0+DDs/D]j7;@<<V`+CoC5@V'%XF`V+:Bcpi$+EqL-F<G9?
@;R,0Bcpr)+EqL-F<F-tA8`T"ARf.kF(HJ.+CT+0GA(E,+DDs,D'0s8+CoC5GA(E,+A!\dD]iM#
@psM$AKY\0@;R-2BOQ!*Bcpi$+:SYe$>aWuB6/0;AnF1e+?V_<0d%hdBlkJ2@<3Q$Df'&.FDi:=
Gp$O;FCf?3Bl@l3FD,*)+Dbt6B-:i-Dfp"ABOtU_ATAo0Bl7L'+CoC5DJsV>GB.,2+>"^XBPDN1
BlbDBDfp(CE,ol+Ch7I%+>"^RDfd+:De*ZuFCfK$FCcgIF!*%W,'%7,F^o3/ATAt;/KcHUF=/GW
+CQC:DfTA28K_bjF*&O7Eb/[$ARlotF=A=a+F.mJEZee"DfTN&DKI"2De*E,C2[X"@;BFL67sB1
C2[X"@;BEs@kB8TF(96)E-*4>@;BRpB-8ND@rGmh+DkP)BlJ32@<?4%DE8nOG][M7F(oQ1+E(j7
-u*[2.4u&::-pQB$;No?+B3#gF!,OH@Uj4_F)rI7AS,XoATJu:FD5Q*FD5<-+D,P4+DkP&Bl7Q+
F(96)E--.DAo_g,+:SZQ67sBnEc6)>F!+n/A0>r9Blmp-/g)9.F<G".F)N12Df0Z*Bl7u7@rGmh
+D,P4+CT.rCjC>@DJ(($$;No?+DtV)AKZ#)An?!oDI[7!+DG^98g&=rEb'5D+:SZQ67r]S:-pQU
8T&W]Eb8`iAKYl/F`)7C-6RJCEaj)N%15is/g)8ZB4Z0nCi"37+<VdL+<Y<.FE8R5Cht59Bl.F&
FCB$*Et&IO67sB'+DkP&ARoq#E$-8G+<Ve;F_u)=+E(_(ARfh'+E)-?E+*j%+EVNEE-67FA9Da.
+Co2,ARfh#Ed8*$:-pQU+<YN0CLq."+<VdL+<VdLD..3k+D5_5F`8I3DIal2F_Pr/+EM%5BlJ08
%15is/g)8ZDIIBn@psJ#+<VdL+<Y01@<6L(Anbgt+DtV)ATJu.DBMOo@rGmh%15is/g)8ZE-682
Ci"37+<VdL+<YWGFE8R5Cht59Bl.F&FCB$*F!*%WF(Jo*-td+5@;Kb%F"%P*:-pQU+<YlMFCf]=
+<VdL+<VdLGAhM4+CT.u+EV19F<G[:G]XB%:-pQU+<YlKA7o^s@UX(o+<VdLAU&<;@:OD#+D5M/
@UX'qDIIBnF!,(8Df$Uh+Cf>#AISuA67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0@:s.m
+=LuCA8PajAKZ#%DJ*N'0f:X:0f_6C%13OO@rGjn@<6K4-Xgb.A8PajAL@oo@rH(!F(KB6+<W%?
C2[W1%13OO:-pQ_A7]^kDId<rFE8RL/M/)`@VTIaFE8RKBln#2A7]@eDJ=3,Df-\.AT23uA7]Xg
Bk;>p$4R>;67sC&@:sX(8l%htA9Da.+EM%5BlJ/:Eb/^&Bl%<&@rH4$@;]Us%15L'9i+eT7m/m\
+AP6UHR_W`6n3U4%13OO:-pQUCgh?sAKZ)+G]Y'PEa`o0FCf<.DfT9,Gp%!CF`&=>@;TQu@;]Tu
Ch[cu+EqO1FD)*j=&M=\<)$1j8OP^&-[L(d4#T#,$4R>;67sBlG]7\7F)u&6DBO%7@<<W%Ch7$q
F!,O6Eaa'"BHV5&C1Ums%16$06VKp7;E[&g+tdqT@r,^bE[ND+<D?:h5t;@k%15is/g+_ME,oN2
F(oQ1+EV:*F<GU8@WcC$A9/l+Ec6)>F!+n/A0>r9Blmp-+D,Y4D'3n0@<?!m+E(_(ARfg)A79Rg
%16$07oE/H3[Z%_Ec<?h+<iE\+tauc-RUGn5'nn`;F+,Y9i+n_6n'Z7?RI3P;bp(_6U=C7/12fP
-RU$@+Cf>"F`MM6DKI!K-XpM*ALAiQ/4<K4:fK_N%13OO:-pQUAU&07ATMp,Df-\>BOQ!*F*)>@
ATJu<DfTB0+DG^9FD,5.F(96!FCSu,DdmHm@rri-DBMPI6k'K%:Jb%j4ZXs3DfBi@+<iEc-Z3a-
-RUHD:J=PO5tj]u-RW7DBeD4i-QlV9@rGk"EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBl
G]7\7F)u&6DBO%7@<<W5FDl22F!)lK@;TR,FCf]=.3N_@@VfUs+DG^9F(96!FCSu,DdmHm@rr.e
;bp4i<)c:g<'<8i+E2IF+<iE\+tb5j-S-Z0HS/At5u:NT:fg4V.4ciR-RUHD:J=PO5tj]u-RW7K
-QlV9@rGk"EcP`/F<DqY@UX=h-RU8m6rcrX<'a"`$4R>;67sBlG]7\7F)u&6DBO%7@<<W5GA2//
BOu6-FDi:>F_tT!Eb/c(F(96!FCSu,Ci<flCh4%_;bp=n8Q8&J4ZXs#De!p1Eb0-1+B)'C?V4*^
DdmH//4<K4:fK_N%13OO:-pQ_ASu$hAT23uA7]Y#Et&Hc$>OKiFDl)6F&#%S.V`m4FDl)6F!+sE
/KeS8EbT].A0>u4DesJ;@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2F`_>6.4u&::-pQB$;No?+A$Hm
ATDBk@q?d,DfTB03XlEk67sB'@:Wn]Ec<-D+CSek+EqaEA90DGATMs7+EVNEB6%p5E%c9TBlmo/
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'@;Kat@;TRs+Cf>,
@VK^kF!,@/D.Rc2Ao_g,+=M8AAo;$oATK:C@;]Tu-uWR4@;TRs.3K`U+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+:SZQ67sB'@;Kb#AS-!++CT)&+DtV)ATJu7AS,LoASu!hA0>?,+E(_(ARfh'+E)-?
DIIBn+Dbb5F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'A7]RiEc<-D+ED%1Dg#\7
GAhM4F"_WHF*)IGAo_g,+D5_5F`;CTF*22=ATJt:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+:SZQ67sB'B4Z1*GT\+O+D58-+ED%5F_Pl-A0>u4+D#e/@s)m)+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'BP_X*C`jiC+Co2-E,8s.F!,O;
DfTqBA7]glEbTK7Bl@m1+E(j7DdmHm@ruc7Df-[GGpsjY+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
%15is/g)9ODe*9hAKW*<A79b)+EM77@q?d!@<6N5@q]:gB4W2oDIal"Eb/[$Bl@l3De:+a:IH=D
@VTIaFE7lu:-pQU+DPh*BOu"!+<Y3/F)Yr(Gp#pO7Nb<!6m-/SCiCL>+<VdL+<VdL+<VdL+<VdL
+<Vd9$;No?+<YK5+<VdL+<VeD@;BEs@;]TuCi<`m+A,Et+D5_5F`8HG+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<YN;F!)SJ+<VeD@;BEsCi<`m+EM%5
BlJ/:+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#:-pQU+Du+/G]4cJ+<Y]9FEMVA
F!+m6Ch[s4+E(j7DdmHm@ruc7GA2/4+Du*?AU&01@;]LqBl@m1+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<V+#:-pQU+Du+>B6%r6+<YlHEb'56DfQtBATMs7+D,Y4D'16P.3N_G@<<W#Eb-A2Dfd+9
DBNS4Dfp#?+E)9CF*22=ATJt:+<VdL+<VdL+<VdL+:SZQ67sB'DKI!D+<VdL+D58-F!,@/D.Ohu
DIal3AU&;>Ao_g,+D#(tF<GdADId[0F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+:SZQ67sB'DKd3G+<VdL+D#(tF<G!7DIn#7AU&01Bk(k!+EqaEA0?#9Bl7Q+8l%ht@rH7.ASuU(
Df0V=+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'DdmTmD.Rc2+E_R9EHPh8F)Q)@ARlp%
@VTIaF<G"0A0>],@ps1b+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+:SZQ
67sB'E,m'D+<VdL+E2IF+CT.u+CfG1F)rIEAS,LoASu!h+CQC:DfTA2/Kf4JEd8d@@;]V$+CT=6
@;[3!A8-.(EZdbG6WHiL:/jSV9hdoK6k'Ju67sB'Eb/j#@;TRs+E_R9EHPh8F)Q)@ARlp(AS,Lo
ASu!h+DtV)ATJu+Ec5e;.!9TBF"&5PATN!1F<D\K+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'
Eb0E4DIn&8+ED%8F`MA@+CQC/BleA=De:,2F`\a:Bk)7!Df0!(Gp%$7C1UmsF!,[@FD)e7D]iV9
E,8s#@<?4%DK?pC+<VdL+<VdL+:SZQ67sB'F*D2?+<VdL+EM+9+EM47Ec`FJDfTA2AU&01@;0Uf
FD5Z2+D,Y4D'16;Ddt4=BOtU_ATAn9+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'F`V,)
@X0(=+ED%8F`MA@+CQC/BleA=De:,9DfTB0+D,Y4D'16P.3N_G@<<V[8Q%uE<(pF;@ps1i+EqaE
A9/l3DBL?P.3K`U+<Vd9$;No?%15is/g*o-FCfMS%15is/g)8Z7<3EeEZf41F)tc&ATJtBC2[X)
Df9H5+ECn.B4W2>0JkI;/MJk50JG10%13OO-oiG31bgF%0H_K567sBkBldcmEb$;:BPDR"F)YPt
AIStU$=e!aCghC++=CT4De*s.DesJB%16T`Bl8!'Ec`EH-Xgb.A9E!.CaTZ!%16igA9E!.Ced;L
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
Des?)Gp%3?F*)I4$;No?+<VeADe*NmCiCL>@WHC2F(HIj6q/;4ASc;p$;No?%15is/g*o-FCfMS
%15is/g)8ZATDg0EZc\ODegJ4ATMp$B4Z-,-u*[2F`_>6+ECn.B4W2>0JYL>/MJk73B8Mt$4R>P
De!TlF)rHO@;9^kF`_>6-OgDmDeX*1ATDl8-Xgb.A1%fn%15is/h1CCE+NotASuU2+Cm&U+Co&&
ASu$iDKI"FDfTB0+:SYe$;No?+CoD#F_t]-FCB9*Df-\7@<--+AoD]4@<6L4D.Rbt$:.Th<D>n\
9gMZM4ZXs!F)uJ@ATKm[%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt/F`_;8EX`@A<E)Lb
;GBGT90G<`@<H[*DfRld%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQt1Eb/[$ARl5W6W-?=
<(02L5uL?=3[\EXART[lA3)(I$4R>;67sBkDe!p,ASuTuFD5Z2+DkP-CER5-EZen<@:UKoF`(i#
EbSs"+CT.u+D#e+D/a<&Et&IE=[>GM5uL?=3[\H`@:VDH%13OO:-pQUA8bt#D.RU,@<?4%DBNe)
Ebce0DfQt;Df/uo+D>n8B45gp@;[2rDIal$G[YH.Ch7Ys$;F;k5t"F5;G0/6-Z*d>@:VDH%13OO
:-pQUA8bt#D.RU,@<?4%DBNe)Ebce0DfQtDATD6gFD5S$$<BSn6:"RB9hdoO90G<`G%G]'@<?4#
3[Y@D%15is/g+\C@s)X"DKK</Bl@l3D..I#+D,P4+EDC=F<GdGEb'5#$;sYq<*)jn6rQfG;G0/6
-ZX-DFE_YDA90dZ%13OO:-pQUA8bt#D.RU,@<?4%DBNe)Ebf_=/KeS8E+NotF!,C=+E)@8ATAo1
@<-.)%15L!6WHiL:/jqR;G0qO3Zp^e;cQO\;b]PU905F><(Ke_9gMZM4$un75u^9@9gMZM4%*4;
6qosF905jD:-h9B5uL?;<^fnQ5u^EM9gMZM4&SjM<*)jn6rQfG;G.H+%15is/g+YBD/E^!A0>]&
DIjr1F`2A5F!+7W+Co&&ASu$iDKIo^C2[W*+Xefh4Y@jf@Vg%,DffP5%17)s4ZX]k?t<__EHQ2A
AO%k>7TW/V%13OO:-pQ_ASu$hAT23uA7]Y#Et&H                                   ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1GBq/+>P&q+>Pes0eje/2'=Y2+>ttt3$:%6+?(E#1MUi=D..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F)#W(Ch\!&Eaa'$B4YslEaa'$F!,:5FCfK$FCcS9Dfp)1AKYK$A7ZloDe!p,ASuU2+Co2,ARfgu
Gp$^>Df$Uh:IH=<Ec6)>F)#W(Ch\!&Eaa'$<,uo"@VfUM@;BFpF($2$Des6$@ruF'DBNk0+EqaE
A9/l8BOQ!*,%kJ)ATD4$AKY].F*2&8+s:K9EZccFDe*ZuFCfK$FCcn9De*s.DesK*ATDL.ARlp*
Df9H5+Cf4rF)sAbAU&<.DKBN1DBNk0+=LuCA9E!.Caj+;A9E!.CgeGrDes6$@ruF'DBNk0+A,Et
+E_d?Ch\!:+EqaEA90dSAU&<.DKBN1DBNk0+=LuCA17                               ~>
)
showpass 2 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ea_)+>P&q+>G]50PYN:?tsUj?m'0)+EV:.+EDC=F<G(0@<6K4De:,6BOr;Y:IH=HH#n(=D(Zqs
Cht54FD,6++A,Et%16T]@<6L$F!+n3AKYAjDeX*1ATDm#ARlotDBN>%De*6.+<Xa!ASrW,Ddd0f
A0>8pDe*5uBla^jE,8rmARlotDBO%7AKYAhC2[Wj+Dbt+@;KL-+:SYe$=%Xp@WQ*jFD5Z2HV.(%
+@BsRF)rHqDKKH1Amo1\I16Mm$@[GQINWt[/nuMW%16NQFs%nM+AP6U+CT)&+C\bhCNXS=G%G]8
Bl@l3DIIBnF!)S7$=[XZF<D\K:-pQUB4Z0-DdmHm@ruc7Ao_g,+E2IF+Co1rFD5Z2@<-W9@UWb^
F`;CE+:SZeDJUF<+<XEG/g+tEF*&OC@VTIaFE8R=DBNn@F<G+.@ruF'DIIR2+Cno&@:EYdAKYGj
@r$4++D,>(ATJt:%16WWC`jiC+AP6U+Co&"ATVL)+E(_(ARfh'+DG^9A8,OqBl@ltEd8d<@<>pe
@<6!&Anc'mF!)SJ+<VdL+<Vd9$=mj]+<VdL:-pQUA8,OqBl@ltEd8dAA7]Y#BkD'h@<?4%DBNA*
A0>r8@<?4)FD56++<VdL+<VdL+<VdL+<V+#A8Z3++<Ve%67sBsBleA=DdmHm@ruc7Bl5&(Bk)7!
Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<VdL+:SZgE-#T4+<XEG/g,4HF<G+.@ruF'DIIR2
+E1b0@;TRtATDi7+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%16`YAT2]5+AP6U+D5_5F`8I3
DIal2F_Pr/+Co&&ASu$iDKKqB+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$>3pl+<VdL:-pQU
Eb0?5Bk;I!F!,C1C1UmsF!,(8Df$V-Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<V+#B5DKq
F!)T#67sBhDII@,H=\WMEb03.Ec`F4DIal2FDl22+D5M/@UX'qDIIBnF!)SJ+<VdL+<VdL+<VdL
+:SZjEc<-D+<XEG/g+YEART[l+CT.u+Dl%-BkDW5B6%p5E-!-E+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL%16r\CLnV2+AP6U+DkP&ATJtd+EM%5BlJ08+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+<Vd9$>sF!A0<!;:-pQU@rc-hFCfM9@3BH!G9CF1@ruF'DIIR2+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<V+#De't5+<Ve%67sC!E+Np.+CT.u+Cf5+F(KD8A8,OqBl@lt
EbT*++<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+:SZs@:O(`+<XEG/g+V3@r$-.F`8I3DIal1ARfY%
ATDi7G@>Q7ARlp)E+*6f+DG^9A8,OqBl@ltEd8d>Bl%@%%17&sF<D\K+AP6U+EMXCEb0;7DdmHm
@ruc7Bl5&(Bk)7!Df0!(Gp$X+FCAWeF(HJ+Bl%@%+<VdL+<VdL+<Vd9$?B]jA0<!;:-pQUEb/lt
F*(u6+CT.u+E_RBAS5^uFCfJ88l%htA8,OqBl@ltEbT*++<VdL+<VdL+<VdL+<V+#Eb0<6A0<!i
67sC$ATMs3Eb0;7FD,5.D/XK;+ED%'ASuT4@UWb^F`8I5Eb/[$ARlomGp"MS@:O(`.3K',Ed2XJ
+<Ve%67sC$AS6.%@<*K%G]7\7F)u&6DBO"3@<,jk+<VdL%176!ATJt:+AP6U+ED%8F`MA@+EqaE
A0>o(An?!oDI[7!+<VdL+:S[,IXZ_T$4R=O$6Tcb%13OO%13OO%13OO%13OO%13OO%13OO%13OO
%13OO%13                                                                  ~>
)
showpass 2 9 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:''
zz=:zz,'(<<;._1 '' jodbasictests bnlBasic01 delBasic001 dpsetBasic01 globsBa'
zz=:zz,'sic001 globsBasicDDef00 mnlBasic00 putNameTimestampsBasic00 restdBa'
zz=:zz,'sic01''),<<;._1 '' jodsmoketests abvSmoke00 bgetSmoke00 bnlSmoke00 bn'
zz=:zz,'lSmoke01 compjSmoke00 compjSmoke01 didSmoke00 dispSmokeUnicode00 dn'
zz=:zz,'lSmoke00 dnlSmokeMacroTexts edSmoke00 globsSmokeAssign000 globsSmok'
zz=:zz,'eDD00 globsSmokeDoc00 grpSmoke00 jodageSmokeDays00 mnlSmokeArgs00 n'
zz=:zz,'ewdSmokeBadArguments00 odSmokeArgFail00 rxsBadSmoke00 rxsSmoke00 rx'
zz=:zz,'sgetSmoke00''                                                       '
zz=:481{.zz
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
