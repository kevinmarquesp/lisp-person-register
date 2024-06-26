(defsystem "lisp-person-register"
  :version "0.0.1"
  :author ""
  :license ""
  :description ""
  :depends-on ("mito")
  :components ((:module "src"
                :components ((:file "database")
                             (:file "main"))))
  :in-order-to ((test-op (test-op "lisp-person-register/tests"))))

(defsystem "lisp-person-register/tests"
  :author ""
  :license ""
  :description "Test system for lisp-person-register"
  :depends-on ("lisp-person-register"
               "rove")
  :components ((:module "tests"
                :components ((:file "database"))))
  :perform (test-op (op c) (symbol-call :rove :run c)))
