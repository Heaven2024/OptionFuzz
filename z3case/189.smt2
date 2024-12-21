(set-logic HORN)
(set-option :fp.datalog.profile_timeout_milliseconds 500)
(set-option :fp.spacer.order_children 1)
(set-option :fp.xform.slice false)

(declare-rel QQ (Int))
(declare-rel RR (Int Int))
(declare-var m Int)
(declare-var n Int)

(rule (=> (QQ m) (RR m (+ m 2))))
(rule (=> (RR m n) (QQ (mod n 5))))
(query RR :print-answer true)