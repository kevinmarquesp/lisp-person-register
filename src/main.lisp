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

(defun prompt (message)
  "Reads the user input as a string, it also allows to provide a custom prompt."
  (format t "~a" message)
  (finish-output)
  (read-line nil 'eof nil))

(defun start ()
  (format t "~a~%"
    (prompt "Hello?: "))
  (format t "End.~%"))
