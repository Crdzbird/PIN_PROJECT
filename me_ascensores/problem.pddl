(define (problem simplified) (:domain elevators)
(:objects 
    E0 E1 E2 E3 E4 - elevator
    P0 P1 P2 P3 P4 - passenger
    F0 F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 - floor
    S0 S1 S2 S3 - seat
)

(:init
    ; passenger 
    (passenger_at P0 F2)
    (passenger_at P1 F4)
    (passenger_at P2 F1)
    (passenger_at P3 F8)
    (passenger_at P4 F1)

    ; elevator
    (elevator_at E0 F0)
    (remaining_seats E0 S2)
    (available_floor E0 F0)
    (available_floor E0 F1)
    (available_floor E0 F2)
    (available_floor E0 F3)
    (available_floor E0 F4)

    (elevator_at E1 F4)
    (remaining_seats E1 S2)
    (available_floor E1 F4)
    (available_floor E1 F5)
    (available_floor E1 F6)
    (available_floor E1 F7)
    (available_floor E1 F8)

    (elevator_at E2 F4)
    (remaining_seats E2 S2)
    (available_floor E2 F4)
    (available_floor E2 F5)
    (available_floor E2 F6)
    (available_floor E2 F7)
    (available_floor E2 F8)

    (elevator_at E3 F8)
    (remaining_seats E3 S2)
    (available_floor E3 F8)
    (available_floor E3 F9)
    (available_floor E3 F10)
    (available_floor E3 F11)
    (available_floor E3 F12)

    (elevator_at E4 F0)
    (remaining_seats E4 S3)
    (available_floor E4 F0)
    (available_floor E4 F2)
    (available_floor E4 F4)
    (available_floor E4 F6)
    (available_floor E4 F8)
    (available_floor E4 F10)
    (available_floor E4 F12)

    ; seat
    (add_seat S0 S1)
    (add_seat S1 S2)
    (add_seat S2 S3)
    (remove_seat S3 S2)
    (remove_seat S2 S1)
    (remove_seat S1 S0)
)

(:goal (and
    (passenger_at P0 F3)
    (passenger_at P1 F11)
    (passenger_at P2 F12)
    (passenger_at P3 F1)
    (passenger_at P4 F9)
))

)
