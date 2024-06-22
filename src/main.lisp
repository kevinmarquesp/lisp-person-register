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

(defun register-action ()
  "Ask the user to type a name and a age to be registered at the database."
  (register
    (prompt "[input] What is your name?  ")
    (prompt "[input] How old are you?    ")))

(defun start ()
  (connect +default-path+)
  (migrate)
  (register-action)
  (format t "End.~%"))
