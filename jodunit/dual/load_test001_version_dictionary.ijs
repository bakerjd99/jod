NB.*load_test001_version_dictionary t-- load 1x test dictionary.
NB.
NB. NOTE: it may be necessary to run this twice from an edit session.
NB.
NB. author:  John D. Baker
NB. created: 2023jan24
NB. changes: -----------------------------------------------------
NB. 24jul09 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

cocurrent jodtestlocale 'AAAloadtest001versiondictionary'

NB. JOD source words - merges path dictionaries
NB. Occasionally remake this dump to track changes in JOD
NB. >0{make JodSourcePathDump=: (jpath '~JODTEST'),'/jodpath.ijs'

NB. fetch test dictionary contents stored as a 
NB. dump scripts in the (jodtest) development dictionary
>0{od ;:'jodtest joddev jod utils' [ 3 od ''
'rc sdat'=: 4 get 'TestDictionaryDump'
({."1 sdat)=: {:"1 sdat
'rc sdat'=: 4 get 'JodSourcePathDump'
({."1 sdat)=: {:"1 sdat
>0{3 od 'jodtest'

testenvironment 'good';'JOD'

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])

NB. WARNING: name embeds current running version of J
tpfx=: 'testjod', ('/' beforestr 9!:14 '') -. '.-'

tdict=: tpfx,'01'

er od tdict

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. load test dump script 
((0!:100) :: 0:) TestDictionaryDump
cocurrent testlocale_ijod_

NB. pack dictionary to remove "dead" file components
er packd tdict

NB. the following inserts many single line descriptions for words without descriptions 
S=: fsen&> 0 1 3 noexp ''
S=: S #~ (<0) ~: {."1 S
er 0 8 put ({."1 S) ,. (80&<."0 #&> {:"1 S) {.&.> {:"1 S

NB. merge in JOD source
((0!:0) :: 0:) JodSourcePathDump
cocurrent testlocale_ijod_

NB. generate all cross references - ignoring errors as many words
NB. are missing and many ambigous names are improperly declared.
1 [ 0 globs&> }. dnl ''

NB. NOTE NIMP: delete the word (test) it comes in via (TestDictionaryDump)
NB. and leads to make failures in the LFC -- there's a JOD make
NB. bug that occurs when words with the same name and different name
NB. classes appear in different dictionaries on the JOD path.
NB. In this dictionary (testjod1) (test) is a verb. In 
NB. (testjod3) it is a noun. Removing it here removes the
NB. bug's trigger. When I've fixed this I will make sure
NB. this case is represented in these generated test dictionaries.
NB. Nov 23, 2011
NB. 1 [ del 'test'

NB. packd and make 
er packd tdict
er make ''

NB. show counts
er showpass did ~ 0

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
