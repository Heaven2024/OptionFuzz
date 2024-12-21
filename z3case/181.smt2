(set-logic HORN)
(set-option :fp.datalog.output_profile false)
(set-option :fp.spacer.use_inductive_generalizer false)
(set-option :fp.xform.array_blast_full false)

(declare-rel AA (Int))
(declare-rel BB (Int Int))
(declare-var e Int)
(declare-var f Int)

(rule (=> (AA e) (BB e (div e 5))))
(rule (=> (BB e f) (AA f)))
(query BB :print-answer true)