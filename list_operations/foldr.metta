fold right function
;fn can be any reducable operation

(= (foldr $fn $acc ()) $acc)
(= (foldr $fn $acc (:: $x $xs)) (
    $fn $x (foldr $fn $acc $xs)
))

;example code for fold right function
! (foldr + 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))