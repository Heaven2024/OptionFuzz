(set-option :sls.random_seed 12345)
(set-option :sls.max_restarts 10000)
(set-option :sls.walksat_ucb true)
(set-option :sls.walksat_ucb_constant 25.0)
(set-option :sls.vns_mc 3)

(set-logic QF_BV)

(declare-fun x () (_ BitVec 64))
(declare-fun y () (_ BitVec 64))
(declare-fun z () (_ BitVec 64))
(declare-fun w () (_ BitVec 64))

(assert (= (bvand x y) (bvor z w)))
(assert (bvult (bvadd x z) (bvmul y w)))
(assert (= (bvxor x w) (bvshl y z)))
(assert (bvsgt (bvsdiv x y) (bvsrem z w)))
(assert (bvule (bvnot x) (bvneg y)))
(assert (= (bvcomp x y) #b1))
(assert (bvugt (bvudiv w z) (bvurem x y)))





(check-sat)
(get-model)