PACKAGE_NAME = lisp-person-register
DATABASE_PATH = database.sqlite3

.PHONY: run
run:
	rlwrap sbcl --eval '(asdf:load-asd "$(PACKAGE_NAME).asd")' \
	            --eval '(asdf:load-system "$(PACKAGE_NAME)" :force t)' \
	            --eval '(in-package :$(PACKAGE_NAME))' \
	            --eval '(start)' \
	            --quit

.PHONY: repl
repl:
	rlwrap sbcl --eval '(asdf:load-asd "$(PACKAGE_NAME).asd")' \
	            --eval '(asdf:load-system "$(PACKAGE_NAME)" :force t)' \
	            --eval '(in-package :$(PACKAGE_NAME))'

.PHONY: test
test:
	rlwrap sbcl --eval '(asdf:load-asd "$(PACKAGE_NAME).asd")' \
	            --eval '(asdf:load-system "$(PACKAGE_NAME)" :force t)' \
	            --eval '(asdf:test-system :$(PACKAGE_NAME))' \
	            --quit

.PHONY: clean
clean:
	rm -vrf $(DATABASE_PATH)

.PHONY: inspect
inspect:
	sqlite3 $(DATABASE_PATH) 'SELECT * FROM user'
