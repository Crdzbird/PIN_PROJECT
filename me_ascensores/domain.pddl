(define (domain elevators)
(:requirements :strips :typing :equality)

(:types 
    passenger
    elevator
    floor
    seat
)

(:predicates
    ; passenger
    (passenger_at ?p - passenger ?f - floor); passenger is at floor
    (inside ?p - passenger ?e - elevator); passenger is inside elevator

    ; elevator
    (elevator_at ?e - elevator ?f - floor); elevator is at floor
    (remaining_seats ?e - elevator ?s - seat); remaining seats in elevator
    (available_floor ?e - elevator ?f - floor); floor is available for elevator

    ; seat
    (add_seat ?s - seat ?ns - seat); add seat to elevator
    (remove_seat ?s - seat ?ns - seat); remove seat from elevator
)


(:action in
    :parameters ( ?p - passenger ?e - elevator ?s - seat ?ns - seat ?f - floor)
    :precondition (and
        (remaining_seats ?e ?s) ; There is a seat available that can be removed
        (remove_seat ?s ?ns)
        (elevator_at ?e ?f) ; Passenger is at the same floor as the elevator
        (passenger_at ?p ?f)
    )
    :effect (and 
        (inside ?p ?e) ; Passenger is now inside
        (not (passenger_at ?p ?f)) ; Passenger is no longer at the floor
        (remaining_seats ?e ?ns) ; There is one less seat available
    )
)

(:action out
    :parameters (?p - passenger ?e - elevator ?s - seat ?ns - seat ?f - floor)
    :precondition (and 
        (inside ?p ?e) ; Passenger is inside elevator
        (add_seat ?s ?ns) ; There is a seat available that can be added
        (elevator_at ?e ?f)
    )
    :effect (and
        (not (inside ?p ?e)) ; Passenger is no longer inside
        (passenger_at ?p ?f) ; Passenger is now at the floor
        (remaining_seats ?e ?ns) ; There is one more seat available
    )
)

(:action goto
    :parameters (?e - elevator ?f - floor ?nf - floor)
    :precondition (and 
        (elevator_at ?e ?f) ; Elevator is at floor
        (available_floor ?e ?nf) ; Next floor exists
    )
    :effect (and 
        ( not (elevator_at ?e ?f))
        (elevator_at ?e ?nf) ; Elevator is now at next floor
    )
)

)