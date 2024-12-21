
(set-logic ALL)
(declare-sort Elem 0)
(declare-fun S () (Set Elem))
(declare-fun B () (Bag Elem))
(declare-fun e () Elem)
(assert (set.member e S))

(assert (forall ((x Elem)) (=> (set.member x S) (>= (bag.count x B) 1))))
(check-sat)
(get-model)