NB.*nwSmoke00 t-- (nw) smoke test.
NB.
NB. (nw) (new word) places word text in a  J (JQt or  JHS) window
NB. for  editing. The text is  derived from templates  stored  in
NB. path dictionaries.
NB.
NB. assumes:
NB.
NB.   0) (testjod03) exists - run (createtestdictionaries)
NB.           ....
NB.
NB. author:  John D. Baker
NB. created: 2024jul28
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAnwSmoke00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod03'
er od tdict [ 3 od ''

NB. edit text template - {~X~} are (nw) place holders
NB. this can be user modifed in (jodprofile.ijs) to
NB. cater to your depraved needs. The current template
NB. is oriented to traditional explict code conventions
NB. it is easily adapted to direct defintions.
1 [ smoutput DOCUMENTMARK_ajodtools_

NB.  (DOCUMENTCOMMAND_ijod_) is placed at the end of
NB. the new text and can define actions taken when
NB. the edit script is run.
DOCUMENTCOMMAND_ijod_=: 'showpass pr ''{~N~}'''
1 [ smoutput DOCUMENTCOMMAND_ijod_


NB. opens an edit window
1 [ nw 'IamNewWord'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_