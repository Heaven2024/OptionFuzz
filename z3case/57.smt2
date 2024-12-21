
(set-option :sat.lookahead.delta_fraction 0.93)
(set-logic QF_AUFBV)
(declare-fun a () (Array (_ BitVec 8) (_ BitVec 16)))
(declare-fun x () (_ BitVec 8))
(assert (bvult (select a x) #x8000))
(assert (bvugt x #x80))
(check-sat)