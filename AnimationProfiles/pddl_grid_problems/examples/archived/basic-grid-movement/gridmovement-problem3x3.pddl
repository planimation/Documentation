(define (problem template1)
    (:domain grid)
    (:objects
        pos1_1 pos1_2 pos1_3 pos2_1 pos2_2 pos2_3 pos3_1 pos3_2 pos3_3 - pos
        mov_player - movable
        tile_wall_1 tile_wall_2 - wall
    )
    (:init
        
    (at mov_player pos2_1)
    (at tile_wall_1 pos3_1)
    (at tile_wall_2 pos2_2)
    
    
;; make sure these are constants or objects:
;; pos1_1 pos1_2 pos1_3 pos2_1 pos2_2 pos2_3 pos3_1 pos3_2 pos3_3

    (connected pos1_1 pos2_1)
    (connected pos1_1 pos1_2)
    (connected pos1_2 pos2_2)
    (connected pos1_2 pos1_3)
    (connected pos1_2 pos1_1)
    (connected pos1_3 pos2_3)
    (connected pos1_3 pos1_2)
    (connected pos2_1 pos3_1)
    (connected pos2_1 pos2_2)
    (connected pos2_1 pos1_1)
    (connected pos2_2 pos3_2)
    (connected pos2_2 pos2_3)
    (connected pos2_2 pos1_2)
    (connected pos2_2 pos2_1)
    (connected pos2_3 pos3_3)
    (connected pos2_3 pos1_3)
    (connected pos2_3 pos2_2)
    (connected pos3_1 pos3_2)
    (connected pos3_1 pos2_1)
    (connected pos3_2 pos3_3)
    (connected pos3_2 pos2_2)
    (connected pos3_2 pos3_1)
    (connected pos3_3 pos2_3)
    (connected pos3_3 pos3_2)
    

    )
    (:goal
        (at mov_player pos3_2)
    )
)