;membership check of a list, takes a list and an element as an argument
(= (member () $target) false)
(= (member (:: $x $xs) $target) (
    if (== $x $target) true
    (member $xs $target)
))

;example for membership check
! (member (:: 1 (:: 2 (:: 3 ()))) 4) ;returns a boolean if the provided number is
;part of the list or false other wise