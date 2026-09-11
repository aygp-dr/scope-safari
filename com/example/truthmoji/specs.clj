(ns com.example.truthmoji.specs
  "Data specs for TruthMoji (https://clojure.org/guides/spec). The s/fdef for
  each fn sits next to its defn in com.example.truthmoji."
  (:require [clojure.spec.alpha :as s]))

;; What emojify returns: 😊 for a truthy value, 😔 for nil or false.
(s/def ::emoji #{"😊" "😔"})

;; emojify takes any value and applies Clojure truthiness, as the demo
;; shows with 1 and nil.
(s/def ::value any?)

;; The number of emojify calls since the ns was loaded.
(s/def ::usage nat-int?)
