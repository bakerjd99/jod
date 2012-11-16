NB. jodutil.ijs -- a collection of JOD utility words.
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
NB.   jodhelp  spawn browser for online help
NB.
NB. Notes:
NB.   error & ok messages (jodutil range 00250-00399)

coclass 'ajodutil'
coinsert 'ajod'

NB. current help topics
JODHELP=: 0 : 0
AContents ; 1pR1kc27OwTEGZ4BavhYT4RVvAtlEEUzueT9T-URY9t0
AJodIndex ; 1kXc_yzzuHkjnfIp_qU3IIP4lfj06KFgoKbTZEQlyiFA
BestPractices ; 1lZ3qI9-AmH8CtuU7m80E5sheQkG73vsLFud1uuytUgc
Classes   ; 1ko9FlV9fJNH_QCyhUN5XjtjGdX4bmeli-gVXtwgewTs
Codes     ; 1G3t0L7XRmowiU4wQEL9IvOGPqQ1Kf7h6QXxKIhLxal4
DependentSection ; 1tn9qV8Hu-rk_rj70NkwGNmCFHa-VfRAnB3GYzqzpLrw
Directories ; 1JMDQaCHiRdmgCOb-4EhOweObiB--34fTYbB4RL65Hi8
Introduction ; 11QiWE8qJ0AojDAv2_jiOcPz5kDtI88jUR3vmNqw-pLQ
ReleaseNotes ; 1aBdt8rwdOq_CQ52qRQ-js1MwiaovC2pxlQq-Z9VosOg
addgrp    ; 1e9mEbLASGXvzYNGJcHXI3vzv7Dph9f_HjmNLqg9reWY
compj     ; 1AieHkq0jGLTJT2UrcwtdAoOZv5Uj8T_0jjOomYLhYSE
del       ; 1DP-nLxYfs5_QhlhmD9JtpeDQ98fteWp-tSIHMUGtYdg
delgrp    ; 1pBBfh5UdSq4RZFjagbma7_uZfRnY66Ghn6Ezvvvq5ZY
did       ; 1y-3Gaov9tW8d-E1uhTNYmFhyJEmmC_N3q4G0t8L7gJM
disp      ; 1_oZe7JxNR4qK3LwLeDrwarsxvpFkpsUdcViY5KpYAVg
dnl       ; 1rmg4ErbOxDa3CFJtwUgfWusWKvlzO6ooNhlcd1VxVKg
doc       ; 1zcZvo1-4f7LLPXrTrJFAYkr6JTtOtGFIsJolylDz234
dpset     ; 1zEDu9VLz2VY_5wR7hVYbQqrwfUIWw4WK00zmKOKGCJg
ed        ; 1PdqC8IHhJJrUI59koofhSxgcCDXknI8yFlRHPSTdY4Q
et        ; 1IYmf8C5eJElstSsdXyui8N0KRKb9yNQTFBU0TgVVWlc
get       ; 1Vk-PQrdPEISp0SL4eDaGDgg5HpATarPPvXHryC12I8M
getrx     ; 1gUR9LLIVCPW9hfAXIltyiBuZf1kBURedrRVqmvWXJvQ
globs     ; 1s4_Af0kZnrfcCBgRDMK2MPMSTGwZb0ZDaFEMi_qXjn8
grp       ; 1bBeyMbSH_BFBurvnlVnWTf0JLY30LrFTbzgtOGvMyrk
gt        ; 134EaK4pSHXccvjZTjPS79zsnkXH3im83KJv3ggeUqIs
hlpnl     ; 1ZjmYZXo_Pruz0KsRENiN-qSryd6medadAbxSmdIu9kA
jodage    ; 1h5LfaqgO4lrB2RzLWjdaBbNAjfLlAu-eh-LNM9sJPfI
jodhelp   ; 1p9dyoymZ-q9YEkqS8sZa-VwV2FPxTf8KdlUvqSIkR8w
lg        ; 1-4OmVkDmg0pijMXXoheS6uUryN5G9OAHDztpgH7vrcM
locgrp    ; 1BVhp_XrtoU4DEo5rK0sgoBIKoE8XdzL3hPaOOfAFhIE
make      ; 1mfvL980DNpfoej1KCzgp30CFvRccEHvMqL2nE1oLjWc
mls       ; 1aREjTasgLz7n9-bPaOQLHG2-Jy1-3YaxKyZIoc3BioU
newd      ; 12AckZFKDNa0lDAj626Ix2HW8emGldx04YDDJdFxS_eY
notgrp    ; 1uWBqdrMQK4pa0yUiWN7JD6etgjAZpmXzBU2XLP8WBGQ
nt        ; 11cOKzEkGwwfmK7CGWsO1znzA_vxxDh-k35qoUNbYkso
nw        ; 18hgq69AK7m3bik7UTwk82A5Ind2qAD5ZFHjBwAQ2kIw
od        ; 1sMmIe7ViflORenJaolLE1qj7BB54s7z9Mi9ulV7N7g4
packd     ; 1dU2chbJBQ5mRTT8GvT6VVPs3FjoD5JxJiUhSxMjXmWc
pr        ; 1mxDtNJGKztFsQ4RlQb96nGyIaHd15PX-RJYSooJaNbA
put       ; 1uhZaiNyIHMVqVaa-peCj_sN6JjnuxVdmnODm9uoE66Y
regd      ; 1OC4UNVCeRpJcLThP5pkYp8Kkxpdi4zz77ZdFgZb1A-g
restd     ; 1vlRYJrrrxbw4TGNsvHpd8pPVfiYYKn2VDy5DqYU77_s
revo      ; 1rNe_RB7AXdr2OMNVLtKFCqKwE02jkOH1aiPu7xSl1lA
revonex   ; 1xEGQPwmyROge9myNW8iC8uCbFYP2kOhd1EwFfqgI5mE
rm        ; 1PImOwL_PNvyHEkYW205--ukAg-tv9tceMEEZAbgqnbY
rtt       ; 1WT7bciC3XQRPPrHwy8nQRwNYyV2TSzAXd8j5BZP3nmY
usedby    ; 1LYQVi-T2sIoCR0BQHiu6y6Cvb_KgZoALXNuAXccspr8
uses      ; 1NUFFk3ya9iWlT0N6-Ly-vd69MO2Njfqoyul4eBfMW9E
)

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

NB. help url prefix 
URLPFX=:'https://docs.google.com/document/d/'
NB. URLPFX=: 'http://docs.google.com/View?docID='

NB. help urp suffix
URLSUX=:'/edit?hl=en_US#'

NB. set documented word urls 
NB. defined in superclasses  !(*)=. CR afterstr beforestr alltrim dblquote  
JODHELP=: |: alltrim&.> (';'&beforestr  ; ';'&afterstr)&> (alltrim&.> <;._2 JODHELP -. CR) ,&.> <URLSUX
JODHELP=: ((<URLPFX) ,&.> 1{JODHELP) (1)} JODHELP
JODHELP=: ('AJodPage';'http://bakerjd99.wordpress.com/the-jod-page/'),.JODHELP
JODHELP=: (/: 0{JODHELP) {"1 JODHELP

NB. command line quotes OS dependent
qt=: ]`dblquote@.IFWIN

NB.*enddependents
NB.*end-header

NB. remove only white space tag
CWSONLY=:'(-.)=:'

NB. default edit file name
EDTEMP=:'99'


ERR0250=:' is a noun no internal document'
ERR0251=:'not loaded - load'
ERR0252=:'not J script(s) ->'
ERR0253=:'invalid locale name'
ERR0254=:'unable to get TEMP/*.ijs text'
ERR0255=:'unable to open TEMP/*ijs for editing'
ERR0256=:'J error in script ->'
ERR0257=:'invalid help word name'
ERR0258=:'browser not found ->'
ERR0259=:'no help for ->'
ERR0260=:'PDF reader not found'
ERR0261=:'macro is not a J script - not formatted'
ERR0262=:'not supported on current J system'
IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

NB. valid characters in J names
NAMEALPHA=:'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'


OK0250=:' documented in ->'
OK0251=:'edit locale cleared'
OK0252=:'edit locale ->'
OK0253=:'starting browser help for ->'
OK0254=:'starting browser on help index'
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

NB. first Windows JOD browser
WWW0=:'C:\Program Files\Internet Explorer\IEXPLORE.EXE'

NB. first linux JOD browser
WWW0linux=:'chromium-browser'

NB. www mac browser
WWW0mac=:'open'

NB. second Windows JOD browser
WWW1=:'c:\Program Files\Mozilla Firefox\firefox.exe'


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

NB. get word definitions
if. badrc dat=. (WORD,NVTABLE) get y do. dat return. else. dat=. rv dat end.

NB. mask of non-nouns
b=. 0 < ; 1 {"1 dat

NB. compress non-nouns - remove any embedded tabs
dat=. (compressj@:ctit&.> (b#{:"1 dat) -.&.> TAB) (<(I. b);2)} dat

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

NB. check for presence of white space only removal tag
w=. 1 e. CWSONLY E. ,y

NB. always remove white space
u=. dewhitejcr y
if. w do. u return. end.

NB. do not compress identifiers in code that cannot be
NB. reliably classified by the namecats verb.
if. badrc m=. 1 namecats__MK y do. u return. end.
d=. ~. ;(<2 3 4;1){m=. rv m

NB. local names less any single char names
l=. ;(<1;1){m
s=. l #~ 1 = #&> l
l=. l -. s

NB. remove object references
l=. l -. exobrefs l,;(<0;1){m

NB. local names less any declared and for. names
if. 0=#m=. l -. d do. u return. end.

NB. remove any names with embedded locale references
if. 0=#m=. m #~ -. islocref&> m do. u return. end.

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

NB. set browser 
WWWBROWSER=: setwwwbrowser 0

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

NB.*ed v-- edit dictionary objects
NB.
NB. monad:  ed cl|blcl
NB.
NB.   ed 'wordname'
NB.
NB. dyad:  iaObject|ilObjOpt ed cl|blcl
NB.
NB.   1 ed 'testname'           NB. edit test
NB.   0 9 ed 'worddocument'     NB. document text associated with word
NB.   2 ed 'group'              NB. generate entire group script and edit
NB.   2 1 ed 'grouptext'        NB. edit only group text

0 ed y
:
if. badrc uv=. x obtext y do. uv return. else. 'file text'=. }.uv end.

if. wex <'EDLOCALE' do.   NB. !(*)=. EDLOCALE
  NB. set up to define objects into specified locale if requested
  pfx=.'18!:4 <''',EDLOCALE,''' [ CRLOC_ajodutil_=: 18!:5 '''' '
  sfx=. '18!:4 CRLOC_ajodutil_'
  text=. pfx,LF,LF,text,LF,LF,sfx
end.

NB. append user defined document command 
NB. the pattern {~N~} is a name placeholder, e.g.
NB.   DOCUMENTCOMMAND_ijod_ =: 'showpass pr ''{~N~}'''
NB. append only when editing single words
if. (x -: 0) *. wex <'DOCUMENTCOMMAND_ijod_' do. 
  text=. text,LF,LF,('/{~N~}/',file) changestr DOCUMENTCOMMAND_ijod_
end.

file et text
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

  if. 0 e. wex ;:'IFJHS IFJ6 IFGTK' do.
    NB. probably on a J 6.0x system
    smopen_jijs_ file   NB. J 6.0x 
  else.
    NB. open in various J7/6 editors !(*)=. IFJHS IFGTK IFJ6 IFIOS
    if. IFJHS     do. open_jhs_ file 
    elseif. IFGTK do. open_jgtk_ file
    elseif. IFJ6  do. smopen_jijs_ file   NB. J 6.0x 
    elseif. IFIOS do. je_z_ file          NB. iPhone/iPad
    elseif.do. jderr ERR0262  NB. errmsg: not supported on current J system
    end. 
  end.

catch. jderr ERR0255
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

NB.*jodhelp v-- display help for JOD words.
NB.
NB. monad:  jodhelp zl | cl
NB.
NB.   jodhelp ''       NB. display help index
NB.   jodhelp 'get'    NB. (get) help
NB.
NB. dyad:  uuIgnore jodhelp uuIgnore
NB.        clPDF jodhelp uuIgnore
NB.
NB.   jodhelp~ 0  NB. list know help topics
NB.
NB.   'PDF' jodhelp 0  NB. open PDF
NB.   jodhelp~ 'PDF'

www=. wwwbrowser 0
if. badcl y do. jderr ERR0257 NB. errmsg: invalid help word
elseif. IFWIN *. -.fex <www do. (jderr ERR0258),<www  NB. errmsg: browser not found
elseif. #y  do.
  word=. <alltrim y
  if. ({:$JODHELP)=pos=. (0{JODHELP) i. word do.
    (jderr ERR0259),word NB. errmsg: no help for
  else.
    jodfork www ; pos{1{JODHELP
    (ok OK0253),word NB. msg: starting browser help
  end.
elseif.do.
  NB. HARDCODE: jod index is first in list
  ok OK0254 [ jodfork www ; 0{1{JODHELP 
end.
:
if. x -: PDF do.
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
else.
  NB. display available help topics
  /:~ 0{JODHELP
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
  if. (<x) e. {(SUITE,GROUP);1  do.  NB. HARDCODE 1
    NB. group and suite headers are frequently edited
    if. badcl y do. jderr ERR0154__MK return. end.
    if. badrc uv=. ({.x) get y do. uv return. else. 'file text'=. , rv uv end.
  elseif. (<x) e. {OBJECTNC;DOCUMENT do.
    NB. edit object documentation text
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

0 rm y
:
if. badrc uv=. MACRO get y do. uv return. end.
uv=. rv uv

if. *./m=. JSCRIPT = ; 1 {"1 uv do.

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
  (jderr ERR0252),(-.m)#{."1 uv
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

NB. HARDCODE: option codes
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


setwwwbrowser=:3 : 0

NB.*setwwwbrowser v-- tests and sets the WWW browser.
NB.
NB. This  verb  performs simple tests on purported  browsers  and
NB. sets the first browser passing the test. This way you can set
NB. a preferred browser but also maintain some fall backs.
NB.
NB. monad:  clBrowser =. setwwwbrowser uuIgnore

if. IFWIN do.
  if.     fex <WWW0 do. WWW0
  elseif. fex <WWW1 do. WWW1
  elseif.do. ''
  end.
else.
  NB. linux browsers - should open with command lines like:
  NB.   chrominum-browser http://www.jsoftware.com
  WWW0linux
end.
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


wwwbrowser=:3 : 0

NB.*wwwbrowser v-- returns a www browser from available options.
NB.
NB. monad:  clBrowserExe =. wwwbrowser uuIngore

NB. prefer J's live configured browser otherwise take JOD's browser !(*)=. WWWBROWSER
if. wex<'WWWBROWSER__UT__JODobj' do. www=. WWWBROWSER__UT__JODobj else. www=.'' end.

NB. on Mac's use the open command to start a browser
if.     UNAME-:'Darwin'  do. www=. WWW0mac
elseif. wex<'Browser_j_' do. if. 0<#Browser_j_ do. www=. Browser_j_ end.  NB. J 7.0x
elseif. wex<'BROWSER_j_' do. if. 0<#BROWSER_j_ do. www=. BROWSER_j_ end.  NB. J 6.0x
end.
www
)