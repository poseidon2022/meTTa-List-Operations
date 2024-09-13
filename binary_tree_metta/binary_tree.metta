;binary tree node structure
(= (node $value $left $right)
    (:: $value $left $right)
)

;apart from this ds, let us also simulate the usage
;by constructing and implementing the inorder (sorted) traversal
;function for a binary search tree

;create a new node
(= (insert () $new_value)
    (node $new_value () ())
)

;insert a value into the binary search tree
(= (insert (node $value () ()) $new_value)
    (if (< $new_value $value)
        (node $value (insert $left $new_value) $right)
        (node $value $left (insert $right $new_value))
    )
)

;in-order traversal of the binary tree
(= (in_order (node $value $left $right))
    (concat (in_order $left) (:: $value (in_order $right)))
)

;example nodes and the tree
;create an empty tree and insert elements
(= $tree (insert () 5))
(= $tree (insert $tree 3))
(= $tree (insert $tree 7))
(= $tree (insert $tree 2))
(= $tree (insert $tree 4))

;perform in-order traversal
! (in_order $tree)



