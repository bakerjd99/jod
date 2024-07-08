NB.*loadtest003dictionary t-- load 1x 3 test dictionary.
NB.
NB. Populates  the order 1x 3 test  dictionary. Part of the large
NB. feasible test case.
NB.
NB. asssumes:
NB.
NB. 1) (testjod01,testjod02) are loaded
NB.
NB. author:  John D. Baker
NB. created: 2011nov21
NB. changes: -----------------------------------------------------
NB. 15jun26 user configured JODTEST folder
NB. 18may31 updated for J 8.07
NB. 24jun30 revise for J 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

NB. is JODTEST configured?
-. '~JODTEST' -: jpath '~JODTEST'

NB. (jodtestlocale) defined in jodprofile.ijs
cocurrent jodtestlocale 'AAAloadtest003dictionary'

testenvironment 'good';'JOD'

tdict2=: 'testjod02'
tdict3=: 'testjod03'

NB. open test 2 dictionary fetch approx half words
er od tdict2
er WORDS=: dnl ''
WORDS=: }.WORDS
WORDSSEL=:WORDS=: WORDS {~ ((<.@-:)#WORDS)?#WORDS

LOT=: 600 NB. lot size

rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
WORDS=: (LOT<.#WORDS) }. WORDS
1 [ 3 od''

NB. open and clear (testjod3)
er od tdict3
1 [ obs del&> 1 }.&.> obs dnl&.> (#obs=.<"0 i. 5)#<''

er 0 10 put DEFS
1 [ 3 od ''

er od tdict2
rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
WORDS=: (LOT<.#WORDS) }. WORDS
1 [ 3 od''

er od tdict3
er 0 10 put DEFS
1 [ 3 od ''

NB. fetch a lot of unused 2 dict words and randomly rename
er od tdict2
WORDS=: (}. dnl '') -. WORDSSEL
rc [ 'rc DEFS'=: 0 10 get (LOT<.#WORDS) {. WORDS
DEFS=: ((0 {"1 DEFS) ,&.> <"1 hfd (#DEFS)?1e9) (<a:;0)} DEFS
1 [ 3 od ''

er od tdict3
er 0 10 put DEFS

NB. pack dictionary to remove "dead" file components
er packd tdict3

NB. generate all cross references - ignoring errors as many words
NB. are missing and many ambigous names are improperly declared.
1 [ 0 globs&> }. dnl ''

NB. packd and make
er packd tdict3
er make ''

NB. show counts
er did ~ 0

ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_
