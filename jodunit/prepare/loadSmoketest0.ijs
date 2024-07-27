NB.*loadSmoketest0  t--  load a small collection of objects  into
NB. (tdict).
NB.
NB. This test script is  typically run inside other test scripts.
NB. It should not  alter  the  running locale hence it  lacks the
NB. usual test setup and tear down.
NB.
NB. assumes:
NB.
NB.   0) (jodtestlocale) used to create test locale
NB.
NB.   1) (tdict) dictionary
NB.
NB. author:  John D. Baker
NB. created: 2015aug06
NB. changes: -----------------------------------------------------
NB. 18may24 updated for J 8.07 see: rtt 'createtestdictionaries'
NB. 24jun29 revise for J 9.6 (cocreate/coerase) changes
NB. 24jul27 revised to load (tdict) - set in calling scripts

>0{od tdict [ 3 od ''

NB. words of various types
BOOLATOM0=: 0
BOOLATOM1=: 1
BOOLLIST=: ?. 100#2
BOOLTABLE=: ?. 5 13 $ 2

INTATOM0=: 1
INTTABLE=: ?. 5 3$100

FLOATLIST=: 77.99 % ?. 300#23

CHARLIST=: 'I am what I am because I do what I do'

SYMTAB=: 3 77 $ s: ' we are symbols and that is fine'

BOXSTUFF=: (<BOOLLIST),(<FLOATLIST),<SYMTAB

NB. store locale words if present
(3 : 0)''
nlc=. 'nl_',testlocale_ijod_,'_'
if. # ons=. ".nlc,' i.4' do.
  >0{testlocale_ijod_ put ons
elseif. #nl i.4 do.
  >0{put nl i.4
elseif. do.
  0  
end.
)

NB. a test
>0{1 put 'smoke0Test0';'1 = 1 NB. test script'

NB. a few groups
>0{grp 'boolsmoke0'; ;:'BOOLATOM0 BOOLATOM1 BOOLTABLE'
>0{grp 'intsmoke0'; ;:'INTATOM0 INTTABLE'

NB. some macros
>0{4 put 'smoke0Macro0';21;'i. 23'
>0{4 put 'smoke0Macro1';21;'NB. I do nothing but occupy space. I am a liberal!'

NB. leave dictionary open
