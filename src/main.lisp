(defpackage lisp-person-register
  (:use :cl))
(in-package :lisp-person-register)

;; Constant work around from: https://stackoverflow.com/questions/34800988/sbcl-asdfload-system-fails-when-a-string-constant-is-defined

(eval-when (:compile-toplevel)
  (defconstant +database+ "tmp/database.sqlite3"
    "Path to the SQLite3 database file, where the persons will be registered."))

(mito:deftable user ()
  ((name :col-type (:varchar 128))
   (age :col-type :integer)))

(mito:connect-toplevel :sqlite3 :database-name +database+)

(mito:ensure-table-exists 'user)

(mito:insert-dao
  (make-instance 'user :name "Kevin Marques" :age 19))

(defun start ()
  (format t "End.~%"))
