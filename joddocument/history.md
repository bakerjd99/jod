general/joddocument - change history
====================================

### 1.1.3 - (wip) unreleased

 * Dump script hask check noted in `make` section.

### 1.1.2 - July 14, 2024 (Permanent locale edition)

 * Minor edits and additions. The location of `jod.pdf` LaTeX
   is now called out. References to J's before 9.02 have been
   removed. JOD now requires J 9.02 or later.

### 1.1.1 - February 10, 2024 (No-brainer Mea culpa Edition)

 * `od` section edited for new `6 od` option.

### 1.1.0 - February 5, 2024 (Hashy McHashface Edition)

 * New appendix on running JOD tests added.

 * Obsolete J6 graphic removed.

 * Changes to `bnl`, `restd`, `packd` to note the addition
   and use of SHA-256 backup sidecar files.

 * `HASH`, `LEAN` and `ZIG` macro option codes added to table.

 * Minor improvements to puntucation - the typo jihad is ongoing.

### 1.0.25 April 4, 2023 (Spring Indictments Edition)

 * The order of option code tables in appendix E. has
   been changed. The larger table 12 is now on a single
   page to leave space for future codes.

 * Some *undocumented* codes have been added to table 12.

 * The entry for `dpset` has been adjusted to show 
   the new `HASHDUMP` parameter.

### 1.0.23 - January 26, 2023 (Gender Fluid Edition)

 * Component 12 in `jwords` now holds the J `9!:14` system string. This
   helps JOD deal with the binary incompatibility between J 9.04's and earlier
   J's extended precision integers.

 * Correct `abv` monad argument - only takes character lists.

### 1.0.22 - December 11, 2021 (Omicron Variant Edition)

 *  `abv`(all backup versions) added - see `jod.pdf`

 *  Direct definition appendix added.

 *  macOS/Linux paths added to configuration section.

### 1.0.2 - November 9, 2020 (Amazon J Object Dictionary Book Edition)

  * New Amazon printed edition of the (J Object Dictionary)[https://www.amazon.com/dp/B08M2KBMND].
    This is a book version of the distributed `jod.pdf`. If you want to support
    JOD development, consider purchasing a copy. If the preceding link fails
    search your local Amazon for `ISBN-13: 979-8554921117`or Amazon ASIN key `B08M2KBMND`

  * New Jupyter lab pdf added `UsingJodliterate.pdf`- see the directory

 jpath '~addons/general/joddocument/pdfdoc'

### 1.0.1 - March 28, 2020 (Social Distancing Edition)

  *  URLs in `jod.pdf` modified to use HTTPS instead of HTTP.

  * References to JAL changed to use pacman instead.

### 1.0.0 - December 9, 2019 (Feature Complete Release)

  * `bget` backup get section added. 

  *  pdf versions of Jupyter labs added - see the directory

          jpath '~addons/general/joddocument/pdfdoc'

### 0.9.999 - August 29, 2019

  * version bump for J 9.01 beta patch.

### 0.9.998 - February 14, 2019 (Valentine's Day)

  * `rxs` section added. 

### 0.9.996 - October 14, 2018

  * `mnl` section added.

### 0.9.995 - May 28, 2018 (Memorial Day update)

  * start of revision cycle for J version 8.07+.

  * JOD folders and JOD labs screen captures updated
    for J 8.07 JQT.

  * new `unicode4` type added to Hungarian appendix.


### 0.9.993 - May 21, 2018

  * first commit to new Jsoftware GitHub repositories.

### 0.9.990 - February 27, 2017

  * edit `joduserconfigbak.ijs` appendix to better
    support using JOD in jconsole.exe sessions.

### 0.9.987 - March 20, 2016

  * minor edits

### 0.9.985 - August 9, 2015

  * `bnl` backup names lists section added.  

### 0.9.980 - August 1, 2015

  * new `compj` tag `(/:)=:` described
  
  * `ed` example of editing (name,[class],value) tables added
  
  * index improvements and minor edits

### 0.9.973 - July 4, 2015
 
  * new appendix "Turning JOD Dump Script Tricks" added

  * `get` and `put` changes for new timestamp support

  * improved J code formatting throughout `jod.pdf`

### 0.9.972 - April 5, 2015

  * minor edits to support lab updates

### 0.9.971 - March 25, 2015

  * fix incorrect footnote link

### 0.9.97 - March 22, 2015

  * changes to `jodhelp` syntax documented

  * changes for J 8.0x systems and JQT

  * changes to `jodsource` noted

  * for more details see the blog post 
    [JOD Update: Version 0.9.97*](https://bakerjd99.wordpress.com/2015/03/22/jod-update-version-0-9-97/)

### 0.9.94 - June 14, 2014

  * JAL version incremented so `joddocument` addon appears for J 8.0x systems

### 0.9.93 - November 23, 2013

  * synchronize `jod.pdf` version with distributed JOD addon. 

### 0.9.90 - January 26, 2012

 * `nt` dyad documented.
 
 * version control appendix revised - added reference to
   [GitHub](https://github.com/bakerjd99/joddumps) `joddumps` repository.
   
### 0.9.85 - October 13, 2012

 * minor edits - `MARKDOWN` code 27 and `5 disp ''` noted.
 
 * this document converted to [markdown](http://daringfireball.net/projects/markdown/)

### 0.9.80 - July 13, 2012

 * references to Mac version and `joddocument` addon added 

### 0.9.76 - June 20, 2012

 * PDF JOD documentation split off into a separate addon. The main
   file `jod.pdf` is relatively stable and almost ten times the size
   of the core JOD addon. It has been removed from the core JOD addon
   to reduce download times. [`jod.pdf`](http://bakerjd99.wordpress.com/the-jod-page/)
   has been available on the JOD Page for users to download and 
   copy to the correct `jodhelp` directory but with the 
   proliferation of J platforms and JOD versions this is getting 
   messy. It's easier to use JAL to distribute this file and change
   `jodhelp` to look in this addon's directories.
 
