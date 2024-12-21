(set-logic HORN)
(set-option :fp.spacer.simplify_lemmas_post true)
(set-option :fp.spacer.use_bg_invs true)
(set-option :fp.spacer.push_pob_max_depth 10)

(declare-rel KK (Int))
(declare-rel LL (Int Int))
(declare-var e Int)
(declare-var f Int)

(rule (=> (KK e) (LL e (- e 3))))
(rule (=> (LL e f) (KK f)))
(query LL :print-answer true)