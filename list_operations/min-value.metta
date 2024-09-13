;min value from a list
(= (min ()) plus_infinity)
(= (min (:: $x $xs))
    (let $min_rest (min $xs)
        (if (== $min_rest plus_infinity)
            $x
            (if (< $x $min_rest)
                $x
                $min_rest
            )
        )
    )
)

;example to find min_value
! (min (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ())))))) 