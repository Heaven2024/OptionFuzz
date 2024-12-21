(set-logic HORN)
(set-option :fp.datalog.use_map_names false)
(set-option :fp.spacer.weak_abs false)
(set-option :fp.spacer.iuc.arith 0)

(declare-rel MM (Int))
(declare-rel NN (Int Int))
(declare-var x Int)
(declare-var y Int)

(rule (=> (MM x) (NN x (+ x 5))))
(rule (=> (NN x y) (MM (* y 2))))
(query NN :print-answer true)