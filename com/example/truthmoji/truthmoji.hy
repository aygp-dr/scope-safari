;;; truthmoji.hy - Hy implementation

(import json)
(import sys)

;; TruthMoji core functionality
(setv emoji-true "😊")
(setv emoji-false "😔")
(setv usage-count 0)

(defn emojify [value]
  (global usage-count)
  (setv usage-count (+ usage-count 1))
  (if value emoji-true emoji-false))

(defn get-usage []
  usage-count)

;; Demo
(defn demo []
  (print "\n=== TruthMoji Demo (Hy) ===")
  (print f"True → {(emojify True)}")
  (print f"False → {(emojify False)}")
  (print f"Usage: {(get-usage)}"))

;; Run demo
(demo)