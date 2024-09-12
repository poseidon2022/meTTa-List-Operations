(= (reverse ()) ())
(= (reverse (:: $x $xs))
    (append (reverse $xs) (:: $x ()))
)

; Helper function to append element to a list
(= (append () $ys) $ys)
(= (append (:: $x $xs) $ys)
    (:: $x (append $xs $ys))
)

;an example for reversal
! (reverse (:: 1 (:: 2 (:: 3 (:: 4 ())))))