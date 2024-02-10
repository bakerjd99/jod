NB.*jodprofile s-- JOD dictionary profile.
NB.
NB. An example JOD profile script. Save this script in
NB.
NB. ~addons/general/jod/
NB.
NB. with the name jodprofile.ijs
NB.
NB. This script  is  executed  after all dictionary  objects have
NB. been created. It  can  be used  to  set up  your default  JOD
NB. working environment.
NB.
NB. WARNING: Do not dpset 'RESETME' if more than one  JOD task is
NB. active. If only one task is active RESETME's prevent annoying
NB. already open  messages that frequently result from forgetting
NB. to close dictionaries upon exiting J.
NB.
NB. NOTE: to  J developers. A shutdown sentence (a line  of J  the
NB. interpretor  executes  before   terminating)  would  be  very
NB. useful.

NB. set white space preservation on
9!:41 [ 1

NB. minimum print precision to show yyyymmdd dates (see jodage)
9!:11 [ 8

NB. set jqt windows console size - automatic for linux/mac/ios
Cwh_j_=: 160 24

NB. do not reset if you are running more than one JOD instance
NB. multiple JOD instances are permitted but not recommended
dpset 'RESETME'

NB. JOD interface locale - (ijod) is a good place for ad hoc JOD addons
coclass 'ijod'

NB. override EDCONSOLE - set (jconsole.exe) editor - use full path
NB. NIMP: currently EDCONSOLE is windows only - see verb (et) 
EDCONSOLE_ajodutil_=: '"c:\Program Files\Microsoft VS Code\code.exe"'
NB. EDCONSOLE_ajodutil_=: '"c:\Program Files (x86)\notepad++\notepad++.exe"'

NB. used by some macros: WHEREAMI=: ;0 { ;:'home work test'
WHEREAMI=: 'home'

NB. (ijod) error/ message text
ERRIJOD00=: 'current group name (jodg_ijod_) not set'
ERRIJOD01=: 'current suite name (jods_ijod_) not set'
ERRIJOD02=: 'invalid (x) search string'
OKIJOD00=:  'no matches'
OKIJOD01=:  'no objects'

NB. add delete objects from current group or current suite
ag=: 3 : 0
if. wex_ajod_ <'jodg' do. jodg addgrp y else. jderr_ajod_ ERRIJOD00 end.
)
as=: 3 : 0
if. wex_ajod_ <'jods' do. (jods;3) addgrp y else. jderr_ajod_ ERRIJOD01 end.
)
dg=: 3 : 0
if. wex_ajod_ <'jodg' do. jodg delgrp y else. jderr_ajod_ ERRIJOD00 end.
)
ds=: 3 : 0
if. wex_ajod_ <'jods' do. (jods;3) delgrp y else. jderr_ajod_ ERRIJOD01 end. 
)
   
NB. referenced words not in current group
nx=: 3 : 0
if. -.wex_ajod_ <'jodg' do. jderr_ajod_ ERRIJOD00 return. end.
if. badrc_ajod_ gn=. grp jodg do. gn return. end.
(allrefs  }. gn) -. gn
)
   
NB. words in current group using a word
ug=: 3 : 0
if. -.wex_ajod_ <'jodg' do. jderr_ajod_ ERRIJOD00 return. end.
if. badrc_ajod_ gn=. grp jodg do. gn return. end.
y usedby }. gn
)
   
NB. generate current group and save load script
sg=: 3 : 0
if. wex_ajod_ <'jodg' do. mls jodg else. jderr_ajod_ ERRIJOD01 end. 
)

NB. open entire (y) path
oep=: 6&od

NB. top (put dictionary) words, groups, suites in revision order
tw=: revo
tg=: 2&revo
ts=: 3&revo

NB. run tautology as plaintest - does not stop on nonzero results
rt=: 2&rtt

NB. run tautology silently - will show explict smoutput
rq=:1&rtt

NB. run macro silently - will show explict smoutput
rs=: 1&rm

NB. short help for groups/suites
hg=: [: hlpnl [: }. grp
hs=: 1 hlpnl [: }. 3 grp ]

NB. short help on put objects in revised order from code:
NB.     hr 4  NB. macro
NB.     hr 2  NB. groups
NB.  10 hr 0  NB. last ten words
hr=: 3 : 0
if. badrc_ajod_ w=. y revo '' do. w return. end.
y hlpnl }. w
:
if. badrc_ajod_ w=. y revo '' do. w return. end.
y hlpnl x {. }. w
)

NB. remove trailing blank rows
rebtbrow=: ] #~ [: -. [: *./"1 [: *./\. ' '&=

NB. appends trailing line feed character if necessary
tlf=:] , ((10{a.)"_ = {:) }. (10{a.)"_

NB. show long documents
NB.      hld 0     NB. words
NB.      hld 2     NB. groups
NB.  0 1 0 hld 0   NB. documented nouns
NB. 'NIMP:' hld 0  NB. word docs with string 'NIMP:'
NB.  (] ,: #@hld"0) i. 5 NB. count docs on path
hld=: ''&$: :(4 : 0)
if. badcl_ajod_ x do. jderr_ajod_ ERRIJOD02 return. end.
if. badrc_ajod_ w=. y dnl '' do. w return. end.
if. 0=#&> w=. }. w do. ok_ajod_ OKIJOD01 return. end.
if. badrc_ajod_ d=. (({.y),9) get w do. d return. end.
d=. d #~ 0 < #&> 1 {"1 d=. >1{d
if. 0<#x do. d=. d #~ +./@(x&E.)&> 1 {"1 d end.
(0 {"1 d) ,. rebtbrow@(];._2)@tlf@(-.&CR)&.> 1 {"1 d
)

NB. search short help for string and list matching words
NB.     hss 'see long'   NB. search word short text 
NB.  2  hss 'see long'   NB. search group short text
NB.  4  hss 'post'       NB. search macro short text 
hss=: 0&$: :(4 : 0)
if. badrc_ajod_ w=. x dnl ''   do. w return. end.
d=. x hlpnl }. w
if. 0=#w=. 1 >@{ d             do. ok_ajod_ OKIJOD00 return. end.
if. 0=#s=. I. (,:y) +./"1@E. w do. ok_ajod_ OKIJOD00 return. end.
s&{ &.> d
)

NB. single line explanation 
NB.    slex 'word'         NB. word
NB.  4 slex 'jodregister'  NB. macro
NB.  1 slex 'thistest'     NB. test
slex=: 0&$: :(4 : 0)
if. badcl_ajod_ sl=. x disp y do. sl return. end.
(x,8) put y;firstcomment__JODtools sl
)

NB. regenerate put dictionary word cross references
reref=: 3 : 0
if. badrc_ajod_ r=. revo '' do. r return. end.
(r,.s) #~ -.;0{"1 s=.0 globs&> r=.}.r
)

NB. handy cl doc helpers
docscr=: 3 : 'ctl_ajod_ (61;0;0;''NB.'') docct2__UT__JODobj ];._1 LF,y-.CR'
doctxt=: 3 : 'ctl_ajod_ (61;0;0;'''') docct2__UT__JODobj ];._1 LF,y-.CR'

NB. display noun on screen and return noun value
showpass=:] [ 1!:2&2

NB. portable box drawing characters
portchars=:[: 9!:7 '+++++++++|-'"_ [ ]

NB. windows lucida console box drawing characters
winlcchars=:[: 9!:7 (a.{~16+i.11)"_ [ ]

NB. edit command 
DOCUMENTCOMMAND=: 'showpass pr ''{~N~}'''

NB. read & write files
read=:1!:1&(]`<@.(32&>@(3!:0)))
write=:1!:2 ]`<@.(32&>@(3!:0))
readnoun=:3!:2@(1!:1&(]`<@.(32&>@(3!:0))))
writenoun=:([: 3!:1 [) (1!:2 ]`<@.(32&>@(3!:0))) ]

NB. read TAB delimited table files - faster than (readtd) - see long document in (utils)
readtd2=:[: <;._2&> (9{a.) ,&.>~ [: <;._2 [: (] , ((10{a.)"_ = {:) }. (10{a.)"_) (13{a.) -.~ 1!:1&(]`<@.(32&>@(3!:0)))

NB. writes tables as TAB delimited LF terminated text - see long document in (utils)
writetd2=:] (1!:2 ]`<@.(32&>@(3!:0)))~ [: ([: (] , ((10{a.)"_ = {:) }. (10{a.)"_) [: }.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@])))) # ,@((10{a.)&(,"1)@])) [: }."1 [: ;"1 (9{a.)&,@":&.>) [

NB. fetch edit text/macros and associate code
tt=:] ; gt
mt=:] ; 25"_ ; gt   NB. *.txt
mj=:] ; 21"_ ; gt   NB. *.ijs
md=:] ; 27"_ ; gt   NB. *.markdown
mq=:] ; 30"_ ; gt   NB. *.sql
mx=:] ; 22"_ ; gt   NB. *.tex

NB. ~user/temp object text - default j script
os=: 'ijs'&$: : ([: jpath '~user/temp/' , (' ' -.~ ]) , '.' , ' ' -.~ [)
 
NB. read text from j user temp directory
jt=:[: read os
 
NB.  load j script from j user temp
jl=: (0!:0)@jt

NB. load j script from configured j path
jp=: [: 0!:0 [: < jpath

NB. load and show j script from configured path
jps=: [: 0!:001 [: < jpath

NB. number of objects - used by various (utils) macros (sizeput, ageput, ...) if present
NOBS=: 10

NB. dump drive - used by (utils) macro (dumpput) if present
NB. DUMPWINDRV=: 'h:'

NB. dump paths - used by (utils) macro (dumpput) if present
NB. DUMPPATH=: '/jod/joddumps/'
NB. DUMPPRVPATH=: '/jod/jodprvdumps/'

NB. clear dictionaries - used by (utils) macro (clearput) if present
NB. CLEARJDICS=: ;:''

NB. set a preferred local pandoc  - used by (jodliterate) - try (where pandoc)
NB. PREFERREDPANDOC=: 'C:\Users\genric.user\AppData\Local\Pandoc\pandoc'
NB. PREFERREDPANDOC=: '/usr/local/bin/pandoc'

NB. JOD verbs typically run from the base locale 
cocurrent 'base'

NB. examples of JOD session start ups - shows
NB. how to open dictionaries and invoke project macros

NB. set up current project (1 suppress IO, 0 or elided display)
NB. 1 rm 'prjsmughacking' [ smoutput od ;:'smugdev smug utils' [ 3 od ''
NB. 1 rm 'prjmep' [ od 'mep' [ 3 od ''
