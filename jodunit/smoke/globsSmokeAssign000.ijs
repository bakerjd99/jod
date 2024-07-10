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
NB. 24jul10 revised for j 9.6 (cocreate/coerase) changes

cocurrent 'base'
require 'jodtester'

cocurrent jodtestlocale 'AAAglobsSmokeAssign000'

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
er globs 'mixedIndirectAssignOk0_',(testlocale_ijod_),'_'
er 11 globs 'mixedIndirectAssignOk0_',(testlocale_ijod_),'_'
er globs 'mixedIndirectAssignOk1_',(testlocale_ijod_),'_'
er 11 globs 'mixedIndirectAssignOk1_',(testlocale_ijod_),'_'

NB. detect mixed indirect assignment name use
ner globs 'mixedIndirectAssignError0_',(testlocale_ijod_),'_'
ner globs 'mixedIndirectAssignError1_',(testlocale_ijod_),'_'

NB. override mixed assignments
er globs 'OverrideIndirectAssign1_',(testlocale_ijod_),'_'
er 11 globs 'OverrideIndirectAssign1_',(testlocale_ijod_),'_'

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_