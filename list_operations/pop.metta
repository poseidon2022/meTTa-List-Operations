;popping from a list
(= (pop (:: $x $xs))
    $xs
)

;popping from a list example
! (pop (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ()))))))