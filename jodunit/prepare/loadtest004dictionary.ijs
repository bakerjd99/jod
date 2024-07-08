NB.*loadtest004dictionary t-- load 1x 4 test dictionary.
NB. 
NB. Populates the order 1x 4 test dictionary. Part of the
NB. large feasible test case.
NB.
NB. assumes:
NB. 
NB.   1) (utils,testjod01) are loaded
NB.
NB. author:  John D. Baker
NB. created: 2011nov22
NB. changes: -----------------------------------------------------
NB. 15jun26 user configured JODTEST folder
NB. 18may31 updated for J 8.07
NB. 24jun30 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloadtest004dictionary'

testenvironment 'good';'JOD'

tdict1=: 'testjod01'
tdict4=: 'testjod04'

NB. load (utils) from dump
er od 'utils'
er make file=: (jpath '~JODTEST'),'/junk.ijs'
1 [ 3 od ''

NB. open (testjod4) and clear
er od tdict4
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''
((0!:0) :: 0:) <file
cocurrent testlocale_ijod_
1 [ 3 od ''

NB. open test 1 dictionary fetch approx half words
er od tdict1
er WORDS=: dnl ''
WORDS=: }.WORDS
WORDSSEL=:WORDS=: WORDS {~ ((<.@-:)#WORDS)?#WORDS

LOT=: 600 NB. lot size

rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
WORDS=: (LOT<.#WORDS) }. WORDS
1 [ 3 od''

er od tdict4
er 0 10 put DEFS
1 [ 3 od ''

er od tdict1
rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
WORDS=: (LOT<.#WORDS) }. WORDS
1 [ 3 od''

er od tdict4
er 0 10 put DEFS
1 [ 3 od ''

NB. fetch a lot of unused 1 dict words and randomly rename
er od tdict1
WORDS=: (}. dnl '') -. WORDSSEL
rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
DEFS=: ((0 {"1 DEFS) ,&.> <"1 hfd (#DEFS)?1e9) (<a:;0)} DEFS
1 [ 3 od ''

er od tdict4
er 0 10 put DEFS

NB. pack dictionary to remove "dead" file components
er packd tdict4

NB. generate all cross references - ignoring errors as many words
NB. are missing and many ambigous names are improperly declared.
1 [ 0 globs&> }. dnl ''

NB. packd and make 
er packd tdict4
er make ''

NB. show counts
er did ~ 0

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
