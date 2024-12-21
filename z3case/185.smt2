(set-logic HORN)
(set-option :fp.datalog.all_or_nothing_deltas true)
(set-option :fp.datalog.print.tuples false)
(set-option :fp.spacer.q3.use_qgen true)

(declare-rel II (Int Int))
(declare-rel JJ (Int))
(declare-var c Int)
(declare-var d Int)

(rule (=> (II c d) (JJ (+ d c))))
(rule (=> (JJ c) (II c (div c 3))))
(query II :print-answer true)