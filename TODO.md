
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_eqcjtoea1ivzk3f1k7l3y2nav_>` Consider adding a new 
   `dpset` option `FORCEMASTERPATH` that will inject the current
   master file path into a dictionary. This option would alter files that are
   set READONLY in JOD. Something that I strive NOT TO DO but in this case it's
   either write a few bytes to a file declared READONLY or rebuild the dictionary
   from a dump. The main use would be to make it easier to move dictionary directories
   around. Currently JOD remembers where things are and whines if they go missing.
   ~~~~
   NB. replaces the put dictionaries path with currently open master path
   dpset 'FORCEMASTERPATH'
   ~~~~

2. `<_blzjon6v8f3bdq46k8wlzuz74_>` Consider extending `restd` to retore particular backups. 
   Currently it restores the the move recent backup. Also, consider checking the hashes 
   during restore. I will probably allow hash failure to restore but users should know 
   someting has been screwing with their backups.
   ~~~~
   NB. restore backup 42
   restd 'bitching';42

   NB. restore backup 42 ignoring hash mismatches
   restd 'bitching';42 17
   ~~~~

3. `<_3bq9v9yst3qu3t62zicli27gv_>` New numeric datatypes and a conversion utility `c.` are being
   added in J 9.6 (2024jan02) we now have
   `/integer1/integer2/integer4/floating2/floating4/floating16` whenever there are
   changes to binary internals it impacts JOD.  I've already hit a conversion precision error.
   The serial dump format usually works going forward but I am concerned about creating
   dump scripts that will not load in older J versions. Will have to devise some scheme
   to cope.

4. `<_9kj3of3quj79oxemk54fk0ud2_>` Consider adding a hash sidecar file to binary backups. 
   Six numbered `*.ijf` files are created by a backup. They should never be altered by JOD 
   again and being backups integrity is critical. The sidecar file would be simple text file 
   with SHA-256 hashes, i.e.
   ~~~~
   42jchashes.txt
   NB. code 17 on bnl tests the backups against hashes
   17 bnl '.'
   ~~~~

5. `<_7zh37k9klj5wkdpj40bzsqnm8_>` Consider adding a hash object facility that will store a SHA-256 hash when putting
   objects. I am thinking another option code `17` that would mean store a hash on
   `put` or test a hash on `get`
   ~~~~
    NB. word is put and a hash is stored in a reserved slot.
    0 17 put 'word'
    NB. hash is compared to value retrieved - error if match fails.
    0 17 get 'word'
   ~~~~

6. `<_botm3t2vdtw7ite6kkyyi014v_>` J's file verbs may hang when accessing windows files on drives accessed by
   VPN connections when VPN is off. There's not much JOD can do for mapped (letter'ed)
   drives but `fexist` eventually returns 0 for VPN shares like:
   ~~~~
    fexist '//jfsdev04/shares/jod/jod/jwords.ijf'
   ~~~~
   JOD could do a quick existence check on windows systems when it sees unmapped
   shares `//some/share/ehh/jwords.ijf`.  This will not help for VPN mapped drives
   when VPN is off.

7. `<_31t8dofxlypuuaflswoq784pp_>` Test `jodliterate` on macOS and linux. Tweak if needed.

8.  `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

9.   `<_6kfjobpvb6ikszgzq1m9t9aub_>` Consider adding a new appendix to `jod.pdf` describing how to run JOD tests.

10.   `<_d1dtfkd14ypvlatnch2pa5hwo_>` Consider allowing `~/` as a path prefix on macOS and Linux systems. The home directory convention on these systems is respected by `dir`.

`[end-todo]`
