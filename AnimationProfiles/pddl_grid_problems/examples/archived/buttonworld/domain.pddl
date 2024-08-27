(define (domain buttonworld)
    (:requirements :strips)
    (:predicates (button ?b)
                 (pushed ?b))
    (:action push
        :parameters (?b)
        :precondition (and (button ?b) (not (pushed ?b)))
        :effect (pushed ?b)))