(defsystem "lisp-person-register"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "lisp-person-register/tests"))))

(defsystem "lisp-person-register/tests"
  :author ""
  :license ""
  :depends-on ("lisp-person-register"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for lisp-person-register"
  :perform (test-op (op c) (symbol-call :rove :run c)))
