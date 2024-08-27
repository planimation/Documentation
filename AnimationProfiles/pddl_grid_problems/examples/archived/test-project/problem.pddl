(define (problem gridprob1)
	
  (:domain gridworld)

  (:objects
    p0-0 p1-0 p1-1 p2-1 - pos
    pl - player
    gl - goal)

  (:init
    (est p0-0 p1-0)
    (sth p1-0 p1-1)
    (est p1-1 p2-1)

    (at p0-0 pl)
    (at p2-1 gl)) 

  (:goal
  	(exists (?x - pos) (and (at ?x pl) (at ?x gl)))))