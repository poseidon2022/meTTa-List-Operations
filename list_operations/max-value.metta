;max value from a list
(= (max ()) minus_infinity)
(= (max (:: $x $xs))
    (let $max_rest (max $xs)
        (if (== $max_rest minus_infinity)
            $x
            (if (> $x $max_rest)
                $x
                $max_rest
            )
        )
    )
)

;example to find max_value
! (max (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ())))))) 