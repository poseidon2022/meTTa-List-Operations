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

;removing duplicate
;for this, we can utilize two functions

( = (contains () $target) false)
( = (contains (:: $x $xs) $target) (
    if (== $x $target) true
    (contains $xs $target)
))

;if the list in the current recursive call contains the specified
;element, we will not include the element in the list build up process
;else we shalll continue

(= (remove_duplicates ()) ())
(= (remove_duplicates (:: $x $xs)) (
    if (== (contains $xs $x) true) (remove_duplicates $xs)
    (:: $x (remove_duplicates $xs))
))

! (remove_duplicates (:: 1 (:: 2 (:: 2 (:: 3 (:: 1 (:: 4 ())))))))

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

;now let us implement a filter function
;to filter all the even elements from a list
;we should have a helper function for this case too. to check if a number is even or odd

(= (is_even $x) (== (% $x 2) 0))
;for the filter function we have a list and we have a predicate
;the predicate for this case is is_even

(= (filter () $predicate) ())
(= (filter (:: $x $xs) $predicate) (
    if ($predicate $x) (:: $x (filter $xs $predicate))
    (filter $xs $predicate)
))

;example for filter functionality
! (filter (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 (:: 6 ())))))) is_even)

;fold left function
;fn can be any reducable operation

(= (foldl $fn $acc ()) $acc)
(= (foldl $fn $acc (:: $x $xs)) (
    foldl $fn ($fn $acc $x) $xs
))

;example for foldl
! (foldl + 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))

fold right function
;fn can be any reducable operation

(= (foldr $fn $acc ()) $acc)
(= (foldr $fn $acc (:: $x $xs)) (
    $fn $x (foldr $fn $acc $xs)
))

;example code for fold right function
! (foldr + 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))

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