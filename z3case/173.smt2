(set-logic HORN)
(set-option :fp.datalog.default_table_hashtable true)
(set-option :fp.spacer.gpdr true)
(set-option :fp.spacer.global true)

(declare-rel K (Int))
(declare-rel L (Int Int))
(declare-var c Int)
(declare-var d Int)

(rule (=> (K c) (L c (+ c c))))
(rule (=> (and (L c d) (< d 5)) (K (+ d 2))))
(query L :print-answer true)