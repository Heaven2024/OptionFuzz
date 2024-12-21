(set-logic QF_UF)
(set-option :nnf.mode skolem)
(set-option :nnf.sk_hack false)

(declare-fun f (Bool Bool) Bool)
(declare-fun g (Int Int) Int)

(assert (forall ((x Bool)) (=> x (f x x))))
(assert (exists ((x Int)) (and (>= x 5) (g x x))))
(assert (forall ((x Int)) (=> (> x 0) (exists ((y Int)) (= (g x y) (+ x y))))))

(check-sat)
(get-model)
