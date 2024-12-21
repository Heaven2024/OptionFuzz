(set-logic HORN)
(set-option :fp.datalog.compile_with_widening false)
(set-option :fp.spacer.keep_proxy false)
(set-option :fp.spacer.p3.share_invariants true)
(set-option :fp.xform.inline_linear_branch true)

(declare-rel Q (Int))
(declare-rel R (Int Int))
(declare-var i Int)
(declare-var j Int)

(rule (=> (R i j) (Q (+ i j))))
(rule (=> (Q i) (R i (div i 2))))
(query Q :print-answer true)