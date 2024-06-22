;;;; src/database.lisp

(defpackage lisp-person-register.database
  (:use :cl)
  (:export :+default-path+)
  (:export :connect)
  (:export :migrate)
  (:export :register))
(in-package :lisp-person-register.database)

(mito:deftable user ()
  ((name :col-type (:varchar 128))
   (age :col-type :integer)))

(eval-when (:compile-toplevel)
  (defconstant +default-path+ "database.sqlite3"
    "Path to the SQLite3 database file, where the persons will be registered."))

(defun connect (path)
  "Connects to the SQLite3 database file."
  (mito:connect-toplevel :sqlite3 :database-name path))

(defun migrate ()
  "Creates the user table on the database, it has to be connect before that."
  (mito:ensure-table-exists 'user))

(defun register (name age)
  "Register a new entry on the user table. Each user IS NOT unique!"
  (mito:insert-dao
    (make-instance 'user :name name :age age)))
