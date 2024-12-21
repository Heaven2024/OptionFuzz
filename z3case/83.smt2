(set-logic QF_BV) ; Quantifier-Free Bit-Vectors
(set-option :pp.bv_literals true)
(set-option :pp.bv_neg true)

(declare-fun x () (_ BitVec 16))
(declare-fun y () (_ BitVec 16))
(assert (= x (bvadd y #x00FF)))
(assert (bvule x y))
(assert (bvslt x (bvneg y)))
(check-sat)