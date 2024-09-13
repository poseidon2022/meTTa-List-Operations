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