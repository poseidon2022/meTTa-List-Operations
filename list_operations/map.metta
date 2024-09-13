;a mapper function
;this as we all know should have some helper function or mapping condition
;and mapper main function
;as a demonstration we will do a square mapper
(= (square $x) (* $x $x))

(= (map $f ()) ())
(= (map $f (:: $x $xs))
   (:: ($f $x) (map $f $xs)))

;mapper example
! (map square (:: 1 (:: 2 (:: 3 ()))))