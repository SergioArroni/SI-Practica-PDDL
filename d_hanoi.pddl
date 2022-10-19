(define (domain hanoi)
  (:requirements :strips)
  (:predicates 
  (clear ?x) 
  (encima ?x ?y) 
  (pequeño ?x ?y))

  (:action move
    :parameters (?disco ?from ?to)
    :precondition (and (pequeño ?to ?disco) (encima ?disco ?from) 
		       (clear ?disco) (clear ?to))
    :effect  (and (clear ?from) (encima ?disco ?to) (not (encima ?disco ?from))  
		  (not (clear ?to))))
  )
