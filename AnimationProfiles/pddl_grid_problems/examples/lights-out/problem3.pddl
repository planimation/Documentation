(define (problem flippuzzle-2)
    (:domain flippuzzle)
    
    (:objects 
        a b c
        ed1 ed2 ed3
        node1-1 node1-2 node1-3
    )
        
    (:init 
        (tile a) (tile b) (tile c)
        (edge ed1) (edge ed2) (edge ed3)
        (position node1-1) (position node1-2) (position node1-3)
        (at a node1-1) (at b node1-2) (at c node1-3)
        (adj a b) (adj a ed1) (adj a ed2) (adj a ed3)
        (adj b a) (adj b c) (adj b ed1) (adj b ed2)
        (adj c b) (adj c ed1) (adj c ed2) (adj c ed3)
        
        (on a) (on c)
    )
    
    (:goal 
        (and 
            (not(on a))
            (not(on b))
            (not(on c))
        )
    )
)