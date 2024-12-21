(set-logic HORN)
(set-option :fp.datalog.magic_sets_for_queries true)
(set-option :fp.datalog.similarity_compressor false)
(set-option :fp.datalog.subsumption true)
(set-option :fp.spacer.iuc true)

(declare-rel I (Int))
(declare-rel J (Int Int))
(declare-var a Int)
(declare-var b Int)

(rule (=> (I a) (J a (* 2 a))))
(rule (=> (and (J a b) (> b 0)) (I (* b b))))
(query J :print-answer true)