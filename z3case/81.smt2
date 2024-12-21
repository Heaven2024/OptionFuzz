(set-option :rcf.inf_precision 24)
(set-option :rcf.use_prem true)

(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)

(assert (= (* x x) (+ y z)))  ; x^2 = y + z
(assert (= (* y y y) (+ x (* 2 z))))  ; y^3 = x + 2*z
(assert (= z (/ 1 (+ x y))))  ; z = 1/(x + y)


(assert (> x 1))
(assert (> y 1))
(assert (> z 0))

(check-sat)

(get-model)
