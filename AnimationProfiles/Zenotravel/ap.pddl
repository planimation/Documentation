(define (animation travel)
   (:predicate city
               :parameters (?x)
               :effect(
               (equal (?x x) 0)
               (assign (?x y) (function distributey (objects ?x) (settings (spacebtwn 5))))
               )
   )
   ;people at city or aircraft at city
   (:predicate at
        :parameters (?p ?c)
        :priority 1
        :effect(
               (assign (?p x) (function distribute_within_objects_horizontal (objects ?p ?c)(settings (spacebtw 20))))
               (assign (?p y) (?c y))

        )
   )
   ;people in aircraft
   (:predicate in
     :parameters (?p ?a)
     :priority 1
     :effect(
        (equal (?a x) 400)
        (equal (?p y) (?a y))
        (assign (?p x) (function distribute_within_objects_horizontal (objects ?p ?a)(settings (spacebtw 0))))
        (equal (?p COLOR) white)
        (assign (?a label) (function calculate_label (objects ?a ?p)))
        )
   )

   (:predicate flevel
        :parameters (?x)
        :effect(
            (equal (?x x) 600)
            (assign (?x y) (function distributey (objects ?x) (settings (spacebtwn 10))))
    )
   )
   (:predicate fuel-level
     :parameters (?a ?f)
     :priority 0
     :effect(
            (equal (?a COLOR) (?f COLOR))
     )
   )



  (:visual city
            :type default
            :properties(
              (prefabImage city)
              (showName TRUE)
              (x NULL)
              (y NULL)
              (color #c4ffc4)
              (width 400)
              (height 96)
              (depth 1)
            )
  )

    (:visual person
            :type predefine
            :objects (%person)
            :properties(
              (prefabImage person)
              (showName FALSE)
              (x NULL)
              (y NULL)
              (color black)
              (width 40)
              (height 40)
              (depth 2)
            )
  )

    (:visual plane
            :type predefine
            :objects (%plane)
            :properties(
              (prefabImage plane)
              (showName FALSE)
              (x NULL)
              (y NULL)
              (color red)
              (width 40)
              (height 40)
              (depth 3)
              (showLabel TRUE)
              (label 0)
            )
  )


    (:visual fuel
            :type predefine
            :objects (%fl)
            :properties(
              (prefabImage city)
              (showName True)
              (x NULL)
              (y 410)
              (color RANDOMCOLOR)
              (width 32)
              (height 32)
              (depth 2)
            )
  )




 (:image
    (city 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)
    (person iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAT1JREFUWEfNlgsOgyAMhtuTbZ5s82RzJ+usAYMifQjiSIwmCP36U9oiOAcRPQGAn0ey9MvfiPh2bgfoWUBEn2BcWjZ6QEwAwWs2bh3TLAiD8FscKgARsawvbaOD+QkRB22dBYC0TYR59ThEgArvU6ZBOgoNoMb7CCEexf8CnIj8YijgfC9Lk8WJlgAAUIyDLgB3K1AVhJbUq6UJMRdot4CLjicFZzCS/EsB0/CNBai0TV0mjLuehFCNmxRIIDxFyWTcBcA/G5UQc//+rNQYCIY5GLkk89sy2igQsqHH8B5OBemRCf2JqHEdYFWKEJkCFxgX+4IjgBZNSClQMyU2AI1aMO2WbK7pHuBK7w+PYgXo5H2EWFVIAXp4n6mwAFwY+WowRgBPodGCzDQf+4TbAGKjGgFatF4mz5OflkD8ARdFnSFwmNa+AAAAAElFTkSuQmCC)
    (plane1 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)
    (plane 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)
    )
)