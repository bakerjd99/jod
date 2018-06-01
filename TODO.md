`JOD` TODO
==========

Pending and considered changes for `JOD` and its subclasses. 
The base 36 GUID key is stable over the lifetime of a task. 
Browse the revision history of this file to review changes. 
Also, read [`history.md`](https://github.com/bakerjd99/jod/blob/master/jod/history.md) 
to see what *actually got implemented*. Plans do not necessarily materialize.

For years I have maintained a private project log that includes
`JOD` work. I never "published" this document for the simple reason
that I didn't want to imply that I am committing to anything. Now I am committing
to finishing the few remaining `JOD` features. 

`[begin-todo]`

1. `<_8ib1gwadc5e4dw109amx1vqr1_>` Implement `mnl` - master name list.

2. `<_3c2m67nzdf32oe27ta7r2e0hj_>` Implement `rxs` - regular expression search. J 8.07 has replaced PCRE with
   [PCRE2](https://pcre.org/current/doc/html/index.html). This change may result
   in `rxs` requiring new versions of J.

3. `<_dz9ciclzsdnxrcx1m3wxvl2jj_>` Implement `bget` - backup get.

4. `<_77ozevqhpzugqsgru959hbqp2_>` Improve and extend `JOD` labs and insure they run on later J systems. Labs
   have changed in recent J versions.

5. `<_cmual68h5jqlpqz57is84e0j6_>` Revise `jod.pdf` - see related [`joddoc` project](https://github.com/bakerjd99/joddoc).

`[end-todo]`