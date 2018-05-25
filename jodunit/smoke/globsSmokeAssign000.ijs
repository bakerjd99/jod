NB.*globsSmokeAssign000   t--   indirect  assignment  of   global
NB. unquoted name list nouns.
NB.
NB. Error discovered during use of JOD on 09 Oct 2015 12:54:41
NB.
NB. author:  John D. Baker
NB. created: 2015oct09
NB. changes: -----------------------------------------------------
NB. 17may12 finally fix this nuisance
NB. 17may15 add override tag (^:)=:
NB. 18may23 change override tag to (<:)=: - see noun MIXEDOVER

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD';1
NB. -{TEST START}-

NB. no mixed assignments
mixedIndirectAssignOk0=:4 : 0
(MethodArguments)=. 0
funcky=. 'zout_Swag_'
(func)=: [ + 0 * ]
a=. 8
b=: 666 
)

NB. no mixed assignments and redundant parentheses
mixedIndirectAssignOk1=:4 : 0
((MethodArguments))=. 0
funcky=. 'zout_Swag_'
(func)=: [ + 0 * ]
((((bull))))=: 'cowboy'
)

NB. mixed assignments (func) is used both locally and globally
mixedIndirectAssignError0=:4 : 0
func=. 'zout_Swag_'
(func)=: [ + 0 * ]
)

NB. there are mixed assignments because (func) name
NB. is both locally and globally assigned this is ok
NB. in J but sloppy name use as far as JOD is concerned
mixedIndirectAssignError1=:4 : 0
(MethodArguments)=. 0
func=. 'zout_Swag_'
(func)=: [ + 0 * ]
)

OverrideIndirectAssign1=:4 : 0
NB. override mixed assignments (<:)=:
(MethodArguments)=. 0
func=. 'zout_Swag_'
(func)=: [ + 0 * ]
)

NB. globs looks for word values in base locale 
NB. by default look in test locale for this test

NB. returns correct result
er globs 'mixedIndirectAssignOk0_AAAsmoke999_'
er 11 globs 'mixedIndirectAssignOk0_AAAsmoke999_'
er globs 'mixedIndirectAssignOk1_AAAsmoke999_'
er 11 globs 'mixedIndirectAssignOk1_AAAsmoke999_'

NB. detect mixed indirect assignment name use
ner globs 'mixedIndirectAssignError0_AAAsmoke999_'
ner globs 'mixedIndirectAssignError1_AAAsmoke999_'

NB. override mixed assignments
er globs 'OverrideIndirectAssign1_AAAsmoke999_'
er 11 globs 'OverrideIndirectAssign1_AAAsmoke999_'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_