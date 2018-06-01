NB.*createtestdictionaries t-- creates empty JOD test dictionaries.
NB.
NB. Run (destroytestdictionaries) test prior to running.
NB.  
NB. author:  John D. Baker
NB. created: 2011feb14
NB. changes: -----------------------------------------------------
NB. 11may13 modified to run with new (ijod) interface locale
NB. 11nov21 (rmroot) added - adjusted to run on both window & linux
NB. 17jun20 test dictionaries branded - more added
NB. 18may21 insure ~JODTEST directory exists
NB. 18may30 add (tpfx) test dictionary name prefix

cocurrent 'base'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. tester utils load into (ijod) locale
require 'jodtester'

NB. create temporary working locale
coclass tmploc_AAAtrash999_=: 'AAAtrash999' [ coerase <'AAAtrash999'
coinsert 'ijod'

NB. define test utils
testenvironment 'good';'JOD'
NB. -{TEST START}-

tpfx=: 'testjod'

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
coerase <tmploc_AAAtrash999_
