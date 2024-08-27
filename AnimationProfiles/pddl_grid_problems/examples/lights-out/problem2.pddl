(define (problem flippuzzle-2)
    (:domain flippuzzle)
    
    (:objects 
        a b 
        ed1 ed2 ed3
        node1-1 node1-2
    )
        
    (:init 
        (tile a) (tile b) 
        (edge ed1) (edge ed2) (edge ed3)
        (position node1-1) (position node1-2)
        (at a node1-1) (at b node1-2)
        (adj a b) (adj a ed1) (adj a ed2) (adj a ed3)
        (adj b a) (adj b ed1) (adj b ed2) (adj b ed3)
    )
    
    (:goal 
        (and 
            (on a)
            (on b)
        )
    )
)