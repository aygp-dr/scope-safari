(ns com.example.truthmoji.specs-test
  "Generative checks for every s/fdef'd fn, plus data-spec sanity.
  Per https://clojure.org/guides/spec (Testing)."
  (:require [clojure.spec.alpha :as s]
            [clojure.spec.test.alpha :as stest]
            [clojure.test :refer [deftest is testing]]
            [com.example.truthmoji :as sut]
            [com.example.truthmoji.specs :as specs]))

(def ^:private check-opts {:clojure.spec.test.check/opts {:num-tests 50}})

;; Side-effecting fns: fdef'd for instrumentation, never generatively
;; checked. demo prints. emojify only bumps the in-memory usage counter, so
;; it is checked.
(def ^:private side-effecting
  #{`sut/demo})

(defn- checkable []
  (remove side-effecting (stest/enumerate-namespace 'com.example.truthmoji)))

(deftest fdefs-hold-under-generative-testing
  (let [results (stest/check (checkable) check-opts)]
    (is (= #{`sut/emojify `sut/get-usage} (set (map :sym results))))
    (doseq [r results]
      (testing (str (:sym r))
        (is (nil? (:failure r))
            (pr-str (stest/abbrev-result r)))))))

(deftest data-specs-generate-and-conform
  (doseq [k [::specs/emoji ::specs/value ::specs/usage]]
    (testing (str k)
      (is (every? (fn [[v _]] (s/valid? k v)) (s/exercise k 10))))))

(deftest real-values-conform
  (is (s/valid? ::specs/emoji (sut/emojify true)))
  (is (s/valid? ::specs/emoji (sut/emojify nil)))
  (is (s/valid? ::specs/usage (sut/get-usage))))
