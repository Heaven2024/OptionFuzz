(set-logic HORN)
(set-option :fp.datalog.default_table hashtable)
(set-option :fp.datalog.initial_restart_timeout 1000)
(set-option :fp.spacer.restart_initial_threshold 20)

(declare-rel EE (Int))
(declare-rel FF (Int Int))
(declare-var a Int)
(declare-var b Int)

(rule (=> (EE a) (FF a (mod a 4))))
(rule (=> (FF a b) (EE (- b 1))))
(query FF :print-answer true)