;fold left function
;fn can be any reducable operation

(= (foldl $fn $acc ()) $acc)
(= (foldl $fn $acc (:: $x $xs)) (
    foldl $fn ($fn $acc $x) $xs
))

;example for foldl
! (foldl + 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))