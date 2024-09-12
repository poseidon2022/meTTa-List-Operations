; length of a list and an example
(= (length ()) 0)
(= (length (:: $x $xs)) (+ 1 (length $xs)))

;example
! (length (:: A (:: B (:: C ()))))


;membership check of a list, takes a list and an element as an argument
(= (member () $target) false)
(= (member (:: $x $xs) $target) (
    if (== $x $target) true
    (member $xs $target)
))

;example for membership check
! (member (:: 1 (:: 2 (:: 3 ()))) 4) ;returns a boolean if the provided number is
;part of the list or false other wise

;appending an element to a list. arguments are a list and the element
(= (append () $element) (:: $element ()))
(= (append (:: $x $xs) $element) (
    :: $x (append $xs $element)
))

;example appending an element to a list
! (append (:: 1 (:: 2 (:: 3 ()))) 4)

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


;popping from a list
(= (pop (:: $x $xs))
    $xs
)

;popping from a list example
! (pop (:: 3 (:: 5 (:: 2 (:: 8 (:: 1 ()))))))


;removing the first occurence of a specified element from a list
(= (remove () $target) ())
(= (remove (:: $x $xs) $target) (
    if (== $x $target) (remove $xs $target)
    (:: $x (remove $xs $target))
))

;removing an element example
! (remove (:: 1 (:: 2 (:: 3 ()))) 2)