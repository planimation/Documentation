(define (problem template1)
    (:domain template)
    (:objects
        pos1_1 pos2_1 pos3_1 pos1_2 pos2_2 pos3_2 pos1_3 pos2_3 pos3_3 - pos
        ply1 - player
        blk1 - block
        w1 - wall
        but1 - button
    )
    (:init
        (position pos1_1)
        (position pos2_1)
        (position pos3_1)
        (position pos1_2)
        (position pos2_2)
        (position pos3_2)
        (position pos1_3)
        (position pos2_3)
        (position pos3_3)
        
        (right pos1_1 pos2_1)
        (up pos1_1 pos1_2)
        
        (left pos2_1 pos1_1)
        (up pos2_1 pos2_2)
        (right pos2_1 pos3_1)
        
        (left pos3_1 pos2_1)
        (up pos3_1 pos3_2)
        
        (down pos1_2 pos1_1)
        (right pos1_2 pos2_2)
        (up pos1_2 pos1_3)
        
        (left pos2_2 pos1_2)
        (down pos2_2 pos2_1)
        (up pos2_2 pos2_3)
        (right pos2_2 pos3_2)
        
        (left pos3_2 pos2_2)
        (down pos3_2 pos3_1)
        (up pos3_2 pos3_3)
        
        (down pos1_3 pos1_2)
        (right pos1_3 pos2_3)
        
        (left pos2_3 pos1_3)
        (down pos2_3 pos2_2)
        (right pos2_3 pos3_3)
        
        (left pos3_3 pos2_3)
        (down pos3_3 pos3_2)
        
        (at ply1 pos1_1)
        (at blk1 pos2_2)
        (at but1 pos1_3)
        
        (at w1 pos3_1)
    )
    (:goal
        (forall (?but - button) 
            (exists (?blk - block) 
                (exists (?pos - pos)
                    (and 
                        (at ?but ?pos)
                        (at ?blk ?pos)
                    )
                )
            )
        )
    )
)