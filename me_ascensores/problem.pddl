(define (problem simplified) (:domain elevators)
(:objects 
    E0 E1 - elevator
    P0 P1 - passenger
    F0 F1 F2 F3 - floor
    S0 S1 S2 - seat
)

(:init
    ; passenger 
    (passenger_at P0 F2)
    (outside P0)
    (passenger_at P1 F0)
    (outside P1)

    ; elevator
    (elevator_at E0 F0)
    (remaining_seats E0 S2)
    (available_floor E0 F0)
    (available_floor E0 F1)
    (available_floor E0 F2)

    (elevator_at E1 F2)
    (remaining_seats E1 S1)
    (available_floor E1 F2)
    (available_floor E1 F3)

    ; floor
    (move_up F0 F1)
    (move_up F1 F2)
    (move_up F2 F3)
    (move_down F1 F0)
    (move_down F2 F1)
    (move_down F3 F2)

    ; seat
    (add_seat S0 S1)
    (add_seat S1 S2)
    (remove_seat S2 S1)
    (remove_seat S1 S0)
)

(:goal (and
    (passenger_at P0 F0)
    (passenger_at P1 F3)

    ; Move up test
    ; (elevator_at E0 F3)

    ; Move down test
    ; (elevator_at E1 F0)

    ; Enter test
    ; (inside P1 E0)
))

)
