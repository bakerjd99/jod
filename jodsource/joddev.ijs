NB. JOD dictionary dump: 28 Mar 2020 13:01:05
NB. Generated with JOD version; 1.0.1; 6; 28 Mar 2020 12:35:35
NB. J version: j901/j64avx/windows/release-e/commercial/www.jsoftware.com/2020-01-29T11:15:50
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


IzJODinterface=:<;._1 ' bnl bget del did dnl dpset gdeps get globs grp make mnl newd od packd put regd restd rxs uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'1.0.1';7;'28 Mar 2020 13:01:05'

JODVMD=:'1.0.1';7;'28 Mar 2020 13:01:05'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


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

  NB. add extension if missing
  if. -.IJS -: ;(-#IJS) {.&.> scr do. scr=. scr ,&.> <IJS end.

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

setbuilddirs=:3 : 0

NB.*setbuilddirs v-- sets/creates paths used by JOD build words.
NB.
NB. monad:  blcl =. setbuilddirs uuIgnore
NB.
NB.   NB. the monad returns the locations of JOD directories.
NB.   setbuilddirs 0
NB.   
NB. dyad: blcl = uuIgnore setbuilddirs uuIgnore
NB.
NB.   NB. the dyad creates all the directories
NB.   NB. required to build the JOD addons.
NB.
NB.   'test' getrx 'setbuilddirs'
NB.   1 setbuilddirs_test_ 0

NB. mask locale references to enable:  getrx 'setbuilddirs'
NB. !(*)=. jpath_j_ JODobj_ijod_ DPATH__ST__obj locsfx__JOD__obj

NB. assumes JOD is loaded with (JODobj) visisble to (ijod)
0 setbuilddirs y
:
obj=. JODobj_ijod_
locx=. locsfx__JOD__obj {.{:"1 DPATH__ST__obj
aliendir=. ".'ALI',;locx
JODSTAGEDIR=.    jpathsep aliendir,'stage/jod/'
JODGITDIR=.      jpathsep aliendir,'jodgit/jod/'
JODSOURCESTAGEDIR=. jpathsep aliendir,'stage/jodsource/'
JODSTAGEPDFDIR=. jpathsep aliendir,'stage/joddocument/pdfdoc/'
JODSTAGEDOCDIR=. jpathsep aliendir,'stage/joddocument/'
JODGITDOCDIR=.   jpathsep aliendir,'jodgit/joddocument/'
JODADDONDIR=.    jpathsep jpath_j_ '~addons/general/jod/'
JODSCRIPTDIR=.   jpathsep ".'SCR',;locx
JODEXTSDIR=.     jpathsep jpath_j_ '~addons/general/jod/jodexts/'

NB. main build directories required by (buildjoddistribution)
corebuild=. JODSTAGEDIR;JODGITDIR;JODSOURCESTAGEDIR;JODSTAGEPDFDIR;JODSTAGEDOCDIR;JODGITDOCDIR;JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR

if. x -: 1 do.

  NB. create build directories under (alien) - some dictionary directories exist
  stagedirs=. corebuild -. JODADDONDIR;JODSCRIPTDIR;JODEXTSDIR
  stagedirs=. stagedirs,<jpathsep aliendir,'stage/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/'

  NB. core addon directories
  stagedirs=. stagedirs,<JODSTAGETOOLSFILE=. JODSTAGEDIR,'jodexts/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodbak/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'jodlabs/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/'
  stagedirs=. stagedirs,<JODSTAGEDIR,'joddoc/pdfdoc/'

  NB. class source 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodijs/'
  
  NB. unit tests 
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/smoke/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/basic/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/large/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/stress/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/crush/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/prepare/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/purge/'
  stagedirs=. stagedirs,<jpathsep aliendir,'jodgit/jodunit/extend/'
  
  NB. creation order matters
  showpass 'created directories'
  showpass >stagedirs=. /:~ stagedirs
  makedir"0 stagedirs 
end.

corebuild
)

updatejoddistribution=:4 : 0

NB.*updatejoddistribution v-- updates files in JOD distribution.
NB.
NB. dyad: blVersion updatejoddistribution blclDirs
NB. 
NB. author:  John D. Baker  
NB. created: October 2005
NB. changes: --------------------------------------------------------------
NB. 08may28 removed install bats and scripts - simplifies JAL maintenance
NB. 08sep24 added history.txt to distributed files
NB. 11feb14 coinsert 'ijod' added,jod.pdf removed from zip
NB.         google/codeplex directory update removed
NB. 11feb17 jodpdf.txt directory placeholder added
NB. 11may18 joddoc/linuxnotes.txt added
NB. 12jun20 (setjaddonpaths) added for win, linux, mac path
NB. 12jun22 added (macnotes_TXT) 
NB. 12jun25 forcing line ends (toJ)
NB. 12jul07 copy dist zip to dropbox folder
NB. 14jun25 remove dropbox folder copy
NB. 15mar16 remove zfiles - files to .../joddev/alien/state/... directories
NB. 15jul15 remove (jodindex_HTML) large obsolete object
NB. 17mar14 converted to verb
NB. 20jan19 added code to add icon files: jodcube.ico, jodcube.png

'JODSTAGEDIR JODGITDIR'=. y
jodversion=. ,>0{x

NB. scripts, labs and bats
NB. !(*)=. historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump
NB. !(*)=. LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak jodpdf_TXT linuxnotes_TXT macnotes_TXT 
sl=. 'historyjod installjod resetjod jodparms jodprofile manifestjod labexample001 jodintro joddump'
sl=. sl,' LabDump jodbest installjodbat resetjodbat jodprjm joduserconfigbak'
sl=. ;: sl,' jodpdf_TXT linuxnotes_TXT macnotes_TXT'

rc [ 'rc jodscr'=. 4 get sl

NB. set scripts
({."1 jodscr)=. {:"1 jodscr

NB. run JAL manifest - tests manifest script 
((0!:110) :: 0:) manifestjod

NB. update files
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodparms.ijs'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodprofile.ijs'
assert. 0<(toJ historyjod)    fwrite showpass JODSTAGEDIR,'history.txt'
assert. 0<(toJ historyjod)    fwrite showpass JODGITDIR,'history.md'
assert. 0<(toJ jodprofile)    fwrite showpass JODSTAGEDIR,'jodbak/jodprofilebak.ijs'
assert. 0<(toJ jodparms)      fwrite showpass JODSTAGEDIR,'jodbak/jodparmsbak.ijs'
assert. 0<(toJ joduserconfigbak)  fwrite showpass JODSTAGEDIR,'jodbak/joduserconfigbak.ijs'
assert. 0<(toJ manifestjod)   fwrite showpass JODSTAGEDIR,'manifest.ijs'
assert. 0<(toJ labexample001) fwrite showpass JODSTAGEDIR,'jodlabs/labexample001.ijs'
assert. 0<(toJ LabDump)       fwrite showpass JODSTAGEDIR,'jodlabs/labdump.ijs'
assert. 0<(toJ jodintro)      fwrite showpass JODSTAGEDIR,'jodlabs/jodintro.ijt'
assert. 0<(toJ joddump)       fwrite showpass JODSTAGEDIR,'jodlabs/joddump.ijt'
assert. 0<(toJ jodbest)       fwrite showpass JODSTAGEDIR,'jodlabs/jodbest.ijt'

NB. store jodpdf.txt place holder for jod.pdf - available online
assert. 0<(toJ jodpdf_TXT) fwrite showpass JODSTAGEDIR,'joddoc/pdfdoc/jodpdf.txt'

NB. store linux/mac specific notes
assert. 0<(toJ linuxnotes_TXT) fwrite showpass JODSTAGEDIR,'joddoc/linuxnotes.txt'
assert. 0<(toJ macnotes_TXT)   fwrite showpass JODSTAGEDIR,'joddoc/macnotes.txt'

NB. copy jod icons from *.tex document directories - these binaries are not stored in JOD.
assert. fexist png=. jpath '~JOD/joddev/document/jodgraphics/jodcube.png'
assert. fexist ico=. jpath '~JOD/joddev/document/jodgraphics/jodcube.ico'
assert. 0<(read png) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.png'
assert. 0<(read ico) fwrite showpass JODSTAGEDIR,'joddoc/jodcube.ico'


smoutput 'JOD staging directories updated'
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
1H6L8+>P&o1a"\4+>GPm2DZI12BXb2+>GSn1GL"1+>P\p0esk.1.cda:IJo7FCfK)@:NkYDfTD3
8l%htBl8$(Eb8`iAKWQICi<`mARlotDKKe>-u!F7A18WQ+EM+*+=M;BFD>`)Bl8$(Eb8`iALU2s
8l%isDf9H58l%iS:JXY_+DG_8ATDBk@q?c7+Dbt)A7]9oBl8$2+=Lr=De(:>/Kf+GAKWCBATV[*
A8,q'ATDBk@q@)\H:gt$F`_>8FCfK)@:Nk`De+!4Bl"o+DKKH1Amo1\+EqaEA91@=6rZrX9N+td
6qU6C<)6:`;]p6pEcYr5DCcoI@;BEs@;]TuA79Rk8l%iU9gj/9EcYr5DCcoI@;BEs@;]TuA79Rk
F(KH&F_PZ&A8-(*F(KH704T$6@<?(%+E1b2BQG;=F(Jl)@X0(g:IH=7F_PZ&+EqaEA9.      ~>
)
showpass 0 8 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0ekI,0eje,+>G_r1*AJ22Du[40d&4o2_[!01,'h++>u&71*A;++>P&t0JPF-0eje++>GT*0H`))
+>P&p2)@680ea_*+>PW02)ZR31E\Fq1GgsH+>GSn1*A;.2)QL23?U("3B8c90fL41+>GZ02bHk6
6<-TN6qBmJ<)6Cp1,TCG:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.4
0H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A+>>Vp6#^ie1,(FC+>Gl;0JbaD3!p!":-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1*@]-@<?'A+>Pr"9jr;i
1,(FC+>Gc81b^sI2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!
E]P<u1E[f.@<?'A+>Pku6$6f_1,(FC+>GT30JGOD0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B9)B+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_1,(FC+>GT31GLpH3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P<u2'=#0@<?'A+>Pku6$6f_1,(FC+>GW4
0f1pG2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU
1,g=AF_;gP0JPR10etdF1-.*H$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@
EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE3B83)6?R!YA0=Wi
D.7's3Zp4$+@KX[ANCqh3?UV1B-8r`0f^@21HI<M3\r`&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<P3?TG2F_PZ&+AR&r@V'R@+>b2`6t(1K3Zp1<+@1-_+>PW*3?U%43]&TQ1H#RI$;No?+B*Q,
FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>>E./ibpP+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pr"6$6f_1,(FC+>G]6
1H%9M2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\
FCdKU0JahI@rrhK0JPR10KD0O3BB#Q$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=
6?R!YA0=WiD.7's3Zp@(+@KX[ANCqg0d'50Fs&Oo0f^@20KLpF3\iDs$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+?1Jd6t(1K3Zp.3+AQiu+>PW*3?U%23\`QS
1,oUJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS3?TG4@<?'A
+>Pr":2b:u1,(FC+>G`71c%0L2[Tm!:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC+>G`71c[TN3=6*#:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t0d%T,@<?'A+>>Pn6tKjN1,(FC+>GZ52)@9I
1C=Hr:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A
+>>Pn6tKjN1,(FC+>G]61GCjE2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t1E[f.@<?'A+>>Pn6tKjN1,(FC+>G]61c[TQ0a\6p:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>So6tKjN1,(FC+>GQ21,h6K
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A
+>>So6tKjN1,(FC+>G]61H7EP3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t2BX,1@<?'A+>>Vp6tKjN1,(FC+>G]60f;!I1C=Hr:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t2]s52@<?'A+>>Yq6tKjN1,(FC+>>f:1,q<O
0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A
+>>Yq6tKjN1,(FC+>GW42)dQM0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<t3?TG4@<?'A+>>Yq6tKjN1,(FC+>G]60JY[D3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>>\r6tKjN1,(FC+>GQ22*!]O
0a\6p:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0d%T,@<?'A
+>>\r6tKjN1,(FC+>GT31b^sE3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1*@]-@<?'A+>>\r6tKjN1,(FC+>GZ50f(jE1^XQs:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1E[f.@<?'A+>>\r6tKjN1,(FC+>G]61b^sF
3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A
+>>\r6tKjN1,(FC+>G]61bh$G0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u2'=#0@<?'A+>>_s6tKjN1,(FC+>GT32)73L2[Tm!:-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>_s6tKjN1,(FC+>GZ51bh$G
2@9cu:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2]s52@<?'A
+>>_s6tKjN1,(FC+>GZ52)[KQ1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u3$9>3@<?'A+>>_s6tKjN1,(FC+>Gf91Gh-I3!p!":-pQU;gEG+ASjIN8l%ht
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqf3$:V#@j!N\0f^@13BAuU3\iZ%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>bt6tKjN1,(FC
+>GQ20etdI2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Y_p+@KX[
ANCqf3$:V#@j!N\0f^@20KLpI3\iQ"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%+@:3bCh+Y`
F_tT!E]P=!1*@]-@<?'A+>>eu6tKjN1,(FC+>>f:1,M$H3=6*#:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_K)F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqf3?U_$@j!N\0f^@20fh!D3]&Mt$49Np/g+)<
F*(u13Zq$j6m+TS@rH4$ASuU$A3N1"6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1Gg3s6t(1K3Zp.4
+@KdN+>PW*3?U%43\`HP1b]7D$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnJ#+Co&,+<X!nBl%<&
:3CD_ATBgS0d%T,@<?'A+>G\q6tKjN1,(FC+>GT31c7<K1("?q:-pQU;gEG+ASjIN8l%ht+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40d&%jA7]p,+@:3bCh+Y`F_tT!E]P<u+<X'\FCdKU0fL4CARci<0JPR10f(jH1-.0J$47,8
67sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen4+>"^HATf1=6?R!YA0=WiD.7's3Zp4$+@KX[ANCqg3?Uq&
DBL\g1,'h*0KLmI3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r
@V'R@+>b2`6t(1K3Zp15+A-'[+>PW+0H`)/3]/ZR2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&
/hnJ#+Co&,+<X!nBl%<&:3CD_ATBgS2'=#0@<?'A+>Pes9jr&b1,(I;+>G]61,CsJ2[Tm!:-pQU
;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp1;+AH9b+>PW+0H`)*
3\rWS1GoLH$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/hnIk6?R!YA0=WiD.7's3Zp@(+@KX[ANCqh
3$:q(EZd+k1,'h*1HI3E3\WDu8l%iMDffQ3?Ys=/2[p+%8l%iMDffQ3?m'0)F*2&806Co<CND.<
F_>bK@VKpoBOu6-GA2/4+CfP7Eb0-1+A,Et+EMgLFCf<1?k!H+4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk%13OO:2b5cF!+n#Dfp.E@s)g4
ASuT48l%ht@:WneDK@EQ<+oue+CoD#F_t]-F<G:=%14S(Eb/`lA7]g3+CJksF*)>@H"q8.?nNQE
?ta7qFDl2FC2[Wj+Du+>ATJu&@ruj%C`m5$@;]^hF"SRE$;#;[F_,V:DJsW.A0>PsEb-A1@<iu5
AThX*+C\n)@:WnhATMp(A1eurF)uJ8F!,R<@<<W/BkM+$%16QU+CSekEb0<5ARlp-Bl%T.@V$Zu
DeE]oA0>T(+B2-):NJQ>F(JoD%13OO0eOSV<)5nX?V4*^?Ys=]+DGm>>A/,#E-"&n05#!@BQ[c:
@rH3;@UX%`Eb],F3A5,cA1qD.DdkA:@<6O%E\CBf6r,FPA6gTsFEDJC3\N.!Bln$2@P2//D(f@,
CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJG<)5nX/o>,J/e&-s$4R>;DffQ3+CT5.ARTU%Ao_g,+ED%'
ASuT4FDi:?Ch.*uF<G"0A0>o(An?!oDI[6#FD,5.@s)g4ASuT4DfQt<AU&;>8l%htEb0&u@<6!4
%13OO,9nEU7V-%LF^]<9+>GQ$+>PW+0H_Jm/hen4+>"]aF`)52Ch7$rA18W1$4R=b.Nh2pGT^C'
B4Z0m+EVmJD]ib3+DPh*/oY?5+CINSFD)e=@;BEsCh[s4F!,C5+DtV)ATKJ3%144#+<V+#+<Vd9
$4R=b+<Vd9$4R=b+<Ve!:IJ/X:J=\R<CokP84c`Z:Jt=N2$s[c67sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u0H_K+@<?'A+>P\p9jr&b1,(FC+>Gf91,CsJ
0FA-o:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,0mo
6t(1K3Zp+5+@0se+>PW*3?U%:3\W?N0e`qA$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
/KeS8Fs%noF_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh3?V%)Gp"jr0f^@22EEZK3]&f'$49Np/g+)<
F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'k
CbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp16+<X'\FCdKU1,g=A
F_;gP0JPR10ek^C0KM!F$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3b
Ch+Y`F_tT!E]P<u1a!o/@<?'A+>Pku6$6f_1,(FC+>GT31GLpI0FA-o:-pQU;gEG+ASjINC2[X)
Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K3Zp1:+@1-_+>PW*3?U%3
3\`HP0fKFH$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@
+>Pht+@KX[ANCqh2]tD/B-8r`0f^@21-.0G3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp
/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1-$ICF_;gP0JPR10f(jH2EEWS$47,8
67sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`F_tT!E]P="+<X'\FCdKU1-$IC
F_;gP0JPR10f(jI1-.3M$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B9)B+@:3bCh+Y`
F_tT!E]P=#+<X'\FCdKU1-$ICF_;gP0JPR10f1pI2EEWQ$47,867sBZH#n(=D)reSDe*s.DesJ;
+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+
Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU0JahI@rrhK0JPR10KD0O3BB#R
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P=%+<X'\
FCdKU0ejeGDg!6Y0JPR10ebXC1cdBH$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-Qc
DBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qi
A7]p,+@:3bCh+Y`F_tT!E]P=&+<X'\FCdKU0ejeGDg!6Y0JPR10ek^D2``]R$47,867sBZH#n(=
D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3
Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P='+<X'\FCdKU1-$IPDg!6Y
0JPR10f;!K1HI?O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<t0H_K+@<?'A+>Pr":2b:u1,(FC+>G`71c[TN3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0ejdn6t(1K3Zp+3+@KdN+>PW*3?U%43]/]S
0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>GVo
+@KX[ANCqf1*Atr@j!N\0f^@21cdEH3\`K!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp.5+<X'\FCdKU0JXb=ARci<0JPR10f1pJ3BArN$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>>So
6tKjN1,(FC+>GQ21,h6K3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS0f:'r6t(1K3Zp+4+@KdN+>PW*3?U%53\r`V1cYmM$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqf1a#1t@j!N\0f^@2
1cd?K3\iN!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's
3Zp.9+<X'\FCdKU0Jst@ARci<0JPR10KD0L3'&lO$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-l
BQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY
0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>>Yq6tKjN1,(FC+>GW42)dQM1("?q
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS0f^@!6t(1K
3Zp+6+@KdN+>PW*3?U%53\W<M0f]RJ$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8
Fs%noF_PZ&+AR&r@V'R@+>PVn+@KX[ANCqf2BYD!@j!N\0f^@20KM'O3\W8q$49Np/g+)<F*(u1
3Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49
D$j$)/g+2+EcYr5DE8mp/hen3+>"^HATf1=6?R!YA0=WiD.7's3Zp14+<X'\FCdKU0K(%AARci<
0JPR10ek^G0KLmJ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn9
7;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`
F_tT!E]P<u1*@]-@<?'A+>>\r6tKjN1,(FC+>GZ50f(jE2$sZt:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>GK&/heD"+Co&,+<X!nBl%<&:3CD_ATBgS1,C$q6t(1K3Zp+7+@KdN+>PW*3?U%53]&NO
1,'%B$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Pbr
+@KX[ANCqf2BYD!@j!N\0f^@21cdHJ3\`>r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3
+>"^HATf1=6?R!YA0=WiD.7's3Zp18+<X'\FCdKU0K1+BARci<0JPR10ek^H1-.6N$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_qiA7]p,+@:3bCh+Y`F_tT!E]P<u2BX,1@<?'A+>>_s
6tKjN1,(FC+>GZ51bh$G2@9cu:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*Jh
CLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>GK&/heD"+Co&,+<X!n
Bl%<&:3CD_ATBgS1,g<u6t(1K3Zp+8+@KdN+>PW*3?U%43]/fV2)GXI$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5%%/KeS8Fs%noF_PZ&+AR&r@V'R@+>Po!+@KX[ANCqf2]tM"@j!N\0f^@2
2```O3\`W%$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!nBl%<&:3CD_ATBgS1-$I"
6t(1K3Zp+9+@KdN+>PW*3?U"93]&cV1-#[K$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5%%
+@:3bCh+Y`F_tT!E]P=!0H_K+@<?'A+>>bt6tKjN1,(FC+>GQ20etdI2$sZt:-pQU;gEG+ASjIN
C2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k
:-pQU<b6;mBl@lM+>GK&/heCj6?R!YA0=WiD.7's3Zp45+<X'\FCdKU0K:1CARci<0JPR10ebXC
2``]P$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40H_K)F_PZ&+AR&r@V'R@+>Ybq+@KX[
ANCqf3?U_$@j!N\0f^@13BAoP3\iAr$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mp/hen3+<X!n
Bl%<&:3CD_ATBgS1G^-r6t(1K3Zp+:+@KdN+>PW*3?U%23\W<M1bf=E$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Fu]6t(1K3Zp.6+@KdN+>PW*3?U%2
3]&]T0es(C$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@
+>P&^6t(1K3Zp.9+@KdN+>PW*3?U%43\rNP1,fOI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.0
0J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+A-'[+>PW+0H`)(3\WNS1boCF$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%noF_PZ&+AR&r@V'R@+>b2`6t(1K3Zp15
+A-'[+>PW+0H`)/3]/ZR2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp.00J5(&/KeS8Fs%no
F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp18+AH9b+>PW+0H`),3\iKP1cPgL$;No?+B*Q,FCf;M+DPh*
FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp.00J5(&+@:3bCh+Y`F_tT!E]P=$+<X'\FCdKU1,pCN@<*JG0JY=)0etdG2**NN
$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFp
C1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0eP.40d%T*F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp1;
+AH9b+>PW+0H`)+3\W9L0Js259LMKK6r%ZBATKUa:-pF+9LMKK6r%ZBATJu9/M/)@Ch+Y\:IH=9
AThX$DfBQ)DKI"=DffQ3/e&._67r]S:-pQU@rc-hFCeuD+>PW)2.U9.0eje&%15is/g+Y;@;]^h
A3(hg0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^%13OO;e9M_-q[9':2b5cF"&5DDfQt;
DfTD3Eb/`lDKI"=DffQ3/g*GrF)N1BARuu4BPDO0DfU,<De(:L%16'JATME*DJsW.F!+n3AKYo-
A0>;uA0>u-AKY].F*2&8+D>2,AKYGnASrW,@<-!lCj@.3A7T^lF)to'%17#o+CS_fDId['ARmD9
8K`%bFCAm$+EV:2F!+q'@psM$AKWC0A0>;'D/!g&ASu3jC`mS/B4uB0F('>C+D>J1FDl2F+Unbf
$;bb]@VfUmF!,[@FD)e=BOr;rF`MM6DKI!n:IH=HH#n(=D(Z8)/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/I`%A2'>:u@j!N\0Jst-
0fh!D3\W8t$4R=s.3M3"@rH4'Ch7^"+E2IF05"j<+EMgFD.Rg0GqL3^E-67F@;]TuB4Z0-@<,p%
AmoCoCj@.EH#7D0FE2)*@;HA[+<VeNBln#2@3B/nG9C=3DJsf7DJ()'G[k<(FD5Z2F#ja;%144#
+>P&o+D58-+=D8BF*)AAARTFbCh4t'$6UH6+<WE^E-67F-Zip@FDu83@;TIiALBPe/hSb/+EV1>
F<E1g/ghbN$4R=b+<Wrm@rH4$@;]TuEb/cmF(o9)+EM47F_kS2F*)G:G%De.DfQt1Df'H0ATVK+
E-67UB4Z0-F*VV>ATVs<+>"^RD]iV9@qBV$Bl@m13t2N+$8O%Q8TZ)!@<3Q"+Dkh6FCArr+Du+>
+EVNEBl7EsF_#&+E,Tf>@;TIiATJu.DBO%7AKYMpAnc-sFD5Z2+E(j7B6%p5E,uHq+<Ve8DIal2
F_Pr/F"SRX<+ohcC2[X)Df9G7-uEdA.3N>G+C\c#Bk(RfCj@.3+DYe9A7oHrFDhTq+<Ve>ATT&'
Ec6)<A0>u-BlbmL+AcutFCB#qCh7Z1GAhV?A0>T(@rc-hF(HJ8H#7D0FE2XL@;]Tu%144#+EM76
E,96#Gp$s4Bl8$$Bl7X&B-9ehF*VhKASlK2Bl5&+Ec6)>F"SRE$4R=b+<W6YFDi:6Bm:bBBPDN1
Eb065Bl[d++Cf(nDJ*O%+DG^9@rH4$@;]TuDfBf4Df0V=@;]TuFD,5.@VK^gEd8*$+<VdL+DbJ3
Dfp.EDe:,6BOr</DId=!CjB`4B-:]&D/aE2ASuT4Anc'mF!(o!%14m?+B3#c+DG_(AU#S:DJ()5
H#n(=D'3tBATJu'Dg5i(+Dbb5FE8RCAfu;9Eb$;1@;TRs+>"^YF(oN)+EMgF@W-((%144#+EqaH
Ch+Z6Bk;*k+C]%t+E1n4AoD^,@;]Rd+C]8-F*)IGAoD]4Cgh?sAKYMt@ruF'DIIR"ATKI5$4R>!
.3M,lDImisC`m\*FED)7DBNe)FCSuuDJ()5BQ&$0A0>o(E,8rmAKZ).AKYr4AS,Y$06;8FF*)G:
DJ(VDF_56"GT[G&+<VeD@<?!mBl7Q+DJs_O%13OO2(9Y6+EM76E,9).Ch[cu+EV1>F<G+*Cij).
F*VhKASiQ2BQ&$0A0>>m+CSekARloqDfQtEDfTB0/e&-s$8s=U5p0fVDdm-k+=M)8DL!@8Bk)7!
Df0!(Bk;?7+EqaEA1qb;@psInDf.4NF(KD8@rcL/F!,L7An?!oDI[6#%144#+DGm>DImBiARmD&
$4R>$.3Lo!E-624+A*bH<Cn<FEc5i;+D#G$+DGm>DImBiARmD&$4R>%.3M5Y6m->hF*&OFF`&=?
DBND,FD)e@Bl7I"GB4m8DIal+Bl8'<+EMgLFCf<1%13OO3@Q(C:IH=CAS#Cn+CQC+ASc<.G%G]'
+EV:*F<GL@ASuQ3F`8I6ATV?pCh7-"BQS*-+EMXMCh4`&ASc<.AoD]4%17;tEb'5D%13OO+<VdL
C2[WrASc<.-ZF3M-OgCl$4R=O$;bY^F(o*"AKX?R@;]^hF!,RC+A,Et/e&.>/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+%14jF+@KdN
+>PW)2'=S53\r]U0JO"D%13OO0e"5>@;BEsF*2M7+B<;n@rGmh+DGm>E,ol9ATDU4+D>2$A8Ggf
+DG^9E-67MF!+n/A0>MrF=2,^%13OO1+=>5Df0W1A7]d(BOPdhCh[d"+B<;n@rGmh+CT=6@3BZ'
G]Y'MH#R=;Bl5&(De!p,ASuTuFD5Z2/0JLVB.aW#%144#+>b3[F`\`RF`(o'De*F$AU&;E4&o$I
6Vg*=4!u.'/hSb/+E_R9@rGmh+EV1>F<E1g/hSL\$4R=u.3LoeA0<"'+EM76E,9).@q]:gB4W2q
Dfor>+D,P4+E(_(ARfh'+DG^9FD,5.A79Rg@UX=h/e&.1+<Xa!ASrW2AT2Ho@qfgn+EqaEA90DB
@VTIaFE8RHBOr<-H#n(=D'3>2EcP`/FDQ4FEb/ZiEt&I!+<Yc>AKZ)'EbAs*ARlonDf'H3DIm^-
F!+n/A0>AqARfLs+EV:.+DG_'Df'3+B-;)#D.Rbt$6UH6GA2/4+EV:.+EV%4B4Z0-DIIBnF"SRX
9lG)p+E(j7FD,5.AU&0*DKBA3De:,#DBO(@A79Rk%144#+E(b"F`MOGGA2/4+EV:.F(HJ7ART+j
/e&.1+:SZ#+<X6f+CQC5AT2Ho@q?cmDfor>+Eq78+CSekARlp*D]j.8AKZ#)E,8rmARlp)FE2M6
FEMV8+CP]d+<VeDBl7X+@s)U!+CT,*F`):DDe:,1G%G]-ART*lGAhV?A0>>m+CSekARlp*D]iP.
F`):DBQ&)($6UH6D..=-+EV=7ATJu&DBNk,C1Ums+D>2)+C\nnDBNt2E,8rmARmD9+B3#gF!,1<
+CQC.AU+^l+<VeJFCB9*F*),+/g)99BPD?sF!,R<@<<W)ATT&)BOPdkARlol+Dbt<+CT;%+E_aJ
@;Kb*3XlE*$6UH6+<VdL@4<=.F_>?4+CT=6BOu!r%144#+<VdL+CZcBDJsV>G@bT,+Co&)BkM<p
A.8kg+<VdL+<V+#+<VdsATW$.DJ()9DfTA2Ch7d$C`m5$@;]^h+Cf>4DKKqBDfp.EDe:,6Ea`Km
FD5Z2@;I'0ATDj+Df-!k+<Ve:Df0Z;DepP;H#n(=D0$h6F!+n-F)N10+E1b'DD!%S<+oue+EqaH
Ch+Z*@;BEs8l%ha$6UH6D/XH++E_a:Ap%o4GA2/4Dfp.E@3BW*B5VEqBk(RhF<GLFATDHq@:UKp
DI[]u@<6!4%13OO+<Ve+BPDN1@q]:gB4W30Dfol,+ED%5F_Pl-+CQC&BOPdkAKZ)5+EV:.+C]&&
@<-W9CghU-F`\aEAdo(i+<Y3'FCAWeF(HJ+Bl%@%+ED%2A7]dqDJ()2Eb0E.Dfp+DA79Rg@UX=h
F!,UCEb/Zi@:F%a/e&.1+<X5uGAhV?A0>PoG%De<D]i\2+EV:;Dfo]++CQC'F_u(?@;]TuEb0<6
DfTDA+<V+#%13OO1asP7Df0W1A7]d(@:Wn_DJ()+DBNA*DffZ(EZf=DF<GL@FD5Z2+EV:*F<GdG
F_kS2F*)>@AKZ)+G]Y'=AScHsEt&I!+<YB9+EV:.+CoD#F_t]-FCB9*Df-\-Df'H3DIm^-+E(j7
DdmHm@rucE+<XWsBlbD8E-,f4DBO.AF_kRt$6UH6Df0B:+C\n)AU%crF`_2*+EqL1DBNt2EHPi6
FCeu*@X0)<BOr</F(KAE+<X6t+EqaHCh+Z&DI[]u@<5uh$6UH6FD,5.F*VhKASlK2@rGmh+EM7C
AKYH-+DkP4@V$Z;0J,+8+Dbb0ATJu'F`\aMDfol,%144#+Du+>+CSek+CT/5+E)41Eaa'(Df0!"
+E)F7EbK#mA0>K&EZeq7FCAWpBlds!A0>f0ATD4$Bl@m1/e&.1+<XWsBlbD=H#R=;De:,1E-,f4
DII?(A7]S!@3B/j@qfanFEo!CF!+n-F)N1<DfTD3Bl5&8F`(b"$6UH6GA2/4+EqL-F<F-tA7]=h
+E_a:Ap%oB+<XBsF*&OJATDj+Df-\-Df0Z;DepP;H#n(=D0$hAEa`Hn+:SZ#+<Y*/C`m5$@;]^h
F!,RC+Cf>#AM,)J9lG)p+Cf(nDJ*O%+CT;%+EVX<G%kB$+CT.u+DGk:ASbq$@;^0>%144#+@1&k
FD5T'+D5V(F!+q;+CT)&+EV:.F(HJ9G@b2uF!,")B6%EkAKZ).AKZ,;Bl%L*Gp%$;%144#+Cf>#
AKYZ#F*)>@GqKO5%144#+B3#gF!+t+@;]^h+EqaHCh+Z/AT;j,Eb-A%+DbJ3Dfp.E@q]:gB4W3-
D]j.8AKXB:6V1$E<$6'sF`%Wq+<Ve9F`\aMDfol,+Du+>+DG_8Ec5K2@q?ckDL!@6Bl7@"Gp$X+
FCAWeF(HJ.DI[U%E+*j&@Vfb#Bk;?<%144#+:SZ#+<X'`Cij).@rGmh+EqaHCh+Z%@<Q3)FDi:8
@;]UlAKZ).AKYl%G9CsKEckl6F`M%9@;]TuAU%p1FD5W*%144#+CoD#F_t]-FCB9*Df-\-De*E%
GAhV?A0>PoG%De<D]iM#+Cf(r@r#Xd+CT.u+E27?F(o*"Gp$O+C3=T>ARmD&$4R=O$;tGFASuT4
6YKnGB4Z-,FDi9o:IHfE$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+/M.D=1,pCODg!6Y0JGF.0f(jH3BAuV%13OO%15g<DL!@7BOPdk
ATKmT/KdV-G@>P8DJsV>F`:l"FD5W*+EV:2F!,"3@s)X"DKI"BD]in8F*%iuDe:,6BPDN1GAhM;
+Eq78+Du+>+Du+>+Du+>ARmD9+A!qsC`mM)AT/c$ATW$*EZf7<FCfM&$>FB#FD,5.Ap&3<Eb-jG
+@p'aAKYE%AKZ&4D.Oi'BkM*qBkM+$F#ja;%14g=+@C'bG%G]9ARlp*D]hXp2D-[=+>"^XBPDN1
G@>P8@3BDqC2\,8E+*Hu+CT=68ge[&@UX=l@grcREbBN3ASuT4F*VYF@<`o=@<3Q$BOPdkARmD9
+B3#c+Cf>#AKZ2*F!+t2DK]T3FCeu8%13OO1+=>ADJX$)AKYYtCiCM*A7T7^+=LuCA8#OjE%)5'
%14m?+@:3`F!,(/G\(D.Bl5%AA8Z34+=L`<D/a5=+CT.u+E)@8ATAo;DfTB0/g(T1%14p@+@Kpb
FE2))F`_2*+E).6Bl7K)@X0)<BOr<$+>ti+1*C"9A8c?.E+*6l@:s-oD..<jB4Z*+@;]Tb$=S$!
<+ohc8l%ht:gn!JF"Rn/%14sA+@L-XF_t]-FCB9*Df-\?DId=!B5_L%B-:c1FCf?2Bm+&1Eb-h6
A8--.FDi:BAS,ai@rri8BOr<'@;^?"$=daXDJ*O%+E)F7EZfI;AKZ80@<-EA%13OO2CTbDDg*=F
FDl26DJ()#Cht4d:IH=HDfp)1AKY])+EV:.+Co1rFD5Z2@<-'nF!+n/A0>MrDImisFD5W*%16N[
C`m8&F*)G:@Wcd(A0>JuCh7Z?%13OO2^okA:IH=HDfp)1AKY].+Du+A+E1b0FDQ4FF`(`$EZe;'
@Wl='F(oQ1+Cf>-FE2;9/g(T1%15'D+AHcbBkD'jA0<:;@;BF'+=M)CF"&5RD]j">De!@"F!,")
E+NotASuT4@rGmh+EM+(FD5Z2Et&IjDBNS4Dfp"A@;]TuF*22=AKYYt@:WqiF"Rn/+:SYe$4R>A
BPD?sF!,RCA8aL<$8!h]/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M.D=%14g=+@C'aE,9*-AKYN%@s)X"DKK</Bl@l3Eb0E.F(oQ1/g)9.
+CT+0E,8s#DJ=!$+EVgG+Eh=:F(oQ1Et&IpAfs]A6m-#Y@s)X"DKK</Bl@lA+<XWsAKYo/Ch[cu
+Eh=:F(oQ1+EV:*F<G:=+Du+A+E_R4ATAo'Df0W<Eckl6Bl@ku$>FQ(@s)g4ASuU+Gp$d=F*(u(
+C]U=7rN<YCh4u8+E).6Bl7K)A8bt#D.RU,+EVO?C`k--EbTW,Cj@H^+<XWsATMDl$=n'bF_t]-
FE8R7@;[2sAKYN%GA_58@:Wq[+CT=685r;W/g)9<BOu'(FD,5.85r;W+CoD#F_t]-FD5Z2+DGm>
DIm6sCj@-4$=e!kE,9*-AKXPeGA1l0+Eqj?FCcS9Df'&.8g%V^A7Zm*D]iP.DK]T3F<G:>+EVNE
9OUn3=>FG?+<XWsAKXZT<+T/SGA1l0%16QU+E_a:A0>u4+D58'ATD4$AKYD(F(oN)Ch4`"AS,Xo
Bln'4AKXf;7Nc5[@s)X"DKI"CBOQ!*GA1l0+C\n)A8-+,EbT!*FCetl$>FB#FD,5.@UX=l@j"B>
6m-#SF*)G:@Wcd,Df.0M+AZlkBl7K)A8bt#D.RU,F!,[@Cht53Dfd+2AKYMtF*)G:@Wcd(A0>?(
F:ARuBl.g*Gp%-=An?!oDI[6g/e&-s$8O%Q6Z6jcATDl8-u*[2FDl)6F"&5CEcQ)=+CT.u+Dk\2
F(&]m+D>2$A8GstB-;;7+EV:.+EM%+ASl!$F`V,)+C]U=FD,4p$?($"ATAnc:IH=8CghC+ATKI5
$4R=u.3LoeA0>u-AKYT'Ci"$6Bl7Q+DIn#7GAhM4F#ja;%144#+CQ]A.!TWG.3L2o+Dbb-AKYN$
C`m20F<GX9@<,jkATJu&Cht57AS5^uFCfK(A0>Ds@ruF'DIIR"ATJu+DfQt<@;TRs/e&.1+<Y,B
+=L]:CagJY/KekDCLnW!DJUG)F`\aIARTUhBOu6-@;Ka&@s)g4ASuT4E-67FA8,OqBl@ltEd8d:
@:O(qE-!.6DfQt<@;TRs/e&.1+<Y/C+=L]3ATT@D+>#/fAU&<;@:OD#+=M,9D.P8A@;L't.3N&:
A0<:<@;TR,@r,RpF"DKCCis;<+EV%$Ch7Z1Ao_g,+C\bhCNXT;%144#+<VdL+<VdL+<VdL+EV:.
Eb-A;Bl%T.@V$["D]gH;E-67O+EM77@q?cl@:O(qE-!-r<Duj>:.82P;BS:p+@/\#78cQB/e&.1
+<Y2D+=LcBF"&4`/Kf(FB6A$!EZeq<E,oN2F(oQ1+D,b4C`mh2G]Y'LARTUhBOu6-@;Ka&@;Ka&
DdmHm@ruc7Df-\:@<?08%13OO1asP5A7Qg"DfTD3Cggdo+>"^RAS#Bp@3A0<6m+g-F*&O$Ea`I"
Bk(^q/0IP\6m,HIDepOmEc5T2@;TjqDJ(R2$4R>".3M>nCLnVsDL!@7BOPdkATJu7AT;j,Eb/c(
FDi:CF`;;<Ec`F(<(8hiFCf]=+=L`<A7Zl=2CTb_DBNe)@rcL//e&-s$4R>A:IIuc8l%i^D.GC\
%13OO?qO3_?m&EE6r+7!4Ztqk4Ztqk4Zs5]%15pCDIdI!B-:W#A0>B#DKBN&ATD?m+Cf(nDJ*O%
+D,P4+CIf;6sq-GDIal(FE8RGF^eis@<6L$F"SRE$<1\M+C\c#AKWce+@fF'6m-8VGp$gB+EMX5
@VfTuDg#]4+EV:.+Dbb(ATVX'AKYo'+CQC7@<63:+:SZEEc6/CAKZ).AKZ#)G%l#3Df-\2BleB7
Ed8dGAfu2/BlbD/Bl%?'FDi:BAThd!G9CC/@;]^hF"SRE$:/KLD_*#OART*l>@;,YF*)>@GqNrE
?sP0oFEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[W9@Vfsl05Y-=FCfJGC2[W9BPDO0DfU+U
D.G(<%172q+EM+*+EqL-F<E&A@ruj%Ci"A>B5_l7Bl.g*ASl!rFCeu4/g*u,@;^-/A8`T.Dfd+>
ARf:mF('*'Cj@.?@<?($BjkglH=\]<$4R>3DfQtGARTV#+A!\h@<Q3)D..-rFCAm$ARlol+E2@8
G%#K(+E2@>C1Ums+Dbt/+EV:*F<G:8@r-9uATJ:f?qO3_?m'Z3Ebd9M8K_n^G%G\:,&h[6Ch[s(
ARlu-FD,B0+CoD#F_t]-F<G16EZfI;AKZ&.D/a<&+ED%%F)Pq*$?TriF<F-tA8,Rl-ZgJT@;^00
FDi:9D/a<:+EV:*F<F-t@;R,sDf'?*FED57B-;;7+CT/5FD,B+B.b<%Dg*<q+CT+0@rH4$BlnH2
DJ'CcFDi:6Bl7X+BPD?s+EV:.+D,2/+ED%1@;0UnDJ()"8l%i_+D,1nFEMV8F"SRE$4R>M>@M/V
Bl5MEDe*cl?k!GP$8F.U?p%dT2fF"RG&_27H?Ek?F(]N93Aig1@W??B?Tqj?8SrEeDg#\7@;]Tu
AU&<.DIakt8l%i_+DbIqF!+n/A0>T(F*2M7+EV:.Gp%-MDBNk8+DbJ.ATAnc+EMgLFCf<1/g*hr
@WMtc+<Ve?@<Q3)@q]:gB4YTrBl5&6ARf:hF<F0uG%G]8Bl@m1/e&-s$8O4V?p%e-F_Ng]E&DNP
H$F(7GB@>0@5Vt@Ao9;J?Tqj?8T&]_F*),/@<?''AmoguFEo!$:IH=ADdd0!F(96)E-*4>@;BRp
B-;D3ASrW4BOu3q+CT;%+E1n4Bl@O'+CHg0+CT.u+C].qDJO;9+CH="+<YB9+E1b2BQGd8$6UH6
:i^J`Ch7H+Ddmd!Ecu#)+EDUBDJ=!$+EV:.+CK%pCLpjhDdd0`F(96)E--//+EV19F:AR"+<YlB
FD)e=BPDN18l%htE+*j%3Zqft3a>[+ATDis8oJB\/j`u^ATD$ODIl4VBm+&1/KdYo@r$.(DBM;b
D/`p$Bk;?jC2[Wj%13OO?s@2[A1_nAA8ba]%16QeBl%<pDe*QsF##IF67s`sF_PZ&C2[WsC3(M=
/M/)fE+EC!ATJt:@rH4$ASuU$A0>W*A8,e"+EM%5BlJ08+<YB9+<YE;A7oUu%15is/g+\=Eb/a&
DfU+U%15is/e&._67sC(ATD6gFD5SQ%15is/e&._67sB'+ED%5F_Pl-+=Cf5DImisCbKOAA1&KB
+<XEG/g,(AFCAm$+A,Et%15is/g)8Z1E^UH+=ANZ+<VdL+<VdL+<VdL+<VdL+AP6U+Cf5+F(HJ&
DL!@CE+No0A8,OqBl@ltEbT*+%15is/g)8ZDe'tP3[\Z\A7T7p+DPh*+E_d?Ci^sH+AP6U+E)41
DBNJ(@ruF'DIIR"ATJu9D]iIu@qB_&+EV:2F!,O6EbTK7%15is/e&._67sB'+>G!ZD'138F_PZ&
C2[WsC3(aF+AP6U+EDUB+DPh*+DkOsEc3'K0d(O[E,]i/F)to6+DG\3Ch[BnF<G9ND^c,&:-pQB
$;No?+CT>4F_t]23XlEk67r]S:-pQU:2_7dEcQ)=+Cf(r@r#drB.aW#:-pQU;IsijBl[d++EMX5
DId0rA0=JeE,ol/Bl%>i$;No?%15is/g+SFFD,T53ZoP;DeO#26nTTK@;BFp%15is/g+YEART[l
A3(hg0JP:sF`&lg%15is/g+Y;@;]^hF#kEq/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+/M/P+
/M/P+/M/P+/M/P+/M/P+/M/P+%15is/g)l'C3=DJ2]uO>A7]9oC2[X%Ec5Q(Ch555C3(M4De*fq
Ec#kMBkh]3C2[X*F(KB%Df00$B4>:b/no'A%15is/g)l+@;p6@1*CUKD/XT/A0?21Bl%@%+>"^S
F`_SFF<G+.Eb/a&ARlp*D]ie5A7oUu+E_R4ATAo%Ch[Hu%15is/g)l.DJs\P3?VpJDII?(@q]F`
CER_4@<<W9EbTW;ASrW&Bl%@%+D#e3F*%iu:-pQU1,*HODDF$kF(fK9+Eqj?FED)3+D,>(AKYr#
FD,_)$4R>PDe!p1Eb0-1+=CW,F(H^.$=e!aCghC++EVI>Ci<fj5s[eYEaa$&3B9*,4ZX]55s[eY
Eaa$&3B9)I+BosuDe3rtF(HIV-UC$aFE1f2BK8(5-OgDmDeX*1ATDl8-Y[=6A1%fn%15is/g,1G
@rHBu+E)41DBNJ(@ruF'DIIR"ATJu&DIal.E+No0C2[W*A8,OqBl@ltEbT*+%17#lD`p-(I4cXQ
Bk/>?%17#a+?MV3C2[WnATf22De'u5FD5Q4-QlV91E^UH-RT?1%15is/g+b;FCSu,Eb065Bl[cq
+E_d?Ci^_-DIal5ATDj+Df-\>Ea`HnBl7Q+DJsZ8Et&IuD/a<0@j#DqF<Gua+D5_6+=CW@Bl%<p
De(4)$>OKiG%G]8Bl@lP3Zot;0RHDf6rm#M%13OO:-pQU@;KXhDBN\4A8,e"+Co2,ARfh#Ed8*$
8l%iF8Q8;X6qL!L:dJ&O4ZX]0/giqY8LH&NCi<g)Ap@Zi8l%i^?V4*^DdmH(HS0Y++u(3.:dJ&O
?XH`2?XHE$6uQOL%15^'6q9gJ8l%iH8lJPP<(K/5+DPk(FD,`,E$.bK6q9gJ8l%iH8lJPP<(JPf
C2[WqBll"CDe*QsF"\mM$4R>;67sBnASu("@<?''@rH4$ASuU$A0=K?6m,uU@<6K4F(96)E--.1
$>O'e@<6L$F$2Q,4$"a(De'u*De*p2DfTD3C2[WnDdji(De*]nCLnW'De+!4Bl"o,De*s.DesJ;
C2[X$DC5l#C2[WpBl%@%4ZX]64>J$d0e"5^@;BF$4s4TMCghC+ATJ:f%15is/g,1G@:UKjCghC+
+D,>(ATJu'@:O'^$7KY!CghC+ATJtF-8%J)4==ZJF=/M#3ZrHS@:U];4s525+u(3TDe*HoCh7Ys
$4R>;67sBjDes6$@rri:@<-(#F`S[B@:O=r+EM%5BlJ08%14J'@j#i5@jaE#+>b3RATT%V3[\Z\
A8lR-Anc'm+DPh*E+*d(F!,49A9Ds)Eas$*Anbme@;@5"$7L6R+u(3]EapO]3Zrc1+u(3]EaoOc
%15is/g,:UA79Rk+Co2,ARfh#Ed8d>Bl%@%%15Qr9LVlC3Zohc@r,RpF(KD8/0K9l+u(3]EapO@
/1)u5+?V#(Bkh]:%15Qr9LVlC3Zoh58l%iF8Q8;X6qL!L:dJ&O.3L/g/j:CI8PDQO%14dOC2[Wn
@<<V7+<VdLAp890FCcS9BQ&*6@<6K44"u"N8PDQO%14dOC2[X(FDl22A79R&Ap890FCcS9BQ&*6
@<6K44#)(O8PDQO%14dOC2[WnDdm6cF<D\KAp890FCcS9BQ&*6@<6K44#2.P8PDQO%14dOC2[X"
@;BFb@<<V7Ap890FCcS9BQ&*6@<6K44#;4Q8PDQO%14dOC2[X*FD5Q%@<<V7Ap890FCcS9BQ&*6
@<6K44#D:R8PDQO%14dOC2[X)Df9H5A79R&Ap890FCcS9BQ&*6@<6K44#M@S8PDQO%14dOC2[X$
DId0t+<VdLAp890FCcS9BQ&*6@<6K44#VFT8PDQO%14dOC2[X%Ec5Q(Ch4_3Ap890FCcS9BQ&*6
@<6K44#_LU8PDQO%14dOC2[X%@<-4++<VdLAp890FCcS9BQ&*6@<6K44#hRV8PDQO%14dOC2[X*
F(KB%Df00$B4>:b+D,h<Blmo/F(fK9E+*g/+?MT17S-9B;[j'C$;No?+Cf(r@r!3/BOQ!*Anc'm
F!,%=BleA=Bl5&)G]75(FCeu*A8-'q@ruX0Gmt*/1E\_$0I\,68PDQO%16f]/g)Vr04I's+D,20
BleA=Gp$X9/e&.1+EMC<F`_SFF<Dr@Df'?&DKKH#+DPh*Bkh]3F(96)E--.DF`:l"FCeu1%144#
F)>i<FDuAE+A,Et7nHZP:IIcH;c#bZ8.>o;Cia/?%144#F)>i<FDuAE+=BTU;GU15/KenEF)u&5
B-:]&D/Ej%FCeu*C2[WsC3(M=@rc:&FE8QV4sqI7+F,(SINU3p@LWYe+CT>4ATDlF+>=p567sC)
BQ%<%@rHR#Dg<K8$>"*c/e&.:%13OO:-pQUEb0<6DfTD3DfB9*+Co1rFD5Z2@<-'nEt&IpA0>f/
D]i7,1E^UH-RT?1%16T`@s)g4ASuT4-XpM*AL@oo@rGq!@<6!&4EPFZCi<fj5s[eYEaa$&3B9*,
%16c_F*)>@H"q8.1,fXL%16`ZDImisCbKOAA0<HH@q]:gB4W3!BleB7Ed8*$4Ztqk4Ztqk4Ztqk
4Ztqk4Ztqk4Ztqk4Ztqk%13OO,9nEU0eP.40d&%j9jr'PBHT&i/0H]%1,'h!;f?/[@;I&SBleB)
DI[BuB-9WRBln'-DCH#%%144-+CJr&A7KakAM.\,DdX\rDIaktC2[WmF^eo7E,K;r@:Wn[A1e;u
+<VdL%144#+<Y`:ANCrAC2dU'BHS[O04AC%Df0VLB4YslEa`c;C2[W9C2[WnDdt/&%13OO+<VdL
<HD_`F_i14DfQtAATW$.DJ((f;]odaDf0V=FD,*)+C]A"DIak^:IH=9Bl[cpFDl26ATKI5$4R=b
.Nfi^F(KH&F_PZ&A8-(*.3NJGA8,XiARlp*D]iP1ART[l+CT)&+EV:.+Co2,ARfh#EbT*+%144#
+<Y]9EHPu9ARlomGp%3BAKYhu@rcK1-t7=5Ch.:!A7TCqFE2))F`_>9DCI1\<+oue+EM76E,96#
Bk;>p$6UH6+EM+9FD5W*+E_WGDIn#7D.-pfBl7L'+D,P4+C]J-Ch.6tB-9fB6m,oKA8c@,/g(T1
%144-+<Y'#A7TLp@:XFhEbTK70jl,ADg*=<DKBr@ATJu8@rc:&FE8R5A7T7^+EVNE@")U(DJ!Tq
>]Y!qEccGC/no'A?k!Gc+<Ve?@<Q3)?nQ/.F'p,%G][M7F(oQ1F"SRE$4R=e,9n<c/hen3+>"^(
ARf:g@V'R&3@l:.0JPR1-q7cVFEMV8+@C'aE,9*-AKXl^Ch7$rALS&q%144-+CJYkATV<&Bl.g*
ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3l=(ubi+EV:2F!+n%A8-."Df-\+ChsOf+<VdLE,8s#DIm?$
8l%htAn>CmF`M&7+CT;%+Cf>,E,9*-AM,)pEc5e;DJs_ADf-[i:IGX!+<VdL@q]:gB4Z-,GA1l0
+Cf>-F(o];+E(j7@Wc<+AncL$F!+n/A0>f0FD5T+H=:o0Df0VK%144#+<XU)@:EqeBlnVCBlbD7
Dg*=GBOr<!DddH7%13OO+=\L<?t*b[FC64`F`;VJATAne@:ELjBQS?8F#ks-B5)I$F^ct5Df%.:
@;BFpC1K=b05>E904Ja9@P;S,F*(u605>E9DJsW.@W-1#F"^O7Bl7Q01,)<r6mXTB6=FA>F`8W^
0Lo\r/no9MDIP%($4R=b.NieND.Oi,@:O=rF!+n/A0>u*F*)IG@:X+qF*(u(+EVNEF*2G@DfTqB
0fU=;1a$:A@;]^hF"Rn/%144-+Dtb7+CJYkATV<&FCfN8+Cei$ATJu.DBMPI6m-PhF`Lu'+Co1r
FD5Z2@<-'nF"Rn/%14=),9SZm3A*<P3?Tmr6$6g_F*&N[3@l:.0JPQs$4R=b.Ni\=FCSu,Eb0&u
@<6!&AncL$F!,OG@<-I4E$/b$Bl%p4AKYT'EZdss3A*!?+C\o(@4c.8@;]Tu@V'h'DIb@/$4R=b
.Ni+n6!-lJ9grG4Bl7F$ARTXkA0>u4+>GW2+D,Y4D'1_j/g+,,BlbD9@<,dnATVL(+Cf>-FE2;9
F!,R<AKYhuG\M#;D%-gp+<VeCASu.&BHV5*+DN$:@;TRs+EV:*F<G(%DBND"+EMXCEb/c(Bl5%c
:IHfX8TZ(b@;[2sAKZ&*F<G[D%144#+<Yi9Cis<1+C\o(G@b?'+>G!IDIakF2)Quq$4R=b.NfjA
Ec#28+CK53FC65"A867.FCeu*FDi:CF`;;<Ec`F6BOPdkATJu9D]iFB3$C=>?nMlq%14=),9SZm
3A*<P3$9dq7V-%LF^]<9+>G](+>PW*3?T_N@;KLmFD5W(-Z^Cu@<j:2$4R=b.Ni,>G]R78Bl.g*
ASl!rFCeu*/Kf+GAKYAqDe(J>A7f3Y$4R=b.Nhr'Ed2Y5+A-cqH$!V<+A?3Q>psB.FDu:^0/$sP
FD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG=De*a(FCep"DejDI<HDklB-f;e8l%i$
1,)U;B6A$!E[<Ip7<iclATMp,Df0VKBlJ?8@OV`n%144-+A-cqH$!V<+Du+>AR]RrCERe3EcYr5
DK?q=Afs]A6m-;S@WNZ5AS!n3$6UH6>=q[Z+DbIq+Du+>AR]RrCNEc0BQS?8F#ks-B5)I$F^ct5
Df%.:@;BFpC1K=b05>E906D5GAM7n/F*(u605>E9DJsW.@W-1#F"%P*%14=),9SZm3A*<P2BXRo
:LeKb@V'R&0f1F(1,(FB%13OO+=\LAD/O/t+DG\3Ch7HpDKKH#+>"^WARuulC2[W8E+EQg%13OO
+=\LAATV<&@:X+qF*(u(+EVNEF`V+:?tEk_FC/crF'i;tF`(`$EZea^85inK%13OO+=\KV@q]:g
B4YTr?u0I`/0J>8De*d(?m'Q0+EM[EE,Tc=+Cf(nDJ*O%+EVNE?njVa3](4s%13OO+=\LA779L=
:/aq^7:76ZATT&/DBN>+Ec5Q(Ch555C3*c*/Kf1WAS-($+D,P4+EM+9FD5W*+E2@4An?"'ARlok
C1D1"F)Pl+/nK9=?m'#kBln96/e&-s$6Uf@?qO?n:1,Uq?r1!*85Dug/0J>!;+t@?D.-ppD]it;
FD5Z2+EV1>F<G(3A7]g)@:Wn[A1eujCht4d:IH=B@:O=r%144#+<Yc;G]Y'BF!,OGDfTE"+CT=6
@X3',F"SS7BOr;rDe*E%BlbD*+DbIqAS`tA8TZ>$+E_a:Ap%o4FDi:1E,]W=%144#+<Yc>AKYet
@V'@s+CT=6?qO?b;Fs\a?m'Q&G]Y'BF!,%=ARfk)ARlp-BPD9o+E)@8ATAo8H#R>9+CT;%+Du+>
/e&-s$6pc?+>>E%/ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6Uf@
@:Wn[A0>8S8Q\DL:KBn^?m'?*F`&=DD]iG*@;TRc@<?Qu+>"^QBm=3"+CT>4BkM=#ASuT4Dg#]4
EbT&q+EV%)/e&-s$6Uf@Anc:,F<F1O6m-M]Ch7$rAKZ)5+EV:.+Dtb7+BqHZDe=*8@<,p%7qm'9
F^eW)BQS?8F#ks-B5)I$F^ct5Df%.BF)PZ4G@>N'.3N&0A8c?.Eb03.F(o`7EbT*+/e&-s$6pc?
+>>E./ibpJ+>"^1@<itN0e=G&0JPO0.!0$AF<GL6+A-]nAor6*Eb-@`8Q6gQAT2R/.1HUn$6Uf@
6=jh=G%kl;EZf:4+CJ`!F(KG9-W3`9<(9YW6q(!$4"#JD9M\/+?m&rm@;]^hA1eu6$6UH6:i^8g
EZfIB+EV:2F!,L7Ch7$rAKZ#)CghF"G%De:Df9_?AoDKrATDi7G@bf++D#e:@;]UeA.8kg+<Y*1
A0>u-ASrW!A7T7^+EVNEFD,5.?uoguBlJ08+=D=[?m'9"F*'#W<+oue+ED%7F_l/2A0>T(%144#
+CK8#EbTK7F'p,,Bl7L'+Dbb-ANC8-+<VdL+<VdL%13CJ<+T0DE`[4)D/:=;6TQl#F(KB505>E=
DDEn"0J@0ZA1qJ3@rj;E@rc:&F>$U)=CuSTE-Q59/no'A%144#+<VdL+<V+#+<Ve%Dg*=3C2dU'
BODr4@rH6sBkMR/ARm85F*)G:DJ+#5@<,p%DJsV>AU&0&DId<h+ED%7F_l/6DJ()+DBKAq+<Ve7
F(96)E--//+Dbb0ATJu1Bkq9@%144#+<VdL+<V+##mjRB=CuSTE-Q59+<Z,"9M\/3<+T0DE`[4)
D/:h=C3'gk#mh%J+<Ve+BPDN1@rH6sDfT]9+EVNEBQ&);?uoguBlJ08?m',kDIdQpF!+n%A8c@,
/e&.1+<VdL+<Vd9$4.#XCi=D<+<Z,AA7TUrF"_0H@;omo@rj;BCi=DKE,9H7/no'A%144#%144-
+B*E%E,Tc=+D,P4+A*b7/hf"&ASu$iA0>;uA0>;sC`mn4EcYr5DK?q>EbTH4+EVNE8g$)G0K1+_
Eb,[e+<VeEDg*=BDBNb0An<*+F`;;<Ec`oC$4R=b.Ni,:@;TRc@<?Qu+Cf(nDJ*Nk+EVNEAncK4
Bl7HqEb/a&+Dkh;ARlolF)u&.DJ`s&F<G.8Ec5tN%143e$6UH6+<VdL+AP6U+=Ll=Ddmc:+Eq78
+D,%rCh[d"+E)-?G%G]'F!,:5CLnW1BPDN1%144#+<VdL+<XEG/g)_gFD,6+AKYE%AKYl/+Dkh;
ARlolF)u&.DJ`s&FE9&@#n74a+<VdL+<VeDBm=3"8T&'QEb/a&6$%*]B5U.YEc5t]3Zp7%3Zp*c
$6UH6+<VdL+=KrqFD,T'6#pU\D.RU,F"'7)+>=63+<VdL+<VdL-t[U>@jsQ%+Bos=+>=of+C,E`
+<VdL+<VdL.1HUj#n74a.Nh#"DIn#7DIIBn+CT.rCjC)9F!,R5B-:S14?=oS3aa(D@<3Q#AS#a%
@:Wn[A0>u4+CK(qD.R3cFE:h4FDhTq+<VeFG%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F"SS7BOr;u
Des6.GA1r-+DbV%Bln'+@<?''8g&(]FED)7DBKAq+<Ve@F!,UHARlotDBN@1DKTf*ATAo3Afs]A
6m-\lEb'5D%144#+:SZ#+<VdL+<Ve%67sC!G%G]7Bk1ctD/"6+A0><%F(o9)D.RU,F!)kn3[m3Q
%144#+<VdL+<XEG/g)QQDCH]:E,]AsEcW@FD]iM#+C]82BHV,0@ps0r@;]TuB5DKq@;HA[+<VdL
+<VdLA8XO_+=K?Z14:chGUXad-8%J)6r[)V=@5gm$6UH6+<VdL+=Lc<.6T^7A79Qh$4."J$6UH6
<+ohcE,oN5BlA-8+Cf(nDJ*N'AU&04F(Jl)FD,B0+DGn<F_)\0DBMPI6m,uXA7[A9:Ng;iEbT&q
+Cf>,D.RU,Et&I!+<Y?+G%De*AS#a%@:Wn[A0>u4+A,Et+EqaEA9/l9F(oN)+EV:2F!,F1FED)7
DD!%<#n74a+<VdL+<VdL+:SZ&,9n<b/ibOE3A;R-+@]pOEckf2Gp"k$/0H]%0fKOK%144-+CJc&
?m&lgC3=T>ARlp*D]iM#FED)7+EM[EE,Tc=+D#(tFD5W*+EqL1DBNtBDJj0+B-9fB6k'JG+<Ve@
DBN>%@rH7+Deru;AU%co+EM+8F(oQ1F"SS6ARuulC2[X*F(KB%Df00$B4>:b/no'A?k!Gc+<VeK
D]j+4AKYZ)G9D!G+Cf>-Anbn#Eb-A'Df'?"DIal+Bl7K)ARoLsDfTnO+:SYe$6UH6+<VdL+AP6U
+B2osF<G.*Bln96+EVNEF`V+:GA(Q*+EDUBDJ=!$+A,Et+DG^9-u*71DKB`4AM.P=ALSa?DBN"p
DId[0F!,OLF*(u1Et&I!+<VdL+<Ve%67sBX<%gj7;]oRgDJ!TqF`Lo4Bl@m1+CT;%+Du+>+Dtb#
ATMp$EbT?8+CT5.Ch[Hk+D,P4+=Lu7Df0W7Ch5//G\&<5$6UH6+<VdL+@S[c:JOha9LW;sC2[X*
FD5Pu4ZXr76TSIKEc5T2@;R,VBl%@%+=MIo2CVmKDffQ0@:Ul=>]+J%AT2'g.k<5`G\&'H%13OO
+=\KV?tsUj/oY?5?m'T2A79RkA1e;u%14=),9SZm3A*<O2]s[p9jr'PBHT&a/0H]%0fC.&F)Pl/
F*),+ALS&q%144-+CJc&?m&lgC3=T>ARlp*D]j+DE,]`9F<Ft2C2%3i?nNQo:IH=<ASu("@<?'k
+EV1>F<GI>G7=m%+<YTAASuQ3Bl5&$EGB2uARHWlA8-.(EZfR?DId[0F"SSCEGB2uARHWtF`VXI
@V$[)E+EC!ARl5W+<VeKD]j+DE,]`9F<G[=BlbD/ART\'Eb-j4$6UH6%144#+<VdL+<XEG/g+_9
BlkJ3DBNq6Bk1ca$6UH6+<VdL+D#(+-[0KLA8YgmAL@oo+<Vd9$4R=e,9n<k/ibOE3&Vm2+@1-_
F`VXI0eb.$1,(F?%13OO+=\LADe*5uEb/ZiC3=T>ARlo8+CSekARlokEb065Bl[cm+Cf>,D.RU,
ARlp%F`\a7F!+k2AT;j,Eb/Vf$6UH6+DkP4+Du+>+CT)1@<lo:AU%crF`_1I%13OO+<VdL+<VdL
+<Vd]+E2%)CEPJWDe't<-OgD*+<VdL+<Ve%67sBQ:IH=GAS5^uFE1f3Bl@m13Zp.2+@1-_+>PW*
2'=V/3\WBO1c,XK+<VdL+<VdL:-pQUEb065Bl[c--YI".ATD3q05>E9-OgD*+<VdL+<Vd_+ED%+
A0sJ_I4cX\A1&`I>9G^EDe't<-OgD*+<VdL+<VeIAS5Nr-ZsNFCi^sc-Y#1jC2[W9F`_>6F"\mM
$6UH6+<VdL+<VdL+<VdL/hSb/%13OO,9nEU0J5@<3B/l=/Kd?%B6A9;+?:tq1,(F?%13OO+=\LA
@W$!i+C\bhCNXS=DIIBn+Dbb5FE8R=D/a<&D.RU,ARmhEF(Jo*?tsUj/oY?5?m''"EZen(FCAm"
F"Rn/%144-+<YQ5G9D!=F*&OG@rc:&FE8R5A7T7^+EVNE?tsUjF)Q2A@qB$jA8,OqBl@ltEbT*+
+D,P4+CJYrCg\k)$4R=b.Ni,6De(J>A7f3lF`:l"FCeu*AoD]4?t+"i?nMlq%144-+CK+u?m&lg
C3=T>ARlp*D]j">AS,Y$+ED%+BleB:@<?4%DBNG-D/E^!A9/l;Bln#2?ufguF_Pl-+=Cf5DImis
CbKOAA1(b;%13OO,9nEU0J5@<3B/]8/Kd?%B6A9;+>GDi1,(F?%144#%144-+@.,fATo8=@:p]j
-ndV14ZZsnBlbD;ARfXkDJ=E.A0>?,+CJ\tD/a5t/g+5/ASrW4BPDN1FCAf)BlbD9Eb0<'DKH<p
+<Ve@DBN@1GAhM4+Dbt+@;I'(@;TRs+CT;%+E(_$F`V&$FCeu*@X0)(@rH4'C1&/uDKBo2@:UL!
AftPoBl7Q+F(fK4FCf?$A1eu6$6UH6<+ohcFCAf)?mmTZ.6T_"+E)F7EcPl)ATJu4@V0b(@psIn
Df.0M:L[pYF(8X#Bl@l3@ps6t@V$[)F(Js+C`m>.EX`?u+<YlHEb'56FD,*)+EDUB+D58'ATD3q
+EM%5BlJ08+EqOABHU\:+Z_;b/g)94@V0b(@psInDf-\7@;BFq+DtV)AKYK!@<6*nEt&I!+<Y9)
EZf10F)rI?Bkq9rGqL4=BOr;o@rH4'C1&/qDKKoE+DG^9?tsUj/oY?5?m',kF!+q'ASrW5E+EC!
ARlp*D[d$r+<Y3+F(96)@V$[(BPDN1@q]:gB4W\<%13OO+=\LP@WQI(ATVK+?q=6k9OJuRDe!p,
ASuT4Bl7HmGT_$<D/XT/A0>K)Df$V,DfTD38l%i-%13OO+=\LM@<-!l+Du+?DK?q@ASl@/ARloq
Ec5e;@!-R*Ci`u,FDi:BARopnAKYN%GA_58@:UL%BmO>C%13OO+=\LAARo0kDJs_ABOPdhCh7Z1
-uNI1ALqq7G]YAW@;]Tu-uNI1ALq>-@<6K@FCf]=.3N_@@VfUs/g(T1%144#+<VdL+<XEG/g+b;
FCSu,@UWb^F`8IHATDj+Df0V=De:,#+EqaEA0>;uA0>GoBljdk+<VdL+<VdL-ZW]>DI[c94ZX]p
B4Z0-4?G0&0d%hdEb/]41,0nlAR[AS+ED%&/hf:.Eb/]40K1?g$6UH6+<VdL+D#(+DI[bt$4R=b
+<VdL+<Ve%67sBmATVEq+C\bhCNXS=B6%p5E$/h*@:WqiF!+n/A0>GoBljdk+<VdL+<VdL-ZW]>
DI[c94ZX]@+>G!JB4Z0-4?G0&0d%hdB4tjbA1fSk+C]8-/ho('B4tjbA1fPr-OgD*+<VdL+<Ve<
A0>c"F:AQd$6UH6+<VdL+AP6U+D,2,@qZuo@:O(qE$0"+@rcL/+CT.u+D#(tF:AR"+<VdL+<VdS
Eap50@rs(]3Zp7%@V97o+?V_<?SNZN+EqBL0f'q\Eb-jW3?Vd>@r#Xd/hf((F`8];$6UH6+<VdL
+D#(+DI[bt$4R=b+<VdL+<Ve%67sBmATVEq+E1b2BHVM;Eb'56GA2/4Dfp.EA7]@eDJ=!$+CT.u
+D#(tF:AR"+<VdL+<VdSEap50@rs(]3Zp+!0ea__ATT&C/g+\BC`k*GAL@oo+<VdL+<VdLARlp$
@rr.e%13OO,9nEU0J5@<3B&`:/KdZ.Cj@-[/0H]%0f:(%8T&'ME+NotASu!h+@KX`+@TgTFD5Z2
.1HUn$6Uf@5p1&VB45mrG%De7E-,f4DBNG-A7Zlk?SOBF+D>2)+C\nnDBN@uA7]9oFDi:0B4Z0m
+CT.u+CK/2FC655D[d$r+<Y`JE,]`9F<G[>D.Rd1@;Ts+F(KB+@;KY(@<?4%DD!&5BOu'(8l%ht
B4YslEaa'$F!,"9D/^V=@rc:&FE7lu+<VeNBln#2?u9=fARHWpF<G+4ATJu3Dfd+9DI[L*A7Zm%
@VTIaF<G(6ART[pDf-\+DIal+@<6N5@q]:gB4VMZ+<VeKBl.F&FCB$*F"SS+ASu!h/0K.MASrW!
+CoV3E$043EbTK7+DGm>Ecl7N+DGp?Eb0<'FE7lu+<VeF@VTIaF<G[>D.Rd1@;Tt)+EVNEGA(Q*
+=_)I.NibSDK?pMDJsV>GA(Q*+EV:.+Co1rFD5Z2@<-W&$6UH6DdmHm@ruc7GA(Q.AKYK'ART[l
A0>f2+DbJ-F<G(,@;]^hA1f>S+:SYe$6UH6+<VdL+AP6U+DtV)AM7P6ART[pDf.4E@<6O0F`\aJ
Bl.F&FCB$*Et&I!+<VdL+<VdSEap59FE8fm3Zp+!?SOA[B4Z0-I4cX_AThu7-RT?1+<VdL+<VdL
-ZW]>B682B4ZX]@+C?i[+D58-+FPjb1*CUKG&JKN-OgCl$6UH6+<VdL+AP6U+=MGUF"CsGF"&5?
Eb-A&Dg5i(+EV%$Ch7Z1GA2/4+=L]8@r*S:DIIBnF!,17+EV:.+D,>.F*&OFDg*=4DIa1`+<VdL
+<VdL:-pQUAo)BoFD5W*+D,Y&@ruF'DII?(A79a+-t[QM+F/6XH#7D/A1hJ)+EV=7ATMs%D/aP=
Bl5&8BOr<-ARfXrA.8kT$6UH6+<VdL+AP6U+E_X6@<?''E-67FA8,OqBl@ltEd8dLBl.F&FCB$*
F!(o!+<VdL+<VdL0Ha^W1a$a[F<GdLF!(o!+<VdL+<VdL1*BpY1a$a[F<G4<F!)S7$6UH6+<VdL
+:SZ#.Nh#"DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf78uQE:-hB=?m',kF!+q'ASrW!A7T7^+EVNE
@rH7,Ec5b'$6UH6A9Da.Bl7Q+FD5T'F*(i-E-!WS=(l/_+CJ)9<'a)N5t=@O+D#e3F*)IG@;]Tu
BlbD<ATT&:D]iFB?m#mc+<VeKBl.F&FCB$*F!+n3AKZ&*EbSruBmO?$+CT.u+CT5.ASu$iA0>u4
+CoV3E$043EbTK7F"SS7BOr;sAS,@nCig*n+<VeM@;L't+DGm>?nbt@+CJ)9<'a)N5t=@O+DGm>
@3BH!G9CF1@ruF'DIIR2+E1b0@;TRtATAo%DIal6Bl%Sp$6UH6DJsV>AU%p1F<G:8+Co1rFD5Z2
@<-'nF!+t5ART[lA0>>mAoD^$+EV:2F!,X;EcYr5DCuA*+<Ve+BPDN1@ps6t@V$ZlBOPdkARlom
Gp%-=@rc-hFD5W*+EV:.+DkP.FCfJ8Anc'm+CJr$@<6O%E\;'@Amc_j$6UH6@;]TuEb0'*@:X(i
B-:`!@ruF'DIIR"ATJu+Ec5e;A9Da.+EM%5BlJ08/g+)(AKYAqDe(J>A7f3Y$6UH6AoD]4D/XH+
+Co&*@;0P!/g+/5A79Rk+EV:.+CJr&A7TUgF_t]-FC65"A7TUr+EVNEB4Z0-%144#+EV:.+CfP7
Eb0-1+CJr&A1hh3Amc`mA8-."Df.0M%144#+:SZ#+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF
+Co1rFD5Z2@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g+S5A0>u.D.Rd1@;Tt)
+EVNEA9Da.+EM%5BlJ08%144#+<VdL+<Y36F(KG9-W3B45tOg;7n"de0b"I!$6UH6+<VdL+AP6U
+CoV3E$043EbTK7F!,@=G9CC6DKK<$DBNk,C1Ums+EV=7ATMs%D/aP*$6UH6+<VdL+DkP&AKW?J
%13OO+=\LAD/=9$+Cf(nDJ*Nk+EVNEF`V+:DIn#7?t=4tATV<&E+*cqD.Rg#EZeaf:JXqZ:J=/F
;ID*d$6UH6=(l/_+CJ)C:K0eZ9LM<I?m'$*BleB;+CT.u+DGm>@3ArmE+*j%?m&&a@rH6sBkMR/
ARlnm$6UH6AoDKrATAo$D/=9$+Eqj?FCfM9B4YslEaa'$A0>r'EbTK7F!,RC+EV:.+CJr'@<?0j
+D,P.A7]d6%144#+A$/f?rBcr<(9YW6q(!]+CoD%F!,@=F<G.>BleA=DfQt7F!,@=F<G!7+Cf>-
Anbn#Eb/c(?tsXhFD,&)AoDKrATA4e+<Ve>ASu("@<?'k+EM%5BlJ08+CT;%+Eqj?FED)3+EVNE
F*(i.A79Lh+Co1rFD5Z2@<-W9AoDKrATDiE%144#+CJ)C:K0eZ9LM<I?m'0)+CT)-D]iI2DIn#7
E+*cqD.Rg#EZee.A0?)1Cht53Dfd+5G\M5@+DG^&$6UH6A8,OqBl@ltEbT*++CfG'@<?'k+C\no
DfTD3FD,B0+Eh=:F(oQ1/g)8G$4R=b+<VdL+<Ve;E-#T4+=ANZ:-pQUF(fK9+E2IF+Co1rFD5Z2
@<-W9E+*cqD.Rg#EZfF7FED57B6+Lh%144#+<VdL+<XEG/g,4HF<FIW:K0eZ9LM<I+EVNE@3A/b
@rH6sBkMR/ARloqDerrqEX`?u+<VdL+<Ve;E-#T4+=C&_:K0eZ9LM<I-T`])F`V,705>E9Ec5l<
-OgCl$6UH6+<VdL+AP6U+D58'ATD4$ARlp)@rc:&FE8R5Eb-A2Dg*=JEbTW;ASrW4D]j.8AKXSf
AoDKrATA4e+<VdL+<VdLD/=89-YdR1B6%p5E,K*$AL@oo%144-+A$EhEc6,4A0>H(Ec5t@BOPdh
Ch[d"+D,P4+DkP)Gp$L/C2[Wj+=^f1+D>\'.NiqREb'5P+EM+*+CJr&A8lR-Anc'm/no'A?nMlq
%144-+CK87AU%T*@;]Tu?u0q0?m'K$D/XT/A0>K)Df$V)C2[X)Df9H5?m&rq@<6KB+B<Jo+CK8,
AU%T*Bl8!6ART*lDe:,"F*D2??k!Gc+<Y*1A0>8sG[MY+DfQt.Cijo0/g+)(AKYAqDe*g-De<^"
AM.\3F'oFa%144-+@C'XAKYT'Ec#6,Bl7Q+Bl.g0Dg#]&+DG^9?tsUj/oY?5?m&lqA0>o(G%l#3
Df0V=D.-sd+D,P4+Cf(nDJ*O%+EVNE8l%i-%13OO,9nEU0J5@<3B&]9/Kd>uEbT>42(Tk*0JPF-
-q.QcFCfJ87;$6U7:^+SBl@l<%13OO+=\L+:IH=A@:F:#F`:l"FCeu*FDi:BF`&=?DBN"pDCco)
@:Li29PJBeGT_'QF*(u1F"Rn/%144-+AHQfDfQt1BOPdkATJu9D]iG&De(J>A7f3lFDi:CF`;;<
Ec`F?@:C?hBOPdkATKI5$4R=e,9n<b/ibOE2]s[p9jr'PBHT&c/0H]%0f9CI%144-+CK(uG@Y)(
@q]:gB4YTrFDi:>Dfd+3BOt[h+Eh[>F_t\4F(or3F!,[?ASrVu7T)ZD;c#bI7:76PF!,d?Ec3Q>
$6UH6<c;esD.Oi2BmOK2B-;&"Gp%';Eb961D'3e9DfTZ>+E)-?DImp6DfTV9G&M2>D.Rc2@;]Tb
$6UH6AmoCi+D#G4Bl[d$Gp%$C+<k<3DfoS7+E2.*FCoH3D0%<=$4R=b.Nh>Z6m,r]Bl%=$+Dl%-
BkD'jA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L%AT23uA7]XgAKYo/
+CKM-Bl%@%?m&lgA8c?.Eb0*+G%G2:+CKM-Bl%@%?m&ukE+NotF!,C=+>Ybq@VKon$6UH6=(uP_
Dg-7F@;]TuBlbD7Dfd+@DfTr.@VfU.%13OO+=\LA<+U,m6tp.QBl@ltEd:&qD/`l*Eb0*+G%G2,
Ao_g,+DkP$DBMPI6m-#S@ruF'DIIR2/g+,,BlbD<Bl7R"AISth+<YK/EbAr+DdmHm@rri&F_u)/
A0?#6+EV:.+CJr&A1hS2F'p,$F_u(?F(96)E-*43Gp$^5G%De5AS5F\H$!V=/g(T1+<Ve7<+U,m
6tp.QBl@ltEd:&qD/`l*BlbD7Dg*=FFDl22A0>T(+CJr&A9;C(F=q9BF'p,!G%#*$@:F%a+E)-?
7qm'9F^cJ7AS!n3$6UH6>AA(eFCfN8/no'A>psB.FDu:^0/$sPFD,f+/n8g:04J@*ATDNr3B8a-
De*C$D/aPL@Vfsl06_,J2_SoaA9;C(F=q9BF"%P*%144-+AucoBle!,DK?q;@:WplFDi9u6q/;0
De!p,ASuT4?tsUj/oY?5?nNQ2$4R=b.Nh3!EZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/E,Tf>
%144#+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HV,+<V+#,9nEU0J5@<
3Ahp2+A-coAKW`c/0H]%0f0=H%144-+CJc*FE:r1E+O)u+Cf(nDJ*Nk+EVNEBOPdhCh4`/F`2A5
A0>MrEcl81+CT>4BkM=#ASuU2+Dbb-ANC8-+<VdL+<VdL%144#+<VdL+<W%>FD,B0+DGm>Deg^`
3Zoq\/RU%N%144#+<VdL+<W%>D/XH++D#5"-Ts(),@Dc+$4R=b+<VeKBPDN1@Wc<+Eb0<7Cij6!
+DG^9?tX:o@WPp"D/"'$CghC+BkDX)DJ()0@;TRs/e&-s$6pc?+>>E./iba2/KdZ.DIjqF1b9b)
0JPBn$4R=b.Ni,1FC656E+EC!ARlp*D]j+DE,]`9F<F0u3%cm?+D#(tFDl2@/e&-s$6pc?+>>E.
/ib^1/Kdf,G%GN"ATAnK1+XP'0JP?m$4R=b.Ni,:@pgF&ATD6&@q]:gB4YTrFDi:DEa`o0Ch[a#
F<G.8Ec5u>+D,P4+Eh=:Gp$pADJ()0@;TRs/e&.1+<Ve+BOr<-FCB&t@<,m$8g%YUAnc-sFD5Z2
+EV:;Dg-7F@3BB#D/")7ATDg0EZet4EZf7.D.Rc2AU%]rARoLmB+51j+<Vd^2)QLdBOPpi@ru:&
F"SRE$4R=e,9n<b/ibOE1*A.k9jr'PBHSu`/0H]%0f'7G%144-+CJ\tD/a5t+Cob+A0>;kA7]:(
+CHoH@rH4'C*5T!-[0KLA0>]&F*&d;+ED%1Dg#]5%144#+Cf>,D.RU,F"AGQEb0<'Ecu#8+DbUt
A8,po+EqL5FCfN4@:Njk@;]TuEb/d(@qB]j$6UH6D09Z:BlIm"+C].qDJO;9Ch[cuF!,RC+E)./
+C].qDJLA2Bl7K7+B3#gF!,L7E,oN2ASuTuFD5Z2%144#+DGm>F`V,+F_i1EBOu'(Eb/ZiBl7Q+
@rGmh+CT=6BlkJ=F`;;?ATMp(F!+t2D/Ej%F<G(0F`__:E\7e.%14=),9SZm3A*<G+>"^.@;^3r
Ed8c^3@l:.0JP?m$4R=b.Nfj+:IH=HDfp)1AKYK$A7ZltF!,@=G9C=;@;0Od@VfTuDf-\%7qm'9
F^eW)BQS?8F#ks-B5)I$F^ct5Df%-V/e&.1+<Ve+BOr<-Dfp)1AKY].+Co2-FE2))F`_2*+DG^9
FE_XGEb03.F(o`7EbT*+3XlE=+<Vd9$6UH6+>GJk>AA(e>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De(:>@rH7,@;0V#+EV:.+D,>(ATJ:f+<VdL+<Ve;BleB:Bju4,ARlp-Bln#28jQ-'
+B3#c+CSekBln'-DII?(A8-'q@ruX0Gp$L0De*QsF'p+"$6UH6+<VdLBQ%]tF!,(;Ci"A>@rH4$
ASuU$A0=K?6m,uU@<6K4Anc'mF"SRX<+ohcF*(i.A79Lh%144#+<VdL+A+pn+EM%5BlJ08+CT;%
+<k<6D/aN,F)to'/g:`3+<VdL+<VdL%144#+<WEl+BrT!A7TUg>psB.FDu:^0/$sPFD,f+/n8g:
04J@*ATDNr3B8a-De*Bs@jrO6Ders*+CT)&%144#+<VdL+EV:.+CIlO<+T0>+CT.u+EM[EE,Tc=
Bl7Q+Anc'mF!,@3ARo@_+EVNE@WcC$A0>u-AISth+<VdL+<X9P6m->TDKTB(+CJr&A1hh3Amd5#
$6UH6+<VdL%144-+AR&rATD^3F!+(N6m,]XDfTW-DJ()&Bk)7!Df0!(Bk;?k-tm^EE-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA7Th"E-!HN%144#+CT;%+Du+A+CTG%Bl%3eCh4`-DBMG`F@^O`
/g(T1+<Vd9$6Uf@?t=4tATV<&@Wc<+AncL$A1eurF<Gd9F!+n-Ci=N3DJ()2@<,dnATVL(%144#
+Cf(nDJ*O%+E)-??rBEZ6r-QO=^W@_Bk)7!Df0!(Bk;?<+@KpRFD5Z2@<-'nF!(o!+<VeDF`VXI
@V$ZrDBN@1?rBEZ6s!8X<(11;F*(i4AKZ)5+Cf(nDJ*N'?t=4tATT%B-X\'9@<,dnATVL(F"SRE
$6UH6+<VdL+:SZ#+<VdL+<Ve;E-#T4+=C&U5t"dP8Q8,++:SZ#+<VdL+<Ve;E-#T4+=BHR6V0j/
2((I?%144#+<VdL+<V+#+=\LGBm=3"+Dkh6F(oN)+CHUB/3#($A8-+(+F.?;@<-"'D.RU,+E)4@
Bl@l3GA(Q.AISth+<Y':?m'0)+DG^9?th592./$Z=(ubi+EV:2F!+t+@;]^h+CHrI3$;aGF)W7M
/n]3D-RW:E%144#+Du+A+Co2-E,8s.F!,O;DfTqBB6%p5E$/\0@s)X"DKKqBC3=T>+Dbb-AKVEh
+<Ve71*AS"A8-+(+FPkTEc<BR?m&uoF)Yr(H#k*EDf021A8bt#D.RU,F"SRE$4R=b.Ni,:FC655
ASlC&@<?''F*)G:DJ+#5@q]:gB4YTrFDi:=@<?!m+EV:.%144#+EMXFBl7R)+E(j7?uBUe?nNR0
DJ*He+DGm>@3B]7Bl%L*Gp%9AEag/*DBO%7AISth+<Y3/F*)G:@Wcd(A0=K?6m-#S@ruF'DIIR"
ATKmTF(Jo*?t<tmE$-NGB4E;s/e&.1+<XWsAKZ)+D/a<"FCcS9FE2)5B6,2(Eb.9S@!d?%IXPTT
+CKPF6%45i/0J>IIRJX5?n<E0$6UH6@;]Tu@!d?$7"0Pl+D,P4+<Yc?FDPM>+CTD7BQ%oB+Cno&
AKWC/H$O[\D/X<&A7-i/@;]Tb$6UH6F(fK4F<G+&FCcRC@!R$7Df0)r?n!];$6UH6%144-+CK)/
?m'!*@:UKhA7T7^/g)9&DBN>3?m&luB6A'&DKI"8F!(o!+<Ve8+Cf(nEa`I"ATAo0BleA=De:,5
FE2)5B-;5+E,8rmASl!rFE7lu+<VeKBOQ!*@<,p%@;p1%Bk:ftFDi:0FCfN8F*)P6?n<FAARuul
A8-+(+=D8BF*)JFF^c_+/.Dq/+<Y*)FCfJ8FCf<.CghEs+EMXFBl7R)+CT;%+E2@>@qB_&ARmD9
<+ohP$6UH6Anc:,F<G(,@<,ddFCfJ8Bl5&8BOr<-FE2)5B-:_rCh[a#FE7lu+<VeIAT2Ho@qBLg
DKI"?@;0b'/e&.1%144#+<VdL+<W$V@q]:gB4W;^73c5YA0Y5Q<@8o,F<DrKATr6-F*&c=$4R=b
.Ni,9B4*85?u:!n/0J>;C1&S8@;]Tu@!$Ku+ED%1Dg#]&+D,Y4D'35$De*s.DesK&/g+,,ATME*
ARoLs+D>>&E+O'2%144#+CT;%+Du+A+E)4@Bl@ltCi"A>A7]@eDIm?$Bl5&$IUQbtDf0VLB4Ysl
Ea`c;C2[W9C2[X%Ec5Q(Ch555C3*c8+:SYe$6pc?+>>E./iY^2/Kdi!FDkW"EZd(m/0H]%0es1F
%144-+CJr&A8Gt%ATD4$ARHWnEc6)>+CSekARmD9;e9M_?nrib+Co2-E$-NCDe*ZuFCfK$FCch-
%144#+CT.u+EV:.+C]/*B-;/3F*&O/;e9f[/PKl#ATD4$AISth+<X9P6sV3SFEDI_0/$dCCLqO$
A2uY&GAhM4E,oN2F"Us@D(dXu0etC:0J>+706:]ABe=.8FCfK$FCd%=De(LM+:SZ#+<Y97EZen(
FCAm"Et&Hc$6Uf@?qipb912QW:1,2]@:O=r+EV1>F<G(3A7Zl=2]uO>A7]:(%144#+:SZ#.Ni+V
+Co2-E$-MU?m'?*G9CF1F)Yr(H#k*:DL!@CG%G]&Cht55F`\a:Bk)7!Df0!(Gp$X9@s)X"DKK</
Bl@lA%143e$6Uf@+Dkh1DfQt.C2[W8E+EQg+D#(tFE8R5DIakuA7TCrBl@m1/e&.1%144-+B*Aj
Ecc#5B-;;0AKYr4De!@"F!,C5+Cf>-G%G]9Bl7Q+D/XK;+A,Et+CoD#F_t]-F<D#"+<VeKAU&;>
FDi:+D..I#A8c[0>psB.FDs8o04\L3Bl7QqBl[co@;Ka4DImoCE,ol3ARfh'05Y-<CLh@-DD*F]
%144#+DG_'Cis9&DJ()6BPDN1A8bt#D.RU,/mDX:>n%,M$6pc?+>>E./iYO-/KdZ.Cj@-X1+XP'
0JP<l$4R=b.Ni89@ruF'DIIR2+CoD#F_t]-FE8RGATT&'DIal%ATVEqARlp-Bln#2?o9'GF`\`R
A8bs#/hSb(?k!Gc+<Y*1A0>8;+D58-+=AOE+CT;%+Du+A+ELt7ARlotDBNJ4D/^V=@rc:&FE9&W
?o9'GF`\`R/hSMZ+:SZ#+<YB>+Cf>-FE2;9Ch7-"@X0))+Dtb7+E1b0@;TRtATAo$C2[X%@<-4+
/no'A?m&iF:IA,V78?fM8OHHb%144#+EV:*F<G+*FCfK0Bl7L'+EqL1FD,6++CI&LE-67F-Y..*
+>,8o?m'N4DfTE1+EV1>F=n\8BOqV[+<Ve;AS,@nCige-6r-0M9gqfV6qKaF4Y^=eF*)>@ATJu9
AU&;L%13OO+=\LWATMs-B5(dj+CKM'+Dbt+@;KKtA9Da.+EM%5BlJ/:Ci<`m+E_d?Ch\!*ATJu%
F)Pr4?[?'1%144#+B)'0:I@EA7:1@J/0K"PE-680H=(&&@;]Tu?up6rCh7$q?[?'e+CT;%+Du+A
+D#S%F(Jl)@<<W6BOqV[+<Ve<DIal.AftW,D/^V=@rc:&F<GUHDK@EQ8l%htA7]@eDIml3AU%Wn
FDQ4FAoDg4+EqaEA9/1e+<Ve@DBO%7AKZ:ACi<flCh5XM?tsUjDe<TgH=&3GC2[X$DI7]s/0J\G
A93$;FCf<.@<?0iH=(%h$6UH6@;]Tu?up""GApu3F'j6#?nMlq%144-+CK,,ASu$m@ru*$BOPs)
@V'+g+Dl%-BkD'jA0>u4+EV19F<Gd@ATVTsEZf4-F*(u6%144#+D,>(AKYr#FD,_<@<,p%E,oN%
Bm=31+E(j7F*)>@ARlooBk)7!Df0!(Gp%'7FD,_J+@^9i+:SZ#+<Y&i76s=C;FshV?m&uo@ruF'
DIIR"ATJu9BOr<*Eb/isGT^jGF*&OA@<?!m/g*W%EZeaf76s=;:/"eu%144#+Co1rFD5Z2@<-'n
F!,R<AKYhuF*(u6+E1b2BHV>,E,8rmATJu9BOr<-FDl22A0>i"FD)e2D@Hpq+<Y3/@ruF'DIIR2
+Co2,ARfh#Ed8dG@VTIaFE8R=Afu2/AU,D/BkCsgE\8J6BPDN1@;KauGB4l9$6UH6?rBEZ6r-QO
=^W@_Bk)7!Df0!(Bk;?.FDi:2AKYr.@:NkZ+E)-?Ci<g!ARlooDg-(ADImp6DfTV9%144#+CoM,
G%G_;@;]Tu@:NeYF)to'+C]U=D..=-+E_a:EcW@FBOQ!*D..]4BOQ'q+Co1uAn?!oDKI!1$6UH6
@:NeYF)rIC@<?1(/g)8G$6UH6%144-+@JXp78?6L+EM+(FD5Z2F!+n%A7]9oFDi9o:IH=6DIak^
:IJ,W<Dl1Q+DkP)BkCptF<GX7EbTK7F"Rn/+:SZ#.Ni,6De(J>A7f3l-td+/ATD3q05>E9A8bt#
D.RU,+CSekDf.!HF`:l"FCeu8%13OO,9nEU0J5@<2`2^0+A-coAKW`d/0H]%0es1F%144-+D,>.
F*&O!@:LEiDf'H%FD53#AKZ/-EcYr5DBNk0+A,Et/g+,,AKX]U@j#r+EcYr5D@Hpq+<Y]9EHPu9
ATJtd+?(o,0d(CT+C\o-Df0).F(JoD+:SYe$6UH6+<VdL+F[a0A8c@,05"j6ATD3q05>E905>E9
A8bs2D.-plDffQ3/p)>[%144#+:SZ#.Ni,6De(J>A7f3lF`:l"FCeu*@;]TuDJs_AA8-+,EbT!*
FCeu*@<3Q"%144#+EM+5@<,duAKXT29H[bSA8c?<+A$HlFCB!%+CJhnDImisCbKOAA7TUgF_t]-
FC5Ob+<VeKD]j"8@:Njk?tsUj/oY?5?m'0$+EV:.+Co2,ARfh#EbT*++EM+&EarcoA.8kg+<Y-=
+CJr&A8#OjE*t:@?tsUjBOu"!?m'?*+Dbt6B4Z*+Ci=6-F!,(5EZee.%144#+E).6Bl7K)G%G]8
Bl@l3De:,"C2[W8E+EQg/g(T1+<Vd9$6Uf@AncL$A0>;'?t<tmE*sf)ASu.&BHUl,Ec5tN+:SZ#
%144-+Dbb0AKYQ%A9/l-DBNA(C`me/EbTK7+D,>(ATJu8ATT&:D]ik1DIjr&AS#Bp9L]Hu+:SZ#
.NiP9@WNZ7E+EC!ARloqDfQsm+?(o,0d'nBA0=Q[DKU1W9jqNSG%G]8Bl@m1%143e$6Uf@Cggcq
?tsUjE,o]1/no'B?m'K$D/XT/A0<HHFD,B0+DbIq+ED%*ATDg&A.8kg+<YcE+CT.1Derr,-ua3<
+?(o,0e"5aEc5](@rri1@;]LdATBCG%144#%14=),9SZm3A*65/KdYoDBLYl/0H]%0ej+E%144-
+CJr&A7fb#CLA9&Dg*=6@;Kb$+CJf"Ebf#sFCB6+?XP!.+CoD.AKZ)5+D>2$A8Gg"@q]:gB4VMZ
+<Ve@DBNe)Bl5%c+Dbb$Eaa!6/g+PD@<63l+Eh=:@WNZ#Eb-A2D]ik7DJ*O$+Dbt)A7]9oFDi:0
H=.k3De!3lAIStU$6pc?+>>E./iGR0/KdGm@j!Kd/0H]%0ej+E%144-+CJhnF=\PRF`_"6DJs_A
An?'oBHU`$A0>r)F<GOFF<G+.@ruF'DIIR2+CoD#F_t]-FCB9*Df.0:$6Tcb+<VdL+<VdL2'?OC
F<DqY+:SZ#+<VdL+<Vda+E2IF+=C]<@s)X"DKI"CBPDN1A8,OqBl@ltEd9#T%13OO,9nEU0J5@<
2BXRo6tKjN0et:&1,(F;%13OO+=\LAC2[WrASc<n+E275DKKH#+EVNEDIn#7Df0B*DIjr6ATDj+
Df-\9AftJrDe(J>A7f3Y$6UH678Qo6+B1d3+CT.u+@oI+9H[ka@s)X"DKI"5Bl%@%+ED%1Dg#]&
+D,Y4D'3\(Bl5&.De'u$Bk)7!Df0!(Gmt*'+<YcE+ED%(F^nu*FD,5.F(or3+E(j7?tsUjF)Q2A
@q@9=BlIH4+B3#cF(HJ+Bl%@%%144#+CT;%+CTG%Bl%3eCh4`'DBO%7AKYo/Ch[cu+A,Et+EM^D
+ED%4Df]W7DfU+U+:SZ#+<XToAKY2VBOr;Y:IH=%@:s.W-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0
ATMoF@rH3;FD,5;C2[W7E+*Bj0.AL_$6UH6%144-+CJ\tD/a5t+Ceht+Du+A+C\n)Ch[a#FCeu*
FDi:?DJXS@GA(]4AKZ&5@:NjkEb0*+G%#20@X0(*$6UH6Bl8!'Ecc#5B-;;0AKYK$D/Ej%F<G[6
B-:S1/M8J83aa(=DL$G>ATD?)Bl5&8BOr<.AU&;>De9Fc+<Ve8DBNM8E,95uBlkJADfTA@%144#
+:SZ&,9n<b/ibOA+>"^(ARci>/0H]%0ej+E%144-+D,>4ARlol+CK%pCLplr@Wc<+Bl5&$A9Da.
GAhM4F'p,!+E1b2BHV5*+CT)&%144#+D#D/FEo!>Bk)7!Df0!(Bk;?.AmoCiARlp*D]in*CLo+-
$6UH6%144-+D,>4ARlolDBN>(Ci`u,@Wc<+FD,*)+E2@>A9DBnA0>T(@rHC.ARfg)%144#+A,Et
+CK84@<-I4E%Yj>F'p,%DKKo5ATJu4DBMVeDKU1V%144#+:SZ#.NiSHEb-A8ATMr9@psFiF!+n%
A7]:(%13OO,9nEU0J5@<1a"@m:2b:u1,UU*1,(F;%13OO+=\LVE+EC!AKYAqDe*R"A7^!<BQS*-
?m'Q0+ED%*ATD@"@q?cmF`MM6DKI">DJX$)AKYN%@s)X"DKK</Bl@ku$6Tcb+=\LGBm=3"+CQC#
D..3k?m&p$B-8cK?u9=fARHWjDfol,+D,%rC`mq8ASrW7DfTB0+EqOABHVD1AISth+<Yc>AKZ&&
D.Oi-@;TQu@;]TuA8,XfATD@"F<GI0D.Oi"CghC+ATJu<ATD?)E,oN2ASuT4Df-!k+<VeKBOr<*
@<?08%144#+:SZ#.NikQA79RoDJ()#DIal$G][M7A8,po+A,Et+EV19FE9&D$6UH6%14=),9SZm
3A**1/KdZ.DBLYg/0H]%0ej+E%144-+E).6Bl7K)A8bt#D.RU,@<?4%DBNt2G%l#/A0>;uA0>H.
FCf?#ARmD9<+ohcDf0B*DIjr$De!p,ASuU2%144#+CT;%+D>\7FCeu*@X0(dDf99)AKXBZ@s)X"
DKKqB@;]Tu@ps6t@V$[&ART*lDf-\>BOr<1ARZd#EX`?u+<Y35GA_58@:Wq[+DG^9@3B`%EbT*,
Gp%$;+D,P4D..O-3Zq6e7P#ZX6rY][=)W+i/0IJ_9h[/^<+ohP$6UH6De<TtBl7K)?tsUj/oY?5
?m'Z-Cht5'AKZ#)G%l#/A0>;mFCfJ8@rH1"ARfgrDJ()7F(KA7An>Oa@UWb^/e&-s$6pc?+>>E.
/i"P$+AH9i+>Pr.+>PW*0b"I!$6Uf@Anc:,F<F7kDKU1H@rH4'@<?3mCh4`4ATDj+Df-\9Afs]A
6nTT]BOr;[Bl8'<+Eh=:F(oQ1%144#+ED%5F_Pl-F!+'t2_Hd=+E)9C@V'h'DIal2AS!nF%13OO
+<VdL+<VdLIUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG:Bl8'<DJsW.F"VQZF:AQd$6Uf@Df0B*
DIjr$De!p,ASuTuFD5Z2/0JAE@;0Od@VfTuG%kA-FD,5.G%G]'+CJr&A8#OjE*t4+$6UH6BOPs)
@V'+g+Cf>-G%G]9ARlp*D]j.8AKYl%G9BCoDeElt+@L-XF_t]-F<G16Ec#6,/g(T1+<Ve+BOr;r
Df0`0EcYr5DBNn=De!@"F!+q4Deio,@;Ka&FD,5.Bl8$(Ec,<%+D?%>ATDU$DJO;&$6UH68K_GY
+EM@;GAMOIAncL(DJ()6BOu$5+B3#c+E(k(Ch[cu+AbHq+CoD#F_t]-F<D#"+<Ve2?tsUj/oY?5
?sP0oFEDI_0/%NnG:m?CGV3lFF>%]K@<,pi05"^.Ap#sbB4EVE%144#+CoD%F!,@=F<GX<Dg*<t
Bl8'<+EML5@qfOh@j#?-@;Tt"ATJu'F`\a?F!,OGBl%Sp$6UH6@;[2r@q0Y%@<?''A7]glEbTK7
Bl@l3De:,9BOQ!*8l%htBlbD*Cht5&@W-C2/e&-s$6Uf@@:Wn_FD5Z2@;I'#DJ!g-D..O#Df-\+
@W-C2+A,Et+EqO9C`m1u+DkOtAISth+<Y*9@;0Od@VfTuDf-\%D0[75Ci<rl-tm^EE&oX*@UX%`
Eb],F3A,MoEb'-0ATMoF@rH35%144#+CSl(ATAo%+EDCCDIal.AftPoFC?;6ATMs-DJ()+DBO%7
AKZ22Ch,.@+:SYe$6Uf@FD,B0+Eh=:F(oQ1+E(j78l%htEcl8@+E)-?GA1r*Dg-7F8g$#E0R+^K
DIak^+?(o,GT_'QF*(u1F"Rn/+<V+#,9nEU0J5@<0d&%j9jr;i2_6(,0JP9k$4R=b.NiSBDJsP<
AncK4De:,'A8--.G%G]'+CJc&?m'Q0+EDUB+E)-?@W-@%+?(o,GT^F4A0<c_0R+^4+EMgLFCf<1
/e&-s$6pc?+>>E./heD"+@]pO+>Gi,+>PW*0b"I!$6Uf@D/Ws!Anbge+EVNEEcl7BF`(`$EZdss
2_Hd=+A,1'+CT.u+A,.'9.h>dBPDN1G%G]8Bl@ku$6UH6@;L"'+EDUBF!,C=+A*b7/hhMmF*VhK
ASlK@%144#+:SZ#.NibCE,8rmARloU:IHRO+CKM'+Dbt+@;KKtBl8$(Eb8`iAKZ22FD)e*DBN>$
C2[Wj+DG_8ATDBk@q@8%$6UH68l%htDJs_AA7]@eDIml3Df0B:+EV:;AS!!.DfTB03ZqgFDe*d(
/0J\GA8c'l?m&lqA0;<g+<Ve7C2[X(H#n(=D/`p*BODrsDBO%7AKYB,?m'9(@ps1b/g)9&Cht54
FD,6++DG_8ATDBk@q?)V+<VeNDfTB0+CT;%+Co%qBl7Km+DG^9?tj@oA7-O(BPCsi+DGm>E,8rm
ARlp%DBO%7AISth+<Y-%F(HJ1De!3lALDOAF(Jd#@q[!(@<?/l$6UH6%144-+E1b2BHU`$A0>Ju
Ch4`"Ble60@<lo:@rH7.ATDm(A0>u4+CJr'@<?1(AT2$"@rH7.ASuU(Df0VK%143e$6Uf@?tsUj
/oY?5?m'K$D/XT/A0>K)Df$V=BOr;rDfTD38l%ht@:WneDBNn,@r#LcAM,)J?tsUj/oY?5?k!Gc
+<Yl:F!+q;+D,&&+EV:.+DbJ,B4Z.++E1b0F<GL6+EV:.+Cf>1AKY])F*(i,C`m\*@r#LcAM,*5
C2[W8E+EQg%144#+DGm>DJs_A@WHC2F(Jl)Df..CBl7K)@X0)(C2[WrASc<n/g+;8FWb1&DBNJ.
GA_58@:UKgC2[W8E+EQg%144#+CT.u+E2.*@q?csF<G:8+CKY,A7TUrF"_0;DImisCbKOAA1q\9
A7TUg05tH6A8bs2?m'Q0+D#G!@VfTb$6UH6Ci<flC`lPB7Nc__@:X(iB.aW#+<Vd9$6Uf@Df0B*
DIjq_:IH=9De!p,ASuTuFD5Z2+E_X6@<?'k+EVNEEb/j!ARfg)@q]:gB4Z-:%143e$6Uf@?r^/q
3+*kG@:O=r+EM%5BlJ/:@rGmh+Cf(nDJ*Nk+D,Y4D'1Sl+EVNE1,pC)Eb0*!D.7's+>Po!AoD]4
?r^/q3++0f%143e$6Uf@?p\!q7:76T@:O=r+EM%5BlJ/:@rGmh+CSekARlp-Bln#2G%#30AKW`d
/g)8G$6Tcb,9nEU0J5=;0H_qi:LeJh1GLF'1,(CA%13OO+=\LBA7T7^+Dtb7+CJr&A8kstD0%=D
C3*c*E+*cqD.Rg#EZeaU;aX,J3&P(dFD,*)+Cf>-FE2;9F!,[?ATVTsEX`?u+<Y3;D/^V0Bl%@%
+E_a:+CT>$Bk]Oa+D,P4+EV1>F<GL2C1UmsF"SRX6tKt=F_l.BBlbCN/e&.1+<XWsAKYE&@qfX:
2'?pNE,oN2ASuTuFD5Z2+D58'ATD3qCj@.BEc5K2@qB^(F)>?%Ch7W0%144#+CoV3E$/b,Ch7Z1
@Wcc8BlbD<Ci=N/EZfI;@;[30BOr;sAS,@nCige:ATVU(A1e;u+<Vd9$6Uf@?tsUjF)Q2A@qB$j
F`V,8+CT>$Bk]Oa+D,P4+A,Et+Co&,ASc:(D.RU,+Co1rFD5Z2@<-'nF!,RC+:SZ#+<Y]9A9DBn
+EV:.+EM7CAKYo'+EV:.+CoD7DJX6"A90@4$6UH6%144-+Dkh1DfQt4Bm=31+DG^9?tsUj/oY?5
?k!GP$6pc?+>>E,/i+V%+AZKh+?(ho1,(CA%13OO+=\LGDfT?!A0>i"FD)e,Df'H%EbTT5DK?qB
D]ik7G@be;@psFi+DG^98l%ht9OVBQ,;^NODIal3ATMr9?mg#,FEMP0C2[X%Ec5](@rs)+%143e
$6Uf@AncL$A0>;'An?0/FEqhDF!,17+CJr&A1hh3Amc&T%14=),9SZm2_Hj./Kdu'E$-nn/0H]%
0K9LK%144-+Cf>,E,9*-ARlooH!t5t@j#8iF(HJ4AftJlDe!/a$6Tcb+=\LVE+EC!ARlokC2[W8
E+EQg+EVNEA7]glEbSuo+Cf(nDJ*O%%13OO,9nEU0J5::0d&%j;e9nj1,LO)1,(CA%13OO+=\LS
ASl@/ARlp)Df'&.Cgh?sAKXE<;]o[dCh7Z1Ao_g,+Co1rFD5Z2@<-W9FDi:BARopnAKYN%GA_58
@:UL%BmO>"$6Tcb+=\LSAT2Ho@qB0n8l%htA8-'q@ruX0Gp$X3@:sUhD'3P1+CJr&A1hh3Amc`5
+ED%(F^o!(+EM7CAKYo'+DP;&A1hh3Amc&T%14=),9SZm2_Hd,/Kdu'E$-nm/0H]%0K9LK%144-
+ED%*ATD@"@qB^(@:Wn[A0>u4+CJr&A1hh3AftIj$6Tcb+=\LOATo83De'u(@<,mgDfBtE>Bb:8
/o5ZHFY70BD-\Q'FEDI_0/%NnG:m]SCiq@?Df$pGARoLsBl@ku$6Tcb,9nEU0J5790H_qi6$6f_
0fU^,1,(CA%13OO+=\LNBl7j0+DPh*+EM%5BlJ/:ARoLsEt&I!%144-+CJr&A1hh3Amc`qDId='
+DG\3Ec6,4A0;<g+:SZ&,9n<b/i>79+>"^.F_i0U0e=G&0JGHq$4R=b.Ni,6De+!3ATD:!DJ!Tq
/no'A?m&lgA7]9\$6Tcb+=\LAB4PRmF'p,.Dg*=7De!p,ASuU$A0>T(+CJr&A1hh3Amc&T+:SZ&
,9n<b/i>78+>"^.F_i0T3%Q1-0JGHq$4R=b.Ni,6De(J>A7f3lA8bt#D.RU,@<?4%DBNG-D/a<&
FCbmg+:SZ&,9n<b/i517+>"^.F_i0T0J">%0JGHq$4R=b.NiGCF*2M7+CT@7Ch7$rF<GL>AKYW+
Dfp"ABl5&$C2[WnAThm.@:WagAoD]4Cggc^$6Tcb+=\LNBl7j0+DbIq+D#(tFE8QV+ED%*ATAo8
D]iG/FCB33F`8sIC3*c*Bl8!6ART*lDe:,"F(96)E--.RBkh]s%143e$6pc?+>>E(/iXt*+AH9i
+>Y`'+>PW)3"63($6Uf@D/!m+EZfLDA79Rk+EVNECghC,+DbIq+EM+(FD5Z2%13OO,9nEU0J5.6
2]s[p9jr;i1GLF'1,(CA%13OO+=\LCF_;h/Bm=31+DG^9Cggdo+>"^ECht51@:F:#@ps6t@V$[&
F`%Wq%14=),9SZm1G1R./KdbrGp"k&/0H]%0K9LK%144-+D,>.F*&OFASbpdF(HJ4Aft].Ci"A>
,%5"mDf..@H=^V2+A,Et+>"^ZATDj+Df0V=E,oZ2EX`?u+<YcE+EV:2F!,L7Ch7$rAKYYpA0>u4
+C\n)D..=)@;Kb*+DG_7FCB!%ARlomGp!P'+<Ve8A1_J5@j#i&EbTK7F"SS1Dg*=GBOr;Y5tiDB
H#n(=D'3M#DIdQpF!+(N6m-2]F*(i,Ci_3<$6UH6%143e$<pgk>rj)N<+oue+CoD#F_t]-F<G(%
DBND"+Cf>-G%G]9ARlp*D]in*DL!@:DfT]'FE8RKBln#2%144#+<VdL+BrenDIdZq>psB.FDs8o
05>E=DJ`flAmo^r@;]X/DImoCE+*WpDdtFL/e&.1+<VdL+<X-lEZeq<@;Tt"AKZ).AKYT'Ci"$6
Bl7Q+@rH4$@;]TuE,ol-F^o!(+CT.185r;W+Eh=:F(oQ13XlE=+<VdL+<V+#+<VdL+<VdL+<VdL
E+*WpDdsnAF!,.1F*)>@H"q8./o>$;CLh@-DBLNL+D>J1FDl2FC2[W8BQS*-%144#+<VdL+<VdL
+<V+#+:SZ#%16c_F*)>@H"q8.A8bs52eQ]>ATD3q05>E9A8bt#D.RU,+>"^GBOPdkAKYZ#F*)>@
Gmt*D4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztq;$4R=e,9n<c/hen4+>"^1@<,jk
+>Po-+>PW+0H_cBDe!KiC`l,[F*(i.@qfgn+@TgTFD5Z2.1HUn$6UH@+<XZ^9QM=jDBN>%De(J>
A7f3lD/Ws!Anbge+EVNEF`V+:85rPb;]odlF*(u%A0>f&+@oI2:bE1a%144#.NhW#An?!oDI[7!
+EVNE8jQ,n@q]:gB4YTrFDi:EF(HJ5@:O._DBNY2F*(u%A1e;u%14=),9S]n0J5%%/KdGm@qBLd
ATAnR/0H]%0f^@)7V-"MF`M%96Z6g\Ch7^"+AuceARTXk.1HUn$6UH@+CJYkATV<&@UWb^F`8I9
ATT&9ARfgrDf-\+A7T7^/g(T1%144#.NfjQA7cs-ATDj+Df0V=De:+aF`;VJATAo0@:F:#@:Wn[
A0<HHF(Jo*FD,5.A8-'q@ruX0Gmt)i$6UH6+<VdL+<VeAE+*j%+=DVHA7TUrF"_0;DImisCbKOA
A7TUgF_t]-F>%TDAn5gi-OgCl$6pc?+>>E./ibpP+>"^%F_>i<F<E>!/0H]%0f][M%144#.NinG
EcYr5DBND2D/^V0DfQsm+?;&.0d'q:FC?;2@<?!m/e&-s$6pc?+>>E./ibpO+>"^*AR]\&@<-W9
0f1F(1,(FC+=L9!Ch7L+Bl7K0F!*kZGps10%144#.Ni,>G]R78F(Jj'Bl@l3@:Wn[A1eu6$4R=e
,9n<b/ibOE3Ar!3+AZKhDdm9u+>G](+>PW*3"63($6UH@+CK&(Cg\B,ARfgrDf-\+A7T7^/e&-s
$6pc?+>>E./ibpL+>"^1@<itN3%Q1-0JPO0-r"8iDfTQ#C`l,SGp%6KA79Rk.1HUn$6UH@+EMX5
Ec`FBAfu,*G%l#3Df-\-H"1Z%+D,P4+A*c"ATDj+Df-[W/hf47/e&-s$6UH@+A,Et+D,P.A7]e&
+CT.u+A,Et+DbIqF!,O6Eb/g"+Cei!FEMV8F!,UEA79RkA.8kg+<Ve=DfQsm+?1u-2]t^i<%\Ue
%144#.NiV?G9C:9DJ<U!A7[T*+EVmJAKYDlA7]9oFDi9mF`(i#EbSs"+CT5.ASu$mGV0F4%13OO
,9nEU0J5@<3B8l</KdbrGp"js/0H]%0fTUL%144#.Ni>;EcZ=F@rH4$BlkJ>D]iq/G9BM!De=*8
@<,p%7qm'9F^cJ6AT2R/Bln96Bk;?<%13OO,9nEU0J5@<3B8c9/KdMo@WHU"Ed8c_2_6(,0JPKq
$4R=b+=\LFA8--.?tsUjF`V,7@rH6sBkLm`CG'=9F'p,!E,]B+A8-92FDi:2ATW$*EX`?u+<VeJ
F`;;<Ec`FHF(oN)+A,Et+DG^9C1D1"F)Pl+/nK9=+EM+8F(oQ1F"Rn/%14=),9SZm3A*<O2]s[p
9jr'PBHT&a/0H]%0fBIJ%144#.NiSBDJsP<ARoLsEt&Hc$6pc?+>>E./ibmK+>"^%F_>i<F<ERp
+>PW*2%9m%$6UH@+CJYrCg\Ap@:O(qE$0%,D.Rc2Ch[s4F!,O8@ruF'DBN@uA7]:(+<V+#%14=)
,9SZm3A*<O0H_qi6$6g_F*&NZ/0H]%0f9CI%144#.NiV?G9C:'Df'H.?m'Q"B-:S1001OF3aa(@
ATM@%BjtXa%144#%144#.Ni,1A7-NkG[YH.Ch4`-AftYqBln',B-8U?@;TR,>@VJXF)tV<G%#30
ALSaD@:F%aF!+n%A7]9\$6UH#$6UH@+DG_(AU#>3D/aN6G%GN%DKKqB@;]TuD/!m+EZeq(BlnD*
$4R=e,9n<b/ibOE2_uR.+A-cmGp"pp+>PW*2%9m8%144#.NiV?G9C=5E+NotBm:aE<-<5!Bl7Q+
8l%ht7!3?c+B)cjBlJ/:<,u\_CNC[B@:Wn[A.8kT$6UH@+CJhnFC65"DIaktE-681+Cf(nDJ*O%
+D,P4+Dtb7+EV=7ATMs%D/^V=F`;;<Ec_`t%144#.NiGBE,ol?ARloU+Cf>#AKYT'Ec#6,FD5W*
+EV:;Dfo]+Dfp.E?tsUj/oY?5?k!GP$6pc?+>>E./ibjG+>"^%E,oZ/+>k\m1,(F?%13OO+<W-V
D/!m+EZeq(BlnD=FDi:CF`;;<Ec`F?@:C@%E+EC!ATJ:f%14=),9SZm3A*<N0d&%j9jr'PBHT&f
/0H]%0f9CI%144#.Ni>;GT^^<@rHC.ARfg)AoDU0DJsW.+Dbb0CCLU[$6pc?+>>E./ibj5/Kdbr
Earc*1,:C'1,(F?%13OO+<W-V@q]:gB4Z-,FDi:0C2[WrASc<n+EMgGFCBD:A8bt#D.RU,ARl5W
%144#.Ni57@;]^hF!,(5EZdss3%cn0+EMgLFCf<1+CT.u+A,L1%13OO+<W-V@q]:gB4Z-,FDi:0
C2[X(Dfp)1ARHWuDffQ$%13OO+<W-VAoD]4D/XH++Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*&N6
$6UH6+BqH66m,KKA79Rk3ZqI7EcYr5DBLVc3A*<N.U=H9FEDJC3\N-q@;BFpC1K=b/pD5SA8lR#
F)rsDDf%-_0JPF<0Jb@;1,!B\A1_qCA79Rk/Tt]GF(oQ1/MJb:/NGaC.1HUn$6pc?+>>E./iba2
/KdZ.DIjqF1b9b)0JPBn$4R=b+=\L+5tiDEATDj+Df-\3DI[]uD.RU,ARlp)D]iG&De*Bs@s)X"
DKK8/@:WneDBNA,E+NHuF!,(5EZdss3%cn0+EMgLFCf<1%13OO,9nEU0J5@<3AVd0+AQiuASkmf
EZd+n/0H]%0f'7G%144#.NieXDI[@#Df098AKYAqDe(J>A7f3lG%G]8Bl@l3GA2/4+Co2-FE2))
F`_2*+A,Et+CSekDf.0M%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Pi++>PW*1(=R"$6Uf@?uC'o
+Cob+A0>E$@s)X"DKKH#/e&.1%144-+Eh=:F(oQ1+Cf>-FE2;9+CT5.ASu$mGT_$<G%l#/A0<HH
@:Wn[A0>o(An?!oDI[6#FDhTq+<Ve27qm'9F^eW)BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b
05>E9A9Da.F"&5>C2[WnF_u)=?m'K$E,Tf3FDl2F/e&.1+<V+#,9nEU0J5@<3&Mg1+AZKhDdm9u
+>GZ'+>PW*1(=R"$6Uf@D/!m+EZeq(BlnD=/KeFq5uL?D:KL;!+Cf>#AKW`e+CT.u+CI&LA8-+(
+=AOE+Du+>ARmD&$6Tcb+=\LUBPDN1A8bt#D.RU,+Cf>-G%G]9ARlp*D]i8$@<--oDg-))-tm^E
E&oX*A79LmDJ*QqEb/]gCht_AATTSEEc5](@rucFD..I#A8c[00.@>;%14=),9SZm3A*9F+>"^.
F_l=G0f(@'1,(F<%13OO+=\LSAS,LoASu!hF!,RC+AH9S+Eh=:F(oQ1+CT.u+CJr&A7TUgF_t]-
FC65"A7TUr+CSekARlnm$4R=e,9n<b/ibOC2BXRo8p,#_+>PW%+>PW*1(=R"$6Uf@:ddbq8l%ht
A8bt#D.RU,@<?4%DBO">Ch[u6De<T(Bl8$2+CQC6AT2'u@<?''@:WneDD!&2BOr<'@;0Tg$6UH6
Anc'm+CJr&A1hh3Amc`qF!,L7CghF"G%GK8+EMX5@VfTu@;]Tu@;Ke!F*&OHASrW4Bl.F&+EV:.
+EM7CAISth+<YT7+EV:.+Cf>1AKXT@6m,oKA8c?<+A$YtBOPs)@V'+g+ED%1Dg#]&+D,Y4D'3q6
AKYK$Eb-@c:IH=6A7TUr%144#+EVNEEb/d(@q?cnDg-)8Ddd0!FD5T'F"SS>?tsUj/oY?5?sP0o
FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F%144#+D>2)+C\nnDBNA2
@;0Od@VfTuDf-\>BOr;Y:IH=%@:s-oAoD]4F`V,7F!,RC+CoD7DJX6"A0>;uA0;<g+<Ve:DfBtE
FDi:DBOr;rDfTl0@rri$C2[WrASc<n+Co2,ARfh#Ed8d:F`\aMBln#2FD,5.%144#+E2@>Ch[Km
Eaa'(Df-\9Afs\gE,8s)AoD^,F!+n/A0=K?6m-YaEcYr5DK?qBBPDN1BlbD0ATW$.DJ(($$6UH6
D.Rd0GqL42F=2,PARTXoATAo8D]j1DAKXT29H\Fq+Co2-FE2))F`_1;FD,B0+D,>(AKYE!A0>Aq
@;]^h%144#+CJr&A8#OjE*sf1D]ik7DegJ0DBO%7BlbD*A7TUr-Z^D@Bl[cpFDl26ATKI5$6Tcb
D..<rAn?%*C2[W<0ht%f+DkP)BkCptF<G16EZdtM6k'Jj5u:NP:JO&6-V@0&+A*bP@VTIaF<Etc
@ruF'DIIR2-OgD`78d&U:JO&6-S[5-/hn^_$:[fb6q(!:3[\QODImisCbKOAA1%fn:eX/S7ScoV
;a!/hGA1q;Ch[d0GT^O*Ed)58-QjNS+<Vd9$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1
+>=p!+>=63C2[W8Bkh\u$>OKiE+*d(F"V0AEt&IkDe*g-De<^"AM.\3Et&In@;]dkATMrGBkh\u
$>=-pFDl2F/p)>[%16igA7At_05>E9E+*d(F(/Qn/no'A%16igA7At_05>E9E,ol/Bl%?i@;@K0
C3'gkC2[Wl@;@N2De+!3ATD:!DJ!Tq@UX%)Bkh\u$>OKiA8bs2Ch[d0G]%GAATKJGG]XB%C2[Wn
DdtG;@:O1nFCfMGFEhm:$>OKiA8bs2C2[WmF^eo7Bk)&j$>OKiA8bs2C2[WmF^eo7E,K:t$>OKi
A8bs2E+EQkDdtG8De*ftAhJ1MF:ARlDe*F(FE9*MDe*s.DesJIBkh\u$>OKiCggdo05>E9A9Da.
/no'B%16igA8G[`F"_9HA8,q'Ec3REC30mlC2[X!@:F:2C2[WlATMrGBkh`!$>OKiCggdo05P'+
AU%X#E,9)>0JP1oC3'gkC2[X!@:F:2Cggd`F_u(MBkh\u$7QDk;FO8J5uU383[Z9a$:I<Z78?6L
4ZX]>+?CW!%16WSFC?h;Anc'mEt&I*%15Kl;aXGS:fL"^:-CW\0H`D!0F\@]:IH<R8g$o=C1Ums
+@KpRFD5Z2@<-WB+DGm>@3A/bE,ol0Ea`g%Bl7Q+@;]TuEb/ik@ruX0Bl7Q+%172qDeq$K8l%ht
F*2G@DfTr@+Dbb0CLq$!A8,OqBl@ltEd8d<@<>pe@<6"$+CT.u+E2@>G%kJuF!(o!FDl)6F!,(5
EZeh6Bl%<oDJ(LCA8bt#D.RU,Bl7Q+@;]TuFCfN8Bl7Q+8g&2#F*(u1F"SRE$4R>7:IH=GAT;j,
Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;"hPH#IgJBl8!6@;Ka&8l%htBlkJ3F!,.1
B4u+,+ED%'Df'?&DId<h+EV:*F<GjIFU\[lDKBo.Cht59BOr<,ASbdsARlolA7TUr+A,Et6r-0M
9gqfV/g*b^6psg<<D>nW<$2VWBl8!6@;Kb$+Co&*@;0OhA0=]:7Nc5[@s)X"DKK</Bl@l3AoD]4
8l%i-+:SYe$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@6m-\fCM=o1@:s.m+=Kg!AoAeY
F`__DDCI+G$?C9,+EV:.+DbIq+<jER6m-;S@N\9=6m,'=FE2;1F^oN-Df-aA/KdY]6m-;S@WNZ#
Eb-A9DId=!+:S["BOr;VASu("@;I'&@:C?h@<?'nDfU+U+A$/fH#IgJA8`T.Dfd+CARuuV:IH=A
@:F:#Ch[s4ARl5WDf-\>BOr;[@:C?rASuX3+E_a:+EV:.+A?3Q+C]A0GB7=<@Wcd7Df-\>D]iIu
@qB_&3XlE*$6UH6IUQbtDf0VLB4YslEa`c;C2[W9C2[X!@:F9e$4R>:DfTD3Bl7O$Ec#6,Bl@l3
BlbD*G%#*$@:F%a+E)-?FD,5.8l%ht:gn!J+CT.u+@g-f89JAa@<=O>$6UH#$6UH6BQS?8F#ks-
@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1De(G=@:s.)%144#+D>k=E-"&n05#!@
BQ[c:@rH3;@UX%`Eb],F3A5,cA0<!($7QDkD..<rAn?%*C2[WnDe!p,ASuTF0ht%f+DkP)BkCpt
F<G16EZdtM6psg<<D>nW<"01%5u:NP:JO&6-V@0&+@L-XF_t]-FCB9*Df-p3$<BSn;b9b[4ZX]5
0eP.40II;:7Sc]G78c90-YI".ATD3q05>E9A8bt#D.RU,-OgDZ9L2WI:Jsnc4ZXr<%15cp6:4%<
77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>j3hBkCptF=q9BEt&IiBleB7Ed99ZG]XB%
E+EQkDdtG8De(J>A7c8XE+EQkDdtFeF_PZ&Bl7QU:IIKZA8c@,/oY?5%17&bAn5gi01o#.6=k4[
:i]uSFD55rF%g"O/oY?5%17&bAn5gi01o#.8T&WjDe+!#FD5Z29OVB_E+EPi$?0NfA8bs28l%iK
@:F:lDG#%jH$!V</oY?5%17&bAn5gi01o#.;f?f!@qA#GA7\/OD/`E`EbTK7F%g"O/oY?5%17&b
An5gi03*(-DJ)R;6pb<lCNXSdATTPDA7c8XE+EQkDdtG#F(oN)8l%iQAS6.%@<+e]E,oN2F(oQ1
F"VEBAdo(r%16!%9LV6G76N[S-RT?16q($A;Fs\a8P`)E3Zp+!3Zp*c$;+)^+@L-XF_t]-F<G(3
DKK<$DK?pKC2[W8E+EQ0+EqL5@qZuqDe!p,ASuU2+EV:.+A,Et+EMgLFCf;A%13OO8l%ht6uQRX
D.RU,+CT)-D]iP.DKK<$DK?q>A7cs-ATDj+Df0V=De:+aF`;VJATA4eDJsW.@W-1#F!,R<@<<W5
BQ&);BQ&);FDi:EF(HJ;@<-(#F`SZt:IH=;@:O"fBln'#F"Rn/;e9M_FD,5.A8-'q@ruX0GrcBA
%16ih@<?0*-[oK7A8c@,05"j6ATD3q05>E9A8bt#D.RU,05tH6A8bs*%13OO7W3;iD/XH++DG_*
DfT]'FD5Z2+EM+*+EV:.+A,Et+EqO8BcqA'B4Z,n$7JJ`AoAeYF`__DDCH]HEZfO>F(o_=<+ohc
8l%ht:gn!J+CT@Q%13OOBQS?8F#ks-@;]LiH$X%DBOt^_FCB'*FED2-A9)C-AS`u;Eb@%IBOrc1
De(G=@:s.)%13OO9OUn3=<M-m@s)X"DKI"BDfp)1AKY].+CTG%Bl%3eCh4`-DBMG`F@^O`+CT@Q
%13OOBQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bre$4R>7DeO#26=FY@EX`@b@;BFp
C1K=b5\FqBBl#D3Df#pj.1HW$@;]dkATMs.De*p-F`Lu'1,2Nj/g,">DJ<]oF*&O:DfQsm:IJ,W
<Dl1Q%15Hg:fL"^:-CWc8l%ht:L\'M@rrh]Bk)7!Df0!(Gp$%(F`Lu'-OgD`78d&U:JO&6-S[5-
/hn^_$:[fb6q(!:3[\QODImisCbKOAA92[3EarZ.%15p*5u^<L;GC(Q3[],cDBNb0DKU1HA79M&
Bl5:-$;<`P6U=[?7o*#c4ZXr\ASu("@;I;#$:[T\78l?1+>=p!+>=63D..<rAn?%*/no'A%16ig
A7T7p/no'A%16igA1hS2Et&J!FD5Q4/no'A%16igA92[3Ear[%ATW'6/no'A%14Nn$;s;d76sj@
4ZXr<%15Kl:dn,I;a!/a0H`D!0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63
-u*[2F)Q2A@q@)3@rH7,@;0V#+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14Lu
De*BiFt@BHA1VkFBl%i>/g+,,ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7
FCfN8+Cei$ATKCF@WcC$A0>r'EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.
E$/S,A0>_tBl8$$Bl5%c:IH=6DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%
Cgh?sAKXSfF(96)E--.DFD,*)+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!
Df0!(Bk;?.GA(Q*+EDUB/e&-s$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"
ATJu4Aftc*G9BLR6m)pG@ps6t@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7
:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+:SYe$;+)^+EMIDEarZ'A8,OqBl@lt
EbT*++Ceht+C\n)F(KG9F`8I;DBO%FD]j74H#l"U$4R=s.3MN2DBO%7AKXSfF(96)E-*33$4R=b
+<Z,AA7TUrF"_0;DImisCbKOAA92[3EarZ6C2[X(Dfp)1ATMF)F`8sIC3'gk%144#+B3#gF!,1<
+EV:.+ED%'Df'?&DId<h+Dk\3BQ%E6+=LuCA92[3Ear[%ATW'6/no'A.3K',+<Ve:@;[30@;BEs
@3BE$DKU&4+E)9CF)N1CD]j(CDCuA*+:SZ5.3MN2DBO%7AKXT@6m-;S@NZje:IH=(Dfp)1AKX?Y
A7ZlOF_u(?;e'i^E--.R+s7=%+<Ve!:IH=A@:F:#@<,p%Bl5&8BOr;77qHRLEa`c5+DbIq+Cei%
AS5q%GqL42AfuA;FU\[#+<Y35+Du+>+EM+*+A,Et+DbIqF!,:5F*(u(+E)-?FD,5.9OVBQD.RU-
F!,UHAKZ).AKXZT@LWYe+<Y-6Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6
ATD3q05>E905>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et
+AcKZAKYE'3XlE=+:SZ#+<Y?>FDu:^0/$aO@;L48ATVTsA79RgDJsW=BOt^pBm+'(/oPcC06Cl=
/S]37/T>-2AM4K".1HU                                                       ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0f:(/+>P&o0d&A1+>GSn2D\-&6qU6C:2b5cF(96%@<?'k3Zp130K!BP@kf\\/KeP:@;]^hA3(hg
0JGFrARdDO+>"^WFCB&t@<,m$BOtU_ATAo%A7T7^<)5nX?V4*^?Ys=pDfp)1AKYT'EZf%;FDu:^
0/$sPFD,f+/n8g:04J@*ATDNr3B8a-De(M1Ci<c9D..L-ATBG':IIu2D.E                ~>
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
zz=:zz,'T UNION UTF8 WORD XML afterstr alltrim badappend badblia badbu badc'
zz=:zz,'l badfl badil badjr badlocn badobj badrc badreps badsts badunique b'
zz=:zz,'eforestr bget bnl boxopen catrefs cd changestr checknames checkntta'
zz=:zz,'b checknttab2 checknttab3 createjod createmast ctl datefrnum dblquo'
zz=:zz,'te decomm defzface del destroyjod did didnum dnl dpset dptable empd'
zz=:zz,'nl fex firstone fod fopix gdeps get globals globs grp gsmakeq guids'
zz=:zz,' guidsx host hostsep isempty islocref jappend jcr jcreate jderr jdm'
zz=:zz,'asterr jnfrblcl jodsystempath jpathsep jread jreplace justdrv justp'
zz=:zz,'ath jvn lfcrtrim locsfx make makedir markmast mnl mubmark nc newd n'
zz=:zz,'largs now nowfd obidfile od ok packd plt put quote read readnoun re'
zz=:zz,'adobid regd remast restd rv rxs rxsget rxssearch saveobid second tc'
zz=:zz,' trimnl tslash2 tstamp uses valdate wex wrep write writenoun''),<<;.'
zz=:zz,'_1 '' jodstore CNCLASS CNCOMPS CNCREATION CNDICDOC CNDIR CNEXPLAIN C'
zz=:zz,'NLIST CNMARK CNPARMS CNPUTDATE CNREF CNRPATH CNSIZE DOCINIT ERR050 '
zz=:zz,'ERR051 ERR052 ERR053 ERR054 ERR055 ERR056 ERR057 ERR058 ERR059 ERR0'
zz=:zz,'60 ERR061 ERR062 ERR063 ERR064 ERR065 ERR066 ERR067 ERR068 ERR069 E'
zz=:zz,'RR070 ERR071 ERR072 ERR073 ERR074 ERR075 ERR076 ERR077 ERR079 ERR08'
zz=:zz,'0 ERR081 ERR082 ERR083 ERR084 ERR085 ERR086 ERR087 ERR088 ERR089 ER'
zz=:zz,'R090 ERR091 ERR092 ERR093 ERR094 ERR095 ERR096 ERR097 ERR098 ERR099'
zz=:zz,' ERR100 ERR101 ERR102 ERR103 ERR104 ERR105 ERR106 ERR107 INVGROUPS '
zz=:zz,'INVMACROS INVSUITES INVTESTS INVWORDS NDOT OFFSET OK050 OK051 OK052'
zz=:zz,' OK054 OK055 OK056 OK057 OK058 OK059 OK060 OK061 OK062 OK063 OK064 '
zz=:zz,'OK065 PATHTIT READSTATS afterlaststr allnlctn allnlpfx allnlsfx app'
zz=:zz,'table appwords backupdates badcn bchecknames bgetdicdoc bgetexplain'
zz=:zz,' bgetgstext bgetobjects bnlsearch bnums bpathsfx btextlit checkback'
zz=:zz,' checkntstamp checkopen checkpath checkput closedict createst defwo'
zz=:zz,'rds delstuff delwordrefs didstats dnlsearch dupnames freedisk freed'
zz=:zz,'isklinux freediskmac freediskwin fullmonty getdicdoc getdocument ge'
zz=:zz,'texplain getgstext getntstamp getobjects getrefs gslistnl inputdict'
zz=:zz,' invappend invdelete invfetch invreplace islib iswriteable iswritea'
zz=:zz,'blelinux iswriteablewin jdatcreate jwordscreate loadalldirs loadall'
zz=:zz,'refs loadwords mainddir mnlsearch newdparms newregdict nlctn nlpfx '
zz=:zz,'nlsfx nubnlctn nubnlpfx nubnlsfx opendict pathnl pathref putdicdoc '
zz=:zz,'putexplain putgs putntstamp puttable puttexts putwords putwordxrs r'
zz=:zz,'pdtrim rplctable rplcwords sortdnub splitbname''                    '
zz=:3129{.zz
showpass 2 grp&> ". ". 'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}

cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
0fL41+>P&q+>Y`-3?U:(1b^X>C2[WX67sB1C2[W*@kB8TD..-r+A,Et+Co1rFD5Z2@<-W9@r,Rp
F"Rn/:-pQB$;No?+@0g[+E)@8ATAo(Bk)7!Df0!(Gp$U5@<6L$F!+n3AKYQ/FCf?2Bl@m1+E(j7
FD,5.A8,OqBl@ltEd8d;CghC+/e&._67sB[BOuH3@;Ka&F`V+:F*(i.A79Lh+Cf>-F*(i.FE8R5
DIal5ATD7$+Co%qBl7Km+DG^9FD,B0+Cf4rF)rrC$;No?%15is/g*N%ART[pDJ()#+A,Et+E(_(
ARfg)A7]@eDIml3@3?t4C2[W3+Dbt+@;KKtBl8$(Eb8`iAM+E!:-pQU6tLF]Ec65;DJ()#+A,Et
+E(_(ARfg)ATD4#ATJu9BOr;7BkhQs.3NGF@ps1b+DG_8ATDBk@q@8%$;No?%15is/g*N"DKK<$
DK@i]A8,OqBl@ltEd8dMFD5Q*FD5<-/0JG@DKBo.DKKqN+DG_8ATDBk@q?d+ATD7$%15is/e&._
67sBPDKKH1Amo1\3ZohoATD7$+DkOtAKYE)@;0Od@VfTu@X0)1C2[W*Ci<flCh5%)$;No?+<Ve9
B4Z0-+<Ve>ATT&5@VTIaFE8R:Ec5e;E-67FA8,OqBl@ltEd8d:@:O(qE-!-2$;No?+<Ve9DJUF<
+<Ve9@:O(qE$0%,D.Oi+BleB;+D,Y4D'3e+FED)7DK?6o:-pQU+<Y3+C`jiC+<Y3+Ch7^"+EqaE
A90:EFCfN8F"AGHEc6)>F"AGN@:O=rF"AGFF<G()FCfK$%15is/g)8ZA8,Qs+<VdLA8,OqBl@lt
Ed8dAA7]Y#BkD'h@<?4%D@HqJ67sB'+CoA++<VdL+Co1rFD5Z2@<-W9DIIBn+Dbb5FE8R:Ec5e;
E+*j1ATD[0%15is/g)8ZA8lU$F<D\KF(KH7+Co1rFD5Z2@<-W9E+*cqD.Rg#EcVZs:-pQU+<Y<-
AT2]5+<YK7F*&O;Ec6)>+CT.u+EM[>FCcS*AT23uA7]Y#Et&IO67sB'+D58-+<VdL+D58-+EqaE
A90:EFCfN8F"AGN@:O=rF"AGFF<G()FCfK$+D,Y4D'3A'@ruF'DIIR2%15is/g)8ZB5DKqF!)SJ
GAhM4+CT.u+EV19F<G44Ddm-k+DtV)AKZ#)An?!oDI[7!%15is/g)8ZB6%r6+<VdL@rc-hFCcS'
DIal0F_,T=+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YN0CLnV2+<Y<.DImisFCcRe+EM%5BlJ08
+CT.u+Cno&@:EYdAKYN+D/aP*$;No?+<VeDDJUF<+<VeD@;^?5A8,OqBl@ltEd8dF@;TQuCh[s4
F!,(8Df$V9@<?U&Ec,q-$;No?+<VeEATqZ-+<Ve:Eb/[$AKYl%G9CF1@ruF'DIIR2%15is/g)8Z
De't5+<VdLDfB9*F!+n/A0>AuDf]K2+Co1rFD5Z2@<-'nEt&IO67sB'+E1b!CLeP1+E1b!CER/%
@ruF'DIIR"ATJ:f:-pQU+<YWGF<D\K+<YWGF<GdGEb'5B+EV19FE8uUD.-ppDf[HPATT&)ATVL(
@3B9%FDi:4Bk)7!Df0!(Gmt*U67sB'+ED%+A0<!;+ED%+BleB-E\DQQEb/ltF*(u6+CQC'Bk)7!
Df0!(Gmt*U67sB'+ED%7FCZL:+ED%7FDl22+DbJ-F<G%$@r$4++CfG'@<?'k+C]U=-u`U)CLek'
$;No?+<VeIG]OuM+<VeIAS6.%@<*K%G]7\7F)u&6DBO"3@<,jk%15is/g)8ZF`V,8+<VdLGAhM4
F!,UHARlomGp%<LEb'56@;]TuFCfN8Et&IO67r]S:-pQU:2b5cF#ja;:-pQU+<X*nEc5t@D.Rd0
@:s.m+=KiX6m-&]Ec5u>+>>K'/MK"A.1HUn$=e!aCghC++<W%?C2[W1%16T`Bl8!'Ec`EOBkhQs
-OgCl$;No?+EV%5CER%rA8c?.Ci<`mARloqBl\9:+D,P4+A*b:/hf"&%17,eEHPu9AKW@8Anc'm
F!,L7B4Z<8+<V+#%15is/h1CCE+NotASuU2+F#Ii+EqaEA9/l(AS,XoARlotDBO%7BlbD<ARfgr
Df-\2@<Q3)Eb0&qFCeu*A7]@eDJ=3,Df0V*$4R>;67sBoDf^"CF)Y]#BkD'h+F5/HDe!3lAKYl/
F`)7CF(KG9A9Dp,DJ((a+E2@>Anc'm+Dbt)A8,po%15is/g)Pl.6T^78OccQ:*<P35tscj8Oc9I
;[j'C$;No?+Dbb0AKYSrARm>7@psCuBjkXc+ED%8F`M@N+EV%$+CT.u+Dbb0AKYQ%A9/1e9L_0+
0edr_/e&.T;E[&q1OEO_%16'#69R@iHXSN9$:@]b7Qie";CkL2%13OO:-pQUD.-ppD]j+2EbTK7
+E)4@Bl@l3@rGmhF!*%WFDi:1A7Qg"DfTD3@:Wmk@3BH!G9Cg5C1Ums+Cf>#AISuA67sBhDIal,
De*QoGp%3BAKYT'Ci"$6Bl7Q+A7]@eDJ=3,Df-\9Afsf66W-]Z=\qNr$;+5a;Fs\a4ZY>Q%15cp
<(0nP3\iH"$:n,j9KbEl1CX[n9h[]21,KFI<(0ng4ZY>U%15F)<(/r21,]RK9gMZM6r-lZ4ZY>W
%16*77Q<Ol1,o^M:g$ag:JO&61-#dN;c-4O3\rH!$;+5m:-CWo0b"I!$;No?+DkOsEc3(BAU&;>
FEqh:Et&IN5snOG<*<$d4ZZ266W-KP<%L^/<(0n?85r;W/6GV?/6#&?<%L@=<(/?45uL?D:KL:B
<E)FI/5TJK85Du3;c-4>8lJM\%13OO:-pQUDdmHm@rri'De*F#%1604;FEZ/0F\@g78m/K3\_'N
7oE,_:d$ip%16$68Q8,A3\q3P9gM-E:H^`q%13OO:-pQUA8,OqBl@ltEd8dKASbs$Eb/ioEb0,u
AISu78OHHK:JO2R=Znf'%13OO:-pQUDdmHm@rri2@;TQu@r,RpF"AGEAT23uA90dS=&2^^/6#&:
<%LO;:K:4B;cQCg74_/!6W-\h$;Wu\771$L6TmJ3:JsS3<(0_b/4WT6<DY5F<Cp.Y/58Dt;GR`/
%15is/g+V3A0>f"C1Ums+Cf>#ALns7AT23uA90dS:I7ZB6W?fJ%16QQA8bpl4ZZe.+>#2g><3lV
/h\>O3Zosr>p*]2+AY<r771$L6R#kH$4R>;67sC"@<?0*A7]RkD/"*'EZek*@<,ddFCfJ8-6R89
FD)e9F`(]2F^]B+Df-\-BOPpi@ru:&Et&IQ5u^BC78,j*+A#%(8PUCT+=AgI-OgDZ5u^BB85`AL
3[Z%2/hJG%:dJ&O6q'cY$4R>;67sC"@<?0*G%G]'F!*%WASkmfA0<O1+Cf(nEcW@6AT23uA8,po
+E)-?BQ%s6+AYoF$>=@!FE;#44ZX]68OccQ:4"?A>ULsI-n$K87TW/VHRE&O-Rg00/jMH\+C-FE
.1HUn$;No?+D#e>Ea`I"F!,C=Cj@.FBOr<*@<?0*Ao_g,+E;O4Ch[KqARloqBl%?'DIIBnEt&Ik
F`VYD@<?0G3a4WfI6&KV+<u=X-sJ_T/M8/M3Zoq*03g+P-TWV%4XhL'/g+@Z+=f&t>V7-q5u^BC
78,$k%13OO:-pQUA7]@]F_l.BD..L-ATAo4Ec5Q(Ch4`3F(KA7Ci<flFD5Z2Et&IO67sBqDe*p7
F*(u1E+*j%+DGm>Ch74#+D5M/@UX'qBOu3q+CT=6FD,B0%15is/g,=KEag/*F!,")Anc-oA0>T(
+DPh*Df.1AC3'gk8khTM<(0\J3biSDF*VhKASlBpFD)dEC2IC#FCfJ?%15^'6r6cW7QieIDe*p7
F*(u1E+*j%+=CoBA8lR-Anc'm/no'A-OgDT:IJ2]78c90C2[X(H#n(=D/`p*BHS[;De+!3ATD:!
DJ!Tq/no'A-OgCl$;No?.V3L.A7]^kDId<rFE7luC2[X(FDl22:-pQ_C2[X(FDl22+CcuT+EMXC
Ea`Tl+E(_(ARfg)@r,RpF#kFTG][M7F(oQ1+E(j7-u*[2.4u&::-pQB$;No?+@p3WATJu9BOr</
DId=!CjB`4B-:_nFCAWeF(I":Bl%?'F*VhKASiQ4F(Jl)FDi:CFDl22%15is/g+\=@ruF'DIIR2
+E(_(ARfh'/g+&'E,8rmBl7Q+FD,B0+Cf4rF)rI<F!+n-C`mh5@<<l<%15is/g,1GEHPu9ARlp*
D]iP'@;]^h+EV:.+Co1rFD5Z2@<-W9F*)>@@:s-oF*VhKASj%/$;No?%15is/g+2+Eag/*DKKH1
Amo1\3XlEk67sB'+C\hoARfLn@;TRs+<Y0-ARfLs+C\bhCNXS=DIIBn+E1b2FCfK1F!)SJ+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9$;No?+<Ve9B4Z0qBk([l
@ium:B4Z0-@UWb^F`8IHATDj+Df0V=De:,6BOr;sBk)7!Df0!(Gp$X9@s)X"DKI!D+<VdL+<VdL
+<VdL+<VdL+<VdL+<VdL+<VdL+:SZQ67sB'+C\tpFCf]9Cgh$q+<Y<.F<G%$@r$4++Eh=:F(oQ1
F!,C5+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%DK?pC+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd9
$;No?+<Ve9B4Z0tF*(u<F<D\KB4Z0-@UWb^F`8IHATDj+Df0V=De:,)Ec6)>06;8MFCcS.ART+\
EcW?G+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL%15is/g)8Z@V97oDdmHm@ruc7+D58-
+E(_(ARfh'+D,Y4D'3:r@r$4+F!)SJ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL
+<VdL+<VdL+<VdL+:SZQ67sB'+C]5)F(Jd#@qZu-+<Y`:@<,jkATJu5F`\a:Bk)7!Df0!(Gp$R)
@r$4++DtV)AKYf'F*)IGAoD]4F(oK1Ch4`!BOPpi@ru:&+Dbb5F<GO2FED)7DK?6o:-pQU+<Y-2
F_u1B+<VdL+<VeIATW'8DK?qCDJ=*5AKYGj@r$4++E):2ATD?m+Dbb5F<GL6+Co1rFD5Z2@<-W9
@UWb^F`8I@F_tT!EcW?G+<VdL+<VdL+<Vd9$;No?+<Ve:BOt[hDfB9*+<VdL@q]F`CNCV4AftN"
Gp$X3@ruF'DIIR2+DGm>DfB9*%15is/g)8Z@q]F`CN*^(BHSE?+Cf(r@r$-.@s)g4ASuT4E+*j%
+CSnkBl8!6+Co1rFD5Z2@<-W9E+*j%%15is/g)8Z@q]F`CN+E<+<VdL+Cf(r@r$-.BkAK"Bl\9:
+E1b2BHUi"@ruF'DIIR2+DGm>@3BN3F<G+.@ruF'DIIR2%15is/g)8Z@r-()ARoLbF<D\K+Cf5+
F(KD8A8,OqBl@ltEbT*+%15is/g)8Z@rc-hFCfN8+<VdL+DG_-FD50"BmO?3+EMXCEa`Tl+E(_(
ARfh'%15is/g)8ZA7]@sDfTB0+<VdL+Co%qBl7K)GAhM4Et&IO67sB'+Co&"F*)P:Afr3=+<Y3+
Ch7^"+E(_(ARfh'%15is/g)8ZA8,RqFCB94+<VdL+Co1rFD5Z2@<-W9F*(i4BleB1@ric$DIal/
@<?0*Bl7O$Ec#6,Bl@ku$;No?+<Ve;DJXB*@<,jk+<VdLF(Jd#@qZusDfQt<@;TQuE+*j1ATD[0
%15is/g)8ZB4Z0qDe!p,ASuT4+D58-+E(_(ARfg)A8bt#D.RU,@<?4%D@HqJ67sB'+D58-AU&01
@;0U%+<Y<.F<GX<DfTqBDdmHm@rri)G]7J-DIIX$Df0V*$;No?+<Ve>ATVR+FCf]=+<VdLB4Z0-
B6%p5E$/S,A0>r9Blmo/F(96)E-*4EAU&;+$;No?+<Ve>ATVg3F*(i-E$-8GB4Z0-DIIBn/0JGC
ART[pDf-\+DIal+@<6N5E-67FFD5T'F*(i-E,uHq:-pQU+<Y<.FDkW'ARfh'+<Ve>ATT&5@VTIa
FE7lu:-pQU+<Y<.FE1r)F!)SJ+<Ve>ATT&8AS,LoASu!hEt&IO67sB'+D5b3BleB6C`jiC+<Y<;
Dfp"A@;]TuF*22=AKYl!D.Oi+BleB;%15is/g)8ZBl7m4FC])qF<D\K+EV19F<G16EZf:0C1Ums
F!,17+E2IF+Co1rFD5Z2@<-W&$;No?+<Ve@DK]H-E+Not+<VdL@;p0sDIal(DK]T3FCeu*A79Rg
%15is/g)8ZBl8*)ASbq"AKW*<+Co&"ATVK+Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:An?'oBHSE?
+<Y9-FCSu,Bl8**Ecbl'+Cno&@1<Q=67sB'+DG_:Eb03+@:Njk+<YfGA79Rk+DG_:ATDm(A0>Dk
FC>Uc:-pQU+<YQ5GB.8-A8,Oq+<Ve:Eb/[$AKYl%G9CgE+ED%+BleB-EZen,@ruF'DIIR2%15is
/g)8ZDfB9*A8,Oq+<VdL+E)41DBN@1A8,OqBl@ltEd8*$:-pQU+<YW3FD,Q.+<VdL+<VeG@<?0*
DIIBn+Dbb5FE7lu:-pQU+<YWGFCf]9Cgh$q+<VeJFDl22+EM47Ec`FB@VTIaF<G.>E,8s#@<?4%
DK?6o:-pQU+<YWGFD#Y;+<VdL+<VeJFDl22+D5_5F`;CE@;]TuF*22=ATJ:f:-pQU+<YWGFDc2A
FCB$*+<VeJFDl22+DtV)ALns6Eb/[$Bl@l3@;]TuCghC,+E2IF+EV=7ATMs%D/aP*$;No?+<VeG
F`__6@VfTu+<VdLF*)>@AKWC=@;TR,FCf]=.3N&:A0<:<@;TR,@r,RpF"DEEG]YAWFCAWpATJ:f
:-pQU+<YWGFED)=FE8QI+<VeJFDl22+E(_(ARfg)A8bt#D.RU,@<?4%DBNA*A0>N*Dfp"PF*22=
AKZ)+G]\!9$;No?+<VeGF`_hGEb'56+<VdLF*)>@AKZ28Eb'5#$;No?+<VeGF`_hGEb'E8F!)SJ
F*)>@AKZ28Eb$;*Ci<ckC`mb0An?!oDI[7!%15is/e&._67sBUDffQ33XlEk67sB'+@U<kDfQt;
ATMp$B4Z-,-u*[2F*)>@AKZ#%DJ*N'0JtO90f1m>%13OO@rGjn@<6K4+=CT4De*p2DfTD:%16T`
Bl8!'Ec`EO@;9^k-OgCl$;No?.V*+0ASu$iDKKqBGV(Ki8l%irFDl22+Co&&ASu$iDKI"3AS,Xo
FD5Z2Et&Hc$:@Q_5uL?=3\V[!+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^@rHL-F<G"0A0>u.D.Rd1
@;Ts+D..I#%15Ht9M&/^4ZYDB+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN+DkP$DBNk,C1Ums+DG_(
AU#>6BleA*$:@QU:JFYa4ZYGC+<VdL:-pQUAnc'm+Cf>,E,TW*DKIo^D..-r+E(_(ARfg)@rH4'
Df0-(F<GC6F*%iu%15is/g,">Bl5&(Bl[cpFDl2F+D,>(AKYK$D/aE2ASuT4Ch[s4%15Ht6qL9>
3^ZY:5uL?,6V^<H;cG;8:.%fO:f@f1%15Ht6VKdE;a!0"+<VdL+AP6U+D,>(AKYK$D/aE2ASuTN
+EqaEA0>buD.Oi"CghC++E)9CD.-ppD]j.IE+KIc6V^!H76smE:JO&63$9>=67sBmBl%?'@rH4'
Df0-(F?1OgBOu'(DdmHm@rri;@<3Q'Bl\9:+CfG'@<?'k%15Ht6qKa6:I@9+1*@\^+AP6U+D,>(
AKYK$D/aE2ASuTN+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DBLMR-urm3A17rp6V^'P:eX/H:-CWm
0d%T667sBmBl%?'@rH4'Df0-(F?1OcBQ%p5+D#e:Cgh3iFD5Z2Et&ID:/F5S9iF291E[e_+<XEG
/g+b?Ch4`!Df'H3DIm^-3ZqsI@ruF'DIIR2+E1b0@;TRtATDi$$:@Qb<E)@P<(/r22]s4c:-pQU
Anc'm+Cf>,E,TW*DKIo^CghC,+EV=7AKYo#C1Ums+Eq78+=M2OF=@Y+6V^NJ7Qidi.qpUk+>P'7
67sC$AS,LoASu!h+Cf>,E,TW*DKI"C@:F%a%15Ht;G]YY83K!g3?TFe+AP6U+D,>(AKYK$D/aE2
ASuTN+ED%*ATD@"@q?d%@<?0*/KcHPBk2+(D(-TDBleA*$:@Qe8QnPG3]S<*+<VdL:-pQUAnc'm
+Cf>,E,TW*DKIo^F(or3+E(j7DdmHm@rri-DBND6FCfM&$4R>;67sBpDK]T3FCeu*B6%p5E$/S,
A0>r9Blmo/A79Rg+D,>(AKYK$D/aE2ASuU2%15[%<_$%`<DZUW3Zpdb:fUI_5u^9(6V^!H76smE
:JNH.:.88]9L26F%15[%<`<!i<(0_K3Zq!h<_$%`<DZU'$4R>;67sBpDK]T3FCeu*D.-ppD]iJ+
A0?)7Eb$;'@<>p#Anc'm+Cf>,E,TW*DKKq/$;!un9gM-E:K'D;+@Amk9L2TU/430/<E)@P<(/?*
:.%oJ5u^EO:+Sb-;b:.]/430$=AV[W8PT^%8PW;f:JsSZ4ZX].8PW;\5snOG;[j'C$;No?+DG_:
ATDm(A0>u*F*&O8@<>oe$;!un<(0_b;a!/a6V^HX<('#O74^f$6W-?=<(Tk\/43028QnP66V^'P
:eX/H:(7O>$;No?+DtV)AM.jCDfQt<@;TR.DIIBn+EM+5@<,duDfQt1BOPpi@ru:&%15iu:K0J<
-S?bh%13OO:-pQUFE2)4+ED1/BQP@FFE1f(Ch[d".3NS<FD)e-ASc'tBlmp,F!)VS.OdM5+Ab@'
845m?%17,pA9;j+D*9pc+<u=X><3lY/g+@Z+=\us>V7-q5u^BC78+n4+?^iQ%13OO:-pQUF)Yr0
F<G%$@r$4++DtV)AKYr#FED)7DBNG*%17/qCh\!#DIIBn4ZX]6:..lW-=UOuDfTE1FE/Kc+AP=#
<$l$cFCfK6FE/f>$4R>;67sa!DId9hE+NotASuU2                                  ~>
)
showpass 2 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
