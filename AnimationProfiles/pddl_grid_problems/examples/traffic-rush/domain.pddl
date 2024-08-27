;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Traffic Rush
;;; Traffic Rush game playing domain
;;;
;;; Authored by "Team 103", Unimelb 2023 Sem 2
;;;
;;; Description:
;;; Traffic Rush, or "Rush Hour" as the actually sold game is known, is a grid 
;;; based puzzle game in which there exists a set of objects of varying tile
;;; length, called cars, which can only be moved around along one axis of the 2D
;;; grid. The aim of the game is to move the cars around to allow one key car to
;;; reach a goal position. 
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain template)
    (:requirements :strips :typing)
    (:types 
        pos tile - object
    )
    (:predicates
        (position ?p - pos)
        
        (up ?p1 - pos ?p2 - pos)
        (down ?p1 - pos ?p2 - pos)
        (left ?p1 - pos ?p2 - pos)
        (right ?p1 - pos ?p2 - pos)
        
        (at ?t - tile ?p - pos)
        
        (group-2 ?t1 - tile ?t2 - tile)
        (group-3 ?t1 - tile ?t2 - tile ?t3 - tile)
    )
    (:action move_2
        :parameters (
            ?t1 - tile ?t1-from - pos ?t1-to - pos
            ?t2 - tile ?t2-from - pos ?t2-to - pos
        )
        :precondition (and
            (group-2 ?t1 ?t2)
            (at ?t1 ?t1-from)
            (at ?t2 ?t2-from)
            (or
                (and (up ?t1-from ?t1-to) (up ?t2-from ?t2-to))
                (and (down ?t1-from ?t1-to) (down ?t2-from ?t2-to))
                (and (left ?t1-from ?t1-to) (left ?t2-from ?t2-to))
                (and (right ?t1-from ?t1-to) (right ?t2-from ?t2-to))
            )
        )
        :effect (and
            (at ?t1 ?t1-to) (not (at ?t1 ?t1-from))
            (at ?t2 ?t2-to) (not (at ?t2 ?t2-from))
        )
    )
)