(set-logic HORN)
(set-option :fp.datalog.generate_explanations false)
(set-option :fp.datalog.initial_restart_timeout 500)
(set-option :fp.datalog.similarity_compressor_threshold 5)
(set-option :fp.spacer.elim_aux false)

(declare-rel U (Int))
(declare-rel V (Int Int))
(declare-var a Int)
(declare-var b Int)

(rule (=> (U a) (V a (+ a a))))
(rule (=> (and (V a b) (> b 3)) (U (- b 1))))
(query V :print-answer true)