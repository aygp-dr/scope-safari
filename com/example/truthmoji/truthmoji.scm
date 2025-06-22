;;; truthmoji.scm - Guile implementation

(define-module (com example truthmoji)
  #:use-module (ice-9 format)
  #:export (emojify
            get-usage
            demo))

;; TruthMoji module implementation
;; Private bindings (not exported)
(define emoji-true "😊")
(define emoji-false "😔") 
(define usage-count 0)

;; Public API
(define (emojify bool)
  "Convert boolean to emoji"
  (set! usage-count (+ usage-count 1))
  (if bool emoji-true emoji-false))

(define (get-usage)
  "Get usage count"
  usage-count)

;; Demo function
(define (demo)
  (format #t "\n=== TruthMoji Demo (Guile) ===\n")
  (format #t "#t → ~a\n" (emojify #t))
  (format #t "#f → ~a\n" (emojify #f))
  (format #t "Usage: ~a\n" (get-usage)))

;; Auto-run demo
(demo)