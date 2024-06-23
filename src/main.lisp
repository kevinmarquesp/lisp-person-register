;;;; src/main.lisp

(defpackage lisp-person-register
  (:use :cl)
  (:import-from :lisp-person-register.database
                #:+default-path+
                #:connect
                #:migrate
                #:register
                #:fetch))
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

(defun display-registered-users-table (rows)
  "Displays all the registered users in a Markdown'ish styled table in STDOUT."
  (format t "~%## Registered Users~%~%")
  (format t "| Name                     | Age |~%")
  (format t "|--------------------------|-----|~%")
  (loop for row in rows do
    (format t "| ~:(~24a~) | ~3a |~%" (first row)         ; Select the name.
                                      (car (last row))))  ; Select the age.
  (format t "~%"))

(defun start ()
  (connect +default-path+)
  (migrate)

  (let ((rows (fetch)))
    (if (null rows) nil
      (display-registered-users-table rows)))

  (format t "End.~%"))
