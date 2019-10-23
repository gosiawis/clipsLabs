(defrule reg1
    (ojciec ?x ?y)
    =>
    (assert (bezp_przodek ?x ?y))
)

(defrule reg2
    (and (przodek ?x ?y)
    (bezp_przodek ?y ?z))
    =>
    (assert (przodek ?x ?z))
)

(defrule reg3
    (przodek ?x ?y)
    =>
    (assert (spokrewniony ?y ?x))
)

(defrule reg4
    (or (brat ?x ?y)
    (siostra ?x ?y))
    =>
    (assert (spokrewniony ?y ?x))
)

(defrule reg5
    (and (spokrewniony ?y ?x)
    (or (brat ?z ?y)
    (siostra ?z ?y)))
    =>
    (assert (spokrewniony ?x ?z))
)

