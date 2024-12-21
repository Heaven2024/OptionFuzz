(set-logic HORN)
(set-option :fp.datalog.all_or_nothing_deltas false)
(set-option :fp.datalog.check_relation "R")
(set-option :fp.datalog.magic_sets_for_queries false)
(set-option :fp.spacer.propagate true)

(declare-rel S (Int))
(declare-rel T (Int Int))
(declare-var x Int)
(declare-var y Int)

(rule (=> (S x) (T x (* x 3))))
(rule (=> (T x y) (S (- y 2))))
(query T :print-answer true)