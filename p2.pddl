(define (problem p02)
    (:domain blocksword) 
    
    (:objects a b c d e)
    (:init (encima_mesa e) (encima_bloque d e) (encima_bloque c d) (encima_bloque b c) (encima_bloque a b) (sin_nada_encima a)  (brazo_libre))
    (:goal (and (encima_mesa a) (encima_bloque b a) (encima_bloque c b) (encima_bloque d c) (encima_bloque e d) (sin_nada_encima e) (brazo_libre)))
)