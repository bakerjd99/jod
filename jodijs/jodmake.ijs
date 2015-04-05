NB. jodmake.ijs -- script making & code manipulation: extension of (JOD)
NB.
NB. This subclass defines utilities for making scripts from 
NB. groups and suites.  It also contains code for analyzing 
NB. name references in J words. 
NB.
NB. Interface nouns & verbs:
NB.   wrdglobals    extracts global names from J code
NB.   namecats      classifies names in J code
NB.   makedump      dumps objects on path to put dump directory
NB.   makegs        make group and suite scripts
NB.   wttext        word and test text
NB.
NB. Notes:
NB.   Error messages (jodmake range 150-199)

coclass 'ajodmake'
coinsert  'ajod'

NB.*dependents x-- objects with definition dependencies

NB. tags JOD dump script rebuild commands
DUMPTAG=:' NB.{*JOD*}'

NB. large text wrap temporary noun name and line width
WRAPTMPWID=:'zz';67

NB. expression that clears scratch object
SOCLEAR=:'".soclear',DUMPTAG

NB. expression that rebuilds groups and suites from scatch object data
SOGRP=:' grp&> ". ". ''',(>{.WRAPTMPWID),'_'',SOLOCALE,''_'' [ cocurrent ''base''',DUMPTAG

NB. expression that stores words in the scratch object in JOD
SOPUT=:'soput ".''nl_'',SOLOCALE,''_ i.4'' [ cocurrent ''base''',DUMPTAG

NB. expression that stores (name,text) tables in scratch object
SOPUTTEXT=:' put ". ".''',(>{.WRAPTMPWID),'_'',SOLOCALE,''_'' [ cocurrent ''base''',DUMPTAG

NB. expression that switches to numbered scratch locale
SOSWITCH=:'cocurrent SO__JODobj',DUMPTAG

NB.*enddependents
NB.*end-header

DUMPMSG0=:'NB. JOD dictionary dump: '
DUMPMSG1=:'Names & DidNums on current path'

NB. should appear as quoted text when displayed
DUMPMSG2=:'''NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''''''' '''

NB. version prefix text for JOD dumps
DUMPMSG3=:'NB. Generated with JOD version'


ERR0150=:'confused declarations ->'
ERR0151=:'word syntax'
ERR0152=:'no definition ->'
ERR0153=:'file write failure'
ERR0154=:'invalid group/suite name'
ERR0155=:'unable to append to dumpfile ->'
ERR0156=:'unable to create dumpfile ->'
ERR0157=:'directory-component name class inconsistency -- dump aborted ->'
ERR0158=:'invalid fully qualified dump file name'
ERR0159=:'mixed assignments ->'

NB. multiplicative factor for small text dumps
EXPLAINFAC=:10

NB. first table of valid single line explicit headers
EXPPFX0=:4 5$'1 : ''2 : ''3 : ''4 : '''

NB. second table of valid single line explicit headers
EXPPFX1=:3 8$'3 : ('':''3 : (,'':4 : (,'':'

NB. report labels for reference case of (globs)
GLOBCATS=:<;._1 ' Global Local (*)=: (*)=. for.'

NB. string marking end of class header
HEADEND=:'NB.*end-header'

NB. explict J argument names
JARGS=:<;._1 ' x y u v m n $:'


OK0150=:'file saved ->'
OK0151=:'object(s) on path dumped ->'

NB. portable box drawing characters
PORTCHARS=:,:'+++++++++|-'

NB. name of monadic identity verb that displays and passes argument
SOPASS=:'showpass '


btclfrcl=:3 : 0

NB.*btclfrcl v-- inverse of clfrbtcl.
NB.
NB. monad:  btcl =. btclfrcl cl

NB. length of prefix
len=. ".(pos=. y i. ' '){. y
y=. (>:pos) }. y

NB. prefix and shape of bt
shp=. 2 {. pfx=. ". len {. y
pfx=. 2 }. pfx
tab=. len }. y

if. #tab do.
  zm=. 0<pfx
  bm=. 0 #~ #tab
  ri=. }:0,+/\zm#pfx
  bm=. 1 ri } bm
  shp $ zm #^:_1 bm <;.1 tab
else.
  shp$<''  NB. all nulls
end.
)


clearso=:3 : 0

NB.*clearso v-- empty scratch object.
NB.
NB. monad:  clearso uuIgnore

if. #s=. nl__SO i.4 do. (4!:55) s ,&.> locsfx SO end.  NB. !(*)=. SO
)


clfrbtcl=:3 : 0

NB.*clfrbtcl v-- btcl to encoded cl.
NB.
NB. This verb  converts a boxed table of character lists to a  cl
NB. representation that can be used  to recreate the boxed table.
NB. It  is used instead of (5!:5) for btcl as (5!:5)  generates a
NB. large  a.   index  representation  for  character  data  when
NB. selected "control" characters are present.
NB.
NB. monad:  cl =. clfrbtcl btcl

NB. shape and lengths of all char lists
sp=. $ y
lc=. , #&> y

NB. first number is length of prefix
pfx=. ":sp,lc
(":$pfx),' ',pfx, ;y
)


createmk=:3 : 0

NB.*createmk v-- initializes maker objects
NB.
NB. monad:  createmk blObrefs
NB.
NB.   createmk__MK JOD;ST;MK;UT;<SO

NB. object references !(*)=. JOD ST MK UT SO
'JOD ST MK UT SO'=: y
)


dec85=:3 : 0

NB.*dec85  v-- decodes ASCII85  (name,text)  and (name,code,text)
NB. tables.
NB.
NB. monad:  cl55=. dec85 cl

tab=. fromascii85 y
tab=. btclfrcl tab

NB. there are two types of tables in JOD (name,text) and (name,code,text)
assert. ({:$tab) e. 2 3

if. 3={:$tab do.
  NB. codes must be integers in JOD name,code,text tables
  codes=. <a:;1 
  val=. ".&.> codes { tab
  tab=. val codes } tab
end.

NB. put commands are expecting (5!:5) strings
5!:5 <'tab'
)


dumpdictdoc=:3 : 0

NB.*dumpdictdoc  v-- appends  dictionary  documentation  text  to
NB. dumpfile.
NB. 
NB. monad:  dumpdictdoc clPathFile
NB.
NB.   dumpdictdoc 'c:\go\ahead\dump\my\dictionary.ijs'

NB. cannot fetch document or document is empty
if. badrc uv=. DICTIONARY get '' do. (jderr ERR0155),<y return. end.
if. 0=#uv=. >1{uv do. OK return. end.

tag=. DUMPTAG,LF
putso=. (2#LF),SOSWITCH,LF

NB. expression to store dictionary documentation text in scratch locale
soputdoc=. SOPASS,(":DICTIONARY),' put >1{,".".''zz_'',SOLOCALE,''_'' [ cocurrent ''base'' ',tag

NB. format document text for dump
dicdoc=. putso,WRAPTMPWID fmtdumptext ,:'';uv
dicdoc=. dicdoc,LF,soputdoc,SOCLEAR,2#LF

NB. append dictionary documentation error msg: unable to append to dumpfile
if. _1 -: (toHOST dicdoc) fap <y do. (jderr ERR0155),<y else. OK end.
)


dumpdoc=:4 : 0

NB.*dumpdoc v-- dumps object documentation text.
NB.
NB. dyad:  (iaBlksize ; iaObject ; clPathfile) dumpdoc blclNames
NB.
NB.   (0;50;'c:\dump\on\me.ijs') dumpdoc ;:'word name list'

NB. block size, object, output file
'blk obj out'=. x

NB. append short and long object documentation - short documents are small
NB. hence we process in blocks (EXPLAINFAC) times larger than the dump block
if. badrc uv=. ((EXPLAINFAC*blk);(obj,EXPLAIN);out) dumptext y do. uv
elseif. badrc uv=. (blk;(obj,DOCUMENT);out) dumptext y do. uv
elseif.do. OK
end.
)


dumpgs=:4 : 0

NB.*dumpgs v-- dump groups and suites on path.
NB.
NB. dyad:  iaBlksizeObject dumpgs clPathFile
NB.
NB.   (50,GROUP) dumpgs 'c:\dump\your\groups.ijs'

'dmp obj'=. x
putso=. LF,SOSWITCH,LF
cmd=. SOPASS,(":obj),SOGRP,LF,SOCLEAR,LF
out=. <y

if. badrc uv=. obj dnl '' do. uv
elseif. a: e. uv          do. OK  NB. no groups or suites
elseif.do.

  uv=. (-dmp) <\ uv=.}.uv
  for_blk. uv do.

    NB. get blblcl of all objects in groups/suites
    gnames=. obj grp&.> >blk

    NB. check all return codes error msg: unable to dump group/suite list(s)
    if. 0 e. {.&> gnames do. jderr ERR0157 return. end.

    NB. remove return codes, attach group/suite names and format as text
    gnames=. (<"0 >blk) ,&.> }.&.> gnames
    gnames=. 5!:5 <'gnames'

    NB. append if any text
    if. #gnames=. WRAPTMPWID wraplinear gnames do.
      gnames=. toHOST putso,gnames,LF,cmd
      if. _1 -: gnames fap out do. (jderr ERR0155),out return. end.
    end.

  end.

  NB. dump group/suite header scripts
  if. badrc msg=. (dmp;obj;y) dumptext ;uv do. msg return. end.

  NB. dump group/suite documentation
  if. badrc msg=. (dmp;obj;y) dumpdoc ;uv do. msg return. end.
end.
OK
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


dumptext=:4 : 0

NB.*dumptext v-- appends text tables to dump file.
NB.
NB. dyad:  (iaBlksize ; ilObjCode ; clPathFile) dumptext blclNames
NB.
NB.  (50;1 8;'c:\temp\dump.ijs') dumptext ;:'test case names'

NB. block size, object & option code, output file
'bsize noc out'=. x
out=.<out
bnames=.(-bsize) <\ y
putso=. LF,SOSWITCH,LF

NB. reload command for object
cmd=. SOPASS,(":noc),SOPUTTEXT,LF,SOCLEAR,LF

NB. dump text in blocks
for_blk. bnames do.
  if. badrc uv=. noc get >blk do. uv return. else. uv=. rv uv end.

  NB. append only when we have text
  if. #uv=. WRAPTMPWID fmtdumptext uv do.
    uv=. toHOST putso,uv,LF,cmd
    NB. error msg: unable to append to dumpfile
    if. _1 -: uv fap out do. (jderr ERR0155),out return. end.
  end.

end.
OK
)


dumptm=:4 : 0

NB.*dumptm v-- dumps test cases and macros on path.
NB.
NB. dyad:  ilBlksizeObject dumptm clPathFile
NB.
NB.   50 1 dumptm 'c:\dump\on\me.ijs'

'blk obj'=. x

if. badrc uv0=. obj dnl '' do. uv0  return. end.
if. a: e. uv0 do. OK return. end. NB. no test cases or macros

if. #uv0=. }.uv0 do.
  if. badrc uv1=. (blk;obj;y) dumptext uv0 do. uv1 return. end.
  if. badrc uv1=. (blk;obj;y) dumpdoc uv0  do. uv1 return. end.
end.
OK
)


dumptrailer=:3 : 0

NB.*dumptrailer v-- appends terminal text to dumpfile.
NB.
NB. monad:  dumptrailer clPathFile
NB.
NB.   dumptrailer 'c:\go\ahead\dump\my\dictionary.ijs'

tag=. DUMPTAG,LF
tail=. LF,'cocurrent ''base''',tag
tail=. tail,'0 0$(4!:55);:''sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_''',tag
tail=. tail,SOPASS,DUMPMSG2,tag

NB. append trailer error msg: unable to append to dumpfile
if. _1 -: (toHOST tail) fap <y do. (jderr ERR0155),<y else. OK end.
)


dumpwords=:4 : 0

NB.*dumpwords v-- dumps path words to an ASCII script file. Nouns
NB. are dumped first in alphabetic order and then remaining words
NB. are dumped in alphabetic order.
NB.
NB. dyad:  iaBlockSize dumpwords clPathFile
NB.
NB.   50 dumpwords 'c:\j405\addons\jod\joddev\dump\joddev.ijs'

NB. dump all nouns
if. badrc nouns=. did 0 do. nouns return.
else.
  if. 2=#nouns do. NB. HARDCODE 2 
    NB. only one dictionary on the path - common case
    if. badrc nouns=. (WORD,1,WORD) dnl '' do. nouns return. else. nouns=. }. nouns end.
  else.
    NB. more than one dictionary on path - requires deeper look to determine
    NB. whether a path order fetched word is a noun or something else
    if. badrc nouns=. 0 _1 0 dnl '' do. nouns return. end.
    if. badrc other=. 0 _1 dnl ''   do. other return. end.
    
    other=. }.other
    nouns=. }.nouns
    other=. other -.&.> nouns
    
    NB. sorted list of nouns that will be retrieved in path order
    nouns=. /:~ ~. ; nouns -.&.> ~.@:;&.> <"1 ,\ other
    
  end.
end.

putclr=. LF,LF,SOPASS,SOPUT,LF,SOCLEAR
putso=. LF,SOSWITCH,LF
noc=. WORD,0
out=. <y
space=. 2           NB. generates one blank line between objects
wnc=. WORD,INCLASS  NB. word name class code

if. (0<#nouns) *. -. a: e. nouns do.
  if. badrc wnc=. (WORD,INCLASS) invfetch__ST nouns do. wnc return.
  else. wnc=.(-x) <\ rv wnc
  end.
  names=. (-x) <\ nouns
  for_blk. names do.

    NB. get block of nouns
    if. badrc uv=. noc getobjects__ST >blk do. uv return. else. uv=. rv uv end.

    NB. check component-directory name class for consistency - classes must
    NB. be consistent to insure that the dump script can properly reload
    if. 1 e. mask=.-.(>blk_index{wnc) = ; 1 {"1 uv do.
      NB. error msg: directory-component name class inconsistency -- dump aborted
      (jderr ERR0157),mask#0{"1 uv return.
    end.

    NB. convert to linear representations
    NB. NIMP not wrapping large binaries
    if. badrc uv=. 0 nounlrep uv do. uv return. else. uv=.rv uv end.
    uv=. space jscript jscriptdefs uv

    NB. insert JOD commands to reload
    uv=. toHOST putso,uv,putclr

    NB. append to file
    if. _1 -: uv fap out do. (jderr ERR0155),out return. end.
  end.
end.

NB. append all remaining words that are stored as text
if. badrc names=. dnl '' do. names return. else. vnc=. (names=. }.names -. a:) -. nouns end.
nouns=.0

if. #vnc do.
  if. badrc wnc=. (WORD,INCLASS) invfetch__ST vnc do. wnc return.
  else. wnc=.(-x) <\ rv wnc
  end.
  vnc=. (-x) <\ vnc
  for_blk. vnc do.
    if. badrc uv=. noc getobjects__ST >blk do. uv return. else. uv=. rv uv end.
    if. 1 e. mask=.-.(>blk_index{wnc) = ; 1 {"1 uv do.
      (jderr ERR0157),mask#0{"1 uv return.
    end.
    uv=. space jscript jscriptdefs uv
    uv=. toHOST putso,uv,putclr
    if. _1 -: uv fap out do. (jderr ERR0155),out return. end.
  end.
end.

NB. dump word documentation
if. -. a: e. names do. (x;WORD;out) dumpdoc names else. OK end.
)


extscopes=:3 : 0

NB.*extscopes  v--  handles  exceptions  to  normal  J assignment
NB. scoping rules. The exceptions are:
NB.
NB. monad:  extscopes blclParsed
NB.
NB.   'quoted locals'=.
NB.   '`acr locals'=.
NB.   'quoted globals'=:
NB.   '`acr globlas'=:
NB.
NB.   for_loopvar. x do.
NB.       $ loopvar        NB. implict for. local references
NB.       loopvar_index
NB.   end.

NB. get any quoted assignments from syntactically correct code
qlocs=. (}.@:}:) &.> u #~ '''' = {.&> u=. y #~ 1|.y = <'=.'
qgbls=. (}.@:}:) &.> u #~ '''' = {.&> u=. y #~ 1|.y = <'=:'
if. #qlocs do. qlocs=. jnfrblcl <;._1 ; ' ' ,&.> qlocs -.&.> '`' end.
if. #qgbls do. qgbls=. jnfrblcl <;._1 ; ' ' ,&.> qgbls -.&.> '`' end.

NB. get any implicit for. locals
flocs=. ''
if. +./ u=. ((4&{.&.> y) e. <'for_') *. '.' = {:&> y do.
  u=. (4&}.@:}:)&.> u # y
  u=. u , u ,&.> <'_index'  NB. possible implicits
  flocs=. , y #~ y e. u
end.

(<qgbls),(<qlocs,flocs),<flocs
)

NB. direct file append with error trap
fap=:1!:3 ::(_1:)


fmtdumptext=:4 : 0

NB.*fmtdumptext  v--  formats  (name,text)  tables  for  dumping.
NB. Result is a J script character list or null.
NB.
NB. dyad:  (clName ; iaWidth) fmtdumptext btNameText
NB.
NB.   ('z';67) fmtdumptext 1 pick 0 8 get }. dnl ''

NB. remove null entries
if. #text=. y #~ 0 < #&> {:"1 y do.
 
  ascii85=. 0 NB. do not use ascii85 default

  NB. if setting exists in class use it
  if. 0=nc<'ASCII85'     do. ascii85=. 1=ASCII85
  elseif.
      NB. if ASCII85 setting exists in put dictionary directory use it
      do=. {: {.DPATH__ST
      0=nc<'ASCII85__do' do. ascii85=. 1=ASCII85__do
  end.

  NB. The (5!:5) representation will produce
  NB. a large a. index representation when any
  NB. unprintable characters are present.  To get
  NB. a compact representation for ASCII85 5!:5 must
  NB. be replaced in this context
  if. ascii85 do. text=. clfrbtcl ":&.> text else. text=. 5!:5 <'text' end.

  (x,<ascii85) wraplinear text
else.
  ''
end.
)


fromascii85=:3 : 0

NB.*fromascii85 v-- decode ASCII85 representation.
NB.
NB. Inverse of (toascii85).
NB.
NB. monad:  cl =. fromascii85 clA85

r=. ,y
r=. a.i.r
r=. (r > 32) # r
r=. (2 * (a.i.'<~') -: 2 {. r) }. r
r=. (-2 * (a.i.'~>') -: _2 {. r) }. r
m=. r = a.i.'z'
r=. r - 33
r=. 0 (I.m) } r
r=. (1+4*m) # r
b=. 5 | #r
r=. r,84 #~ b{ 0 4 3 2 1
r=. a.{~ ,(4#256) #: 85 #. _5 [\ r
r }.~ - b { 0 0 3 2 1
)

NB. 0's every other 1 in even groups of 1's
halfbits=:] *. 1 0"_ $~ #

NB. clips head and tail delimited lists - see long documentation
htclip=:[ (] }.~ [: >: ] i. [) ] }.~ [: - [: >: [ i.~ [: |. ]


jnb=:3 : 0
NB.*jnb v-- blanks out J code leaving only comments
y jnb~ masknb y
:
(x * >: i. $ x){' ',,y
)

NB. definition table to script text
jscript=:[: ; (([: <"0 [) #&.> (10{a.)"_) ,&.> ]

NB. name, class, definition table to assigned name table
jscriptdefs=:(([: {."1 ]) ,&.> (<'=:')"_) ,&.> [: {:"1 ]


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

NB. standardize path character
dumpfile=. jpathsep dumpfile

if.     badrc uv=. dumpheader dumpfile        do. uv
elseif. badrc uv=. df dumpwords dumpfile      do. uv
elseif. badrc uv=. (df,TEST) dumptm dumpfile  do. uv
elseif. badrc uv=. (df,MACRO) dumptm dumpfile do. uv
elseif. badrc uv=. (df,GROUP) dumpgs dumpfile do. uv
elseif. badrc uv=. (df,SUITE) dumpgs dumpfile do. uv
elseif. badrc uv=. dumpdictdoc dumpfile       do. uv
elseif. badrc uv=. dumptrailer dumpfile       do. uv
elseif.do.
  (ok OK0151),<dumpfile
end.
)


makegs=:4 : 0

NB.*makegs  v--  make  group   and  suite  scripts.  Objects  are
NB. assembled by name class and within class alphabetically.
NB.
NB. dyad:  iaObject makegs clName
NB.
NB.   2 makegs 'group'

'obj wf'=. x
DL=.{:{.DPATH__ST

NB. for postive option codes generate files only if the object
NB. is in the put dictionary for negative codes generate files
NB. regardless of where on the path it occurs. Generated files
NB. are ALWAYS written to the put dictionary script directory
wf=. |wf [ po=. 0<wf

NB. errmsg: invalid group/suite name
if. (isempty +. badcl) y do. jderr ERR0154 return. end.
if. badrc head=. obj getgstext__ST y do. head return. end.

NB. generate files for dictionary objects
if. (1=wf) *. po do.
  if. badrc uv=. (obj;<DL) inputdict__ST <y=. y-.' ' do. uv return. end.
end.

NB. get group or suite list and generate text
if. badrc uv=. obj gslistnl__ST y do. uv return. end.
if. isempty >1{uv do. uv=.''
else.
  if. DODEPENDENTS do.
    NB. process any dependent sections in headers and adjust lists
    if. badrc deps=. obj gdeps y do. deps return. else. deps=.}. deps end.
  else. 
    deps=.''
  end.
  NB. dependents may empty group/suite list
  if. #uv=. (}.uv)-.deps do.
    if. badrc uv=. ((obj-2),0) getobjects__ST uv do. uv return. end.
    if. badrc uv=. ((obj-2),0) wttext rv uv do. uv return. end.
    uv=.rv uv
  else. uv=.''
  end.
end.

NB. trim any header and append to word or test text
if. #head=. alltrim@:lfcrtrim (1;0 1) {:: head do. uv=. head,LF,HEADEND,LF,LF,uv end.

NB. write file or return character list result
if. 1=wf do. (obj;y) writeijs uv else. ok uv end.
)


masknb=:3 : 0

NB.*masknb v-- bit mask of unquoted comment starts.
NB.
NB. monad:  masknb ct
NB. dyad:  cl masknb ct

'NB.' masknb y
:
c =. ($y)$x E. ,y
+./\"1 c > ~:/\"1 y e. ''''
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
  uv0=. parsed #~ 1|.parsed = <'=.'
  uv1=. parsed #~ 1|.parsed = <'=:'

  uv1=. uv0 -. uv0 -. uv1
  NB. errmsg: mixed scopes
  if. 0<# uv1 do. (jderr ERR0159),uv1 return. end.

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

if. #y do.
  clearso 0
  names=. (errnames=. {."1 y) ,&.> locsfx SO  NB. !(*)=. SO
  try.
    (names)=: (3!:2)&.> {:"1 y
    names=. (5!:5@<)&.> names
  catch. (jderr ERR016),errnames return. end.
  if. x do. names=. names ,&.> LF end.
  y=. names (<a:;2)} y
  clearso 0
end.
ok <y
)


opaqnames=:4 : 0

NB.*opaqnames v-- extract  opaque names  from J  code.  An opaque
NB. name is a declared reference.
NB.
NB. dyad:

b=.  +./"1 x        NB. text mask
x=. b # x [ y=. b # y
y=. x jnb y         NB. search only comment text
if. +./ '(*)=' E. , y do.

  NB. replace any single quotes ' with blanks
  NB. quotes will confuse (masknb) below
  y=. ($y)$ ' ' ( I. (,y) = '''')} ,y
  
  NB. this is a rare instance of where HARDCODE is
  NB. beneficial.  The tags used to mark declared
  NB. globals and locals in J code are sprinkled
  NB. throughout many programs.  If the tags where
  NB. ever changed in this verb it would not properly
  NB. process changed tags. By hardcoding the tags
  NB. they are difficult to change which is what I want!
  locals=. (,y) #~ , '(*)=.' masknb y
  locals=. ~. <;._1 ' ',locals #~ -. '  ' E. locals
  locals=. <jnfrblcl locals
  globals=. (,y) #~ , '(*)=:' masknb y
  globals=. ~. <;._1 ' ',globals #~ -. '  ' E. globals
  globals=. <jnfrblcl globals
  locals,globals
else.
  '';''
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
  parsed=. ok(<gbls),(<locs),<;parsed
end.
)


sexpin=:3 : 0
NB.*sexpin v-- single line explicit definition test.
if.      EXPPFX0 e.~ 5 {. hd=. alltrim 20 {. ,y  do. 1
elseif.  EXPPFX1 e.~ 8 {. hd  do. 1  NB. monad null
elseif. do. 0
end.
)


sonl=:3 : 0

NB.*sonl v-- scratch object namelist.
NB.
NB. monad:  sonl il

nl__SO y
)

NB. promotes only atoms and lists to tables
tabit=:]`,:@.(1&>:@(#@$))^:2


toascii85=:3 : 0

NB.*toascii85 v-- to ascii85 representation.
NB.
NB. From convert/misc/ascii85 addon.
NB.
NB. Converts  a  list  of  bytes to  an  ASCII85  representation:
NB. essentially all the  "visible" ASCII characters.  Useful  for
NB. encoding arbitrary byte  lists as a  portable stream. Returns
NB. lines of length no more than 75 + LF
NB.
NB. The encoding does not begin with <~, though sometimes this is
NB. allowed.  However  PDF  files  do  not  accept  this  prefix.
NB. Decoding does support the prefix.
NB.
NB. monad:  clA85 =. toascii85 cl

r=. ,y
len=. #r
assert. 4 <: len  NB. fails on short cl
r=. 256 #. _4[\ a.i.r
m=. 0 (_1) } r = 0
n=. 5 * I.m
r=. a. {~ 33 + ,(5#85) #: r
r=. 'z' n } r
m=. 1 n } 5 # -. m
r=. m # r
r=. (- (4|len) { 0 3 2 1) }. r
r=. }: ,(_75 [\ r),.LF
('~>',LF) ,~ (r i: ' ') {. r
)


uqtsingle=:3 : 0
NB.*uqtsingle v-- unquotes single line explicit definitions
if. sexpin y do.
  m99=. '''' htclip alltrim ,y
  m99=. tabit m99 #~ -. halfbits '''' = m99
  ]`(''''&,"1)@.(':'''&-:@(2&{.@,)) m99  NB. correct dyad
else.
  y
end.
)


wraplinear=:4 : 0

NB.*wraplinear  v--  wraps the linear representation of  large  J
NB. objects into a series of script lines.
NB.
NB. The linear form  of large  J  objects  can produce  very long
NB. lines  in  script files. Many editors cannot deal  with  very
NB. long lines. This verb  produces  an equivalent representation
NB. that can always be edited.
NB.
NB. dyad:  (clTempName ; iaWidth) wraplinear clLinear
NB.        (clTempName ; iaWidth ; paAscii85) wraplinear clLinear
NB.
NB.   ('z';67) wraplinear 5!:5 <'bighonkingarray'
NB.   ('z';67;1) wraplinear 'uses ascii85',LF,'encoding - better for most texts'

NB. temporary noun name, line length, ascii85 representation
'temp width ascii85'=. 3 {. x,<0

if. ascii85 do.
  NB. use ASCII85 encoding.  This representation is
  NB. about three times more compact than the default
  NB. representation but requires roughly three times
  NB. the CPU with current algorithms to encode/decode
  temp,'=:dec85__MK__JODobj 0 : 0',LF,')' ,~ toascii85 y
else.
  head=. temp,'=:'''''                NB. null header
  tail=. temp,'=:',(":#y),'{.',temp   NB. trim to correct length
  line=. temp,'=:',temp,','           NB. next line

  NB. wrap text and insure each line is properly quoted
  body=. ctl line ,"1 quote"1 (-width) ]\ y
  head,LF,body,LF,tail
end.
)


wrdglobals=:4 : 0

NB.*wrdglobals v--  extracts names from J  words. Assumes name is
NB. valid.
NB.
NB. dyad:  pa wrdglobals clName
NB.
NB.  0 wrdglobals 'wordname'  NB. only globals
NB.  1 wrdglobals 'wordname'  NB. full name classification

code=. jcr :: 0: y
NB. errmsg: no definition
if. code -: 0 do. (jderr ERR0152),<y else. x namecats code end.
)


writeijs=:4 : 0

NB.*writeijs v-- writes file to put dictionary directory
NB.
NB. dyad:  (iaObject ; clFile) writeijs clText

'obj file'=. x
DL=.{:{.DPATH__ST
NB. get put dictionary script directory
path=.jpathsep dfp__DL obj
m=. (toHOST y) (write :: _1:) path=.path,file,IJS
NB. errmsg: file write failure with target path and file appended
if. m -: _1 do. (jderr ERR0153),<path else. (ok OK0150),<path end.
)


wttext=:4 : 0

NB.*wttext v-- returns annotated word or test text.
NB.
NB. This  verb converts dictionary  words and  tests to formatted
NB. script   text.  (y)   is   a  boxed   (name,class,value)   or
NB. (name,value) table.  The result is either  a single cl script
NB. or a btcl of object scripts.
NB.
NB. dyad:  (paRc ; blcl) =. iaObjExFtab wttext bt
NB.        (paRc ; btcl) =. iaObjExFtab wttext bt

NB. object code, explanation bit, formatted table bit
NB. default table bit is off - this verb is frequently
NB. called with a two item (x) argument
'obj noex nftab'=. 3{.x,0

if. WORD=obj do.
  y=. (/: ; 1 {"1 y){y      NB. sort words by name class
  nr=. ((; 1 {"1 y)>0) i. 1
  NB. convert noun values to linear representations
  if. badrc m2=. noex nounlrep nr{.y do. m2 return. end.
  y=. (rv m2) , nr}.y
end.

if. nftab do. nms=. 0 {"1 y end.  NB. retain sorted names

if. noex do.
  NB. no explanations and no LF's depends on caller
  m=. (#y)#0
elseif. +./m=. -.LF e.&> {:"1 y do.
  NB. prefix any short explanations for single line definitions
  m2=. m#{."1 y
  if. badrc et=. obj getexplain__ST m2 do. et return. end.
  m2=. 0<#&> et=. {:"1 rv et
  et=. (<"0 m2) #&.> (<'NB. ') ,&.> et ,&.> LF
  y=. (et ,&.> m#{."1 y) (<(I. m);0)} y
  NB. number of LF's between corresponding objects
  m=. (>:2*-.m) + m (#^:_1) m2
  m=. m + 2*firstone 1=m
elseif.do.
  NB. 3 LF's between all multi-line defs HARDCODE
  m=. (#y)#3
end.

NB. construct J object scripts
if. WORD=obj do. y=.jscriptdefs y else. y=. {:"1 y end.

NB. return formated (name,script) table or cl script
if. nftab do. ok <nms ,. y else. ok ({.m)}.m jscript y end.
)