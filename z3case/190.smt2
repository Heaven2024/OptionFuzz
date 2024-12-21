(set-logic HORN)
(set-option :fp.spacer.q3 true)
(set-option :fp.spacer.validate_lemmas true)
(set-option :fp.xform.coalesce_rules true)

(declare-rel SS (Int))
(declare-rel TT (Int Int))
(declare-var c Int)
(declare-var d Int)

(rule (=> (SS c) (TT (div c 2) c)))
(rule (=> (TT c d) (SS (+ d 3))))
(query TT :print-answer true)