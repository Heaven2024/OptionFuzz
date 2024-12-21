(set-logic HORN)
(set-option :fp.datalog.use_map_names true)
(set-option :fp.spacer.reset_pob_queue false)
(set-option :fp.spacer.use_lemma_as_cti true)

(declare-rel O (Int))
(declare-rel P (Int Int))
(declare-var g Int)
(declare-var h Int)

(rule (=> (O g) (P g (- g 1))))
(rule (=> (P g h) (O (mod h 4))))
(query P :print-answer true)