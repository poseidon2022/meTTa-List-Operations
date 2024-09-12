;removing the first occurence of a specified element from a list
(= (remove () $target) ())
(= (remove (:: $x $xs) $target) (
    if (== $x $target) (remove $xs $target)
    (:: $x (remove $xs $target))
))

;removing an element example
! (remove (:: 1 (:: 2 (:: 3 ()))) 2)