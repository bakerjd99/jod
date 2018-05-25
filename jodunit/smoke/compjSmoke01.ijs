NB.*compjSmoke01 t-- (compj) valid argument smoke tests.
NB.
NB. assumes:
NB.
NB.   1) (testjod00) dictionary
NB.
NB. author:  John D. Baker
NB. created: 2000sep01
NB. changes: -----------------------------------------------------
NB. 11nov23 updated for JOD 0.9.4+
NB. 15jul21 renamed from (compjBasic) and adjusted for J 8.04
NB.         and new (smoke,basic,large,stress,crush) testing regime
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od ''

NB. insert some standard words to compress
LongNamesAreReallyHardToType=: 3 : 0

boo =. reallylongnamesannoyme =. theyareasymptom =. 0
ofexecessivestandards =. boo

thatareasdamagingasnostandardatall =. boo * y

'TEDIOUS QUOTED NAMES ARE ALSO CRUNCHED DOWN' =. boo

'GLOBALS EXCLUDED'=: boo
)

er tmploc put 'LongNamesAreReallyHardToType'
rc [ 'rc txt'=: compj 'LongNamesAreReallyHardToType'
1 [ smoutput txt

short=: 3 : 0
NB. names allready one char - not changed
a=.y
y=.a * 2
z=.a * y * y
)

er tmploc put 'short'
rc [ 'rc txt'=:compj 'short'
1 [ smoutput txt


objectrefs=: 3 : 0
iam__object=. y NB. do not compress objects
lost__in__object__confusion=. 2

direct_xxx_=. y NB. do not compress locales
)

er tmploc put 'objectrefs'
rc [ 'rc txt'=:compj 'objectrefs'
1 [ smoutput txt

globalrefs=:3 : 0
globals * are * not * compressed * y
)

er tmploc put 'globalrefs'
rc [ 'rc txt'=: compj 'globalrefs'
1 [ smoutput txt


declaredscopes=: 4 : 0

NB. declared scopes are touchy names and are
NB. excluded from the compression process

override=:globals=: x  NB.(*)=. override globals

boo=.hoo=.too=. 1      NB. (*)=: boo hoo too

for_names. y do.
    boo * names_index  NB. implicit for. locals not changed
    'we get crunched out of existence' =. names * names
end.

hoo * y
)

er tmploc put 'declaredscopes'
rc [ 'rc txt'=: compj 'declaredscopes'
1 [ smoutput txt

mixedscopes=: 3 : 0

NB. local is assigned local and global
NB. when any mixed scopes are detected only
NB. white space is removed - (globs) reports
NB. and identifies mixed scopes

local=. y
local=: 2 * local
)

er tmploc put 'mixedscopes'
rc [ 'rc txt'=: compj 'mixedscopes'
1 [ smoutput txt

confusedscopes=: 3 : 0

NB. if there are any name classification issues
NB. like confused scopes only white space is removed.
NB. this is the safest thing to do.  The (globs)
NB. verb detects and reports confused declarations.

NB. boo is declared local and global - go figure

boo=y         NB. (*)=. boo
hoo=.boo * y  NB. (*)=: boo
)

er tmploc put 'confusedscopes'
rc [ 'rc txt'=: compj 'confusedscopes'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_