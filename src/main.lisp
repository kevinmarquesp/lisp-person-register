;;;; src/main.lisp

(defpackage lisp-person-register
  (:use :cl)
  (:import-from :lisp-person-register.database :+default-path+)
  (:import-from :lisp-person-register.database :connect)
  (:import-from :lisp-person-register.database :migrate)
  (:import-from :lisp-person-register.database :register))
(in-package :lisp-person-register.database)
(in-package :lisp-person-register)

(defun start ()
  (connect +default-path+)
  (migrate)
  (register "Tony Stark" 43)
  (register "Steeve Rogers" 152)
  (register "Thor" 39)
  (format t "End.~%"))
