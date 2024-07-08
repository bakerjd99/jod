NB.*dispSmokeUnicode00 t-- (disp) display of unicode.
NB.
NB. assumes:
NB.
NB.   1) a READWRITE put dictionary (testjod00) available
NB.   2) (jodtester) verbs available
NB.
NB. author:  John D. Baker
NB. created: 2007feb05
NB. changes: -----------------------------------------------------
NB. 07dec12 - (testpass) replaces (smoutput)
NB. 11may20 - (showpass) replaces (testpass)
NB. 18may31 - updated for J 8.07
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes


NB.*ERROR=> (disp) does not properly display unicode datatypes
NB. 4 Apr 2005 13:33:41

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAdispSmokeUnicode00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

ud=: u: 'this is unicode'
   
'unicode' -: datatype ud  NB. datatype in standard J profile

1 [ 3 od ''

er od tdict  NB. JOD test dictionary 

er tmploc put 'ud'  NB. store in test dictionary

erase 'ud'          

er tmploc get 'ud'

'unicode' -: datatype ud  NB. must match

(u: 'this is unicode') -: ud NB. must match

NB. (showpass) defined in (jodtester) 
1 [ showpass disp 'ud'    NB. must display without error


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_

NB.*FIX=> corrected in later versions of J 

