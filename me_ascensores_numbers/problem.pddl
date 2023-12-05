(define (problem simplified) (:domain elevators)
(:objects 
    E0 E1 - elevator
    P0 P1 - passenger
)

(:init
    ; P0
    (=(passenger_at P0) 2)
    (outside P0 E0)
    (outside P0 E1)

    ; P1
    (=(passenger_at P1) 0)
    (outside P1 E0)
    (outside P1 E1)

    ; E0
    (=(elevator_at E0) 0)
    (=(remaining_seats E0) 2)
    (=(max_floor E0) 1)
    (=(min_floor E0) 0)

    ; E1
    (=(elevator_at E1) 0)
    (=(remaining_seats E1) 1)
    (=(max_floor E1) 3)
    (=(min_floor E1) 2)
)

(:goal (and
    (=(passenger_at P0) 0)
    (=(passenger_at P1) 3)
))

)
