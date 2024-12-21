(set-logic HORN)
(set-option :fp.datalog.explanations_on_relation_level true)
(set-option :fp.spacer.expand_bnd true)
(set-option :fp.spacer.iuc.split_farkas_literals true)

(declare-rel W (Int))
(declare-rel X (Int Int))
(declare-var m Int)
(declare-var n Int)

(rule (=> (W m) (X m (mod m 3))))
(rule (=> (X m n) (W n)))
(query X :print-answer true)