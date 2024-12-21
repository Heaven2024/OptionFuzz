(set-logic QF_BV)
(set-option :max_conflicts 2000)
(set-option :seed 1234)

(declare-fun bv1 () (_ BitVec 8))
(declare-fun bv2 () (_ BitVec 8))

(assert (= bv1 #b11010101))
(assert (= bv2 #b10101010))

(assert (bvugt bv1 bv2))

(check-sat)
(get-model)
