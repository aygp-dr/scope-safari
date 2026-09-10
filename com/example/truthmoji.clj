(ns com.example.truthmoji
  "Boolean to emoji converter with environment inspection")

;; TruthMoji implementation
;; Private vars
(def ^:private emoji-true "😊")
(def ^:private emoji-false "😔")
(def ^:private usage-count (atom 0))

;; Public API
(defn emojify
  "Convert boolean to emoji"
  [bool]
  (swap! usage-count inc)
  (if bool emoji-true emoji-false))

(defn get-usage []
  @usage-count)

;; Demo
(defn demo []
  (println "\n=== TruthMoji Demo (Clojure) ===")
  (println "true →" (emojify true))
  (println "false →" (emojify false))
  (println "1 →" (emojify 1))
  (println "nil →" (emojify nil))
  (println "Usage:" (get-usage)))

;; Run demo on load
(demo)