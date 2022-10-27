  (define (problem hanoi_problema_opcional)
  (:domain hanoi_dominio_opcional)
  ; Tengo 4 discos y 3 palos
  (:objects disco1 disco2 disco3 disco4 palo1 palo2 palo3)

  ; En el init hago lo siguiente.
  ; Primero defino el orden de tamaño de los discos, aqui me hubiera gustado simplemte
  ; poner (grande disco2 disco1) (grande disco3 disco2) (grande disco4 disco3) ya que si es 
  ; disco4 más grande que disco3 entonces es más grande que disco2, pero no se puede hacer eso.
  ; Entonces tuve que hacerlo uno por uno despues de varios intentos infructuosos.
  ; Lo mismo pasa con los palos tengo que decir que son más grande que todos los discos.
  ; Por lo que para cada palo tengo que poner que es más grande que cada disco.
  ; Esto no es sostenible para N muy grandes, lo se. 
  ; Igual deberia de modificar el dominio para que no sea necesario poner esto, pero eso no se hacerlo.
  ; Esta solucion la comento Fran en clase, la de hacer que cada palo sea más grande que los discos (creo recordar).
  ; Luego limpio palo 2 y palo 3 ya que en un inicio no los voy a usar y limpio disco1 ya que estara en la cima.
  ; Luego ya voy al estado inicial, donde disco4 esta en el palo, y los otro discos ordenados encima de disco4

  (
    :init 
   (grande disco2 disco1) (grande disco3 disco1) (grande disco3 disco2) (grande disco4 disco1)
   (grande disco4 disco2) (grande disco4 disco3)
   (grande palo1 disco1) (grande palo1 disco2) (grande palo1 disco3) (grande palo1 disco4)
   (grande palo2 disco1) (grande palo2 disco2) (grande palo2 disco3) (grande palo2 disco4)
   (grande palo3 disco1) (grande palo3 disco2) (grande palo3 disco3) (grande palo3 disco4)
   (clear palo2) (clear palo3)
   (clear disco1)
   (encima disco4 palo1) (encima disco3 disco4) (encima disco2 disco3) (encima disco1 disco2)
   )

  ; Aqui compruebo (como en los problemas de clase) que disco4 esta en el palo3
  ; que es la tercera plataforma vease nuetro estado objetivo
  ; luego en orden tienen que estar disco3, disco2 y disco1
  ; cada uno encima del disco anterior en riguroso orden
  ; Del dominio uso el predicado encima para saber si esta o no encima de donde quiero que este

    (:goal (and (encima disco4 palo3) (encima disco3 disco4) (encima disco2 disco3) (encima disco1 disco2)))
  )