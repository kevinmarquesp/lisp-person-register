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
    (prompt "> `input`: What is your name?   ")
    (prompt "> `input`: How old are you?     ")))

(defun display-registered-users-table (rows)
  "Displays all the registered users in a Markdown'ish styled table in STDOUT."
  (format t "~%## Registered Users~%~%")
  (format t "| Name                     | Age |~%")
  (format t "|--------------------------|-----|~%")
  (loop for row in rows do
    (format t "| ~:(~24a~) | ~3a |~%" (first row)        ; Select the name.
                                      (car (last row)))) ; Select the age.
  (format t "~%"))

(defun main-menu-loop (error-message)
  "Loop that will render all the output and display the menu in the STDOUT."
  (format t "~%***~%")
  ;; If an error message was provided, then display it.
  (if (null error-message) nil
    (format t "~%> `error`: ~a~%" error-message))
  ;; Only render the users table if there is at least one user registered.
  (let ((rows (fetch)))
    (if (null rows) nil
      (display-registered-users-table rows)))
  ;; Just print the menu options on the STDOUT.
  (format t "Valid options:~%")
  (format t "1. Register a new user~%")
  (format t "2. Exit~%~%")
  ;; This section handles the logic of the user's options choices.
  (let ((answer (prompt "> `input`: What you want to do? ")))
    (cond ((string-equal answer "1") (register-action)
                                     (main-menu-loop nil))
          ((string-equal answer "2") nil)
          (t (main-menu-loop "Invalid option..."))))) ; This line is the default
                                                      ; case in a switch block.

(defun start ()
  "Connects to the local SQLite3 database then start the main loop task."
  (connect +default-path+)
  (migrate)
  (main-menu-loop nil)
  (format t "~%End.~%"))
