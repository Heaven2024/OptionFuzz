(set-logic AUFLIA)
(declare-fun f (Int) Int)
(declare-fun P (Int) Bool)
(assert (forall ((x Int)) (=> (P x) (P (f x)))))

(check-sat)
(get-model)