NB.*jodstore c-- storage object class: extension of (jod).
NB.
NB. Hides the underlying database/file system used to store
NB. dictionary objects. Replacing this class is all that's
NB. required to change the dictionary storage system.
NB.
NB. Verb interface:
NB.   checkopen    checks if any dictionary is open
NB.   checkpath    checks current path against dictionary path
NB.   checkput     checks if first path dictionary is a put dictionary
NB.   closedict    closes dictionaries
NB.   createst     initializes storage objects
NB.   defwords     define words
NB.   delstuff     delete objects
NB.   didstats     dictionary statistics and path information
NB.   dnlsearch    search for name patterns
NB.   getdocument  get object documentation
NB.   getexplain   get short object explanations
NB.   getgstext    get group and suite script text
NB.   getntstamp   get name, creation and last put timestamps
NB.   getobjects   get objects
NB.   getrefs      get references
NB.   gslistnl     group and suite name lists
NB.   inputdict    test for objects in put dictionary
NB.   invappend    append inverted data
NB.   invdelete    delete inverted data
NB.   invfetch     fetch inverted data
NB.   invreplace   update inverted data
NB.   newregdict   create new or register dictionary
NB.   opendict     open a dictionary
NB.   pathnl       path name lists
NB.   putexplain   store short object explanations
NB.   putgs        store groups and suites
NB.   putntstamp   store name, creation and last put timestamps
NB.   puttable     store (name,text) and (name,class,text) tables
NB.   puttexts     store object documentation and group/suite texts
NB.   putwords     store words
NB.   putwordxrs   store word global references
NB.
NB. Notes:
NB.   Error messages (jodstore range 050-149)

coclass  'ajodstore'
coinsert 'ajod'

NB.*dependents x-- JODstore dependent defintions

CNMARK=:0      NB. file component: count and timestamp mark
CNLIST=:4      NB. file component: main object index list
CNCOMPS=:5     NB. file component: main object component list

NB. main directory file component list
CNDIR=:CNMARK,CNLIST,CNCOMPS

CNCLASS=:6     NB. file component: word name class or macro type
CNCREATION=:8  NB. file component: when object was first created
CNDICDOC=:2    NB. file component: dictionary documentation - (regd)
CNEXPLAIN=:11  NB. file component: short explanations
CNPARMS=:3     NB. file component: dictionary parameters
CNPUTDATE=:7   NB. file component: last time object was (put)
CNREF=:5+i.2 2 NB. reference component table
CNRPATH=:19    NB. file component: reference path - (didnum) list
CNSIZE=:9      NB. file component: size of object in bytes

NB. inverted group and suite data file components
INVGROUPS=: CNPUTDATE,CNCREATION,CNEXPLAIN
INVSUITES=: INVGROUPS

NB. inverted macro and word data file components
INVMACROS=: CNCLASS,CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN
INVWORDS=:  INVMACROS

NB. inverted test data
INVTESTS=: CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN 

NB. trim right (trailing) path delimiters !(*)=. PATHDEL
rpdtrim=:] #~ [: -. [: *./\. PATHDEL"_ = ]

NB.*enddependents
NB.*end-header

NB. initial documentation list: latex ; html ; text
DOCINIT=:<;._1 '   '


ERR050=:'no dictionaries open'
ERR051=:'not a put dictionary ->'
ERR052=:'unable to initialize ->'
ERR053=:'word(s) do not exist ->'
ERR054=:'unable to load directory'
ERR055=:'directory-data inconsistency'
ERR056=:'jfile replace failure'
ERR057=:'directory update failure'
ERR058=:'jfile append failure'
ERR059=:'full rooted path required'
ERR060=:'unable to create directory ->'
ERR061=:'invalid dictionary name;path[;documentation]'
ERR062=:'invalid characters in name'
ERR063=:'invalid characters in path'
ERR064=:'target drive is required'
ERR065=:'not enough space on drive/volume ->'
ERR066=:'dictionary name in use'
ERR067=:'unable to create subdirectories'
ERR068=:'unable to setup dictionary file(s)'
ERR069=:'error updating master'
ERR070=:'request exceeds open limit'
ERR071=:'already open ->'
ERR072=:'another task opened read/write ->'
ERR073=:'missing dictionary file(s) ->'
ERR074=:'cannot read dictionary parameters ->'
ERR075=:'unable to open directory ->'
ERR076=:'master-dictionary inconsistency - try (dpset) ->'
ERR077=:'unable to update master'
ERR079=:'unable to load references'
ERR080=:'not open ->'
ERR081=:'path mismatch'
ERR082=:'unable to set reference path'
ERR083=:'not on path ->'
ERR084=:'unable to read data'
ERR085=:'words(s) not defined ->'
ERR086=:'not in put dictionary ->'
ERR087=:'nothing in put dictionary'
ERR088=:'jfile read failure'
ERR089=:'text(s) to long'
ERR090=:'file offset invalid'
ERR091=:'definition failure'
ERR092=:'duplicate dictionary id number'
ERR093=:'directory damaged'
ERR094=:'exceeds locale symbol table size - no words defined'
ERR095=:'dictionary file attributes do not allow read/write ->'
ERR096=:'linux/unix dictionary paths must be / rooted ->'
ERR097=:'invalid dictionary document must be character list'
ERR098=:'master/dictionary file path mismatch - name/DIDNUM ->'
ERR099=:'invalid name/creation/lastput table'
ERR100=:'name/creation/lastput length mismatch'
ERR101=:'invalid date(s) name/creation/lastput table'

NB. name.n or name.name separator character
NDOT=:'.'

NB. directory and reserved components in *.ijf files
OFFSET=:39


OK050=:'dictionary created ->'
OK051=:' word(s) put in ->'
OK052=:'opened ('
OK054=:'closed ->'
OK055=:' explanation(s) put in ->'
OK056=:' references put in ->'
OK057=:'(s) put in ->'
OK058=:'dictionary registered ->'
OK059=:'put in ->'
OK060=:' word(s) defined'
OK061=:'(s) deleted from ->'
OK062=:'dictionary document updated ->'
OK063=:'(DOCUMENTDICT = 0) - dictionary document not updated ->'
OK064=:') timestamps updated - ('
OK065=:') not in put ->'

NB. path report title
PATHTIT=:'Path*'

NB. visible read status text
READSTATS=:<;._1 ' ro rw'

NB. retains string (y) after last occurrence of (x)
afterlaststr=:] }.~ #@[ + 1&(i:~)@([ E. ])

NB. contains string in lists of list of names
allnlctn=:[ /:~@:nlctn&.> [: < ]

NB. match prefixes in lists of lists of names - (pathnl) related
allnlpfx=:[ /:~@:nlpfx&.> [: < ]

NB. match suffixes in lists of lists of names
allnlsfx=:[ /:~@:nlsfx&.> [: < ]


apptable=:4 : 0

NB.*apptable v-- appends (name,text) and (name,class,text) tables to file.
NB.
NB. dyad:  bl apptable bt

'ttype ixn cnn fp DL'=. x  NB. directory object !(*)=. DL
sizes=. #&> {:"1 y         NB. sizes
pf=. PUTFACTOR__DL

NB. words and macros have class or type
if. wmt=. ttype e. WORD,MACRO do. class =. ; 1 {"1 y end.

texts=. y
cnall=. i.0
y=. {."1 y   NB. no longer required

while. #texts do.
  cnt=. pf <. #texts
  tn=.  cnt {. texts

  un0=. <"1 tn
  un1=. <"1 ({."1 tn) ,"0 1 DOCINIT

  if. badappend cn=. (, un0 ,. un1) jappend fp do.
    jderr ERR058 return.  NB. errmsg: append failure
  else.
    cnall=. cnall , fod cn
  end.

  texts=. cnt }. texts
end.

NB. append directory and inverted lists
msg=. ERR057  NB. errmsg: directory update failure
if. (tc=. #y) ~: #cnall do. jderr msg return. end.

stamp=. tc#nowfd now ''
un0=. stamp;stamp;sizes;<tc#a:
un1=. CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN

if. wmt do.
  dropnc__DL ttype  NB. force class reload
  un0=. class;un0
  un1=. CNCLASS,un1
end.

if. badrc msg=. un0 invappend fp;un1 do. msg
else.
  NB. update directory
  y=.    (".ixn) , y
  cnall=. (".cnn) , cnall
  if. badrc (ttype,fp) savedir__DL y;cnall do. jderr msg else. ok tc end.
end.
)


appwords=:4 : 0

NB.*appwords v-- appends new words in blocks of (PUTFACTOR).

'loc DL'=. x  NB. directory object !(*)=. DL
wp=. WP__DL [ pf=. PUTFACTOR__DL
names=. y
lnames=. y ,&.> locsfx loc
size=. class=. cnall=. i.0

while. #names do.
  cnt=. pf <. #names
  wn=.  cnt {. names [ lwn=. cnt {. lnames
  val=. wrep&.> lwn   NB. word values
  bsz=. #&> val       NB. NIMP word byte sizes (size testing)
  bnc=. nc lwn
  un0=. <"1 wn ,. (<"0 bnc) ,. val
  un1=. <"1 wn ,"0 1 DOCINIT

  NB. append words
  if. badappend cn=. (, un0 ,. un1) jappend wp do.
    jderr ERR058 return.  NB. errmsg: append failure
  else.
    cnall=. cnall , fod cn
    size=.  size , bsz
    class=. class , bnc
  end.

  names =. cnt }. names [ lnames =. cnt }. lnames
end.

NB. append directory and inverted lists
msg=. ERR057  NB. errmsg: directory update failure
if. (#y) ~: #cnall do. jderr msg return. end.
wc=. #y  NB. number of words

stamp=. wc#nowfd now ''
un0=. class;stamp;stamp;size;<wc#a:
un1=. CNCLASS,CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN NB. NIMP word append
if. badrc msg=. un0 invappend wp;un1 do. msg
else.
  NB. update word directory
  y=.    WORDIX__DL , y
  cnall=. WORDCN__DL , cnall
  if. badrc (WORD,wp) savedir__DL y;cnall do. jderr msg else. ok wc end.
end.
)

NB. bad jfile components - first names do not match list
badcn=:[: -. [ -: [: {.&> ]


bnlsearch=:4 : 0

NB.*bnlsearch  v-- searches put dictionary backup name  lists for
NB. simple character list patterns.
NB.
NB. dyad: ilObjOptNc dnlsearch (clPattern ; clDir)

NB. put dictionary directory object
DL=. {:0{DPATH

NB. if y is '.' (NDOT) return backup suffixes
if. (,NDOT)-:alltrim y do.
 dot=. (0<#bn=. bnums BAK__DL){'';NDOT
 ok dot ,&.> 'r<0>0.d' 8!:0 bn
else.
 ok 'NIMP bnlsearch'
end.
)


bnums=:3 : 0

NB.*bnums  v--  returns unique backup ordered list  of dictionary
NB. backup numbers.
NB.
NB. monad:  il =. bnums clPath
NB.
NB.   bnums BAK NB. (BAK) directory object noun

NB. requires first character of all (JDFILES) to be the same
\:~ ~. , ". ({.;JDFILES)&beforestr&> {."1 (1!:0) <y,'*',IJF
)


checkntstamp=:3 : 0

NB.*checkntstamp v--  checks name, creation  and  last  put  date
NB. arrays.
NB.
NB. The boxed timestamp array fetched  by the _14 option of (get)
NB. is one of the most complex and idiosyncratic JOD results. The
NB. layout was  motivated by  the  need  to  serialize  timestamp
NB. information so that dump scripts might  preserve the creation
NB. and last put date of objects.
NB.
NB. monad:  checkntstamp btNts
NB.
NB.   'rc nts'=. 0 _14 get }. dnl ''
NB.   checkntstamp__ST__JODobj nts

msg=. ERR099 NB. errmsg: invalid name/creation/lastput table
if. badbu y do. jderr msg
elseif. -.2 1 -: $y      do. jderr msg
elseif. badfl uv=. ;1{y  do. jderr msg
elseif. (2 ~: #$uv) +. 2 ~: #uv  do. jderr msg
NB. errmsg: name creation/lastput length mismatch
elseif. ~:/ {:@$&> y  do. jderr ERR100
NB. creation must precede or equal last put
elseif. 0 e. <:/ uv   do. jderr msg
elseif. badrc tn=. checknames ;0{y  do. jderr msg
NB. timestamp names must be unique 
elseif. badunique tn=. }.tn  do. jderr msg
NB. dates are in fractional day yyyymmdd.fd format
NB. check that floored numbers are actual Gregorian dates
NB. errmsg: invalid date(s) name/creation/lastput table
elseif. 0 e. valdate datefrnum ,uv  do. jderr ERR101
elseif.do. ok < (<tn) (<0;0)} y  NB. insures deblanked names
end.
)


checkopen=:3 : 0

NB.*checkopen v-- are any dictionaries open?
NB.
NB. monad:  checkopen uuIgnore

if. #DPATH do. OK else. jderr ERR050 end. NB. errmsg: no dictionaries open
)


checkpath=:3 : 0

NB.*checkpath  v-- returns  ok  if the current  path matches  the
NB. current   dictionary's  reference   path.  Path  matching  is
NB. critical to the integrity of groups and suites.
NB.
NB. monad:  checkpath bacl
NB.
NB.   checkpath <'6'   NB. directory object reference

DL=. y  NB. directory object !(*)=. DL
rpath=. ,RPATH__DL
dpath=. ,> 1 {"1 DPATH

if. #rpath do.
  if. rpath -: dpath do. OK else. jderr ERR081 end. NB. errmsg: path mismatch
else.

  NB. dictionary path empty save current path and return ok
  if. badreps (<dpath) jreplace UF__DL;CNRPATH do.
    jderr ERR082 NB. errmsg: unable to set reference path
  else.
    RPATH__DL=: dpath
    OK
  end.

end.
)


checkput=:3 : 0

NB.*checkput  v--  is  the  first  path  dictionary a  read/write
NB. dictionary?
NB.
NB. monad:  checkput uuIgnore

if. #DPATH do.
  DL=. 3{0{DPATH  NB. directory object !(*)=. DL

  NB. return directory object reference or errmsg: not a put dictionary
  if. RW__DL do. ok DL else. (jderr ERR051),<DNAME__DL end.
else.
  jderr ERR050
end.
)


closedict=:4 : 0

NB.*closedict v-- closes dictionaries. Dictionary names have been
NB. validated prior to calling this verb. Destroys  all directory
NB. objects. The state  of directories on file are maintained  by
NB. other verbs. So no directory updating is required here.
NB.
NB. monad:  closedict blclDictionary
NB.
NB.   closedict 'd0';'d1'   NB. close di

NB. close request seems valid - mark master
if. badrc msg=. markmast 1 do. msg return. end.

NB. destroy open directory objects
uv=. ({."1 DPATH) e. y
if. +./uv do.
  coerase"0 uv#{:"1 DPATH
  DPATH=: DPATH #~ -. uv
else.
  (jderr ERR080),<y NB. errmsg: not open
end.

NB. update master open status and release
x=. > x
uv=. (0{x) i. y
x=. < (<0) (<3;uv)} x
if. badreps x jreplace JMASTER;CNMFTAB do.
  jdmasterr ERR077  NB. errmsg: unable to update master
elseif. badrc msg=. markmast~0  do. msg
elseif. do. (ok OK054),y
end.
)


createst=:3 : 0

NB.*createst v-- storage object creation verb. (y) is the object
NB. locale reference returned by (conew).
NB.
NB. monad: createst uuIgnore
NB.
NB.   createst__ST ST;MK;UT;<SO

NB. object references !(*)=. JOD ST MK UT SO
'JOD ST MK UT SO'=: y

NB. word and macro type/name class codes !(*)=. HASTYPE
HASTYPE=: (i. 4),MACROTYPE

NB. brand storage object with unique id !(*)=. JODOBID
saveobid JODOBID=: didnum 0

NB. inverted data/code component cross reference !(*)=. INCNXR
uv=. CNCLASS,CNCREATION,CNPUTDATE,CNSIZE
1 [ INCNXR=: (INCLASS,INCREATE,INPUT,INSIZE) ,: uv
)


defwords=:4 : 0

NB.*defwords v-- fetches and defines words.
NB.
NB. dyad:  bacl defwords blcl
NB.
NB.   (<'base') defwords ;:'please define my words'

if. badrc y=. checknames y do. y return. end.
wrds=. y=. }.y

NB. if all words are not on path get nothing
if. badrc wnl=. pathnl WORD do. wnl return. end.
wnl=. }. wnl

NB. errmsg: exceeds symbol table limit for locale
if. SYMBOLLIM <: #wnl do. jderr ERR094 return. end.

NB. remove any empty dictionaries from path
b=.   0&<@:#&> wnl
wnl=. b#wnl [ dpath=. b#DPATH

if. *./b=. y e. ; wnl do.

  loc=. locsfx x

  NB. run down the path fetching the first word occurrences
  for_dp. wnl do.
    ix=. (dp=. >dp) i. y

    NB. if any words in current dictionary load them
    if. +./wf=. ix<#dp do.
      if. badrc msg=. (wf#ix) loadwords loc,{:dp_index{dpath do.
        msg return.
      end.

      NB. remove fetched words from list quit if no more words
      if. 0=#y=. (-.wf)#y do. break. end.
    end.
  end.

  NB. test name class of fetched words
  if. 1&e. b=. 0&> nc wrds=. wrds,&.>loc do.
    (jderr ERR085),b#wrds NB. errmsg: words(s) not defined
  else.
    ok (":#b),OK060
  end.

else.
  (jderr ERR083),(-.b)#y NB. errmsg: not on path
end.
)


delstuff=:4 : 0

NB.*delstuff v-- deletes words, tests, groups, suites and macros
NB.
NB. dyad:  (iaObject ; il ; bacl) delstuff blcl
NB.
NB.   cn =. CNPUTDATE,CNCREATION,CNEXPLAIN
NB.   (GROUP;cn;<DL) delstuff ;:'we groups are toast'

'obj cn DL'=. x  NB. directory object !(*)=. DL

if. badrc y=. checknames y do. y
elseif. loaddir__DL obj do.
  jderr ERR054 NB. errmsg: unable to load directory
elseif. #ix =.".(>dnix__DL obj),'__DL' do.

  oc=. +/b=. ix e. y=. ~.}.y

  if. oc ~: #y do.
    (jderr ERR086),(-.y e. ix)#y NB. errmsg: not in put dictionary
    return.
  end.

  list=. (b=. -.b)#ix
  comp=. b#".(in=. >dncn__DL obj),'__DL'
  fp=. dfopen__DL in=. {.in

  NB. remove old inverted data from object
  dropinv__DL 0

  NB. delete from inverted lists and main directory
  if. badrc msg=. b invdelete fp;cn do.
    msg [ dfclose__DL in return.
  elseif. badrc msg=. (obj,fp) savedir__DL list;comp do.
    msg [ dfclose__DL in return.
  end.

  NB. remove any put dictionary word references
  if. WORD=obj do.
    if. badrc msg=. DL delwordrefs y do. msg [ dfclose__DL in return. end.
  end.

  dfclose__DL in
  msg=. ' ',>dnnm__DL obj
  (ok (": oc),msg,OK061),<DNAME__DL

elseif.do.
  jderr ERR087 NB. errmsg: nothing in put dictionary
end.
)


delwordrefs=:4 : 0

NB.*delwordrefs  v--  deletes  word  references.  Word  reference
NB. deletion is required when deleting words to insure that words
NB. do not leave  "reference shadows." A reference  shadow occurs
NB. when  a  word  with  references  is  deleted and  moved to  a
NB. dictionary further down  on the path. The reference reporting
NB. mechanism picks  up  the shadow and never fetches the  actual
NB. reference list. Words are the  only  JOD  objects with stored
NB. references.
NB.
NB. dyad:  ba delwordrefs blclWords

DL=. x NB. directory object !(*)=. DL

NB. errmsg: unable to load references
if. loadref__DL WORD do. jderr ERR079
elseif.do.

  NB. find any references to deleted words
  uv=. WORDREFIX__DL e. y
  if. +./uv do.

    dfopen__DL 'U'
    fp=. UP__DL

    NB. remove any references from put dictionary
    uv1=. (uv=. -.uv)#WORDREFIX__DL
    uv2=. uv#WORDREFCN__DL

    NB. update reference directory and close
    if. badrc msg=. (WORD,fp) saveref__DL uv1;uv2 do. msg [ dfclose__DL 'U' return. end.

    dfclose__DL 'U'
  end.

  OK
end.
)


didstats=:4 : 0

NB.*didstats v-- dictionary statistics. Returns a table of object
NB. counts and reference paths for each dictionary in path order.
NB.
NB. dyad:  uuIgnore didstats uuIgnore

NB. are any dictionaries open?
if. badrc uv=. checkopen 0 do. uv return. end.

NB. gerund of directory object (loadstamps) calls
ger=. (<'loadstamps') ,&.> locsfx ol=. {:"1 DPATH
if. +./(ger `:0) 0 do.
  jderr ERR054  NB. errmsg: unable to load directory
else.
  dn=. DIRTS__oj [ oj=. {. {:"1 DPATH  NB. (*)=. oj
  hd=. '' ; '--' ; HEADNMS__oj

  NB. collect values of directory object nouns
  uv=.('RW';'RPATH';dn) fullmonty&><ol
  rpaths=. 1{uv [ rs=. (;{.uv){READSTATS
  dt=. ({."1 DPATH) ,. rs ,. {.&> |: 2 }. uv
  dt=. hd , dt

  NB. read master to get as complete a list of names and numbers
  NB. as possible. Some (DIDNUM)'s may still be missing - missing
  NB. dictionaries reported as dictionary numbers - hey life is cruel!
  if. badjr uv=. jread JMASTER;CNMFTAB do.
    jderr ERR006 return. NB. errmsg: cannot read master
  end.

  rb=. <"0 (~. ;rpaths) -. ;1{uv =. >uv
  hd=. (0{uv) , ":&.> rb  NB. all dictionary names
  dn=. (1{uv) , rb        NB. dictionary numbers

  NB. display formatted paths with each dictionary using current names
  rpaths=. ;&.>PATHSHOWDEL,L:0((<;dn)i.&.>rpaths){&.><hd
  ok <dt ,. PATHTIT ; rpaths
end.
)


dnlsearch=:4 : 0

NB.*dnlsearch  v--  searches  dictionary name  lists  for  simple
NB. character list patterns.
NB.
NB. dyad: ilObjOptNc dnlsearch (clPattern ; clDir)
NB.
NB.   3 2 7 dnlsearch 'boo'   NB. suite names containing 'boo'
NB.   3 _2 0 dnlsearch 'boo'  NB. nouns with names containing 'boo'

mop=. ERR001
if. -.(second x) e. PATOPS do. jderr mop return. end.

NB. following code is essentially (pathnl) - maintained
NB. inline because (pob) and (oj) used elsewhere
pob=. {:"1 DPATH [ dt=. |{.x
if. badrc msg=. dt loadalldirs pob do. msg return. end.
nl=. (>dnix__oj dt) fullmonty pob [ oj=. {.pob  NB. (*)=. oj

if. DEFAULT~:{:x do.
   NB. object noun !(*)=. HASTYPE
   if. (({.x) e. WORD,MACRO) *. ({:x) e. HASTYPE do.
     ger=. (<'loadnc') ,&.> locsfx pob
     if. +./(ger `:0) dt do.
       jderr ERR054 return. NB. errmsg: unable to load directory
     end.
     dc=. ;&.> (>dnnc__oj dt) fullmonty pob

     NB. remove items of (nl) that do not have type ({:x)
     nl=. (dc =&.> <{:x) #&.> nl
     
   else.
     jderr mop return.
   end.
end.

x=. second x
if. isempty y do.
  if. 0>x do. ok (/:~)&.> nl return. else. ok sortdnub nl end.
elseif. do.
  y=. ,y
  NB. insure nulls behave
  sublists=. 0>x
  shape=. (sublists#0),0
  nl=. (<shape$'') (I. 0=#&> nl)} nl
  NB. remove any empties 
  if. 0=#nl=. nl -. a: do. ok'' return. end.
  select. |x
    case. 1 do. if. sublists do. ok nl allnlpfx y else. ok nl nubnlpfx y end.
    case. 2 do. if. sublists do. ok nl allnlctn y else. ok nl nubnlctn y end.
    case. 3 do. if. sublists do. ok nl allnlsfx y else. ok nl nubnlsfx y end.
    case. do. jderr mop
  end.
end.
)


freedisk=:3 : 0

NB.*freedisk v-- returns free disk/volume space in bytes.
NB.
NB. monad:  freedisk clDisk | clLinuxVolume
NB.
NB.   freedisk 'c:\'       NB. :\ required for windows
NB.   freedisk '/sd1/dev'  NB. linux file system root - null sums all devices

NB. NOTE: assume enough space for IOS, Android and unknown?

NB. Default behaviour has been changed to not size volumes
NB. when FREESPACE is 0. Volume sizing can peform poorly
NB. on large network volumes and fail completely on cloud drives.
NB. Empty JOD dictionaries are small (<60k) - assuming sufficient
NB. space is safe in all but extreme circumstances.
if.     0=FREESPACE      do. 1
elseif. IFWIN            do. freediskwin y
elseif. UNAME-:'Linux'   do. freedisklinux y
elseif. IFIOS            do. >:FREESPACE
elseif. UNAME-:'Darwin'  do. freediskmac y
elseif. UNAME-:'Android' do. >:FREESPACE
elseif.do. >:FREESPACE
end.
)


freedisklinux=:3 : 0

NB.*freedisklinux v-- bytes free on not 'none' linux volumes.
NB.
NB. NOTE: NIMP: I don't know how to determine which
NB. linux volume the dictionary will be on so I return
NB. the minimum of all not 'none' mounted volumes.
NB.
NB. monad:  fl =. freedisklinux uuIgnore
NB.
NB.   freedisklinux 0   NB. bytes (possibly floating) free on mounted filesystems

NB. linux shell command fetches free 1k blocks - expected format is:
NB. Filesystem           1K-blocks      Used Available Use% Mounted on
NB. /dev/sda1            149301564  11113004 130604408   8% /
NB. none                    764396       648    763748   1% /dev
NB. none                    771004      1364    769640   1% /dev/shm
NB. none                    771004        96    770908   1% /var/run
NB. none                    771004         0    771004   0% /var/lock
txt=. host 'df -l'

NB. cut into lines and drop header
txt=. }. <;._2 txt  

NB. remove all 'none' filesystems HARDCODE: length of 'none'
NB. NIMP: ignoring empty result - hey there
NB. has to be at least one mounted filesystem!
txt=. txt #~ -. 'none'&-:&> 4 {.&.> txt

NB. min bytes free using 1000 byte blocks - this will
NB. underestimate free space and leave a little safety cushion
<./ 1000 * 3 {"1 ] _1&".&> txt
)


freediskmac=:3 : 0

NB.*freediskmac v-- free disk bytes on mac dictionary volume.
NB.
NB. monad:  iaBytes =. freediskmac clMacVolume

NB. NIMP: assume enough space for now
>:FREESPACE
)


freediskwin=:3 : 0

NB.*freediskwin v-- returns free disk/volume space in btyes for win systems
NB.
NB. monad:  freediskwin clDisk | clLinuxVolume
NB.
NB.   freediskwin 'c:\'       NB. :\ required for windows

s=. 'kernel32 GetDiskFreeSpaceA i *c *i *i *i *i' cd y;(,0);(,0);(,0);(,0)
*/ ; 2 3 4 { s
)

NB. returns lists of directory object noun values - see long documentation
fullmonty=:[: ".&.> ([: < [) ,&.> [: locsfx ]


getdicdoc=:3 : 0

NB.*getdicdoc v-- fetches put dictionary documentation.
NB.
NB. monad:  cl =. getdicdoc uuIgnore

NB. assumes a put dictionary is open.
DL=. {:{.DPATH  NB. directory object !(*)=. DL
if. badjr dat=. jread WP__DL;CNDICDOC do. jderr ERR088 NB. errmsg: read failure
else.
  ok ,>dat
end.
)


getdocument=:4 : 0

NB.*getdocument v-- get object documentation
NB.
NB. dyad: iaObject getdocument blcl

if. badrc uv=. (x,1) getobjects y do. uv else. ok <0 3 {"1 rv uv end.
)


getexplain=:4 : 0

NB.*getexplain v-- gets short explanations.
NB.
NB. Note: Similar  to (invfetch)  and  (getobjects) but different
NB. enough to justify new verb.
NB.
NB. dyad:  iaObject getexplain blcl
NB.
NB.   WORD getexplain ;:'you have some explaining to do'

if. badrc y=. checknames y do. y return. end.
obs=. y=. }.y
if. badrc tnl=. pathnl x do. tnl return. end.

NB. remove any empty dictionaries from path
tnl=. }. tnl
b=. 0&<@:#&> tnl
tnl=. b#tnl [ dpath=. b#DPATH

NB. if all objects are not on path get nothing
if. *./b=. y e. ; tnl do.

  DL=.  {:{:DPATH                  NB. any object
  fp=.  ({.>dncn__DL {.x),'P__DL'  NB. file pointer
  res=. (#obs)$a:                  NB. result list

  NB. run down path
  for_dp. tnl do.
    ix=. (dp=. >dp) i. y

    NB. get data in current dictionary
    if. +./bm=. ix<#dp do.
      DL =. {:dp_index{dpath  NB. directory object !(*)=. DL
      if. badjr dat=. jread (".fp);CNEXPLAIN do.
        jderr ERR088 return. NB. errmsg: read failure
      end.
      dat=. (bm#ix){>dat

      NB. merge data into final result order matters here
      res=. dat (obs i. bm#y)} res

      NB. remove fetched objects from list quit if no more
      if. 0=#y=. (-.bm)#y do. break. end.
    end.
  end.

  NB. return objects in requested order
  ok <obs ,. res

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)


getgstext=:4 : 0

NB.*getgstext v-- get group and suite text.
NB.
NB. dyad:  iaObject getgstext blcl

if. badrc uv=. (x,0) getobjects y do. uv else. ok <0 1 {"1 rv uv end.
)


getntstamp=:4 : 0

NB.*getntstamp v-- get name, creation and last put timestamps.
NB.
NB. dyad:  iaDcode getntstamp blcl
NB.
NB.    1 getntstamp__ST__JODobj }. 1 revo  ''

if. badrc uv=. (x,INCREATE,INPUT) invfetch y do. uv else. ok <(<y) ,: 1{uv end.
)


getobjects=:4 : 0

NB.*getobjects  v-- fetches object names and values. A successful
NB. result  is  a  boxed  table. Column  0 holds  names remaining
NB. columns hold types and values. If there  is no  type or  name
NB. class only two columns are returned.
NB.
NB. dyad:  il getobjects blcl
NB.
NB.   NB. 2 columns (name,value)
NB.   (TEST,0) getobjects ;:'some test names ehh'
NB.
NB.   NB. 3 columns (name,class,value)
NB.   (WORD,0) getobjects ;:'words are us'

if. badrc y=.checknames y do. y return. end.
ord=. y=. }.y

'obj offset'=. x
if. badrc onl=. pathnl obj do. onl return. end.

NB. remove any empty dictionaries from path
onl=. }. onl
b=. 0&<@:#&> onl
onl=. b#onl [ dpath =. b#DPATH
val=. 0 0$''

NB. if all objects are not on path get nothing
if. *./b=. y e. ; onl do.

  doj=. {: {.dpath            NB. any directory object
  cnn=. (uv=. >dncn__doj obj),'__DL'  NB. object component noun name
  fp=. ({.uv),'P__DL'         NB. file pointer noun name

  NB. run down the path fetching first occurrences
  for_dp. onl do.
    ix=. (dp=. >dp) i. y

    NB. NIMP GETFACTOR not used yet
    NB. get any objects in current dictionary
    if. +./wf=. ix<#dp do.
      DL=. {:dp_index{dpath  NB. directory object !(*)=. DL
      if. badjr dat=. jread (".fp);(wf#ix){offset+".cnn do.
        jderr ERR088 return. NB. errmsg: read failure
      end.
      val=. val , >dat

      NB. remove fetched objects from list quit if no more objects
      if. 0=#y=. (-.wf)#y do. break. end.
    end.
  end.

  NB. insure objects are returned in requested order
  val=. (({."1 val) i. ord) { val
  ok <val

else.
  (jderr ERR083),(-.b)#y NB. errmsg: not on path
end.
)


getrefs=:4 : 0

NB.*getrefs  v-- fetches reference lists. A  successful result is
NB. an OK  boxed table of  boxed  character lists. Column 0 holds
NB. names  and column  1  holds  boxed reference lists. Currently
NB. only words have stored  references  but  this verb  has  been
NB. coded to  allow  for additional  reference types  as the need
NB. arises.
NB.
NB. dyad:  iaObject getrefs blcl
NB.
NB.   WORD getrefs ;:'get our references please'

if. badrc y=.checknames y do. y return. end.
y=. }.y

NB. if all objects are not on path get nothing
if. badrc onl=. pathnl x do. onl return. end.
if. 0 e. b=. y e. ; }.onl do.
  (jderr ERR083),(-.b)#y return.  NB. errmsg: not on path
end.

NB. reference table
rft =. i. 0 0

NB. objects with stored references
if. badrc onl=. pathref x do. onl return. end.

NB. remove dictionaries with no references from path
onl=. }. onl
b=. 0&<@:#&> onl
onl=. b#onl [ dpath =. b#DPATH

NB. if any stored references get them
if. #dpath do.

  NB. reference component noun name in directory object
  DL=. {:{. dpath
  cnn=. >0 dnrn__DL x

  NB. run down the path fetching the first occurrences
  for_dp. onl do.
    rix=. (dp=. >dp) i. y

    NB. NIMP GETFACTOR not used yet
    NB. if any references in current dictionary get them
    if. +./rf=. rix<#dp do.
      DL=. {:dp_index{dpath  NB. directory object !(*)=. DL
      if. badjr dat=. jread UF__DL;(rf#rix){".cnn,'__DL' do.
        jderr ERR088 return.  NB. errmsg: read failure
      end.
      rft=. rft , >dat

      NB. remove names with fetched references from list quit if no more
      if. 0=#y=. (-.rf)#y do. break. end.
    end.
  end.
end.

NB. any remaining objects currently have no stored references
if. #y do. ok <rft , (y ,"0 1 <x),.<'';'' else. ok <rft end.
)


gslistnl=:4 : 0

NB.*gslistnl v-- returns  a group or  suite name list.  Prior  to
NB. calling this verb a  dictionary  must be  open  and  the (x)
NB. object code argument validated. The name list returned is the
NB. first one found on the current path.
NB.
NB. dyad:  iaObject gslistnl clName
NB.
NB.  GROUP gslistnl 'groupname'

if. badrc path=. pathnl x do. path return. end.
uv=. (path=. }.path) fopix y

if. uv=#path do. (jderr ERR083),<y return. end. NB. errmsg: not on path

uv=. {:uv{DPATH  NB. directory object reference (*)=. uv

cn=. (".(ln=. >dnix__uv x),'__uv') i. <y
cn=. cn { ".(>dncn__uv x),'__uv'    NB. file component of list

if. badjr cn=. jread (".({.ln),'P__uv');cn do.
  jderr ERR084 NB. errmsg: unable to read data
else.
  ok >{:>cn  NB. stored list is unique and sorted
end.
)


inputdict=:4 : 0

NB.*inputdict v-- tests for objects in put dictionary
NB.
NB. dyad:  (iaObject ;< ba) inputdict blcl
NB.
NB.  (WORD;<DL) inputdict ;:'are we in put dictionary'

'obj DL'=. x  NB. directory object !(*)=. DL

NB. errmsg: unable to load directory
if. loaddir__DL obj do. jderr ERR054
elseif. ix=. ".(>dnix__DL obj),'__DL'
  *./b=. y e. ix do. OK
elseif.do.
  (jderr ERR086),(-.b)#y NB. errmsg: not in put dictionary
end.
)


invappend=:4 : 0

NB.*invappend v-- appends items to inverted data lists.  The (x)
NB. argument is a boxed list append  list. (y)  is  a boxed list
NB. containing a file pointer and inverted component numbers.
NB.
NB. dyad:  blul invappend blul
NB.
NB.   apps invappend WF__DL ; CNCLASS,CNPUTDATE,CNSIZE

msg=. ERR057  NB. errmsg: directory update failure

NB. file pointer & component list
'fp cmpl'=. y
if. (#x)~:#cmpl do. jderr msg return. end.
rc=. i.0

NB. get the total number of expected elements from 0 component
if. badjr dat=. jread fp;CNMARK do. jderr msg return. end.
oldlen=. >{.>dat

NB. loop for maximum safety and space savings
for_cn. cmpl do.

  if. badjr dat=. jread fp;cn do. jderr msg return. end.
  dat=. >dat

  NB. all inverted list lengths must match expected
  if. oldlen ~: #dat do. jderr msg return. end.

  dat=. dat , >cn_index{x
  rc=. rc, (<dat) jreplace fp ; cn
end.

NB. test replacements for errors
if. badreps rc do. jderr msg else. OK end.
)


invdelete=:4 : 0

NB.*invdelete v--  deletes items  from  inverted data lists.  The
NB. (x)  argument  is a mask list. (y) consists of a boxed list
NB. containing a file pointer and inverted component numbers.
NB.
NB. dyad:  pl invdelete blul
NB.
NB.   mask invdelete WF__DL ; CNCLASS,CNPUTDATE,CNCREATION,CNSIZE

NB. file pointer & component list
'fp cmpl'=. y
msg=. ERR057  NB. errmsg: directory update failure
rc=. i.0 [ len=. #x

NB. get the total number of expected elements from 0 component
if. badjr dat=. jread fp;CNMARK do. jderr msg return. end.
oldlen=. >{.>dat

NB. loop for maximum safety and space savings
for_cn. cmpl do.

  if. badjr dat=. jread fp;cn do. jderr msg return. end.
  dat=. >dat

  NB. all inverted list lengths must match expected
  if. oldlen ~: #dat do. jderr msg return. end.

  rc=. rc, (<x#dat) jreplace fp;cn
end.

NB. test replacements for errors
if. badreps rc do. jderr msg else. OK end.
)


invfetch=:4 : 0

NB.*invfetch  v--  reads  inverted   numerical  data  lists  from
NB. dictionary  files.  Assumes  the  (x)   argument   has  been
NB. validated prior to calling.
NB.
NB. dyad:  ilDcodes invfetch blcl
NB.
NB.   NB. first code is JOD object code 
NB.   0 12 13 14 15 invfetch__ST__JODobj }. dnl'' 
NB.   2 13 14  invfetch__ST__JODobj }. 2 dnl''
NB.   (SUITE_ajod_,INCREATE_ajod_,INPUT_ajod_) invfetch__ST__JODobj }. SUITE_ajod_ dnl''

if. badrc y=. checknames y do. y return. end.
obs=. y=. }.y
if. badrc tnl=. pathnl {.x do. tnl return. end.

NB. remove any empty dictionaries from path
tnl=. }. tnl
b=. 0&<@:#&> tnl
tnl=. b#tnl [ dpath=. b#DPATH

NB. if all objects are not on path get nothing
if. *./b=. y e. ; tnl do.

  NB. map external codes to inverted data components
  cninv=. ((0{INCNXR) i. }.x) { 1{INCNXR   NB. object noun !(*)=. INCNXR
  DL=.    {:{:DPATH                  NB. any object
  fp=.    ({.>dncn__DL {.x),'P__DL'  NB. file pointer
  res=.   ((#cninv),#obs)$0          NB. result table

  NB. run down path
  for_dp. tnl do.
    ix=. (dp=. >dp) i. y

    NB. get data in current dictionary
    if. +./bm=. ix<#dp do.
      DL =. {:dp_index{dpath  NB. directory object !(*)=. DL
      if. badjr dat=. jread (".fp);cninv do.
        jderr ERR088 return. NB. errmsg: read failure
      end.
      dat=. (bm#ix) {"1 > dat

      NB. merge data into final result order matters here
      res=. dat (<a:;obs i. bm#y)} res

      NB. remove fetched objects from list quit if no more
      if. 0=#y=. (-.bm)#y do. break. end.
    end.
  end.

  NB. returns a list when only one item otherwise table
  ok < ]`,@.(1&=@:#) res

else.
  (jderr ERR083),y #~ -. b  NB. errmsg: not on path
end.
)


invreplace=:4 : 0

NB.*invreplace v-- replaces  items  from inverted data lists. The
NB. (x) argument is a boxed list of positions and  replacements.
NB. (y) is a  boxed list containing a file pointer and  inverted
NB. component numbers.
NB.
NB. dyad:  blul invreplace blul
NB.
NB.   (pos;reps) invreplace WF__DL ; CNCLASS,CNPUTDATE,CNSIZE

msg=. ERR057  NB. errmsg: directory update failure

NB. file pointer & component list
'fp cmpl'=.  y
'pos repl'=. x
if. (#repl)~:#cmpl do. jderr msg return. end.
rc=. i.0

NB. replacements do not change the length of inverted lists
NB. get the total number of elements from 0 component
if. badjr dat=. jread fp;CNMARK do. jderr msg return. end.
len=. >{.>dat

NB. loop for maximum safety and space savings
for_cn. cmpl do.

  if. badjr dat=. jread fp;cn do. jderr msg return. end.
  dat=. >dat

  NB. all inverted list lengths must match
  if. len ~: #dat do. jderr msg return. end.

  dat=. (>cn_index{repl) pos} dat
  rc=. rc, (<dat) jreplace fp ; cn
end.

NB. test replacements for errors
if. badreps rc do. jderr msg else. OK end.
)

NB. 1 if dictionary is a library
islib=:'*'"_ = [: {. [: > {.


iswriteable=:3 : 0

NB.*iswriteable  v--  tests  a blcl of full  path file  names for
NB. writeablity.
NB.
NB. This verb takes  a list of full path file names and tests the
NB. read/write status of  the files.  The  result is boolean list
NB. with 1 denoting "writeable" and 0 denoting "not-writeable."
NB.
NB. monad:  pl =. iswriteable blclPathFile

if. IFWIN do. iswriteablewin y else. iswriteablelinux y end.
)


iswriteablelinux=:3 : 0

NB.*iswriteablelinux  v-- tests a blcl of full path  linux  files
NB. for writeablity.
NB.
NB. monad:  pl =. iswriteablelinux blclPathFile

NB. NIMP: check linux file read/write/access status
NB. NIMP: returns all 1's for now
(#,y)#1
)

NB. tests permissions/attributes of a blcl of full path file names for writeablity
iswriteablewin=:'w-'"_ -:"1 [: ] 1 3"_ {"1 [: ;"1 [: ] _2: {."1 [: > [: ,&(1!:0)&.> ]


jdatcreate=:4 : 0

NB.*jdatcreate v-- creates an empty dictionary data file. (y) is
NB. a path and (x) is a file name
NB.
NB. dyad:  clFile jdatcreate clPath
NB.
NB.   'jtests' jdatcreate 'c:\temp\jdict2a\'
NB.   'jgroups' jdatcreate 'c:\blanks are cool\jdict 2a\'

fn=. (alltrim y) , x -. ' '
msg=. ERR052 NB. errmsg: unable to initialize

if.     -.jcreate fn do. (jderr msg),<fn
elseif. c=. < 0 ; t=. now ''        NB. length and directory stamp
        c=. c , <''                 NB. c1 RESERVED
        badappend c=. (c , (OFFSET-#c) # a:) jappend fn do. (jderr msg),<fn
elseif. do.
 ok {: c  NB. return last component
end.
)


jwordscreate=:4 : 0

NB.*jwordscreate v-- creates an empty word file. (y) argument is
NB. a  fully  qualified  file  name.  (x)  is  a  boxed list  of
NB. dictionary  creation  parameters.  The  target  directory  is
NB. assumed to exist. Result is a return code and message.
NB.
NB. dyad:  blParms jwordscreate clFile
NB.
NB.  (doc;parms) jwordscreate 'c:\temp\jdict2a\jwords' NB. no extension

msg=. ERR052 NB. errmsg: unable to initialize

if.     -.jcreate y  do. (jderr msg),<y
elseif. c=. < 0 ; t=. now ''        NB. c0 length and directory stamp
        c=. c , <''                 NB. c1 RESERVED
        c=. c , 0{x                 NB. c2 this dictionary's documentation
        c=. c , <}. x               NB. c3 dictionary parameters
        badappend c=. (c , (OFFSET-#c) # a:) jappend y do. (jderr msg),<y
elseif. do.
 ok {: c  NB. return last component
end.
)


loadalldirs=:4 : 0

NB.*loadalldirs v-- loads all (x) directories for each open (y)
NB. dictionary.
NB.
NB. dyad:  iaObject loadalldirs blcl
NB.
NB.   WORD loadalldirs {:"1 DPATH

x=. |x
for_oj. y do.
  if. loaddir__oj x do.
    jderr ERR054 return. NB. errmsg: unable to load directory
  end.
end.
OK
)


loadallrefs=:4 : 0

NB.*loadallrefs v-- loads all references for (y) dictionary.
NB.
NB. dyad:  iaObject loadallrefs blcl
NB.
NB.   WORD loadallrefs {:"1 DPATH

for_oj. y do.
  if. loadref__oj x do.
    jderr ERR079 return. NB. errmsg: unable to load references
  end.
end.
OK
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

    NB. define nouns
    if. #nu=. (-.bu)#wu do.
      vu=. ({.&> nu) ,&.> <loc
      (vu)=: (3!:2)&.> {:&> nu
    end.
  catch. jderr ERR091 return. end.
  OK
end.
)


mainddir=:3 : 0

NB.*mainddir v--  creates  the main  dictionary  directory from a
NB. path.
NB.
NB. monad:  mainddir clPath
NB.
NB.   mainddir 'c:\go\ahead\create\my\directory'

NB.#ASSERT 0 < #y.
y=.  (-PATHDEL={: y) }. y , PATHDEL
drv=. alltrim (,&':'`]@.(0&=@:#)) justdrv y

NB. standard path format
sp=. alltrim justpath y
y=. drv,sp,PATHDEL

NB. path must begin with (PATHDEL) to force user to
NB. think carefully about where dictionary is placed
if. PATHDEL~:{. sp,' ' do.
  jderr ERR059 NB. errmsg: full rooted path required
  return.
end.

NB. subpath list with any drive attached
sp=. ;&.> <"1 ,/\ <;.1 sp
sp=. (<drv) ,&.> sp

NB. attempt to create last directory on path
if. 1=makedir {: sp do. ok y

NB. upon failure run down paths attempting to create all
NB. intermediate directories - many operations will
NB. typically fail because some intermediates will exist
elseif. makedir"0 }: sp
        1=makedir {: sp do. ok y
elseif. do.
  (jderr ERR060),<y NB. errmsg: unable to create directory
end.
)


newdparms=:3 : 0

NB.*newdparms  v--  sets  the dictionary  parameters  for  a  new
NB. dictionary.
NB.
NB. monad:  newdparms bluu
NB.
NB.   newdparms sd;dp;dname;dn;path

NB. subdirectories, parameters, name, unique number and path
'sd dp name dn path'=. y

NB. name, number, creation, last dump, [paths], J version, J system
uv=. name ; dn ; (now '') ; (6#0) ; (<path) ,&.> sd ,&.> PATHDEL
uv=. uv , (9!:14'');9!:12 ''

NB. dictionary number path context - empty until references created
uv=. uv , <i.0

NB. reduce user parameter table to names and values
uv , < |: 0 2 {"1 dp
)


newregdict=:4 : 0

NB.*newregdict v-- creates a new dictionary  or registers an extant
NB. dictionary.
NB.
NB. dyad:  iaOptions newregdict (clDictionary ; clPathroot)
NB.
NB.   NB. register extant dictinary
NB.   0 newregdict 'dictionary name';'c:\where\it\lives' NB. drive required
NB.
NB.   NB. create new dictionary
NB.   1 newregdict 'new name';'c:\new\location'

mf=.  JMASTER  NB. master file
msg=. ERR061   NB. errmsg: invalid dictionary name;path[;documentation]

if. (badbu y) +. 1~:#$ y  do. jderr msg
elseif. (3<#y) +. 2>#y    do. jderr msg
elseif. +./badcl&> y      do. jderr msg
elseif.do.

  NB. names and paths cannot be empty - sorry
  'name path doc'=. 3{.y,<''
  name=. alltrim name [ path=. hostsep alltrim path
  if. 0&e. (#name),#path do. jderr msg return. end.

  NB. restrict dictionary name and path characters
  if. 0&e. name e. ' ',ALPHA do.
    jderr ERR062 return. NB. errmsg: invalid characters in name
  elseif. 0&e. path e. PATHCHRS,ALPHA do.
    jderr ERR063 return. NB. errmsg: invalid characters in path
  end.

  if. IFWIN do.
    NB. check for UNC paths
    if. (2#PATHDEL) -: 2{.path do.
      NB. insure UNC paths are terminated
      path=. path,(PATHDEL={:path)}.PATHDEL

      NB. NIMP: NOTE: (freedisk)'ing windows network drives (more
      NB. than once) is time consuming and typically unnecesary!
      NB. These volumes are often huge and JOD empty dictionaries
      NB. are tiny - hence we ASSUME sufficient space. The following
      NB. commented code tests UNC volumes.

      disk=.'' NB. empty disk suppresses space testing

      NB. test if the maximum size of subpaths exceeds threshold
      NB. depends on (freedisk) returning zero for invalid paths
      NB. omit root \\ and last nonexistant path
      NB. if. 0=#uv=. _1 }. 2 }.;&.> <"1 ,/\ <;.2 path do. 
      NB.   (jderr ERR065),<path return. NB. errmsg: not enough space on drive
      NB. end.
      NB. if. (>./freedisk&> uv) < FREESPACE do. (jderr ERR065),<path return. end. 
    else. 
      NB. check for windows drive letter (required) and 
      NB. determine if there is enough space on the target drive
      NB. errmsg: target drive is required
      if. isempty tdrv=. justdrv path do. jderr ERR064  return. end.
      
      NB. windows drive letters
      disk=. tdrv,':',PATHDEL
    end.
  else.
    NB. require rooted linux paths 
    if. PATHDEL ~: {.path do. (jderr ERR096),<path return. end.

    NB. NIMP: how does one determine the volume name for a given
    NB. fully qualified linux file that resides on said volume?  
    disk=. path
  end.

  if. (x=1) *. 0<#disk do. NB. HARDCODE (x) option
    bytes=. freedisk disk
    NB. errmsg: not enough space 
    if. bytes < FREESPACE do. (jderr ERR065),<disk return. end.
  end.

  NB. attempt to read master
  if. badjr uv=. jread mf;CNMFTAB,CNMFPARMS,CNMFDLOG do.
    jderr ERR006 return. NB. errmsg: cannot read master
  end.

  NB. mark master - this verb updates if successful
  NB. all error calls should use (jdmasterr) until
  NB. the master is cleared at the end of this verb
  if. badrc msg=. markmast 1 do. msg return. end.

  NB. master table, dictionary parameters, number log
  'mdt dpt dlg'=. uv
  NB. errmsg: dictionary name in use
  if. (<name) e. 0{mdt do. jdmasterr ERR066 return. end.

  if. x=1 do.
    NB. attempt to create main root directory
    if. badrc path=. mainddir path do. path [ markmast~0 return. end.

    NB. attempt to create standard subdirectories
    path=. {: path
    if. 0&e. uv=. makedir"0 path ,&.> JDSDIRS do.
      jdmasterr ERR067 return. NB. errmsg: unable to create subdirectories
    end.
    path=. > path

    dn=. didnum 0   NB. unique dictionary number
    uv=. newdparms JDSDIRS;dpt;name;dn;path

    NB. create empty dictionary files
    uv=. <(doc;uv) jwordscreate path,>0{JDFILES
    uv=. uv , (}.JDFILES) jdatcreate&.> <path
    if. 0&e. ;{.&> uv do.
      jdmasterr ERR068 return. NB. errmsg: unable to setup dictionary file(s)
    end.
    newmdt=. mdt,.name;dn;path;0
    okm=.OK050
  else.
    path=. (-PATHDEL={:path) }. path,PATHDEL

    NB. test existence of dictionary files
    fn=. JDFILES ,&.> <IJF
    if. 1 e. uv=. -. fex"1 dcfiles=. <@:;"1 (<path) ,"0 / fn do.
      (jdmasterr ERR073),<name return. NB. errmsg: missing dictionary file(s)
    end.

    NB. NIMP should run under a trap here to protect
    NB. against files that appear to be dictionary but are not

    NB. read dictionary parameter table and documentation
    if. badjr dat=. jread (file=. path,>{.JDFILES);CNPARMS,CNDICDOC do.
      jdmasterr ERR088 return. NB. errmsg: jfile read failure
    end.

    NB. dictionary parameters and unique id
    'dpt olddoc'=. dat
    dn=. 1 {:: dpt

    NB. didnum's must be unique
    NB. errmsg: duplicate dictionary id number
    if. dn e. ; 1{mdt do. jdmasterr ERR092 return. end.

    NB. if not a libary adjust dictionary paths, name and documentation
    if. -.islib dpt do.

      NB. test dictionary file attributes - we must be able to read/write
      if. 0 e. iswriteable dcfiles do.
        NB. errmsg: dictionary file attributes do not allow read/write
        jdmasterr ERR095 return.
      end.

      dpt=. ((<path) ,&.> JDSDIRS ,&.> PATHDEL) PARMDIRS} dpt
      dpt=. (<name) 0} dpt
      doc=. (*#doc){olddoc;doc
      if. badreps (dpt;doc) jreplace file;CNPARMS,CNDICDOC do.
        jdmasterr ERR056  NB. errmsg: jfile replace failure
      end.
    end.

    newmdt=. mdt,.name;dn;path;0
    okm=. OK058
  end.

  NB. update master dictionary table+backup, didnum log, open status
  uv=. (newmdt;mdt;dlg,dn) jreplace mf;CNMFTAB,CNMFTABBCK,CNMFDLOG
  if. 0&> <./uv do. jdmasterr ERR069 return. end. NB. errmsg: error updating master

  NB. free master file for other tasks
  if. badrc msg=. markmast~0 do. msg return. end.

  ok okm;name;jpathsep path
end.
)

NB. names containing substring
nlctn=:([: I. [: +./"1 ([: ,: ]) E. [: > [) { [

NB. match prefixes (explore alternatives from large name lists)
nlpfx=:[ #~ ([: < [: , ]) -:&> ([: # [: , ]) {.&.> [

NB. match name suffixes
nlsfx=:[ #~ ([: < [: , ]) -:&> ([: - [: # [: , ]) {.&.> [

NB. containing pattern in raised and nubbed
nubnlctn=:([: sortdnub [) nlctn ]

NB. match prefixes in raised and nubbed
nubnlpfx=:([: sortdnub [) nlpfx ]

NB. match suffixes in raised and nubbed
nubnlsfx=:([: sortdnub [) nlsfx ]


opendict=:4 : 0

NB.*opendict v-- opens dictionaries. Dictionary names and  master
NB. table  have been  validated prior  to calling this verb.  The
NB. dictionary  system  does  not  leave   files  open  as   this
NB. significantly decreases crash  resistence. Instead the master
NB. dictionay table is marked with 1 when dictionaries are opened
NB. read/write.  Only one task can open a  dictionary read/write.
NB. Many tasks can open the same dictionary read/only.
NB.
NB. dyad:  blclDictionary opendict (iaOption ; btMdt)
NB.
NB.   ('d0';'d1') opendict 1;jread JMASTER;CNMFTAB NB. open di r/w

NB. quit if open limit exceeded - limits the number of directory objects
NB. errmsg: request exceeds open limit
if. DPLIMIT<(#x)+#DPATH do. jderr ERR070 return. end.

NB. if any dictionary is already on the path quit with error
uv=. x e. {."1 DPATH
if. 1 e. uv do. (jderr ERR071),uv#x return. end. NB. errmsg: already open

NB. open status and master dictionary table
'os mdt'=. y

NB. get locations of dictionaries to open
pd=. (0{mdt) i. x
ld=. (<2;pd){mdt

NB. if any dictionary is already open read/write quit with error
NB. note: because other tasks may have a dictionary open read/write
NB. it does not appear on the path of this task - HARDCODE: rs code
rs=. 0 < ; (<3;pd){mdt
NB. errmsg: another task opened read/write
if. 1 e. rs do. (jderr ERR072),(1=rs)#x return. end.

NB. standard files with extension
fn=. JDFILES ,&.> <IJF

NB. test existence of alleged dictionary files
if. 1 e. uv=. -. fex"1 dcfiles=. <@:;"1  ld ,"0 / fn do.
  (jderr ERR073),uv#x return. NB. errmsg: missing dictionary file(s)
end.

NB. open request seems valid - mark master
if. badrc msg=. markmast 1 do. msg return. end.

dpath=. DPATH
libstatus=. i.0

for_dp. ld do.  NB. depends on (#x)=(#pd)=#ld

   NB. get dictionary parameters
   if. badjr pdp=. jread (;dp,{.fn);CNPARMS do.
     NB. errmsg: cannot read dictionary parameters
     (jdmasterr ERR074),dp_index{x return.
   end.

   NB. master table didnum must match current dictionary didnum
   if. ((<1;dp_index{pd){mdt) -: 1{>pdp do.

     NB. is the master path a prefix of stored dictionary paths?
     NB. assumes: all subdir path prefixes are the same - this
     NB. is true for dictionaries created by (newd)
     nppfx=. -.0{(;dp) E. ;(0{PARMDIRS){>pdp 

     if. nppfx *. islib >pdp do.
       NB. remap paths for libraries if necessary - allows LAN file sharing
       NB. of libraries for many users/tasks with different access paths
       NB. WARNING: if these directories are on locked down LAN volumes
       NB. JOD commands like: make'' may return cannot write errors
       pdp=. >pdp
       npth=. PATHDEL ,&.>~ dp ,&.> PATHDEL&afterlaststr&.> rpdtrim&.> PARMDIRS{pdp
       pdp=. <npth PARMDIRS}pdp
     else.
       NB. master/stored dictionary paths must match for read/write
       if. nppfx do. 
         if. #dpath=. ({:"1 dpath) -. {:"1 DPATH do. coerase"0 dpath end.
         NB. errmsg: master/dictionary file path mismatch - have owner set READONLY name/DIDNUM ->
         (jdmasterr ERR098),0 1{>pdp return. 
       end.
   
       NB. for read/write dictionaries (not-libraries) insure
       NB. the dictionary file permissions/attributes allow writing
       if. 0 e. iswriteable dp_index{dcfiles do. 
         if. #dpath=. ({:"1 dpath) -. {:"1 DPATH do. coerase"0 dpath end.
         NB. errmsg: dictionary file attributes do not allow read/write ->
         (jdmasterr ERR095),dp_index{x return. 
       end.
     end.

     NB. create new directory object
     DL=. conew 'ajoddob'
     name=. dp_index{x
     if. createdl__DL nppfx;name;dp;os;pdp do.
       NB. append to path copy
       dpath=. dpath , (a: ,~ name , 1{>pdp),DL
       NB. are we a read only library?
       libstatus=. libstatus,LIBSTATUS__DL
     else.
       if. #dpath=. ({:"1 dpath) -. {:"1 DPATH do. coerase"0 dpath end.
       (jdmasterr ERR075),dp_index{x NB. errmsg: unable to open directory
       return.
     end.

   else.

     NB. destroy any directory objects opened before inconsistency
     if. #dpath=. ({:"1 dpath) -. {:"1 DPATH do. coerase"0 dpath end.
     (jdmasterr ERR076),dp_index{x   NB. errmsg: master-dictionary inconsistency
     return.

   end.
end.

NB. update master read/write status and release
NB. read/write dictionaries are marked with unique
NB. id and read/only dictionaries are marked with 0
DPATH=: dpath
NB. do not mark any library (read/only) dictionaries open
pd=. (-.libstatus)#pd
mdt=. (<JODOBID * 1=os) (<3;pd)} mdt     NB. object noun !(*)=. JODOBID
if. badreps (<mdt) jreplace JMASTER;CNMFTAB do.
  jdmasterr ERR077 NB. errmsg: unable to update master
elseif. badrc msg=. markmast~0  do. msg  NB. HARDCODE: r/w codes
elseif. os e. 1 2 do.
  uv=. (1=os){rs=. '/' ,&.> READSTATS    NB. read/only and read/write strings
  (ok OK052,(}.;libstatus{(uv,0{rs)),') ->'),x
elseif.do. jderr ERR001
end.
)


pathnl=:3 : 0

NB.*pathnl v-- returns a complete path order list of objects (y).
NB.
NB. monad:  pathnl iaObject
NB.
NB.   pathnl WORD  NB. all words on current path

pob=. {:"1 DPATH
if. badrc uv=. y loadalldirs pob do. uv return. end.
ok (>dnix__uv y) fullmonty pob [ uv=. {.pob
)


pathref=:3 : 0

NB.*pathref  v-- returns a complete path  order list  of  objects
NB. with reference lists.  Currently only words have stored
NB. references but more may be added as the need arises.
NB.
NB. monad:  pathref iaObject
NB.
NB.   pathref WORD  NB. all words on current path with stored references

pob=. {:"1 DPATH
if. badrc uv=. y loadallrefs pob do. uv return. end.
ok (>dnrn__uv y) fullmonty pob [ uv=. {.pob
)


putdicdoc=:3 : 0

NB.*putdicdoc v-- writes put dictionary documentation.
NB.
NB. monad:  putdicdoc clDoc

NB. assumes a put dictionary is open
if. badcl y do. jderr ERR097 NB. errmsg: invalid dictionary document must be character list
else.
  DL=. {:{.DPATH  NB. directory object !(*)=. DL
  
  NB. Whether the put dictionary document is stored depends on the
  NB. value of the "new" dictionary parameter DOCUMENTDICT. 
  dictdoc=. 1 
  if. 0=nc<'DOCUMENTDICT'   do. dictdoc=. 1=DOCUMENTDICT
  elseif.
    NB. if setting exists in put dictionary directory use it
    0=nc<'DOCUMENTDICT__DL' do. dictdoc=. 1=DOCUMENTDICT__DL
  end. 
  
  NB. remind user DOCUMENTDICT is off 
  if. -.dictdoc do. ok OK063;DNAME__DL return. end.
   
  if. badreps (<y) jreplace WP__DL;CNDICDOC do. jderr ERR056 NB. errmsg: replace failure
  else.
    ok OK062;DNAME__DL
  end.
  
end.
)


putexplain=:4 : 0

NB.*putexplain v-- stores short object explanation text.
NB.
NB. dyad:  (iaObject ;< ba) putexplain bt|blcl

NB. validate explain texts
if. badrc y=. checknttab y do. y return. else. y=. rv y end.
if. +/.MAXEXPLAIN < #&> {:"1 y do. jderr ERR089 return. end.  NB. errmsg: text(s) to long

'obj DL'=. x  NB. directory object !(*)=. DL

if. badrc uv=. x inputdict {."1 y do. uv
else.

  ix=. (>dnix__DL obj),'__DL'      NB. directory object noun name
  fp=. ".({.>dncn__DL obj),'P__DL' NB. file pointer

  pos=. (".ix) i. {."1 y           NB. inverted list replacement positions

  NB. objects exist in put dictionary update explain text
  if. badrc uv=. (pos;<<{:"1 y) invreplace fp;CNEXPLAIN do. uv return. end.

  uv=. ' ',>dnnm__DL obj
  ok ((":#pos),uv,OK055) ; DNAME__DL
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


putntstamp=:4 : 0

NB.*putntstamp v-- store name, creation and last put timestamps.
NB.
NB. dyad: (iaObject ;< ba) putntstamp btNts
NB.
NB.   'rc nts'=: 0 _14 get }. revo ''
NB.   DL=: {:{:DPATH__ST__JODobj
NB.   (WORD;<DL) putntstamp__ST__JODobj nts

NB. validate name/creation/lastput array 
if. badrc uv=. checkntstamp y do. uv return. else. uv=. rv uv end.

NB. directory object !(*)=. DL
'obj DL'=. x  

NB. timestamp names must exist on current path:  errmsg: not on path ->
tn=. ;0{uv [ pn=. ; }. pathnl obj
if. 0 e. bm=. tn e. pn do. (jderr ERR083),(-.bm)#tn return. end.

NB. get current timestamps and object index
if. badrc cts=. gettstamps__DL obj do. cts return. else. cts=. rv cts end.
oix=. ".(>dnix__DL obj),'__DL'

pos=. oix i. tn           NB. timestamp name positions in index
pix=. pos -. #oix         NB. put dictionary name positions
npn=. (I. pos = #oix){tn  NB. names that are not in put dictionary
ppn=. pix{oix             NB. names that are in put dictionary

NB. update put dictionary timestamps - insure shape is unchanged
scts=. $cts
cts=. ((tn i. ppn) {"1 ;1{uv) pix}"1 cts
if. -.scts -: $cts do. jderr ERR102 return. end.

NB. attempt to save changes
if. badrc uv=. obj puttstamps__DL cts do. uv 
else. 
  ok ('(',(":#ppn),OK064,(":#npn),OK065);(<ppn),<npn
end.
)


puttable=:4 : 0

NB.*puttable v-- stores (name,text) and (name,type,value) tables.
NB. Used  to  store tests,  macros, and word tables. Result  is a
NB. return code and message. Note: the directory object reference
NB. (DL) has been set before calling this verb.
NB.
NB. dyad:  (iaObj ; bacl) puttexts btNameScript|btNameTypeValue
NB.
NB.   (TEST;<DL) puttable ('name1';'name2') ,. 'script...';'script...'

'code DL' =. x  NB. directory object !(*)=. DL

if. loaddir__DL code do.
  jderr ERR054  NB. errmsg: unable to load directory
else.
  y=. >{:y

  NB. depends on first char of index list matching (cP_DL) nouns
  fc=. {. ixn =. (>dnix__DL code),'__DL'
  cnn=. (>dncn__DL code),'__DL'

  NB. either new or replacements
  uv=. (".ixn) i. {."1 y
  b=.  uv = #".ixn
  pc=. 0

  NB. replace (will not change key directory lists)
  dfopen__DL fc
  fp=. ".fc,'P__DL'

  if. 0 e. b do.
    if. badrc msg=. (code;ixn;cnn;fp;<DL) rplctable (<(-.b)#y),<(-.b)#uv do.
      msg [ dfclose__DL fc return.
    end.
    pc=. pc + rv msg
  end.

  NB. append (always appends to key directory lists)
  if. 1 e. b do.
    if. badrc msg=. (code;ixn;cnn;fp;<DL) apptable b#y do.
      msg [ dfclose__DL fc return.
    end.
    pc=. pc + rv msg

    NB. stamp good directory change
    (<(#".ixn);now '') jreplace fp;CNMARK
  end.
  dfclose__DL fc

  uv=. ' ',,>dnnm__DL code
  ok ((":pc),uv,OK057) ; DNAME__DL
end.
)


puttexts=:4 : 0

NB.*puttexts  v--  stores  object  documentation and  group/suite
NB. texts.
NB.
NB. dyad:  (iaObject ; iaOffset ;< ba) puttexts bt|blcl

NB. validate texts
if. badrc y=. checknttab y do. y return. else. y=. rv y end.

'obj offset DL'=. x  NB. directory object !(*)=. DL

if. -.offset e. 0 1 do. jderr ERR090  NB. errmsg: file offset invalid
elseif. badrc uv=. (obj;<DL) inputdict {."1 y do. uv
elseif.do.

  ix=. (>dnix__DL obj),'__DL'   NB. directory object index noun
  cn=. (>dncn__DL obj),'__DL'   NB. directory object component name
  fp=. ".({.cn),'P__DL'         NB. file pointer

  NB. text components
  rcn=. (".ix) i. uv=. {."1 y
  rcn=. offset + rcn{".cn

  NB. read components and test contents
  dat=. jread fp;rcn
  if. uv badcn dat do.
    jderr ERR055 return.  NB. errmsg: directory-data inconsistency
  end.

  dat=. >dat  NB. HARDCODE: group/suite index 1, document index 3
  dat=. ({:"1 y) (<a:;offset{1 3)} dat

  if. badreps (<"1 dat) jreplace fp;rcn do.
    jderr ERR056 return.  NB. errmsg: replace failure
  end.

  uv=. ' ',(>dnnm__DL obj),' '
  ok ((":#rcn),uv,(>offset{'text';'document'),OK057) ; DNAME__DL
end.
)


putwords=:4 : 0

NB.*putwords v-- stores  words  in the  words  file.  Result is a
NB. return code and message.
NB.
NB. dyad:  (cl ; baObj) putwords blclWords
NB.
NB.   ('locale';<<'2') putwords 'words';'are';'us'

if.     badrc uv=. checknames y  do. uv
elseif. y=. ~.}.uv      NB. unique deblanked names
        'loc DL'=. x    NB. source locale and directory object !(*)=. DL
        b=. wex uv=. y ,&.> locsfx loc  NB. do words exist
        0 e. b  do. (jderr ERR053) , (-.b)#uv  NB. errmsg: word(s) do not exist
NB. insure word directory is ready
elseif. loaddir__DL  WORD do.
  jderr ERR054 NB. errmsg: unable to load directory
elseif. do.

  NB. words are either new or replacements
  uv=. WORDIX__DL i. y
  b=.  uv = #WORDIX__DL
  pc=. 0

  dfopen__DL 'W'
  NB. replace words (will not change key directory lists)
  if. 0 e. b do.
    dropnc__DL WORD  NB. replacements can change word class
    if. badrc msg=. x rplcwords (<(-.b)#y),<(-.b)#uv do.
      msg [ dfclose__DL 'W' return.
    end.
    pc =. pc + rv msg
  end.

  NB. append new words (always appends to key directory lists)
  if. 1 e. b do.
    dropnc__DL WORD  NB. new words - force reload of name class if necessary
    if. badrc msg=. x appwords b#y do. msg [ dfclose__DL 'W' return. end.
    pc=. pc + rv msg

    NB. stamp good directory change
    (<(#WORDIX__DL);now '') jreplace WP__DL;CNMARK
  end.
  dfclose__DL 'W'

  ok ((":pc),OK051) ; DNAME__DL
end.
)


putwordxrs=:4 : 0

NB.*putwordxrs v-- stores global word references
NB.
NB. dyad:  (cl ;< ba) putwordxrs blcl

'name DL'=. x NB. directory object !(*)=. DL

NB. check path prior to storing or changing references
if. badrc msg=. checkpath DL do. msg
elseif. loadref__DL WORD do. jderr ERR079  NB. errmsg: unable to load references
elseif.do.

  NB. word references are either new or replacements
  pos=. WORDREFIX__DL i. <name
  b=. pos = #WORDREFIX__DL

  NB. categorize references and test for path existence
  if. #y=.catrefs y do.
    if. badrc uv3=. pathnl WORD do. uv3 return. end.
    if. 0 e. uv2=. (uv=. 0{::y) e. ;}.uv3 do.
      (jderr ERR083),uv #~ -.uv2 return.  NB. errmsg: not on path
    end.
  end.

  dfopen__DL 'U'
  fp=. UP__DL

  uv3=. 0
  if. b do.
    NB. append new references
    NB. append only non-null lists
    if. #y do.
      NB. append reference list
      y=. <name;WORD;<y
      if. badappend cn=. y jappend fp do.
        jderr ERR058 [ dfclose__DL 'U' return.  NB. errmsg: append failure
      end.
      uv=.  WORDREFIX__DL , <name
      uv2=. WORDREFCN__DL , cn
      uv3=. 1
    end.
  else.
    NB. replace references (removing nulls if necessary)
    NB. NIMP directory-data consistency check
    if. #y do.
      NB. non-null replacement list
      y=. <name;WORD;<y
      if. badreps y jreplace fp;pos{WORDREFCN__DL do.
        jderr ERR056 [ dfclose__DL 'U' return.  NB. errmsg: replace failure
      end.
    else.
      NB. replacement has no references remove from directory
      uv3=. 0 pos} (#WORDREFIX__DL)#1
      uv=.  uv3#WORDREFIX__DL
      uv2=. uv3#WORDREFCN__DL
      uv3=. 1
    end.
  end.

  NB. update reference directory and close
  if. uv3 do.
    if. badrc msg=. (WORD,fp) saveref__DL uv;uv2 do. msg [ dfclose__DL 'U' return. end.
  end.
  dfclose__DL 'U'

  ok ('<',name,'>',OK056) ; DNAME__DL
end.
)


rplctable=:4 : 0

NB.*rplctable v-- replaces (name,text) and (name,type,value) tables to file.
NB.
NB. dyad:  bl rplctable (btTable ,< ilPositions)

'ttype ixn cnn fp DL'=. x  NB. directory object !(*)=. DL
y=. 0 [ 'tab pos'=. y

sizes=. #&> {:"1 tab
tc=. #tab [ cn=. pos{".cnn
pf=. PUTFACTOR__DL

NB. for words and macros record class/type
if. wmt=. ttype e. WORD,MACRO do.
  class=. ; 1 {"1 tab
end.

while. #tab do.
  cnt=. pf <. #tab
  tn=.  cnt{.tab [ rcn=. cnt{.cn

  NB. read components and test contents
  dat=. jread fp;rcn
  if. ({."1 tn) badcn dat do.
    jderr ERR055 return.  NB. errmsg: directory-data inconsistency
  end.

  NB. replace
  if. badreps (<"1 tn) jreplace fp;rcn do.
    jderr ERR056 return.  NB. errmsg: replace failure
  end.

  tab=. cnt}.tab [ cn=. cnt}.cn
end.

NB. set up replacements
if. wmt do.
  dropnc__DL ttype NB. replacements can change class/type
  invcmps=. CNCLASS,CNPUTDATE,CNSIZE
  reps=. pos;<class;(tc#nowfd now '');sizes
else.
  invcmps=. CNPUTDATE,CNSIZE
  reps=. pos;<(tc#nowfd now '');sizes
end.

if. badrc msg=. reps invreplace fp;invcmps do. msg else. ok tc end.
)


rplcwords=:4 : 0

NB.*rplcwords v-- replaces extant words.

'loc DL'=. x  NB. directory object !(*)=. DL
'names pos'=. y
cn=. pos{WORDCN__DL
wc=. #pos

wp=. WP__DL [ pf=. PUTFACTOR__DL
lnames=. names ,&.> locsfx loc
size=. class=. i.0

while. #names do.
  cnt=. pf <. #names
  wn=. cnt{.names [ lwn=. cnt{.lnames [ rcn=. cnt{.cn

  NB. read components and test contents - this slows things
  NB. down but significantly improves database hygiene
  dat=. jread WP__DL;rcn
  if. wn badcn dat do.
    jderr ERR055  NB. errmsg: directory-data inconsistency
  end.

  val=. wrep&.> lwn   NB. word values
  bsz=. #&> val       NB. NIMP word byte sizes (size test)
  bnc=. nc lwn        NB. word name class
  val=. , <"1 wn ,. (<"0 bnc) ,. val

  NB. replace words
  if. badreps val jreplace wp;rcn do.
    jderr ERR056  NB. errmsg: replace failure
  else.
    size=. size , bsz
    class=. class , bnc
  end.

  names=. cnt}.names [ lnames=. cnt}.lnames [ cn=. cnt}.cn
end.

msg=. ERR057  NB. errmsg: directory update failure
if. wc ~: #size do. jderr msg return. end.

reps=. pos;<class;(wc#nowfd now '');size
if. badrc msg=.reps invreplace wp;CNCLASS,CNPUTDATE,CNSIZE do. msg else. ok wc end.
)

NB. raise, nub and sort blblcl name lists
sortdnub=:[: /:~ [: ~. ;