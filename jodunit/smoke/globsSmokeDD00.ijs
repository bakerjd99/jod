NB.*globsSmokeDD00 t-- direct definition (globs) smoke tests.
NB.
NB. Direct Definition (globs) smoke tests. JOD name analysis of J
NB. words   containing   direct    definitions    will    require
NB. modification.
NB.
NB. verbatim: new DD rules for local and global names.
NB.
NB. 1. Names in {{ ... }} are local to the DD and are
NB.    equivalent to names in called words. So (globs) must
NB.    exclude all locally assigned DD names from outer
NB.    scope local assignments. Take care when
NB.    {{ ... }} names match names in the outer scope.
NB.
NB.    OuterWord=: 3 : 0
NB.    smoutput y
NB.
NB.    NB. (inDD) is local to the DD and not considered
NB.    NB. a local of (OuterWord) while (outName) is a local
NB.    outName=. {{ y * inDD=. 42 }} i. 3 4
NB.
NB.    outName
NB.    )
NB.
NB. 2. Unassigned name references at any depth in DDs will be considered
NB.    global references in (Outerword).
NB.
NB.    OuterWord=: 4 : 0
NB.    smoutput y
NB.
NB.    NB. (verbinDD) is treated like a global reference in (OuterWord)
NB.    outName=.  x ^ {{2 {{ x + verbinDD y }}"0 y * i. 10 }} 5
NB.
NB.    outName
NB.    )
NB.
NB. 3. Names locally assigned in upper {{ ... }} scopes are not considered
NB.    global references if they are referenced in lower scopes.
NB.
NB.    OuterWord=: 4 : 0
NB.    smoutput y
NB.
NB.    NB. (deepState) is referenced in a deeper scope than the one
NB.    NB. inwhich is was locally assigned. This apparent global reference
NB.    NB. is actually a locale reference
NB.    outName=.  x ^ {{2 {{ {{deepState - x * y }} + deepState=. verbinDD y }}"0 y * i. 10 }} 5
NB.
NB.    outName
NB.    )
NB.
NB. 4. Global name assignments in DDs, at any nesting depth,
NB.    will be treated as global assignments of (Outerword).
NB.
NB.    OuterWord=: 4 : 0
NB.    smoutput y
NB.
NB.    NB. (deepState) is treated like a global assignment of (OuterWord)
NB.    outName=.  x ^ {{2 {{ x + deepState=: verbinDD y }}"0 y * i. 10 }} 5
NB.
NB.    outName
NB.    )
NB.
NB. 5. If a name is assigned locally in an upper scope and globally in a 
NB.    lower scope the global assignment overrides the local and is
NB.    treated as a global assignment of (Outerwords).
NB.
NB.    OuterWord=: 4 : 0
NB.    smoutput y
NB.
NB.    NB. (deepState) is globally assigned in a lower scope than the one
NB.    NB. inwhich is was locally assigned. This is treated as a global assignment of (outerword).
NB.    outName=.  x ^ {{2 {{ {{deepState=: x * y }} + deepState=. verbinDD y }}"0 y * i. 10 }} 5
NB.
NB.    outName
NB.    )
NB.
NB. 6. If a name is assigned globally in an upper scope and locally in a 
NB.    lower scope the local assignment is treated a global reference of (OuterWord).
NB.
NB.    OuterWord=: 4 : 0
NB.    smoutput y
NB.
NB.    NB. (deepState) is globally assigned in an upper scope and locally
NB.    NB. in a lower scope. The name is treated as a global assignment of (Outerword).
NB.    outName=.  x ^ {{2 {{ {{deepState x * y }} + deepState=: verbinDD y }}"0 y * i. 10 }} 5
NB.
NB.    outName
NB.    )
NB.
NB.
NB. assumes:
NB.
NB.   1) first test assumption
NB.   2) second test assumption
NB.           ....
NB.
NB. author:  John D. Baker
NB. created: 2020dec09
NB. changes: -----------------------------------------------------

cocurrent 'base'
require 'jodtester'

NB. test in clear base if this flag is present and set to 1
NB. 0 = (4!:0) <'JODCLEAROK_ijod_'
NB. 1 -: ".'JODCLEAROK_ijod_'
NB. clear ''

NB. test in temporary junk locale - not all JOD
NB. tests can be performed in junk locales some must run in base
cocurrent jodtestlocale 'AAAglobsSmokeDD00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_