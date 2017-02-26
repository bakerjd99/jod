NB.*joduserconfigbak s-- example JOD user configuration script.
NB.
NB. This  script is  executed before JOD objects  are created. It
NB. can be used to redefine and customize various class nouns. To
NB. make  this script  active  rename it to joduserconfig.ijs and
NB. copy it, with your edits, to the main jod directory:
NB.
NB. ~addons\general\jod
NB.
NB. The nouns listed below are good candidates for redefinition.

NB. smoutput 'joduserconfig.ijs executing ...'

NB. PDF reader in jodutil class - current setting is the default directory
NB. for the Windows version of Adobe Reader. Reset for other PDF readers
NB. PDFREADER_ajodutil_=:'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'

NB. reset J's PDF reader to match JOD's PDF reader - do for (jconsole.exe)
NB. PDFReader_j_=: PDFREADER_ajodutil_

NB. alternative Ghostscript compatible reader
NB. PDFREADER_ajodutil_=:'C:\Program Files\Ghostgum\gsview\gsview32.exe'

NB. Preferred web browser in jodutil class - default Windows FireFox directory
NB. WWW0_ajodutil_=:'C:\Program Files\Mozilla Firefox\firefox.exe'

NB. Secondary web browser in jodutil class - default Windows directory
NB. WWW1_ajodutil_=:'C:\Program Files\Internet Explorer\IEXPLORE.EXE'

NB. Text editor to use when running JOD in (jconsole.exe) on Windows systems
NB. QT/JHS configurations are not necessarily applied for (jconsole,exe)
EDCONSOLE_ajodutil_=:'"C:\Program Files (x86)\notepad++\notepad++.exe"'
