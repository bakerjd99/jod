general/jod - change history
=============================

### 1.1.3 - (wip) unreleased

 *  The `6 od` option changed to open the entire path of the
    the last dictionary in a list of dictionaries and put leading
    dictionaries first. 

         NB. open all on (joddev) path and make (imex) put
         6 od ;:'imex joddev' 
         NB. open all on (play) path and prefix (gps, docs) (gps) is put
         6 od ;:'gps docs play'

    A handy verb `oep` has been added to the JOD profile for this.

         NB. open all dictionaries on (joddev) path
         oep 'joddev'

 *  Extra blanks inserted after }} delimiters in embedded direct 
    definitions are now reduced to one blank, for example:
        
         ddme=: 3 : 0
         NB. embedded ddef
         _2 ]\ {{ y #~ b +. _1 |. b=. '@' E. y }}         y,' '
         )

     is now rendered as:
        
         ddme=:3 : 0
         NB. embedded ddef
         _2 ]\ {{ y #~ b +. _1 |. b=. '@' E. y }} y,' '
         )

 *  `make` now checks dump script contents against its hash.

         df=: make ''   NB. dump all words on path
         17 make ;{:df  NB. check dump against leading hash

 *  `RUST` and `CSRC` macro text types added for rust and C code.

### 1.1.2 - July 14, 2024 (Permanent Locale Edition)

 *  JOD now requires J's after version 9.02. 9.02 introduced
    direct definitions. Some JOD words now use direct definitions.

 *  `jodon` and `jodof` have been changed to handle permanent
    locales introduced in J 9.6. `jodoff` no longer destroys JOD
    class locales. It now simply closes open dictionaries and removes
    `ijod`, the JOD interface locale from the base path. `jodon`
    restores `ijod` to the base path. The now permanent JOD class
    locales (`ajod,ajoddob,ajodmake,ajodstore,ajodtools,ajodutil`)
    are not changed by `jodon` and `jodoff`. 
 
    To create or refresh JOD class locales you must:

         load 'general/jod'
		 
    This change is backward compatible and runs in J's before 9.6.
	
 *  Many JOD test scripts use named locales. They were created,
    typically loaded with JOD (get)'s, executed, and then deleted
    to clean up test artifacts. This pattern will not work in J 9.6
    as locales are permanent unless explicitly created as temporary.
    The backward compatible (jodprofile.ijs) verb (jodtestlocale) 
    maintains this pattern and many test scripts at:

         https://github.com/bakerjd99/jod/tree/master/jodunit
	
    illustrate its use. All JOD test scripts are distributed in
    in the `~addons/general/jodsource` addon.

 *  `CLEARVOBS_ijod_` can be used to control vestigal JOD object
    removal during loads. In rare cases the verb `clearvobs` might
    select numbered user locales. This is particularily likely if
    the user locale is empty. By setting `CLEARVOBS` to 0 in 
    (jodprofile.ijs) JOD will not remove vestigal locales. With 
    `CLEARVOBS` set to 0 repeated (load 'general/jod') loads will 
    orphan JOD objects. As collisions with user locales are unlikely
    the default is 1.
		 
		 
### 1.1.1 – February 10, 2024 (No-brainer Mea culpa Edition)

 *  A new `od` option opens the entire put dictionary path. This
    is such a timesaving no-brainer I'm embarrassed for not thinking
    of it years ago.

         6 od 'adnd' NB. opens all on (adnd) path - makes (adnd) put
         6 od ;:'gps smug utils' NB. opens all on (gps) path - makes (gps) put    
         oep_ijod_=: 6&od  NB. define handy shortcut in JOD interface locale  

 *  New test cases and changes to `jodtester` to make tests more portable.

### 1.1.0 - February 5, 2024 (Hashy McHashface Edition)

 * `HASH`, `LEAN` and `ZIG` macro option codes added.

 * `dpset` takes a new option `FORCEMASTERPATH` that forces the 
    path in the master file into the put dictionary even
    if the put dictionary is `READONLY`. The main use of
    `FORCEMASTERPATH` is to reset the internal paths in `READONLY`
    dictionaries that have been moved. After forcing paths 
    the dictionary must be closed and reopened.
 
 *  Sidecar files of SHA-256 hashes are now written during 
    backup `packd` operations.  For backup 42 the file is `42jhashes.txt`

 *  A new `bnl` option has been implemented to check backup files
    against the hashes stored in the sidecar file.

         17 bnl '.'  NB. 17 = HASH

 *  `restd` now restores particular backups instead of just 
    the last backup. Also, backup files are checked against
    the hashes in the corresponding sidecar file and the 
    restore is aborted if any hashes do not match.
   
         restd 'dname'     NB. restore last backup
         restd 'dname';11  NB. restore backup 11
         restd 'dname';11 17  NB. restore ignoring backup hashes
        

### 1.0.25 April 4, 2023 (Spring Indictments Edition)

 * `newd` now takes `dpset 'RETAINAGE';1` and `dpset 'ASCII85';1` as defaults
    when creating new dictionaries.

 *  A new parameter `HASHDUMP` has been added to `jodparms.ijs`. The default
    is 1, turn off with 0. When 1 a SHA-256 hash is prefixed to the start of dump
    scripts. The following tests for dump script integrity:

         chkhashdmp_ajod_ '~addons/general/jodsource/joddev.ijs'

 *  A new macro qualifier `IPYNB` code has been added for Jupyter notebooks. Notebook files
    can be stored as JOD macros with:
        
         NB. read notebook and store
         ipynb=: utf8 read 'notebook.ipynb'
         4 put 'notebook_ipynb';IPYNB_ajod_;ipynb

 *  The put dictionary path is now in the header comments of JOD
    dumps. For example the `joddev` dictionary has a path:
 
         ;:'joddev jod utils'

    This path was not previously shown. 

 *  A bug introduced in version (1.0.23) has been corrected. A default
    message was incorrectly set leading to `0 666 put ''word''` failures (SIGH).
       

### 1.0.24 February 28, 2023 (Spy Balloon Edition)

 * J 9.04 renamed to J 9.4 and the layout of 9!:14 was changed this
   required a change to `jvn` which computes a floating version number.

 * `DPLIMIT` was bumped up to 64. If you need more than 64 dictionaries
   on your JOD path you are doing something wrong! 

 * `putgs` adjusted to check binary compatibility - missed this in prior version.


### 1.0.23 January 26, 2023 (Gender Fluid Edition)

 * J 9.04's use of [GMP](https://gmplib.org/) for extended precision integers 
   has introduced a binary incompatibility between J 9.04 and prior versions of J.
   JOD stores extended precision integers in dictionary binary `jfiles`. J 9.04
   can read older extended integers but if J 9.04 writes extended integers to `jfiles`
   components older J's can no read longer them. This version adds checks to `put`,
   `globs` and `dpset` to prevent the mishandling of new/old binary data in dictionaries.

   WARNING: to upgrade to this version of JOD reset your JOD master file by:

        load 'general/jod'

        NB. backup your currently registered dictionaries and shut J down
        (1 pick 5 od '') fwrite jpath '~addons/general/jod/jodregister.ijs'
        
        NB. restart J and erase the files
        ferase jpath '~addons/general/jod/jmaster.ijf'
        ferase jpath '~addons/general/jod/jod.ijn'

        NB. reload the registered dictionaries paying attention 
        NB. to any binary incompatibility messages
        load 'general/jod'
        0!:001 <jpath '~addons/general/jod/jodregister.ijs'

        NB. to use old (before 9.04) dictionaries you will have to set them 
        NB. READONLY in an older version of J and then register in J 9.04

        NB. set dictionary READONLY in an older j
        od 'olddict'
        dpset 'READONLY'

        NB. then in a new (J 9.04+) J register 
        regd 'olddict';'c:/where/your/dict/is'

   NOTE: if you are only interested in running current J9.04 and newer
   versions of J. You can dump your dictionaries as dump scripts and reload
   them in newly created J 9.04 dictionaries. The JOD manual explains how to do this
   in the *Turning JOD Dump Script Tricks* appendix. 

 * J 9.04's changes to the use of the regular expression library `PCRE2` forced some 
   adjustments to `rxs`. Unicode characters are turned off with `rxutf8 0` prior
   to `rxs` searches. The setting should be restored after `rxs` runs but I would
   advise checking for critical code. Turning off Unicode may limit JOD's ability 
   to deal with some documents but J's Unicode support has always partial.
   
 * `5 od ''` adjusted to sort registered dictionaries.

 * Regex errors (errors in the regex expression) now 
   trapped and clarified: '*wrong' rxs }. dnl ''
   Prior JOD versions let regex errors go to the top level trap.

### 1.0.22 - December 11, 2021 (Omicron Variant Edition)

 *  `abv`(all backup versions) added - see `jod.pdf`

 *  `usedby` was incorrectly excluding names with '_' in results. 

 *  Direct `{{` ... `}}` definitions now supported - see `jod.pdf`  
 
 *  Edit commands displayed for JHS to remind users to allow browser pop ups.

### 1.0.2 - November 9, 2020 (Amazon J Object Dictionary Book Edition)

 *  `jodliterate` pandoc/LaTeX based documentation tool updated, see:

    [Using jodliterate](https://github.com/bakerjd99/jacks/blob/master/jodliterate/Using%20jodliterate.ipynb)

 *  New Amazon printed edition of the (J Object Dictionary)[https://www.amazon.com/dp/B08M2KBMND].
    This is a book version of the distributed `jod.pdf`. If you want to support
    JOD development, consider purchasing a copy. If the preceding link fails
    search your local Amazon for `ISBN-13: 979-8554921117`or Amazon ASIN key `B08M2KBMND`

### 1.0.1 - March 28, 2020 (Social Distancing Edition)

 * `jodcube.ico` and `jodcube.png`added.
    
    see: `jpath '~/addons/general/jod/joddoc'`

    Useful for setting OS icons that brand JOD directories.

 *  (setbuilddirs) modified to create all the directories
    required by the macro (buildjoddistribution). This simplifies
    setting up new machines for building JOD addons. 

 *  `addloadscript1` now insures scripts added to `~config\startup.ijs`
    have `.ijs` extensions. 

### 1.0.0 - December 9, 2019 (Feature Complete Release)

 * `bget` implemented - see `jod.pdf` With this addition all
    planned JOD features are complete. From now on JOD
    changes will consist of bug fixes and optimizations.
    Stability is now the goal.

 * [`bget` Jupyter Lab](https://github.com/bakerjd99/jod/blob/master/jodnotebooks/Using%20JOD%20Backup%20Get.ipynb)

 * some macros and tests adjusted to support 18!:4 changes.

 * new `bget` test cases in JOD source dictionaries.

### 0.9.999 - August 29, 2019

 * patch release fixes startup failure for J 9.01 beta-h and beyond.

 * `MAXNAME` increased to 128 from 60. This parameter controls the maximum
    length of j names that can be stored in JOD. It can be set to
    values between 1 and 255.

 *  `rm`, `rtt` adjusted to support changes to `18!:4`.

### 0.9.998 - February 14, 2019 (Valentine's Day)

 * `rxs` implemented - see `jod.pdf`

 * [`rxs` Jupyter Lab](https://github.com/bakerjd99/jod/blob/master/jodnotebooks/Using%20JOD%20Regular%20Expressions.ipynb)

 * Jupyter notebook versions of JOD labs see:
   [JOD lab notebooks](https://github.com/bakerjd99/jod/tree/master/jodnotebooks)

### 0.9.996 - October 14, 2018

 * `mnl` implemented - see `jod.pdf`

 * `et` adjusted to use `edit_jhs_` under `JHS`.

 *  changed `lg`, `jodon` to support changes to `18!:4`.

 * `EDCONSOLE` set in `profile.ijs` - useful for setting preferred `jconsole.exe` editor.

 * `JSON`, `PYTHON`, `SQL` macro option text codes added. All JOD macro
    text is stored as bytes. The code is a label. It's useful to apply
    the labels as `JSCRIPT` text is executed while other types are not.

### 0.0.995 - May 28, 2018 (Memorial Day update)

 * added `MIXEDOVER` noun to `namecats` - mixed assignment override tag.

 * first JOD release to the new [Jsoftware GitHub](https://github.com/jsoftware) addon repositories.

### 0.9.993 - May 21, 2018 (test of Jsoftware GIT repos)

 * Behaviour of `dpset 'ROOTFOLDER';'~BLOG'` changed. 
   Prior to this release relative root folders were expanded
   and then added to the `scripts 'v'` list. This resulted in
   `scripts` lines like:
        
  TeXfrWpxml  C:/Users/john2000/jod/docs/script/TeXfrWpxml.ijs
        
   Now `jpath` *configured* strings are not expanded resulting in 
   `scripts` lines like:
        
  TeXfrWpxml  ~BLOG/TeXfrWpxml.ijs
  
   This conforms to how `scripts` handles addons.
        
  plot   ~addons/graphics/plot/plot.ijs
  
 * Support for J 6.01 ended and all versions prior to J 8.07 are
   now on life support.

 * `namecats` changed to fix indirect mixed assignment error.
 
        NB. (globs) was failing on verbs like this 
        NB. - there are no mixed assignments.  
        mixedIndirectAssignError=: 4 : 0
        (MethodArguments)=. 0
        (func)=: [ + 0 * ]
        )
  
 * A new name analysis tag `(<:)=:` has been added to `namecats` to
   override mixed assignments. The following legitimate J pattern 
   is used in a number of JOD words.
   
        NB. override mixed assignments (<:)=:
        NB. (dn) appears to be both local and global
        dn=. (<_2}.ix) ,&.> DTSIXCN
        (dn)=: dat
  
   The previous change exposed this issue in JOD code. Override comments
   have been added to JOD words using this pattern.   
          
### 0.9.990 - February 27, 2017

 * `et` adjusted to better support editing when running JOD
    in `jconsole.exe` sessions. See `joduserconfigbak.ijs`
    to see how to configure command line editors. 

        NB. Text editor to use when running JOD in (jconsole.exe) on Windows systems
        NB. QT/JHS configurations are not necessarily applied for (jconsole,exe)
        EDCONSOLE_ajodutil_=:'"C:\Program Files (x86)\notepad++\notepad++.exe"'

 *  `jod.pdf` updated.

### 0.9.987 - March 20, 2016 (solistice)

 * `et` adjusted to support `qjide`. JOD generated text now
   opens in `qjide` editor windows. `qjide` must be updated
   to support this feature.
   
        NB. edit in qjide
        ed 'wordname'
   

### 9.9.986 - August 10, 2015

 * `od` readjusted - added `require` commented out as `require`
    may not always execute.

           1 pick 5 od ''
        NB. JOD registrations: 10 Aug 2015 12:04:44
        NB. require 'general/jod'
        3 regd&> }. od'' [ 3 od ''
        regd 'utils';'c:/jod/utils/'
               ....

### 0.9.985 - August 9, 2015

 * `bnl` backup name lists implemented: see `jod.pdf` for details.

 *  new test scripts added to `jodsource` dictionaries for `bnl`.

 * `jod.pdf` updated for `bnl`.

 * `od` adjusted to prefix registration commands with `require 'general/jod'`.

### 0.9.980 - August 1, 2015
  
 * A new tag `(/:)=:` is recognized by `compj`. When this tag is present
   in a word local names are obfuscated by `compj` instead of being shortened. 
   The tag `(-.)=:` overrides obfuscation. Obfuscation can be useful for
   words that run general scripts with `0!:0`.  Obfuscation makes name clashes
   far less likely. The `compj` entry in `jod.pdf` has been updated to
   describe this change. 

 * obsolete `HTML` document index removed from core JOD.

 * large nouns removed from `utils` to reduce download size.

 * `ed` now handles (name,text) and (name,class,text) tables. 

        NB. fetch backup versions of a word and edit
        'rc nct'=: bget <;._1 ' reb.21 reb19 reb.09 reb.07'
        ed nct

        NB. fetch backup group headers and edit
        'rc nct'=: 2 1 bget <;._1 ' ghead.11 boo.11 ghead.09'
        ed nct

        NB. fetch backup macros and edit
        'rc nct'=: 4 bget <;._1 ' we.13 are.09 backed.03 up'
        ed nct

        NB. fetch path words without defining and edit
        'rc nct'=: 0 10 get }. dnl 're'
        ed nct


### 0.9.973 - July 4, 2015 (Independence Day Edition)

 * A negative option code `_14` has been added to `get` and `put` to
   support timestamp serialization. When JOD generates dump scripts
   with `make` it does not include object creation and last change
   timestamps. Hence, when a dump script is run, it resets
   object timestamps to when *it* runs *not when the dictionary
   objects where created or last changed.*  

        NB. name/creation/lastput timestamps
        'rc wts'=: 0 _14 get }. revo ''
        'rc gts'=: 2 _14 get }. 2 revo ''

        NB. (wts,gts) are boxed tables with (blcl) names in the first row and
        NB. floating fractional day (ft) yyyymmdd.fd timestamps in the second

        NB. update put dictionary timestamps 
        0 _14 put wts 
        2 _14 put gts  
        
 * A new `dpset` parameter `RETAINAGE` has been added to control
   dumping timestamps. When `RETAINAGE` exists and is set to `1` 
   timestamps are serialized and appended to dump scripts. The default
   value is `0`. `RETAINAGE` is a new dictionary parameter and will
   not exist in dictionaries created before this version.
   This can be changed by recreating the master file `jmaster.ijf` 
   and reloading dictionaries from dump scripts. See `jod.pdf`
   for more details. Update the `joddocument` addon to get 
   the current `jod.pdf` edition. 
   
        dpset '' NB. show put dictionary parameter settings

        NB. add timestamps to dump scripts
        dpset 'RETAINAGE';1

        NB. dump scripts now contain object timestamps
        make ''

 * `mls` changed to use new `dpset` parameter `ROOTFOLDER`.
   When `ROOTFOLDER` exists and is a `jpath` J configured 
   folder `mls` writes generated scripts to the `jpath` folder.
   If `ROOTFOLDER` does not exist or is not a  configured `jpath` folder
   generated scripts are written to standard dictionary folders.
   `ROOTFOLDER` is also a new parameter and will not exist in
   dictionaries created before this version.  

        dpset '' NB. show put dictionary parameter settings

        NB. set ROOTFOLDER to a J configured folder
        dpset 'ROOTFOLDER';'~user/jodroot'

        NB. generated scripts are now written to the J folder
        mls 'jodgroupname'

 * Improved error handling for many `ijod` *ad hoc* words: see `jodprofile.ijs`.

 * `swex` and `ltx` removed from `jodtools` class. Use `slex` instead of `swex`
   and `mx` for `ltx`. See `jodprofile.ijs`

 * Code formating improved in `jod.pdf` and revisions made for changes to JOD.

### 0.9.972 - April 5, 2015 (Easter Egg Edition)

 * JOD labs updated to run on Win, Mac, Linux systems.

 * Minor changes to `jod.pdf` to support lab changes.

### 0.9.97 - March 22, 2015

 * `newd` changed to not check volume sizes when `FREESPACE` is zero.
   Volume sizing may perform poorly on network volumes and
   fail entirely on "cloud" platforms.

 * JOD builds modified to run on Win, Mac, Linux systems.

 * Dependence on `zfiles` addon removed. `zfiles` depends on 32 bit
   Windows and is not portable.

 * `TestDictionaryDump` removed from main JOD dictionary. This single
   large object bumped up the `jod.ijs` dump script by five megabytes. 
   `TestDictionaryDump` is now stored in `jodtest.ijs` available on GitHub see:
   [jodtest.ijs](https://github.com/bakerjd99/joddumps/blob/win7/jodtest.ijs)

 * Revisions made to PDF document `jod.pdf`. 

 * For more details see the blog post
   [JOD Update: Version 0.9.97*](https://bakerjd99.wordpress.com/2015/03/22/jod-update-version-0-9-97/)
   
### 0.9.95 - June 25, 2014

 * `extscopes` changed to handle quoted gerund assignments like:
        
        '`this is ok'=: +`-`* 
        '`more ehh'=. #`$

    this bug resulted in `globs` misclassifying names.

### 0.9.94 - June 14, 2014

 * `et` updated to support J 8.02 editors.

### 0.9.93 - November 22, 2013

 * `nc` verb changed to trap limit errors for very long names.
    The standard J definition throws a limit error for names exceeding
    255 characters. 

### 0.9.92 - March 01, 2013

 * `compj` dyad added. `1 compj ;:'word list'` removes
   comments, preserves leading whitespace and reduces
   multiple blanks lines to one blank line. This representation
   is useful when reading code as it suppresses comment clutter.

### 0.9.90 - January 19, 2013

 *  JOD source code is now available on [GitHub](https://github.com/).
    The source is distributed in two repositories:
    
    1. [jod](https://github.com/bakerjd99/jod) contains the files
       distributed with JAL. The additional directory `jodijs` 
       holds fully commented JOD class files.  The standard
       JAL scripts are "compressed."
        
    2. [joddoc](https://github.com/bakerjd99/joddoc) holds all
       the `LaTeX` and supporting files needed to build the
       JOD manual `jod.pdf`.
       
 * Numerous JOD [working dictionaries](https://github.com/bakerjd99/joddumps) 
   are now available on GitHub. 
   
 * `dpset` bug fixed. It was allowing parameter
   changes on `READONLY` dictionaries. Dictionaries 
   must be in a `READWRITE` state to change `dpset ''` parameters. 
        
        dpset 'READWRITE' 
        dpset 'ASCII85';1
        
 * fixed missing `(x,8) disp y` argument option where
   `x` is in `i. 5`. With this change `2 8 disp }.grp''` 
   now displays short group documents just like 
   `2 9 disp }.grp''` displays long documents. 

 * `nt` template strings changed to match the
   strings of `ngc`. `ngc` is a utility verb in the
   distributed JOD dictionaries: see `disp 'ngc'`.
   The template strings are: `{~T~}`, `{~A~}`, `{~D~}`, 
   and `{~SD~}` for  title, author, date (`yyyymondd`) and
   short date (`yymondd`).
   
 * `nt` dyad added.  An `x` argument is 
   a character list of string replacements
   that are applied to `teststub`, see `disp 'teststub'`,
   after template strings are processed. The
   first character in the string delimits
   replacement pairs.
 
        '#change#ME#and#YOU' nt 'newtest'

 * `mg`, `mt`, `mj`, and `tt` removed from `jodtools`. These edit helpers
   are now optionally defined in `~addons/general/jod/jodprofile.ijs`. 

### 0.9.85 - October 13, 2012

 * `jodliterate` group added. See `2 9 disp 'jodliterate'`
   and the blog post [Semi-Literate
   JOD](http://bakerjd99.wordpress.com/2012/10/01/semi-literate-jod/) 
   for details

 * `MARKDOWN` macro text code 27 added.
   
 * `5 disp ''` now displays any overall put dictionary documentation.
 
 *  minor `jod.pdf` edits and additions.
 
 * Starting the process of converting most JOD document 
   text to [markdown](http://daringfireball.net/projects/markdown/) 
   including this document.[^1]

### 0.9.80 - July 12, 2012

 * dictionary documents set and fetched with `5 put 'doc ...'`
   and `5 get ''` are now saved in dump scripts. `5 put '..'` 
   is controlled by a new parameter `jodparms.ijs` `DOCUMENTDICT`
   that determines whether `5 put 'doc ..'` stores text. The
   default `DOCUMENTDICT=1` stores text.

 * vestigial `z` locale dump script load utilities `sonl_z_,
   SOLOCALE_z_, soput_z_` and `soclear_z_` are now erased at the
   end of dump script runs. JOD defines exactly four words
   in the z locale: `jodoff_z_, jodon_z_, jodsystempath_z_`
   and `showpass_z_`.

 * `opendict` has been modified to test whether master
   file paths are prefixes of stored dictionary paths. For 
   `READWRITE` dictionaries the prefix must match. For `READONLY`
   dictionaries the master path replaces the stored path in
   dictionary directory objects if they differ. This allows 
   `READONLY` dictionaries to be placed on locked down network 
   drives and accessed by many users that may have different 
   access paths.  
   
 * DEPENDS sections added to JOD and JODSOURCE manifest scripts.
 
 * `jod.pdf` (general/joddocument addon) updated.

### 0.9.75 - June 26, 2012

 * first Mac compatible version of JOD. The Mac version
   requires J 7.01 or beyond see: 

        ~addons/general/jod/joddoc/macnotes.txt
   
 * `jod.pdf` updated and now distributed as a
   separate JAL addon. Install `general/joddocument`
   to place `jod.pdf` in the directories searched
   by `jodhelp`. `jodhelp` no longer looks for an
   online version of `jod.pdf`. 
   
 * fixed a `disp` length error. 
 
 * line ends in all script files set to line feed LF
 
 * labs updated for J 7.01 and Linux/Mac versions
 
 * lab `jodprjm.ijt` removed - this lab referred
   to an old (pre 7.01) project manager. 
  
### 0.9.7 - Jan 16, 2011

 * `jodfork` now calls `fork_jtask_` - done to handle change
   in main J library. `task` verbs are no longer loaded to `z` locale

### 0.9.65 - Dec 19, 2011

 * `get, put` now fetch and set put dictionary documentation.
 
        5 get '' 
        5 put 'document this dictionary' 

### 0.9.6 - Dec 12, 2011

 * `jodhelp` pointed to new online version of `jod.pdf`
   EPS, TEX and HTML document files removed from main jod dictionary
   to reduce the size of `jodsource.zip`. These files
   are available in the online JOD svn repository. 
   See [The JOD Page](http://bakerjd99.wordpress.com/the-jod-page/).
   
 * `compj` can now be limited to only white space removal by 
   inserting the comment tag `(-.)=:` anywhere in the text of
   an explicit word.
   
### 0.9.5 - Dec 4, 2011

 * fixed a `make` bug in `dumpwords` a path of all
   empty dictionaries failed to make.
   
 * fixed an `mls` bug that produced incorrect 
   JOD `startup.ijs` entries on Linux.
   
 * more test cases added.

### 0.9.4 - Nov 25, 2011

 * update `jodindex.html` to reference current online documentation
 
 * fixed a `make` bug - `make` could fail when words with the
   the same name and different name classes were present on
   the path.
   
 * updating and extending JOD tests.
   
### 0.9.3 - Jun 11, 2011

 * online documentation revised and extended. The online documents
   are hosted by Google Documents and can be read on the web or
   downloaded in a variety of formats: PDF, ODT, Word, HTML. The
   offline `jod.pdf` will be revised after collecting user feedback.

### 0.9.2 - May 29, 2011

 * first Linux compatible version of JOD. The Linux version
   requires J 7.01 or beyond see: 

        ~addons/general/jod/joddoc/linuxnotes.txt

 * online documentation, available via the verb `jodhelp`,
   has been converted to the new Google Document format. 
   The conversion process broke all the internal hyperlinks
   I am slowly fixing them. The offline PDF document 
   [`jod.pdf`](http://www.box.net/shared/gajfu50gc0)
   does not show Linux specific examples but is still
   an accurate description of what JOD is all about.

 * additional information about JOD will be made
   available on [my blog](http://bakerjd99.wordpress.com)
   after a round of beta testing in the wild.  

 * this version of JOD runs on windows J 6.0x and J 7.0x systems.
  
### 0.9.1 - May 7, 2011

 * minor fix of edit verb `et` to run on both 7.0x and 6.0x J systems.

### 0.9.0 - Feb 18, 2011

 * modified to run under J 7.01 JHS and JGTK. This version
   also runs on J 6.0x systems.
   
 * replaced JOD's `z` locale interface with an `ijod` interface.
   JOD now defines only three words: `jodon, jodoff` and 
   `jodsystempath` in the `z` locale.  All other interface
   words are defined in `ijod` which is placed on the
   base locale's search path
   
 * path and file displays converted to `jpathsep` conventions.
 
 * `jod.pdf` removed from the core JOD addon package.  `jod.pdf`
   was by far the largest part of the core install package. `jod.pdf`
   is now browsed on-line by `jodhelp`. You can download `jod.pdf`
   and place it in `~addons/general/jod/joddoc/pdfdoc/` to enable
   local PDF reading.
   
 * online JOD documentation updated to reflect changes.
 
 * `UTF8` macro script code changed from 26 to 28 (remember 28 for `UTF8`).
 
 * `BYTE` macro script code added with value 26.  
 
### 0.8.0 - Oct 31, 2008

 * added new `jodparms.ijs` parameter `ASCII85` that controls whether
   dump files use ascii85 for text objects.  Default is 0.
   The ascii85 representation generally produces smaller 
   dump files but is slower than the default method.
   
 * `jodsource` uses ascii85 for JOD development dictionaries to 
   reduce the size of the downloads.
   
 * minor fixes in `jod.pdf`

### 0.7.3 - Oct 7, 2008

 * forced path comparisons to lower case in JOD Lab #4 and test `'setup_jodproject'`
 
 * fixed a few typos in `jod.pdf`

### 0.7.2 - Sep 25, 2008

 * completed dyadic case of `doc`
 
 * updated `jod.pdf` to describe changes

### 0.7.1 - Sep 24, 2008

 * removed some large EPS files from dictionary to reduce download size
 
 * replaced JOD directory diagram in `jod.pdf` - reduces size of j`od.pdf`

### 0.7.0 - Sep 24, 2008

 * references added to `jod.pdf `
 
 * new jod hardcopy [www.lulu.com](http://www.lulu.com) edition
 
### 0.6.0 - Aug 18, 2008

 * minor jod script edits
 
 * `jod.pdf` index improved 
 
### 0.5.1 - Jul 21, 2008

 * `joduserconfig.ijs` added
 
 * `gdeps` now documented in `jod.pdf`
 
### 0.5.0 - Jul 18, 2008

 * `jod.pdf` documentation complete
 
### 0.4.0 - Jul 10, 2008

 * insure at least one group in `joddevload` for lab
 
 * minor lab edits - refer to `startup.ijs` instead of `scripts.ijs`
 
### 0.3.8 - May 31, 2008

 * minor update to last lab section

### 0.3.7 - May 31, 2008

 * bug fixes in labs - all labs can be run

### 0.3.6 - May 29, 2008

 * first release of fully "addon-ized" JOD - versions prior
   to this release had to be manually installed by 
   ad-hoc scripts. Now the JAL system handles JOD installs.
   
 
[^1]:  This document can be converted to many formats with 
       [pandoc](http://johnmacfarlane.net/pandoc/).
       For example the following command produces an HTML version:
       
            pandoc -s historyjod.markdown -o historyjod.html
