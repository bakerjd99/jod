NB.*loadtest002dictionary t-- load 1x 2 test dictionary.
NB.
NB. Populates the order 1x 2 test  dictionary. Part of the  large
NB. feasible test case.
NB.
NB. assumes:
NB.
NB.   1) enough extant dictionaries to build 1000+ word test dictionary
NB.
NB. author:  John D. Baker
NB. created: 2011nov21
NB. changes: -----------------------------------------------------
NB. 11nov23 removed any (oldjar) dictionary
NB. 15jun26 user configured JODTEST folder
NB. 18may31 updated for J 8.07
NB. 24jun30 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloadtest002dictionary'

testenvironment 'good';'JOD'

tdict=: 'testjod02'

NB. open at most 16 dictionaries
DICTS=: }. od ''
er od (16<.#DICTS){.DICTS

NB. dump path
er make file=: (jpath '~JODTEST') ,'/junk.ijs'
er 3 od ''

NB. load 2 1x dictionary
er od tdict

NB. delete all words, groups, tests, suites, macros
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

NB. load dump script
((0!:0) :: 0:) <file
cocurrent testlocale_ijod_

NB. pack dictionary to remove "dead" file components
er packd tdict

NB. generate all cross references - ignoring errors as many words
NB. are missing and many ambigous names are improperly declared.
1 [ 0 globs&> }. dnl ''

NB. packd and make
er packd tdict
er make ''

NB. show counts
er did ~ 0

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
