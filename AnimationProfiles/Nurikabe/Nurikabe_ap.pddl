(define (animation blocksworld)
    (:predicate CONNECTED
        :parameters (?from ?to)
        :effect(
            (assign (?from x y) (function distribute_grid_around_point (objects ?from)))
        )
    )
    
    (:predicate SOURCE
        :parameters (?from ?to)
        :effect(
            (equal (?to x) (?from x))
            (equal (?to y) (?from y))
        )
    )
    
    
    (:predicate robot-pos
        :parameters (?x)
        :custom robot
        :effect(
            (equal (robot x) (?x x))
            (equal (robot y) (?x y))
            
        )
    )
    
    (:predicate painted
               :parameters (?x)
               :effect(
               (equal (?x color) YELLOW)
               )
    )
    
    (:predicate painting
               :parameters (?x)
               :custom robot
               :effect(
               (equal (?x color) YELLOW)
               (equal (robot color) green)
               )
    )
    (:predicate group-painted
               :parameters (?x)
               :effect(
               (equal (?x color) YELLOW)
               )
    )

    (:predicate remaining-cells
        :parameters (?g ?n)
        :effect(
            (assign (?g label) (function display_number (objects ?g ?n)))
        )


    )
    (:visual robot
            :type custom
            :objects robot
            :properties(
              (prefabImage img-robot)
              (showName FALSE)
              (x Null)
              (y Null)
              (color black)
              (width 40)
              (height 40)
              (depth 6)
            )
  )
    
    (:visual pos
            :type default
            :properties(
              (prefabImage img-square)
              (showName FALSE)
              (x Null)
              (y Null)
              (color white)
              (width 80)
              (height 80)
              (depth 3)
          )
  )
  
  (:visual group
            :type predefine
            :objects (%g)
            :properties(
              (prefabImage img-square)
              (showName FALSE)
              (x Null)
              (y Null)
              (color white)
              (width 80)
              (height 80)
              (depth 5)
              (showLabel TRUE)
              (label 0)
          )
  )

    
    (:image  (img-square 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)
    
    (img-robot iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAsdJREFUWEell4FRIzEMRa1KCJ1AJVwqOagEqASuEkIlun3C8miN7DVhZzKbbNbyl770JUtZuFT1bynlrn4WVpRLKeVFRJ6OXpajF1T1bbAxm/h1Ct957r8BcZ7tMQWgqhj6qAZu6/1huz9uoN5F5J5nqvpcSvlTvT536+5F5H0E4ggARjHePAnGLyJioDaKlPsW8mav0gbQs4i8XAsA3qGgeZttGGhq3oZnvwIABQDgjhfwS1T4TVhfAy2AteSr//Nei9JVEajeRhBHORv/BwzeD/k32lYsVt7x8Ka+D7dc8e7e8/xzxnvccwlAD1JVqYwTSReScpcnK461CFQjlNcOuariNc/7C365nG/nPwv3q9OQ7YMHnum+SSwvFNDDvOpU/16rgk7UvnIkPGQjEs6yt374zYf//v0QAZHLbBElPl9iFkVEVV14hl6sgghC1C8xraj7XgDgMho1HP0GpcuuhbG+C2Wzi2REjp0+PEUvvJz3vSIkhnMdOXMjDmDUmCIgk+1Miruo2HtWhqNS6o2EfLkVkdgNseHJPARQ93InzMa1AOiCOwC1ZbfGNWpGvRMOIOZBGyQmEZjlwIyCWPKPDCyjJPRM7XMAoHH4yICQhE8J+F5vTMgAEGW1ZW5mZLUEK9cZeMrcK4x9rQy93cIrKPEyjcAvATggtw0AEyLv26bjhM6HydWpJgOWUAB1d94la+WdjkYyR03TuUaKiagl2yh6KYBa0ysJt8rKcDj5BqDrjiyEGjxpo3aiAQ4knh36tSmIDIArVQtdJ9fDwSN21pBHAPee8m1GzAC0ETsMJDQTPLAzQhy/IwddZ/VhZrp2B6DvCUkmm2Zs3S3rBX6IsQitrh1GAC0IQ4m3UOhJI9CfhlbXZgC89Gzur3MA3lEVhHV43guzxfLaDMDROaDvgjENZn0iPaSMdMAz9ydH8pEmTI/q/wH0tR4ByGFKHAAAAABJRU5ErkJggg==)
 )
    
)