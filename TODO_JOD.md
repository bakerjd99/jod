
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_botm3t2vdtw7ite6kkyyi014v_>` J's file verbs may hang when accessing windows files on drives accessed by
   VPN connections when VPN is off. There's not much JOD can do for mapped (letter'ed)
   drives but `fexist` eventually returns 0 for VPN shares like:
   ~~~~
    fexist '//jfsdev04/shares/jod/jod/jwords.ijf'
   ~~~~
   JOD could do a quick existence check on windows systems when it sees unmapped
   shares `//some/share/ehh/jwords.ijf`.  This will not help for VPN mapped drives
   when VPN is off.

2. `<_0ieeylze6dv47vimqz8rok5ci_>` Make sure `jodliterate` works for direction definitions, see:  [`TODO_jodliterate.md`](https://github.com/bakerjd99/jacks/blob/master/jodliterate/TODO_jodliterate.md).

3. `<_31t8dofxlypuuaflswoq784pp_>` Test `jodliterate` on macOS and linux. Tweak if needed.

4. `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

5. `<_6kfjobpvb6ikszgzq1m9t9aub_>` Consider adding a new appendix to `jod.pdf` describing how to run JOD tests.

6. `<_4bbeyvpi7x7t543s8zl3vn0i9_>` Consider adding a `bdisp` verb that would work like `disp` but show objects in backups.

7.  `<_d1dtfkd14ypvlatnch2pa5hwo_>` Consider allowing `~/` as a path prefix on macOS and Linux systems. The home directory convention on these systems is respected by `dir`.

`[end-todo]`
