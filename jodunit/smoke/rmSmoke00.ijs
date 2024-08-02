NB.*rmSmoke00 t-- (rm) smoke test.
NB.
NB. (rm) runs JOD  macros.  JOD  macros  are  simply arbitrary  J
NB. scripts.  They  can do anthing including altering  JOD  while
NB. running.   J   scripts   are   indicated    with   code    21
NB. (JSCRIPT_ajod_). Other scripts - arbitrary bytes - have codes
NB. (MACROTYPE_ajod_). Only J scripts  (code 21) can run.  One of
NB. the main uses of non J macro scripts is storing program code,
NB. SQL, Python and text MARKDOWN, LATEX in JOD dictionaries.
NB.
NB. assumes:
NB.
NB.   0) (testjod03) exists - run (createtestdictionaries)
NB.
NB. author:  John D. Baker
NB. created: 2024jul28
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAArmSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod03'
er od tdict [ 3 od ''

NB. store a J script - code 21
er 4 put 'AllWork';JSCRIPT_ajod_;'smoutput ,10 # ,:''all work and no play make jack a dull boy '',LF'

NB. run the script
1 [ rm 'AllWork'

NB. store some MARKDOWN text - code 27
er 4 put 'MarkDumb';MARKDOWN_ajod_;'This is DECLARED Markdown. It is not validated as such.'

NB. non J scripts do not run 
ner rm 'MarkDumb'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_