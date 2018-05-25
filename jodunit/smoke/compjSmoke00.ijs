NB.*compjSmoke00 t-- test (compj) name obfuscation.
NB.
NB. When the  string (/:)=:  appears  in  a J  word  (compj) will
NB. obfuscate any  local names. Obfuscated names  begin  with the
NB. prefix  (OBFUSCPFX)  and   end  with  random  base  NAMEALPHA
NB. suffixes   controlled  by  (OBFUSCCNT).   Higher   values  of
NB. (OBFUSCCNT) generate longer and less likely to clash names.
NB.
NB. verbatim:
NB.
NB.   1) assumes test dictionary (testjod00) exists
NB.
NB. author:  John D. Baker
NB. created: 2015jul17
NB. changes: -----------------------------------------------------
NB. 18may23 updated to correspond to: rtt 'createtestdictionaries'

cocurrent 'base'
require 'jodtester'

coclass tmploc_AAAsmoke999_=: 'AAAsmoke999' [ coerase <'AAAsmoke999'
coinsert 'ijod'

testenvironment 'good';'JOD'
NB. -{TEST START}-

tdict=: 'testjod00'

er od tdict [ 3 od  ''

NB. character table representation of j words, call:  jcr 'verb'
jcr=:[: ];._1 (10{a.) , [: 5!:5 <

NB. define word with obfuscation
obfuscateme0=: 3 : 0
NB. (/:)=: obfuscate local names
'locals that get weird'=. y
for_voodo. y do.
  locals
  weird
  i =. #locals
  w =. i
end.
)

NB. local plain names
lnames=: ;(<1;1) { ; 1 { 11 globs 'obfuscateme0_AAAsmoke999_'

NB. store in dictionary
er tmploc put 'obfuscateme0'

NB. read back and define with obfuscated names
1 [ 0!:001 [ ;1{compj 'obfuscateme0'

NB. local obfuscated names
onames=: ;(<1;1) { ; 1 { 11 globs 'obfuscateme0_AAAsmoke999_'

(#onames) = #lnames

1 [ showpass lnames ,. onames

shortenme0=: 3 : 0
'locals that get weird'=. y
for_voodo. y do.
  locals
  weird
  i =. #locals
  w =. i
end.
)

NB. local plain names
lnames=: ;(<1;1) { ; 1 { 11 globs 'shortenme0_AAAsmoke999_'

NB. store in dictionary
er tmploc put 'shortenme0'

NB. read back and define
1 [ 0!:001 [ ;1{compj 'shortenme0'

NB. local short names
snames=: ;(<1;1) { ; 1 { 11 globs 'shortenme0_AAAsmoke999_'

(#snames) = #lnames

1 [ showpass lnames ,. snames


NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <tmploc_AAAsmoke999_