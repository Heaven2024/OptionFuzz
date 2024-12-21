(set-logic HORN)
(set-option :fp.spacer.use_array_eq_generalizer false)
(set-option :fp.spacer.gpdr.bfs false)
(set-option :fp.xform.coi false)

(declare-rel GG (Int))
(declare-rel HH (Int Int))
(declare-var m Int)
(declare-var n Int)

(rule (=> (GG m) (HH m (* m 2))))
(rule (=> (HH m n) (GG n)))
(query HH :print-answer true)