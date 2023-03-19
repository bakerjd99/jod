
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_akoo81ky1kmo83wzd9srv0ksl_>` Consider adding a new parameter to dictionaries that will prefix dumps
   with a SHA-256 hash comment. Also prefix hash comment to JOD compressed distribution scripts.

2. `<_b7fpd1mn3m63aukzo26i7v5a9_>` Include the JOD and J system versions in the result of `5 od ''` it helps
   to know what created the registration (DONE for J 9.41).

3. `<_20ko0gj9obch5nm5grf3ddqe7_>` The format `9!:14` changed for J 9.4. `jvn` computes
   an incorrect version number. Going forward J is using the `version.major.minor` layout.
   Convert version checking in JOD code to use string 'v.m.n' to detect changes. Hold off
   until this format stabilizes. (DONE for J 9.4)

4. `<_botm3t2vdtw7ite6kkyyi014v_>` J's file verbs may hang when accessing windows files on drives accessed by
   VPN connections when VPN is off. There's not much JOD can do for mapped (letter'ed)
   drives but `fexist` eventually returns 0 for VPN shares like:
   ~~~~
    fexist '//jfsdev04/shares/jod/jod/jwords.ijf'
   ~~~~
   JOD could do a quick existence check on windows systems when it sees unmapped
   shares `//some/share/ehh/jwords.ijf`.  This will not help for VPN mapped drives
   when VPN is off.

5. `<_0ieeylze6dv47vimqz8rok5ci_>` Make sure `jodliterate` works for direction definitions, see:  [`TODO_jodliterate.md`](https://github.com/bakerjd99/jacks/blob/master/jodliterate/TODO_jodliterate.md). (SEEMS OK - watch)

6. `<_31t8dofxlypuuaflswoq784pp_>` Test `jodliterate` on macOS and linux. Tweak if needed.

7. `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

8. `<_6kfjobpvb6ikszgzq1m9t9aub_>` Consider adding a new appendix to `jod.pdf` describing how to run JOD tests.

9. `<_4bbeyvpi7x7t543s8zl3vn0i9_>` Consider adding a `bdisp` verb that would work like `disp` but show objects in backups.

10.  `<_d1dtfkd14ypvlatnch2pa5hwo_>` Consider allowing `~/` as a path prefix on macOS and Linux systems. The home directory convention on these systems is respected by `dir`.

`[end-todo]`
