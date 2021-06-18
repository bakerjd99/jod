
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_c4hd9p1uql0p2xhsl6q9rizdg_>` Test direct definition's impact on JOD. The new direct definition facility in J introduces a new digraph `{{` `}}` delimited means of defining inline nouns, verbs, adverbs and conjunctions. Make sure JOD can handle all these new forms.

2. `<_0ieeylze6dv47vimqz8rok5ci_>` Similarly make sure `jodliterate` works for direction definitions, see:  [`TODO_jodliterate.md`](https://github.com/bakerjd99/jacks/blob/master/jodliterate/TODO_jodliterate.md).

3. `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

4. `<_cee5z04ltg7qm8m8chp70ujv5_>` Consider adding `abv` (all backup versions) to `JODtools`. This verb is proving so handy it should be part of the standard setup.

5. `<_6kfjobpvb6ikszgzq1m9t9aub_>` Consider adding a new appendix to `jod.pdf` describing how to run JOD tests.

6. `<_60l6jkrqk94hi3bu1zycrcjm2_>` The `utils` verb `fgr` (find group roots) does not appear to handle J names with underscores `_` properly. Investigate and fix. NOTE: `fgr` is not a part of JOD but is very handy when creating and maintaining *class groups*.

7. `<_cs3tdm8qn71elxercfl04ov5h_>` Consider adding an appendix to `jod.pdf` describing how references inside direct definitions are handled.

8. `<_4bbeyvpi7x7t543s8zl3vn0i9_>` Consider adding a `bdisp` verb that would work like `disp` but show objects in backups.

`[end-todo]`
