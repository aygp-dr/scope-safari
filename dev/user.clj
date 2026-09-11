(ns user
  "REPL entry point (clj -M:dev). Loads the project and instruments every
  s/fdef'd fn so bad calls fail fast with explain-data. Loading
  com.example.truthmoji runs its demo."
  (:require [clojure.spec.test.alpha :as stest]
            [com.example.truthmoji]))

(stest/instrument)
