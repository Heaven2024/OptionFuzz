(set-logic QF_UF) ; Quantifier-Free Uninterpreted Functions
(set-option :pp.max_width 100)
(set-option :pp.flat_assoc true)
(set-option :pp.simplify_implies true)

(declare-fun p () Bool)
(declare-fun q () Bool)
(declare-fun r () Bool)
(assert (=> (or p q) r))
(assert (=> r (and p q)))
(assert (not (and (not p) (not q))))
(check-sat)