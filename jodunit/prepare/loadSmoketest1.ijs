NB.*loadSmoketest1 t--  load a small collection of  objects  into
NB. (tdict).
NB.
NB. This  test  script  like (loadSmoketest0)  is  typically  run
NB. inside other test  scripts. It should not  alter the  running
NB. locale hence it lacks the usual test setup and tear down.
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
NB. 18may24 update for J 8.07 see: rtt 'createtestdictionaries'
NB. 24jun29 revise for J 9.6 (cocreate/coerase) changes
NB. 24jul27 revised to load (tdict) - set in calling scripts

>0{od tdict [ 3 od ''

NB. words of various types
boolATOM0=: 0
boolATOM1=: 1
boolLIST=: ?. 100#2
boolTABLE=: ?. 5 13 $ 2

intATOM0=: 1
intTABLE=: ?. 5 3$100

floatLIST=: 77.99 % ?. 300#23

charLIST=: 'I am what I am because I do what I do'

symTAB=: 3 77 $ s: ' we are symbols and that is fine'

boxSTUFF=: (<BOOLLIST),(<FLOATLIST),<SYMTAB

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

NB. some tests
>0{1 put 'smoke1Test0';'1 = 1 NB. test script'
>0{1 put 'smoke1Test1';'2 = 2 NB. test script'

NB. a few groups
>0{grp 'boolsmoke1'; ;:'boolATOM0 boolATOM1 boolTABLE'
>0{grp 'intsmoke1'; ;:'intATOM0 intTABLE'

NB. a suite
>0{3 grp 'suitesmoke1'; ;:'smoke1Test0 smoke1Test1'

NB. some macros
>0{4 put 'smoke1Macro0';21;'i. 23'
>0{4 put 'smoke1Macro1';21;'NB. I do nothing but occupy space. I am a liberal!'

NB. leave dictionary open