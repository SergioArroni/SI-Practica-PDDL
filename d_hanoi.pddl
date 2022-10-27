(define (domain hanoi_dominio_opcional)
  (:requirements :strips)
  ; 3 predicados, clear, encima, pequeno
  ; clear: comprueba que un objeto x no tenga nada encima
  ; encima: marca si esta o no encima x de y
  ; grande: marca si un objeto x es más grande que y

  (:predicates
    (clear ?x)
    (encima ?x ?y)
    (grande ?x ?y)
  )
  ; solo una accion, mover
  ; implicados disco, de donde es el disco y hacia donde va el disco
  ; precondiciones: que el disco este encima de donde se haya dicho que sea el disco
  ; , que el disco sea mas pequeño que el que este donde se vaya a poner
  ; y que tanto el lugar donde se vaya a poner, como el disco, esten libres (el clear to y el clear disco)
  ; efectos: que el disco no este encima de donde estaba, que el disco este encima de donde se va a poner
  ; el lugar donde se puso ya no esta libre y el lgar donde estaba ahora si esta libre
  ; y el disco esta libre 
  (:action mover
    :parameters (?disco ?from ?to)
    :precondition (and (grande ?to ?disco) (encima ?disco ?from)
      (clear ?disco) (clear ?to))
    :effect (and (clear ?from) (encima ?disco ?to)
      (not (encima ?disco ?from)) (not (clear ?to))
      (clear ?disco))
  )
)