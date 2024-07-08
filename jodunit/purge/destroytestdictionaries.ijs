NB.*destroytestdictionaries t-- destroys JOD test dictionaries.
NB.
NB. assumes: (jodtester) is a load script
NB.  
NB. author:  John D. Baker
NB. created: 2011may13
NB. changes: -----------------------------------------------------
NB. 11nov21 (rmroot) added - now runs on Windows and Linux
NB. 17jun20 basic config test added
NB. 18may30 (tpfx) test dictionary prefix added
NB. 24jun28 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. test utils load into (ijod) locale
require 'jodtester'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAdestroytestdictionaries'

NB. coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
NB. coinsert 'ijod'

NB. define test utils
testenvironment 'good';'JOD'
NB. -{TEST START}-

tpfx=: 'testjod'

NB. unregister any testjod dictionaries
>{. DICTS=: 4 od ''
1 [ DICTS=: 1 pick DICTS
1 [ showpass DICTS=: ({."1 DICTS) #~ +./"1 (,:tpfx) E. >{."1 DICTS
1 [ 3 regd&> DICTS

NB. destroy all current jodtest dictionaries
NB. Note: the ~JODTEST root must be set - use J configure 
JODTESTROOT=: jpath '~JODTEST'

NB. UNC windows network root
NB. JODTESTROOT=: '\\meccnas00\users\jdbaker\jodtest1'

1 [ rmroot JODTESTROOT

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_

NB. coerase <tmploc_AAAtrash999_
