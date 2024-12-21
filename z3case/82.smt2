(set-option :produce-models true)
(set-option :timeout 5000)
(set-logic QF_UF)

; Declare constants for relevant options
(declare-const use_inductive_generalizer Bool)
(declare-const use_iuc Bool)
(declare-const use_lemma_as_cti Bool)
(declare-const use_lim_num_gen Bool)
(declare-const bit_blast Bool)
(declare-const bit_blast_full Bool)
(declare-const compress_unbound Bool)
(declare-const slice Bool)
(declare-const enable_hnf Bool)
(declare-const auto_config_simplex Bool)

; Set the constraints based on the analyzed relationships
(assert (=> use_inductive_generalizer use_iuc))  ; Dependency
(assert (not (and use_lemma_as_cti use_lim_num_gen)))  ; Conflict
(assert (not (and bit_blast bit_blast_full)))  ; Conflict
(assert (not (and compress_unbound slice)))  ; Conflict
(assert (not (and enable_hnf auto_config_simplex)))  ; Irrelevancy

; Check satisfiability
(check-sat)

; Get the model if satisfiable
(get-model)