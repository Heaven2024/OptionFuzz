(set-logic HORN)
(set-option :fp.datalog.output_profile true)
(set-option :fp.spacer.mbqi false)
(set-option :fp.spacer.native_mbp false)
(set-option :fp.spacer.order_children 2)

(declare-rel M (Int Int))
(declare-rel N (Int))
(declare-var e Int)
(declare-var f Int)

(rule (=> (M e f) (N (mod e 3))))
(rule (=> (N e) (M e (+ e 2))))
(query M :print-answer true)