NB.*newdSmokeBadArguments00 t-- invalid (newd) argument tests.
NB.
NB. author:  John D. Baker
NB. created: May 1999  
NB. changes: ----------------------------------------------------- 
NB. 07nov   updated to JOD J version 6.02+
NB. 07dec05 format
NB. 11nov23 updated for J7/Linux
NB. 18may31 updated for J 8.07

NB. The following inputs should result in error messages (newd).
cocurrent 'base'

0 = (4!:0) <'JODCLEAROK_ijod_'
1 -: ".'JODCLEAROK_ijod_'
clear ''

require 'jodtester'
NB. expecting nothing but errors
testenvironment 'bad';'JOD'
NB. -{TEST START}-

NB. (newd) accepts only blcl -- boxed lists of character lists
NB. following arguments should be rejected.

NB. numeric atoms
er newd 0
er newd 3
er newd _3
er newd 23.7
er newd 8j4
er newd 1.8976e24
er newd 1x1       NB. the number e in J
er newd 4ar4
er newd 8888888777777999999999999999999999x
er newd 112233445566778899r7878787878787878787878787

NB. symbols, unicode 
er newd s:' notaname'
er newd u: 'nounicodenames'

NB. numeric arrays (random shapes and sizes)
er newd (?(?4)#3)$0
er newd (?(?4)#3)$3
er newd (?(?4)#3)$_3
er newd (?(?4)#3)$23.7
er newd (?(?4)#3)$8j4
er newd (?(?4)#3)$1.8976e24
er newd (?(?4)#3)$8888888777777999999999999999999999x
er newd (?(?4)#3)$112233445566778899r7878787878787878787878787

NB. empties
er newd i.0
er newd ''
er newd a:
er newd 2#a:
er newd 3#a:
er newd 0$2.8
er newd 0 0$0
er newd 0 0$'*'
er newd 0 5$<'just testing'
er newd 5 0 3$6 4 9

NB. borderline cases
er newd 0;''          NB. mixed cases
er newd '';'';0
er newd '';(<<'boo');''
er newd 3;'';''
er newd '';''         NB. almost correct null name, null location
er newd '';'';''      NB. almost correct null name, location, documentation
er newd 'boo';''      NB. valid name, null location
er newd '';'c:\xxboo'   NB. null name, valid location
er newd '';'';'four score and ...' NB. null name,location ok documentation
er newd ' ';' '       NB. blanks
er newd '  ';' ';' '

NB. er newd 'test'      NB. no location - this case is
NB. no longer an error a dictionary is now created in a default
NB. directory location  (January 2000)

er newd 'bad chars \'
er newd '0*'

NB. likely typos
er newd 'test';'\zztop'  NB. drive letter required
er newd 'test';'here'    NB. path must be rooted, e.g.   \here
er newd 's';'s'          NB.  " "
er newd 'test';'c:here'  NB.  " "
er newd 'test';'c:'      NB.  " "
er newd 'test';'c:\'     NB.  rooted but no directory name

NB. invalid drive names (OS dependent)
er newd 'test';'longvolume:\xxnot\ok\in\win95'
er newd 'test';'c::\xxto\many\colons\'
er newd 'test';'c\:xxto\transposed\colon\slash'
er newd 'test';'\:xxto\transposed\colon\slash'

NB. Invalid characters in names and paths.
NB. Dictionary names are formed from ' [a-z][0-9][A-Z]'
NB. and paths include the additional characters (PATHCHRS)  this
NB. is a "safe" subset of the characters supported by most hosts.

er newd ('no line ends',CR,'please');'c:\zztop'
er newd ('no line ends',CRLF,'please');'c:\zztop'
er newd ('no line ends',LF,'please');'c:\zztop'
er newd ('no line ends',TAB,'please');'c:\zztop'
er newd ('no slashes \ in names');'c:\zztop'

er newd 'badboys';'c:\zztop',CR,'less'
er newd 'badboys';'c:\zztop',CRLF,'less'
er newd 'badboys';'c:\zztop',TAB,'less'

NB. -{TEST SUCCESSFUL}-
ereopen 0
