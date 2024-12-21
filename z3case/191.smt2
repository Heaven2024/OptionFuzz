(set-logic HORN)
(set-option :fp.spacer.iuc true)
(set-option :fp.spacer.q3.instantiate false)
(set-option :fp.spacer.propagate false)

(declare-rel UU (Int))
(declare-rel VV (Int Int))
(declare-var e Int)
(declare-var f Int)

(rule (=> (UU e) (VV e (mod e 4))))
(rule (=> (VV e f) (UU (- f 1))))
(query VV :print-answer true)