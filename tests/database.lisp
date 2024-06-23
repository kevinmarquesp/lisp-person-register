;;;; tests/database.lisp

(defpackage lisp-person-register/tests/database
  (:use :cl
        :lisp-person-register.database
        :rove))
(in-package :lisp-person-register/tests/database)

(deftest ensure-the-constant-path-value
  (testing "Should be database.sqlite3, just to test this CL test suit."
    (ok (string-equal "database.sqlite3" +default-path+))))

(deftest creates-a-new-test-db-file
  (testing "Should create a new test.sqlite3 file to connect with it."
    (connect "test.sqlite3")
    (ok (pathname-name (probe-file "test.sqlite3")))))

(deftest connect-to-the-same-db-file-during-tests
  (testing "Should just try to connect to the same test file in this test suit."
    (connect "test.sqlite3")
    (ok (pathname-name (probe-file "test.sqlite3")))))

(deftest register-the-user-then-fetch
  (testing "Should register the Fulano user then return a string and a integer."
    (delete-file (probe-file "test.sqlite3"))
    (connect "test.sqlite3")
    (migrate)
    (register "Fulano" "32")
    (ok (equal (fetch) '(("Fulano" 32))))))
