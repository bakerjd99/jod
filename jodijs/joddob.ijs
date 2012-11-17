NB. joddob.ijs -- directory object class: extension of (jodstore)
NB.
NB. Directory objects are created when dictionaries are opened
NB. and destroyed when they are closed.  Directory objects contain
NB. a set of nouns and verbs that manage *.ijf file directories.
NB.
NB. Interface nouns & verbs:
NB.   (many nouns are indirectly __ referenced)
NB.   dfclose     close dictionary file
NB.   dfopen      open dictionary file
NB.   dfp         directory file paths
NB.   dncn        name of main directory component noun
NB.   dnix        name of main directory index noun
NB.   dnnc        name of class noun
NB.   dnnm        visible object names
NB.   dropdir     erase directory nouns
NB.   dropnc      erase class/type nouns
NB.   dropref     erase reference nouns
NB.   loaddir     load directory
NB.   loadnc      load word and macro class/types
NB.   loadref     load references
NB.   loadstamps  load time stamps
NB.   packdict    packs dictionary and saves old files as a backup
NB.   packspace   tests for sufficient backup space
NB.   restdict    restores most recent backup created by (packdict)
NB.   restspace   tests for sufficient restore space
NB.   savedir     save directory
NB.   saveref     save references
NB.
NB. Notes:
NB.   Error messages (JODdob range 200-249)

coclass 'ajoddob'
coinsert 'ajodstore'

NB.*dependents x-- JODdob dependent definitions

NB. directory noun name prefixes
DIRNMS=:<;._1 ' WORD TEST GROUP SUITE MACRO'

NB. directory noun suffixes - order matters
DTSIXCN=:<;._1 ' TS IX CN'

NB. timestamp, index list and component noun names
(;:'DIRTS DIRIX DIRCN')=: <"1 |: DIRNMS ,&.>/ DTSIXCN

NB. name class and macro type noun names
DIRNC=:<;._1 ' WORDNC MACRONC'

NB. reference objects
DIRRFN=:<;._1 ' WORDREF TESTREF'

NB. reference timestamp, index list and component noun names
(;:'REFTS REFIX REFCN')=: <"1 |: DIRRFN ,&.>/ DTSIXCN

NB.*enddependents
NB.*end-header

NB. backup directory noun prefix
BAKPFX=:'B'

NB. database file noun names - order matters - see long documenation
DFILES=:<;._1 ' WF TF GF SF MF UF'

NB. database file noun name pointers - order matters
DFPTRS=:<;._1 ' WP TP GP SP MP UP'

NB. main component list noun names
DIRCN=:<;._1 ' WORDCN TESTCN GROUPCN SUITECN MACROCN'

NB. main index list noun names
DIRIX=:<;._1 ' WORDIX TESTIX GROUPIX SUITEIX MACROIX'

NB. main timestamp noun names
DIRTS=:<;._1 ' WORDTS TESTTS GROUPTS SUITETS MACROTS'

NB. visible object names
DIRVNS=:<;._1 ' word test group suite macro'

NB. dictionary subdirectory noun names - order matters
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

NB. object report header names
HEADNMS=:<;._1 ' Words Tests Groups* Suites* Macros'


OK200=:'dictionary packed ->'
OK201=:'dictionary restored ->'

NB. reference component list noun names
REFCN=:<;._1 ' WORDREFCN TESTREFCN'

NB. reference main index list noun names
REFIX=:<;._1 ' WORDREFIX TESTREFIX'

NB. reference timestamp noun names
REFTS=:<;._1 ' WORDREFTS TESTREFTS'

NB. temporary file prefix
TEMPFX=:'tmp'


backnum=:3 : 0

NB.*backnum v-- increments backup and pack counts.
NB.
NB. monad:  backnum ia

NB. HARDCODE pack counter is in component 1
nums=.> jread WF;1  NB. object noun !(*)=. WF
if. #nums do. nums=. (>:y{nums) y}nums else. nums=. 0 0 end.
nums jreplace WF;1
y{nums
)


copydirinv=:3 : 0

NB.*copydirinv v-- copies directory and inverted data region
NB.
NB. monad:  copydirinv (clTemp ; clDictionary)

'tfile datfile'=. y

NB. errmsg: unable to create temporary file
if. 1~:jcreate tfile do. jderr ERR203 return. end.

NB. copy directory and inverted data region
NB. errmsg: jfile read failure
if. badjr dat=. jread datfile;i. OFFSET do. jderr ERR088 return. end.
NB. errmsg: jfile append failure
if. badappend apcn=. dat jappend tfile do. jderr ERR058 else. OK end.
)

NB. Win32 procedure that copies files
copyfile=:'kernel32 CopyFileA i *c *c i'&cd


copyfiles=:4 : 0

NB.*copyfiles v-- copies OS files.
NB.
NB.
NB. dyad:  blclSource copyfiles blclTarget

if. IFWIN do.
  rc=.copyfile"1 x ,. y ,. <0
  NB. errmsg: unable to copy files
  if. *./0 <; {."1 rc do. OK else. (jderr ERR208),(15!:11)'' end.
else.
  NB. copy current dictionary files 
  NB. NOTE: assumes path file names that do not wreak linux (cp) command
  if. isempty rc=. host"1  > (<'cp ') ,&.> x ,&.> ' ' ,&.> y do. OK
  else.
    NB. result not empty probably some OS error
    NB. errmsg:  unable to copy/move/rename files - shell messages ->
    (jderr ERR210),<,rc
  end.
end.
)


createdl=:3 : 0

NB.*createdl v-- directory object creation verb.
NB.
NB. monad:  create bluu

NB. object nouns !(*)=. BAKNUM DIDNUM DNAME RPATH RW UF SYS WF LIBSTATUS NPPFX

NB. no backup directories exist at creation
BAKNUM=: _1

'nppfx username dpath readstatus dparms'=. y
DNAME=: ,>username  NB. user name for this dictionary
DIDNUM=: >1{dparms  NB. unique dictionary id number
NPPFX=: nppfx       NB. master/dictionary file path prefix mismatch

NB. set master parameters first and then values specific
NB. to this dictionary - insures all master parms are defined
NB. (MASTERPARMS) is added to the "jod" class by (createjod)
({."1 MASTERPARMS)=: {:"1 MASTERPARMS   NB. !(*)=. MASTERPARMS
({.>{:dparms)=: {:>{:dparms

NB. is this a library?
LIBSTATUS=: islib dparms
RW=: (-.LIBSTATUS) * 1=readstatus  NB. open read status

NB. script, suite, macro, document, dump, backup directories
(DSUBDIRS)=: PARMDIRS{dparms

NB. full dictionary file names (without extensions) and pointers
NB. NOTE: the (dpath) does not have to match the paths of (DSUBDIRS)
(DFILES)=: uv=. dpath ,&.> JDFILES
(DFPTRS)=: uv

NB. dictionary directory - NIMP: provide some mechanism for
NB. decoupling the word directory from the main dictionary
SYS=: ((justdrv WF) ,':', justpath WF),PATHDEL

NB. tweak for UNC and rooted linux paths
SYS=: (':'={.SYS)}.SYS

NB. set dictionary's reference path
if. badjr rp=. jread UF;CNRPATH do. 0 else. 1 [ RPATH=: > rp end.
)


dfclose=:3 : 0

NB.*dfclose v-- close dictionary file.
NB.
NB. monad:  dfclose clFilePfx
NB. 
NB.   dfclose__DL 'U'  NB. object noun file pointer prefix

fp=. y,'P'
(fp)=: ".y,'F' [ jclose_jfiles_ ".fp
)

NB. open dictionary file
dfopen=:3 : '(y,''P'')=: jopen_jfiles_ ".y,''F'''


dfp=:3 : 0

NB.*dfp v-- directory file path returns the  directory  path  for
NB. various objects.
NB.
NB. monad:  dfp iaObject

NB. object nouns !(*)=. SCR SUI DOC DMP BAK

select. y
  case. WORD;GROUP do. SCR
  case. TEST;SUITE do. SUI
  case. DOCUMENT   do. DOC
  case. DEFAULT    do. DMP
  case.do. BAK
end.
)


dncn=:3 : 0

NB.*dncn v-- returns  directory  component noun names from object
NB. codes.
NB.
NB. monad:  dncn ilObject

(OBJECTNC i. y){DIRCN
)


dnix=:3 : 0

NB.*dnix  v--  returns directory index  noun  names  from  object
NB. codes.
NB.
NB. monad:  dnix ilObject

(OBJECTNC i. y){DIRIX
)


dnnc=:3 : 0

NB.*dnnc v-- returns directory name  class noun names from object
NB. codes.
NB.
NB. monad:  dnnc ilObject

((WORD,MACRO) i. y){DIRNC
)


dnnm=:3 : 0

NB.*dnnm v-- returns visible dictionary object names.
NB.
NB. monad:  dnnm ilObject

(OBJECTNC i. y){DIRVNS
)


dnrn=:3 : 0

NB.*dnrn v-- returns  directory  reference noun names from object
NB. codes.
NB.
NB. monad:  dnrn iaObject
NB. dyad:  uuIgnore dnrn iaObject

((WORD,TEST) i. y){REFIX  NB. name list name
:
((WORD,TEST) i. y){REFCN  NB. component list name
)


dropall=:3 : 0

NB.*dropall v-- erases all directory,  inverted  data,  reference
NB. nouns
NB.
NB. monad:  dropall uuIgnore

erase DIRNC,DIRIX,DIRCN,DIRTS,REFIX,REFCN,REFTS
)


dropbakdir=:3 : 0

NB.*dropbakdir  v--  erases  backup  directory  nouns  loaded  by
NB. (loadbakdir).
NB.
NB. monad:  dropdir uuIgnore

erase (<BAKPFX) ,&.> DIRIX,DIRCN,DIRTS
)


dropdir=:3 : 0

NB.*dropdir v--  erases directory nouns  loaded by  (loaddir) and
NB. (loadstamps)
NB.
NB. monad:  dropdir uuIgnore

erase DIRIX,DIRCN,DIRTS
)


dropinv=:3 : 0

NB.*dropinv v-- erases inverted data nouns.
NB.
NB. monad:  dropinv uuIgnore

erase DIRNC
)


dropnc=:3 : 0

NB.*dropnc v-- erases directory name class nouns
NB.
NB. monad:  dropnc ilObject

erase ((WORD,MACRO) i. y){DIRNC
)


dropref=:3 : 0

NB.*dropref v-- erases reference data nouns.
NB.
NB. monad:  dropref uuIgnore

erase REFIX,REFCN,REFTS
)

NB. extract drive and path from qualified file names
justdrvpath=:[: }: ] #~ [: +./\. '\'&=


libstatus=:3 : 0

NB.*libstatus v-- changes dictionary library status.
NB.
NB. monad:  bclObj libstatus pa
NB.
NB.   libstatus__DL 1  NB. library on
NB.   libstatus__DL 0  NB. library off

NB. object nouns !(*)=. WF NPPFX DNAME DIDNUM
if. NPPFX do. (jderr ERR098),DNAME;DIDNUM return. end.

if. badjr dpt=. jread WF;CNPARMS  do. jderr ERR088 return. end.

NB. library names marked with * prefix HARDCODE
NB. The * prefix is an illegal dictionary name character
name=. (,>{.dpt=. >dpt) -. '*'
dpt=. (<(y{.'*'),name) (0)}dpt

if. badreps (<dpt) jreplace WF;CNPARMS do. jderr ERR017 else. OK end.
)


loadbakdir=:4 : 0

NB.*loadbakdir v-- loads complete requested backup directory (y).
NB.
NB. result is 0 for success and 1 for failure.
NB.
NB. dyad: iaBn loadbakdir iaObject
NB.
NB.   NB. word directory from backup 25
NB.   25 loadbackdir WORD

NB. drop backup directory if backup has changed !(*)=. BAKNUM
if. BAKNUM~:x do. dropbakdir 0 end.

if. wex ix=. (<BAKPFX) ,&.> dnix y do. 0  NB. backup directory loaded
else.
  NB. depends on correspondence between (JDFILES) & object codes !(*)=. BAK
  fp=. BAK,(":x),;y{JDFILES  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.>ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. reset backup number
    BAKNUM=: x
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)


loaddir=:3 : 0

NB.*loaddir  v-- loads  the  complete  requested  directory  (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loaddir iaObject
NB.
NB.   loaddir WORD  NB. code specifies directory

if. wex ix=. dnix y do. 0   NB. directory loaded
else.
  fp=. ". ({.ix=. >ix),'F'  NB. path file name
  if. badjr dat=. jread fp;CNDIR do.
    1  NB. cannot load
  else.
    NB. HARDCODE: requires two letter TS CN IX suffixes
    dn=. (<_2}.ix) ,&.> DTSIXCN
    (dn)=: dat
    NB. test existence of alleged directory nouns
    -. *./ wex dn
  end.
end.
)


loadnc=:3 : 0

NB.*loadnc v--  load name class for  (y) Result is 0 for success
NB. and 1 for failure. Currently only words and  macros have name
NB. or type class.
NB.
NB. monad: loadnc iaObject
NB.
NB.   loadnc WORD

if. wex dn=. dnnc y do. 0  NB. class/type loaded
else.
  fp=. ". ({.dn=. >dn),'F'  NB. path file name
  if. badjr dat=. jread fp;CNCLASS do.
    1  NB. cannot load
  else.
    (dn)=: >dat
    -. wex <dn
  end.
end.
)


loadref=:3 : 0

NB.*loadref v--  loads word and  test  reference lists from  uses
NB. file.
NB.
NB. Result is 0 for  success and 1  for failure.  Test references
NB. are not currently stored but the code providing this facility
NB. is  left  in  this  verb  and  (saveref)  to  allow for  easy
NB. expansion of reference types in the future.
NB.
NB. monad: loadref iaObject
NB.
NB.   loadref WORD

if. wex dn=. dnrn y do. 0  NB. references loaded
else.
  cn=. ((WORD,TEST) i. y){CNREF
  if. badjr dat=. jread UF;CNMARK,cn do. NB. object noun !(*)=. UF
    1  NB. cannot load
  else.
    dn=. >dn
    dn=. (<_2}.dn) ,&.> DTSIXCN
    (dn)=: dat
    -. *./ wex dn
  end.
end.
)


loadstamps=:3 : 0

NB.*loadstamps v-- loads directory time stamps (y).
NB.
NB. Result is 0 for success and 1 for failure.
NB.
NB. monad: loadstamps uuIgnore

ts=. DIRTS
if. *./b=. wex ts do. 0  NB. stamps loaded
else.
  ts=. (-.b)#ts          NB. load missing only
  for_st. ts do.
    fp=. ". ({.st=. >st),'F'   NB. path file name
    if. badjr dat=. jread fp;CNMARK do.
      1 return.
    else.
      (st)=: >dat
    end.
  end.
  -. *./ wex ts  NB. check loaded stamps
end.
)

NB. maximum backup prefix number - null when no numeric prefixes
maxback=:[: >./ [: ".&> (] *./\@e.&.> (<'0123456789')"_) #&.> ]

NB. Win32 procedure that moves/renames files
movefile=:'kernel32 MoveFileA i *c *c'&cd

NB. bit mask of blcl (y) items with numeric prefix (x)
nummask=:([: ": [) -:"1 ([: # [: ": [) {.&> ]


packdict=:3 : 0

NB.*packdict v-- pack the current dictionary.
NB.
NB. At  the  end  of  a  successful pack  operation  the  current
NB. directory object is refreshed and subsequent  operations  are
NB. performed on the packed files.
NB.
NB. monad:  packdict clName

NB. object nouns !(*)=. DNAME UF WF

if. (,DNAME) -: ,y do.
  NB. clear current object
  dropall 0
  path=. SYS   NB. object noun !(*)=. SYS

  NB. backup number
  pfn=.backnum 0

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
  target=.  (<bckpath) ,&.> (<":pfn) ,&.> dcfiles
  if. badrc msg=.source renamefiles target do. msg return. end.

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


packspace=:3 : 0

NB.*packspace v-- determines if there is sufficient free space on
NB. the backup volume.
NB.
NB. The  test  is  conservative  in  that  you  must  have enough
NB. freespace to  copy the  current  unpacked dictionary.  Packed
NB. dictionaries  are  always  smaller  so this  leaves a  safety
NB. margin.
NB.
NB. monad:  packspace uuIgnore
NB.
NB.   packspace__DL 0

NB. object nouns !(*)=. SYS BAK
NB. size of current unpacked dictionary
bytes=. +/ ; 2 {"1 ] 1!:0 <SYS,'*',IJF

NB. errmsg: not enough free disk space for operation 
if. bytes<volfree BAK do. OK else. jderr ERR204 end.
)


renamefiles=:4 : 0

NB.*renamefiles v-- moves and renames OS files.
NB.
NB. NOTE: tested on  Win32  and Linux 32 bit systems  may work on
NB. others.
NB.
NB. dyad:  blclSource renamefiles blclTarget

if. IFWIN do.
  rc=.movefile"1 x ,. y
  NB. errmsg: unable to rename files
  if. *./0 <; {."1 rc do. OK else. (jderr ERR205),(15!:11)'' end.
else.
  NB. move current dictionary files to backup location
  NB. NOTE: assumes path file names that do not wreak linux (mv) command
  if. isempty rc=. host"1  > (<'mv ') ,&.> x ,&.> ' ' ,&.> y do. OK
  else.
    NB. result not empty probably some OS error
    NB. errmsg:  unable to copy/move/rename files - shell messages ->
    (jderr ERR210),<,rc
  end.
end.
)


restdict=:4 : 0

NB.*restdict v-- restore latest backup created by (packd)
NB.
NB. dyad:  blclFiles restdict clName

NB. object nouns !(*)=. DIDNUM DNAME SYS

if. (,DNAME) -: ,y do.

  NB. clear current object directory - frees space
  dropall 0

  NB. NIMP restore comes from the same volume as the
  NB. dictionary.  This code depends on the fact we
  NB. are dealing with a standard dictionary directory
  NB. that is contained on ONE volume.
  path=. ((justpath`justdrvpath@.IFWIN) SYS),PATHDEL

  dcfiles=. JDFILES ,&.> <IJF            NB. dictionary file names with extension
  bckpath=. PATHDEL ,~ path,>5{JDSDIRS   NB. HARDCODE 5 backup directory index
  target=. (<path) ,&.> dcfiles          NB. current dictionary files
  source=. (<bckpath) ,&.> (<":>x) ,&.> dcfiles  NB. lastest backup files

  NB. test backup files errmsg: missing backup files - restore aborted
  if. -.fex source do. jderr ERR207 return. end.

  NB. Check DIDNUM of backup dictionary against current object
  NB. they must match to maintain master/dictionary relationships.
  NB. WARNING uses fact that the WORD file is first ON (source) list
  if. badjr dat=. jread (>{.source);CNPARMS do.
      jderr ERR088 return. NB. errmsg: jfile read failure
  end.

  NB. read alleged backup DIDNUM
  dn=. ((1&{::@>) :: 0:) dat
  if. -. dn -: DIDNUM do. jderr ERR209 return. end.

  NB. erase current dictionary files and copy last backup
  (1!:55) target
  if. badrc msg=.source copyfiles target do. msg return. end.

  NB. increment pack count to prevent clash with backup
  NB. this causes gaps in the backup count but insures we never clash
  pfn=.backnum 0

  NB. insure new directory is reloaded when needed
  dropall 0

  ok OK201;DNAME;<:pfn  NB. name & pack count of restored dictionary
else.
  jderr ERR202
end.
)


restspace=:3 : 0

NB.*restspace v-- determines  if there is enough space to restore
NB. a dictionary.
NB.
NB. monad:  restspace uuIgnore

NB. object nouns !(*)=. BAK SYS

NB. all dictionary backup files
if. #back=. 1!:0 <BAK,'*',IJF do.

  NB. latest back up number
  maxb=. maxback {."1 back

  NB. select files in latest backup
  back=. back #~ maxb nummask {."1 back

  NB. bytes required to store lastest backup
  bytes=. +/ ; 2 {"1 back

  if. bytes<volfree SYS do.
    ok maxb       NB. return lastest backup number
  else.
    jderr ERR204  NB. errmsg: not enough free disk space for operation
  end.
else.
  jderr ERR206    NB. errmsg: no backups to restore
end.
)


savedir=:4 : 0

NB.*savedir  v--  saves  the  requested  directory  (x)  in  the
NB. appropriate database file.
NB.
NB. dyad: ilObjFp savedir clFile|iaFp
NB.
NB.   0 23899923 savedir list;comp  NB. save WORD directory

'dir wp'=. x
y=. 0 [ 'list comp'=. y
dir=. (OBJECTNC i. dir) { DIRNMS
'dts dix dcn'=. dir ,&.> DTSIXCN
cn=. (<list) jreplace wp ; CNLIST
cn=. cn, comp jreplace wp ; CNCOMPS
cn=. cn, (<uv=. (#list);now '') jreplace wp ; CNMARK
if. badreps cn do.

  NB. directory write error attempt to restore previous
  cn=. (<".dix) jreplace wp ; CNLIST
  cn=. cn, (".dcn) jreplace wp ; CNCOMPS
  cn=. cn, (<".dts) jreplace wp ; CNMARK
  if. badreps cn do.
    jderr ERR200
  else.
    jderr ERR201
  end.

else.

  NB. update object directory
  (dix)=: list
  (dcn)=: comp
  (dts)=: uv
  OK

end.
)


saveref=:4 : 0

NB.*saveref  v-- saves the requested reference  directory (x) in
NB. the appropriate database file.
NB.
NB. dyad: ilObjFp saveref (blcl ; il)
NB.
NB.   0 23899923 saveref list;comp  NB. save WORD reference directory

'ref fp'=. x
y=. 0 [ 'list comp'=. y
type=. (WORD,TEST) i. ref  NB. only words currently stored
dir=. type{DIRRFN
cnref=. type{CNREF
'dts dix dcn'=. dir ,&.> DTSIXCN
cn=. (<list) jreplace fp ; 0{cnref
cn=. cn, comp jreplace fp ; 1{cnref
cn=. cn, (<uv=. 0;now '') jreplace fp ; CNMARK
if. badreps cn do.

  NB. directory write error attempt to restore previous
  cn=. (<".dix) jreplace fp ; 0{cnref
  cn=. cn, (".dcn) jreplace fp ; 1{cnref
  cn=. cn, (<".dts) jreplace fp ; CNMARK
  if. badreps cn do.
    jderr ERR200
  else.
    jderr ERR201
  end.

else.

  NB. update object directory
  (dix)=: list
  (dcn)=: comp
  (dts)=: uv
  OK

end.
)


tmpdatfile=:4 : 0

NB.*tmdatfile v-- copies  dictionary  object files  to  temporary
NB. files.
NB.
NB. dyad:  iaObject tmpdatfile (clTemp ; clDictionary)

'tfile datfile'=. y

NB. copy directory and inverted data region
if. badrc uv=. copydirinv y do. uv return. end.

NB. copy data region in chunks no greater than (COPYFACTOR)
NB. errmsg: unable to load directory
if. loaddir x do. jderr ERR054 return. end.
ix=.".>dnix x
cn=.".>dncn x

NB. errmsg: directory damaged
if. (#ix)~:#cn do. jderr ERR093 return. end.
NB. exit if no data to copy
if. 0=#ix      do. OK return. end.

ix=.(-COPYFACTOR) <\ ix  NB. object noun !(*)=. COPYFACTOR
cn=.(-COPYFACTOR) <\ cn
dropdir x

NB. NIMP opening and closing files for now
ncn=.i.0
for_reg. cn do.

  NB. data in object files are in pairs of components
  uv=. ,(>reg) ,. >:>reg
  if. badjr dat=. jread datfile;uv do. jderr ERR088 return. end.

  NB. test components against directory (NIMP handle errors later)
  NB. errmsg: directory-data inconsistency
  if. (2#>reg_index{ix) badcn dat do. jderr ERR055 return. end.
  if. badappend uv=.dat jappend tfile do. jderr ERR058 return. end.

  ncn=.ncn,fod uv  NB. new components
end.

NB. update file component list
NB. errmsg: jfile replace failure
if. badreps ncn jreplace tfile;CNCOMPS do. jderr ERR056 else. OK end.
)


tmpusesfile=:3 : 0

NB.*tmpusesfiles  v-- copies  reference file.  This  file differs
NB. from object data files and may change even more.
NB.
NB. monad:  tmpusesfile (clTemp ; clDictionary)

'tfile datfile'=. y

NB. copy directory and inverted data region
if. badrc uv=. copydirinv y do. uv return. end.

NB. NIMP only word references are currently stored
NB. errmsg: unable to load references
if. loadref WORD do. jderr ERR079 return. end.
ix=.".>dnrn WORD
cn=.".>0 dnrn WORD
dropref 0

NB. errmsg: directory damaged
if. (#ix)~:#cn do. jderr ERR093 return. end.
NB. exit if no data to copy
if. 0=#ix      do. OK return. end.

ix=.(-COPYFACTOR) <\ ix  NB. object noun !(*)=. COPYFACTOR
cn=.(-COPYFACTOR) <\ cn

NB. NIMP opening and closing files for now
ncn=.i.0
for_reg. cn do.

  if. badjr dat=. jread datfile;reg do. jderr ERR088 return. end.

  NB. test components against directory (NIMP handle errors later)
  NB. errmsg: directory-data inconsistency
  if. (>reg_index{ix) badcn dat do. jderr ERR055 return. end.
  if. badappend uv=. dat jappend tfile do. jderr ERR058 return. end.

  ncn=.ncn,uv
end.

NB. update reference component list NIMP words only
NB. errmsg: jfile replace failure
if. badreps ncn jreplace tfile;1{0{CNREF do. jderr ERR056 else. OK end.
)


volfree=:3 : 0

NB.*volfree v-- returns free bytes on volume or UNC path.
NB.
NB. monad: na =. volfree clPathDisk
NB.
NB.   volfree 'c'
NB.   volfree '\\unc\share\'
NB.   volfree '/home/john'   NB. NIMP: linux paths ignored for now

if. IFWIN do.
  if. (2#PATHDEL)-:2{.y do. freediskwin y else. freediskwin (justdrv y),':',PATHDEL end.
else.
  <./freedisklinux 0
end.
)