NB. System: JOD  Author: John D. Baker  Email: bakerjd99@gmail.com
NB. Version: 0.9.994  Build Number: 11  Date: 27 May 2018 18:37:21
(9!:41) 0
jodsf_ijod_=:0"_;'JOD SYSTEM FAILURE: last J error -> '"_,[:13!:12''"_[]
jodsystempath_z_=:3 :0
(jpath'~addons/general/jod/'),y
)
coclass'ajod'
JMASTER=:jodsystempath'jmaster'
JODPROF=:jodsystempath'jodprofile.ijs'
cocurrent'z'
jodoff=:3 :0
try.
a=.<'JODobj_ijod_'
if.0 =(4!:0 )a do.(4!:55)a [(18!:55)destroyjod__JODobj 0 end.
(18!:55)w#~'ajod'&-:@:(4&{.)&>w=.18!:1]0
((18!:2<'base')-.<'ijod')18!:2<'base'
(18!:55)<'ijod'
_1=(4!:0)a
catchd.
0
end.
)
jodon=:3 :0
e=.9!:14''
e=.,(e i.'/'){.e 
if.#e do.e=.0 ".e #~e e.'0123456789'else.e=.0 end.
h=.][1!:2&2
if.e<602 do.
f=.'JOD requires J 6.02 or later.'
f=.f,LF,'J is freely available at www.jsoftware.com'
0[h f,LF,'Download and install J 6.0x-8.0x and then reinstall JOD.'
return.
end.
g=.(4!:0)@<
a=.(4!:55)@<
if._1 e.(4!:0);:'load conew coclass coerase coinsert copath jpath UNAME IFWIN'do.
f=.'JOD depends on core J load and class utilities.'
0[h f=.f,LF,'Load J with a standard profile to use JOD.'
return.
end.
d=.g'JODobj_ijod_'
b=.(<'ajod')e.18!:1]0
if.(0=d)*.b do.1
elseif.(_1=d)*.b do.
JODobj_ijod_=:conew'ajod'
if.c=.createjod__JODobj JODobj_ijod_ do.1 else.0[a'JODobj_ijod_'end.
elseif.-.b do.
a'JODobj_ijod_'
load'general/jod'
0=g'JODobj_ijod_'
elseif.do.0
end.
)
coclass'ajod'
coinsert'ijod'
require'jfiles regex task'
LF=:10{a.
CR=:13{a.
TAB=:9{a.
CRLF=:CR,LF
JSCRIPT=:21
LATEX=:22
HTML=:23
XML=:24
TEXT=:25
BYTE=:26
MARKDOWN=:27
UTF8=:28
MACROTYPE=:JSCRIPT,LATEX,HTML,XML,TEXT,BYTE,MARKDOWN,UTF8
WORD=:0
TEST=:1
GROUP=:2
SUITE=:3
MACRO=:4
DICTIONARY=:5
OBJECTNC=:WORD,TEST,GROUP,SUITE,MACRO
badobj=:[:-.[:*./[:,]e.OBJECTNC"_
PATHDEL=:IFWIN{'/\'
PATHCHRS=:' :.-',PATHDEL
hostsep=:(IFWIN{'/\')&(((IFWIN{'\/')I.@:=])})
justpath=:[:}:]#~([:-.[:+./\.':'&=)*.[:+./\.PATHDEL&=
JMASTER=:jodsystempath'jmaster'
JODPROF=:jodsystempath'jodprofile.ijs'
JODUSER=:jodsystempath'joduserconfig.ijs'
ALPHA=:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
CNMFDLOG=:10
CNMFMARK=:0
CNMFPARMDEFS=:9
CNMFPARMS=:7
CNMFTAB=:2
CNMFTABBCK=:3
DEFAULT=:7
DEPENDENTSEND=:'enddependents'
DEPENDENTSSTART=:'dependents'
DIGITS=:'0123456789'
DOCUMENT=:9
DODEPENDENTS=:1
DPATH=:i.0 4
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
EXPLAIN=:8
FREESPACE=:0
HEADER=:1
IJF=:'.ijf'
IJS=:'.ijs'
INCLASS=:12
INCREATE=:13
INPUT=:14
INSIZE=:15
IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'
JDFILES=:<;._1 ' jwords jtests jgroups jsuites jmacros juses'
JDSDIRS=:<;._1 ' script suite document dump alien backup'
JJODDIR=:'joddicts\'
JNAME=:'[[:alpha:]][[:alnum:]_]*'
JODVMD=:'0.9.994';11;'27 May 2018 18:37:21'
JVERSION=:,6.0199999999999996
MASTERPARMS=:6 3$'PUTFACTOR';'(+integer) words stored in one loop pass';100;'GETFACTOR';'(+integer) words retrieved in one loop pass (<2048)';250;'COPYFACTOR';'(+integer) components copied in one loop pass';100;'DUMPFACTOR';'(+integer) objects dumped in one loop pass (<240)';50;'DOCUMENTWIDTH';'(+integer) width of justified document text';61;'WWWBROWSER';'(character) browser command line - used for jod help';' "C:\Program Files\Internet Explorer\IEXPLORE.EXE"'
MAXEXPLAIN=:80
MAXNAME=:60
NVTABLE=:10
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
PARMDIRS=:4 5 6 7 8 9
PARMFILE=:'jodparms.ijs'
PATHSHOWDEL=:'/'
PATOPS=:1 2 3 _1 _2 _3
PUTBLACK=:0
REFERENCE=:11
SYMBOLLIM=:2048
UNION=:31
afterstr=:]}.~#@[+1&(i.~)@([E.])
alltrim=:]#~[:-.[:(*./\.+.*./\)' '&=
badappend=:0:>{.
badblia=:4 :0
if._1-:a=.,(; ::_1:)y do.1
elseif.(#y)~:#a do.1
elseif.badil a do.1
elseif.do.-.*./a e.x
end.
)
badbu=:[:32&~:3!:0
badcl=:-.@(2&=@(3!:0))+.1:<[:#$
badfl=:[:-.8"_=3!:0
badil=:-.@((([:#$)e.0 1"_)*.3!:0 e.1 4"_)
badjr=:[:+./_1 _2&e.
badlocn=:[>:[:18!:0 ::(_2:)[:<]
badrc=:[:-.1:-:[:>{.
badreps=:0:><./
badsts=:0:
badunique=:#~:[:#~.
beforestr=:]{.~1&(i.~)@([E.])
bget=:3 :0
WORD bget y
:
b=.ERR001[a=.<'base'
if.badil x do.
if._2&badlocn x do.jderr ERR004 return.else.x=.WORD[a=.<x -.' 'end.
end.
if.badrc c=.checkopen__ST 0 do.c return.end.
ok'NIMP bget'return.
x=.x,(-3-#x){.DEFAULT,0
if.-.0 1 e.~{:x do.jderr b return.end.
select.{.x
case.WORD do.
select.second x
case.DEFAULT do.(WORD,0)bgetobjects__ST y
case.EXPLAIN do.WORD bgetexplain__ST y
case.DOCUMENT do.WORD bgetdocument__ST y
case.do.jderr b
end.
case.TEST do.
select.second x
case.DEFAULT do.(TEST,0)bgetobjects__ST y
case.EXPLAIN do.TEST bgetexplain__ST y
case.DOCUMENT do.TEST bgetdocument__ST y
case.do.jderr b
end.
case.GROUP do.
select.second x
case.HEADER do.GROUP bgslist__ST y
case.DEFAULT do.GROUP bgetgstext__ST y
case.EXPLAIN do.GROUP bgetexplain__ST y
case.DOCUMENT do.GROUP bgetdocument__ST y
case.do.jderr b
end.
case.SUITE do.
select.second x
case.HEADER do.SUITE bgslist__ST y
case.DEFAULT do.SUITE bgetgstext__ST y
case.EXPLAIN do.SUITE bgetexplain__ST y
case.DOCUMENT do.SUITE bgetdocument__ST y
case.do.jderr b
end.
case.MACRO do.
select.second x
case.DEFAULT do.(MACRO,0)bgetobjects__ST y
case.EXPLAIN do.MACRO bgetexplain__ST y
case.DOCUMENT do.MACRO bgetdocument__ST y
case.do.jderr b
end.
case.DICTIONARY do.
select.second x
case.DEFAULT do.bgetdicdoc__ST 0
case.do.jderr b
end.
case.do.jderr b
end.
)
bnl=:3 :0
WORD bnl y
:
if.badrc a=.x nlargs y do.a return.end.
x=.x,(<:#x)}.1,DEFAULT
if.((0{x)e.WORD,MACRO)*.-.(2{x)e.DEFAULT,MACROTYPE,i.4 do.jderr ERR001
elseif.({.x )e.OBJECTNC do.x bnlsearch__ST y
elseif.do.jderr ERR001
end.
)
boxopen=:<^:(L.=0:)
catrefs=:3 :0
if.(,a:)-:,y do.''
else.
r=.islocref&>y
s=.<(-.r)#y
l=.<r#y
s,l
end.
)
cd=:15!:0
changestr=:4 :0
f=.2{."(1)_2[\<;._1 x
a=._1[e=.#f
while.e>a=.>:a do.
't c'=.a{f
if.+./b=.t E.y do.
r=.I.b
'l q'=.#&>a{f
p=.r+0,+/\(<:#r)$d=.q-l
s=.*d
if.s=_1 do.
b=.1#~#b
b=.((l*#r)$1 0#~q,l-q)(,r+/i.l)}b
y=.b#y
if.q=0 do.continue.end.
elseif.s=1 do.
y=.y#~>:d r}b
end.
y=.(c$~q*#r)(,p+/i.q)}y
end.
end.y
)
checknames=:3 :0
1 checknames y
:
a=.ERR002
if.1<#$y do.jderr a return.end.
y=.,&.>boxopen y
if.+./badcl&>y do.jderr a return.end.
if.x do.
b=.ERR008
if.'_'e.,_1&{.&>y do.jderr b return.end.
if.+./+./@:('__'&E.)&>y do.jderr b return.end.
if._2 e.nc y do.jderr a return.end.
else.
if.(#jnfrblcl y )~:#y do.jderr a return.end.
end.
if.MAXNAME<>./#&>y do.jderr ERR003 return.end.
ok trimnl y
)
checknttab=:3 :0
a=.ERR014
if.badbu y do.jderr a
elseif.-.1 2 e.~#$y do.jderr a
elseif.2~:{:$y=.plt y do.jderr a
elseif.+./badcl&>1 {"1 y do.jderr a
elseif.badrc b=.checknames(<a:;0){y do.jderr a
elseif.badunique b=.}.b do.jderr ERR020
elseif.do.ok<y=.b(<a:;0)}y
end.
)
checknttab2=:4 :0
a=.ERR015
if.badbu y do.jderr a
elseif.-.1 2 e.~#$y do.jderr a
elseif.3~:{:$y=.plt y do.jderr a
elseif.+./badcl&>{:"1 y do.jderr a
elseif.x badblia 1 {"1 y do.jderr a
elseif.badrc b=.checknames(<a:;0){y do.jderr a
elseif.badunique b=.}.b do.jderr ERR020
elseif.do.ok<y=.b(<a:;0)}y
end.
)
checknttab3=:3 :0
if.3=a=.{:$y do.
if.((i.4),MACROTYPE)badblia 1 {"1 y do.jderr ERR014
elseif.3<<./;1 {"1 y do.
MACROTYPE checknttab2 y
elseif.do.
(i.4)checknttab2 y
end.
elseif.2=a do.
checknttab y
elseif.do.jderr ERR014
end.
)
createjod=:3 :0
if.-.wex<'JMASTER'do.JMASTER=:jodsystempath'jmaster'end.
if.-.wex<'JODPROF'do.JODPROF=:jodsystempath'jodprofile.ijs'end.
if.-.wex<'JODUSER'do.JODUSER=:jodsystempath'joduserconfig.ijs'end.
JVERSION_ajod_=:(jvn ::_9:)''
if.-.fex<JMASTER,IJF do.
if.badrc o_nlJ=.createmast JMASTER do.o_nlJ return.end.
end.
if.fex<JODUSER do.
if.(_9-:((0!:0) ::_9:) <JODUSER) {0 1 do.(jderr ERR026) ,<13!:12''return.end.
end.
if.badjr o_nlJ=.jread JMASTER;CNMFPARMS do.jderr ERR006 return.end.
MASTERPARMS_ajod_=:>o_nlJ
JODEXT=:0$a:
IZJODALL=:IzJODinterface,<'JODobj'
JOD=:y
ST=:conew'ajodstore'
MK=:conew'ajodmake'
UT=:conew'ajodutil'
SO=:cocreate''
('ijod';'z')copath;SO
o_bla=.JOD;ST;MK;UT;<SO
createst__ST o_bla
createmk__MK o_bla
createut__UT o_bla
".&.>y defzface IzJODinterface
makedir<jpath'~temp/'
if.fex<JODPROF do.(_9-:((0!:0) ::_9:) <JODPROF ) {1 0 else.1 end.
)
createmast=:3 :0
b=.hostsep y
if.IFWIN do.
f=.PATHDEL,~(justdrv,':'"_,justpath)b
else.
f=.PATHDEL,~justpath b
end.
if.badappend jcreate b do.
jderr ERR011
return.
end.
b=.jopen_jfiles_ b
a=.(<0;now'')jappend b
'd c'=.2{.JODVMD
a=.a,(<d;c,didnum 0)jappend b
a=.a,(4 0$'')jappend b
a=.a,(4 0$'')jappend b
a=.a,(3#<'')jappend b
try.
0!:0<f,PARMFILE
e=.<dptable MASTERPARMS
catchd.
jclose_jfiles_ b
(jderr ERR027),<f,PARMFILE return.
end.
a=.a,e jappend b
a=.a,e jappend b
a=.a,e jappend b
a=.a,(i.0)jappend b
jclose_jfiles_ b
if.0><./a do.
jderr ERR011
else.
ok{:a
end.
)
ctl=:}.@(,@(1&(,"1)@(-.@(*./\."1@(=&' '@]))))#,@((10{a.)&(,"1)@]))
datefrnum=:0 100 100&#:@<.
dblquote=:'"'&,@:(,&'"')&.>
decomm=:3 :0
1 decomm y
:
c=.($y)$'NB.'E.,y
c=.+./\"1 c>~:/\"1 y e.''''
y=.,,y
y=.' '(I.,c)}y
y=.y$~$c
if.x do.y#~y+./ .~:' 'end.
)
defzface=:4 :0
if.3=(4!:0)<'jodsf_ijod_'do.
a=.(y,&.>locsfx x),&.><' :: jodsf'
else.
a=.y,&.>locsfx x
end.
(y,&.><'_ijod_=:'),&.>a
)
del=:3 :0
WORD del y
:
a=.ERR001
if.badil x do.jderr a return.end.
if.badrc b=.checkput__ST 0 do.b return.end.
DL=.1{b
select.x
case.WORD do.
(WORD;INVWORDS__ST;<DL)delstuff__ST y
case.TEST do.
(TEST;INVTESTS__ST;<DL)delstuff__ST y
case.GROUP do.
(GROUP;INVGROUPS__ST;<DL)delstuff__ST y
case.SUITE do.
(SUITE;INVSUITES__ST;<DL)delstuff__ST y
case.MACRO do.
(MACRO;INVMACROS__ST;<DL)delstuff__ST y
case.REFERENCE do.
if.badrc y=.checknames y do.y 
elseif.badrc a=.DL delwordrefs__ST}.y do.a
elseif.do.(ok OK009),<DNAME__DL
end.
case.do.jderr a
end.
)
destroyjod=:3 :0
3 od''
(4!:55)IZJODALL,&.>locsfx'z'
coerase ST,MK,UT,SO
coerase JODEXT
18!:5''
)
did=:3 :0
if.badrc a=.checkopen__ST 0 do.a else.ok{."1 DPATH__ST end.
:
0 didstats__ST 0 
)
didnum=:3 :0
guidsx i.0
)
dnl=:3 :0
WORD dnl y
:
if.badrc a=.x nlargs y do.a return.end.
x=.x,(<:#x)}.1,DEFAULT
if.({.x )e.OBJECTNC do.x dnlsearch__ST y else.jderr ERR001 end.
)
dpset=:3 :0
if.y-:'RESETME'do.
3 od''
if.badrc d=.markmast~0 do.d else.ok OK004[remast 1 end.
elseif.y-:'RESETALL'do.
3 od''
if.badrc d=.markmast~0 do.d else.ok OK004[remast 0 end.
elseif.do.
if.badrc d=.checkopen__ST 0 do.d return.end.
DL=.{:{.DPATH__ST
if.isempty y do.
ok<|:>{:>jread WF__DL;CNPARMS__ST
elseif.-.badcl y do.
if.'READWRITE'-:y do.
b=.(WF__DL;TF__DL;GF__DL;SF__DL;MF__DL;UF__DL),&.><IJF
if.0 e.iswriteable__ST b do.(jderr ERR095__ST),<DNAME__DL return.end.
if.badrc d=.libstatus__DL 0 do.d
else.
RW__DL=:-.LIBSTATUS__DL=:0
ok OK008;DNAME__DL
end.
return.
end.
if.badrc d=.checkput__ST 0 do.d return.end.
select.y
case.'DEFAULTS'do.
if.badjr a=.jread JMASTER;CNMFPARMDEFS do.jderr ERR088
elseif.badjr c=.jread WF__DL;CNPARMS__ST do.jderr ERR088
elseif.c=.<(}:>c),<|:1 0 1#"1 a=.>a
badreps c jreplace WF__DL;CNPARMS__ST do.jderr ERR017
elseif.do.
(({."1 a),&.>locsfx DL)=:{:"1 a
ok OK003;DNAME__DL
end.
case.'CLEARPATH'do.
RPATH__DL=.i.0
if.badreps(i.0)jreplace UF__DL;CNRPATH__ST do.
jderr ERR017
else.
ok OK005;DNAME__DL
end.
case.'READONLY'do.
if.badrc d=.libstatus__DL 1 do.d
else.
RW__DL=:-.LIBSTATUS__DL=:1
ok OK007;DNAME__DL
end.
case.do.jderr ERR001
end.
elseif.-.badbu y do.
if.badrc d=.checkput__ST 0 do.d return.end.
d=.ERR019
if.-.(1=#$y )*.2=#y do.jderr d return.end.
if.badjr c=.jread WF__DL;CNPARMS__ST do.jderr ERR088 return.end.
f=.>{:c=.>c
if.({:$f)=e=.({.f)i.{.y do.jderr d return.end.
if.(>e{{:f)badsts>{:y do.jderr d return.end.
('__DL',~>e{{.f)=:>{:y
c=.(}:c),<f=.({:y)(<1;e)}f
if.badreps(<c)jreplace WF__DL;CNPARMS__ST do.jderr ERR017 else.ok OK006;y end.
elseif.do.jderr ERR001
end.
end.
)
dptable=:3 :0
y=.(<;._1)"1';',.decomm];._2 y-.CR
y=.(alltrim&.>(<a:;0 1){y)(<a:;0 1)}y
b=.>1 {"1 y
a=.I.(,:'(+integer)')({."1)@E.b
y=.(".&.>(<a;2){y)(<a;2)}y
)
empdnl=:(,<0$0)-:]
fex=:*./@:(1:@(1!:4) ::0:) 
firstone=:]>[:}:0:,]
fod=:]#~1 0"_$~#
fopix=:1:i.~[+/@:e.&>[:<[:<]
gdeps=:3 :0
GROUP gdeps y
:
if.badil x do.jderr ERR001
elseif.badcl y do.jderr ERR002
elseif.x=.{.x
-.x e.GROUP,SUITE do.jderr ERR001
elseif.badrc d=.(x,1)obtext__UT y do.d
elseif.do.
d=.,>2{d
a=.'NB.*',DEPENDENTSSTART
b=.'NB.*',DEPENDENTSEND
c=.(+/a E.d),+/b E.d
select.c
case.0 0 do.ok''
case.0 1 do.jderr ERR024
case.1 0 do.jderr ERR024
case.1 1 do.
d=.];._1 LF,b beforestr d-.CR
0 namecats__MK d}.~I.(,:a)+./"1@E.d
case.do.
jderr ERR025
end.
end.
)
get=:3 :0
WORD get y
:
b=.ERR001[a=.<'base'
if.badil x do.
if._2&badlocn x do.jderr ERR004 return.else.x=.WORD[a=.<x -.' 'end.
end.
if.badrc c=.checkopen__ST 0 do.c return.end.
x=.x,(-3-#x){.DEFAULT,0
if.-.0 1 e.~{:x do.jderr b return.end.
select.{.x
case.WORD do.
select.second x
case.DEFAULT do.a defwords__ST y
case.EXPLAIN do.WORD getexplain__ST y
case.DOCUMENT do.WORD getdocument__ST y
case.NVTABLE do.(WORD,0)getobjects__ST y
case.INCLASS;INCREATE;INPUT;INSIZE do.(2{.x)invfetch__ST y
case.-INPUT do.WORD getntstamp__ST y
case.do.jderr b
end.
case.TEST do.
select.second x
case.DEFAULT do.(TEST,0)getobjects__ST y
case.EXPLAIN do.TEST getexplain__ST y
case.DOCUMENT do.TEST getdocument__ST y
case.INCREATE;INPUT;INSIZE do.(2{.x)invfetch__ST y
case.-INPUT do.TEST getntstamp__ST y
case.do.jderr b
end.
case.GROUP do.
select.second x
case.DEFAULT do.GROUP getgstext__ST y
case.EXPLAIN do.GROUP getexplain__ST y
case.DOCUMENT do.GROUP getdocument__ST y
case.INCREATE;INPUT do.(2{.x)invfetch__ST y
case.-INPUT do.GROUP getntstamp__ST y
case.do.jderr b
end.
case.SUITE do.
select.second x
case.DEFAULT do.SUITE getgstext__ST y
case.EXPLAIN do.SUITE getexplain__ST y
case.DOCUMENT do.SUITE getdocument__ST y
case.INCREATE;INPUT do.(2{.x)invfetch__ST y
case.-INPUT do.SUITE getntstamp__ST y
case.do.jderr b
end.
case.MACRO do.
select.second x
case.DEFAULT do.(MACRO,0)getobjects__ST y
case.EXPLAIN do.MACRO getexplain__ST y
case.DOCUMENT do.MACRO getdocument__ST y
case.INCLASS;INCREATE;INPUT;INSIZE do.(2{.x)invfetch__ST y
case.-INPUT do.MACRO getntstamp__ST y
case.do.jderr b
end.
case.DICTIONARY do.
select.second x
case.DEFAULT do.getdicdoc__ST 0
case.do.jderr b
end.
case.do.jderr b
end.
)
globals=:4 :0
if.badcl y do.jderr ERR002 return.end.
if.badrc y=.0 checknames y do.y 
else.
y=.>1{y
if.-.islocref y do.y=.y ,'_base_'end.
x wrdglobals__MK y
end.
)
globs=:3 :0
0 globals y
:
if.(,x)-:,REFERENCE do.1 globals y
elseif.badcl y do.jderr ERR002
elseif.do.
select.x
case.WORD do.
if.badrc b=.checkput__ST 0 do.b return.else.a=.1{b end.
if.badrc y=.checknames__ST y do.y return.else.y=.,>}.y end.
if.badrc b=.(WORD;<a)inputdict__ST<y do.b return.end.
if.badrc b=.WORD getobjects__ST y do.b return.else.b=.,1{::b end.
if.0=>1{b do.ok'<',y,'>',OK002 return.end.
if.badrc b=.0 namecats__MK];._2(>2{b ),LF do.b return.end.
(y;<a)putwordxrs__ST}.b
case.TEST do.
if.badrc b=.TEST get y do.b return.else.b=.,1{::b end.
0 namecats__MK];._2(>1{b),LF
case.do.jderr ERR001
end.
end.
)
grp=:3 :0
GROUP grp y
:
select.x
case.GROUP do.(GROUP ,WORD)gsmakeq y
case.SUITE do.(SUITE ,TEST)gsmakeq y
case.do.jderr ERR001
end.
)
gsmakeq=:4 :0
'a d'=.x
if.isempty y do.a dnl''
else.
if.badcl y do.
if.badrc b=.checkput__ST 0 do.b return.end.
if.badrc c=.checkpath__ST{:b do.c return.end.
if.badrc y=.checknames y -.a:do.y return.end.
(({:b);d;a)putgs__ST}.y
else.
if.badrc c=.checkopen__ST 0 do.c return.end.
if.badrc y=.checknames y do.y return.end.
a gslistnl__ST rv y
end.
end.
)
guids=:3 :0
if.IFWIN do.
a=.'ole32 CoCreateGuid i *c'
else.
a=.((UNAME-:'Darwin'){::'libuuid.so.1';'libSystem.B.dylib'),' uuid_generate n *c'
end.
>{:"1 a 15!:0"1 0<"1 (y,16)$' '
)
guidsx=:256#.[:x:a.i.guids
host=:[:2!:0'('"_,],' || true)'"_
isempty=:0:e.$
islocref=:('_'"_ ={:)+.[:+./'__'"_ E.]
jappend=:jappend_jfiles_ ::(_2:)
jcr=:[:];._1(10{a.),[:5!:5<
jcreate=:jcreate_jfiles_ ::0:
jderr=:0:;'!JOD error: '"_,]
jdmasterr=:3 :0
if.badrc a=.markmast~0 do.a else.jderr y end.
)
jnfrblcl=:3 :0
y=.y#~0<#&>y=.alltrim&.>y
y=.y#~y*./@:e.&><ALPHA,'_'
y=.y#~-.({.&>y)e.'_0123456789'
if.#y do.JNAME rxall;y ,&.>' 'else.''end.
)
jpathsep=:'/'&(('\'I.@:=])})
jread=:jread_jfiles_ ::(_2:)
jreplace=:jreplace_jfiles_ ::(_2:)
justdrv=:[:}:]#~[:+./\.':'&=
jvn=:3 :0
a=.9!:14''
a=.(a e.'0123456789/')#a 
100%~,601".(a i.'/'){.a 
)
lfcrtrim=:]#~[:-.[:(*./\.+.*./\)]e.(10 13{a.)"_
locsfx=:'_'&,@,&'_'&.>
make=:3 :0
makedump__MK y
:
a=.ERR001
if.badil x do.jderr a return.end.
if.badrc b=.checkopen__ST 0 do.b return.end.
x=.2{.x,1 2
if.-.({:x)e._2 _1 1 2 do.jderr a return.end.
if.({.x )e.GROUP,SUITE do.x makegs__MK y
elseif.({.x)=WORD do.
if.badrc b=.WORD obtext__UT y do.b
elseif.1={:x do.(WORD;1{b)writeijs__MK>{:b
elseif.do.ok>{:b
end.
elseif.do.jderr a
end.
)
makedir=:1!:5 ::0:
markmast=:3 :0
if.badjr a=.jread JMASTER;CNMFMARK do.jderr ERR006
elseif.>{.>a do.jderr ERR012
elseif.badreps(mubmark y)jreplace JMASTER;CNMFMARK do.
jderr ERR013
elseif.do.ok y
end.
:
if.badreps(mubmark 0 )jreplace JMASTER;CNMFMARK do.jderr ERR013 else.ok 0 end.
)
mubmark=:];[:(6!:0)0:$]
nc=:4!:0 ::(_2:)
newd=:3 :0
if.badcl y do.
1 newregdict__ST y
else.
a=.y-.y-.ALPHA
1 newregdict__ST y;hostsep(jpath'~user\'),JJODDIR,(255<.#a){.a
end.
)
nlargs=:4 :0
if.badcl y do.jderr ERR010
elseif.badil x do.jderr ERR001
elseif.do.checkopen__ST 0
end.
)
now=:6!:0
nowfd=:([:0 100 100&#.3:{.])+([:24 60 60&#.3:}.])%86400"_
obidfile=:3 :0
(jodsystempath''),'jod.ijn'
)
od=:3 :0
1 od y
:
c=.ERR005
if.badjr b=.jread JMASTER;CNMFTAB do.
jderr ERR006 return.
end.
a=.0{>b
select.x
case.1 do.
if.isempty y do.ok/:~a
else.
y=.boxopen,y
if.*./y e.a do.y opendict__ST 1;b else.jderr c end.
end.
case.2 do.
y=.boxopen,y
if.*./y e.a do.y opendict__ST 2;b else.jderr c end.
case.3 do.
if.badrc d=.checkopen__ST 0 do.d return.end.
if.isempty y do.y=.{."1 DPATH__ST else.y=.boxopen,y end.
if.*./y e.a do.b closedict__ST y else.jderr c end.
case.4 do.
b=.jpathsep&.>0 2{>b
ok<(/:0{b){|:b
case.5 do.
b=.quote&.>0 2{>b
b=.ctl;"1(<'regd '),"1|:1 0 2{(<';'),b
b=.'NB. require ''general/jod''',LF,'3 regd&> }. od'''' [ 3 od ''''',LF,b
ok'NB. JOD registrations: ',(tstamp''),LF,jpathsep b
case.do.jderr ERR001
end.
)
ok=:1:;]
packd=:3 :0
if.badrc a=.checkput__ST 0 do.a return.end.
DL=.1{a
if.badrc a=.packspace__DL 0 do.a return.end.
packdict__DL y
)
plt=:]`,:@.(1&=@:(#@:$))
put=:3 :0
WORD put y
:
b=.ERR001[a=.<'base'
if.-.PUTBLACK+.9!:40''do.
jderr ERR023 return.
end.
if.badil x do.
if._1&badlocn x do.jderr ERR004 return.else.x=.WORD[a=.<x -.' 'end.
end.
if.badrc c=.checkput__ST 0 do.c return.end.
DL=.1{c
x=.2{.x,DEFAULT
select.{.x
case.WORD do.
select.second x
case.DEFAULT do.(a;<DL)putwords__ST y
case.EXPLAIN do.(WORD;<DL)putexplain__ST y
case.DOCUMENT do.(WORD;1;<DL)puttexts__ST y
case.NVTABLE do.
if.badrc y=.(i.4)checknttab2 y do.y else.(WORD;<DL)puttable__ST y end.
case.-INPUT do.(WORD;<DL)putntstamp__ST y
case.do.jderr b
end.
case.TEST do.
select.second x
case.DEFAULT do.
if.badrc y=.checknttab y do.y else.(TEST;<DL)puttable__ST y end.
case.EXPLAIN do.(TEST;<DL)putexplain__ST y
case.DOCUMENT do.(TEST;1;<DL)puttexts__ST y
case.-INPUT do.(TEST;<DL)putntstamp__ST y
case.do.jderr b
end.
case.GROUP do.
select.second x
case.DEFAULT do.(GROUP;0;<DL)puttexts__ST y
case.EXPLAIN do.(GROUP;<DL)putexplain__ST y
case.DOCUMENT do.(GROUP;1;<DL)puttexts__ST y
case.1 do.(GROUP;0;<DL)puttexts__ST y
case.-INPUT do.(GROUP;<DL)putntstamp__ST y
case.do.jderr b
end.
case.SUITE do.
select.second x
case.DEFAULT do.(SUITE;0;<DL)puttexts__ST y
case.EXPLAIN do.(SUITE;<DL)putexplain__ST y
case.DOCUMENT do.(SUITE;1;<DL)puttexts__ST y
case.1 do.(SUITE;0;<DL)puttexts__ST y
case.-INPUT do.(SUITE;<DL)putntstamp__ST y
case.do.jderr b
end.
case.MACRO do.
select.second x
case.DEFAULT do.
if.badrc y=.MACROTYPE checknttab2 y do.y else.(MACRO;<DL)puttable__ST y end.
case.EXPLAIN do.(MACRO;<DL)putexplain__ST y
case.DOCUMENT do.(MACRO;1;<DL)puttexts__ST y
case.-INPUT do.(MACRO;<DL)putntstamp__ST y
case.do.jderr b
end.
case.DICTIONARY do.
select.second x
case.DEFAULT do.putdicdoc__ST y
case.do.jderr b
end.
case.do.jderr b
end.
)
quote=:''''&,@(,&'''')@(#~>:@(=&''''))
read=:1!:1&(]`<@.(32&>@(3!:0)))
readnoun=:3!:2@(1!:1&(]`<@.(32&>@(3!:0))))
readobid=:3 :0
(readnoun ::((i.0)"_))obidfile 0
)
regd=:3 :0
0 newregdict__ST y
:
if.x-:3 do.
if.badcl y do.jderr ERR005 return.end.
if.(<,y)e.{."1 DPATH__ST do.jderr ERR018 return.end.
if.badjr b=.jread JMASTER;CNMFTAB do.jderr ERR006 return.end.
b=.>b
d=.(0{b)=<,y
if.+./d do.
'f a'=.2 3{d#"1 b
if.a do.jderr ERR018 return.end.
e=.(-.d)#"1 b
if.badrc c=.markmast 1 do.c return.end.
if.badreps((<e),<b)jreplace JMASTER;CNMFTAB,CNMFTABBCK do.
jdmasterr ERR017 return.
end.
if.badrc c=.markmast~0 do.c return.end.
(ok OK001),y;jpathsep f
else.
jderr ERR005
end.
else.
jderr ERR001
end.
)
remast=:3 :0
a=.>jread JMASTER;CNMFTAB
if.0=y do.
a=.(<"0({:$a)#0)3}a
else.
a=.(<0)(<3;I.(;3{a)e.readobid obidfile 0)}a
end.
(<a)jreplace JMASTER;CNMFTAB
)
restd=:3 :0
if.badrc a=.checkput__ST 0 do.a return.end.
DL=.1{a
if.badrc a=.restspace__DL 0 do.a else.(}.a )restdict__DL y end.
)
rv=:>@(1&{)
saveobid=:3 :0
b=.~.y,readobid a=.obidfile 0
((30<.#b){.b)(writenoun ::_1:)a
)
second=:1&{
tc=:3!:0
trimnl=:-.&' '&.>
tslash2=:([:-'\/'e.~{:)}.'/',~]
tstamp=:3 :0
b=.<.y,(0=#y)#6!:0''
'b m d h n s'=.6{.b
a=._3[\'   JanFebMarAprMayJunJulAugSepOctNovDec'
f=._2:{.'0'&,@":
t=.(2":d),(m{a),(":b),;f&.>h,n,s
r=.'xx xxx xxxx xx:xx:xx'
t(I.r='x')}r
)
uses=:3 :0
0 uses y
:
if.badrc h=.checkopen__ST 0 do.h return.end.
if.badrc y=.checknames y do.y return.else.y=.}.y end.
c=.ERR001
if.badil x do.jderr c return.else.x=.''$x end.
if.x-:WORD do.
if.badrc a=.WORD getrefs__ST y do.a return.end.
a=.rv a
a=.(h=.{."1 a),.>{:"1 a
ok<(({."1 a)i.y){a
elseif.x-:UNION do.
h=.i.0 0
for_wrd.y do.
g=.''[e=.wrd
b=.''[f=.0
while.do.
if.badrc a=.WORD getrefs__ST e do.a return.end.
g=.~.g,{."1 a=.rv a
f=.f+.wrd e.d=.~.;{.&>{:"1 a
d=.d-.g
b=.~.b,(;{:&>{:"1 a)-.b
if.isempty d do.break.end.
e=.d
end.
g=./:~g-.f}.wrd
h=.h,wrd,g;<b
end.
ok<h
elseif.do.jderr c
end.
)
valdate=:3 :0
s=.}:$y
'w m d'=.t=.|:((*/s),3)$,y
b=.*./(t=<.t),(_1 0 0<t),12>:m
a=.(13|m){0 31 28 31 30 31 30 31 31 30 31 30 31
a=.a+(m=2)*-/0=4 100 400|/w
s$b*d<:a
)
wex=:0&<:@:nc
wrep=:5!:5@<`(3!:1@:".)@.(0&=@(nc@<))
write=:1!:2]`<@.(32&>@(3!:0))
writenoun=:([:3!:1[)(1!:2]`<@.(32&>@(3!:0)))]
coclass'ajodstore'
coinsert'ajod'
CNMARK=:0
CNLIST=:4
CNCOMPS=:5
CNDIR=:CNMARK,CNLIST,CNCOMPS
CNCLASS=:6
CNCREATION=:8
CNDICDOC=:2
CNEXPLAIN=:11
CNPARMS=:3
CNPUTDATE=:7
CNREF=:5+i.2 2
CNRPATH=:19
CNSIZE=:9
INVGROUPS=:CNPUTDATE,CNCREATION,CNEXPLAIN
INVSUITES=:INVGROUPS
INVMACROS=:CNCLASS,CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN
INVWORDS=:INVMACROS
INVTESTS=:CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN
rpdtrim=:]#~[:-.[:*./\.PATHDEL"_=]
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
ERR102=:'timestamp table shape invalid'
ERR103=:'no backup(s) to restore or search'
NDOT=:'.'
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
PATHTIT=:'Path*'
READSTATS=:<;._1 ' ro rw'
afterlaststr=:]}.~#@[+1&(i:~)@([E.])
allnlctn=:[/:~@:nlctn&.>[:<]
allnlpfx=:[/:~@:nlpfx&.>[:<]
allnlsfx=:[/:~@:nlsfx&.>[:<]
apptable=:4 :0
'q g d f DL'=.x
j=.#&>{:"1 y
i=.PUTFACTOR__DL
if.t=.q e.WORD,MACRO do.a=.;1 {"1 y end.
o=.y
c=.i.0
y=.{."1 y
while.#o do.
e=.i<.#o
p=.e{.o
r=.<"1 p
s=.<"1 ({."1 p),"0 1 DOCINIT
if.badappend b=.(,r,.s)jappend f do.
jderr ERR058 return.
else.
c=.c,fod b
end.
o=.e}.o
end.
h=.ERR057
if.(l=.#y)~:#c do.jderr h return.end.
k=.l#nowfd now''
r=.k;k;j;<l#a:
s=.CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN
if.t do.
dropnc__DL q
r=.a;r
s=.CNCLASS,s
end.
if.badrc h=.r invappend f;s do.h
else.
y=.(".g),y
c=.(".d),c
if.badrc(q,f)savedir__DL y;c do.jderr h else.ok l end.
end.
)
appwords=:4 :0
'h DL'=.x
z=.WP__DL[l=.PUTFACTOR__DL
k=.y
g=.y,&.>locsfx h
o=.c=.e=.i.0
while.#k do.
f=.l<.#k
w=.f{.k[i=.f{.g
s=.wrep&.>i
b=.#&>s
a=.nc i
q=.<"1 w,.(<"0 a),.s
r=.<"1 w,"0 1 DOCINIT
if.badappend d=.(,q,.r)jappend z do.
jderr ERR058 return.
else.
e=.e,fod d
o=.o,b
c=.c,a
end.
k=.f}.k[g=.f}.g
end.
j=.ERR057
if.(#y)~:#e do.jderr j return.end.
t=.#y
p=.t#nowfd now''
q=.c;p;p;o;<t#a:
r=.CNCLASS,CNPUTDATE,CNCREATION,CNSIZE,CNEXPLAIN
if.badrc j=.q invappend z;r do.j
else.
y=.WORDIX__DL,y
e=.WORDCN__DL,e
if.badrc(WORD,z)savedir__DL y;e do.jderr j else.ok t end.
end.
)
badcn=:[:-.[-:[:{.&>]
bnlsearch=:4 :0
if.1<+/y e.NDOT do.jderr ERR010 return.end.
c=.DEFAULT~:2{x
if.c*.(0{x)e.TEST,GROUP,SUITE do.jderr ERR001 return.end.
DL=.{:0{DPATH
if.0=#b=.bnums BAK__DL do.jderr ERR103 return.end.
'g h'=.(NDOT&beforestr;NDOT&afterstr)y
if.isempty h do.h=.{.b
elseif.0 e.h e.DIGITS do.jderr ERR010 return.
elseif.-.(h=.".h)e.b do.jderr ERR103 return.
end.
if.(,NDOT)-:alltrim y do.
d=.(0<#b){'';NDOT
ok d,&.>'r<0>0.d'8!:0 b
elseif.a=.({.x)dbakf__DL h
badjr i=.jread a;(1{CNDIR),CNCLASS do.(jderr ERR088,' ->'),<a
elseif.
f=.i{f[i=./:f['f e'=.i
if.c*.(0{x)e.WORD,MACRO do.f=.(e =2{x)#f[e=.i{e end.
isempty g do.ok f
elseif.0=#f do.ok f 
elseif.do.
select.1{x
case.1 do.ok f nlpfx g
case.2 do.ok f nlctn g
case.3 do.ok f nlsfx g
case.do.jderr ERR010
end.
end.
)
bnums=:3 :0
\:~~.,".({.;JDFILES)&beforestr&>{."1(1!:0)<y,'*',IJF
)
checkntstamp=:3 :0
a=.ERR099
if.badbu y do.jderr a
elseif.-.2 1-:$y do.jderr a
elseif.badfl c=.;1{y do.jderr a
elseif.(2~:#$c )+.2~:#c do.jderr a
elseif.~:/{:@$&>y do.jderr ERR100
elseif.0 e.<:/c do.jderr a
elseif.badrc b=.checknames;0{y do.jderr a
elseif.badunique b=.}.b do.jderr a
elseif.0 e.valdate datefrnum,c do.jderr ERR101
elseif.do.ok<(<b)(<0;0)}y
end.
)
checkopen=:3 :0
if.#DPATH do.OK else.jderr ERR050 end.
)
checkpath=:3 :0
DL=.y
b=.,RPATH__DL
a=.,>1 {"1 DPATH
if.#b do.
if.b-:a do.OK else.jderr ERR081 end.
else.
if.badreps(<a)jreplace UF__DL;CNRPATH do.
jderr ERR082
else.
RPATH__DL=:a
OK
end.
end.
)
checkput=:3 :0
if.#DPATH do.
DL=.3{0{DPATH
if.RW__DL do.ok DL else.(jderr ERR051),<DNAME__DL end.
else.
jderr ERR050
end.
)
closedict=:4 :0
if.badrc a=.markmast 1 do.a return.end.
b=.({."1 DPATH)e.y
if.+./b do.
coerase"0 b#{:"1 DPATH
DPATH=:DPATH#~-.b
else.
(jderr ERR080),<y
end.
x=.>x
b=.(0{x)i.y
x=.<(<0)(<3;b)}x
if.badreps x jreplace JMASTER;CNMFTAB do.
jdmasterr ERR077
elseif.badrc a=.markmast~0 do.a
elseif.do.(ok OK054),y
end.
)
createst=:3 :0
'JOD ST MK UT SO'=:y
HASTYPE=:(i.4),MACROTYPE
saveobid JODOBID=:didnum 0
a=.CNCLASS,CNCREATION,CNPUTDATE,CNSIZE
1[INCNXR=:(INCLASS,INCREATE,INPUT,INSIZE),:a
)
defwords=:4 :0
if.badrc y=.checknames y do.y return.end.
h=.y=.}.y
if.badrc g=.pathnl WORD do.g return.end.
g=.}.g
if.SYMBOLLIM<:#g do.jderr ERR094 return.end.
b=.0&<@:#&>g
g=.b#g[a=.b#DPATH
if.*./b=.y e.;g do.
d=.locsfx x
for_dp.g do.
c=.(dp=.>dp)i.y
if.+./f=.c<#dp do.
if.badrc e=.(f#c)loadwords d,{:dp_index{a do.
e return.
end.
if.0=#y=.(-.f)#y do.break.end.
end.
end.
if.1&e.b=.0&>nc h=.h,&.>d do.
(jderr ERR085),b#h
else.
ok(":#b),OK060
end.
else.
(jderr ERR083),(-.b)#y
end.
)
delstuff=:4 :0
'i a DL'=.x
if.badrc y=.checknames y do.y 
elseif.loaddir__DL i do.
jderr ERR054
elseif.#f=.".(>dnix__DL i),'__DL'do.
j=.+/b=.f e.y=.~.}.y
if.j~:#y do.
(jderr ERR086),(-.y e.f)#y 
return.
end.
g=.(b=.-.b)#f
c=.b#".(e=.>dncn__DL i),'__DL'
d=.dfopen__DL e=.{.e
dropinv__DL 0
if.badrc h=.b invdelete d;a do.
h[dfclose__DL e return.
elseif.badrc h=.(i,d)savedir__DL g;c do.
h[dfclose__DL e return.
end.
if.WORD=i do.
if.badrc h=.DL delwordrefs y do.h[dfclose__DL e return.end.
end.
dfclose__DL e
h=.' ',>dnnm__DL i
(ok(":j),h,OK061),<DNAME__DL
elseif.do.
jderr ERR087
end.
)
delwordrefs=:4 :0
DL=.x
if.loadref__DL WORD do.jderr ERR079
elseif.do.
c=.WORDREFIX__DL e.y
if.+./c do.
dfopen__DL'U'
a=.UP__DL
d=.(c=.-.c)#WORDREFIX__DL
e=.c#WORDREFCN__DL
if.badrc b=.(WORD,a)saveref__DL d;e do.b[dfclose__DL'U'return.end.
dfclose__DL'U'
end.
OK
end.
)
didstats=:4 :0
if.badrc i=.checkopen 0 do.i return.end.
c=.(<'loadstamps'),&.>locsfx e=.{:"1 DPATH
if.+./(c`:0 )0 do.
jderr ERR054
else.
a=.DIRTS__oj[oj=.{.{:"1 DPATH
d=.'';'--';HEADNMS__oj
i=.('RW';'RPATH';a)fullmonty&><e
g=.1{i[h=.(;{.i){READSTATS
b=.({."1 DPATH),.h,.{.&>|:2}.i
b=.d,b
if.badjr i=.jread JMASTER;CNMFTAB do.
jderr ERR006 return.
end.
f=.<"0(~.;g)-.;1{i=.>i
d=.(0{i),":&.>f
a=.(1{i),f
g=.;&.>PATHSHOWDEL,L:0((<;a)i.&.>g){&.><d
ok<b,.PATHTIT;g
end.
)
dnlsearch=:4 :0
d=.ERR001
if.-.(second x)e.PATOPS do.jderr d return.end.
g=.{:"1 DPATH[b=.|{.x
if.badrc e=.b loadalldirs g do.e return.end.
f=.(>dnix__oj b)fullmonty g[oj=.{.g
if.DEFAULT~:{:x do.
if.(({.x)e.WORD,MACRO)*.({:x)e.HASTYPE do.
c=.(<'loadnc'),&.>locsfx g
if.+./(c`:0)b do.
jderr ERR054 return.
end.
a=.;&.>(>dnnc__oj b)fullmonty g
f=.(a=&.><{:x)#&.>f
else.
jderr d return.
end.
end.
x=.second x
if.isempty y do.
if.0>x do.ok (/:~)&.>f return.else.ok sortdnub f end.
elseif.do.
y=.,y
i=.0>x
h=.(i#0),0
f=.(<h$'')(I.0=#&>f)}f
if.0=#f=.f-.a:do.ok''return.end.
select.|x
case.1 do.if.i do.ok f allnlpfx y else.ok f nubnlpfx y end.
case.2 do.if.i do.ok f allnlctn y else.ok f nubnlctn y end.
case.3 do.if.i do.ok f allnlsfx y else.ok f nubnlsfx y end.
case.do.jderr d
end.
end.
)
freedisk=:3 :0
if.0=FREESPACE do.1
elseif.IFWIN do.freediskwin y
elseif.UNAME-:'Linux'do.freedisklinux y
elseif.IFIOS do.>:FREESPACE
elseif.UNAME-:'Darwin'do.freediskmac y
elseif.UNAME-:'Android'do.>:FREESPACE
elseif.do.>:FREESPACE
end.
)
freedisklinux=:3 :0
a=.host'df -l'
a=.}.<;._2 a
a=.a#~-.'none'&-:&>4{.&.>a
<./1000*3{"1]_1&".&>a
)
freediskmac=:3 :0
>:FREESPACE
)
freediskwin=:3 :0
s=.'kernel32 GetDiskFreeSpaceA i *c *i *i *i *i'cd y;(,0);(,0);(,0);(,0)
*/;2 3 4{s
)
fullmonty=:[:".&.>([:<[),&.>[:locsfx]
getdicdoc=:3 :0
DL=.{:{.DPATH
if.badjr a=.jread WP__DL;CNDICDOC do.jderr ERR088
else.
ok,>a
end.
)
getdocument=:4 :0
if.badrc a=.(x,1 )getobjects y do.a else.ok<0 3{"1 rv a end.
)
getexplain=:4 :0
if.badrc y=.checknames y do.y return.end.
g=.y=.}.y
if.badrc i=.pathnl x do.i return.end.
i=.}.i
b=.0&<@:#&>i
i=.b#i[d=.b#DPATH
if.*./b=.y e.;i do.
DL=.{:{:DPATH
e=.({.>dncn__DL{.x),'P__DL'
h=.(#g)$a:
for_dp.i do.
f=.(dp=.>dp)i.y
if.+./a=.f<#dp do.
DL=.{:dp_index{d
if.badjr c=.jread(".e);CNEXPLAIN do.
jderr ERR088 return.
end.
c=.(a#f){>c
h=.c(g i.a#y)}h
if.0=#y=.(-.a)#y do.break.end.
end.
end.
ok<g,.h
else.
(jderr ERR083),y#~-.b
end.
)
getgstext=:4 :0
if.badrc a=.(x,0)getobjects y do.a else.ok<0 1{"1 rv a end.
)
getntstamp=:4 :0
if.badrc a=.(x,INCREATE,INPUT)invfetch y do.a else.ok<(<y ),:1{a end.
)
getobjects=:4 :0
if.badrc y=.checknames y do.y return.end.
j=.y=.}.y
'g h'=.x
if.badrc i=.pathnl g do.i return.end.
i=.}.i
b=.0&<@:#&>i
i=.b#i[d=.b#DPATH
l=.0 0$''
if.*./b=.y e.;i do.
doj=.{:{.d
a=.(k=.>dncn__doj g),'__DL'
e=.({.k),'P__DL'
for_dp.i do.
f=.(dp=.>dp)i.y
if.+./o=.f<#dp do.
DL=.{:dp_index{d
if.badjr c=.jread(".e);(o#f){h+".a do.
jderr ERR088 return.
end.
l=.l,>c
if.0=#y=.(-.o)#y do.break.end.
end.
end.
l=.(({."1 l)i.j){l
ok<l
else.
(jderr ERR083),(-.b)#y
end.
)
getrefs=:4 :0
if.badrc y=.checknames y do.y return.end.
y=.}.y
if.badrc e=.pathnl x do.e return.end.
if.0 e.b=.y e.;}.e do.
(jderr ERR083),(-.b)#y return.
end.
g=.i.0 0
if.badrc e=.pathref x do.e return.end.
e=.}.e
b=.0&<@:#&>e
e=.b#e[d=.b#DPATH
if.#d do.
DL=.{:{.d
a=.>0 dnrn__DL x
for_dp.e do.
h=.(dp=.>dp)i.y
if.+./f=.h<#dp do.
DL=.{:dp_index{d
if.badjr c=.jread UF__DL;(f#h){".a,'__DL'do.
jderr ERR088 return.
end.
g=.g,>c
if.0=#y=.(-.f)#y do.break.end.
end.
end.
end.
if.#y do.ok<g ,(y ,"0 1<x),.<'';''else.ok<g end.
)
gslistnl=:4 :0
if.badrc c=.pathnl x do.c return.end.
uv=.(c=.}.c)fopix y
if.uv=#c do.(jderr ERR083),<y return.end.
uv=.{:uv{DPATH
a=.(".(b=.>dnix__uv x),'__uv')i.<y
a=.a{".(>dncn__uv x),'__uv'
if.badjr a=.jread(".({.b),'P__uv');a do.
jderr ERR084
else.
ok>{:>a
end.
)
inputdict=:4 :0
'c DL'=.x
if.loaddir__DL c do.jderr ERR054
elseif.a=.".(>dnix__DL c),'__DL'
*./b=.y e.a do.OK
elseif.do.
(jderr ERR086),(-.b)#y
end.
)
invappend=:4 :0
d=.ERR057
'c a'=.y
if.(#x)~:#a do.jderr d return.end.
f=.i.0
if.badjr b=.jread c;CNMARK do.jderr d return.end.
e=.>{.>b
for_cn.a do.
if.badjr b=.jread c;cn do.jderr d return.end.
b=.>b
if.e~:#b do.jderr d return.end.
b=.b,>cn_index{x
f=.f,(<b)jreplace c;cn
end.
if.badreps f do.jderr d else.OK end.
)
invdelete=:4 :0
'c a'=.y
e=.ERR057
g=.i.0[d=.#x
if.badjr b=.jread c;CNMARK do.jderr e return.end.
f=.>{.>b
for_cn.a do.
if.badjr b=.jread c;cn do.jderr e return.end.
b=.>b
if.f~:#b do.jderr e return.end.
g=.g,(<x#b)jreplace c;cn
end.
if.badreps g do.jderr e else.OK end.
)
invfetch=:4 :0
if.badrc y=.checknames y do.y return.end.
h=.y=.}.y
if.badrc j=.pathnl{.x do.j return.end.
j=.}.j
b=.0&<@:#&>j
j=.b#j[e=.b#DPATH
if.*./b=.y e.;j do.
c=.((0{INCNXR)i.}.x){1{INCNXR
DL=.{:{:DPATH
f=.({.>dncn__DL{.x),'P__DL'
i=.((#c),#h)$0
for_dp.j do.
g=.(dp=.>dp)i.y
if.+./a=.g<#dp do.
DL=.{:dp_index{e
if.badjr d=.jread(".f);c do.
jderr ERR088 return.
end.
d=.(a#g){"1>d
i=.d(<a:;h i.a#y)}i
if.0=#y=.(-.a)#y do.break.end.
end.
end.
ok<]`,@.(1&=@:#)i
else.
(jderr ERR083),y#~-.b
end.
)
invreplace=:4 :0
e=.ERR057
'c a'=.y
'f h'=.x
if.(#h)~:#a do.jderr e return.end.
g=.i.0
if.badjr b=.jread c;CNMARK do.jderr e return.end.
d=.>{.>b
for_cn.a do.
if.badjr b=.jread c;cn do.jderr e return.end.
b=.>b
if.d~:#b do.jderr e return.end.
b=.(>cn_index{h)f}b
g=.g,(<b)jreplace c;cn
end.
if.badreps g do.jderr e else.OK end.
)
islib=:'*'"_=[:{.[:>{.
iswriteable=:3 :0
if.IFWIN do.iswriteablewin y else.iswriteablelinux y end.
)
iswriteablelinux=:3 :0
(#,y)#1
)
iswriteablewin=:'w-'"_-:"1[:]1 3"_{"1[:;"1[:]_2:{."1[:>[:,&(1!:0)&.>]
jdatcreate=:4 :0
a=.(alltrim y),x-.' '
b=.ERR052
if.-.jcreate a do.(jderr b),<a 
elseif.c=.<0;t=.now''
c=.c,<''
badappend c=.(c,(OFFSET-#c)#a:)jappend a do.(jderr b),<a 
elseif.do.
ok{:c
end.
)
jwordscreate=:4 :0
a=.ERR052
if.-.jcreate y do.(jderr a),<y 
elseif.c=.<0;t=.now''
c=.c,<''
c=.c,0{x
c=.c,<}.x
badappend c=.(c,(OFFSET-#c)#a:)jappend y do.(jderr a),<y 
elseif.do.
ok{:c
end.
)
loadalldirs=:4 :0
x=.|x
for_oj.y do.
if.loaddir__oj x do.
jderr ERR054 return.
end.
end.
OK
)
loadallrefs=:4 :0
for_oj.y do.
if.loadref__oj x do.
jderr ERR079 return.
end.
end.
OK
)
loadwords=:4 :0
DL=.{:y
if.badjr o_pxH=.jread WF__DL;x{WORDCN__DL do.
jderr ERR088
else.
o_uVh=.0~:;1&{&>o_pxH
o_yau=.>{.y
try.
if.#o_mrs=.o_uVh#o_pxH do.
0!:0;(({.&>o_mrs),&.><o_yau,'=:'),&.>({:&>o_mrs),&.><LF
end.
if.#o_pXo=.(-.o_uVh)#o_pxH do.
o_mrs=.({.&>o_pXo),&.><o_yau
(o_mrs)=:(3!:2)&.>{:&>o_pXo
end.
catch.jderr ERR091 return.end.
OK
end.
)
mainddir=:3 :0
y=.(-PATHDEL={:y)}.y,PATHDEL
a=.alltrim(,&':'`]@.(0&=@:#))justdrv y
b=.alltrim justpath y
y=.a,b,PATHDEL
if.PATHDEL~:{.b,' 'do.
jderr ERR059
return.
end.
b=.;&.><"1 ,/\<;.1 b
b=.(<a),&.>b
if.1=makedir{:b do.ok y
elseif.makedir"0}:b
1=makedir{:b do.ok y
elseif.do.
(jderr ERR060),<y
end.
)
newdparms=:3 :0
'e b c a d'=.y
f=.c;a;(now'');(6#0);(<d),&.>e,&.>PATHDEL
f=.f,(9!:14'');9!:12''
f=.f,<i.0
f,<|:0 2{"1 b
)
newregdict=:4 :0
l=.JMASTER
o=.ERR061
if.(badbu y )+.1~:#$y do.jderr o
elseif.(3<#y )+.2>#y do.jderr o
elseif.+./badcl&>y do.jderr o
elseif.do.
'p t g'=.3{.y,<''
p=.alltrim p[t=.hostsep alltrim t
if.0&e.(#p),#t do.jderr o return.end.
if.0&e.p e.' ',ALPHA do.
jderr ERR062 return.
elseif.0&e.t e.PATHCHRS,ALPHA do.
jderr ERR063 return.
end.
if.IFWIN do.
if.(2#PATHDEL)-:2{.t do.
t=.t,(PATHDEL={:t)}.PATHDEL
d=.''
else.
if.isempty w=.justdrv t do.jderr ERR064 return.end.
d=.w,':',PATHDEL
end.
else.
if.PATHDEL~:{.t do.(jderr ERR096),<t return.end.
d=.t
end.
if.(x=1)*.0<#d do.
a=.freedisk d
if.a<FREESPACE do.(jderr ERR065),<d return.end.
end.
if.badjr z=.jread l;CNMFTAB,CNMFPARMS,CNMFDLOG do.
jderr ERR006 return.
end.
if.badrc o=.markmast 1 do.o return.end.
'k h e'=.z
if.(<p)e.0{k do.jdmasterr ERR066 return.end.
if.x=1 do.
if.badrc t=.mainddir t do.t [markmast~0 return.end.
t=.{:t
if.0 &e.z=.makedir"0 t,&.>JDSDIRS do.
jdmasterr ERR067 return.
end.
t=.>t
f=.didnum 0
z=.newdparms JDSDIRS;h;p;f;t
z=.<(g;z)jwordscreate t,>0{JDFILES
z=.z,(}.JDFILES)jdatcreate&.><t
if.0&e.;{.&>z do.
jdmasterr ERR068 return.
end.
q=.k,.p;f;t;0
r=.OK050
else.
t=.(-PATHDEL={:t)}.t,PATHDEL
j=.JDFILES,&.><IJF
if.1 e.z=.-.fex"1 c=.<@:;"1 (<t),"0/j do.
(jdmasterr ERR073),<p return.
end.
if.badjr b=.jread(i=.t,>{.JDFILES);CNPARMS,CNDICDOC do.
jdmasterr ERR088 return.
end.
'h s'=.b
f=.1{::h
if.f e.;1{k do.jdmasterr ERR092 return.end.
if.-.islib h do.
if.0 e.iswriteable c do.
jdmasterr ERR095 return.
end.
h=.((<t),&.>JDSDIRS,&.>PATHDEL)PARMDIRS}h
h=.(<p)0}h
g=.(*#g){s;g
if.badreps(h;g)jreplace i;CNPARMS,CNDICDOC do.
jdmasterr ERR056
end.
end.
q=.k,.p;f;t;0
r=.OK058
end.
z=.(q;k;e,f)jreplace l;CNMFTAB,CNMFTABBCK,CNMFDLOG
if.0&><./z do.jdmasterr ERR069 return.end.
if.badrc o=.markmast~0 do.o return.end.
ok r;p;jpathsep t
end.
)
nlctn=:([:I.[:+./"1([:,:])E.[:>[){[
nlpfx=:[#~([:<[:,])-:&>([:#[:,]){.&.>[
nlsfx=:[#~([:<[:,])-:&>([:-[:#[:,]){.&.>[
nubnlctn=:([:sortdnub[)nlctn]
nubnlpfx=:([:sortdnub[)nlpfx]
nubnlsfx=:([:sortdnub[)nlsfx]
opendict=:4 :0
if.DPLIMIT<(#x)+#DPATH do.jderr ERR070 return.end.
q=.x e.{."1 DPATH
if.1 e.q do.(jderr ERR071),q #x return.end.
'k f'=.y
l=.(0{f)i.x
d=.(<2;l){f
p=.0<;(<3;l){f
if.1 e.p do.(jderr ERR072),(1 =p )#x return.end.
c=.JDFILES,&.><IJF
if.1 e.q=.-.fex"1 a=.<@:;"1 d,"0/c do.
(jderr ERR073),q#x return.
end.
if.badrc g=.markmast 1 do.g return.end.
b=.DPATH
e=.i.0
for_dp.d do.
if.badjr o=.jread(;dp,{.c);CNPARMS do.
(jdmasterr ERR074),dp_index{x return.
end.
if.((<1;dp_index{l){f)-:1{>o do.
i=.-.0{(;dp)E.;(0{PARMDIRS){>o
if.i*.islib>o do.
o=.>o
j=.PATHDEL,&.>~dp,&.>PATHDEL&afterlaststr&.>rpdtrim&.>PARMDIRS{o
o=.<j PARMDIRS}o
else.
if.i do.
if.#b=.({:"1 b )-.{:"1 DPATH do.coerase"0 b end.
(jdmasterr ERR098),0 1{>o return.
end.
if.0 e.iswriteable dp_index{a do.
if.#b=.({:"1 b )-.{:"1 DPATH do.coerase"0 b end.
(jdmasterr ERR095),dp_index{x return.
end.
end.
DL=.conew'ajoddob'
h=.dp_index{x
if.createdl__DL i;h;dp;k;o do.
b=.b,(a:,~h,1{>o),DL
e=.e,LIBSTATUS__DL
else.
if.#b=.({:"1 b )-.{:"1 DPATH do.coerase"0 b end.
(jdmasterr ERR075),dp_index{x
return.
end.
else.
if.#b=.({:"1 b )-.{:"1 DPATH do.coerase"0 b end.
(jdmasterr ERR076),dp_index{x
return.
end.
end.
DPATH=:b
l=.(-.e)#l
f=.(<JODOBID*1=k)(<3;l)}f
if.badreps(<f)jreplace JMASTER;CNMFTAB do.
jdmasterr ERR077
elseif.badrc g=.markmast~0 do.g
elseif.k e.1 2 do.
q=.(1=k){p=.'/',&.>READSTATS
(ok OK052,(}.;e{(q,0{p)),') ->'),x
elseif.do.jderr ERR001
end.
)
pathnl=:3 :0
a=.{:"1 DPATH
if.badrc uv=.y loadalldirs a do.uv return.end.
ok(>dnix__uv y)fullmonty a[uv=.{.a
)
pathref=:3 :0
a=.{:"1 DPATH
if.badrc uv=.y loadallrefs a do.uv return.end.
ok(>dnrn__uv y)fullmonty a[uv=.{.a
)
putdicdoc=:3 :0
if.badcl y do.jderr ERR097
else.
DL=.{:{.DPATH
a=.1
if.0=nc<'DOCUMENTDICT'do.a=.1=DOCUMENTDICT
elseif.
0=nc<'DOCUMENTDICT__DL'do.a=.1=DOCUMENTDICT__DL
end.
if.-.a do.ok OK063;DNAME__DL return.end.
if.badreps(<y)jreplace WP__DL;CNDICDOC do.jderr ERR056
else.
ok OK062;DNAME__DL
end.
end.
)
putexplain=:4 :0
if.badrc y=.checknttab y do.y return.else.y=.rv y end.
if.+/.MAXEXPLAIN<#&>{:"1 y do.jderr ERR089 return.end.
'c DL'=.x
if.badrc e=.x inputdict{."1 y do.e
else.
b=.(>dnix__DL c),'__DL'
a=.".({.>dncn__DL c),'P__DL'
d=.(".b)i.{."1 y
if.badrc e=.(d;<<{:"1 y)invreplace a;CNEXPLAIN do.e return.end.
e=.' ',>dnnm__DL c
ok((":#d),e,OK055);DNAME__DL
end.
)
putgs=:4 :0
'DL d i'=.x
if.badrc k=.pathnl d do.k return.end.
y=./:~~.}.y[g=.{.y
if.*./b=.y e.;}.k do.
if.loaddir__DL i do.
jderr ERR054
elseif.do.
e=.{.j=.(>dnix__DL i),'__DL'
c=.(>dncn__DL i),'__DL'
o=.(".j)i.g
dfopen__DL e
h=.".e,'P__DL'
if.o=#".j do.
if.+./o=.(<g)e.&>}.pathnl i do.
if.badrc p=.i getgstext g do.p return.else.o=.(1;0 1){::p end.
else.
o=.''
end.
f=.<g,o;<y
f=.f,<g,3$<''
if.badappend a=.f jappend h do.
jderr ERR058[dfclose__DL e return.
end.
l=.nowfd now''
o=.l;l;<a:
p=.CNPUTDATE,CNCREATION,CNEXPLAIN
if.badrc k=.o invappend h;p do.k
else.
o=.(".j),g
p=.(".c),{.a
if.badrc(i,h)savedir__DL o;p do.
jderr k[dfclose__DL e return.
else.
(<(#".j);now'')jreplace h;CNMARK
end.
end.
else.
a=.o{".c
if.badjr p=.jread h;a do.
jderr ERR088[dfclose__DL e return.
elseif.g-:0{>p do.
if.badreps(<(}:>p),<y)jreplace h;a do.
jderr ERR056[dfclose__DL e return.
end.
p=.o;nowfd now''
if.badrc k=.p invreplace h;CNPUTDATE do.k return.end.
elseif.do.
jderr ERR055 return.
end.
end.
dfclose__DL e
o=.,>dnnm__DL i
ok(o,' <',(>g),'> ',OK059);DNAME__DL
end.
else.
(jderr ERR083),y#~-.b
end.
)
putntstamp=:4 :0
if.badrc l=.checkntstamp y do.l return.else.l=.rv l end.
'd DL'=.x
k=.;0{l[g=.;}.pathnl d
if.0 e.a=.k e.g do.(jderr ERR083),(-.a)#k return.end.
if.badrc b=.gettstamps__DL d do.b return.else.b=.rv b end.
e=.".(>dnix__DL d),'__DL'
h=.e i.k
f=.h-.#e
c=.(I.h=#e){k
i=.f{e
j=.$b
b=.((k i.i){"1 ;1 {l)f}"1 b
if.-.j-:$b do.jderr ERR102 return.end.
if.badrc l=.d puttstamps__DL b do.l
else.
ok('(',(":#i),OK064,(":#c),OK065);(<i),<c
end.
)
puttable=:4 :0
'c DL'=.x
if.loaddir__DL c do.
jderr ERR054
else.
y=.>{:y
d=.{.f=.(>dnix__DL c),'__DL'
a=.(>dncn__DL c),'__DL'
i=.(".f)i.{."1 y
b=.i=#".f
h=.0
dfopen__DL d
e=.".d,'P__DL'
if.0 e.b do.
if.badrc g=.(c;f;a;e;<DL)rplctable(<(-.b)#y),<(-.b)#i do.
g[dfclose__DL d return.
end.
h=.h+rv g
end.
if.1 e.b do.
if.badrc g=.(c;f;a;e;<DL)apptable b#y do.
g[dfclose__DL d return.
end.
h=.h+rv g
(<(#".f);now'')jreplace e;CNMARK
end.
dfclose__DL d
i=.' ',,>dnnm__DL c
ok((":h),i,OK057);DNAME__DL
end.
)
puttexts=:4 :0
if.badrc y=.checknttab y do.y return.else.y=.rv y end.
'e f DL'=.x
if.-.f e.0 1 do.jderr ERR090
elseif.badrc h=.(e;<DL)inputdict{."1 y do.h
elseif.do.
d=.(>dnix__DL e),'__DL'
a=.(>dncn__DL e),'__DL'
c=.".({.a),'P__DL'
g=.(".d)i.h=.{."1 y
g=.f+g{".a
b=.jread c;g
if.h badcn b do.
jderr ERR055 return.
end.
b=.>b
b=.({:"1 y)(<a:;f{1 3)}b
if.badreps(<"1 b)jreplace c;g do.
jderr ERR056 return.
end.
h=.' ',(>dnnm__DL e),' '
ok((":#g),h,(>f{'text';'document'),OK057);DNAME__DL
end.
)
putwords=:4 :0
if.badrc e=.checknames y do.e
elseif.y=.~.}.e
'a DL'=.x
b=.wex e=.y,&.>locsfx a
0 e.b do.(jderr ERR053),(-.b )#e
elseif.loaddir__DL WORD do.
jderr ERR054
elseif.do.
e=.WORDIX__DL i.y
b=.e=#WORDIX__DL
d=.0
dfopen__DL'W'
if.0 e.b do.
dropnc__DL WORD
if.badrc c=.x rplcwords(<(-.b)#y),<(-.b)#e do.
c[dfclose__DL'W'return.
end.
d=.d+rv c
end.
if.1 e.b do.
dropnc__DL WORD
if.badrc c=.x appwords b#y do.c[dfclose__DL'W'return.end.
d=.d+rv c
(<(#WORDIX__DL);now'')jreplace WP__DL;CNMARK
end.
dfclose__DL'W'
ok((":d),OK051);DNAME__DL
end.
)
putwordxrs=:4 :0
'e DL'=.x
if.badrc d=.checkpath DL do.d
elseif.loadref__DL WORD do.jderr ERR079
elseif.do.
f=.WORDREFIX__DL i.<e
b=.f=#WORDREFIX__DL
if.#y=.catrefs y do.
if.badrc i=.pathnl WORD do.i return.end.
if.0 e.h=.(g=.0 {::y)e.;}.i do.
(jderr ERR083),g#~-.h return.
end.
end.
dfopen__DL'U'
c=.UP__DL
i=.0
if.b do.
if.#y do.
y=.<e;WORD;<y
if.badappend a=.y jappend c do.
jderr ERR058[dfclose__DL'U'return.
end.
g=.WORDREFIX__DL,<e
h=.WORDREFCN__DL,a
i=.1
end.
else.
if.#y do.
y=.<e;WORD;<y
if.badreps y jreplace c;f{WORDREFCN__DL do.
jderr ERR056[dfclose__DL'U'return.
end.
else.
i=.0 f}(#WORDREFIX__DL)#1
g=.i#WORDREFIX__DL
h=.i#WORDREFCN__DL
i=.1
end.
end.
if.i do.
if.badrc d=.(WORD,c)saveref__DL g;h do.d[dfclose__DL'U'return.end.
end.
dfclose__DL'U'
ok('<',e,'>',OK056);DNAME__DL
end.
)
rplctable=:4 :0
't h c f DL'=.x
y=.0['q k'=.y
p=.#&>{:"1 q
r=.#q[b=.k{".c
j=.PUTFACTOR__DL
if.w=.t e.WORD,MACRO do.
a=.;1 {"1 q
end.
while.#q do.
d=.j<.#q
s=.d{.q[l=.d{.b
e=.jread f;l
if.({."1 s)badcn e do.
jderr ERR055 return.
end.
if.badreps(<"1 s)jreplace f;l do.
jderr ERR056 return.
end.
q=.d}.q[b=.d}.b
end.
if.w do.
dropnc__DL t
g=.CNCLASS,CNPUTDATE,CNSIZE
o=.k;<a;(r#nowfd now'');p
else.
g=.CNPUTDATE,CNSIZE
o=.k;<(r#nowfd now'');p
end.
if.badrc i=.o invreplace f;g do.i else.ok r end.
)
rplcwords=:4 :0
'h DL'=.x
'k o'=.y
d=.o{WORDCN__DL
t=.#o
z=.WP__DL[l=.PUTFACTOR__DL
g=.k,&.>locsfx h
r=.c=.i.0
while.#k do.
e=.l<.#k
w=.e{.k[i=.e{.g[p=.e{.d
f=.jread WP__DL;p
if.w badcn f do.
jderr ERR055
end.
s=.wrep&.>i
b=.#&>s
a=.nc i
s=.,<"1 w,.(<"0 a),.s
if.badreps s jreplace z;p do.
jderr ERR056
else.
r=.r,b
c=.c,a
end.
k=.e}.k[g=.e}.g[d=.e}.d
end.
j=.ERR057
if.t~:#r do.jderr j return.end.
q=.o;<c;(t#nowfd now'');r
if.badrc j=.q invreplace z;CNCLASS,CNPUTDATE,CNSIZE do.j else.ok t end.
)
sortdnub=:[:/:~[:~.;
coclass'ajoddob'
coinsert'ajodstore'
DIRNMS=:<;._1' WORD TEST GROUP SUITE MACRO'
DTSIXCN=:<;._1' TS IX CN'
(;:'DIRTS DIRIX DIRCN')=:<"1|:DIRNMS,&.>/DTSIXCN
DIRNC=:<;._1' WORDNC MACRONC'
DIRRFN=:<;._1' WORDREF TESTREF'
(;:'REFTS REFIX REFCN')=:<"1|:DIRRFN,&.>/DTSIXCN
BAKPFX=:'B'
DFILES=:<;._1 ' WF TF GF SF MF UF'
DFPTRS=:<;._1 ' WP TP GP SP MP UP'
DIRCN=:<;._1 ' WORDCN TESTCN GROUPCN SUITECN MACROCN'
DIRIX=:<;._1 ' WORDIX TESTIX GROUPIX SUITEIX MACROIX'
DIRTS=:<;._1 ' WORDTS TESTTS GROUPTS SUITETS MACROTS'
DIRVNS=:<;._1 ' word test group suite macro'
DSUBDIRS=:<;._1 ' SCR SUI DOC DMP ALI BAK'
ERR200=:'unable to save directory - previous directory restored'
ERR201=:'unable to save directory - unable to restore previous directory'
ERR202=:'invalid put dictionary name'
ERR203=:'unable to create temporary file'
ERR204=:'not enough free disk space for operation'
ERR205=:'unable to rename files: DLL error ->'
ERR206=:'no backups to restore'
ERR207=:'missing backup files - restore aborted'
ERR208=:'unable to copy files: DLL error ->'
ERR209=:'backup dictionary id number invalid - restore aborted'
ERR210=:'unable to copy/move/rename files - shell messages ->'
ERR211=:'unable to read timestamps'
ERR212=:'timestamp update failure'
HEADNMS=:<;._1 ' Words Tests Groups* Suites* Macros'
OK200=:'dictionary packed ->'
OK201=:'dictionary restored ->'
REFCN=:<;._1 ' WORDREFCN TESTREFCN'
REFIX=:<;._1 ' WORDREFIX TESTREFIX'
REFTS=:<;._1 ' WORDREFTS TESTREFTS'
TEMPFX=:'tmp'
backnum=:3 :0
a=.>jread WF;1
if.#a do.a=.(>:y{a )y}a else.a=.0 0 end.
a jreplace WF;1
y{a
)
copydirinv=:3 :0
'd c'=.y
if.1~:jcreate d do.jderr ERR203 return.end.
if.badjr b=.jread c;i.OFFSET do.jderr ERR088 return.end.
if.badappend a=.b jappend d do.jderr ERR058 else.OK end.
)
copyfile=:'kernel32 CopyFileA i *c *c i'&cd
copyfiles=:4 :0
if.IFWIN do.
a=.copyfile"1 x,.y,.<0
if.*./0<;{."1 a do.OK else.(jderr ERR208),(15!:11)''end.
else.
if.isempty a=.host"1>(<'cp '),&.>x,&.>' ',&.>y do.OK
else.
(jderr ERR210),<,a
end.
end.
)
createdl=:3 :0
BAKNUM=:_1
'c f b d a'=.y
DNAME=:,>f
DIDNUM=:>1{a
NPPFX=:c
({."1 MASTERPARMS)=:{:"1 MASTERPARMS
({.>{:a)=:{:>{:a
LIBSTATUS=:islib a
RW=:(-.LIBSTATUS)*1=d
(DSUBDIRS)=:PARMDIRS{a
(DFILES)=:g=.b,&.>JDFILES
(DFPTRS)=:g
SYS=:((justdrv WF),':',justpath WF),PATHDEL
SYS=:(':'={.SYS)}.SYS
if.badjr e=.jread UF;CNRPATH do.0 else.1[RPATH=:>e end.
)
dbakf=:4 :0
BAK,(":y),(;x{JDFILES),IJF
)
dfclose=:3 :0
a=.y,'P'
(a)=:".y,'F'[jclose_jfiles_".a
)
dfopen=:3 :'(y,''P'')=: jopen_jfiles_ ".y,''F'''
dfp=:3 :0
select.y
case.WORD;GROUP do.SCR
case.TEST;SUITE do.SUI
case.DOCUMENT do.DOC
case.DEFAULT do.DMP
case.do.BAK
end.
)
dncn=:3 :0
(OBJECTNC i.y){DIRCN
)
dnix=:3 :0
(OBJECTNC i.y){DIRIX
)
dnnc=:3 :0
((WORD,MACRO)i.y){DIRNC
)
dnnm=:3 :0
(OBJECTNC i.y){DIRVNS
)
dnrn=:3 :0
((WORD,TEST)i.y){REFIX
:
((WORD,TEST)i.y){REFCN
)
dropall=:3 :0
erase DIRNC,DIRIX,DIRCN,DIRTS,REFIX,REFCN,REFTS
)
dropbakdir=:3 :0
erase(<BAKPFX),&.>DIRIX,DIRCN,DIRTS
)
dropdir=:3 :0
erase DIRIX,DIRCN,DIRTS
)
dropinv=:3 :0
erase DIRNC
)
dropnc=:3 :0
erase((WORD,MACRO)i.y){DIRNC
)
dropref=:3 :0
erase REFIX,REFCN,REFTS
)
gettstamps=:3 :0
b=.".({.;dnix y),'F'
if.badjr a=.jread b;CNCREATION,CNPUTDATE do.jderr ERR211 else.ok<>a end.
)
justdrvpath=:[:}:]#~[:+./\.'\'&=
libstatus=:3 :0
if.NPPFX do.(jderr ERR098),DNAME;DIDNUM return.end.
if.badjr a=.jread WF;CNPARMS do.jderr ERR088 return.end.
b=.(,>{.a=.>a)-.'*'
a=.(<(y{.'*'),b)(0)}a
if.badreps(<a)jreplace WF;CNPARMS do.jderr ERR017 else.OK end.
)
loadbakdir=:4 :0
if.BAKNUM~:x do.dropbakdir 0 end.
if.wex d=.(<BAKPFX),&.>dnix y do.0
else.
c=.BAK,(":x),;y{JDFILES
if.badjr a=.jread c;CNDIR do.
1
else.
b=.(<_2}.>d),&.>DTSIXCN
(b)=:a
BAKNUM=:x
-.*./wex b
end.
end.
)
loaddir=:3 :0
if.wex d=.dnix y do.0
else.
c=.".({.d=.>d),'F'
if.badjr a=.jread c;CNDIR do.
1
else.
b=.(<_2}.d),&.>DTSIXCN
(b)=:a
-.*./wex b
end.
end.
)
loadnc=:3 :0
if.wex b=.dnnc y do.0
else.
c=.".({.b=.>b),'F'
if.badjr a=.jread c;CNCLASS do.
1
else.
(b)=:>a
-.wex<b
end.
end.
)
loadref=:3 :0
if.wex c=.dnrn y do.0
else.
a=.((WORD,TEST)i.y){CNREF
if.badjr b=.jread UF;CNMARK,a do.
1
else.
c=.>c
c=.(<_2}.c),&.>DTSIXCN
(c)=:b
-.*./wex c
end.
end.
)
loadstamps=:3 :0
d=.DIRTS
if.*./b=.wex d do.0
else.
d=.(-.b)#d
for_st.d do.
c=.".({.st=.>st),'F'
if.badjr a=.jread c;CNMARK do.
1 return.
else.
(st)=:>a
end.
end.
-.*./wex d
end.
)
maxback=:[:>./[:".&>(]*./\@e.&.>(<'0123456789')"_)#&.>]
movefile=:'kernel32 MoveFileA i *c *c'&cd
nummask=:([:":[)-:"1([:#[:":[){.&>]
packdict=:3 :0
if.(,DNAME)-:,y do.
dropall 0
e=.SYS
f=.backnum 0
for_obj.OBJECTNC do.
i=.e,TEMPFX,>obj_index{JDFILES
b=.".>obj_index{DFILES
if.badrc d=.obj tmpdatfile i;b do.d return.end.
end.
i=.e,TEMPFX,>5{JDFILES
if.badrc d=.tmpusesfile i;UF do.d return.end.
a=.PATHDEL,~e,>5{JDSDIRS
c=.JDFILES,&.><IJF
g=.(<e),&.>c
h=.(<a),&.>(<":f),&.>c
if.badrc d=.g renamefiles h do.d return.end.
h=.g
g=.(<e),&.>(<TEMPFX),&.>c
if.badrc d=.g renamefiles h do.d return.end.
dropall 0
ok OK200;DNAME;f
else.
jderr ERR202
end.
)
packspace=:3 :0
a=.+/;2{"1]1!:0<SYS,'*',IJF
if.a<volfree BAK do.OK else.jderr ERR204 end.
)
puttstamps=:4 :0
a=.".({.&>dnix x),'F'
if.badjr(<"1 y)jreplace a;CNCREATION,CNPUTDATE do.jderr ERR212 else.OK end.
)
renamefiles=:4 :0
if.IFWIN do.
a=.movefile"1 x,.y
if.*./0<;{."1 a do.OK else.(jderr ERR205),(15!:11)''end.
else.
if.isempty a=.host"1>(<'mv '),&.>x,&.>' ',&.>y do.OK
else.
(jderr ERR210),<,a
end.
end.
)
restdict=:4 :0
if.(,DNAME)-:,y do.
dropall 0
f=.((justpath`justdrvpath@.IFWIN)SYS),PATHDEL
c=.JDFILES,&.><IJF
a=.PATHDEL,~f,>5{JDSDIRS
i=.(<f),&.>c
h=.(<a),&.>(<":>x),&.>c
if.-.fex h do.jderr ERR207 return.end.
if.badjr b=.jread(>{.h);CNPARMS do.
jderr ERR088 return.
end.
d=.((1&{::@>) ::0:) b
if.-.d-:DIDNUM do.jderr ERR209 return.end.
(1!:55)i
if.badrc e=.h copyfiles i do.e return.end.
g=.backnum 0
dropall 0
ok OK201;DNAME;<:g
else.
jderr ERR202
end.
)
restspace=:3 :0
if.#a=.1!:0<BAK,'*',IJF do.
c=.maxback{."1 a
a=.a#~c nummask{."1 a
b=.+/;2{"1 a
if.b<volfree SYS do.
ok c
else.
jderr ERR204
end.
else.
jderr ERR206
end.
)
savedir=:4 :0
'd i'=.x
y=.0['g b'=.y
d=.(OBJECTNC i.d){DIRNMS
'f e c'=.d,&.>DTSIXCN
a=.(<g)jreplace i;CNLIST
a=.a,b jreplace i;CNCOMPS
a=.a,(<h=.(#g);now'')jreplace i;CNMARK
if.badreps a do.
a=.(<".e)jreplace i;CNLIST
a=.a,(".c)jreplace i;CNCOMPS
a=.a,(<".f)jreplace i;CNMARK
if.badreps a do.
jderr ERR200
else.
jderr ERR201
end.
else.
(e)=:g
(c)=:b
(f)=:h
OK
end.
)
saveref=:4 :0
'j h'=.x
y=.0['i c'=.y
k=.(WORD,TEST)i.j
e=.k{DIRRFN
b=.k{CNREF
'g f d'=.e,&.>DTSIXCN
a=.(<i)jreplace h;0{b
a=.a,c jreplace h;1{b
a=.a,(<l=.0;now'')jreplace h;CNMARK
if.badreps a do.
a=.(<".f)jreplace h;0{b
a=.a,(".d)jreplace h;1{b
a=.a,(<".g)jreplace h;CNMARK
if.badreps a do.
jderr ERR200
else.
jderr ERR201
end.
else.
(f)=:i
(d)=:c
(g)=:l
OK
end.
)
tmpdatfile=:4 :0
'f c'=.y
if.badrc g=.copydirinv y do.g return.end.
if.loaddir x do.jderr ERR054 return.end.
d=.".>dnix x
a=.".>dncn x
if.(#d)~:#a do.jderr ERR093 return.end.
if.0=#d do.OK return.end.
d=.(-COPYFACTOR)<\d
a=.(-COPYFACTOR)<\a
dropdir x
e=.i.0
for_reg.a do.
g=.,(>reg),.>:>reg
if.badjr b=.jread c;g do.jderr ERR088 return.end.
if.(2#>reg_index{d)badcn b do.jderr ERR055 return.end.
if.badappend g=.b jappend f do.jderr ERR058 return.end.
e=.e,fod g
end.
if.badreps e jreplace f;CNCOMPS do.jderr ERR056 else.OK end.
)
tmpusesfile=:3 :0
'f c'=.y
if.badrc g=.copydirinv y do.g return.end.
if.loadref WORD do.jderr ERR079 return.end.
d=.".>dnrn WORD
a=.".>0 dnrn WORD
dropref 0
if.(#d)~:#a do.jderr ERR093 return.end.
if.0=#d do.OK return.end.
d=.(-COPYFACTOR)<\d
a=.(-COPYFACTOR)<\a
e=.i.0
for_reg.a do.
if.badjr b=.jread c;reg do.jderr ERR088 return.end.
if.(>reg_index{d)badcn b do.jderr ERR055 return.end.
if.badappend g=.b jappend f do.jderr ERR058 return.end.
e=.e,g
end.
if.badreps e jreplace f;1{0{CNREF do.jderr ERR056 else.OK end.
)
volfree=:3 :0
if.IFWIN do.
if.(2#PATHDEL )-:2{.y do.freediskwin y else.freediskwin (justdrv y ),':',PATHDEL end.
else.
<./freedisklinux 0
end.
)
coclass'ajodmake'
coinsert'ajod'
DUMPTAG=:' NB.{*JOD*}'
WRAPTMPWID=:'zz';67
SOCLEAR=:'".soclear',DUMPTAG
SOGRP=:' grp&> ". ". ''',(>{.WRAPTMPWID),'_'',SOLOCALE,''_'' [ cocurrent ''base''',DUMPTAG
SOPUT=:'soput ".''nl_'',SOLOCALE,''_ i.4'' [ cocurrent ''base''',DUMPTAG
SOPUTTEXT=:' put ". ".''',(>{.WRAPTMPWID),'_'',SOLOCALE,''_'' [ cocurrent ''base''',DUMPTAG
SOSWITCH=:'cocurrent SO__JODobj',DUMPTAG
DUMPMSG0=:'NB. JOD dictionary dump: '
DUMPMSG1=:'Names & DidNums on current path'
DUMPMSG2=:'''NB. end-of-JOD-dump-file regenerate cross references with:  0 globs&> }. revo '''''''' '''
DUMPMSG3=:'NB. Generated with JOD version'
DUMPMSG4=:'NB. J version: '
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
ERR0160=:'invalid object timestamp table'
EXPLAINFAC=:10
EXPPFX0=:4 5$'1 : ''2 : ''3 : ''4 : '''
EXPPFX1=:3 8$'3 : ('':''3 : (,'':4 : (,'':'
GLOBCATS=:<;._1 ' Global Local (*)=: (*)=. for.'
HEADEND=:'NB.*end-header'
JARGS=:<;._1 ' x y u v m n $:'
MIXEDOVER=:'(<:)=:'
OK0150=:'file saved ->'
OK0151=:'object(s) on path dumped ->'
PORTCHARS=:,:'+++++++++|-'
SOPASS=:'showpass '
btclfrcl=:3 :0
b=.".(d=.y i.' '){.y 
y=.(>:d)}.y
f=.2{.c=.".b{.y
c=.2}.c
g=.b}.y
if.#g do.
h=.0<c
a=.0#~#g
e=.}:0,+/\h#c
a=.1 e}a
f$h#^:_1 a<;.1 g
else.
f$<''
end.
)
clearso=:3 :0
if.#s=.nl__SO i.4 do.(4 !:55)s,&.>locsfx SO end.
)
clfrbtcl=:3 :0
c=.$y
a=.,#&>y
b=.":c,a
(":$b),' ',b,;y
)
createmk=:3 :0
'JOD ST MK UT SO'=:y
)
dec85=:3 :0
b=.fromascii85 y
b=.btclfrcl b
assert.({:$b)e.2 3
if.3={:$b do.
a=.<a:;1
c=.".&.>a{b
b=.c a}b
end.
5!:5<'b'
)
dumpdictdoc=:3 :0
if.badrc e=.DICTIONARY get''do.(jderr ERR0155),<y return.end.
if.0=#e=.>1{e do.OK return.end.
d=.DUMPTAG,LF
b=.(2#LF),SOSWITCH,LF
c=.SOPASS,(":DICTIONARY),' put >1{,".".''zz_'',SOLOCALE,''_'' [ cocurrent ''base'' ',d
a=.b,WRAPTMPWID fmtdumptext,:'';e
a=.a,LF,c,SOCLEAR,2#LF
if._1-:(toHOST a)fap<y do.(jderr ERR0155),<y else.OK end.
)
dumpdoc=:4 :0
'a b c'=.x
if.badrc d=.((EXPLAINFAC*a);(b,EXPLAIN);c)dumptext y do.d
elseif.badrc d=.(a;(b,DOCUMENT);c)dumptext y do.d
elseif.do.OK
end.
)
dumpgs=:4 :0
'b e'=.x
g=.LF,SOSWITCH,LF
a=.SOPASS,(":e),SOGRP,LF,SOCLEAR,LF
f=.<y
if.badrc h=.e dnl''do.h
elseif.a:e.h do.OK
elseif.do.
h=.(-b)<\h=.}.h
for_blk.h do.
c=.e grp&.>>blk
if.0 e.{.&>c do.jderr ERR0157 return.end.
c=.(<"0>blk),&.>}.&.>c
c=.5!:5<'c'
if.#c=.WRAPTMPWID wraplinear c do.
c=.toHOST g,c,LF,a
if._1-:c fap f do.(jderr ERR0155),f return.end.
end.
end.
if.badrc d=.(b;e;y)dumptext;h do.d return.end.
if.badrc d=.(b;e;y)dumpdoc;h do.d return.end.
end.
OK
)
dumpheader=:3 :0
if._1-:''(write ::_1:)y do.(jderr ERR0156),<y return.end.
9!:7,PORTCHARS[a=.,9!:6''
b=.DUMPMSG0,tstamp''
b=.b,LF,DUMPMSG3,;(<'; '),&.>":&.>JODVMD
b=.b,LF,DUMPMSG4,":,9!:14''
b=.b,LF,ctl'NB. ',"1 ' ',DUMPMSG1,":0 1{"1 DPATH__ST
b=.b,LF,LF
9!:7 a
c=.DUMPTAG,LF
b=.b,'9!:41 [ 1',c
b=.b,'cocurrent ''base''',c
b=.b,'sonl_z_=: ''sonl__MK__JODobj i.4''',c
b=.b,(SOPASS-.' '),'_z_=:] [ 1!:2&2',c
b=.b,'SOLOCALE_z_=:":>SO__JODobj',c
b=.b,'soput_z_=:SOLOCALE&put',c
b=.b,'soclear_z_=: ''0 0 $ clearso__MK__JODobj 0''',c
if._1-:(toHOST b)fap<y do.(jderr ERR0155),<y else.OK end.
)
dumpntstamps=:4 :0
if.x do.
if.badrc a=.getallts 0 do.a return.else.a=.rv a end.
if.0=>./,#&>(0 1){a do.OK return.end.
e=.DUMPTAG,LF
b=.LF,SOSWITCH,LF
c=.'cocurrent ''base'' ',e
c=.c,'puttstamps_ijod_=: (((1;''upgrade JOD'')"_)`putallts__MK__JODobj)@.(3 = (4!:0)<''putallts__MK__JODobj'')',e
d=.c,SOPASS,'puttstamps ".".''zz_'',SOLOCALE,''_'' [ cocurrent ''base'' ',e
f=.b,(WRAPTMPWID,(getascii85 0);<1)wraplinear 5!:5<'a'
f=.f,LF,d,SOCLEAR,2#LF
if._1-:(toHOST f)fap<y do.(jderr ERR0155),<y else.OK end.
else.
OK
end.
)
dumptext=:4 :0
'b d e'=.x
e=.<e
a=.(-b)<\y
f=.LF,SOSWITCH,LF
c=.SOPASS,(":d),SOPUTTEXT,LF,SOCLEAR,LF
for_blk.a do.
if.badrc g=.d get>blk do.g return.else.g=.rv g end.
if.#g=.WRAPTMPWID fmtdumptext g do.
g=.toHOST f,g,LF,c
if._1-:g fap e do.(jderr ERR0155),e return.end.
end.
end.
OK
)
dumptm=:4 :0
'a b'=.x
if.badrc c=.b dnl''do.c return.end.
if.a:e.c do.OK return.end.
if.#c=.}.c do.
if.badrc d=.(a;b;y)dumptext c do.d return.end.
if.badrc d=.(a;b;y)dumpdoc c do.d return.end.
end.
OK
)
dumptrailer=:3 :0
a=.DUMPTAG,LF
b=.LF,'cocurrent ''base''',a
b=.b,'0 0$(4!:55);:''sonl_z_ SOLOCALE_z_ soput_z_ soclear_z_''',a
b=.b,SOPASS,DUMPMSG2,a
if._1-:(toHOST b)fap<y do.(jderr ERR0155),<y else.OK end.
)
dumpwords=:4 :0
if.badrc d=.did 0 do.d return.
else.
if.2=#d do.
if.badrc d=.(WORD,1,WORD)dnl''do.d return.else.d=.}.d end.
else.
if.badrc d=.0 _1 0 dnl''do.d return.end.
if.badrc e=.0 _1 dnl''do.e return.end.
e=.}.e
d=.}.d
e=.e-.&.>d
d=./:~~.;d-.&.>~.@:;&.><"1,\e
end.
end.
g=.LF,LF,SOPASS,SOPUT,LF,SOCLEAR
h=.LF,SOSWITCH,LF
c=.WORD,0
f=.<y
i=.2
l=.WORD,INCLASS
if.(0<#d )*.-.a:e.d do.
if.badrc l=.(WORD,INCLASS)invfetch__ST d do.l return.
else.l=.(-x)<\rv l
end.
b=.(-x)<\d
for_blk.b do.
if.badrc j=.c getobjects__ST>blk do.j return.else.j=.rv j end.
if.1 e.a=.-.(>blk_index{l)=;1 {"1 j do.
(jderr ERR0157),a#0{"1 j return.
end.
if.badrc j=.0 nounlrep j do.j return.else.j=.rv j end.
j=.i jscript jscriptdefs j
j=.toHOST h,j,g
if._1-:j fap f do.(jderr ERR0155),f return.end.
end.
end.
if.badrc b=.dnl''do.b return.else.k=.(b=.}.b -.a:)-.d end.
d=.0
if.#k do.
if.badrc l=.(WORD,INCLASS)invfetch__ST k do.l return.
else.l=.(-x)<\rv l
end.
k=.(-x)<\k
for_blk.k do.
if.badrc j=.c getobjects__ST>blk do.j return.else.j=.rv j end.
if.1 e.a=.-.(>blk_index{l)=;1 {"1 j do.
(jderr ERR0157),a#0{"1 j return.
end.
j=.i jscript jscriptdefs j
j=.toHOST h,j,g
if._1-:j fap f do.(jderr ERR0155),f return.end.
end.
end.
if.-.a:e.b do.(x;WORD;f)dumpdoc b else.OK end.
)
extscopes=:3 :0
c=.(}.@:}:)&.>u#~''''={.&>u=.y#~1|.y=<'=.'
b=.(}.@:}:)&.>u#~''''={.&>u=.y#~1|.y=<'=:'
if.#c do.c=.jnfrblcl<;._1;' ',&.>c -.&.>'`'end.
if.#b do.b=.jnfrblcl<;._1;' ',&.>b -.&.>'`'end.
a=.''
if.+./u=.((4&{.&.>y )e.<'for_')*.'.'={:&>y do.
u=.(4&}.@:}:)&.>u#y
u=.u,u,&.><'_index'
a=.,y #~y e.u
end.
(<b),(<c,a),<a
)
fap=:1!:3 ::(_1:)
fmtdumptext=:4 :0
if.#b=.y #~0<#&>{:"1 y do.
a=.getascii85 0
if.a do.b=.clfrbtcl":&.>b else.b=.5!:5<'b'end.
(x,<a)wraplinear b
else.
''
end.
)
fromascii85=:3 :0
r=.,y
r=.a.i.r
r=.(r>32)#r
r=.(2*(a.i.'<~')-:2{.r)}.r
r=.(-2*(a.i.'~>')-:_2{.r)}.r
m=.r=a.i.'z'
r=.r-33
r=.0(I.m)}r
r=.(1+4*m)#r
b=.5|#r
r=.r,84#~b{0 4 3 2 1
r=.a.{~,(4#256)#:85#._5[\r
r}.~-b{0 0 3 2 1
)
getallts=:3 :0
a=.((#OBJECTNC)#<0)(2)}(3,#OBJECTNC)$a:
c=.-INPUT
for_obj.OBJECTNC do.
if.badrc d=.(obj ,c)get}.obj dnl''do.continue.end.
d=.rv d
a=.(<;0{d)(<0;obj_index)}a
a=.(<;1{d)(<1;obj_index)}a
b=.rlefrnl,e=.;1{d
if.(,e)-:nlfrrle b do.
if.(*/$b)<:*/$e do.
a=.(<b)(<1;obj_index)}a
a=.(<1)(<2;obj_index)}a
end.
end.
end.
ok<a
)
getascii85=:3 :0
a=.0
if.0=nc<'ASCII85'do.a=.1-:ASCII85
elseif.
do=.{:{.DPATH__ST
0=nc<'ASCII85__do'do.a=.1-:ASCII85__do
end.
a
)
halfbits=:]*.1 0"_$~#
htclip=:[(]}.~[:>:]i.[)]}.~[:-[:>:[i.~[:|.]
jnb=:3 :0
y jnb~masknb y 
:
(x*>:i.$x){' ',,y
)
jscript=:[:;(([:<"0[)#&.>(10{a.)"_),&.>]
jscriptdefs=:(([:{."1]),&.>(<'=:')"_),&.>[:{:"1]
makedump=:3 :0
if.badrc d=.checkopen__ST 0 do.d return.end.
DL=.{:{.DPATH__ST
a=.DUMPFACTOR__DL
if.isempty y do.b=.DMP__DL,DNAME__DL,IJS
elseif.badcl y do.jderr ERR0158 return.
elseif.do.b=.y
end.
if.0 =nc<'RETAINAGE__DL'do.c=.1-:RETAINAGE__DL else.c=.0 end.
b=.jpathsep b
if.badrc d=.dumpheader b do.d
elseif.badrc d=.a dumpwords b do.d
elseif.badrc d=.(a,TEST)dumptm b do.d
elseif.badrc d=.(a,MACRO)dumptm b do.d
elseif.badrc d=.(a,GROUP)dumpgs b do.d
elseif.badrc d=.(a,SUITE)dumpgs b do.d
elseif.badrc d=.dumpdictdoc b do.d
elseif.badrc d=.c dumpntstamps b do.d
elseif.badrc d=.dumptrailer b do.d
elseif.do.
(ok OK0151),<b
end.
)
makegs=:4 :0
'd g'=.x
a=.{:{.DPATH__ST
g=.|g[e=.0<g
if.(isempty+.badcl)y do.jderr ERR0154 return.end.
if.badrc c=.d getgstext__ST y do.c return.end.
if.(1=g)*.e do.
if.badrc f=.(d;<a)inputdict__ST<y=.y-.' 'do.f return.end.
end.
if.badrc f=.d gslistnl__ST y do.f return.end.
if.isempty>1{f do.f=.''
else.
if.DODEPENDENTS do.
if.badrc b=.d gdeps y do.b return.else.b=.}.b end.
else.
b=.''
end.
if.#f=.(}.f)-.b do.
if.badrc f=.((d-2),0)getobjects__ST f do.f return.end.
if.badrc f=.((d-2),0)wttext rv f do.f return.end.
f=.rv f
else.f=.''
end.
end.
if.#c=.alltrim@:lfcrtrim(1;0 1){::c do.f=.c ,LF,HEADEND,LF,LF,f end.
if.1=g do.(d;y)writeijs f else.ok f end.
)
masknb=:3 :0
'NB.'masknb y
:
c=.($y)$x E.,y
+./\"1 c>~:/\"1 y e.''''
)
namecats=:4 :0
if.badrc h=.parsecode y do.
h
else.
'a b h'=.}.h
'f g c'=.extscopes h
f=.f-.b[g=.g-.a
d=.a,f[e=.b,g
h=.h-.;:')'
i=.h#~1|.h=<'=.'
j=.h#~1|.h=<'=:'
j=.i-.i-.j
if.0<#j do.
if.-.MIXEDOVER+./@E.,y do.(jderr ERR0159),j return.end.
end.
j=.h-.i
d=.d,(jnfrblcl j)-.e,JARGS
if.x do.
e=.e,jnfrblcl i
j=.(<d),(<e),(<a),(<b),<c
ok<GLOBCATS,.(/:~)@:~.&.>j
else.
ok/:~~.d
end.
end.
)
nlfrrle=:#~/@:|:
nounlrep=:4 :0
if.#y do.
clearso 0
b=.(a=.{."1 y),&.>locsfx SO
try.
(b)=:(3!:2)&.>{:"1 y
b=.(5!:5@<)&.>b
catch.(jderr ERR016),a return.end.
if.x do.b=.b,&.>LF end.
y=.b(<a:;2)}y
clearso 0
end.
ok<y
)
opaqnames=:4 :0
b=.+./"1 x
x=.b#x[y=.b#y
y=.x jnb y
if.+./'(*)='E.,y do.
y=.($y)$' '(I.(,y)='''')},y
c=.(,y)#~,'(*)=.'masknb y
c=.~.<;._1' ',c#~-.'  'E.c
c=.<jnfrblcl c
a=.(,y)#~,'(*)=:'masknb y
a=.~.<;._1' ',a#~-.'  'E.a
a=.<jnfrblcl a
c,a
else.
'';''
end.
)
parsecode=:3 :0
if.0 e.$e=.tabit y do.ok''return.
elseif.1=#e do.e=.uqtsingle e 
end.
e=.e,"1' '
c=.masknb e
b=.a=.''
if.1 e.'(*)='E.,e do.
'b a'=.c opaqnames e
d=.b-.b-.a
if.0<#d do.(jderr ERR0150),d return.end.
end.
c=.0[e=.e jnb~-.c
e=.e#~e+./ .~:' '
e=.(;: ::0:)&.><"1 e
if.e e.~<0 do.
jderr ERR0151
else.
e=.ok(<a),(<b),<;e
end.
)
putallts=:3 :0
if.badrc d=.checkopen__ST 0 do.d return.end.
if.-.(3,#OBJECTNC)-:$y do.jderr ERR0160 return.end.
do=.{:{.DPATH__ST
g=.DIRNMS__do[a=.DNAME__do
c=.-INPUT[b=.;2{y[e=.0=#&>0{y[d=.i.0 4
for_obj.OBJECTNC do.
if.obj_index{e do.continue.end.
f=.(<0 1;,obj_index){y
h=.2,#&>0{f
if.obj_index{b do.f=.(<h$nlfrrle;1{f )(1)}f end.
d=.d,(2{.(obj,c)put f),(obj_index{g),<a
end.
d
)
rlefrnl=:(1,~2&(~:/\))({.,#);.2]
sexpin=:3 :0
if.EXPPFX0 e.~5{.a=.alltrim 20{.,y do.1
elseif.EXPPFX1 e.~8{.a do.1
elseif.do.0
end.
)
sonl=:3 :0
nl__SO y
)
tabit=:]`,:@.(1&>:@(#@$))^:2
toascii85=:3 :0
r=.,y
a=.#r
assert.4<:a
r=.256#._4[\a.i.r
m=.0(_1)}r=0
n=.5*I.m
r=.a.{~33+,(5#85)#:r
r=.'z'n}r
m=.1 n}5#-.m
r=.m#r
r=.(-(4|a){0 3 2 1)}.r
r=.}:,(_75[\r),.LF
('~>',LF),~(r i:' '){.r 
)
uqtsingle=:3 :0
if.sexpin y do.
a=.''''htclip alltrim,y
a=.tabit a#~-.halfbits''''=a
]`(''''&,"1)@.(':'''&-:@(2&{.@,))a
else.
y
end.
)
wraplinear=:4 :0
'h i a f'=.4{.x,0;<0
if.a do.
c=.(;f{'dec85';'fromascii85'),'__MK__JODobj 0 :'
h,'=:',c,' 0',LF,')',~toascii85 y
else.
d=.h,'=:'''''
g=.h,'=:',(":#y),'{.',h
e=.h,'=:',h,','
b=.ctl e,"1 quote"1 (-i)]\y
d,LF,b,LF,g
end.
)
wrdglobals=:4 :0
a=.jcr ::0:y
if.a -:0 do.(jderr ERR0152),<y else.x namecats a end.
)
writeijs=:4 :0
'b a'=.x
DL=.{:{.DPATH__ST
c=.jpathsep dfp__DL b
m=.(toHOST y)(write ::_1:)c=.c,a,IJS
if.m-:_1 do.(jderr ERR0153),<c else.(ok OK0150),<c end.
)
wttext=:4 :0
'g e c'=.3{.x,0
if.WORD=g do.
y=.(/:;1 {"1 y){y
f=.((;1 {"1 y)>0)i.1 
if.badrc b=.e nounlrep f{.y do.b return.end.
y=.(rv b),f}.y
end.
if.c do.d=.0{"1 y end.
if.e do.
m=.(#y)#0
elseif.+./m=.-.LF e.&>{:"1 y do.
b=.m#{."1 y
if.badrc a=.g getexplain__ST b do.a return.end.
b=.0<#&>a=.{:"1 rv a
a=.(<"0 b)#&.>(<'NB. '),&.>a,&.>LF
y=.(a,&.>m#{."1 y)(<(I.m);0)}y
m=.(>:2*-.m)+m(#^:_1)b
m=.m+2*firstone 1=m
elseif.do.
m=.(#y)#3
end.
if.WORD=g do.y=.jscriptdefs y else.y=.{:"1 y end.
if.c do.ok<d,.y else.ok({.m )}.m jscript y end.
)
coclass'ajodutil'
coinsert'ajod'
ASSUMESMARK=:'assumes:'
AUTHORMARK=:'author:'
CREATEDMARK=:'created:'
DYADMARK=:'dyad:'
MONADMARK=:'monad:'
VERBATIMMARK=:'verbatim:'
ROOTWORDSMARK=:'rootwords:'
DOCUMENTMARKS=:ASSUMESMARK;AUTHORMARK;CREATEDMARK;DYADMARK;MONADMARK;VERBATIMMARK;ROOTWORDSMARK
qt=:]`dblquote@.IFWIN
CWSONLY=:'(-.)=:'
EDCONSOLE=:'"c:\Program Files (x86)\notepad++\notepad++.exe"'
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
IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'
NAMEALPHA=:'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_'
OBFUSCATE=:'(/:)=:'
OBFUSCCNT=:100000
OBFUSCPFX=:'o_'
OK0250=:' documented in ->'
OK0251=:'edit locale cleared'
OK0252=:'edit locale ->'
OK0255=:'starting PDF reader'
OK0256=:'jod.pdf not installed - use JAL to install the addon general/joddocument'
PDF=:'PDF'
PDFREADER=:'C:\Program Files\Adobe\Reader 8.0\Reader\acrord32.exe'
PDFREADERMAC=:'open'
SCRIPTDOCCHAR=:'*'
blkaft=:3 :0
r=.0#~#y
t=.y
while.do.
u=.;:;\t
v=.~.&.>(<"1 |:u)-.L:1 a:
r=.r+.y e.;{.&.>(1<#&>v)#v
if.y-:{:u do.
break.
else.
t=.((r#t),&.>' ')(I.r)}t
end.
end.
;((r#y),&.>' ')(I.r)}y
)
changetok=:4 :0
if.#f=.2{."(1)_2[\<;._1 x do.
f=.f#~_2~:(4!:0){."1 f
end.
a=._1[e=.#f
while.e>a=.>:a do.
't c'=.a{f
if.+./b=.t E.y do.
w=.I.b
'l o'=.#&>a{f
q=.(w{' ',y)e.NAMEALPHA
r=.((w+l){y,' ')e.NAMEALPHA
w=.w#~-.q+.r
if.0=#w do.continue.end.
b=.1 w}0#~#b
p=.w+0,+/\(<:#w)$d=.o-l
s=.*d
if.s=_1 do.
b=.1#~#b
b=.((l*#w)$1 0#~o,l-o)(,w+/i.l)}b
y=.b#y
if.o=0 do.continue.end.
elseif.s=1 do.
y=.y#~>:d w}b
end.
y=.(c$~o*#w)(,p+/i.o)}y
end.
end.y
)
compclut=:3 :0
t=.0 decomm y
LF,~ctl t#~(-.b)+.firstone b=.*./"1' '=t
)
compj=:3 :0
0 compj y
:
if.badil x do.jderr ERR001 return.end.
if.badrc c=.(WORD,NVTABLE)get y do.c return.else.c=.rv c end.
b=.0<;1 {"1 c
a=.compressj`compclut@.(1-:x)
c=.(a@:ctit&.>(b#{:"1 c)-.&.>TAB)(<(I.b);2)}c
(WORD,1)wttext__MK c
)
compressj=:3 :0
w=.1 e.CWSONLY E.,y
u=.dewhitejcr y
if.w do.u return.end.
if.badrc m=.1 namecats__MK y do.u return.end.
d=.~.;(<2 3 4;1){m=.rv m
if.o=.1 e.OBFUSCATE E.,y do.
l=.;(<1;1){m
l=.l-.JARGS__MK
else.
l=.;(<1;1){m
s=.l#~1=#&>l
l=.l-.s
end.
l=.l-.exobrefs l,;(<0;1){m
if.0=#m=.l-.d do.u return.end.
if.0=#m=.m #~-.islocref&>m do.u return.end.
if.o do.
a=.(<:#NAMEALPHA)&#.@((}:NAMEALPHA)&i.)^:_1
r=.' '-.~,'/',"1 (>m),"1 '/',"1 OBFUSCPFX,"1 a(#m)?OBFUSCCNT
else.
if.0=#r=.SHORTNAMES-.,&.>s do.u return.end.
if.(#r)<#m do.
a=.(#r)&#.@((;r)&i.)^:_1
r=.r,<"1(#r)}.a i.#m
end.
r=.;'/',&.>m,.(#m){.r
end.
r changetok u
)
createut=:3 :0
'JOD ST MK UT SO'=:y
SHORTNAMES=:,&.><"0[52{.NAMEALPHA
SHORTNAMES=:SHORTNAMES-.;:'m n x y u v'
IZJODALL__JOD=:IZJODALL__JOD,IzJODutinterface
".&.>UT defzface IzJODutinterface
)
ctit=:[:];._2],(10{a.)"_
de=:list@:}.
dewhitejcr=:3 :0
a=.;:&.><"1(ljust@:decomm)y
;(blkaft&.>a),&.>LF
)
dewhitejscript=:3 :0
y=.' '(I.y=TAB)}y
y=.;:&.><"1 decomm];._1 LF,y-.CR
;(blkaft&.>y),&.><CRLF
)
disp=:3 :0
0 disp y
:
if.badrc a=.x obtext y do.a else.>{:a end.
)
doc=:3 :0
docword y
:
x doctext y
)
docct2=:4 :0
'j g b e'=.x
f=.#e
if.f do.
if.-.+./a=.+./"1(,:e)E.y do.y return.end.
i=.((firstone a)+.firstone -.a)<;.1 y
else.
i=.<y
end.
if.b>:#i do.y return.else.c=.>b{i end.
if.+./(g,f)>:$c do.y return.end.
if.SCRIPTDOCCHAR=(<g;f){c do.
c=.' '(<g;f)}c
if.f do.c=.(#e)}."1 ljust c end.
'd h'=.(j;DOCUMENTMARKS)docfmt2 c
d=.SCRIPTDOCCHAR(<g;f)}(e,' '),"1 d
h=.e,"1 h
;(<d,h)(b)}i
else.
y
end.
)
docfmt2=:4 :0
e=.>{.x
c=.}.x
b=.+./"1+./(,:&.>c)E.&><y
b=.1(0)}firstone+./\b
'a d'=.2{.(b<;.1 y),<i.0 0
a=.ljust a
a=.e textform2&.>(1 (0)}*./"1 ' '=a)<;.1 a
a=.(0<#&>a)#a
a=.(-0=#d)}.;a,&.>' '
a;d
)
doctext=:4 :0
if.badcl y do.jderr ERR001
elseif.badrc a=.checkput__ST y do.a
elseif.badrc a=.checknames__ST y do.a
elseif.((1 =#x )*.({.x )e.TEST,MACRO)+.x e.(GROUP,SUITE),.1 do.
if.badrc a=.x obtext y do.a return.else.a=.>{:a end.
DL=.{:{.DPATH__ST
a=.ctl(DOCUMENTWIDTH__DL;0;0;'NB.')docct2];._1 LF,a-.CR
if.x-:MACRO do.
if.badrc b=.(MACRO,INCLASS)get y do.b return.end.
if.JSCRIPT=>{:b do.x put y;JSCRIPT;a else.jderr ERR0261 end.
else.
x put y;a
end.
elseif.-.(<x)e.{OBJECTNC;DOCUMENT do.jderr ERR001
elseif.y=.}.a
DL=.{:{.DPATH__ST
badrc a=.((x=.{.x);<DL)inputdict__ST y do.a
elseif.badrc a=.x getdocument__ST y do.a
elseif.do.
a=.(1;0 1){::a
a=.];._2(a-.CR),LF
a=.ctl;(DOCUMENTWIDTH__DL;DOCUMENTMARKS)docfmt2 a
(x,DOCUMENT)put y,<a
end.
)
docword=:3 :0
if.badcl y do.jderr ERR001
elseif.badrc c=.checkput__ST y do.c
elseif.badrc c=.checknames__ST y do.c
elseif.y=.}.c
DL=.{:{.DPATH__ST
badrc c=.(WORD;<DL)inputdict__ST y do.c
elseif.badrc c=.(WORD,0)getobjects__ST y do.c
elseif.0=(1;0 1){::c do.
jderr'<',(' '-.~,>y),'>',ERR0250
elseif.a=.(1;0 2){::c
a=.(-LF={:a)}.a,LF
a=.ctl(DOCUMENTWIDTH__DL;0;1;'NB.')docct2];._2 a
c=.,1{::c
c=.(<a)2}c
badrc b=.(WORD,NVTABLE)put c do.b
elseif.do.
(ok'<',(>{.c),'>',OK0250),{:b
end.
)
ed=:3 :0
0 ed y
:
if.2=#$y do.
if.badrc e=.checknttab3 y do.e return.
elseif.3={:$e=.rv e do.
if.3>:<./a=.;1 {"1 e do.
a=.I.0=a
if.badrc b=.0 nounlrep__MK a{e do.b return.end.
e=.(rv b)a}e
d=._2}.;(0{"1 e),.(<'=:'),.(2{"1 e),.<2#LF
else.
d=._2}.;({:"1 e),&.><2#LF
end.
elseif.do.
d=._2}.;({:"1 e),&.><2#LF
end.
c=.;0{0{e[x=.1<#e
elseif.badrc e=.x obtext y do.e return.
elseif.do.
'c d'=.}.e
end.
if.(x-:0)*.wex<'DOCUMENTCOMMAND_ijod_'do.
d=.d,LF,LF,('/{~N~}/',c)changestr DOCUMENTCOMMAND_ijod_
end.
c et d
)
et=:3 :0
EDTEMP et y
:
try.
(toHOST y)write a=.jpath'~temp/',x,IJS
if.*/wex;:'IFJ6 IFWIN'do.
if.IFJ6*IFWIN do.smopen_jijs_ a return.end.
end.
if.IFQT do.open a
elseif.IFJHS*.wex<'wwd_qjide_'do.0 0$(1!:2&2)'$$$edit$$$',a
elseif.IFJHS do.open_jhs_ a
elseif.IFWIN*.IFJHS+:IFQT do.fork_jtask_ EDCONSOLE,' ',a
elseif.IFIOS do.je_z_ a
elseif.wex<'IFGTK'do.
if.IFGTK do.open_jgtk_ a else.jderr ERR0255 end.
elseif.do.jderr ERR0262
end.
catch.jderr ERR0255
end.
)
exobrefs=:a:"_ -.~[:~.[:;[:<;._1&.>([:+./\&.>(<'__')"_ E.&.>])#&.>]
gt=:3 :0
if.isempty y do.y=.'99'end.
try.read jpath'~temp\',y,IJS
catch.jderr ERR0254
end.
)
jodfork=:[:fork_jtask_[:;1 0 2{' ';qt
jodhelp=:3 :0
a=.jpath'~addons\general\joddocument\pdfdoc\jod.pdf'
if.fex<a do.
b=.pdfreader 0
if.UNAME-:'Darwin'do.
ok OK0255[shell b,' ',qt a
elseif.fex<b do.
ok OK0255[jodfork b;a
elseif.do.
(jderr ERR0260),<b
end.
else.
ok OK0256
end.
)
ljust=:' '&$: :(]|."_1~i."1&0@(]e.[))
obtext=:4 :0
if.badrc b=.checkopen__ST y do.b return.end.
select.x
case.WORD do.
if.badrc y=.checknames__ST y do.y return.else.y=.}.y end.
if.badrc b=.(WORD,NVTABLE)get y do.b return.end.
if.badrc b=.WORD wttext__MK rv b do.b return.else.b=.rv b end.
a=.>{.y
case.DICTIONARY do.
if.badrc b=.DICTIONARY get''do.b return.else.b=.rv b end.
a=.(' '-.~;0{0{DPATH__ST__JODobj),'_DTXT'
case.SUITE;GROUP do.
if.badrc b=.(x,2)make y do.b return.else.b=.rv b end.
a=.y-.' '
case.TEST;MACRO do.
if.badrc y=.checknames__ST y do.y return.else.y=.}.y end.
if.badrc b=.x get y do.b return.end.
if.badrc b=.x wttext__MK rv b do.b return.else.b=.rv b end.
a=.>{.y
case.do.
if.(<x)e.{(SUITE,GROUP);HEADER do.
if.badcl y do.jderr ERR0154__MK return.end.
if.badrc c=.({.x)get y do.c return.else.'a b'=.,rv c end.
elseif.(<x)e.,{OBJECTNC;DOCUMENT,EXPLAIN do.
if.badrc c=.x get y do.c return.
else.
a=.>{.{.c=.rv c
b=.;({:"1 c),&.><2#LF
end.
elseif.do.
jderr ERR001 return.
end.
end.
ok a;b
)
pdfreader=:3 :0
if.wex<'PDFREADER__UT__JODobj'do.a=.PDFREADER__UT__JODobj else.a=.''end.
if.UNAME-:'Darwin'do.a=.PDFREADERMAC
elseif.wex<'PDFReader_j_'do.if.0<#PDFReader_j_ do.a=.PDFReader_j_ end.
elseif.wex<'PDFREADER_j_'do.if.0<#PDFREADER_j_ do.a=.PDFREADER_j_ end.
end.
a
)
reb=:3 :0
' 'reb y
:
y=.x,y
b=.x=y
}.(b*:1|.b)#y
)
revo=:3 :0
WORD revo y
:
if.badil x do.jderr ERR001
elseif.badrc c=.((x=.{.x),_1)dnl y do.c
elseif.isempty b=.rv c do.ok b
elseif.do.
a=.rv(x,INPUT)get b
ok(\:a){b
end.
)
rm=:3 :0
0 rm y
:
if.badrc o_ddF=.MACRO get y do.o_ddF return.end.
o_ddF=.rv o_ddF
if.*./o_dYM=.JSCRIPT=;1 {"1 o_ddF do.
o_g5k=.;({:"1 o_ddF),&.>LF
o_jKe=.18!:5''
try.
18!:4<'base'
if.x-:1 do.0!:100 o_g5k else.0!:101 o_g5k end.
18!:4 o_jKe
catchd.
18!:4 o_jKe
(jderr ERR0256),<13!:12''return.
end.
else.
(jderr ERR0252),(-.o_dYM)#{."1 o_ddF
end.
)
rtt=:3 :0
0 rtt y
:
if.(3-:x )+.4-:x do.
if.badrc o_gtr=.(SUITE,_2)make y do.o_gtr return.end.
o_wgv=.rv o_gtr
x=.x-3
else.
if.badrc o_gtr=.TEST get y do.o_gtr return.end.
o_gtr=.rv o_gtr
o_wgv=.;({:"1 o_gtr),&.>LF
end.
o_wkR=.18!:5''
18!:4<'base'
try.
if.0-:x do.0!:2 o_wgv
elseif.1-:x do.(][1!:2&2)0!:3 o_wgv
elseif.2-:x do.0!:001 o_wgv
elseif.do.
18!:4 o_wkR
jderr ERR001 return.
end.
catchd.
18!:4 o_wkR
(jderr ERR0256),<13!:12''return.
end.
18!:4 o_wkR
)
textform2=:63&$: :(4 :0)
i=.0
v=.reb,y,"1' '
j=.#v
b=.j$0
while.j>a=.i+x do.
k=.i+i.>:a-i
if.#c=.(' '=k {v)#k do.
i=.>:{:c
g=.({:k)-<:i
c=.(1>.<:#c){.c
f=.#c
d=.f$<.g%f
d=.(>:{.d)(i.f|g)}d
b=.d((f?f){c)}b
else.
b=.1 a}b
i=.a
end.
end.
v=.(>:b)#v
e=.>:x
r=.>.(#v)%e
(r,x){.(r,e)$(e*r){.v
)
cocurrent'base'
coinsert'ijod'
jodon 0
cocurrent'base'
0!:0<jodsystempath'jodexts/jodtools.ijs'
(9!:41)1
