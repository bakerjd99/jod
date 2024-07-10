NB.*create_version_test_dictionaries t-- creates empty j system versioned JOD test dictionaries.
NB.
NB. Run (destroy_version_test_dictionaries) test prior to running.
NB.  
NB. author:  John D. Baker
NB. created: 2023jan24
NB. changes: -----------------------------------------------------
NB. 24jul09 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. tester utils load into (ijod) locale
require 'jodtester'

cocurrent jodtestlocale 'AAAcreateversiontestdictionaries'

NB. define test utils
testenvironment 'good';'JOD'
NB. -{TEST START}-

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])

NB. WARNING: name embeds current running version of J
tpfx=: 'testjod', ('/' beforestr 9!:14 '') -. '.-'

NB. Note: the ~JODTEST root must be set - use J configure 
JODTESTROOT=: jpath '~JODTEST'

NB. UNC windows network root
NB. JODTESTROOT=: '\\meccnas00\users\jdbaker\jodtest1'

1 [ makedir_ajod_ <JODTESTROOT

NB. adjust slash for linux/mac
JODTESTROOT=: tslash2_ajod_ JODTESTROOT

NB. create empty test dictionaries - setting DOCUMENTDICT
NB. to 0 preserves the time stamp brand.
dn=:tpfx,'00'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'01'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'02'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'03'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'04'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'05'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'06'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'07'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'08'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'09'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'10'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'11'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'12'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'13'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'14'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

dn=:tpfx,'15'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

NB. order of magnitude dictionaries
dn=:tpfx,'100'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 

NB. two orders of magnitude dictionaries
dn=:tpfx,'1000'
er newd dn;JODTESTROOT,dn
er 5 put (tstamp_ajod_''),' -- ',JODTESTROOT,dn [ od dn
er 3 od dn [ dpset 'DOCUMENTDICT';0 


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
