# Lisp-Person-Register

Stupid project that I created just to learn the basics of this language. I ended
up liking it! It's a TUI application that registers names and ages in a simple
SQLite3 database, rendering the registered users and prompting the user to
either exit or register a new person.


## Usage

```bash
# Download the dependencies, then run the code.
make deps run
```


### Makefile Recipes

```bash
# Inspect the database `user` table.
make inspect

# Clean the generated files to setup and run this project and the database.
make clean
```


## Dependencies

```bash
# Install the Steel Bank Common Lisp REPL.
sudo apt install -y rlwrap sbcl

# Install the Quicklisp package manager.
curl -o quicklisp.lisp http://beta.quicklisp.org/quicklisp.lisp
sbcl --no-sysinit --no-userinit --load quicklisp.lisp \
                  --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
                  --eval '(ql:add-to-init-file)' \
                  --quit
```


## See Also

Setting up a development environment:
+ [**Getting Started with Common Lisp**](https://lispcookbook.github.io/cl-cookbook/getting-started.html)
+ [Getting Started](https://lisp-lang.org/learn/getting-started/)

I was inspired by this simple Python challenge:
+ [Exercício Python #115a - Criando um menu em Python](https://www.youtube.com/watch?v=pog8YmHkGMs&list=PLvE-ZAFRgX8hnECDn1v9HNTI71veL3oW0&index=140)
