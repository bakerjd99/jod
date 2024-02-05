NB.*jodparms s-- default dictionary parameters.
NB.
NB. This file is used to set  the  default  dictionary parameters
NB. table  in the master file. When  a  new dictionary is created
NB. the  parameters  in the  master file are used to specify  the
NB. parameters for a particular dictionary. The  verb (dpset) can
NB. be   used  to   modify  parameter  settings   in   individual
NB. dictionaries.  Master  file parameters can only be changed by
NB. editing this file and recreating the master file.
NB.
NB. The master file can be recreated with the call:
NB.
NB. createmast_ajod_ JMASTER_ajod_
NB.
NB. WARNING: all the  parameters currently listed are required by
NB. the JOD system. If you remove any of them JOD will crash. You
NB. can  safely add additional parameters but  you  cannot safely
NB. remove current parameters.

MASTERPARMS=: 0 : 0

NB. The format of this parameter file is:
NB.     jname ; (type) description ; value
NB. 
NB.     jname is a valid J name
NB.     (type) description documents the parameter - type is required
NB.        only (+integer) is currently executed other types will
NB.        be passed as character lists (see dptable).
NB.     value is an executable J expression that produces a value

ASCII85    ; (+integer) when 1 use ascii85 in dumps (0 or 1)            ; 1  
COPYFACTOR ; (+integer) components copied in one loop pass (1<y<240)    ; 100
DOCUMENTDICT ; (+integer) when 1 dictionary document is put (0 or 1)    ; 1
DOCUMENTWIDTH ; (+integer) width of justified document text (20<y<255)  ; 61
DUMPFACTOR ; (+integer) objects dumped in one loop pass (1<y<240)       ; 50
GETFACTOR  ; (+integer) words retrieved in one loop pass (10<y<2048)    ; 250
PUTFACTOR  ; (+integer) words stored in one loop pass (10<y<2048)       ; 100
RETAINAGE  ; (+integer) when 1 timestamps are saved in dumps (0 or 1)   ; 1
HASHDUMP   ; (+integer) when 1 a hash is prefixed to dumps (0 or 1)     ; 1

NB. ROOTFOLDER is empty by default. If it is set to a (jpath) J configured 
NB. folder ROOTFOLDER overrides dictionary locations for (mls) generated scripts 
ROOTFOLDER ; (character) redirects (mls) scripts to J folder ; 

NB. typical nonempty setting
NB. ROOTFOLDER ; (character) redirects (mls) scripts to J folder ; ~user/jodroot 

NB. Any added parameters are stored in the master file when
NB. created and distributed to JOD directory objects.  

NB. WARNING: when defining J expressions be careful about the ; character 
NB. the JOD code (dptable) that parses this string is rudimentary.

NB. COPYRIGHT ; (character) ; All rights reserved
NB. MYPARAMETER ; (+integer) the answer ; 42
)

