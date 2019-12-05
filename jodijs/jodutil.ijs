NB. *jodutil c-- a collection of JOD utility words: extension of (jod).
NB.
NB. This subclass defines a set of handy utilites that use the core
NB. facilities of JOD to perform tasks of general use to J programmers.
NB.
NB. Interface nouns & verbs:
NB.   compj    extreme compression of dictionary words
NB.   de       drop error code from JOD results
NB.   disp     display dictionary objects
NB.   doc      format comments in words and documents
NB.   ed       edit objects from JOD
NB.   et       edit text
NB.   gt       get text out of edit windows
NB.   revo     list recently revised objects
NB.   rm       run macros
NB.   rtt      run tautology tests
NB.   jodhelp  browse PDF online help
NB.
NB. Notes:
NB.   error & ok messages (jodutil range 00250-00399)

coclass 'ajodutil'
coinsert 'ajod'

NB.*dependents d-- dependent words 

NB. documentation mark for assumes
ASSUMESMARK=:'assumes:'

NB. documentation mark for author
AUTHORMARK=:'author:'

NB. documentation mark for created
CREATEDMARK=:'created:'

NB. documentation mark for dyad hungarian and examples
DYADMARK=:'dyad:'

NB. documentation mark for monad hungarian and examples
MONADMARK=:'monad:'

NB. documentation mark for verbatim
VERBATIMMARK=:'verbatim:'

NB. documentation mark for root words
ROOTWORDSMARK=:'rootwords:'

NB. documentation marks - depends on other marks
DOCUMENTMARKS=: ASSUMESMARK;AUTHORMARK;CREATEDMARK;DYADMARK;MONADMARK;VERBATIMMARK;ROOTWORDSMARK

NB. command line quotes OS dependent: jod !(*)=. dblquote 
qt=: ]`dblquote@.IFWIN

NB.*enddependents
NB.*end-header

NB. remove only white space tag
CWSONLY=:'(-.)=:'

NB. text editor to use when running JOD in jconsole on Windows systems
EDCONSOLE=:'"c:\Program Files\Microsoft VS Code\code.exe"'

NB. default edit file name
EDTEMP=:'99'


ERR0250=:' is a noun no internal document'
ERR0251=:'not loaded - load'
ERR0252=:'not J script(s) ->'
ERR0253=:'invalid locale name'
ERR0254=:'unable to get TEMP/*.ijs text'
ERR0255=:'unable to open TEMP/*.ijs for editing'
ERR0256=:'J error in script ->'
ERR0260=:'PDF reader not found'
ERR0261=:'macro is not a J script - not formatted'
ERR0262=:'not supported on current J system'

NB. jodutil interface words
IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

NB. valid characters in J names
NAMEALPHA=:'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'

NB. obfuscate local identifiers tag
OBFUSCATE=:'(/:)=:'

NB. name obfuscation limit - higher values less likely to clash
OBFUSCCNT=:100000

NB. obfuscation local identifier prefix
OBFUSCPFX=:'o_'


OK0250=:' documented in ->'
OK0251=:'edit locale cleared'
OK0252=:'edit locale ->'
OK0255=:'starting PDF reader'
OK0256=:'jod.pdf not installed - use JAL to install the addon general/joddocument'

NB. PDF document indicator
PDF=:'PDF'

NB. PDF reader - must accept command line argument
PDFREADER=:'C:\Program Files\Adobe\Reader 8.0\Reader\acrord32.exe'

NB. on Mac's use the OS open command for PDFs
PDFREADERMAC=:'open'

NB. character used to mark scriptdoc headers - currently a '*'
SCRIPTDOCCHAR=:'*'


blkaft=:3 : 0

NB.*blkaft v-- appends necessary blanks to J tokens.
NB.
NB. This verb appends some  necessary blanks to  J tokens so that
NB. raising  a token list and reparsing  produces  the same token
NB. list. A few unecessary blanks may be inserted.
NB.
NB. monad:  blkaft blcl
NB.
NB.   NB. line of J code
NB.   line=. 'c=. +./\"1 c > ~:/\"1 y. e. '''''''''
NB.   tokens=.  ;: line
NB.
NB.   NB. compare
NB.   (;: ; tokens) -: tokens
NB.   (;: ; blkaft tokens) -: tokens

NB. assume no blanks are required
r=. 0 #~ # y
t=. y

while.do.
 u=. ;: ;\ t
 v=. ~.&.>  ( <"1 |: u) -. L: 1  a:
 r=. r +. y e. ; {.&.> (1 < #&> v)#v

 if. y -: {: u do.
   NB. last tokenized row matches original
   break.
 else.
   NB. insert required blanks and reparse
   t=. ((r#t),&.>' ') (I. r)} t
 end.

end.

NB. insert required blanks and raise tokens
; ((r#y),&.>' ') (I. r)} y
)


changetok=:4 : 0

NB.*changetok  v--  replaces  J name tokens within  a string. See
NB. long documentation.
NB.
NB. dyad:  clChanged =. clTokens changetok clStr
NB.
NB.   '/boo/hoo' changetok 'boo boo boohoo boohoo'

if. #pairs=. 2 {."(1) _2 [\ <;._1 x do.
  pairs=. pairs #~ _2 ~: (4!:0) {."1 pairs  NB. eliminate non-token pairs
end.
cnt=._1 [ lim=. # pairs
while. lim > cnt=. >:cnt do.         NB. process each change pair
  't c'=. cnt { pairs                NB. /target/change (*)=. t c
  if. +./b=. t E. y do.              NB. next if no targets
    w=. I. b                         NB. target starts
    'l o'=. #&> cnt { pairs          NB. lengths (*)=. l o
    q=. (w { ' ' , y) e. NAMEALPHA        NB. head chars
    r=. ((w + l) { y , ' ') e. NAMEALPHA  NB. tail chars
    w=. w #~ -. q +. r               NB. eliminate embedded tokens
    if. 0 = #w do. continue. end.    NB. next if no targets
    b=. 1 w} 0 #~ # b                NB. reset target mask
    p=. w + 0,+/\(<:# w)$ d =. o - l   NB. change starts
    s=. * d                          NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # w)$ 1 0 #~ o,l-o) (,w +/ i. l)} b
      y=. b # y
      if. o = 0 do. continue. end.   NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d w} b             NB. first target char replicated
    end.
    y=. (c $~ o *# w) (,p +/i. o)} y  NB. insert replacements
  end.
end. y                               NB. altered string
)


compclut=:3 : 0

NB.*compclut  v-- removes  comments and  reduces  multiple  blank
NB. lines to singles.
NB.
NB. This  verb removes  all  comments  from  J code  and  reduces
NB. multiple blank  lines  to  one.  All  leading  whitespace  is
NB. preserved.  This representation  is surprisingly  useful when
NB. debugging and reading  code as it removes  annoying "literary
NB. artifacts" while preserving the structure of code.
NB.
NB. monad:  cl =. compclut ctJcr
NB.
NB.  complut jcr 'compclut'

t=. 0 decomm y
LF ,~ ctl t #~ (-.b) +. firstone b=. *./"1 ' '=t
)


compj=:3 : 0

NB.*compj v-- compresses nonnouns  by removing  white  space and
NB. shortening local identifiers.
NB.
NB. (compj)  does not shorten  global identifiers, object or  locale
NB. names  and implicit local (for.) names. The names  changed  by
NB. (compj) are labeled local by (11 globs).
NB.
NB. WARNING: code compression requires that all ambigous names in
NB. J  code  are properly declared  using  (globs) scope tags. If
NB. such names are not properly identified compression will break
NB. your code.
NB.
NB. monad:  cl =. compj blclNames
NB.
NB.   compj ;:'the byte diet'
NB.
NB. dyad:  cl =. iaOption compj blclNames
NB.
NB.   1 compj ;:'remove comments preserving leading whitespace'

0 compj y
:
if. badil x do. jderr ERR001 return. end.

NB. get word definitions
if. badrc dat=. (WORD,NVTABLE) get y do. dat return. else. dat=. rv dat end.

NB. mask of non-nouns
b=. 0 < ; 1 {"1 dat

NB. set compression 
cv=. compressj`compclut @. (1 -: x)

NB. compress non-nouns - remove any embedded tabs
dat=. (cv@:ctit&.> (b#{:"1 dat) -.&.> TAB) (<(I. b);2)} dat

NB. generate packed script
(WORD,1) wttext__MK dat
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


createut=:3 : 0

NB.*createut v-- initializes utility objects.
NB.
NB. monad:  createut blObrefs
NB.
NB.   createut__UT JOD;ST;MK;UT;<S0

NB. object references !(*)=. JOD ST MK UT SO
'JOD ST MK UT SO'=: y

NB. set shortnames !(*)=. SHORTNAMES
SHORTNAMES=: ,&.> <"0 [ 52 {. NAMEALPHA
SHORTNAMES=: SHORTNAMES -. ;:'m n x y u v'

NB. add to overall jod interface
IZJODALL__JOD=: IZJODALL__JOD,IzJODutinterface

NB. define direct (ijod) locale interface for utilities
".&.> UT defzface IzJODutinterface
)

NB. convert LF delimited character lists to character tables
ctit=:[: ];._2 ] , (10{a.)"_

NB. display JOD result without return code
de=:list@:}.


dewhitejcr=:3 : 0

NB.*dewhitejcr  v--  removes  all redundant  blanks from  J code.
NB. Result is a character list in linear representation format.
NB.
NB. monad:  cl =. dewhitejcr ct
NB.
NB.   dewhitejcr jcr 'anyword'

tt=. ;:&.> <"1 (ljust@:decomm) y  NB. list of tokenized lines
; (blkaft&.> tt) ,&.> LF          NB. insert blanks, LF's and raise
)


dewhitejscript=:3 : 0

NB.*dewhitejscript  v--  removes  all  redundant  blanks  from  J
NB. scripts.
NB.
NB. monad:  dewhitejscript cl
NB.
NB.   dewhitejscript read 'c:\any\j\script.ijs'

NB. replace any tabs with single blanks
y=. ' ' (I. y=TAB)} y

NB. remove blank lines and all comments from script
y=. ;:&.> <"1 decomm ];. _1 LF,y-.CR

NB. remove redundant blanks in code
; (blkaft&.> y) ,&.> <CRLF
)


disp=:3 : 0

NB.*disp  v--  display  dictionary  objects  as text.  This  verb
NB. returns  a character  list instead of  a the usual (rc;values
NB. ...) boxed list.
NB.
NB. monad:  disp cl|blcl
NB. dyad:  iaObject disp cl|blcl

0 disp y
:
if. badrc uv=. x obtext y do. uv else. >{:uv end.
)


doc=:3 : 0

NB.*doc v-- formats document text  using  the conventions  of the
NB. (docct) verb.
NB.
NB. monad:  doc clName
NB.
NB.   doc 'word'    NB. format leading block of explicit defn comments
NB.
NB. dyad:  iaObject doc clName
NB.
NB.   1 doc 'test'       NB. format test document text
NB.   0 9 doc 'longdoc'  NB. format long word documentation text

docword y
:
x doctext y
)


docct2=:4 : 0

NB.*docct2 v-- formats leading comments.
NB.
NB. This verb formats the  leading comments in a character table.
NB. There  are  three   basic  types  of  tables:  (1)  character
NB. representations  of  explicit  words with  leading  contigous
NB. comment blocks, (2) general J  scripts with leading contigous
NB. comment  blocks,  (3)  long  JOD documentation  text  without
NB. leading comments (no 'NB.'s).  Long documentation follows the
NB. same formatting conventions without the leading 'NB.'s
NB.
NB. Result is a character table.
NB.
NB. dyad:  ctFormatted =. (iaWidth;iaStarPos;iaBlockIdx;clPfx) docct2 ctText
NB.
NB.   (41;0;1;'NB.') docct2__UT__JODobj ];._1 LF,disp 'docct2'             NB.(1)
NB.   (40;0;0;'NB.') docct2__UT__JODobj ];._1 LF,(4 disp 'scriptstub')-.CR NB.(2)
NB.   (57;0;0;'') docct2__UT__JODobj ];._1 LF,(4 disp 'docstub')-.CR       NB.(3)

NB. width, star-row, block-index, prefix
'wid star blidx pfx'=. x
plen=. #pfx

NB. get any first block of comments
if. plen do.
  if. -. +./b1=. +./"1 (,: pfx) E. y do. y return. end.
  txt=. ((firstone b1) +. firstone -.b1) <;.1 y
else.
  NB. the prefix is null - the first comment block is all text
  txt=. <y
end.

if. blidx >: #txt do. y return. else. blk=. > blidx { txt end.
if. +./ (star,plen) >: $blk do. y return. end.

NB. apply formatting only to scriptdoc'ed text
if. SCRIPTDOCCHAR=(<star;plen){blk do.

  NB. clear scriptdoc mark remove any prefixes
  blk=. ' ' (<star;plen)} blk
  if. plen do. blk=. (#pfx) }."1 ljust blk end.

  NB. format comments remark for scriptdoc
  'head tail'=. (wid;DOCUMENTMARKS) docfmt2 blk
  head=. SCRIPTDOCCHAR (<star;plen)} (pfx,' ') ,"1 head
  tail=. pfx ,"1 tail

  NB. return formatted text
  ; (<head,tail) (blidx)} txt
else.
  y
end.
)


docfmt2=:4 : 0

NB.*docfmt2 v-- formats comment region.
NB.
NB. dyad:  (iaWid ; blclMarks) docfmt2 ct
NB.
NB.  (67;MONADMARK;DYADMARK) docfmt2 5#,:'to comment or not to comment'

NB. text width and n marks
width=. >{. x
marks=. }. x

NB. leave all text following any marks alone
b=. +./"1 +./ (,:&.> marks) E.&> <y
b=. 1 (0)} firstone +./\ b
'head tail' =. 2 {. (b <;.1 y),<i.0 0

NB. format paragraphs of head
head=. ljust head
head=. width textform2&.> (1(0)}*./"1' '=head)<;.1 head

NB. remove null paragraphs, remerge and mark for scriptdoc
head=. (0 < #&> head)#head
head=. (-0=#tail) }. ;head,&.> ' '

NB. return formatted text and unformatted tail
head;tail
)


doctext=:4 : 0

NB.*doctext v-- formats long document, object and header text.
NB.
NB. dyad:  iaObject doctext clName
NB.
NB.   0 doctext 'word'
NB.   1 doctext 'test'

if. badcl y do. jderr ERR001  NB. errmsg: invalid options
elseif. badrc uv=. checkput__ST y   do. uv
elseif. badrc uv=. checknames__ST y do. uv
elseif. ((1=#x) *. ({.x) e. TEST,MACRO) +. x e. (GROUP,SUITE) ,. 1  do. 
        if. badrc uv=. x obtext y do. uv return. else. uv=. >{:uv end.
        NB. format leading comments of test, macro and group/suite header scripts
        DL=.{:{.DPATH__ST
        uv=. ctl (DOCUMENTWIDTH__DL;0;0;'NB.') docct2 ];._1 LF,uv-.CR
        if. x-:MACRO do.
          NB. format only J script macros
          if. badrc uv2=. (MACRO,INCLASS) get y do. uv2 return. end. 
          NB. errmsg: macro is not a J script - not formatted
          if. JSCRIPT=>{:uv2 do. x put y;JSCRIPT;uv else. jderr ERR0261 end.
        else.
          x put y;uv
        end.
elseif. -. (<x) e. {OBJECTNC;DOCUMENT do. jderr ERR001
elseif. y=. }. uv
        DL=.{:{.DPATH__ST
        badrc uv=. ((x=.{.x);<DL) inputdict__ST y do. uv
elseif. badrc uv=. x getdocument__ST y do. uv
elseif.do.
  NB. document text using same formatting
  NB. conventions applied to words.
  uv=. (1;0 1){:: uv
  uv=. ];. _2 (uv -. CR),LF
  uv=. ctl ; (DOCUMENTWIDTH__DL;DOCUMENTMARKS) docfmt2 uv
  (x,DOCUMENT) put y,<uv
end.
)


docword=:3 : 0

NB.*docword v-- formats the leading  comment block  in dictionary
NB. verbs, adverbs and conjunctions.  Nouns do not have  internal
NB. documentation. Attempts  to  document  a noun  results in  an
NB. error.
NB.
NB. Note: nouns do have  external  documentation in  the form  of
NB. short explanations and supplemental document text. See  (put)
NB. and (get).
NB.
NB. monad:  docword clName

if. badcl y do. jderr ERR001
elseif. badrc uv=. checkput__ST y do. uv
elseif. badrc uv=. checknames__ST y do. uv
elseif. y=. }. uv
        DL=.{:{.DPATH__ST
        badrc uv=. (WORD;<DL) inputdict__ST y do. uv
elseif. badrc uv=. (WORD,0) getobjects__ST y do. uv
elseif. 0 = (1;0 1){:: uv do.
  NB. errmsg: is a noun no internal document
  jderr '<',(' ' -.~ ,>y),'>' , ERR0250
elseif. cr=. (1;0 2){:: uv
        cr=. (-LF = {:cr) }. cr,LF
        NB. cr=. ctl DOCUMENTWIDTH__DL docct ];._2 cr  NB. OLDCODE
        cr=. ctl (DOCUMENTWIDTH__DL;0;1;'NB.') docct2 ];._2 cr 
        uv=. , 1 {:: uv
        uv=. (<cr) 2} uv
        badrc msg=. (WORD,NVTABLE) put uv do. msg
elseif.do.
  (ok '<',(>{.uv),'>',OK0250),{:msg
end.
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
NB.   ed ;:'many words mashed into one edit script'
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

NB. extract object references from blcl of names
exobrefs=:a:"_ -.~ [: ~. [: ; [: <;._1&.> ([: +./\&.> (<'__')"_ E.&.> ]) #&.> ]


gt=:3 : 0

NB.*gt v-- get J script text from J temp directory.
NB.
NB. monad:  gt cl|zl
NB.
NB.   gt ''  NB. read text in 99 file
NB.   gt 'whatever'

if. isempty y do. y=.'99' end.
NB. use J temporary edit directory 
NB. (jpath) is a J system utility loaded by standard profile
try.   read jpath  '~temp\'  ,y , IJS
catch. jderr ERR0254
end.
)

NB. formats (jodhelp) command line and spawns browser or pdfreader
jodfork=:[: fork_jtask_ [: ; 1 0 2 { ' ' ; qt


jodhelp=:3 : 0

NB.*jodhelp v-- display JOD help.
NB.
NB. monad:  jodhelp uuIgnore
NB.
NB.   jodhelp ''  NB. display JOD help - start PDF browsing 

jodpdf=. jpath '~addons\general\joddocument\pdfdoc\jod.pdf'
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
  ok OK0256 NB. msg: jod.pdf not installed - use JAL to install the addon general/joddocument
end.
)

NB. left justify table
ljust=:' '&$: :(] |."_1~ i."1&0@(] e. [))


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


pdfreader=:3 : 0

NB.*pdfreader v-- returns a pdf reader from available options.
NB.
NB. monad:  clPDFExe =. pdfreader uuIgnore

NB. prefer J's pdf readers otherwise take JOD reader !(*)=. PDFREADER
if. wex<'PDFREADER__UT__JODobj' do. pdfrdr=. PDFREADER__UT__JODobj else. pdfrdr=.'' end.

NB. on Mac's use the open command for PDF's
if.     UNAME-:'Darwin'    do. pdfrdr=. PDFREADERMAC 
elseif. wex<'PDFReader_j_' do. if. 0<#PDFReader_j_ do. pdfrdr=. PDFReader_j_ end. NB. J 7.0x
elseif. wex<'PDFREADER_j_' do. if. 0<#PDFREADER_j_ do. pdfrdr=. PDFREADER_j_ end. NB. J 6.0x
end.

pdfrdr
)


reb=:3 : 0

NB.*reb v-- removes redundant blanks - leading, trailing multiple
NB.
NB. monad:  reb cl
NB. dyad:  ua reb ul

' ' reb y
:
y=. x , y
b=. x = y
}.(b*: 1|.b)#y
)


revo=:3 : 0

NB.*revo v-- recently revised objects. Lists recently changed put
NB. dictionary objects in order of latest to oldest.
NB.
NB. monad:  revo zl | cl
NB.
NB.   revo ''     NB. all put dictionary words in revision order
NB.   revo 'pat'  NB. recently changed words beginning with 'pat'
NB.
NB. dyad:  iaObject revo zl | cl
NB.
NB.   1 revo ''   NB. all revised tests
NB.   2 revo 'g'  NB. recently changed groups beginning with 'g'

WORD revo y  NB. word default
:
if. badil x do. jderr ERR001
elseif. badrc uv=. ((x=.{.x),_1) dnl y do. uv  NB. HARDCODE _1
elseif. isempty new=.rv uv do. ok new  NB. no matches
elseif.do.
  age=. rv (x,INPUT) get new    NB. last put timestamps
  ok (\: age) { new
end.
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
    NB. j profile !(*)=. cocurrent
    NB. run from base, (display default, suppress x.-:1) stop on errors
    cocurrent 'base'
    if. x-:1 do. 0!:100 scr else. 0!:101 scr end.
    cocurrent curr
  catchd.
    cocurrent curr  NB. restore locale
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

NB. j profile !(*)=. cocurrent
NB. run from base, (display default, suppress x-:1), stop on errors
cocurrent 'base'  
try.
  if. 0-:x     do. 0!:2 scr
  NB. Note: silent execution that fails suppresses all output
  elseif. 1-:x do. (] [ 1!:2&2) 0!:3 scr 
  elseif. 2-:x do. 0!:001 scr
  elseif.do.
    cocurrent curr
    jderr ERR001 return.
  end.
catchd.
  cocurrent curr
  (jderr ERR0256),<13!:12 '' return. 
end.

NB. back to original locale
cocurrent curr
)


textform2=:63&$: :(4 : 0)

NB.*textform2 v-- wraps and justifies character table (y).
NB.
NB. This  verb forms an  (n*len)  character matrix. The blanks in
NB. each  row of the output matrix are padded so that the line is
NB. right  and left justified.  The number  of rows in the output
NB. table depends upon how many are needed to hold the input data
NB. in the justified format.
NB.
NB. Note: This verb is  a verbatim translation of  an APL utility
NB. and has not been optimized for J.
NB.
NB. monad:  cmWrap =. textform2 c[0..2]Text
NB.
NB.   textform2 1000$' How can I justify this ehh. '
NB.
NB. dyad:  cmWrap =. iaWidth textform2 c[0..2]Text
NB.
NB.   50 textform2 10#,:' four score and seven years ago our '

i=. 0
v=. reb , y ,"1 ' '
j=. #v
b=. j$0
while. j > a=. i + x do.
  k=.  i + i. >:a - i
  if. #c=. (' ' = k{v)#k do.
    i=. >: {: c
    g=. ({:k) - <:i
    c=. (1 >. <:#c) {. c
    f=. #c
    d=. f $ <. g%f
    d=. (>:{.d) (i. f|g)} d
    b=. d ((f?f){c)} b
  else.
    b=. 1 a} b
    i=. a
  end.
end.
v=. (>:b) # v
e=. >: x
r=. >.(#v) % e
(r,x) {. (r,e)$(e*r){.v
)