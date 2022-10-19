(define (domain blocksword) 
(:predicates 
    (sin_nada_encima ?x) 
    (encima_mesa ?x) 
    (encima_bloque ?x ?y)
)
;; ob esta en la mesa y se pone encima de underob
(:action apilarDesdeMesa 
    :parameters (?ob ?underob) 
    :precondition (and (sin_nada_encima ?ob) (sin_nada_encima ?underob) (encima_mesa ?ob))
    :effect (and (encima_bloque ?ob ?underob) (not (sin_nada_encima ?underob)) (not (encima_mesa ?ob)))
)
;; ob esta encima de underob_i y se pone encima de underob_o
(:action apilarDesdeBloque
    :parameters (?ob ?underob_i ?underob_o)
    :precondition (and (sin_nada_encima ?ob) (encima_bloque ?ob ?underob_i))
    :effect (and (encima_bloque ?ob ?underob_o) (not (sin_nada_encima ?underob_o)) (not (encima_bloque ?ob ?underob_i)) (sin_nada_encima ?underob_i))
)
;; ob esta encima de underob y se pone ob en la mesa
(:action desapilarEnMesa
    :parameters (?ob ?underob)
    :precondition (and (encima_bloque ?ob ?underob) (sin_nada_encima ?ob))
    :effect (and (sin_nada_encima ?underob) (not (encima_bloque ?ob ?underob)) (encima_mesa ?ob))
))