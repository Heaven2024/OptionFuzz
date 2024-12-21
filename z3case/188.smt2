(set-logic HORN)
(set-option :fp.datalog.magic_sets_for_queries true)
(set-option :fp.spacer.push_pob false)
(set-option :fp.spacer.elim_aux false)

(declare-rel OO (Int))
(declare-rel PP (Int Int))
(declare-var a Int)
(declare-var b Int)

(rule (=> (OO a) (PP a (div a 3))))
(rule (=> (PP a b) (OO b)))
(query PP :print-answer true)