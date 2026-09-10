(ns com.example.truthmoji
  "Boolean to emoji converter with environment inspection"
  (:require [clojure.spec.alpha :as s]
            [com.example.truthmoji.specs :as specs]))

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

(s/fdef emojify
  :args (s/cat :bool ::specs/value)
  :ret ::specs/emoji
  ;; Clojure truthiness: 😊 exactly when the argument is truthy
  :fn (fn [{{:keys [bool]} :args ret :ret}]
        (= (= "😊" ret) (boolean bool))))

(defn get-usage []
  @usage-count)

(s/fdef get-usage
  :args (s/cat)
  :ret ::specs/usage)

;; Demo
(defn demo []
  (println "\n=== TruthMoji Demo (Clojure) ===")
  (println "true →" (emojify true))
  (println "false →" (emojify false))
  (println "1 →" (emojify 1))
  (println "nil →" (emojify nil))
  (println "Usage:" (get-usage)))

(s/fdef demo
  :args (s/cat))

;; Run demo on load
(demo)
