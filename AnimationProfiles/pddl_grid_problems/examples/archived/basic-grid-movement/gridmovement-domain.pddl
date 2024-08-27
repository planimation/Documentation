(define (domain grid)

    (:requirements
        :strips
        :typing
    )

    (:types
        entity pos - object
        movable tile - entity
        wall - tile
    )

    (:predicates
        (connected ?p1 - pos ?p2 - pos)
        (at ?x - entity ?p - pos)
    )

    (:action move
        :parameters (?x - movable ?from - pos ?to - pos)
        :precondition (
            and 
                (at ?x ?from) 
                (connected ?from ?to)
                (not (exists (?w - wall) (at ?w ?to)))
        )
        :effect (and (at ?x ?to) (not (at ?x ?from)))
    )
)