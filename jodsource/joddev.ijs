NB. JOD dictionary dump:  4 Jul 2015 00:13:20
NB. Generated with JOD version; 0.9.973; 56; 4 Jul 2015 00:00:38
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


IzJODinterface=:<;._1 ' bnl del did dnl dpset gdeps get globs grp make newd od packd put regd restd uses'

IzJODtools=:<;._1 ' addgrp allnames allrefs delgrp fsen getrx hlpnl jodage lg locgrp ltx mls noexp notgrp nt nw obnames pr refnames revonex swex usedby'

IzJODutinterface=:<;._1 ' compj de disp doc ed et gt jodhelp revo rm rtt'

JODTOOLSVMD=:'0.9.973';57;'4 Jul 2015 00:13:20'

JODVMD=:'0.9.973';57;'4 Jul 2015 00:13:19'

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}


putallts=:3 : 0

NB.*putallts v-- puts all timestamps - see (getallts).
NB.
NB. monad:  putallts btCts
NB.
NB.   cts=. getallts__MK__JODobj 0
NB.   putallts__MK__JODobj cts

NB. HARDCODE: errmsg: invalid object timestamp table
if. -.(3,#OBJECTNC) -: $y do. jderr ERR0160 return. end.

NB. put dictionary name and object names
do=. {:{.DPATH__ST 
onames=. DIRNMS__do [ dname=. DNAME__do 

NB. HARDCODE: shapes
inc=. -INPUT [ ecb=. ;2{y [ nots=. 0 = #&> 0{y [ msg=. i. 0 4

for_obj. OBJECTNC do.

  NB. empty object timestamps
  if. obj_index{nots do. continue. end.

  NB. object name timestamps
  nts=. (<0 1; ,obj_index){y
  uv=. 2 , #&> 0{nts

  NB. decode any run encodings
  if. obj_index{ecb do. nts=. (<uv $ nlfrrle ;1{nts) (1)} nts end.

  NB. store timestamps - note errors but proceed
  msg=. msg , (2 {. (obj,inc) put nts) , (obj_index{onames) , <dname  

end.

msg
)

showpass soput ".'nl_',SOLOCALE,'_ i.4' [ cocurrent 'base' NB.{*JOD*}
".soclear NB.{*JOD*}
cocurrent SO__JODobj NB.{*JOD*}
zz=:dec85__MK__JODobj 0 : 0
2`2^:+>Y,p2'=Xs0ebF>1*A>++>P&o0JYI>+>GPm1*A;.1Ggp20f'q-+>PW.2'=V.+>P&o1cR03
0f^@3+>l)5+>Get1*A;.1Gh^"6pamF9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibj5+@:3bCh+Y`F_tT!E]P<t1a!o/@<?'A+>Gbs9jr&b1,(F?+>GT30ek^C0a\6p:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B&''6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU0fC.K@<*JG0JPF-0f(jJ
2```R$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2]s50F_PZ&+AR&r@V'R@+>Gbs+@KX[ANCqg
2BY_&EZd+k0f:(/0fh$L3]&c&$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_
ATBgS0fL3t6t(1K3Zp.9+AH9b+>PW*2'=V33]/oY0f9:F$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibj5+@:3bCh+Y`F_tT!E]P<t3$9>3@<?'A+>Ghu9jr&b1,(F?+>PZ41,1gF3=6*#:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B&''6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU0fU:M@<*JG0JPF-1,CsK
2EEZT$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2]s50F_PZ&+AR&r@V'R@+>PVn+@KX[ANCqg
3?V%)EZd+k0f:(.3'&fM3\W>s$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_
ATBgS1,0mo6t(1K3Zp15+AH9b+>PW*2'=V53\iHO2)P^J$;No?+B*Q,FCf;M+A,Et+<WsmFD,T5
3Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E.
/ibjF+<X!nBl%<&:3CD_ATBgS1,pC!6t(1K3Zp7%6#^ie1,(F?+>GW40K;*M2$sZt:-pQU;gEG+
ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV
67sB]ATDj+Df.TY0J5@<3B&]9+@:3bCh+Y`F_tT!E]P<t+<X'\FCdKU1a#)'EZd+k0f:(.1-.-E
3]&`%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N0d%T*F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqk
+@0se+>PW*2'=V.3\i]V0f]RJ$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjG+<X!nBl%<&:3CD_
ATBgS0d%T,@<?'A+>k9-E,m'V0JPF-0ek^F0KM$L$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
2_lKu6?R!YA0=WiD.7's3Zp1#+@KX[ANCqk+@0se+>PW*2'=V/3\W?N0fB@G$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibjG+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>k9-E,m'V0JPF-0etdI3'&`N
$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_lKu6?R!YA0=WiD.7's3Zp7%+@KX[ANCqk+@0se
+>PW*2'=V03\WHQ1,0+C$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-U
Bl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjG+<X!nBl%<&:3CD_ATBgS
2'=#0@<?'A+>k9-E,m'V0JPF-0f1pJ1HI<M$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_lKu
6?R!YA0=WiD.7's3Zp='+@KX[ANCqg3$:h9DBL\g0f:(.2EE]T3]/]#$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1*@]+F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp.:+A-co+>PW*2'=V43\W9L1GfFG
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjG+<X!nBl%<&:3CD_ATBgS3$9>3@<?'A+>Ghu8p,"o
1,(F?+>Gf90K2$J0FA-o:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&]9+@:3bCh+Y`F_tT!E]P='
+<X'\FCdKU0f^@KF`&<W0JPF-0ebXD0KLmB$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!
6?R!YA0=WiD.7's3Zp."+@KX[ANCqg3?Uq:DBL\g0f:(.0KLsG3\iJu$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.;+A-co+>PW*2'=Y13\`HP1cPgL
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1E[f.@<?'A+>PVn8p,"o
1,(F?+>>K10JY[E1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P="
+<X'\FCdKU1,'hCF`&<W0JPF-0JGOA2**NR$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!
6?R!YA0=WiD.7's3Zp:&+@KX[ANCqh1a#D5DBL\g0f:(/1-.-I3\W5p$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>t>b6t(1K3Zp17+A-co+>PW*2'=Y03\iQR1,]IH
$;No?+B*Q,FCf;M+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o
@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2]s52@<?'A+>Pbr8p,"o
1,(F?+>P]51GV!J1("?q:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=&
+<X'\FCdKU1,U1HF`&<W0JPF-0K;*K3BAlM$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\
+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!
6?R!YA0=WiD.7's3ZpF*+@KX[ANCqh2'>M6DBL\g0f:(-3'&lV3\iGt$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2'>M6DBL\g0f:(.0fh$E3\`;q
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>GSn+@KX[ANCqh2'>M6
DBL\g0f:(.1HI3M3\WDu$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@
+>GVo+@KX[ANCqh2'>M6DBL\g0f:(.2EEQM3]/i'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>GYp+@KX[ANCqh2'>M6DBL\g0f:(.2EEWL3\rW#$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>G\q+@KX[ANCqh2BYV7DBL\g0f:(-3'&oP
3]&Mt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>G_r+@KX[ANCqh
2BYV7DBL\g0f:(.0fh!C3]&i($49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r
@V'R@+>Gbs+@KX[ANCqh2BYV7DBL\g0f:(.1cdBN3\rQ!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<N1E[f,F_PZ&+AR&r@V'R@+>Get+@KX[ANCqh2BYV7DBL\g0f:(.2**NO3]/o)$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh2BYV7DBL\g0f:(.
2EEWQ3]&Z#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Gl!+@KX[
ANCqh2BYV7DBL\g0f:(/1-.*C3\rT"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&
+AR&r@V'R@+>PVn+@KX[ANCqh2BYV7DBL\g0f:(/1HI6J3]&]$$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>PYo+@KX[ANCqh2]t_8DBL\g0f:(-0KM'I3\`W%$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh2]t_8DBL\g
0f:(.0fh0L3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>P_q
+@KX[ANCqh2]t_8DBL\g0f:(.2**NK3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,
F_PZ&+AR&r@V'R@+>Pbr+@KX[ANCqh2]t_8DBL\g0f:(.2EEZO3\iW$$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Pes+@KX[ANCqh3$:h9DBL\g0f:(.0KM$I3]/c%
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh3$:h9
DBL\g0f:(.0fh!D3\WAt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@
+>Pku+@KX[ANCqh3$:h9DBL\g0f:(.0fh0G3\rJt$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>Po!+@KX[ANCqh3?Uq:DBL\g0f:(-3'&lV3\W5p$49Np/g+)<F*(u1
3Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?
+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Pr"+@KX[ANCqh3?Uq:DBL\g0f:(/0fh$G
3\iDs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh
3?Uq:DBL\g0f:(/1-.3J3\W8q$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r
@V'R@+>Y_p+@KX[ANCqh3?Uq:DBL\g0f:(/1-.3O3\`Q#$49Np/g+)<F*(u13Zq$j6m*U<F`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<N1E[f,F_PZ&+AR&r@V'R@+>Ybq+@KX[ANCqh3?Uq:DBL\g0f:(/1-.6N3\`N"$49Np/g+)<
F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Yer+@KX[ANCqh3?Uq:DBL\g0f:(/
1-.9L3]/Su$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bp
ATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Yhs+@KX[
ANCqi0H`u1DBL\g0f:(-3'&iP3\WH!$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK
@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&
+AR&r@V'R@+>Ykt+@KX[ANCqi0H`u1DBL\g0f:(.0KM'F3]/]#$49Np/g+)<F*(u13Zq$j6m*U<
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Ynu+@KX[ANCqi0H`u1DBL\g0f:(.0fh!I3\rJt$49Np
/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p
/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Yr!+@KX[ANCqi0H`u1DBL\g
0f:(.1cdHI3]/`$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Yu"
+@KX[ANCqi0H`u1DBL\g0f:(.1cdKJ3]/c%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,
F_PZ&+AR&r@V'R@+>Z##+@KX[ANCqi0H`u1DBL\g0f:(.2**EM3\iAr$49Np/g+)<F*(u13Zq$j
6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>bbp+@KX[ANCqi0H`u1DBL\g0f:(/0fh-G3\WN#
$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>beq+@KX[ANCqi0H`u1
DBL\g0f:(/1-.-J3\rZ$$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@
+>bhr+@KX[ANCqi0H`u1DBL\g0f:(/1HI3M3\rGs$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>bks+@KX[ANCqg+A-cm+>PW*2'=V-3\iEN1H>dL$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1c-<t6t(1K3Zp."8p+qm1,(F?+>GZ51,1gH
3=6*#:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P="2'=#0@<?'A+>G!2
F_i0U0JPF-0fV3K1-.9N$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's
3Zp7;+<X'\FCdKU0d')2C`kJe0f:(/0fh-G3]/i'$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>c#"+@KX[ANCqg+A-cm+>PW*2'=Y/3]&]T2)>RH$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1cQU#6t(1K3Zp."8p+qm1,(F?+>PZ42*!]O
1^XQs:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P="3?TG4@<?'A+>G!2
F_i0U0JPF-1,:mE1HI?P$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's
3Zp:6+<X'\FCdKU1*B23C`kJe0f:(-3'&fR3]&W"$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>kkr+@KX[ANCqh+A-cm+>PW*2'=V13]&`U2)YdK$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2)69s6t(1K3Zp1#8p+qm1,(F?+>G`70fM-L
2$sZt:-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#1E[f.@<?'A+>P'3
F_i0U0JPF-0f;!I0KLpH$47,867sBZH#n(=D)re3:IH<J6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's
3Zp::+<X'\FCdKU1*B23C`kJe0f:(.2**KN3]&`%$49Np/g+)<F*(u13Zq$j6m*U<F`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>l#!+@KX[ANCqi+A-cm+>PW*2'=Y13]&ZS0JNnA$;No?+B*Q,FCf;M
+A,Et+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU
<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS2)ZR"6t(1K3Zp7%8p+qm1,(F?+>>K10JGOD
3!p!":-pQU;gEG+ASjIN8l%ht+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b
5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=#2]s52@<?'A+>b35
F_i0U0JPF-0JGOB1HI6N$;+)^<)6:`;aOJU9LMEC;cHOj=Y_iA$;No?+B*Q,FCf;M+DPh*FDl)6
F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&o
F(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_ATBgS2BX,1@<?'A+>Gbs9jr&b1,(F?+>GT30ek^D1C=Hr
:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F
3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibj5+@:3bCh+Y`F_tT!E]P=%+<X'\FCdKU0fC.K
@<*JG0JPF-0f(jJ2``fM$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&''6?R!YA0=Wi
D.7's3ZpC)+@KX[ANCqg2BY_&EZd+k0f:(/0fh'D3\`Dt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A
6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5
DE8mo/ibOE2]s50F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp.9+AH9b+>PW*2'=V33]/oY0fB@G$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_ATBgS0ea^m6t(1K3Zp.:+AH9b
+>PW*2'=Y/3\iEN1GK4D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_
ATBgS0ejdn6t(1K3Zp.:+AH9b+>PW*2'=Y13]/fV2),FF$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<N+<X!nBl%<&:3CD_ATBgS0esjo6t(1K3Zp.;+AH9b+>PW*2'=V53\iHO0Js1E$;No?
+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;
D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp15+AH9b
+>PW*2'=V53\iHO2)kpM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp
+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N+<X!nBl%<&:3CD_
ATBgS0f1!q6t(1K3Zp7%6#^ie1,(F?+>GW40K;*M3!p!":-pQU;gEG+ASjINC2[X)Df9H5+<Wsm
FD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM
+>>E./ibj5+@:3bCh+Y`F_tT!E]P<t2'=#0@<?'A+>b3,E,m'V0JPF-0etdE0fh-M$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&''6?R!YA0=WiD.7's3Zp.8+<X'\FCdKU2'>2(EZd+k
0f:(.0fh'M3\iGt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJn
D..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2]s50F_PZ&+AR&r@V'R@
+>Get+@KX[ANCqk+@0se+>PW*2'=V.3\rHN1cYmM$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8
E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/
3A*<N+<X!nBl%<&:3CD_ATBgS0fU9u6t(1K3Zp:&6#^ie1,(F?+>GW40JbaE2[Tm!:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibj5+@:3bCh+Y`F_tT!E]P<t3?TG4@<?'A+>k9-E,m'V0JPF-
0etdI3'&`O$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZII
CcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&]9+@:3bCh+Y`F_tT!E]P<t
+<X'\FCdKU2'>2(EZd+k0f:(.1HI3J3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]
8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE
2_lKu6?R!YA0=WiD.7's3Zp1#+@KX[ANCqk+@0se+>PW*2'=V13]&WR1H5^K$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1*@]+F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.:+A-co+>PW*2'=V4
3\`<L1bf=E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Fu]
6t(1K3Zp.;+A-co+>PW*2'=S43]/ZR0Jj+D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>P&^6t(1K3Zp.;+A-co+>PW*2'=S53\rNP0JNnA$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Y,_6t(1K3Zp.;+A-co+>PW*2'=V-
3\iBM0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>b2`
6t(1K3Zp.;+A-co+>PW*2'=V-3\iQR0K0=G$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+>k8a6t(1K3Zp.;+A-co+>PW*2'=Y13\`HP2),FF$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+?(Dc6t(1K3Zp13+A-co+>PW*2'=S,
3\WEP1b]7D$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=
+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+?1Jd
6t(1K3Zp17+A-co+>PW*2'=Y03\rNP1c#IG$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8
DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N
1E[f,F_PZ&+AR&r@V'R@+?:Pe6t(1K3Zp18+A-co+>PW*2'=S43\i]V0f'.D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>GPm+@KX[ANCqh2'>M6DBL\g0f:(-
3'&lV3\iJu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp.3
+<X'\FCdKU1,U1HF`&<W0JPF-0f(jE3BAiQ$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B&`:+@:3bCh+Y`F_tT!E]P<t1*@]-@<?'A+>Pes8p,"o1,(F?+>Gc80f;!L3!p!":-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS0f'pp6t(1K3Zp18+A-co+>PW*
2'=V33\rNP1H#RI$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@
+>G\q+@KX[ANCqh2BYV7DBL\g0f:(-3'&oP3]&Mt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE2_uR!6?R!YA0=WiD.7's3Zp.7+<X'\FCdKU1,^7IF`&<W0JPF-0ek^C0fh0G$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P<t2BX,1@<?'A+>Pht8p,"o
1,(F?+>G]61,h6M1^XQs:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_
ATBgS0fL3t6t(1K3Zp19+A-co+>PW*2'=V23\r]U0JEh@$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Ghu+@KX[ANCqh2BYV7DBL\g0f:(.2EEWQ3]&]$$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp.;+<X'\FCdKU1,^7I
F`&<W0JPF-1,:mE0KM!I$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`
F_tT!E]P<u0H_K+@<?'A+>Pht8p,"o1,(F?+>P`60f;!K2@9cu:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1,0mo6t(1K3Zp1:+A-co+>PW*2'=S,3]/]S1,0+C
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>P\p+@KX[ANCqh
2]t_8DBL\g0f:(.0fh0L3\WK"$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp16+<X'\FCdKU1,g=JF`&<W0JPF-0f;!J1-.*G$47,867sBZH#n(=D)reSDe*s.
DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]
ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P<u1a!o/@<?'A+>Pku8p,"o1,(F?+>Gc81c.6K
3=6*#:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`
Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1,U0s6t(1K
3Zp1;+A-co+>PW*2'=V-3]&ZS2)P^J$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#2
6nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,
F_PZ&+AR&r@V'R@+>Pht+@KX[ANCqh3$:h9DBL\g0f:(.0fh!D3\WAt$49Np/g+)<F*(u13Zr0U
A9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)
/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp1:+<X'\FCdKU1,pCKF`&<W0JPF-0ek^H
0KM!E$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J
@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P<u3$9>3
@<?'A+>Pr"8p,"o1,(F?+>>c91c[TN0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5
BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH
+<X!nBl%<&:3CD_ATBgS1-$I"6t(1K3Zp1<+A-co+>PW*2'=Y/3\`HP1,91D$;No?+B*Q,FCf;M
+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:
$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Y\o+@KX[ANCqh3?Uq:DBL\g0f:(/
1-.3J3\W;r$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p
3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp45
+<X'\FCdKU1-$ILF`&<W0JPF-1,:mH3BAlR$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP
+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<
3B&`:+@:3bCh+Y`F_tT!E]P=!1*@]-@<?'A+>Pr"8p,"o1,(F?+>P]51cIHM2@9cu:-pQU;gEG+
ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1
@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1G^-r6t(1K3Zp1<+A-co+>PW*
2'=Y03]/`T2)#@E$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i
@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@
+>Yhs+@KX[ANCqi0H`u1DBL\g0f:(-3'&iP3\WH!$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_
DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo
/ibOE2_uR!6?R!YA0=WiD.7's3Zp49+<X'\FCdKU1GBqDF`&<W0JPF-0ebXG0KM'I$47,867sBZ
H#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LPATAn97;ZIICcW\J@;BFpC1K=b5\FqB
Bl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`F_tT!E]P=!2BX,1@<?'A+>Y\o8p,"o
1,(F?+>GT30K2$K0a\6p:-pQU;gEG+ASjINC2[X)Df9H5+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/
+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;mBl@lM+>>E./ibjH+<X!nBl%<&:3CD_
ATBgS1H-F!6t(1K3Zp44+A-co+>PW*2'=V13]&NO2)GXI$;No?+B*Q,FCf;M+DPh*FDl)6F!)Sk
F`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr3B9?;D..-p/n8g:$;No?+BE&oF(oQ1
3Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>Yu"+@KX[ANCqi0H`u1DBL\g0f:(.1cdKJ3]/f&$49Np
/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8
B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp4=+<X'\FCdKU1GBqD
F`&<W0JPF-0f;!G2``]J$47,867sBZH#n(=D)reSDe*s.DesJ;+@1-lBQ%oP+A-QcDBM>"+@9LP
ATAn97;ZIICcW\J@;BFpC1K=b5\FqBBl#D3Df#hV67sB]ATDj+Df.TY0J5@<3B&`:+@:3bCh+Y`
F_tT!E]P="0H_K+@<?'A+>Y\o8p,"o1,(F?+>PZ41bh$F3=6*#:-pQU;gEG+ASjINC2[X)Df9H5
+<WsmFD,T53Zq%5BPnq\/g*JhCLqN/+@U-UBl#gQ@UX%`Eb],F3C%4o@;0O1@rH2k:-pQU<b6;m
Bl@lM+>>E./ibjH+<X!nBl%<&:3CD_ATBgS1bg*q6t(1K3Zp44+A-co+>PW*2'=Y03\`NR1H,XJ
$;No?+B*Q,FCf;M+DPh*FDl)6F!)SkF`_;8E]P=8DeO#26nTTK@;BFp+<X*i@;0O=+C\bpATDNr
3B9?;D..-p/n8g:$;No?+BE&oF(oQ13Zp+/3A*<N1E[f,F_PZ&+AR&r@V'R@+>bhr+@KX[ANCqi
0H`u1DBL\g0f:(/1HI3M3\rJt$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp78+<X'\FCdKU0d')2C`kJe0f:(.0KLsD3\rc'$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp79+<X'\FCdKU0d')2C`kJe0f:(.1HI9G3]&i(
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp7:+<X'\FCdKU
0d')2C`kJe0f:(.3'&cL3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp7;+<X'\FCdKU0d')2C`kJe0f:(/0fh-G3]/o)$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp7<+<X'\FCdKU0d')2C`kJe0f:(/0fh-K3]/`$
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp7=+<X'\FCdKU
0d')2C`kJe0f:(/0fh0P3\WDu$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp7>+<X'\FCdKU0d')2C`kJe0f:(/1-.*F3]&i($49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:6+<X'\FCdKU1*B23C`kJe0f:(-3'&fR3]&Z#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:7+<X'\FCdKU
1*B23C`kJe0f:(.1cdHO3]/i'$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp:8+<X'\FCdKU1*B23C`kJe0f:(.2**HN3\rZ$$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:9+<X'\FCdKU1*B23C`kJe0f:(.2**KH3\`Q#
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp::+<X'\FCdKU
1*B23C`kJe0f:(.2**KN3]&c&$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)
6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!Y
A0=WiD.7's3Zp:;+<X'\FCdKU1E];4C`kJe0f:(/1HI?L3\W>s$49Np/g+)<F*(u13Zr0UA9;a.
Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$A2uY8B5M'kCbB49D$j$)/g+2+
EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:<+<X'\FCdKU1a#D5C`kJe0f:(-0KLmA3\rc'
$49Np/g+)<F*(u13Zr0UA9;a.Ci^^A6$79_DfRl]8oJB\+@Ih)6=FY@EZcJnD..-p3Zqm?CLqO$
A2uY8B5M'kCbB49D$j$)/g+2+EcYr5DE8mo/ibOE2_uR!6?R!YA0=WiD.7's3Zp:=+<X'\FCdKU
1a#D5C`kJe0f:(-0KLpE3\iArBPDO0DfU,<De(U^B4YslEa`c;C2[W*/KeP:@;]^h+D>J1FDl2F
%156]4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Zs5]%14=),9SZm3A*<N1E\7l8p+rq+>bVl1,(F?
+=Kg!A7]^kDId<r@q?cN@<itaA8-."Df.!5$4R=b.Nh#"DImHhFD5o0+E)4@Bl@l3@rGmh+CJP2
1ghG>@<3Q#AS#a%@:Wn[A0>u4+CJhnFC65"DIaktE-681+EVN2$6UH6F*2G@DfTqBFD5T'F*(i-
E$045EbSruBmO30Bl@lA+BN5fDBMPI6m-,RDImisFCfM9A9Da.+EM%5BlJ08%144#+EqOABHU]"
@;BF^+DGp?A8c%#+Du+>+DG_'Cis9"+E(_(ARfg)@rc-hFD5Z2+CT.u+DbJ-F<G(,@;]^h%144#
+EV=7ATMs%D/aPK+@p']@q@26GA(Q*+CQC'F_u(?F(96)E-*4:F!,LGDCcoEF<GU8F(KH7%144#
+E(_(ARfg)FD5T'F*(i-E-!.DD]j7;ASrV?BlkgIEcl8@+=_8IF<Gd@ASrW4BOr;sBk)7!Df0!(
Gmt*'+<YT3C1UmsF!,[?ATD?)@rc-hFCeu*DfQt:@<6N5@q]:gB4YU+.NfiC$4R=b+<VdL+<Ve%
67sBu@;TR/@rc-hFD5Z205P'<FDuAE+EV=7ATMs%D/aP*$6UH6+<VdL+=D2>+EqpK-TsL50Ha^W
1a$FBF<Gua+ED%:D]gDT%144#+<VdL+<W%P@j#E+F!j+3+>P'H0f1"cATT&C/g)nlEb0E4+=ANG
$4R=b+<VdL+<Ve%67sB/GB@mWB682D+CT;%+C]86ARlp*@:F%aF!,[@FD)dF@VfOj.3NM:D.Rc2
Bl5&8BOr;uBl\9:+EDCE+CT.u%144#+<VdL+<XEG/g+bBDdda%DJ()(Ea`I"Bl@ltC`m7sGp"MI
F=A>XH$O[PD.I00An3$+Bl.F&FCB$*F!,17+EV:.+EM+(Df0(p$4R=b+<VdL+<Ve%67sC'E+EC!
AKYr7F<G+.@ruF'DIIR2+EV=7ATMs%D/aP=%144#+<VdL+<W?\?SOA[E-67FGB@mK%144#+<VdL
+<WE^?SOA[E-67FB682;+:SZ#+<VdL+<Vd9$6Uf@5p1&VG9C:(E-#T4?m'DsEa`frFCfJ8?rBEm
5tOg;7n$f.BOPs)@V'+g+CSekARlp*D]iP.DKKo;C^g^o+<Y3;D/a3,B-;;1D.Rd1@;Tt)/g+5/
ASrVu;FOPN8PVQA7:76LG\M5@F!+n/A0>T-+EM+9+EVNE?nl%3%144#+EV=7ATMs%D/aP=@<,p%
F(KB+@;KY(ARlolDIakuE,]B+A7]9oFDi:4F_u(?F(96)E--.R+B3#c+Co%q@<HC.%144#+Eh10
F_)\0F!+jE?nNR0;FOPN8PVQA7:76PF!+m6DIn#7A8,OqBl@ltEd8dH@<,dnATVL(+CT.u+EqO9
C^g^o+<YQ?F<G.>BleA=Bl5&(Bk)7!Df0!(Bk;?.@rc-hFCeu*@V'.iEb-A8BPDN1G%G]8Bl@lA
%144#+B3#gF!+t$DBND"+Cf(nDJ*Nk+C]U=Eb/a$ART[pDJ()6BOr<'@<6O%EZet.Ch4_sC2IC#
FCfJFBkh6f+:SZ#+<Y*1A0>o(Ci<`mBl7Q+A8,OqBl@ltEbT*++D,Y4D'3A3D/^V=@rc:&FE9&W
;e9M_?tsUj/oY?5?k!Gc+<Y97EZf4;Eb-A(ATV?pCi_3O<H)JWFCcS:BOr;oC2[WnDe!p,ASuTt
+CSekDf-\>D]i\(F<D#"+<VeKBOr;rF`MM6DKI"/C2[W8E+EQg+D#(tFD5Z2/g(T1+<Vd9$6UH6
+<VdL+CoG4ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO
+<VdL+<VdL:-pQU@:WmkFD5T'F*(i-E-!.DD]iS5D/^V=@rc:&FE7lu+<VdL+<VdLA8lU$F<Dr/
78uQE:-hB=-Ta$l$4R=b+<VdL+<Ve%67sBkF_u(?F(96)E--.DDJs_A@rH7,@;0U%DdmHm@rri8
Bl.F&FCB$*Et&I!+<VdL+<VeD@;BEs-RT?1%144-+CK&&F'p,#BOPdkARlp*D]j1DAKYl%G9C:(
E-#T4?m'DsEa`frFCfJ8?rBcr<(9YW6q(!]/e&.1+<Xa!ASrVu;GU(f7Sc]G78dM9AU%p1FE8R5
DIal(F!+m6?tsXhFD,&)8g%V^DJ!TqF`M&(+:SZ#+<Y97Ch.*t+CK&&F'p,7EbTW,F!,+,DImis
FCeu*F(96)E--.DFDi:DBOr;oC2dU'BODrpDerrqE\7e.+<VduAftJZ:JXqZ:J=/F;ICVXDe3u4
DJsV>AU%p1F<GLB+DGm>DJsV>@3?\&Df00$B6A6+A0>8pE+*j%?m''"Ch.*t%144#+D58'ATD4$
ARlp)@rc:&FE8R5Eb-A;EbTW;ASrW4D]j+C@;]UaEb$;'Bk)7!Df0!(Gp$^;Ch.*tF"Rn/+<Ve7
;GU(f7Sc]G78dM9BlbD*CiaM;@3BH!G9Cj5Ea`frFCfJ8@;]TuGA1l0+Du+>+D#e3F*&O=D@Hpq
+<Y3/@ruF'DIIR"ATJu(Eb/[$ARlomAS,k$AKZ).BlbD?ATDj+Df.0M+:SYe$6UH6+<VdL+CoG4
ATT%B-Ql/N/g,4KDg*=CF`\a:Bk)7!Df0!(Gp%'7Ea`frFCfJ8F(KH8Bl7R)%13OO+<VdL+<VdL
:-pQUF(KG9;GU(f7Sc]G78b7MD]iI28g%V^DJ!TqF`M&(+D,P.A7]cj$6UH6+<VdL+CoG4ATT%B
;GU(f7Sc]G78bKp-[p2ZATBG=De*m,Dfd?9$4R=b+<VdL+<Ve%67sBnASu("@<?'k+EM%5BlJ08
+CT;%+Du+A+Eqj?FED)3+EVNEFD,5.8g%_aCh.*t%144#+<VdL+<YN;F!)iFDe*L$Dfp#:@;TR'
%13OO+=\L*D/aN6G%G2,ATDg0EZf%(DIdQtDJ()(DfQt;@;^?5?tj@oA7-N0@:UKoDdt7>GAhM4
F#kFbARuulC2[X%Ec5Q(Ch555C3*c8%13OO+=\LAF*D2??m&lqA0>8rFEh19Eb0*+G%G2,Ao_g,
+CJr&A9;a.Ci`u,@r,RpF"SS8F(HJ%F)5E4?m'0$F*(u%A0>f&+CK87AU%Sl$6UH6@;]Tu?u:-r
+D,P4+CK#-G[N-H;e9M_?tsUjE,ol/Bl%?5Bkh]s%13OO+=\L$De*E%AoD^,@<?4$B-:o*E,ol?
ARlotDBN>%De(J>A7f3l@;]TuEb0E.F(oQ1F!,=.A7ZlqDfQt1BOPdkATJu9D]hYJ6nSoU%14=)
,9SZm3A*<N1*A.k6#^jYC`kSd+>PW*2'=;9@<6O%EZde`B-9WRBln'-DCH#%%144-+A,Et+DbIq
F!,UEA79RkA0>u4+EDUB+E)-?=(uP'+AH9S/0IW#DKU1HF*VhKASlK@%13OO+=\L.Bl7j0+Cf(n
DJ*O%+EVNE?tsUj/oY?5?m'Q0+EM[EE,Tc=+DbIq+Cf(nDJ*O%/e&-s$6pc?+>>E./ibj5/Kdbr
Earc*1,:C'1,(F?%13OO+=\LADIn$&?m&rm@;]^hA0>u4+Du+>+Cf(r@r!31DesQ5AKZ&.H=_.?
GA(Q*+CIZ:77C-O5sn(K+DGm>H=_,8/e&.1+<X^'CisT++EM7CBl7Q+D..]4E+O'%DfT\;E,TZ8
Cj@.ADBNh.FE_YDCERe=CisT+F!+n/A.8kg+<Y9)Bl"o'DKKT5AScW7Df-[A@r-(+A0N.8CghEt
DfT]9/e&-s$6Uf@8l%ht@WcC$A9/l1De*QoBk:ftFDi:BF`&=?DBN"pDCco)@:Li29PJBeGT_'Q
F*(u1F"Rn/%144-+@Kd[ASu$iDI[6#Df-\*H=gl-ATM6%@:WneDBNt2D/XT/A1f!4H=gl-ATM6%
A7]^kDIdf2Df-[R1*C%?F:AR"+<Xa"DId[0F!+n/A0>T-+Du+>+E27>FCAWpAM+E!%144-+CJ/[
F*'fa@ruF'DIIR27!3?c?m'K$D/XT/A0>K)Df$V6@;0U%8l%htA8,OqBl@ltEd98[<+oue+EM77
B5D,g$6UH6Cgh?sAKYo#C1Ums+C]J1E+NQ&F`8IFBOr;oC2[W8Bkh]s+CoV3E$043EbTK7+C]U=
AncF"+Dk\&@:FM(ATKIH%144#+CJ/[F*'fa@ruF'DIIR27!3?c?m'0)+Du+A+EMXCEb/c(Bl5&$
C2[X)ATMrGBkh]s+CTG%Bl%3eCh4`-DBMG`F@^O`+EM+*3XlE=+<Xm'De*s$F*'$KC3*Z/BQS?8
F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A9Da.F"_!=DdkADBl5j_C2[X)ATMrGBkh]<%13OO
+=\L3AThd/Bl@m1+DkOtAKZ)5+AbHq+CoD#F_t]-F<Ft+De(J>A7f4%+:SYe$6Uf@7W3;iD/XH+
+Co&*@;0P!+EM+*+EV:.+C]/*B-;/3F*%iu+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En
-tm^EE-"&n04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+
Df.-\/NGCC2_QTh$6UH6%14=),9SZm3A*<L+>"^.F`(b51,UU*1,(F>%13OO+=\LAAU&<<@rH<t
F'p,#BOPdkARlp*D]i_%DIdQp+E;OBFCeu*B4Z++DIakuF)u&.DJ`s&FE8R@Bkq9@%144#+<VdL
+<V+#+<VdL+<VdL-X_%0BlbD2F!,C:-TsL5.psr:.Nf0-+<VdL+<VdL-X^e0Eb-A)BP8bV/g)BH
,Rk(i$6UH6+EV:2F!+q7B-;5+F*2;@ARlotDBN>"Ci<d(?m'<#F(9#pF)u&-H"h//+DtV)ATKI5
$4R=e,9n<b/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6Uf@?tFFf+E_X6@<?'k+EVNEF*2G@DfTqB
8g$)G0JXb^A8-.(EcWiB$4R=e,9n<b/ibOE1E\7l:2b;eD.7's+>P]'+>PW*1CX[#$6Uf@?uBI^
+Eh=:@N]/o@;]^hA0>u4+EVX4E$/t2D/")7ATDg0EcW@8DfQtDATE&=Ci=3(+DtV)ATKI5$6UH6
+B3#c+EMX5DId0rA0=JeA7]@eDJ=3,Df-\>BQA$8F!+m6Ch[a#F<G.8Ec5t@AoD]4DIIBnF!,%=
@qB4^Bl7Pm$6UH6+>Pf3+Cf(nEa`I"ATDiE+:SYe$6pc?+>>E./ib[0/KdbrEarc*0JP+$1,(F=
%13OO+=\LA@rH4'C1&/pH!t5+@:Wn[A1f!40d'tED/a544$"a5DfTA2Ch[s4-X\';ASl@/ATJ:f
+<Ve:Df'?&DKKqN+E2@4F(KB8ATJu1ART+`DJ()9BPDR"F)YPtAKYE!A0>o(A9DBnEt&I!+<YND
CijB1Ch4_uCgh3sF!,:5DIml3FDi:?DIjr"Cgh3s+Dbb0AM,*)BPDN1Eb031ATMF#FCB9*Df-!k
+<Ve@F!,UHAS-($+EqL1DBNt2@:X(iB-:]&A7ZllF!,1=+EM[EE,oN2F(KD8@rH4$ASuT4@r-:0
FCfJF%13OO,9nEU0J5@<3A;R-+A-'[F^]<9+>Gl-+>PW*1CX[#$6Uf@+A,Et+EMIDEarZ'@rGmh
+DGm>DJs_A@<Q'nCggdhAKYo/+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:0.AL_$6UH6+B3#c
+EMIDEarZ'BlbD-BleB:Bju4,ARlotDBO%FD]j(3E,Tf3FDl26ATKmA$6UH6+:SZ#+<Vd]/g+A5
De*-%BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9.3N,=DKK<$DK?qBBOr;uBl%@%%144#
+<VdL+Co2-FE2))F`_2*+EqOABHTo59J.GeBOr;pA7TCrBl@ltC`m8&Eb/a&DfU+G?tsUjBkh]s
+:SZ#+<VdL+<Y?9Ch.T0Ap%p+Gp$U8D/Ej%FCeu*8l%ht@r,RpF!,(/Ch7Z?+<XWsAKZ&9@;]Ua
Eb#Ud+<VdL+<Ve!5tiDB@rc:&FE8R5Eb-@;@rH4'Eb0<5ARmD;%144#+<VdL+<V+#+<VdL1+j\R
C2[WnDe!'$BQS?8F#ks-B5)I$F^ct5Df%.:@;BFpC1K=b05>E9A8bs,+D>\0A9/l%ChsOf+<VdL
+<VeKBOr;o9OUn3=C<7[DIal2F`;;<Ecc#5B-:f#Ch7Z1DImBiARlp*D]iM3Bl%<&FD,4p$6UH6
+<VdL8l%htD..=)@;I&oC2[W8E+EQg/e&.1+<VdL+<V+#+=\L/F_t]1Dfp+D8l%ht>Bb"+CM@[!
+Co1rFD5Z2@<-'nF'U2-FEDJC3\N.!Bln$2@P2//D(f@,CLqO$A2uY'C2[WnF_u)=.3K',+<Ve8
Eb-A2Dg*=4G%#*$@:F%a+E)-?7qm'9F^csG%144#+:SZ#.Ni,0E-#T4?m&p$B-:f#G\(D<+A$Yt
G@>P8@;KauGA1r-+E1b0@;TRtATA4e+<Ve:BOPdkATJu4DBN=b76s=;:/"eu+Co1rFD5Z2@<-'n
F"SS'Bk)7!Df0!(Bk;?.%144#+Dl7BF<G%(+DG^9@3ArU76s=C;FshV?m'N4@<?''FDi:3BOPdk
AKYAkE-#T4+=AOE+E1b0@;TRtATDiE+:SZ#+<VdL+<Vd9$6UH6+<VdL+CoG4ATT%B;FNl>=&MUh
7402e$6UH6+<VdL+CoG4ATT%B5uU-B8N8RT4#%0O+<VdL+<VdL%144-+D,>4ARlp#Ble?0DJ()"
.!R:&.3N/8F)W7I?m&luB6A'&DKI">E-,f4DBO.:ATD>k$6UH6@!H'%BlbD2DBN>$/g*#Z/g+50
FD)e=BPDN1@q]:gB4W2n1*AP!A8-+(+FPkTEc<BR?m#mc+<VeEDg*=7Ble60@<lo:F(fK4F<G4:
Dfp"AA8bt#D.RU,F!,4?F*&O@Bkq9&%144#+CHrI3?VjHF)W7M/n]3D-RW:EA8-+(CghU1+Dbt6
B-:`'@s)X"DKKqP+:SYe$6Uf@?uC'o+EV13E,8s)AKZ&9EbTE(F!+t+@;]^hA0>u4+DkP/@q[!,
BOqV[+<VeJFE2)5B6,26AftK!B4G=%+CK)"@pgEnF!+m6F`_>6BlnVCG%G]'+DG^9FD,4p$6UH6
A8-+,EbT!*FCeu*8l%htA8,OqBl@ltEbT*+3ZrKTAKYAkBle59-Z3R,-X\P9$6UH6<+ohcFCf<.
CghEs+EMXFBl7R)+CT;%3ZqgWIT1cE?n<F.H[\80I:+TK@!d>jIXPTT+:SZ#+<Y*1A0>9,IT&X`
I:+10DfQsCFD5i5ALns4F`_;8E\&>D@<?''-t%=GH$O7FDId9c.3N&:A.8kg+<Y`=DfTqBA79Rk
+=LWCH#7J;A7T's/e&.1+<V+#+=\LADKK8/A9hTo+CSekARmD9+@0lf@!H'%@<-"'D.RU,+DGm>
%144#+CQC&BOPpi@ru:&+Dbb5F<GL6+EMXFBl7Q+Eb03+@:NkcASuU2%144#+EV:*F<G"4AKYE#
E,96"A0>u4+CK;&F*)JFF^e`0+EM+*+CJ_oF)W6LFCfN8F*)P6-X\J7$6UH6@:jUmEZfI8D/a<"
FCcS9FE2)5B6,2(Eb-A4Ec5H!F)to'/g+,,AISth+<Y91EcZ=F@q]:k@:OCjEZf(6+EV:.+EMXF
Bl7Q+A7]RkD/"*5%144#+ED%4CgggbD.RU,+E1b'EcWiB$6Tcb+<VdL+<VdL-R3,7@;]^h,>CTO
@;]U#=\i$F+Du9D-Z3L>FCfN8-OgCl$6Uf@?u9Oa/0J>;FC6XB?u9Xd/0JA=A0>9%FC653ASl@/
ARloqEc5e;?tsUjFDl)6F'pUC<+oiaAKYPpBlkJ2ASc<sEcVZs+<Ve8Eb-A2Dg*=BE-,f4DII?t
Gp$X/Anc-oA0>T(+CKY,A7TUrF"_0;DImisCbKOAA1q\9A8lR-Anc'm/no'A?nNQ2$4R=e,9n<b
/ibOD2'=In:LeKb@V'R&0f(@'1,(F<%13OO+=\LAC2[X!Blmp,@<?'g+D5_5F`8I3A7T7^/g+)(
AKYA9+?:QTBle59-YdR1Ch\!&Eaa'$-X[Aj+<Ve8DIal3BOr;qCi<r/E,Tf>+BqcUD.tRqBlmp,
@<?&i$6UH68l%i\-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;1,(F<0/5.60JP5%ASl-5
Ch\!&Eaa'$/S]370.A"Q$6UH6AoD]4A7]jkBl%i"$4R=b.Ni+n5uL?D:KL;!+DkOsEc3(BAU&;>
@rGmh+>Pku@:Wn[A1e;u+<Vd9$6Uf@?o9';Ble59-RW:EDJs_AA8-+(CghU1+CT/5+E)F7Ea`d#
+E2IF+Co1rFD5Z2@<-W9A8bt#D.RU,@<?4%DCuA*+:SZ#.NfjNBl7j0+CJr&A1hh3Amc`mA8-.,
+CT.u+CSekBln'-DK@E>$6Tcb+=\L4FCB33Bl7Q+FD,5.E,ol,ATMo8De:,%Df0`0Ecc#5B-;&0
F*&Ns:IH=9De!p,ASuT4%144#+EV1>F<G[D+Br\kEbf3(GA^\7BQS?83\N-s@<-("B4bjuAR](a
CbBU:F>%TRDe`inFE9*P@<--oDg-(P.3K',+<Ve@DI[L*A8,po+EV:2F!,"3@s)X"DKIL8?85^p
$4R=e,9n<b/ibOD0H_qi8p+rq+>GW&+>PW*1(=R"$6Uf@A8,OqBl@ltEd8d<De!p,ASuU2+EM+9
+CT.u+D,2,@q]Fa+EqOABHU\?+E2IF+=C]<@j!BV/gk$9$6UH6@;]Tu?o9'>ATT%B-X\'*Eb-A2
Dg*=F@<Q3m+DG^9A9Da.+EM%5BlJ08/g+OZ+E2IF+=Aco-X\&+$6UH6BlbD,Df0Z;Des6$A0>?,
+CQC1ATo89@<,dnATVL(+CJr&A8kstD0%=DC3*c*?pmdX<D>nW<(';F<+$.B+<VeKBOQ!*A7]jo
Ec#N.ATJu<BOu:!ATAo$2'?j\F<DrADdsnB/gk$LF*)>@ATJu9AU&;L+B3#c%144#+Co%q@<HC.
+CIT56WHiL:/jVQ6W?3'?m'N4DfTE1+EV1>F=n"0%144-+Eh=;FD5B%@;I&oH=.k3De!3lAKYN+
D/^V=@rc:&F<GC<@:UL'FD5Q*FD5<-+CK8/DJW[+?RuWn+<Ve*:J=PO5tj^SH=&3GF)Q#?FC0?$
?m&lqA0>9$De!Tp@<,_$?XP!bEb-A2Dg*=8Eaa$#A0><&+EV:.%144#+D#G$+E(j7A9Da.+EM%5
BlJ/:Ecl8@/g*b^6m-#OAnc-oF!,%=@:OCqGp$^;F`JUKDfTB0%144#+DG^9FD,5.H6@$B@ps1b
3ZqgFDe*cuAm]jk/0J\GA8c?mH=&3GC2[X(H#n(=D/`p*BO?'m?k!Gc+<Y*1A0>9$BQ&*6@<6Ks
H=(&4%13OO+=\LADfB9*A8,Oq?m',kF!+q'ASrW-De*QoBk:ftFDi:DATMr9GA(Q0BOu3,D..L-
ATA4e+<Ve=Bl%?'E+*j%F!+n3AKYr4AS,Y$ATJu4Afu/:DfTE"+Co1rFD5Z2@<-W9E+*j%F"SS)
DfQs0$6UH6?rBEZ6s!8X<(11;A8,OqBl@ltEbT*++EV:.+E2@4AncK4D09oA+DkP/@q[J;7W3;i
?rBEZ6r-QO=^V[G+<Ve;Bk)7!Df0!(Bk;?.FD,5.D..L-ATAo4@<?0*Eb03+@:Nki+EV:.+EMXC
Eb/c(E+*j%+DG^&$6UH6A8,OqBl@ltEd8d<Bl[cpFDl2F+E(_(ARfh'+DGF1FD,62+Co1uAn?!8
+B3#gF!+n-Ci=N=+:SZ#+<Y&i76s=;:/"eu+Co1rFD5Z2@<-'nF!,RC+C\n)E,8rmARlp%DBNb6
@r#Xd+CoD7DBNh.FE_YDCEO&n+<Ve;EbT].F!+n/A0>;j@qB_&ARlomGp$s4DL!@IF(KB5+EV:*
F<GF/Gp$d/G%De,BkCsgEb0-1+:SZ#+<Y*&@qB_&+E1b2BQGdK+:SZ#+<V+#+=\L%78QEJ6rP4L
ARfgrDf0V=@:Wn[A0>u4+A,Et+CT.u+A,Et;bpCk6U`,7@;]dkATMr9F(96)E--.R%143e$6Uf@
?tsUj/oY?5?m$k1ASu("@;IT3De*Bs@s)X"DKI"0A7TUr.3NbPA79RkA1e;u%14=),9SZm3A*6J
+>"^.F`(b51,^[+1,(F<%13OO+=\LGBl\9:+AH9S+Cf>,E+*j&@VfTuG%G]8Bl@l3De:+a:IHfX
<+ohc9jqNSG%G]8Bl@ku$6UH6Eb065Bl[d++A*b8/hf"&DfQt0AU/33A0>r)ANCqC$4R=b+<VdL
+<VeU@:WneDK@IDASu("@;IT3De(M9De*Bs@kV\-@r?4,ATKJGG]XB%+<Vd9$6Uf@?tsUj/oY?5
?m'T2A79RkA0>;uA0>c.G9CF1F*)G:@Wcd(A0><%+CP]d+<VeJAT2'u@<?''8jQ,n@:WneDD!&'
DKBo.Cht5%B4YslEa`c;C2[WnDe!p,ASuTt%144#+EVNEE,8rmAKYAqDe(J>A7f3lBl5&8BOr;s
Bl[cpFDl26ATJu8ARTUhBOt]`$6UH6@X0)(C2[WrASc<n/g+P:De*NmCiEc)DJpY6Df03!EZf1:
DejD:AoD]4@;ZM]+<VeFDJX$)AKZ/-EcYr5DBNk0+CJr&A1hh3Amd56%144#+:SZ#.Ni>;G\(D.
@3ArgBle6$+DbV,B67f0ATDg0E\8ID$6Tcb+=\LMBl7K)ASu%"+DG^9@;Ka&F(96)E-*47Bl%@%
+EM+9+EVNECh[cu+D,1rA0=Q8%143e$6Uf@Cggdo+E_X6@<?'k+D,P4+A*b8/hf"&@;]Tu9PJBe
GV;d"@j#r+EcYr5DK?6o+:SZ#.NiP9@N]&nDe*g-C2GS;C33i+Eb0*+G%G2,/Kf.KBlbD5@:C@"
AS,LoEb/bj$6UH6FDi:1DBNk6A0<:>Eb-@P/hf"/+E2@>C1Ums+DkP)@:s.l/g(T1+<V+#,9nEU
0J5@<2]s[p8muT[0fCR*1,(F;%13OO+=\LAC2[WpDfTW$+Du+A+CehrCi^_,AoD^*?YX[kF),,j
+>"^HDf0,/FDi:8@;]UlAKYJr@;]^h%144#+DG^9D..-r+A*bmBju*kEd98[@!#guCLA9.ATD7$
+CT;%+Du*?Ci=3(ATAo0Ddd0fA0>u4+CKM'+Dbt+@;KKa$4R=e,9n<b/ibOB2'=In6tKjN0f^d-
1,(F;%13OO+=\LAB4Z09+E2IF?m'?*G9CL/FCSu,@;]TuF(KG9E-67FA8,OqBl@ltEd8d<De!p,
ASuTuFD5Z2/e&.1%144#+<VdL+<WNaB4Z0--RU#G$6UH6+<VdL+>k9\F`\`RA8bt#D.RU,+EV:2
F!,"-@ruF'DIIR2-Qij*%14=),9SZm3A*34/KdGm@j!K]/0H]%0ej+E%144-+CJr&A8#OjE*sf-
DeX*2ARlp*D]iq/G9CgACh[cu+Eh=:F(oQ1+E(j7?tsUj/oY?5?k!Gc+<X*L;_0%j79C[@DIak\
<)$%/A8bt#D.RU,+D,>(ATJu7ASl@/ARloqEc5e;D..-r+DPh*+Co1rFD5Z2@<-W&$6UH6FDi:B
ARopnAKZ).AKZ&.H=\4;AftJrDe*p-F`Lu'/p_5N?nNR$BOu6r+D,>(ATJ:f+<Ve8Eb-A%G%#*$
@:F%a+DG^9FD,5.Df0B*DIjq_:IH=HG&AFCAT2R/Bln96GqL3K$6UH6;e9M_>?#9I+A,Et+AcKZ
AR-]tFEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(g!EAM%Y8A1_b/B4W_F/e&.1+<V+#+=\LA
@rH4'C1&/o@;[3*Dg*=5AKYf'D/"*'A0>u4+E).6Gp%<EBlmo/F)YPtAKZ#)D/XT+C`m24+:SZ#
+<YB9F(KB6Bl7Q+FD,5.@rH4$ASuT4FCAf)?mmTZ.6T_"+CT/5GA(Q.AKY])+EV:.+EV1>F<GL6
%144#+CT.1AU&01Bk(k!+EqaEA1e;u+<Vd9$6pc?+>>E./i=b'+@KdN+>bVl1,(F;%13OO+=\LG
Bm=3"+CQC#D..3k?m&p$B-:o++CJ`&D/a];Eb'6!+CQC3@<?0*De:,#ChsOf+<Ve<D/aTB+Co1r
FD5Z2@<-'nF!,('Bl%?k+EVNED..3k/e&.1+<V+#+=\LGBm=3"+CT.1?u9_$?m&p$B-;;0@<<W2
Ec5K2@qB0nBl7F!EcP`$F<D#"+<Ve!:IH=5F*(i2FEMOTBkh]s+D#G4EbT*++E)-?9PJBeGV0F4
+<Vd9$6Uf@D/XH++EV19F<G(%F(KD8@:Wn[A1e;u%14=),9SZm3A*-2/Kdf,Fs&Ot/0H]%0ej+E
%144-+E_X6@<?''?tsUjBl7HmGV3ZOD/<T&FDi:BAS,LoASu!h+CfP7Eb0-1+E).6Bl7K)A8bt#
D.RU,@<?4%D@Hpq%144-+D,>4ARlol+CK%pCLplr@Wc<+/KeG<@;BF^+Cf>4Ch+Z#@;0O#GA(Q*
+EqaEA9/l;Bln#2FD,4p$6UH6FD,5.F(&os+DtV)AKYE!A0>DsAnGUpASuT4DIIBn+Cf4rF)to6
+EqC;AKYr4ATMF#F<GL>%144#+EV:.+E1b2BJ'`$+<Vd9$6Uf@F`:l"FD5W*+CT.u+D#e>ASu$m
DJ((a:IH=IATMs7/e&.1+<V+#,9nEU0J5@<1E\7l8p,"o0ek4%1,(F;%13OO+=\LPDJX$)AKYN%
@s)X"DKK</Bl@l3Eb0E.F(Jl)@;]TuAU&<.DId<h/g+,,AKYo/Ch[cu+CoD#F_t]-FE7lu+<Ve8
Eb-A,Df^#3A0>?,+@g?gB5D-%6uQRXD.RU,F!+n/A0>AjDBND"+ED%%A0>f.+EV:.+EqC++E)90
$6UH6A8c[0Ci<`mARlotDBN@1G%#E*ATW2?De:,(DfT]'FE9Jc:ddc(+AYC)/0J#4Eb$^D85r;W
/g+,,AISth+<YT7Ao)1!AKYAqDe(J>A7f3lGA1l0+C\n)Eb0E.F(Jl)@:jUmEZek1Ci!ZmFD5W*
+E_a:EZet*ARo7Y@r!\+$4R=e,9n<b/ibO>+>"^1@<itN3@l:.0JP9k$4R=b.Ni>;EcZ=F9PJBe
GT^L7D/`p*Bjtmi+Eh=:F(oQ1+E(j78l%i-+B3#c+A?KeFa,$PATDj+Df-!k+<VeIAT;j,Eb0;7
8g$&F0JO\gEZeh&H#IS2+EM+*3Znk=%144#+<VdL+<Z,AA7TUrF"_0;DImisCbKOAA1q\9A7TUg
05P??Fa.eBFCfMGFEhm:$4R=b.NiYICh[cu+CoD#F_t]-FCB9*Df.*K@<Q'nCggdhAKZ/1@3BZ*
AKZ/-Eag/!C2[WrASc<n/.Dq/+<Y?+F!+q'ASrW#Df0`0Ecbl'+EVNEFD,5.DIn#77rN<YCh4_W
De!p,ASuT4AoD^,@<=+E%144#+B3#c+Cf>-G%G]8Bl@l3E,ol,ATMo8@WHC&AKYDtC`mh5AKY])
FCfK1@;I'"H#R>8Ch[d&Et&I!+<X5u@;R-.Ci=N6Gp$^5G\M&.+EV:.D(Zr1BOr<)AnGjnDIjqe
6q/;0De!p,ASuT4%144#+Br5gDe(J>A7f4T-tm^EE&oX*GB\6`@W-KDDImoCF(f!&ARmH,@;9Cs
2)&ZQ0I[G<+<Ve;De3u4DJsV>F(fK9+A?KeFa,$ME+NNnAnb`tAU%X#E,9*,+C]J8+DGm>F*),4
C^g^o+<Y*1+CSbiF`Lo4AKYMpF(96)E-,f4DBNk0+EqL-F<F1O6m-2b+CT)&+CS_tF`]5F$4R=b
.Ni/1A8-."Df0!"+DG_*DfT]'FD5Z2+CS_tF`\`u:IH=LBl%T.@V$[!@:WpY$6UH6@<Q'nCggdh
AKYo/+Br].+C]/*B3cp!FEDI_0/$dCCLqO$A2uY&GAhM4E,oN2F"Us@D(,o$+<Ve8AoqU)+CQC5
Dfor.+E(j7@V'Xi+EV19FD5W*+DG^9FD,5.GA1l(/g)8G$4R=b.NihHBlbD?ATDj+Df-\9Afs]A
6m-MmDK?q=DBO.;DId[0F!+'t2D-\.+CT.u+A*b8/hhMmF*VhKASlK@%144#%14=),9SZm3A*$/
/KdbrGp#$s+>PW*0b"I!$6Uf@D/!m+EZet.GT^p:+D#(tF<Ga<Eag/!ATV<&FDi:BF`&=?DBND,
FD)dU/hhMm@;]Tu2D-\.+A*btH#n(=D0%<=$4R=e,9n<b/ibO<+>"^*ARZc:3%Q1-0JP9k$4R=b
.NiSHA8,XiARlp*D]j(CDBO(>A7]d(8g$&F0JO\B85gX>DIak^7oW,6+B3#gF!,X;EcYr5D@Hpq
+<Y*/F)N1AF`)7CDf-[i+>ti+GT_'QF*(u1F"Rn/+<Vd9$6Uf@Eb03+@:NkZ+A,Et-Z^D<H=.k3
De!3lAKY])FCfK)@:NjkGA2/4+CT.1?tj@oA7-NoDKKH1Amo1\/e&.1+<X9P6m-AcG9CF-Anc-o
F!,C=Cj@.FBQ@Zq+EqaEA90dS?tsUjDf.*KC2[X$AnGEn@;]Tu%144#+CJr&A93$;FCf<.@<?0j
+DG^9FD,5.@!Z3'Ci<flCh54A+@0g[+E)@8ATAo-DKKH1Amo1\%144#+EqaEA9/l%Eb-A(AS,Xo
ARlotDBN>$C2[Wj+EqL5@q[!!F!,F<@:NkZ+E)-?FD,4p$6UH6@UX=h+Dbt+@;KL&F!,O8@<,jk
+E1b2BFP:k+<V+#+=\LQ@<?0*@;]TuAnc'm+Co2-E,8s.F!+t2DK]T3FCeu*FDi:0C2dU'BQIa(
?m&rtDK]T/FD5Z2F"Rn/+:SZ#.Ni,6De(J>A7f3lEb0*+G%G2,Ao_g,+EV:.+Cf>1AKXT@6m,oK
A8c?.E+*6l@:s.(+<Y',De(J>A7f3Y$6UH6G@>P8@X0).@<*K4BOr<&@<-!lF*&OD@<-H4De:,6
BOr;rDfTD3Bl8!6@;Ka&E+*6l@:s.(+CJr&A1hh3Amc&T+<Ve@F!,@=G9C@8Dg-86A0>f./So-=
AKYH-+CJr&A8#OjE*t:@=`8F*@ps6tA8c[0Ci<`m+CJr&A1hh3Amc&T+<Ve8DIal/Cgggb+DGp?
Bl5&$IUQbtDf0VLB4YslEa`c;C2[W9C2[WnDdtG>A7f@j@kV44FDi:5DII!jAISth+<YK=@ps0r
:ddbqEb/ZiBl7Q9%144#+:SZ#.NiYICh[cu+A,Et+CoD#F_t]-FCB9*Df-\?E+EC!ARlp*D]j(3
Ao)$gF<G(,@;]^hF"Rn/+:SZ#.Ni,!<(8iT+DkOsEc3(A@rc:&F<G(3A7ZlnBOPdkARloqEc5e;
1,^7sD]gep+=M8AD.RQnATAnK3$;gOEZeai<(8iT.4u&:+:SZ#.Ni+c=]@gt+DkOsEc3(A@rc:&
F<G(3A7ZllA7T7^+EqOABHVJ,Cis;31,^a-+:SZ#%14=),9SZm3%cm-/Kdi!F<E@o/0H]%0K9LK
%144-+CSekARlp$ATo8)C2[X%@<-4+/no'A?m'DsEa`frFCfJ8?pR^Y8P(m!?m'Q)@<<W%Df0Z;
DesJ;GA(Q0BOu2n$6UH6A9Da.+D,>(ATJu:F(HJ&F(8ou3&MgjDfQtBAU&;>DdmHm@rucE+<X'`
AmoguF<G:=+>>DW$6UH6<+ohc@<5pmBfIsmEb031ATMF#FCB9*Df-\1ASu("@;Kb*+E2@>A9DBn
F!,O@@;KakEZbeu+<Ve;F_u(?Anc'mF!+q7F<G:=+EM@;G@be;FD,*#+EV:.+Co%q@<HC.+Dk\3
BQ%E6%144#+:SZ#.Ni,6De*p-F`Lu'?m'T5ATJu&F(8ou3&MgjDfQsm:IH=9AThX$DfBQ)DKI"3
Bk)7!Df0!(Bk;?.FDi92$6UH6Eb/d(@q?d)BOr<-BmO>5De:,6BOr;sDg-)8Ddd0t/e&.1+<V+#
+=\LNBl7j0+D,>4ATJu.DBN>%De(J>A7f3Y$4R=e,9n<b/iPC=+>"^3@rrhP/0H]%0K9LK%144-
+D,P4@qB0nE+*j%+Cf>,E+*d$F)Pr;+EVNECi=N/EZek#F(HJ.DBMPI6m,03@NZmP+CT.u+EV19
F<Fs=F(KH9E*m?uA8lR-C1Ums-X[Aj+:SZ#.Ni>;G\(D.@3B/nG9D!QE,Te?Bl5&$C2[W8E+EQg
%13OO,9nEU0J5::1*A.k;e9nj1,UU*1,(CA%13OO+=\LDDf'H0ATVKo+Cob+A8,Nr@psFi+E(j7
?t=1c?k!Gc%144-+E_X6@<?'k+CJr&A1hh3Amca'D]iS%F(96)@V$ZlBOPdkATJ:f%14=),9SZm
2_Hg-/Kdu'E$-nm/0H]%0K9LK%144-+ED%1Dg#]&+EMI<AKYetEbAr+78Qo*Anc'mF!,(8Df$V-
Bk)7!Df0!(Gp%3I+ED%(F^nu*A8c[0Ci<`m+EM7CAISth%144-+ED%4CgggbA0=K?6m-#SEb/a&
DfU+GA8,IbEa`f-Bl5&$C2[W8E+EQg+>"^VARopnATJu8BmO>5De:,,?uKR.E+EQg%13OO,9nEU
0J5::0H_qi;e9nj1,LO)1,(CA%13OO+=\LSAS,LoASu!hF!+n%A7]9oFDi:0C2[W8E+EQ'?k!Gc
%144-+Dtb7+DPh*+D>2(A7KOsGp$=8GBYZUF_l1Q@rH3i-tm^EE&oX*GB\6`CisQ:/n8g:.3N24
Bln'-D@Hpq%14=),9SZm2D-[+/Kd?%B-8og/0H]%0K9LK%144-+Dkh1DfQt8De'u3@rc:&F<G.*
BlnD*$6Tcb+=\LAC2[W8E+EQg+DG_(AU#>3D/aN6G%G2,%143e$6pc?+>>E*/hnJ#+A-cm+>PZ&
+>PW)3"63($6Uf@?tsUjF`V,7@rH6sBkK&4C3*c*@:Wn[A.8kg%144-+CJhmAT2]u+Du+A+CoD#
F_t]-FCeu*Bl5&$C2[W8E+EQg%143e$6pc?+>>E*/heD"+A-cm+>Gi,+>PW)3"63($6Uf@?tsUj
/oY?5?m&uu@s)X"DKK</Bl@l3@rH4'Ch7^"%143e$6pc?+>>E)/heD"+A-cm+>GQ$+>PW)3"63(
$6Uf@Bl8!7Eb-A%F<GC2@<6N5Df0,/B6%p5E$/k4+CJr&A7T7pCi<`m?m''"EZf1,@LWYe%144-
+Dkh1DfQt:@:C?jA8-.,+>"^VAS,Lo+EVNE?upEuEccGC/no'A?m'0$F*(u%A0>f&+CK8#EbTK7
F"V0AF'oFa+:SZ&,9n<b/i,+>+>"^1@<itO0e=G&0JGHq$4R=b.NiSBDJsP<F`:l"FCcS:D]ik)
F*&O@@:C@#ARfgrDf-!k%14=),9SZm1G1U//KdbrGp"mt/0H]%0K9LK%144-+C]J++D,>4ATJu.
DBNb(@WNYD+CT)&+DbIqF!+t$DBND"+EDUB%13OO,9nEU0J5.62BXRo9jr;i1-$m.1,(CA%13OO
+=\LGBl\9:+ED%0ARTXk+E(j7Ap%p+Gp";>A7TUr/STNBA0N-g:IH<W+Eh=:F(oQ1F!,FBBlA#$
$6UH6FDi:DBPDN1Eb0&u@<6!&BOPEoFDi:2AKYhuDKTB(Cj@.;DKBo.Ci!Zn+C]U=%144#+CSe4
BQ%B'F(96)E--.R+AQj!+EV:.+A+pn+EMgLFCf;3BOPdhCh7Z18l%htBl8!6@;Kb$/e&.1+<V+#
+:SZ^?85_H+<XWsBlbD-De!p,ASuT4@ps6t@V$ZlDf0`0Ecbl'+EVNED..=-+D,P4D..O-+EqOA
BHR`k+<VdL+<Ve2E+*WpDe!'$BQS?83\N.$DeO$*@:NnXEbo0%AM.k3F>%TADIdZq0.AL_$6UH6
+<VdL7W3;iAU%X#E,9).FD,5.AoDL%Dg,o5B-:]&D/E^!A0>i3De+!#ATJu&DBMJL9hZ[QATDj+
Df.TF$6UH6+<VdL%144#+<VdL+<VdL+<YW3DIdZq+>%XWBPDO0DfU,<De(J;@<--oDg-(A/T2bF
BleB7Ed;D<A1hP;D/9Xg+<VdL+<VdL+<VdL%143e$6TcbBPDO0DfU,<De*Bs@kouUASu("@;IT3
De*Bs@s)X"DKI!Q+Cf(nDJ*N'BPDO0DfU+4$9^O84Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk4Ztqk
4Ztqk4Uh`-$6pc?+>>E./ibjH+>"^.F_l=G1b9b)0JPEo$6Tcb+<W-VDIn#7@;p0sDIdI++<jd-
Ec,T/B-9fB6m+m?D/^Ur@rc:&F<FP'Bk(q"+s:<)A7]9\$4R=b+=\LAB4Z0m+CT.u+CK/2FC65$
BOPdkATJu+DfQt<ATo8=Bl.F&FCB$*+EM[EE,Tc=%13OO+<W-VBl.g0Dg#]&+A*bdDe*E%AoD^,
@<?U*DJ()6BQA$6B4u4+F<Ft+De(J>A7f3Y$4R=e,9n<b/ibOE2_lL-+@0seBl"nL/0H]%0f9CI
%144#.NiSBDJsP<ARoLsF!,RC+EM[EE,Tc=+DbIq+E_X6@<?(%%13OO,9nEU0J5@<3B&Z8/Kdbr
Earc*1,UU*1,(F?%13OO+<W-VAncK4Bl7F!EcP`$F<G16Dffl8FCcS2Bl7\q$4R=e,9n<b/ibOE
2]s[p9jr'PBHT&c/0H]%0f9CI%144#.Ni57@;]^hF!,RC+CJr&A8#OjE*sf0H#@_4GT^O8@s)X"
DKKH#%13OO+<W-V@q]:gB4Z-,AoD]48g$)G0R+^]H#n(=D0$h.DIak^;,du3%144#.Ni57@;]^h
F!,RC+CJr&A92[3EarZg+Du+>ARl5W%144#.Ni>AEZf4;Eb-A(ATV?pCi^_?AS!!+BOr;qCi<r/
E,Tf>+:SZ#+<Ve28l%ht<H)JWFCdKU<b6;mBl@l30J5@<3B&En-tm^EE-"&n04J@*ATDNr3B8^9
DfTB-Eb0<5/n8g:0/>492(pX>0/>:9C2[W7F`:l"FCd%IATDj+Df.-\/NGCC2_QTh$4R=e,9n<b
/ibOE1a"@m8p,#_+>G](+>PW*1^sd$$6UH@+A+pn+Eh=:F(oQ1+DG_'Eb0*!DKKH#+EMHD?tsUj
A8bt#D.RU,?m&lgA8c?.@;p0s@<-E3AoD]48g$)G0R+^]H#n(=D0$-n%14=),9SZm3A*<J+>"^2
Dg#]/@V'R&1,CI(1,(F=%13OO+<W-VF*VY5BQA$/BmO>5?tsUj/oY?5?m'W(EcYr5DBO.;FD)e-
BleB:Bju4,ARloU:IH=6A7TUr/g(T1%14=),9SZm3A*<G+>"^.@;^3rEd8c_2Cot+0JP<l$4R=b
.Ni,:FC65%H!t5+A8bt#D.RU,ARmD&$6Tcb+=\LWATDj+Df-\-Df0Z;DepP)E,]B+A8-92Eb0E.
F(Jl)/KeJ4A7]9oEb/ioEb0,uAKZ)5%144#+Bq?MF@^O`>psB.FDu:^0/$sPFD,f+/n8g:04J@*
ATDNr3B8a-De*C$D/aPF+CJr&A7Th"E-#D0Eb03.F(o`7Ed98H$6UH6%14=),9SZm3A*9K+>"^3
@ruWuATAnJ1FsY(0JP<l$4R=b.NiSBDJsP<ARoLsF!*%W?qipb912QW:1,2SDe*E%1,g=aDIakt
2'?FDF)W6L-X\'7DffQ$/e&.1%144-+EV:2F!,"3@s)X"DKI"2Df0`0Ecbl'+EVNE>A[ehCLh@-
DI"Z(FEDI_0/$jEEbTE(Anc9s@UX(h/oG6B05trMC1UmsF"_B=Ebf3(GA]&_%13OO,9nEU0J5@<
3%uI,+A-cmGp"gt/0H]%0es1F%144-+ED%*ATD@"@qB^(FDi9r@:LF'ATDj+Df-\+DIaktC2[Wn
De!p,ASuTt+CSekDf-\+A7T7^+:SYe$6pc?+>>E./iP[2/KdZ.DIjqG0J">%0JP<l$4R=b.NhPU
7Nb<!6m-#Y@s)X"DKK</Bl@l3F)Yr0F<GL6Aftf*FDi:1+EM+5@<,duAKYDlA8c?<+B3#c+DkP$
D@Hpq+<Y91Ch4_sC2[W8E+EQg+DGm>Eb0&qFD5o0Cj@.EFCAWpAKYE!A0>;sD/XK;+EV14+EV=7
ATJu9BOr<-BmO>"$6UH6De:,6BOr;rDfTD38l%ht@:WneDD!&'F<G7*F!+q'ASrW2ASl@/ARloq
Ec5e;FD,5.@rHC!+A,Et+CSekDf-!k+<VeKD]j(3A9DBn+CoD7DJX6"A0>u.D.Rc@+Br5gDe(J>
A7f4T-tm^EE&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0.@>;+<Ve?@<3Q#
AS#a%@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYT'EZfLGATDi7FDi:4Dg-)8Ddd0!@;]Tu%144#
+Cf>/Gp%3I+EV:.+Cf>1Eb/a&+CJr&A8#OjE*sf!Bl[cpFDl2F+C]J8+EqOABHVD1AKVEh+<VeG
Ec5c.An?!kFD5Z2+E(j78g&(h@<?+"Ec#k?@;]Tu8l%htG%G]8Bl@m1+EV:2F!,1<+D58-FD5W*
+:SZ#+<YN4F)uUZ+A$Z&F!,%&F(o3++EVNEF`V+:8jQ,nFDi:4BleB:Bju4,AKZ).BlbD/Bl%?'
@;]Tu@q]:gB4VMZ+<Ve7C2[WrASc<n+EVNECi=6-+DG^9FD,B0+CSekDf-qD+Co2,ARfh#EbT*+
/e&.1%16r\DJ<]oF*)/8A25l767sBt@;]dkATMr9AoD]48l%ha$:@*U<(Tk\4ZXr_:IH<t+AZH]
ARfg)6tp.QBl@ltEd9#A$<BSn;b9b[4ZXrE/ibOE2_ufj$;aD^<(9Y]9iF29-[09B+Dbb0Fa,$>
@<-R+DC6PL+<VdL%15cp6:4%<77U-O=Znen7qHRLEa`c3%15Qr9LVlC3Zp+!3Zp*c$>OKi/no'A
%16igA8kstD0%=DC3'gkC2[X%Ec5Q(Ch555C3'gkD..<rAn?%*/no'A%16c_F*)>@GqO2`F:ARl
De*<cCG0F@A8kstD0'/pCG'=9Et&IkDe*<cCG0F@A8lR-Anc'm@UX%)Bkh\u$>OKi@UX%*C2[X*
F(KB%Df00$B4>:b/no'A%16igA7TUg05P??Fa.eBFCfMGFEhm:$>OKiA8bs2D.-plDffQ3/p)>[
%16igA7TUg05tH6A8bs2C2[X%A7dH9G]XB%C2[WoG]\![C2[X)Df9H5/no'A%16igA8G[`F"_9H
A7Th"E%Yj>F:ARlDe*Zm@WO2;De*R"FE2:PBkh`!$>OKiCggdo05>E9@V'V&/no'B%16igA8G[`
F"_?<@V'dmD/a<&0JG46Bkh\u$>OKiCggdo05P'+A9Da./no'A%14Nn$;s;d76sj@4ZXs*2D?j.
C,Rb$+DNhh0d(3j0JO\b3&!*1C,dn'+DNki1a`_>6q'p@:./#D3Zp+!3Zp*c$=mRe@4uA-Bl%@%
%14Nn$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m*mM+AZH]ARfg)6tp.QBl@ltEd9)VBlbD*+A*bq
Ec5T2@;TjqDJ()6Df9GE+A,Et+DGm>%16MdGAhM4+E):7ASuU$A0>DkFCAWeF(HJ+DfQt/Cht59
H#R>9+E(j78g&%]C1UmsF"SS-:IH<7$?L?/E,Tc=F!,:5DJNfo+Co1rFD5Z2@<-W9A79Rg@UX=h
F!+n/A0>i3Dg#i*ATJu9Df9H5+D,P4+:SZgDe!p,ASuU(DJ()#DIal3ATMs-DJ((a+Cf>#AM,)7
$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<%15pPBlA#7
G%G]8Bl@m1+E(j78g%tZCLnV:C1_0rATK:C@<Q'nCggdhAKYT*Df$V<H#n(=D'3n0EbTK7F"Rn/
%15[=+F.mJ+DG_7FCB!%+A,Et+DGp?BlbD1BkM*qGp%-=@rH4$ASu$iA0>u-@<<W;DflKrBl8!6
@;Ka&FD,5.Eb0&qFCeu*@:WneDBMPI6psg<<D>nW<%]:c:IITH6WHiL:/i>F$>FC!FCB!%F!,")
FCAm"ARlo[6q/;0De!p,ASuTuFD5Z2+D,P4+A,Et/g(T1%15RCEZf4;Eb-A-DJ!g-D..O#Df-\=
AS!!+BOr;Y:IH=LBkqE*E+*BjF!)l&DJ!f06?RBlDf.!T%17,uDBO%7AKYet@NZje:IH=A@:C?O
:IH<sDKKo;A9DC(Bl@l5+>"^.:IH=A@:F:#@<,p%F`(`$EZbeuFD,5.7qHRLEa`c,Cggcq@psIj
B5_g9/g*_t+F.mJ+CoC5DJsV>F(Jo*8l%htCggdo+Dbb5FCetl$?'f)FD,5.9OVBQD.RU-F!,UH
AKZ).AKXZT@N]-#Dg-86+C]J8FDl%>FDi:1@q0(kF#ja;%144#+F[a0A8c@,05"j6ATD3q05>E9
05>E9Cggdo%13OO9lG&`+DG_*DfT]'FD5Z2+DGm>@<Q'nCggdhAKYo/+EV:.+A,Et+AcKZAKYE'
3XlE=+:SZ#+<Y?>FDs8o04J@*ATDNr3B8^9DfTB-Eb0<5/n8g:06Cl=/S]37/T>-2AM4K".1HW$
@;]dkATMs.De*Bs@s)X"DKIWg:-pQUD..<rAn?%*+D,P4+A,Et%15Hg:fL"^:-CWc8l%ht6uQRX
D.RU,@<?4%DC5l#<^fnb8P`)E3Zoe(/ibOE2_ufj$;aD^<(9Y]9iF29-RT?19L2!45u^9C:Jt=Y
3[[F/DImisCaTZ!7S-9B;a!/a0H`D!0F\A+@;]dkATMrGBkh\u$>=-pFDl2F/p)>[%17&bAn5gi
05>E9/oY?5%14Nn$;s;d76sj@4ZX]5C,Rb#+DNeg1*C<j0JO\b3&!'0C,dn&+DNki1E^El0Jk-d
$:I<]6W-KP<(Tk\4ZX]>+?CW!%15^'6m+m9@s)X"DKI"2Df0Z*Bl7u7-u*[2/oY?5.3NhJBk(g!
A8bt#D.RU,F!,R<AKXT@6m-PrF*(u1/e&-s$:\rS+Dl%;AKY])AoD^,@<?4%DBO"3AKZ).AKXT@
6m-\fCM=o1@:s.m%14LTDJ!f06?RBlDf.!HDfQtDBle!1+B3#c+A,Et+AcKZAKYE'3XlE*$>=O'
E&oX*@UX%`Eb],F3A,MoEb'-0ATMoF@rH3;FD,5;C2[W7E+*Bj0+A6t$;=l-AQU'cDe!p,ASuT4
F)Q2A@q?csF!+n7@;0Od@VfTuDf-[fBllmg@N]*$3XlE*$>=O'E-"&n05#!@BQ[c:@rH3;@UX%`
Eb],F3A5,cA7TUg%13OO8oJB\+@9LPATA4e@UX%`Eb],F3C%4o@;0O1@rH2n$7QDkD..<rAn?%*
C2[X(Dfp)1AMPu867sBt@;]dkATMr9AoD]48l%iR:K::[71BSk5u:NP:JO&6-V@0&+AZH]ARfg)
6tp.QBl@ltEd8d+Dfp)1AL@oo<^fnb8P`)E3[ZU63A*<N1FEV=:eX/S7ScoV;a!/hGA1q;Ch[d0
GT^O*Ed)58-OgDV5sdq)<(0;Q;HZ.D-V%`cATD3q-OgDP8PDQO4ZX]>+?CW!%16r\DJ<]oF*'$K
C3'gkC2[WnATf\?C3'gkC2[W8Bkh\u$?^H)Ci_4CC3'gkC2[X(Dfp)1ATMF)F`8sIC3'gk.1HV^
78--9;aii1-YbOn0d(3h0JXbc2_Zs/C,dn%+DNki1*C<k0Jahd3&!0:%15Kl:dn,I;a!/a0H`D!
0F\A%ASu("@;IT3De':a.1HVP78lQO8PiAX:JO&6+>=p!+>=63-u*[2F)Q2A@q@)3@rH7,@;0V#
+EM+7BjkglH=^V0A8,OqBl@ltEd8d<F_u(?F(96)E--.D%14LuDe*BiFt@BHA1VkFBl%i>/g+,,
ATME*A9Da.+EM%5BlJ08+Cf>-FCAm$+CT)&+EV:.%16T`A7[;7FCfN8+Cei$ATKCF@WcC$A0>r'
EbTK7F"AGBDIal#De!p,ASuTuFD5Z2+E_a:A.8lfD]iS%G%GK.E$/S,A0>_tBl8$$Bl5%c:IH=6
DIal1ASbdsARlp)H#n(=D0%<=$4R>1F_u(?F(96)E--.D@<,p%Cgh?sAKXSfF(96)E--.DFD,*)
+Dbt)A0>Ds@ruF'DIIR2%17#_C1UmsF!,17FDi9o:IH=9Bk)7!Df0!(Bk;?.GA(Q*+EDUB/e&-s
$;+)^+EMgLFCf;3A8,OqBl@ltEbT*++CT;%+D5V2A0>H.@;Tt"ATJu4Aftc*G9BLR6m)pG@ps6t
@V$[)F(Jl)FDi:2F_PZ&+Cf>,E,9*1+A*btH#n(=D0%<=$4R>7+?(o,GV;$/0R+^4:IH=GAT;j,
Eb0;7FD,5.-tHb.@4uA-Bl%@%.3N&0A8c?<+Ad)mDfQs0$?g!$F(oQ1F!,C5+A*bn@;BEs-u*@.
Ch7Z:+CTG%Bl%3eCh4`$Ec5e;F*VhKASiQ2@rc:&FE9&D$4R>7:IH=HDfp)1AKYMt@ruF'DIIR"
ATJu(@;[2sAKZ&*F<G^F+DG^9FE_XGG@>c<3XlE*$8EtP;KZk"FD,5.8g&1bEbTK7+:SYe$6UH6
IUQbtDf0VLB4YslEa`c;C2[X(Dfp)1AM7e:A92[3Ear[%ATW'6/no'A%13OO+<Ve+BPDN1BlbD=
BOr<,ARfXqD.RTqARlp#ATVU(A1euQC2[X(Dfp)1ATMF)F`8sIC3(gH%144#+Ceht+EV%-AKYD(
D/!m1FCcS5EZfFA+EVNEEcl7P%143e$8O%Q;KZk"FD,5.8l%htCggcq,"bX!+B*3$EarZ'6Z6LH
+@L?hE$/(hEbTK7F"SXZ%144#+A,Et+DbIqF!+n3AKY])+EV:.+=K`kDImisCagKC@:C?h@<?'n
DfU+U+A$/fH#Ig7$6UH6A8`T.Dfd+CARuuV:IH=A@:F:#Ch[s4ARlp%DBO%7AKXZT@N]N!DKU"C
F`V+:FD,5.9OVB>$6UH6@WHC2F(HJ'F`__DDBO%>+CSbiATMoR%13OO+<VeU@:WneDK@IDASu("
@;IT3De(M9De*Zm@WMtc%15gJEb-A-DJ!g-D..O#Df-\3F!+n7@;0Od@VfTuDf-\>BOr;Y:IH=%
@:s-o@<=O>$6UH#$6UH6BQS?83\N-q@;BFpC1K=b/pD5SA8lR#F)rsDDf%.LBOrc1De(G=@:s.)
%14Nn$3                                                                   ~>
)
showpass 4 put ". ".'zz_',SOLOCALE,'_' [ cocurrent 'base' NB.{*JOD*}
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
