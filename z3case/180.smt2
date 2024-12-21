(set-logic HORN)
(set-option :fp.datalog.dbg_fpr_nonempty_relation_signature true)
(set-option :fp.spacer.push_pob true)
(set-option :fp.spacer.q3.instantiate true)

(declare-rel Y (Int Int))
(declare-rel Z (Int))
(declare-var c Int)
(declare-var d Int)

(rule (=> (Y c d) (Z (mod d 2))))
(rule (=> (Z c) (Y c (+ c 3))))
(query Y :print-answer true)