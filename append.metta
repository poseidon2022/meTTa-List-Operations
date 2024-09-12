;appending an element to a list. arguments are a list and the element
(= (append () $element) (:: $element ()))
(= (append (:: $x $xs) $element) (
    :: $x (append $xs $element)
))

;example appending an element to a list
! (append (:: 1 (:: 2 (:: 3 ()))) 4)