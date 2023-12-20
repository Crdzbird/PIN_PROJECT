(define (problem simplified) (:domain elevators)
(:objects 
    E0 E1 - elevator
    P0 P1 - passenger
    F0 F1 F2 - floor
    S0 S1 S2 - seat
)

(:init
    ; passenger 
    (passenger_at P0 F0)
    (passenger_at P1 F0)

    ; elevator
    (elevator_at E0 F0)
    (remaining_seats E0 S1)
    (available_floor E0 F0)
    (available_floor E0 F1)

    (elevator_at E1 F0)
    (remaining_seats E1 S2)
    (available_floor E1 F0)
    (available_floor E1 F2)

    ; seat
    (add_seat S0 S1)
    (add_seat S1 S2)
    (remove_seat S2 S1)
    (remove_seat S1 S0)
)

(:goal (and
    (passenger_at P0 F2)
    (passenger_at P1 F1)
))

)
