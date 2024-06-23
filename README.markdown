# Lisp-Person-Register

## Usage

```bash
# Download the dependencies, then run the code.
make deps run
```

## Dependencies

```bash
# Install the Steel Bank Common Lisp REPL.
sudo apt install rlwrap sbcl

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
