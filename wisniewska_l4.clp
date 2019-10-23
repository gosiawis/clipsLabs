(deffacts startup
    (m Tomek)
    (m Adam)
    (m Darek)
    (m Bartek)
    (m Robert)
    (m Jacek)
    (m Julek)
    (m Pawel)
    (m Adrian)
    (k Kasia)
    (k Basia)
    (k Zosia)
    (k Justyna)
    (k Ala)
    (k Ola)
    (k Ada)
    (k Ewa)
    (k Ela)
    (ojciec Jacek Ala)
    (ojciec Julek Bartek)
    (ojciec Pawel Justyna)
    (ojciec Adrian Robert)
    (ojciec Bartek Kasia)
    (ojciec Robert Tomek)
    (ojciec Tomek Adam)
    (ojciec Tomek Darek)
    (ojciec Tomek Basia)
    (ojciec Tomek Zosia)
    (matka Ola Ala)
    (matka Ada Bartek)
    (matka Ewa Justyna)
    (matka Ela Robert)
    (matka Justyna Tomek)
    (matka Ala Kasia)
    (matka Kasia Adam)
    (matka Kasia Darek)
    (matka Kasia Basia)
    (matka Kasia Zosia)
)

(defrule reg1 "syn"
    (and (m ?y)
    (or (ojciec ?x ?y)
    (matka ?x ?y)))
    =>
    (assert (syn ?y ?x))
    (printout t ?y " jest synem " ?x crlf)
)

(defrule reg2 "corka"
    (and (k ?y)
    (or (ojciec ?x ?y)
    (matka ?x ?y)))
    =>
    (assert (corka ?y ?x))
    (printout t ?y " jest corka " ?x crlf)
)

(defrule reg3 "dziadek"
    (and (m ?x)
    (ojciec ?x ?y)
    (or (ojciec ?y ?z)
    (matka ?y ?z)))
    =>
    (assert (dziadek ?x ?z))
    (printout t ?x " jest dziadkiem " ?z crlf)
)

(defrule reg4 "babcia"
    (and (k ?x)
    (matka ?x ?y)
    (or (ojciec ?y ?z)
    (matka ?y ?z)))
    =>
    (assert (babcia ?x ?z))
    (printout t ?x " jest babcia " ?z crlf)
)

(defrule reg5 "wnuczka"
    (and (k ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?z ?y)
    (ojciec ?z ?y)))
    =>
    (assert (wnuczka ?x ?z))
    (printout t ?x " jest wnuczka " ?z crlf)
)

(defrule reg6 "wnuczek"
    (and (m ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?z ?y)
    (ojciec ?z ?y)))
    =>
    (assert (wnuczek ?x ?z))
    (printout t ?x " jest wnuczkiem " ?z crlf)
)

(defrule reg7 "brat"
    (and (m ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?y ?z)
    (ojciec ?y ?z))
    (test (neq ?x ?z)))
    =>
    (assert (brat ?x ?z))
    (printout t ?x " jest bratem " ?z crlf)
)

(defrule reg8 "siostra"
    (and (k ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?y ?z)
    (ojciec ?y ?z))
    (test (neq ?x ?z)))
    =>
    (assert (siostra ?x ?z))
    (printout t ?x " jest siostra " ?z crlf)
)

(defrule reg9 "przodek"
    (or 
        (or
            (matka ?x ?y)
            (ojciec ?x ?y)
            (dziadek ?x ?y)
            (babcia ?x ?y)
            (corka ?y ?x)
            (syn ?y ?x)
            (wnuk ?y ?x)
            (wnuczka ?y ?x)
        )
        (and
            (przodek ?x ?z)
            (przodek ?z ?y)
        )
    )
    (not (przodek ?x ?y))
    =>
    (assert (przodek ?x ?y))
    (printout t ?x " jest przodkiem " ?y crlf)
)

(defrule reg10 "potomek"
    (or 
        (or
            (matka ?x ?y)
            (ojciec ?x ?y)
            (dziadek ?x ?y)
            (babcia ?x ?y)
            (corka ?y ?x)
            (syn ?y ?x)
            (wnuk ?y ?x)
            (wnuczka ?y ?x)
        )
        (and
            (potomek ?x ?z)
            (potomek ?z ?y)
        )
    )
    (not (potomek ?x ?y))
    =>
    (assert (potomek ?x ?y))
    (printout t ?x " jest potomkiem " ?y crlf)
)