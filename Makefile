# Scope Safari Makefile
# Environment variables
PYTHON = uv run python
NODE = node
EMACS = emacs
GUILE3 = guile3
CLOJURE = clojure
HY = hy
GST = gst
GO = go
RUSTC = rustc
CC = gcc
CFLAGS = -std=c11
ZIG = zig

# Directories
ROOT_DIR := $(shell pwd)
JS_DIR := com/example/truthmoji
PY_DIR := com/example/truthmoji
EL_DIR := com/example/truthmoji
SCM_DIR := com/example/truthmoji
CLJ_DIR := com/example
ST_DIR := com/example/truthmoji
GO_DIR := com/example/truthmoji
RUST_DIR := com/example/truthmoji
C_DIR := com/example/truthmoji
ZIG_DIR := com/example/truthmoji

# Default target
.PHONY: all
all: help

# Help target
.PHONY: help
help:
	@echo "Scope Safari - Cross-Language Environment Exploration"
	@echo ""
	@echo "Usage:"
	@echo "  make tangle        # Extract code blocks from SS.org"
	@echo "  make run-js        # Run JavaScript implementation"
	@echo "  make run-py        # Run Python implementation"
	@echo "  make run-hy        # Run Hy implementation"
	@echo "  make run-el        # Run Elisp implementation"
	@echo "  make run-scm       # Run Guile Scheme implementation"
	@echo "  make run-clj       # Run Clojure implementation"
	@echo "  make run-all       # Run all implementations"
	@echo "  make clean         # Clean generated files"
	@echo "  make help          # Show this help message"

# Tangle code from Org mode file
.PHONY: tangle
tangle:
	@echo "Tangling code blocks from SS.org..."
	$(EMACS) --batch -l org --eval "(org-babel-tangle-file \"SS.org\")"
	@echo "Done!"

# Run JavaScript implementation
.PHONY: run-js
run-js:
	@echo "Running JavaScript implementation..."
	$(NODE) $(JS_DIR)/index.js

# Run Python implementation
.PHONY: run-py
run-py:
	@echo "Running Python implementation..."
	$(PYTHON) $(PY_DIR)/__init__.py

# Run Hy implementation
.PHONY: run-hy
run-hy:
	@echo "Running Hy implementation..."
	$(HY) $(PY_DIR)/truthmoji.hy

# Run Elisp implementation
.PHONY: run-el
run-el:
	@echo "Running Elisp implementation..."
	$(EMACS) --batch -l $(EL_DIR)/truthmoji.el --eval "(truthmoji-demo)"

# Run Guile Scheme implementation
.PHONY: run-scm
run-scm:
	@echo "Running Guile Scheme implementation..."
	$(GUILE3) -l $(SCM_DIR)/truthmoji.scm

# Run Clojure implementation
.PHONY: run-clj
run-clj:
	@echo "Running Clojure implementation..."
	$(CLOJURE) -M -e "(load-file \"$(CLJ_DIR)/truthmoji.clj\")"

# Run Smalltalk implementation
.PHONY: run-st
run-st:
	@echo "Running Smalltalk implementation..."
	$(GST) $(ST_DIR)/truthmoji.st

# Run Go implementation
.PHONY: run-go
run-go:
	@echo "Running Go implementation..."
	cd $(GO_DIR) && $(GO) run truthmoji.go

# Run Rust implementation
.PHONY: run-rust
run-rust:
	@echo "Running Rust implementation..."
	cd $(RUST_DIR) && $(RUSTC) truthmoji.rs -o truthmoji_rust && ./truthmoji_rust && rm -f truthmoji_rust

# Run C implementation
.PHONY: run-c
run-c:
	@echo "Running C implementation..."
	cd $(C_DIR) && $(CC) $(CFLAGS) truthmoji.c -o truthmoji_c && ./truthmoji_c && rm -f truthmoji_c

# Run Zig implementation
.PHONY: run-zig
run-zig:
	@echo "Running Zig implementation..."
	cd $(ZIG_DIR) && $(ZIG) build-exe truthmoji.zig && ./truthmoji && rm -f truthmoji

# Run all implementations
.PHONY: run-all
run-all: run-js run-py run-hy run-el run-scm run-clj run-st run-go run-rust run-c run-zig

# Check language versions
.PHONY: check-langs
check-langs:
	@echo "Checking language versions..."
	@echo "Python: $$($(PYTHON) --version)"
	@echo "Node.js: $$($(NODE) --version)"
	@echo "Emacs: $$($(EMACS) --version | head -n 1)"
	@echo "Guile: $$($(GUILE3) --version | head -n 1)"
	@echo "Clojure: $$($(CLOJURE) --version)"
	@echo "Hy: $$($(HY) --version)"
	@echo "Smalltalk: $$($(GST) --version | head -n 1)"
	@echo "Go: $$($(GO) version)"
	@echo "Rust: $$($(RUSTC) --version)"
	@echo "C: $$($(CC) --version | head -n 1)"
	@echo "Zig: $$($(ZIG) version)"

# Clean up generated files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	find $(ROOT_DIR) -name "*.json" -type f -delete
	find $(ROOT_DIR) -name "*.elc" -type f -delete
	@echo "Done!"

# Setup environment
.PHONY: setup
setup:
	@echo "Setting up environment..."
	uv venv
	@echo "Virtual environment created. Activate with: source .venv/bin/activate"