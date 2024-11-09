
![jod todo list](todo_jod.png) `JOD` TODO
=========================================

Pending and considered changes for `JOD` and its subclasses.
The base 36 GUID key is stable over the lifetime of a task.
Browse the revision history of this file to review changes.
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md)
to see what *actually got implemented*. Plans do not necessarily materialize.

`[begin-todo]`

1. `<_vwieu578h97x1wsqwkoo8b4t_>` Consider exposing dump script hash checks, e.g.,
   ~~~~
   NB. check dump script contents against hash
   17 bnl jpath '~JODDUMPS/utils.ijs'
   ~~~~
   DONE!! (1.1.3)

2. `<_82d0nudx1m2go87v4x0ty9fkx_>` Consider adding a formating option to `make` that generates
   direct definition forms when making scripts. The direct definition form
   is more elegant and has the nice feature of "dequoting" single line explicits, e.g.
   ~~~~
   NB. quoted standard explicit
   rsvdec=: 3 : ']`(NULLMARK"_)@.((,RSVNULL)&-:)L:0 <;._2&.> <;._2 y'
   NB. dd form
   rsvdecdd=: {{ ]`(NULLMARK"_)@.((,RSVNULL)&-:)L:0 <;._2&.> <;._2 y }}
   ~~~~
   The conversion from standard explicit to dd is straightforward as long
   as the definition does not use any of J's reserved argument names,
   `u v m n`.  A change like this would also impact `jodliterate` but
   overall would make J code nicer to look it.

3. `<_dxkdc53xna97v1culec8kqx0y_>` Consider adding two new configuration options. One to turn on/off direct definition
   formating and control it, another to turn on/off various warnings and control it.
   ~~~~
   NB. turn on direct definition formatting
   dpset 'DIRECTDEF';0  NB. turn off ddefs - current behaviour and default
   dpset 'DIRECTDEF';1  NB. format (make) results as direct definitions
   dpset 'DIRECTDEF';2  NB. format as direct definition turn off `)declarations` , e.g. {{) d x +y}} is {{x + y}}
   dpset 'WARNINGS';0   NB. turn off warnings
   dpset 'WARNINGS';1   NB. turn warnings on - messages when x y u v m n used as locals
   ~~~~

4. `<_3bq9v9yst3qu3t62zicli27gv_>` New numeric datatypes and a conversion utility `c.` are being
   added in J 9.6 (2024jan02) we now have
   `/integer1/integer2/integer4/floating2/floating4/floating16` whenever there are
   changes to binary internals it impacts JOD.  I've already hit a conversion precision error.
   The serial dump format usually works going forward but I am concerned about creating
   dump scripts that will not load in older J versions. Will have to devise some scheme
   to cope. NOTE: seems to have been fixed in later J 9.6 betas.
   EYESOPEN!!

5. `<_7zh37k9klj5wkdpj40bzsqnm8_>` Consider adding a hash object facility that will store a SHA-256 hash when putting
   objects. I am thinking another option code `17` that would mean store a hash on
   `put` or test a hash on `get`
   ~~~~
    NB. word is put and a hash is stored in a reserved slot.
    0 17 put 'word'
    NB. hash is compared to value retrieved - error if match fails.
    0 17 get 'word'
   ~~~~
   ABANDONED!!

6. `<_botm3t2vdtw7ite6kkyyi014v_>` J's file verbs may hang when accessing windows files on drives accessed by
   VPN connections when VPN is off. There's not much JOD can do for mapped (letter'ed)
   drives but `fexist` eventually returns 0 for VPN shares like:
   ~~~~
    fexist '//jfsdev04/shares/jod/jod/jwords.ijf'
   ~~~~
   JOD could do a quick existence check on windows systems when it sees unmapped
   shares `//some/share/ehh/jwords.ijf`.  This will not help for VPN mapped drives
   when VPN is off.
   EYESOPEN!!

7. `<_31t8dofxlypuuaflswoq784pp_>` Test `jodliterate` on macOS and linux. Tweak if needed.

8.  `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs have changed in recent J versions.

9.    `<_d1dtfkd14ypvlatnch2pa5hwo_>` Consider allowing `~/` as a path prefix on macOS and Linux systems. The home directory convention on these systems is respected by `dir`.

`[end-todo]`
