NB. *jod c-- main JOD dictionary class.
NB.
NB. All other dictionary classes are extensions of the dictionary class.
NB. They all use standard constants and verbs defined in this class.
NB.
NB. Creating a JOD object defines a (ijod) locale interface.
NB. Destroying a JOD object erases the (ijod) locale interface.
NB.
NB. Contains: dictionary utilities, constants, interface verbs
NB.
NB. Interface: (verbs made available by ijod locale)
NB.   bget    NIMP: get objects from put dictionary backups 
NB.   bnl     NIMP: backup name lists from patterns
NB.   del     delete words, tests, groups, macros, et cetera
NB.   did     dictionary identification
NB.   dnl     dictionary name lists from patterns
NB.   dpset   sets dictionary parameters
NB.   gdeps   list group and suite dependents
NB.   get     get words, tests, macros, et cetera from dictionary
NB.   globs   word and test global name references
NB.   grp     create and query groups and suites
NB.   make    generate J scripts and database dumps
NB.   mnl     NIMP: many dictionary name lists from patterns
NB.   newd    create new dictionary
NB.   od      opens and closes dictionaries
NB.   packd   pack dictionaries
NB.   put     put words, tests, macros, et cetera into dictionary
NB.   regd    register/unregister a dictionary
NB.   restd   restore last backup created by (packd)
NB.   rxs     NIMP: regular expression search
NB.   uses    words used by words and tests
NB.
NB. Notes:
NB.   Error messages (JOD errors 000-049)

coclass  'ajod'
coinsert 'ijod'
require 'jfiles regex task'

NB.*dependents x-- words defined in this section have related definitions

NB. host specific z locale nouns set during J profile loading
NB. (*)=: IFWIN UNAME IFIOS

NB. line feed, carriage return, tab and line ends
LF=:10{a.
CR=:13{a.
TAB=:9{a.
CRLF=:CR,LF

NB. macro script option codes - to add more add a new object code
NB. and modify the following definition of MACROTYPE
JSCRIPT=:21
LATEX=:22
HTML=:23
XML=:24
TEXT=:25
BYTE=:26
MARKDOWN=:27
UTF8=:28

NB. macro text types, depends: JSCRIPT,LATEX,HTML,XML,TEXT,BYTE,MARKDOWN,UTF8
MACROTYPE=:JSCRIPT,LATEX,HTML,XML,TEXT,BYTE,MARKDOWN,UTF8

NB. object codes
WORD=:0
TEST=:1
GROUP=:2
SUITE=:3
MACRO=:4

NB. dictionary self reference
DICTIONARY=:5

NB. object name class, depends: WORD,TEST,GROUP,SUITE,MACRO
OBJECTNC=:WORD,TEST,GROUP,SUITE,MACRO

NB. bad object code, depends: OBJECTNC
badobj=:[: -. [: *./ [: , ] e. OBJECTNC"_

NB. path delimiter character & path punctuation characters
PATHDEL=: IFWIN { '/\'
PATHCHRS=:' :.-',PATHDEL

NB. path verbs - embed /\ chars depending on host OS
hostsep=: (IFWIN{'/\')&(((IFWIN{'\/') I.@:= ])})

NB. extracts only the path from qualified file names
justpath=:[: }: ] #~ ([: -. [: +./\. ':'&=) *. [: +./\. PATHDEL&=

NB. default master profile user locations
NB. jodsystempath is left global here as this
NB. verb is defined in jodon.ijs
JMASTER=:jodsystempath 'jmaster'
JODPROF=:jodsystempath 'jodprofile.ijs'
JODUSER=:jodsystempath 'joduserconfig.ijs'

NB.*enddependents
NB.*end-header

NB. valid characters in file and path names
ALPHA=:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

NB. master file cn: dictionary number log - see long documentation
CNMFDLOG=:10

NB. master file cn: in use bit
CNMFMARK=:0

NB. master file cn: dictionary parameter defaults
CNMFPARMDEFS=:9

NB. master file cn: dictionary parameters - see long documentation
CNMFPARMS=:7

NB. master file cn: main dictionary table - see long documentation
CNMFTAB=:2

NB. master file cn: main dictionary table backup
CNMFTABBCK=:3

NB. default option code
DEFAULT=:7

NB. comment tag marking end of dependents section
DEPENDENTSEND=:'enddependents'

NB. comment tag marking start of dependents section
DEPENDENTSSTART=:'dependents'


DIGITS=:'0123456789'

NB. document option code
DOCUMENT=:9

NB. controls dependent block processing - (1) process (0) do not process
DODEPENDENTS=:1

NB. dictionary path table - see long documentation
DPATH=:i.0 4

NB. maximum dictionary path length
DPLIMIT=:32


ERR001=:'invalid option(s)'
ERR002=:'invalid name(s)'
ERR003=:'name(s) to long'
ERR004=:'invalid or missing locale'
ERR005=:'invalid or missing dictionary name(s)'
ERR006=:'cannot read master'
ERR007=:'cannot read master documentation'
ERR008=:'invalid names(s) - embedded locale references'
ERR009=:'no documentation text for ->'
ERR010=:'invalid name pattern'
ERR011=:'error(s) creating dictionary master file'
ERR012=:'master in use - wait or try (dpset)'
ERR013=:'cannot mark master'
ERR014=:'invalid name and text'
ERR015=:'invalid name, class and text'
ERR016=:'definition failure among ->'
ERR017=:'jfile replace error'
ERR018=:'dictionary in use - cannot unregister'
ERR019=:'invalid parameter or value'
ERR020=:'table name(s) are not unique'
ERR021=:'dll error generating GUID'
ERR022=:'JOD z interface clashes with current z locale names. JOD load aborted'
ERR023=:'white space preservation is off - turn on to put'
ERR024=:'dependent section unbalanced'
ERR025=:'only one balanced dependent section allowed'
ERR026=:'error in joduserconfig.ijs - last J error ->'
ERR027=:'unable to set master parameters ->'
ERR028=:'not supported on this environment ->'

NB. explain option code
EXPLAIN=:8

NB. space in bytes required to create dictionary (0 turns off volume sizing)
FREESPACE=:0

NB. group and suite header code
HEADER=:1

NB. database file extension (it's changed in the past)
IJF=:'.ijf'

NB. J script file extension
IJS=:'.ijs'

NB. inverted data code: name classes and macro types
INCLASS=:12

NB. inverted data code: object creation time
INCREATE=:13

NB. inverted data code: last object put time
INPUT=:14

NB. inverted data code: object size in bytes
INSIZE=:15

NB. core JOD interface - loaded into (ijod) - set (setjodinterface)
IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

NB. standard dictionary file names - order matters
JDFILES=:<;._1 ' jwords jtests jgroups jsuites jmacros juses'

NB. standard dictionary subdirectory names - order matters
JDSDIRS=:<;._1 ' script suite document dump alien backup'

NB. default JOD user directory
JJODDIR=:'joddicts\'

NB. regular expression matching valid J names
JNAME=:'[[:alpha:]][[:alnum:]_]*'

NB. version, make and date
JODVMD=:'0.9.987';5;'20 Mar 2016 11:51:07'

NB. base J version - prior versions not supported by JOD
JVERSION=:,6.0199999999999996

NB. default master file parameters
MASTERPARMS=:6 3$'PUTFACTOR';'(+integer) words stored in one loop pass';100;'GETFACTOR';'(+integer) words retrieved in one loop pass (<2048)';250;'COPYFACTOR';'(+integer) components copied in one loop pass';100;'DUMPFACTOR';'(+integer) objects dumped in one loop pass (<240)';50;'DOCUMENTWIDTH';'(+integer) width of justified document text';61;'WWWBROWSER';'(character) browser command line - used for jod help';' "C:\Program Files\Internet Explorer\IEXPLORE.EXE"'

NB. maximum length of short explanation text
MAXEXPLAIN=:80

NB. maximum length of dictionary names
MAXNAME=:60

NB. (name,[class],value) option code
NVTABLE=:10

NB. successful return
OK=:1;1


OK001=:'dictionary unregistered ->'
OK002=:' is a noun - no references'
OK003=:'defaults restored for ->'
OK004=:'master file reset'
OK005=:'path cleared ->'
OK006=:'parameter set ->'
OK007=:'put dictionary is now a read/only library ->'
OK008=:'put dictionary read/write status restored ->'
OK009=:'put dictionary references deleted ->'

NB. indexes of dictionary subdirectories in dictionary parameter list
PARMDIRS=:4 5 6 7 8 9

NB. parameter file - extension is required
PARMFILE=:'jodparms.ijs'

NB. displayed path delimiter character
PATHSHOWDEL=:'/'

NB. search pattern option codes
PATOPS=:1 2 3 _1 _2 _3

NB. controls whether words are saved when whitespace is discarded
PUTBLACK=:0

NB. reference option code
REFERENCE=:11

NB. maximum number of words per locale
SYMBOLLIM=:2048

NB. uses union option code
UNION=:31

NB. retains string after first occurrence of (x)
afterstr=:] }.~ #@[ + 1&(i.~)@([ E. ])

NB. trims all leading and trailing blanks
alltrim=:] #~ [: -. [: (*./\. +. *./\) ' '&=

NB. test for jfile append errors
badappend=:0: > {.


badblia=:4 : 0

NB.*badblia v-- returns 0 if (y) is a boxed list of integer atoms
NB. or singleton codes from (x)

if. _1 -: dat=. , (; :: _1:) y do. 1
elseif. (#y) ~: #dat do. 1
elseif. badil dat do. 1
elseif.do. -. *./ dat e. x
end.
)

NB. 1 if (y) is not boxed
badbu=:[: 32&~: 3!:0

NB. 1 if (y) is not a character list or atom
badcl=:-.@(2&=@(3!:0)) +. 1: < [: # $

NB. 1 if (y) is not floating
badfl=:[: -. 8"_ = 3!:0

NB. 1 if (y) is not a list of non-extended integers
badil=:-.@((([: # $) e. 0 1"_) *. 3!:0 e. 1 4"_)

NB. bad jfile operation
badjr=:[: +./ _1 _2&e.

NB. bad locale name
badlocn=:[ >: [: 18!:0 ::(_2:) [: < ]

NB. bad return code
badrc=:[: -. 1: -: [: > {.

NB. test for jfile replacement errors
badreps=:0: > <./

NB. 1 if any of shape, type or sign differ
badsts=:0:

NB. 1 if items are not unique 0 otherwise
badunique=:# ~: [: # ~.

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])


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

NB. boxes open nouns
boxopen=:<^:(L. = 0:)


catrefs=:3 : 0

NB.*catrefs v-- split into nonlocale and locale names.
NB.
NB. monad:  catrefs blcl

if. (,a:)-:,y do. ''
else.
  r=. islocref&> y  NB. insure 2 item result
  s=. <(-.r) # y
  l=. <r # y
  s,l
end.
)

NB. call dll
cd=:15!:0


changestr=:4 : 0

NB.*changestr v-- replaces substrings - see long documentation.
NB.
NB. dyad:  clReps changestr cl
NB.
NB.   NB. first character delimits replacements
NB.   '/change/becomes/me/ehh' changestr 'blah blah ...'

pairs=. 2 {."(1) _2 [\ <;._1 x      NB. change table
cnt=._1 [ lim=. # pairs
while. lim > cnt=.>:cnt do.         NB. process each change pair
  't c'=. cnt { pairs               NB. /target/change
  if. +./b=. t E. y do.             NB. next if no target
    r=. I. b                        NB. target starts
    'l q'=. #&> cnt { pairs         NB. lengths
    p=. r + 0,+/\(<:# r)$ d=. q - l NB. change starts
    s=. * d                         NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # r)$ 1 0 #~ q,l-q) (,r +/ i. l)} b
      y=. b # y
      if. q = 0 do. continue. end.  NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d r} b            NB. first target char replicated
    end.
    y=.(c $~ q *# r) (,p +/i. q)} y  NB. insert replacements
  end.
end. y                              NB. altered string
)


checknames=:3 : 0

NB.*checknames v-- tests alleged  boxed lists of J names. Accepts
NB. all valid J  names. When (x-:1)  names  with embedded locale
NB. references  are  rejected  otherwise  embedded   locales  are
NB. accepted.
NB.
NB. monad:  checknames cl|blcl
NB.
NB.   checknames 'we';'check';'out'
NB.
NB. dyad:  pa checknames cl|blcl
NB.
NB.   0 checknames ;:'accept our_poor_ locale__NAMES'

1 checknames y
:
msg=. ERR002  NB. errmsg: invalid name(s)
if. 1<#$ y        do. jderr msg return. end.
y=. ,&.> boxopen y   NB. allow char lists
if. +./ badcl&> y do. jderr msg return. end.

if. x do.
  NB. restrict embedded locales
  msg2=. ERR008  NB. errmsg: invalid names(s) - embedded locale references
  if. '_' e. , _1&{.&> y  do. jderr msg2 return. end.
  if. +./ +./@:('__'&E.)&> y do. jderr msg2 return. end.
  if. _2 e. nc y     do. jderr msg return. end.
else.
  NB. permit embedded locales - test must eschew class tests
  NB. to avoid evaluation of indirect locale references
  if. (#jnfrblcl y)~:#y do. jderr msg return. end.
end.

if. MAXNAME < >./ #&> y do. jderr ERR003 return. end. NB. errmsg: name(s) to long
ok trimnl y  NB. return deblanked name list
)


checknttab=:3 : 0

NB.*checknttab v--  checks (name,text)  tables. A name text table
NB. is a two column boxed table. Column 0  contains valid  names.
NB. Column 1 contains character  lists representing various texts
NB. like J scripts, LaTeX or HTML code.
NB.
NB. monad:  checknttab btcl
NB.
NB.  checknttab (;:'n1 n2 n3') ,. 'blah blah..';'more ehh..';'stuff ...'

msg =. ERR014 NB. errmsg: invalid name and text
if. badbu y do. jderr msg
elseif. -. 1 2 e.~ #$ y do. jderr msg
elseif. 2 ~: {: $ y=. plt y do. jderr msg
elseif. +./badcl&> 1 {"1 y do. jderr msg
elseif. badrc uv=.checknames (<a:;0){y do. jderr msg
elseif. badunique uv=. }.uv do. jderr ERR020
elseif.do. ok <y=. uv (<a:;0)} y  NB. insures deblanked names
end.
)


checknttab2=:4 : 0

NB.*checknttab2 v-- checks (name,class,text) tables.  Similar  to
NB. (checknttab)  except the  additional column is a numeric name
NB. class or type code.
NB.
NB. dyad:  ilCodes checknttab2 btcl
NB.
NB.  (i.4) checknttab2 'name';3;'verb=: ...'

msg=. ERR015 NB. errmsg: invalid name, class and text
if. badbu y do. jderr msg
elseif. -. 1 2 e.~ #$ y do. jderr msg
elseif. 3 ~: {: $ y=. plt y do. jderr msg
elseif. +./badcl&> {:"1 y do. jderr msg
elseif. x badblia 1 {"1 y do. jderr msg
elseif. badrc uv=.checknames (<a:;0){y do. jderr msg
elseif. badunique uv=. }.uv do. jderr ERR020
elseif.do. ok <y=. uv (<a:;0)} y  NB. insures deblanked names
end.
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


createmast=:3 : 0

NB.*createmast v-- creates the dictionary master file. The master
NB. file  holds  the  master dictionary  directory and dictionary
NB. parameters. The master file tracks the state of dictionaries.
NB. In  this  system  only  one   task  can   open  a  dictionary
NB. read/write. When  opening a  dictionary  the master  file  is
NB. checked to  determine  if  the  dictionary  has  been  opened
NB. read/write  by  another  task.  Dictionaries  can  be  opened
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

NB. character table to newline delimited list
ctl=:}.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@]))

NB. YYYYMMDD to YYYY MM DD - see long document
datefrnum=:0 100 100&#:@<.

NB. enclose all character lists in blcl in " quotes
dblquote=:'"'&,@:(,&'"')&.>


decomm=:3 : 0
                                                                 
NB.*decomm v--  removes comments  from j words. The (x) argument
NB. specifies whether all blank lines are removed or retained.   
NB.                                                              
NB. monad:  decomm ctWord                                        
NB.                                                              
NB.   decomm jcr 'decomm'  NB. decomment self                    
NB.                                                              
NB. dyad:  pa decomm ctWord                                      
NB.                                                              
NB.   1 decomm jcr 'decomm'  NB. remove blanks (default)         
NB.   0 decomm jcr 'decomm'  NB. retain all blank lines          
                                                                 
1 decomm y                                                      
:
NB. mask of unquoted comment starts                              
c=. ($y)$'NB.' E. ,y                                           
c=. +./\"1 c > ~:/\"1 y e. ''''                                 
y=. ,y                                                         
                                                                 
NB. blank out comments                                           
y=. ' ' (I. ,c)} y                                     
y=. y $~ $c                                                    
                                                                 
NB. remove blank lines - default                                 
if. x do. y #~ y +./ . ~: ' ' end.                            
)


defzface=:4 : 0

NB.*defzface v-- define (ijod) interface from word list.
NB.
NB. dyad:  blcl =. clSuffix defzface blclWords

NB. if the top level error trap word exists
NB. define an error trapping interface
if. 3 = (4!:0) <'jodsf_ijod_' do. 
  iface=. (y ,&.> locsfx x) ,&.> <' :: jodsf'
else.
  iface=. y ,&.> locsfx x
end.
(y ,&.> <'_ijod_=:') ,&.> iface
)


del=:3 : 0

NB.*del v-- deletes objects in dictionary database  files. Result
NB. is  a return code and message. The deletion only modifies the
NB. object's directory. The  actual data  remains in the file  as
NB. "dead"  components  until a (packd)  operation reclaims  file
NB. space.
NB.
NB. monad:  del blclWords
NB.
NB.   del ;: 'we are toast'
NB.
NB. dyad:  iaObject del blclName
NB.
NB.   1 del 'toast these tests'

WORD del y
:
msg=. ERR001
if. badil x do. jderr msg return. end.

NB. do we have a put dictionary open?
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv

select. x
case. WORD do.
  (WORD;INVWORDS__ST;<DL) delstuff__ST y
case. TEST do.
  (TEST;INVTESTS__ST;<DL) delstuff__ST y
case. GROUP do.
  (GROUP;INVGROUPS__ST;<DL) delstuff__ST y
case. SUITE do.
  (SUITE;INVSUITES__ST;<DL) delstuff__ST y
case. MACRO do.
  (MACRO;INVMACROS__ST;<DL) delstuff__ST y
case. REFERENCE do.
  if. badrc y=. checknames y do. y
  elseif. badrc msg=. DL delwordrefs__ST }. y do. msg
  elseif.do. (ok OK009),<DNAME__DL
  end.
case. do. jderr msg
end.
)


destroyjod=:3 : 0

NB.*destroyjod v--  dictionary  object  destroy  verb.  This  verb
NB. erases the JOD (ijod) locale user interface.
NB.
NB. monad:  destroyjd uuIgnore

NB. close any open dictionaries
3 od ''

NB. erase current direct _n_ ijod locale references
NB. (*)=. IZJODALL JODEXT
(4!:55) IZJODALL ,&.> locsfx 'z'

NB. destroy sub-objects !(*)=. ST MK UT SO
coerase ST,MK,UT,SO

NB. destroy any JOD class extension objects
coerase JODEXT

NB. return self reference
18!:5 ''
)


did=:3 : 0

NB.*did v-- dictionary identification and statistics
NB.
NB. monad:  did uuIgnore
NB. dyad:  uuIgnore did uuIgnore

if. badrc msg=. checkopen__ST 0 do. msg else. ok {."1 DPATH__ST end.
:
0 didstats__ST 0
)


didnum=:3 : 0

NB.*didnum  v--  generates  a  unique extended  precision integer
NB. based GUID.  The GUID is designed to produce a unique  global
NB. identifier every time it's called.
NB.
NB. monad:  didnum uuIgnore

NB. Original Windows only code
NB. call dll to get GUID
NB. guid=. genguid <16#' '
NB. if. 0 ~: >{. guid do. jderr ERR021
NB. else.
NB.  NB. guid as 128 bit mask
NB.  guid=. , (a. i. >{: guid){ truth 8
NB.
NB.  NB. convert mask to an integer computing
NB.  NB. only required extended powers of 2
NB.  pos=. I. guid
NB.  +/(2x ^ pos) pos} guid
NB. end.

NB. More general Win/Linux/Mac code
guidsx i.0
)


dnl=:3 : 0

NB.*dnl v-- list objects in dictionary database files.
NB.
NB. monad:  dnl clStr|zlStr
NB.
NB.   dnl ''        NB. list all words on path
NB.   dnl 'pfx'     NB. list all words on path begining with 'pfx'
NB.
NB. dyad:  ilCodes dnl clStr|zlStr
NB.
NB.   4 2  dnl 'ex'  NB. macros with names containing 'ex'
NB.   0 _1 dnl 'ugh' NB. path order listing of words ending with 'ugh'

WORD dnl y
:
if. badrc msg=.x nlargs y do. msg return. end.

NB. format standard (dnl) (x) options and search
x=.  x , (<:#x)}. 1 , DEFAULT
if. ({. x) e. OBJECTNC do. x dnlsearch__ST y else. jderr ERR001 end.
)


dpset=:3 : 0

NB.*dpset v-- set dictionary parameters.
NB.
NB. monad:  dpset zl | clCommand | (cllParm ; uuValue)
NB. dyad:  iaCode dpset (clParm ; uuValue)

NB. objects !(*)=. DL ST

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


dptable=:3 : 0

NB.*dptable  v--  parses MASTERPARMS.
NB. 
NB. (MASTERPARMS) is set by running the script (jodparms.ijs).
NB.
NB. monad:  dptable clParms
NB.
NB.   0!:0 <jpath '~addons\general\jodparms.ijs'
NB.   dptable__JODobj  MASTERPARMS

NB. parse MASTERPARMS table - remove J comments
y=. (<;._1)"1  ';' ,. decomm ];._2 y -. CR

NB. remove extra blanks
y=. (alltrim&.>(<a:;0 1){y) (<a:;0 1)} y

NB. handle parm types currently only (+integer) and (character)
NB. NIMP - there is no error checking for dictionary parameters
ptype=. > 1{"1 y
pint=. I. (,:'(+integer)') ({."1)@E. ptype

NB. character and other types left as is
NB. char=. I. (,:'(character)') ({."1)@E. ptype
y=. (".&.> (<pint;2){y) (<pint;2)} y
)

NB. 1 if empty dictionary name list 0 otherwise
empdnl=:(,<0$0) -: ]

NB. test boxed list of path\file names for existence (0 some bad, 1 all ok)
fex=:*./@:(1:@(1!:4) ::0:)

NB. 0's all but the first 1 in runs of 1's
firstone=:] > [: }: 0: , ]

NB. first of doubles
fod=:] #~ 1 0"_ $~ #

NB. first on path order list index - see long documentation
fopix=:1: i.~ [ +/@:e.&> [: < [: < ]


gdeps=:3 : 0

NB.*gdeps v-- group and suite dependents.
NB.
NB. Dependents are global J assignments between the dependents tags:
NB.
NB. verbatim:
NB.
NB.    NB.*dependents
NB.    NB.*enddependents
NB.
NB. monad:  gdeps clGroup
NB.
NB.   gdeps 'jod'
NB.
NB. dyad:   iaGScode gdeps clGroupSuite
NB.
NB.   3 gdeps 

GROUP gdeps y
:
if. badil x     do. jderr ERR001 NB. errmsg: invalid options 
elseif. badcl y do. jderr ERR002 NB. errmsg: invalid name(s)
elseif.  x=. {.x
         -. x e. GROUP,SUITE do. jderr ERR001
elseif.  badrc uv0=. (x,1) obtext__UT y do. uv0 
elseif.do.
  uv0=. ,>2{uv0
  NB. hides tags from searches
  beg=. 'NB.*',DEPENDENTSSTART
  fin=. 'NB.*',DEPENDENTSEND
  tcnt=. (+/beg E. uv0),+/fin E. uv0 
  select. tcnt
  case. 0 0 do. ok ''
  case. 0 1 do. jderr ERR024  NB.errmsg: dependent block unbalanced
  case. 1 0 do. jderr ERR024
  case. 1 1 do.
     uv0=. ];._1 LF,fin beforestr uv0 -. CR
     0 namecats__MK uv0 }.~ I. (,:beg) +./"1@E. uv0
  case.do.
    jderr ERR025 NB. errmsg: only one balanced dependent block allowed
  end.
end.
)


get=:3 : 0

NB.*get v-- retrieves objects from dictionary database files.
NB.
NB. monad:  get blcl
NB.
NB.   get ;: 'us poor little words'
NB.
NB. dyad:  ilCodes get bluu
NB.
NB.   2 7 put 'GroupName';'Group documentation text ....'

WORD get y
:
msg=. ERR001 [ loc =. <'base' NB. errmsg: invalid option(s)

if. badil x do.
  NB. errmsg: invalid or missing locale
  if. _2&badlocn x do. jderr ERR004 return. else. x=. WORD [ loc=. <x-.' ' end.
end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options
x=. x , (-3-#x) {. DEFAULT , 0
if. -. 0 1 e.~ {: x do. jderr msg return. end.

select. {. x
case. WORD do.
  select. second x
    case. DEFAULT  do. loc defwords__ST y
    case. EXPLAIN  do. WORD getexplain__ST y
    case. DOCUMENT do. WORD getdocument__ST y
    case. NVTABLE  do. (WORD,0) getobjects__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. WORD getntstamp__ST y
    case.do. jderr msg
  end.
case. TEST do.
  select. second x
    case. DEFAULT  do. (TEST,0) getobjects__ST y
    case. EXPLAIN  do. TEST getexplain__ST y
    case. DOCUMENT do. TEST getdocument__ST y
    case. INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. TEST getntstamp__ST y
    case.do. jderr msg 
  end.
case. GROUP do.
  select. second x
    case. DEFAULT  do. GROUP getgstext__ST y
    case. EXPLAIN  do. GROUP getexplain__ST y
    case. DOCUMENT do. GROUP getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case. -INPUT   do. GROUP getntstamp__ST y
    case.do. jderr msg
  end.
case. SUITE do.
  select. second x
    case. DEFAULT  do. SUITE getgstext__ST y
    case. EXPLAIN  do. SUITE getexplain__ST y
    case. DOCUMENT do. SUITE getdocument__ST y
    case. INCREATE;INPUT do. (2{.x) invfetch__ST y
    case. -INPUT   do. SUITE getntstamp__ST y
    case.do. jderr msg
  end.
case. MACRO do.
  select. second x
    case. DEFAULT  do. (MACRO,0) getobjects__ST y
    case. EXPLAIN  do. MACRO getexplain__ST y
    case. DOCUMENT do. MACRO getdocument__ST y
    case. INCLASS;INCREATE;INPUT;INSIZE do. (2{.x) invfetch__ST y
    case. -INPUT   do. MACRO getntstamp__ST y
    case.do. jderr msg
  end.
case. DICTIONARY do.
  select. second x
    case. DEFAULT  do. getdicdoc__ST 0
    case.do. jderr msg
  end.
case.do. jderr msg
end.
)


globals=:4 : 0
if. badcl y do. jderr ERR002 return. end. NB. errmsg: invalid name(s)
if. badrc y=. 0 checknames y do. y
else.
  y =.>1{y
  NB. use base locale if no locale reference
  if. -.islocref y do. y=. y,'_base_' end.
  x wrdglobals__MK y
end.
)


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


grp=:3 : 0

NB.*grp v-- create and modify groups.
NB.
NB. monad:  grp blcl
NB. dyad: ia grp ?

GROUP grp y
:
select. x
  case. GROUP do. (GROUP,WORD) gsmakeq y
  case. SUITE do. (SUITE,TEST) gsmakeq y
  case.do. jderr ERR001 NB. errmsg: invalid option(s)
end.
)


gsmakeq=:4 : 0

NB.*gsmakeq v-- make or query groups and suites.
NB.
NB. dyad:  ilCodes gsmakeq blcl

'gscode obcode'=. x

if. isempty y do. gscode dnl ''
else.
  if. badcl y do.

    NB. create/modify group
    if. badrc mdl=. checkput__ST 0  do. mdl return. end.
    if. badrc msg=. checkpath__ST {: mdl do. msg return. end.
    NB. remove empties from name list allows (grp 'name';'') to create null groups
    if. badrc y=.  checknames y -. a: do. y return. end.
    (({:mdl);obcode;gscode) putgs__ST }. y

  else.

    NB. query group contents
    if. badrc msg=. checkopen__ST 0 do. msg return. end.
    if. badrc y=. checknames y do. y return. end.
    gscode gslistnl__ST rv y
  end.
end.
)


guids=:3 : 0

NB.*guids v-- create guids as 16 byte strings on supported J systems.
NB.
NB. This verb taken from ~addons/general/misc/guids.ijs returns guids
NB. on Windows, Linux and Mac systems. 
NB.
NB. monad:  guids zl | ilShape
NB. 
NB.   guids ''    NB. create guid as a 16-byte character string
NB.   guids $0
NB.   guids 3 4   NB. create 3x4 array of 16-byte strings

if. IFWIN do.
  cmd=. 'ole32 CoCreateGuid i *c'
else.
  cmd=. ((UNAME-:'Darwin'){::'libuuid.so.1';'libSystem.B.dylib'),' uuid_generate n *c'
end.
>{:"1 cmd 15!:0"1 0 <"1 (y,16)$' '
)

NB. guids as extended precision integers: guidsx i.0 [ guidsx 3 5
guidsx=:256 #. [: x: a. i. guids

NB. returns result of linux/unix commands as text string
host=:[: 2!:0 '('"_ , ] , ' || true)'"_

NB. 1 if noun is empty on any axis and 0 otherwise
isempty=:0: e. $

NB. 1 if name is a locale reference 0 otherwise
islocref=:('_'"_ = {:) +. [: +./ '__'"_ E. ]

NB. error trapped call to jappend_jfiles_
jappend=:jappend_jfiles_ ::(_2:)

NB. character table representation of j words, call:  jcr 'verb'
jcr=:[: ];._1 (10{a.) , [: 5!:5 <

NB. error trapped call to jcreate_jfiles_
jcreate=:jcreate_jfiles_ ::0:

NB. format error message
jderr=:0: ; '!JOD error: '"_ , ]


jdmasterr=:3 : 0

NB.*jdmasterr v-- master error handling.
NB.
NB. Use when the master file is set otherwise the master will not
NB. be  properly reset. Because of the file overhead I decided to
NB. use a second error  handler  instead  of  burdening the  very
NB. frequently called  (jderr)  with this  often unnecessary file
NB. access function.

if. badrc msg=.markmast~0 do. msg else. jderr y end.
)


jnfrblcl=:3 : 0

NB.*jnfrblcl  v-- extracts valid  J names  from  boxed  lists  of
NB. character lists. Only  proper  unquoted,  inflection free (no
NB. trailing .'s)  names are  returned. This  verb extracts names
NB. without using name class tests. Class tests cannot be used on
NB. indirect locale names, eg. (BOO__HOO)  as the noun (HOO) must
NB. exist.
NB.
NB. monad: jnfrblcl  blcl
NB.
NB.   jnfrblcl 'good';' '' bad';'888';'ok';'notok.';'3r7'

NB. trim end blanks and eliminate any empties
y=. y #~ 0 < #&> y=.alltrim&.> y

NB. remove all lists containing invalid name characters
y=. y #~ y *./@:e.&> <ALPHA,'_'

NB. remove all lists beginning with numerals and _
y=. y #~ -.({.&> y) e. '_0123456789'

NB. extract any remaing names with regular expression
if. #y do. JNAME rxall ; y ,&.> ' ' else. '' end.
)

NB. standarizes J path delimiter to unix/linux forward slash
jpathsep=:'/'&(('\' I.@:= ])})

NB. error trapped call to jread_jfiles_
jread=:jread_jfiles_ ::(_2:)

NB. error trapped call to jreplace_jfiles_
jreplace=:jreplace_jfiles_ ::(_2:)

NB. extracts the drive from qualified file names
justdrv=:[: }: ] #~ [: +./\. ':'&=


jvn=:3 : 0

NB.*jvn-- J version number.
NB.
NB. monad:  na =. jvn uuIgnore

NB. J version number
ver=. 9!:14 ''
ver=. (ver e. '0123456789/')#ver

NB. return version 6.01 if string is not numeric
100 %~ , 601 ". (ver i. '/') {. ver
)

NB. removes all leading and trailing CR and LF characters
lfcrtrim=:] #~ [: -. [: (*./\. +. *./\) ] e. (10 13{a.)"_

NB. surround names with locale delimiters, eg: _name_
locsfx=:'_'&,@,&'_'&.>


make=:3 : 0

NB.*make v-- makes J scripts.
NB.
NB. monad:  make zl|cl
NB.
NB.   make ''  NB. basic put dump
NB.
NB. dyad:  ilObjOpt make cl|blcl
NB.
NB.   0 make ;:'an arbitrary list of words into a script and file it'
NB.   0 2 make ;: 'a list of words returned as a character list'
NB.
NB.   3 make 'suite'    NB. make suite write to script subdirectory
NB.   2 2 make 'group'  NB. make group return character list
NB.
NB.   NB. make groups that are not in put dictionary
NB.   NB. file is written to put dictionary script directory
NB.   2 _1 make 'deepgroup'

makedump__MK y
:
msg=. ERR001  NB. errmsg: invalid option(s)
if. badil x do. jderr msg return. end.

NB. do we have a dictionary open?
if. badrc uv=. checkopen__ST 0 do. uv return. end.

NB. format standard (x) options HARDCODE
x=. 2 {. x , 1 2
if. -.({: x) e. _2 _1 1 2 do. jderr msg return. end.

if. ({. x) e. GROUP,SUITE do. x makegs__MK y
elseif.  ({. x)=WORD do.
  if. badrc uv=.WORD obtext__UT y do. uv
  elseif. 1={: x do. (WORD;1{uv) writeijs__MK >{:uv
  elseif.do. ok >{: uv
  end.
elseif.do. jderr msg
end.
)

NB. make a directory (1 success, 0 failure)
makedir=:1!:5 ::0:


markmast=:3 : 0

NB.*markmast v-- marks the master dictionary file. This system is
NB. is primarily  a single  writer  system. Many dictionary tasks
NB. can read data but only one  task can  change  it.  The master
NB. file  is used to enforce this  protocol. (markmast)  sets and
NB. unsets a use bit. When the bit is set the master file  itself
NB. cannot be changed.
NB.
NB. monad:  markmast uuIgnore
NB. dyad:   uuIgnore markmast uuIgnore

NB. set the use bit/timestamp in the master file
if. badjr ub=. jread JMASTER;CNMFMARK do. jderr ERR006  NB. errmsg: cannot read master
elseif. >{.>ub do. jderr ERR012  NB. errmsg: master in use - wait or try (dpset)
elseif. badreps (mubmark y) jreplace JMASTER;CNMFMARK do.
  jderr ERR013 NB. errmsg: cannot mark master
elseif.do. ok y
end.
:
NB. dyad resets the master
if. badreps (mubmark 0) jreplace JMASTER;CNMFMARK do. jderr ERR013 else. ok 0 end.
)

NB. master use bit mark
mubmark=:] ; [: (6!:0) 0: $ ]

NB. J name class override - traps limit error for very long names
nc=:4!:0 ::(_2:)


newd=:3 : 0

NB.*newd v-- creates a new dictionary
NB.
NB. monad:  newd clName | (clName ; clPath)
NB.
NB.  newd 'New0Dict'             NB. store in default J user directory
NB.  newd 'New1Dict';'c:\put\it\here'           NB. windows drives 
NB.  newd 'New2Dict';'\\shared\netdrive\new2'   NB. windows UNC shares
NB.  newd 'New3Dict';'/home/john/temp/new3'     NB. linux rooted paths 

if. badcl y do.
  1 newregdict__ST y
else.
  drn=. y -. y -. ALPHA  NB. safe directory chars only
  1 newregdict__ST y;hostsep (jpath '~user\'),JJODDIR,(255<.#drn){.drn
end.
)


nlargs=:4 : 0

NB.*nlargs v-- test basic name list arguments
NB.
NB. dyad:  il nlargs cl

if.     badcl y do. jderr ERR010  NB. errmsg: invalid name pattern
elseif. badil x do. jderr ERR001  NB. errmsg: invalid option(s)
NB. do we have a dictionary open?
elseif.do. checkopen__ST 0 
end.
)

NB. numeric list timestamp
now=:6!:0

NB. convert timestamp to yyyymmdd
nowfd=:([: 0 100 100&#. 3: {. ]) + ([: 24 60 60&#. 3: }. ]) % 86400"_


obidfile=:3 : 0

NB.*obidfile v-- location of jod object id history file.
NB.
NB. monad: obidfile uuIgnore

(jodsystempath ''),'jod.ijn'
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

NB. format normal return
ok=:1: ; ]


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

NB. NIMP: packd/restd not supported on iOS/Android devices for now
NB. if. badrc uv=. checksup 'packd' do. uv return. end.

NB. only put dictionaries can be packed
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. is there enough space on the backup volume?
if. badrc uv=. packspace__DL 0 do. uv return. end.

packdict__DL y
)

NB. promote lists to tables - other ranks unchanged
plt=:]`,:@.(1&=@:(#@:$))


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

NB. quotes character lists for execution
quote=:''''&,@(,&'''')@(#~ >:@(=&''''))

NB. reads a file as a list of bytes
read=:1!:1&(]`<@.(32&>@(3!:0)))

NB. reads a J binary noun file
readnoun=:3!:2@(1!:1&(]`<@.(32&>@(3!:0))))


readobid=:3 : 0

NB.*readobid  v--  unique  object ids  that  opened  dictionaries
NB. read/write on this machine.
NB.
NB. monad: readobid uuIngnore

(readnoun :: ((i.0)"_)) obidfile 0
)


regd=:3 : 0

NB.*regd v-- register and unregister JOD dictionaries.
NB.
NB. monad:  regd blcl
NB.
NB.   regd 'name';'c:\location\of\files';'documentation...'
NB.
NB. dyad:  iaOption make cl
NB.
NB.   3 regd 'name'  NB. unregister dictionary

0 newregdict__ST y
:
if. x-:3 do. NB. HARDCODE option
  NB. errmsg: invalid or missing dictionary name(s)
  if. badcl y do. jderr ERR005 return. end.
  NB. errmsg: dictionary in use - cannot unregister
  if. (<,y) e. {."1 DPATH__ST do. jderr ERR018 return. end.
  NB. errmsg: cannot read master
  if. badjr mdt=. jread JMASTER;CNMFTAB do. jderr ERR006 return. end.
  mdt=.>mdt
  mu=. (0{mdt)=<,y
  if. +./mu do.
    'path inuse'=. 2 3{mu #"1 mdt
    NB. errmsg: dictionary in use - cannot unregister
    if. inuse do. jderr ERR018 return. end.
    newmdt=. (-.mu)#"1 mdt
    if. badrc msg=. markmast 1 do. msg return. end.
    if. badreps ((<newmdt),<mdt) jreplace JMASTER;CNMFTAB,CNMFTABBCK do.
      jdmasterr ERR017 return.  NB. errmsg: jfile replace error
    end.
    if. badrc msg=. markmast~0 do. msg return. end.
    (ok OK001),y;jpathsep path
  else.
    jderr ERR005
  end.
else.
  jderr ERR001
end.
)


remast=:3 : 0

NB.*remast v-- clears all  in use bits  in the  master file. When
NB. JOD  opens a dictionary  an in  use bit is set in the  master
NB. file. When the dictionary  is closed the bit is cleared. When
NB. the  in  use  bit is set  the  dictionary  cannot  be  opened
NB. read/write by other dictionary tasks.
NB.
NB. monad:  remast paMeAll
NB.
NB.   remast 0  NB. reset all
NB.   remast 1  NB. reset me

mdt=. > jread JMASTER;CNMFTAB
if. 0=y do.
  NB. reset all
  mdt=. (<"0 ({:$mdt)#0) 3} mdt
else.
  NB. reset me
  mdt=. (<0) (<3;I. (;3{mdt) e. readobid obidfile 0)}mdt
end.
(<mdt) jreplace JMASTER;CNMFTAB
)


restd=:3 : 0

NB.*restd v-- restores the most recent backup created by (packd).
NB.
NB. monad:  restd cl
NB.
NB.   restd 'backup'

NB. NIMP: packd/restd not supported on iOS/Android devices for now
NB. if. badrc uv=. checksup 'restd' do. uv return. end.

NB. only put dictionaries can be restored
if. badrc uv=. checkput__ST 0 do. uv return. end.
DL=. 1 { uv  NB. directory object !(*)=. DL

NB. is there enough space on the dictionary volume?
if. badrc uv=. restspace__DL 0 do. uv else. (}. uv) restdict__DL y end.
)

NB. ok return value
rv=:>@(1&{)


saveobid=:3 : 0

NB.*saveobid v--  saves the last  n JOD object ids  in the \jnxxx
NB. directory. These globally unique values are used to reset any
NB. dictionaries left open by JOD tasks spawned from  the current
NB. machine.
NB.
NB. monad:  saveobid xiObid
NB.
NB.   saveobid JODOBID

id=. ~. y , readobid file=.obidfile 0

NB. HARDCODE up to 30 last object ids spawned on this machine
NB. NOTE: if you run more than 30 JOD tasks on the current
NB. machine you will lose object id's which cause the RESETME
NB. option of (dpset) to not reset all dictionaries recently opened -
NB. but never closed - on this machine. JUST INCREASE THE NUMBER EHHH!!
((30<.#id) {. id) (writenoun :: _1:) file
)

NB. second list item
second=:1&{

NB. J type code
tc=:3!:0

NB. removes blanks from items on blcl
trimnl=:-.&' '&.>

NB. appends trailing / iff last character is not \ or /
tslash2=:([: - '\/' e.~ {:) }. '/' ,~ ]


tstamp=:3 : 0
NB.*tstamp v-- time stamp
yy=. <.y,(0=#y)#6!:0 ''
'yy m d h n s'=. 6{.yy
mth=. _3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
f=. _2: {. '0'&,@":
t=. (2":d),(m{mth),(":yy),;f&.>h,n,s
r=. 'xx xxx xxxx xx:xx:xx'
t (I. r='x') } r
)


uses=:3 : 0

NB.*uses v-- returns word references.
NB.
NB. monad:  uses blclName
NB.
NB.   NB. non-locale global word references
NB.   uses ;:'out global references please'
NB.
NB. dyad:   ilObjOpt uses clName
NB.
NB.   NB. global locale word references
NB.   11 uses ;:'out locale references'
NB.
NB.   0 31 uses 'wordname'  NB. uses union of word
NB.   0 32 uses '

0 uses y
:

if. badrc uv=. checkopen__ST 0 do. uv return. end.
if. badrc y=.checknames y do. y return. else. y=. }.y end.

msg=. ERR001 NB. errmsg: invalid option(s)
if. badil x do. jderr msg return. else. x=. ''$x end.

if. x-:WORD do.
  if. badrc dat=.WORD getrefs__ST y do. dat return. end.
  dat=. rv dat
  dat=. (uv=. {."1 dat) ,. > {:"1 dat
  NB. return in order requested
  ok <(({."1 dat) i. y){dat
elseif. x-:UNION do.

  NB. word uses unions
  uv=. i. 0 0
  for_wrd. y do.
    srch=.'' [ refs=.wrd
    loc=.'' [ self=.0
    while.do.
      if. badrc dat=.WORD getrefs__ST refs do. dat return. end.
      srch=. ~. srch , {."1 dat=. rv dat
      NB. only non-locale names are searched
      self=. self+.wrd e. new=. ~. ; {.&> {:"1 dat
      new=. new -. srch
      loc=. ~. loc , (; {:&> {:"1 dat) -. loc
      if. isempty new do. break. end.
      refs=. new
    end.
    srch=. /:~ srch -. self}.wrd
    uv=. uv,wrd,srch;<loc
  end.
  ok <uv

elseif.do. jderr msg
end.
)


valdate=:3 : 0

NB.*valdate v-- validates lists or tables of YYYY MM DD Gregorian
NB. calendar dates.
NB.
NB. monad:  valdate il|it
NB.
NB.   valdate 1953 7 2
NB.   valdate 1953 2 29 ,: 1953 2 28  NB. not a leap year

s=. }:$y
'w m d'=. t=. |:((*/s),3)$,y
b=. *./(t=<.t),(_1 0 0<t),12>:m
day=. (13|m){0 31 28 31 30 31 30 31 31 30 31 30 31
day=. day+(m=2)*-/0=4 100 400|/w
s$b*d<:day
)

NB. 1 when word with name exists 0 otherwise
wex=:0&<:@:nc

NB. word storage representation - nouns binary others linear
wrep=:5!:5@<`(3!:1@:".)@.(0&=@(nc@<))

NB. writes a list of bytes to file
write=:1!:2 ]`<@.(32&>@(3!:0))

NB. writes a J noun file
writenoun=:([: 3!:1 [) (1!:2 ]`<@.(32&>@(3!:0))) ]