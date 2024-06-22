;;;; src/main.lisp

(defpackage lisp-person-register
  (:use :cl)
  (:import-from :lisp-person-register.database
                #:+default-path+
                #:connect
                #:migrate
                #:register))
(in-package :lisp-person-register.database)
(in-package :lisp-person-register)

(defun start ()
  (connect +default-path+)
  (migrate)
  (register "Tony Stark" 43)
  (register "Steeve Rogers" 152)
  (register "Thor" 39)
  (format t "End.~%"))
