PACKAGE_NAME = lisp-person-register

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
