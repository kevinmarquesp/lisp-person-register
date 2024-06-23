;;;; src/database.lisp

(defpackage lisp-person-register.database
  (:use :cl)
  (:export #:+default-path+
           #:connect
           #:migrate
           #:register
           #:fetch))
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

(defun fetch ()
  "Returns a matrix of tuples with all the registered names and ages."
  (let ((daos (mito:retrieve-dao 'user)))
    (mapcar (lambda (dao)
      (list (user-name dao)
            (user-age dao))) daos)))
