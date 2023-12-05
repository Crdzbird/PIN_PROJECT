;Header and description

(define (domain elevators)

;remove requirements that are not needed
(:requirements :strips :typing :equality :numeric-fluents)

(:types 
    passenger
    elevator
)

(:predicates
    ; Oposite states to avoid negative preconditions
    (inside ?p - passenger ?e - elevator); passenger is inside elevator
    (outside ?p - passenger ?e - elevator); passenger is outside elevator
)


(:functions
    (passenger_at ?p - passenger); passenger is at floor
    (elevator_at ?e - elevator); elevator is at floor
    ;(valid_floor ?e - elevator) ; floor is valid for elevator
    (max_floor ?e - elevator); maximum floor
    (min_floor ?e - elevator); minimum floor
    (remaining_seats ?e - elevator); remaining seats in elevator
    
)

;define actions here
(:action get_in
    :parameters ( ?p - passenger ?e - elevator )
    :precondition (and
        (= (passenger_at ?p) (elevator_at ?e))
        (outside ?p ?e)
        (>= (remaining_seats ?e) 1)
    )
    :effect (and 
        (not (outside ?p ?e))
        (inside ?p ?e)
        (decrease (remaining_seats ?e) 1)
    )
)

(:action get_out
    :parameters (?p - passenger ?e - elevator)
    :precondition (and 
        (inside ?p ?e)
    )
    :effect (and
        (not (inside ?p ?e))
        (outside ?p ?e)
        (increase (remaining_seats ?e) 1)
        (assign (passenger_at ?p) (elevator_at ?e))
    )
)

(:action go_up
    :parameters (?e - elevator)
    :precondition (and 
        (< (elevator_at ?e) (max_floor ?e))
    )
    :effect (and 
        (increase (elevator_at ?e) 1)
    )
)

(:action go_down
    :parameters (?e - elevator)
    :precondition (and
        (> (elevator_at ?e) (min_floor ?e))
    )
    :effect (and 
        (decrease (elevator_at ?e) 1)
    )
)


)