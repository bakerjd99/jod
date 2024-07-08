NB.*dpsetSmoke00 t-- (dpset) FORCEMASTERPATH dictionary move test.
NB.
NB. assumes:
NB.
NB.   0) standard J session verbs (shell) available
NB.   1) (jodtester) is a load script
NB.   2) ~JODTEST is a configured folder
NB.  
NB. author:  John D. Baker
NB. created: 2024jan19
NB. changes: -----------------------------------------------------
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'

NB. make jodtester from JOD distribution dictionaries
NB.
NB.   od ;:'joddev jod utils' [ 3 od ''
NB.   mls 'jodtester'
load 'jodtester'

cocurrent jodtestlocale 'AAAdpsetSmoke00'

testenvironment 'good';'JOD' NB. ;1  NB. yammer on 

NB. -{TEST START}-

NB. create a new unique dictionary 
brandnew=: 'movetest',":didnum_ajod_ ''
er newd brandnew;oldloc=: jpath '~JODTEST/',brandnew

NB. open and set READONLY
er od brandnew [ 3 od ''
er dpset 'READONLY'
er 3 od brandnew

NB. unregister the dictionary and move the files to another folder
er 3 regd brandnew 

newloc=: jpath '~JODTEST/newloc',":didnum_ajod_ ''
makedir_ajod_ <newloc

(3 : 0) ''
if. IFUNIX     do. 1 [ shell showpass 'mv ',oldloc,'/ ',newloc
elseif. IFWIN  do. 1 [ shell showpass 'move ',oldloc,' ',newloc
else. showpass 'unsupported OS' [ 0 
end.
)

NB. register dictionary in new location
er regd brandnew;newloc,'/',brandnew

NB. open in new location
er od brandnew

NB. attempt to set read/write - should return master/dictionary mismatch
ner showpass dpset 'READWRITE'

NB. force master path into dictionary and close
er dpset 'FORCEMASTERPATH'
er 3 od ''

NB. reopen - should allow read/write set
er od brandnew
er dpset 'READWRITE'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_