; length of a list and an example
(= (length ()) 0)
(= (length (:: $x $xs)) (+ 1 (length $xs)))

;example
! (length (:: A (:: B (:: C ()))))