; recursively sort the tail of the list
; insert the head of the list to the sorted tail
(= (sort ()) ())
(= (sort (:: $x $xs)) 
    (insert $x (sort $xs))
)

(= (insert $x ()) 
    (:: $x ()))

(= (insert $x (:: $y $ys)) 
    (if (< $x $y)
        (:: $x (:: $y $ys)) 
        (:: $y (insert $x $ys)) 
    )
)

;sorting example
! (sort (:: 3 (:: 1 (:: 4 (:: 2 ())))))