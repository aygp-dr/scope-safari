(ns com.example.truthmoji-test
  (:require [clojure.spec.test.alpha :as stest]
            [clojure.string :as str]
            [clojure.test :refer [deftest is use-fixtures]]
            [com.example.truthmoji :as sut]))

;; Exercise every s/fdef :args spec while the unit tests run.
(use-fixtures :once
  (fn [f] (stest/instrument) (try (f) (finally (stest/unstrument)))))

(deftest emojify-uses-truthiness
  ;; the cases the demo prints
  (is (= "😊" (sut/emojify true)))
  (is (= "😔" (sut/emojify false)))
  (is (= "😊" (sut/emojify 1)))
  (is (= "😔" (sut/emojify nil))))

(deftest every-call-is-counted
  (let [before (sut/get-usage)]
    (sut/emojify :anything)
    (sut/emojify false)
    (is (= (+ before 2) (sut/get-usage)))))

(deftest demo-output
  (let [before (sut/get-usage)
        lines  (str/split-lines (with-out-str (sut/demo)))]
    (is (= ["" "=== TruthMoji Demo (Clojure) ===" "true → 😊" "false → 😔" "1 → 😊" "nil → 😔"]
           (butlast lines)))
    (is (= (str "Usage: " (+ before 4)) (last lines)))))
