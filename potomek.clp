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
)

(defrule reg2 "corka"
    (and (k ?y)
    (or (ojciec ?x ?y)
    (matka ?x ?y)))
    =>
    (assert (corka ?y ?x))
)

(defrule reg5 "wnuczka"
    (and (k ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?z ?y)
    (ojciec ?z ?y)))
    =>
    (assert (wnuczka ?x ?z))
)

(defrule reg6 "wnuczek"
    (and (m ?x)
    (or (matka ?y ?x)
    (ojciec ?y ?x))
    (or (matka ?z ?y)
    (ojciec ?z ?y)))
    =>
    (assert (wnuczek ?x ?z))
)

(defrule reg10 "potomek"
    (or 
        (corka ?x ?y)
        (syn ?x ?y)
        (wnuczek ?x ?y)
        (wnuczka ?x ?y)
        (and
            (or
                (wnuczek ?x ?z)
                (wnuczka ?x ?z)
            )
            (or
                (syn ?z ?y)
                (corka ?z ?y)
            )
        )
    )
    =>
    (assert (potomek ?x ?y))
    (printout t ?x " jest potomkiem " ?y crlf)
)