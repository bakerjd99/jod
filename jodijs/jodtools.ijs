NB.*jodtools c-- derived tools class: extension of (jodutil).
NB.
NB. Interface words:
NB.  addgrp   add words/tests to group/suite                                          
NB.  allnames combines names from (refnames) and (obnames)                            
NB.  allrefs  all names referenced by objects on name list                            
NB.  delgrp   remove words/tests from groups/suites                                   
NB.  getrx    get required to execute                                                 
NB.  hlpnl    displays short descriptions of objects on (y)                          
NB.  jodage   days since last change and creation of JOD objects
NB.  jodhelp   display online JOD help                     
NB.  lg       make and load JOD group                                                 
NB.  mls      make load script                                                                                               
NB.  noexp    returns a list of objects with no explanations                          
NB.  notgrp   words or tests from (y) that are not in groups or suites               
NB.  nt       gets name and text from edit windows                                    
NB.  nw       edit a new explicit word using JOD conventions                          
NB.  obnames  unique sorted object and locale names from (uses) result                
NB.  pr       put and cross reference a word - very handy as an editor DOCUMENTCOMMAND
NB.  refnames unique sorted reference names from (uses) result                        
NB.  revonex  returns a list of put dictionary objects with no explanations           
NB.  swex     set short word explaination from (doc) header                           
NB.  usedby   returns a list of words from (y) that DIRECTLY call words on (x)      
NB.
NB. Notes:
NB.   Error messages (jodtools range 00400-001000)

(9!:41) 0  NB. discard whitespace

coclass 'ajodtools'
coinsert  'ajodutil'
NB.*end-header

NB. jodage header text
AGEHEADER=:<;._1 '|Name|Date First put|Days from First put|Date Last put|Days from Last put'

NB. carriage return character
CR=:13{a.

NB. nw edit text template
DOCUMENTMARK=:123 126 78 126 125 61 58 32 123 126 67 126 125 32 58 32 48 10 10 78 66 46 42 123 126 78 126 125 32 123 126 84 126 125 45 45 32 119 111 114 100 116 101 120 116 10 78 66 46 10 78 66 46 32 109 111 110 97 100 58 32 32 123 126 78 126 125 32 63 63 10 78 66 46 32 100 121 97 100 58 32 32 63 63 32 123 126 78 126 125 32 63 63 10 10 39 78 73 77 80 32 123 126 78 126 125 39 10 41{a.


ERR00400=:'load script is not unique - edit startup.ijs ->'
ERR00401=:'tag error in startup.ijs file ->'
ERR00402=:'cannot write/create startup.ijs file ->'
ERR00403=:'invalid make load script option (0 or 1)'
ERR00404=:'J script error in group ->'
ERR00405=:'words refer to objects/locales ->'
ERR00406=:'invalid delimiter'
ERR00407=:'ROOTFOLDER must be a character list configured (jpath) expression like: ~user/jodroot'
ERR00408=:'unable to write load script ->'

NB. locgrp Group Suite display text
GROUPSUITES=:<;._1 ' Groups Suites'

NB. JODTOOLS interface - loaded into (ijod) - see (setjodinterface)
IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

NB. comment tag marking end of scripts
JODLOADEND=:'NB.</JOD_Load_Scripts>'

NB. comment tag marking start of scripts
JODLOADSTART=:'NB.<JOD_Load_Scripts>'

NB. JODTOOLS version, make and date
JODTOOLSVMD=:'0.9.996';42;'14 Oct 2018 14:10:30'

NB. line feed character
LF=:10{a.


OK00400=:'load script saved ->'
OK00401=:'file saved ->'
OK00402=:' added to ->'
OK00403=:' deleted from ->'
OK00404=:' group loaded'
OK00405=:' group loaded with postprocessor'
OK00406=:') words loaded into -> '

NB. postprocessor prefix
POSTAMBLEPFX=:'POST_'

NB. name of test used as a template
TESTSTUB=:'teststub'


WARNING00400=:'NB. WARNING: JOD managed section do not edit!'

NB. words tests display text
WORDTESTS=:<;._1 ' words tests'


addgrp=:4 : 0

NB.*addgrp v-- add words/tests to group/suite.
NB.
NB. monad:  clGroup addgrp blclNames
NB.         (clGroupSuite;iaObject) addgrp blclNames
NB.
NB.   'jodhlp' addgrp  ;:'addgrp delgrp'
NB.   ('testsuite';3) addgrp ;:'test and moretests'

'group code'=. 2{.(boxopen x),<2
uv0=. code grp group
if. 0=>{.uv0 do. uv0
elseif. 1=>{.uv0=.code grp (group;}.uv0),y=.boxopen y do.
  gtyp=.,>(code=2 3)#WORDTESTS
  ok ((":#y),' ',gtyp,OK00402);group NB. okmsg: added to
elseif.do. uv0
end.
)


addloadscript=:4 : 0

NB.*addloadscript  v--  inserts  (mls)  generated   scripts  into
NB. startup.ijs.
NB.
NB. Changed: 08jun12 this verb was modifying the scripts.ijs file
NB. in the  J system tree. This file is now frequently updated by
NB. JAL so startup.ijs is now modified.
NB.
NB. Changed:  11feb02 j  7.01  introduced Public_j_  in place  of
NB. PUBLIC_j_  modified   to   use  new  noun.   Path  separation
NB. characters also standardized.
NB.
NB. dyad:  baPublic addloadscript (clGroup ; clPathGroup)

NB. standardize path separation character
y =. jpathsep&.> y

if. 1=x do.

  NB. get startup.ijs
  NB. J path utility !(*)=. jpath
  tags=. JODLOADSTART;JODLOADEND
  if. fex<cfg=. jpath '~config/startup.ijs' do.
    scripts=. read cfg
    'p c'=. tags betweenidx scripts
  else.
    NB. no startup.ijs
    p=. scripts=. ''
  end.

  if. 1=#p do.
    if. badrc ld=. (;p{c) addloadscript1 y do. ld return. else. ld=.>1{ld end.
    NB. insure 'buildpublic' text starts with an LF
    mlscfg=. toHOST ;(<(LF }.~ LF-:{.ld),ld) p} c
  elseif. 0=#p do.
    NB. no JOD load scripts append current
    ld=. (0{tags),(<LF,'buildpublic_j_ 0 : 0',LF),(0{y),(<'  '),(1{y),(<LF,')',LF),1{tags
    mlscfg=. toHOST scripts , (2#LF), WARNING00400 , LF , ;ld
  elseif.do.
    NB. errmsg: tag error in startup.ijs file
    (jderr ERR00401),<cfg return.
  end.

  NB. create/update startup.ijs
  if. _1 -: mlscfg (write :: _1:) cfg do.
    NB. errmsg: cannot write/create startup.ijs file
    (jderr ERR00402),<cfg return.
  end.

  NB. directly update public script noun if present
  y=.  y ,&.> '';IJS
  if.     wex <'Public_j_' do. Public_j_=: Public_j_ updatepublic y  NB. J 7.0x
  elseif. wex <'PUBLIC_j_' do. PUBLIC_j_=: PUBLIC_j_ updatepublic y  NB. J 6.0x
  end.

  ok OK00400;1{y  NB. okmsg: load script saved
elseif. 0=x do.
  ok OK00401;(1{y) ,&.> <IJS NB. okmsg: file saved
elseif.do.
  NB. errmsg: invalid make load script option (0 or 1)
  jderr ERR00403
end.
)


addloadscript1=:4 : 0

NB.*addloadscript1 v-- appends or replaces a script in the load script section of startup.ijs
NB.
NB. dyad:  clJODLoadScripts addloadscript1 (clGroup ; clPath)

NB. insure we have text
if. 0=#x do. ok x return. end.

NB. cut into lines
ldl=. <;._1 ((LF={.x)}.LF),x -. CR

NB. search for group name - can occur at most once
NB. searches only group names ignoring path file text
msk=. (' '&beforestr &.> ldl) e. 0{y
if. 1 >: +/msk do.

  NB. load script name and path
  scr=. <;(<'  ') (1)} 1 0 1 #^:_1 y

  NB. if name exists replace it else add it at end
  if. +./msk do.
    ldl=. scr (I. msk)} ldl
  else.
    NB. find ) and insert before 
    msk=. 1 ,~ -. (ldl -.&.> ' ') e. <,')'
    ldl=. scr (I. -.msk)} msk #^:_1 ldl
  end.

  NB. return modified 
  ok }. ; LF ,&.> ldl
else.
  NB. errmsg: load script is not unique
  (jderr ERR00400),0{y
end.
)

NB. all names from uses:  allnames 31 uses 'name'
allnames=:~.@('__'&beforestr&.>@obnames , refnames)

NB. all nonlocale name references: allrefs ;:'return my references'
allrefs=:[: /:~ [: ~. ] , [: refnames 31&uses


betweenidx=:4 : 0

NB.*betweenidx v-- indexed sublists between nonnested delimiters.
NB.
NB. Cuts  up  lists   containing   balanced  nonnested  start/end
NB. delimiters into boxed lists of indexed sublists.
NB.
NB. Note:  this  verb does a simple count for  delimiter balance.
NB. This  is  a   necessary  but  not  sufficient  condition  for
NB. delimiter balance.
NB.
NB. dyad:  (ilIdx ;< blcl) =. (clStart;clEnd) betweenidx cl
NB.        (ilIds ;< blnl) =. (nlStart;nlEnd) betweenidx nl
NB.
NB.   ('start';'end') betweenidx 'start yada yada end boo hoo start ahh end'
NB.
NB.   '{}' betweenidx 'go{ahead}{}cut{me}{up}{}'
NB.
NB.   NB. also applies to numeric delimiters
NB.   (1 1;2 2) betweenidx 1 1 66 666 2 2 7 87 1 1 0 2 2

if. #y do.
  's e'=. x                      NB. start/end delimiters
  assert. -. s -: e              NB. they must differ
  em=. e E. y                    NB. end mask
  sm=. (-#s) |.!.0 s E. y        NB. start mask
  mc=. +/sm                      NB. middle count
  assert. mc=+/em                NB. delimiter balance
  c=. (1 (0)} sm +. em) <;.1 y   NB. cut list

  NB. insert any missing middles to insure all indexed
  NB. sublists correspond to a location in the cut list
  ex=. 1 #~ >: +: mc
  ex=. (-. sm {.;.1 em) (>: +: i. mc)} ex
  c=. ex #^:_1 c

  ((# i.@#) (#c)$0 1);<c         NB. prefix indexes
else.
  (i.0);<y                       NB. empty arg result
end.
)


createjodtools=:3 : 0

NB.*createjodtools v-- initializes new jod tools object
NB.
NB. monad:  createjodtools blclObjects
NB.
NB.   JODtools_ijod_=: conew 'ajodtools'        NB. new tools object
NB.   createjodtools__JODtools JODtools,JODobj  NB. pass self and tools

NB. use JOD object reference to locate extant subobjects
NB. Note: currently these object references are not used
NB. but are defined so that native JOD words can be accessed
NB. by words in JODtools instances in future additions to this class
NB. !(*)=. ST MK UT SO
self=.0{y [ jod=.1{y
ST=:ST__jod
MK=:MK__jod
UT=:UT__jod
SO=:SO__jod

NB. append object reference to list of JOD extensions
NB. adding to this list allows (destroyjod) to destroy
NB. all JOD extension objects with JOD core objects
JODEXT__jod=: JODEXT__jod,self

NB. add tool words to overall JOD (ijod) locale interface
NB. (*)=. IZJODALL JODEXT
IZJODALL__jod=: IZJODALL__jod,IzJODtools,<'JODtools'

NB. define direct (ijod) locale interface for tools - if the (ijod)
NB. trap word (jodsf) exists define an error trapping interface
(i.0 0)"_ ".&.> self defzface IzJODtools
)


dayage=:3 : 0

NB.*dayage v-- age in days.
NB.
NB. monad:  dayage ilYYYYMMDD
NB.
NB.   dayage 1953 7 2
NB.
NB. dyad:  pa dayage iaYYYYMMDD | iuYYYYMMDD
NB.
NB.   1 dayage 4 4$20000101 19500202 19000303
NB.   0 dayage 1986 8 14

0 dayage y
:
if. x do. n=. today~ 0 else. n=. today 0 end.
(x todayno n) - x todayno y
)


delgrp=:4 : 0

NB.*delgrp v-- remove words/tests from groups/suites.
NB.
NB. monad:  clGroup delgrp blclNames
NB.         (clGroupSuite;iaObject) delgrp blclNames
NB.
NB.   'jodhlp' delgrp  ;:'addgrp delgrp'
NB.   ('testsuite';3) delgrp ;:'test and moretests'

'group code'=. 2{.(boxopen x),<2
uv0=. code grp group
if. 0=>{.uv0 do. uv0
elseif. 1=>{.uv0=.code grp group;}.uv0-.y=.boxopen y do.
  gtype=.,>(code=2 3)#WORDTESTS
  ok ((":#y),' ',gtype,OK00403);group NB. okmsg: deleted from
elseif.do. uv0
end.
)


firstcomment=:3 : 0

NB.*firstcomment v-- extracts the first comment sentence from J words.
NB.
NB. monad:  firstcomment clLinear
NB.
NB.   firstcomment 5!:5 <'firstcomment'
NB.   firstcomment disp 'jodword'
NB.
NB.   NB. first comments from many JOD non-nouns
NB.   n=. (}. grp 'JOD') -. 0 1 0 dnl''
NB.   t=. 1 pick 0 8 get n
NB.   n=. ({."1 t) #~  0= #&> {:"1 t
NB.   d=. 1 pick 0 10 get n
NB.   c=. n ,. firstcomment&.> 2{"1 d

NB. char table of just comment text
comtext=. 3 }."1 ljust onlycomments ];._2 (y-.CR),LF

NB. drop text below any monad and dyad marks
mask=. +./"1 ((,:MONADMARK) E. comtext) +. (,:DYADMARK) E. comtext
comtext=. ,' ' ,. comtext #~  -. +./\ mask

NB. take the first comment to end with a '.'
NB. excluding any J argument strings, eg. x. y.
NB. NIMP may not hold in j 6.01
comtext=. reb comtext {.~ firstperiod comtext
if. #comtext do.

  NB. trim scriptdoc style headers if any
  if. '*'={.,comtext do.
    alltrim '--' afterstr comtext
  end.

end.
)


firstperiod=:3 : 0

NB.*firstperiod v-- returns the index of first sentence period.
NB. J arguments m. n. x. y. u. v. are excluded.
NB.
NB. monad:  firstperiod cl
NB.
NB.   firstperiod 'not here {m. or here [u. or here (x.) or here u. but here. Got that'

NB. mask out J arguments in at most first 500 chars
y=. (500<.#y){.y
args=. ;&.> , { (<<"0' ([{'),<;:'m. n. x. y. u. v. *.'
y=.' ' (I. _2  (|. !. 0) +./ args E.&> <y)} y

NB. first period after masking
y i. '.'
)

NB. first document sentence
fsen=:] ; [: firstcomment disp


getrx=:3 : 0

NB.*getrx v-- get required to execute. (getrx) gets all the words
NB. required to execute words on (y).
NB.
NB. Warning:  if  the words listed on  (y)  refer to  object  or
NB. locale references  this verb  returns  an  error because such
NB. words generally cannot be run out of context.
NB.
NB. monad:  getrx clName | blclNames
NB.
NB.   NB. loads words into base locale
NB.   getrx 'stuffineed'
NB.   getrx ;:'stuff we words need to run'
NB.
NB. dyad:  clLocale getrx clName | blclNames
NB.
NB.   'targetlocale' getrx ;:'load the stuff we need into locale'

'base' getrx y
:
if. badrc uv0=. 31 uses y do. uv0
NB. errmsg: words refer to objects/locales
elseif. #uv1=. obnames uv0 do. (jderr ERR00405),uv1
elseif. uv0=.~.({."1 >{:uv0),refnames uv0
        badrc uv1=. x get uv0 do. uv1
elseif.do.
  ok '(',(":#uv0),OK00406,x
end.
)


hlpnl=:3 : 0

NB.*hlpnl v-- displays short descriptions of objects on (y)
NB.
NB. monad:  hlpnl clName | blclNames
NB.
NB.   hlpnl refnames uses 'explainmycalls'
NB.
NB. dyad:  iaObject hlpnl clName|blclNames
NB.
NB.   2 hlpnl }.grp''

0 hlpnl y
:
if. empdnl y do. ok ''
elseif. 0=>{.uv0=. (x,EXPLAIN) get y do. uv0
elseif.do.
  uv0=.>{:uv0
  (>{."1 uv0) ; >{:"1 uv0
end.
)


jodage=:3 : 0

NB.*jodage  v--  days  since  last  change  and creation  of  JOD
NB. objects.
NB.
NB. monad:  jodage cl | blcl
NB.
NB.   jodage 'jodage'
NB.   jodage }. dnl 're'
NB.
NB. dyad:  iaCode jodage cl | blcl
NB.
NB.   2 jodage }. grp''

0 jodage y
:
if. badil x do. jderr ERR001
elseif. y=. ,boxopen y
        badrc changed=. (({.x),14) get y do. changed
elseif. badrc created=. (({.x),13) get y do. created
elseif.do.
  g=. /:daychanged=. <.,.1 dayage <.changed=. rv changed
  daycreated=. ,.<.1 dayage <.created=. rv created
  NB. header=. ;:'name changed created datechanged datecreated'
  header=. AGEHEADER
  NB. header ,: (<g) {&.> (>y);daychanged;daycreated;(,.changed);<,.created
  ok<header ,: (<g) {&.> (>y);(,.created);daycreated;(,.changed);<daychanged
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


locgrp=:3 : 0

NB.*locgrp v-- list groups and suites with name.
NB.
NB. monad:  locgrp clName
NB.
NB.   locgrp 'dd'

NB. get group and suite names
gs=. 2 3 dnl&.> <''
if. *./ m=. ; {.&> gs do.
  gs=. }.&.> gs
  gnl=. 2 3 }.@:grp &.> &.> gs
  m=. gnl (+./@:e.)&>&.> <<<,y
  ok <GROUPSUITES ,. m#&.> gs
else.
  >{. (-.m) # &.> gs
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


noexp=:3 : 0

NB.*noexp v-- returns a list of objects with no explanations.
NB.
NB. monad:  noexp zl|clPattern
NB.
NB.   noexp ''  NB. words without short explanations
NB.
NB. dyad:  iaCode noexp zl | clPattern
NB.
NB.   2 noexp 'jod'       NB. groups without explanations
NB.   (i.5) noexp"0 1 ''  NB. all objects without explanations

0 noexp y
:
if. badrc uv=.x dnl y do. uv
elseif. a: e. uv       do. ok ''
elseif. badrc uv=. (({.x),EXPLAIN) get }.uv do. uv 
elseif. 0=#uv=. rv uv  do. ok''
elseif.do.
 ok (0 = #&> {:"1 uv) # {."1 uv
end.
)


notgrp=:3 : 0

NB.*notgrp v-- words or tests from (y) that are not in groups or
NB. suites. Useful for finding loose ends and dead code.
NB.
NB. monad:  notgrp blcl
NB.
NB.   notgrp }. revo ''     NB. recent ungrouped words
NB.
NB. dyad:  iaObject notgrp blcl
NB.
NB.   2 notgrp }. dnl ''    NB. ungrouped words
NB.   3 notgrp }. 1 dnl ''  NB. tests that are not in suites

GROUP notgrp y
:
if. badrc y=. checknames y do. y return. end.
y=. }. y
select. x
  case. GROUP do. ok y -. ; grp&.> }. GROUP dnl ''
  case. SUITE do. ok y -. ; SUITE grp&.> }. SUITE dnl ''
  case.do. jderr ERR001
end.
)


nt=:3 : 0

NB.*nt v-- edit a new test script using JOD conventions.
NB.
NB. This  verb  looks   for  (TESTSTUB)  on  the  path   of  open
NB. dictionaries allowing easy user defined test script formats.
NB.
NB. monad:  nt clName
NB.
NB.   nt 'scriptname'
NB.
NB. dyad:  clSreps nt clName
NB.
NB.   NB. the dyad allows more general string
NB.   NB. replacements to be applied to stubs
NB.
NB.   '#{{boo}}#<<newboo>>#{{hoo}}#??newhoo??' nt 'newscript'

'' nt y
:
if. badcl y do. jderr ERR002 return. end. NB. errmsg: invalid name(s)
if. badcl x do. jderr ERR001 return. end. NB. errmsg: invalid option(s)
name=. y -. ' ' [ dl=. {. x,'/'

NB. HARDCODE: invalid delimiters 
if. dl e. '{}~ADST' do. jderr ERR00406 return. end. NB. errmsg: invalid delimiter

NB. get teststub document from open dictionaries
'r s'=.2{.t=. 1 get TESTSTUB
if. r do.
  'datess timess'=.yyyymondd 0
  shortdate=. 2 }. datess
  test=. dl,'{~T~}',dl,name,dl,'{~D~}',dl,datess,dl,'{~SD~}',dl,shortdate
  NB. insert any visible cl !(*)=. CLASSAUTHOR
  NB. NOTE: nouns in locale (ijod) are visible here
  if. wex <'CLASSAUTHOR' do.
    NB. (CLASSAUTHOR) is a cl without (dl)
    if. (-.badcl CLASSAUTHOR) *. -.dl e. CLASSAUTHOR do. test=. test,dl,'{~A~}',dl,CLASSAUTHOR end.
  end.
  name et (test,x) changestr >1{,s
else.
  t
end.
)


nw=:3 : 0

NB.*nw v-- edit a new explicit word using JOD conventions.
NB. 
NB. monad:  nw clWord
NB.   
NB.   nw 'verb'
NB.
NB. dyad:  iaClass nw clWord 
NB.
NB.   1 nw 'adverb'

3 nw y  
:
name=. y -. ' '
if. -.x e. i. 5 do. x=.3 end.
class=. x{'nacvv'

NB. user defined post proc !(*)=. DOCUMENTCOMMAND
if. 0= (4!:0) <'DOCUMENTCOMMAND' do.
  word=.DOCUMENTMARK,LF,LF,DOCUMENTCOMMAND
else.
  word=.DOCUMENTMARK
end.

reps=. '/{~N~}/',(y-.' '),'/{~C~}/',(":x),'/{~T~}/',class 
word=. reps changestr word
name et word
)

NB. object/locale names from uses:  allnames 31 uses 'name'
obnames=:[: /:~ [: ~. [: ; 2: {"1 [: > {:


onlycomments=:3 : 0

NB.*onlycomments v-- removes all J code leaving comments.
NB.
NB. monad:	ct =. onlycomments ctJcode
NB.
NB.   onlycomments jcr 'onlycomments'  NB. self comments

NB. mask of unquoted comment starts
c =. ($y)$'NB.' E. ,y
c =. -. +./\"1 c > ~:/\"1 y e. ''''
y =. ,y

NB. blank out code
y =. ' ' ((,c)# i. # y)} y
y =. y $~ $c
y #~ y +./ . ~: ' '  NB. remove blank rows
)

NB. put and cross reference word
pr=:0&globs ,:~ put

NB. referenced nonlocale names from uses:  allnames 31 uses 'name'
refnames=:[: /:~ [: ~. [: ; 1: {"1 [: > {:


revonex=:3 : 0

NB.*revonex v-- returns a  list of put dictionary objects with no
NB. explanations.
NB.
NB. This verb is  similiar to (noexp) except it only searches put
NB. dictionary objects and (noexp) searches the entire path.
NB.
NB. monad:  revonex zl | clPattern
NB.
NB.   revonex ''  NB. put dictionary words without short explanations
NB.
NB. dyad:  iaCode revonex zl|clPattern
NB.
NB.   2 revonex 'jod'       NB. put dictionary groups without explanations
NB.   (i.5) revonex"0 1 ''  NB. all put dictionary objects without explanations

/:~ 0 revonex y
:
if. badrc uv=./:~ x revo y do. uv
elseif. a: e. uv  do. ok ''
elseif. badrc uv=. (({.x),EXPLAIN) get }.uv do. uv 
elseif. 0=#uv=. rv uv  do. ok ''
elseif.do.
 ok (0 = #&> {:"1 uv) # {."1 uv
end.
)


today=:3 : 0

NB.*today v-- returns todays date.
NB.
NB. monad:  ilYYYYMMDD =. today uu
NB.
NB.   today 0    NB. ignores argument
NB.
NB. dyad:  iaYYYYMMDD =. uu today uu
NB.
NB.   0 today 0

3&{.@(6!:0) ''
:
0 100 100 #. <. 3&{.@(6!:0) ''
)


todayno=:3 : 0

NB.*todayno v-- convert dates to day numbers, converse  (todate).
NB.
NB. WARNING: valid only for  Gregorian dates after  and including
NB. 1800 1 1.
NB.
NB. monad:  todayno ilYYYYMMDD
NB.
NB.   dates=. 19530702 19520820 20000101 20000229
NB.   todayno 0 100 100 #: dates
NB.
NB. dyad:  pa todayno itYYYYMMDD
NB.
NB.   1 todayno dates

0 todayno y
:
a=. y
if. x do. a=. 0 100 100 #: a end.
a=. ((*/r=. }: $a) , {:$a) $,a
'y m d'=. <"_1 |: a
y=. 0 100 #: y - m <: 2
n=. +/ |: <. 36524.25 365.25 *"1 y
n=. n + <. 0.41 + 0 30.6 #. (12 | m-3),"0 d
0 >. r $ n - 657378
)


updatepublic=:4 : 0

NB.*updatepublic v-- updates public scripts table.
NB.
NB. dyad:  btcl =. btclPublic updatepublic blNamePath
NB.
NB.   Public_j_ updatepublic 'name';'c:/where/the/script/things/are.ijs'

p=. (0 {"1 x) i. 0{y
if. p<#x do.
  NB. update entry
  x=. y p} x
else.
  NB. new entry - sort public scripts
  x=. x , y
  x=. (/:0 {"1 x){x
end.
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
  names=. boxopen x
  NB. search object and locale references if _ occurs in any name
  col=. >: +./ '_'&e.&> names
  ok /:~ ({."1 uv) #~  ; (col {"1 uv) +./@e.&.> < names
end.
)


yyyymondd=:3 : 0

NB.*yyyymondd v-- today in (yyyymondd;hrmnss) format.
NB.
NB. Yet another date format verb. We can never have enough!
NB.
NB. monad:  (clDate ; clTime) =. yyyymondd uuIgnore

fmt=.'r<0>2.0'
months=. _3 [\ '   janfebmaraprmayjunjulaugsepoctnovdec'
'yy mn dd'=. 3{.now=. 6!:0''
date=. (":yy),(mn{months),,fmt (8!:2) dd
time=. }.;':' ,&.> fmt (8!:0) _3 {. now
date;time
)