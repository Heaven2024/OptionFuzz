(set-logic HORN)
(set-option :fp.datalog.default_relation pentagon)
(set-option :fp.spacer.use_derivations true)
(set-option :fp.spacer.reach_dnf false)

(declare-rel CC (Int))
(declare-rel DD (Int Int))
(declare-var x Int)
(declare-var y Int)

(rule (=> (CC x) (DD x (+ x 2))))
(rule (=> (and (DD x y) (< y 7)) (CC y)))
(query DD :print-answer true)