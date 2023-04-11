
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_9kj3of3quj79oxemk54fk0ud2_>` Consider adding a hash sidecar file to binary backups. Six numbered `*.ijf` files are created
   by a backup. They should never be altered by JOD again and being backups integrity is critical.
   The sidecar file would be simple text file with SHA-256 hashes, i.e.
   ~~~~
   42jchashes.txt
   NB. code 17 on bnl tests the backups against hashes
   17 bnl '.'
   ~~~~

2. `<_7zh37k9klj5wkdpj40bzsqnm8_>` Consider adding a hash object facility that will store a SHA-256 hash when putting
   objects. I am thinking another option code `17` that would mean store a hash on
   `put` or test a hash on `get`
   ~~~~
    NB. word is put and a hash is stored in a reserved slot.
    0 17 put 'word'
    NB. hash is compared to value retrieved - error if match fails.
    0 17 get 'word'
   ~~~~

3. `<_botm3t2vdtw7ite6kkyyi014v_>` J's file verbs may hang when accessing windows files on drives accessed by
   VPN connections when VPN is off. There's not much JOD can do for mapped (letter'ed)
   drives but `fexist` eventually returns 0 for VPN shares like:
   ~~~~
    fexist '//jfsdev04/shares/jod/jod/jwords.ijf'
   ~~~~
   JOD could do a quick existence check on windows systems when it sees unmapped
   shares `//some/share/ehh/jwords.ijf`.  This will not help for VPN mapped drives
   when VPN is off.

4. `<_31t8dofxlypuuaflswoq784pp_>` Test `jodliterate` on macOS and linux. Tweak if needed.

5. `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

6.   `<_6kfjobpvb6ikszgzq1m9t9aub_>` Consider adding a new appendix to `jod.pdf` describing how to run JOD tests.

7.   `<_d1dtfkd14ypvlatnch2pa5hwo_>` Consider allowing `~/` as a path prefix on macOS and Linux systems. The home directory convention on these systems is respected by `dir`.

`[end-todo]`
