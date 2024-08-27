(define (domain gridworld)

  (:requirements :strips
    			 :typing)

  (:types pos entity - object
    	  player goal - entity)

  (:predicates 
  	(nth ?x - pos ?y - pos)
	(sth ?x - pos ?y - pos)
	(est ?x - pos ?y - pos)
	(wst ?x - pos ?y - pos)
	(adj ?x - pos ?y - pos)

	(at ?x - pos ?e - entity))

  (:derived (adj ?x - pos ?y - pos) 
  			(or (nth ?x ?y)
				(sth ?x ?y)
				(est ?x ?y)
				(wst ?x ?y)))

  (:action move
    :parameters (?p - player ?x - pos)
    :precondition (exists (?x1 - pos) (and (at ?p ?x1) (adj ?x ?x1)))
    :effect (and (at ?p ?x) (not (at ?p ?x1)))))