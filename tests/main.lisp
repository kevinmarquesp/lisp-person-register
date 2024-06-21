(defpackage lisp-person-register/tests/main
  (:use :cl
        :lisp-person-register
        :rove))
(in-package :lisp-person-register/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :lisp-person-register)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
