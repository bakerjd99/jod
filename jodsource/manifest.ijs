NB. manifest for JODSOURCE
CAPTION=:'JOD Object Dictionary Source'
VERSION=:'0.9.995'
FOLDER=:'general/jodsource'
PLATFORMS=:'win linux darwin'
LABCATEGORY=:'General'
FILES=: 0 : 0
manifest.ijs
joddev.ijs
jod.ijs
utils.ijs
jodsourcesetup.ijs
)
RELEASE=:''
DEPENDS=: 0 : 0
general/jod
)
DESCRIPTION=: 0 : 0
(jodsource) contains serialized dictionary dump scripts 
(joddev,jod,utils). These dump scripts contain all the
code, test cases, build scripts, and documentation used
to develop and maintain JOD and related systems.

Dump scripts are large J scripts that load dictionary
objects into JOD dictionaries when run.

JOD system dictionaries are good examples of how JOD 
can be used to build complex J systems.

JOD requires the (data/jfiles) addon. 

JOD source dictionaries can be set up in two ways:

1) Run the J script 

   ~addons/general/jodsource/jodsourcesetup.ijs

   This is the recommended method. (jodsourcesetup.ijs) 
   can take a minute or so to run.
 
2) Run the JOD lab "JOD Source Code Dump Scripts." 
   JOD labs are in the (General) lab category. If you
   do not see JOD labs listed on the Lab menus use the Lab
   browse button to access:

   ~addons/general/jod/jodlabs

More information is available on the JOD Page at:
  
   https://analyzethedatanotthedrivel.org/the-jod-page/
)
