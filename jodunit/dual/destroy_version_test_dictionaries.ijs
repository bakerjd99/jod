NB.*destroy_version_test_dictionaries t-- destroys j system versioned JOD test dictionaries.
NB.
NB. assumes: (jodtester) is a load script
NB.  
NB. author:  John D. Baker
NB. created: 2023jan24
NB. changes: -----------------------------------------------------

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. test utils load into (ijod) locale
require 'jodtester'

coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

NB. define test utils
testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])

NB. name embeds current running version of J
tpfx=: 'testjod', '/' beforestr 9!:14 ''

NB. unregister any testjod dictionaries
>{. DICTS=: 4 od ''
1 [ DICTS=: 1 pick DICTS
1 [ showpass DICTS=: ({."1 DICTS) #~ +./"1 (,:tpfx) E. >{."1 DICTS
1 [ 3 regd&> DICTS

NB. destroy all current jodtest dictionaries
NB. Note: the ~jodtest root must be set - use J configure 
JODTESTROOT=: jpath '~JODTEST'

NB. UNC windows network root
NB. JODTESTROOT=: '\\meccnas00\users\jdbaker\jodtest1'

1 [ rmroot JODTESTROOT

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAtrash999_
