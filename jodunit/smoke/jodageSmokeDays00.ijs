NB.*jodageSmokeDays00 t-- (jodage) day interval cannot be negative.
NB.
NB. created: October 16, 2007
NB. changes: -----------------------------------------------------
NB. 07dec05 now using (testjod)
NB. 11nov28 updated for J7/Linux
NB. 18may31 updated for J 8.07
NB. 24jul08 revised for j 9.6 (cocreate/coerase) changes

NB.*ERROR=> (jodage) was returning _1 for day intervals. 
NB. date: 16 Oct 2007 09:57:04

cocurrent 'base'
cocurrent jodtestlocale 'AAAjodageSmokeDays00'

testenvironment 'good';'JOD'
NB. -{TEST START}-

er od 'testjod00'

NB. clear any (zeroage) word
1 [ del }. dnl 'zeroage'

NB. insert a word now to make it 0 days old
zeroage=: 3 : 0
a=. y
a * 10
)

er tmploc put 'zeroage'

age=: jodage 'zeroage'

NB. first and last put intervals should be 0
0 = , ;(1;<1;2 4){:: age

NB.*FIX=> rounded yyyymmdd.ff dates to integers before calling (dayage) in (jodage)

NB. -{TEST SUCCESSFUL}-
ereopen 0

cocurrent 'base'
coerase <testlocale_ijod_