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
	@echo "  make tangle        # Extract code blocks from README.org"
	@echo "  make tangle-file FILE=<file.org>  # Extract code blocks from specific org file"
	@echo "  make tangle-all    # Extract code blocks from all org files"
	@echo "  make run-js        # Run JavaScript implementation"
	@echo "  make run-py        # Run Python implementation"
	@echo "  make run-hy        # Run Hy implementation"
	@echo "  make run-el        # Run Elisp implementation"
	@echo "  make run-scm       # Run Guile Scheme implementation"
	@echo "  make run-clj       # Run Clojure implementation"
	@echo "  make run-st        # Run Smalltalk implementation"
	@echo "  make run-go        # Run Go implementation"
	@echo "  make run-rust      # Run Rust implementation"
	@echo "  make run-c         # Run C implementation"
	@echo "  make run-zig       # Run Zig implementation"
	@echo "  make run-all       # Run all implementations"
	@echo "  make setup         # Setup Python environment"
	@echo "  make download-tools # Download TLA+ tools and reference manuals"
	@echo "  make verify-tla    # Run TLA+ model checker"
	@echo "  make verify-contract # Run Pydantic contract verification"
	@echo "  make verify-all    # Run all verifications"
	@echo "  make check-langs   # Check language versions"
	@echo "  make clean         # Clean generated files"
	@echo "  make help          # Show this help message"
	@echo "  make install-deps  # Install language dependencies (requires sudo)"
	@echo ""
	@echo "Research targets:"
	@echo "  make research/guile     # Clone Guile repository"
	@echo "  make research/clojure   # Clone Clojure repository"
	@echo "  make research/python    # Clone Python repository"
	@echo "  make research/nodejs    # Clone Node.js repository"
	@echo "  make research/emacs     # Clone Emacs repository"
	@echo "  make research/hy        # Clone Hy repository"
	@echo "  make research/go        # Clone Go repository"
	@echo "  make research/smalltalk # Clone GNU Smalltalk repository"
	@echo "  make research/rust      # Clone Rust repository"
	@echo "  make research/zig       # Clone Zig repository"
	@echo "  make research-all       # Clone all research repositories"
	@echo "  make clean-research     # Remove all research repositories"

# Tangle code from Org mode file
.PHONY: tangle
tangle:
	@echo "Tangling code blocks from README.org..."
	$(EMACS) --batch -l org --eval "(org-babel-tangle-file \"README.org\")"
	@echo "Done!"

# Tangle from specific org file
.PHONY: tangle-file
tangle-file:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make tangle-file FILE=yourfile.org"; \
		exit 1; \
	fi
	@echo "Tangling code blocks from $(FILE)..."
	$(EMACS) --batch -l org --eval "(org-babel-tangle-file \"$(FILE)\")"
	@echo "Done!"

# Tangle all org files
.PHONY: tangle-all
tangle-all:
	@for file in *.org; do \
		echo "Tangling code blocks from $$file..."; \
		$(EMACS) --batch -l org --eval "(org-babel-tangle-file \"$$file\")"; \
	done
	@echo "All org files tangled!"

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
	rm -f README.md
	rm -f com/example/truthmoji/*.json
	rm -f com/example/truthmoji/*.elc
	@echo "Done!"

# Setup environment
.PHONY: setup
setup: README.md
	@echo "Setting up environment..."
	uv venv
	uv install
	@echo "Environment setup complete. Activate with: source .venv/bin/activate"

# Generate README.md from README.org (for uv integration)
README.md: README.org
	@echo "Converting $< to $@..."
	$(EMACS) --batch -l org --eval "(progn (find-file \"$<\") (org-md-export-to-markdown))" 
	@echo "$@ generated"

# Download tools and reference manuals
.PHONY: download-tools
download-tools:
	@echo "Downloading tools and references..."
	./scripts/download_tools.sh

# TLA+ specific tools and verification
TOOLS_DIR := tools
TLA_JAR := $(TOOLS_DIR)/tla2tools.jar

$(TLA_JAR):
	@echo "TLA+ tools not found. Downloading..."
	@mkdir -p $(TOOLS_DIR)
	@curl -L "https://github.com/tlaplus/tlaplus/releases/download/v1.7.1/tla2tools.jar" -o $(TLA_JAR)
	@echo "Downloaded TLA+ tools to $(TLA_JAR)"

# Run TLA+ model checker on the TruthMoji specification
.PHONY: verify-tla
verify-tla: $(TLA_JAR)
	@echo "Running TLA+ model checker on TruthMoji specification..."
	@java -jar $(TLA_JAR) -config contracts/TruthMoji.cfg contracts/TruthMoji.tla || true
	@echo "TLA+ verification complete"

# Run Pydantic contract verification
.PHONY: verify-contract
verify-contract:
	@echo "Running contract verification..."
	@if [ -d ".venv" ]; then \
		. .venv/bin/activate && $(PYTHON) -m pip install pydantic > /dev/null 2>&1 || true; \
		. .venv/bin/activate && $(PYTHON) contracts/truthmoji_contract.py || echo "Pydantic not installed or error running contract"; \
	else \
		$(PYTHON) -m pip install pydantic > /dev/null 2>&1 || true; \
		$(PYTHON) contracts/truthmoji_contract.py || echo "Pydantic not installed or error running contract"; \
	fi
	@echo "Contract verification complete"

# Run all verifications
.PHONY: verify-all
verify-all: verify-tla verify-contract
	@echo "All verifications complete"

# Install language dependencies (requires sudo)
.PHONY: install-deps
install-deps:
	@echo "Installing language dependencies (requires sudo)..."
	sudo ./scripts/install_languages.sh

# Research repository cloning targets
RESEARCH_DIR := research

.PHONY: research-dir
research-dir:
	@mkdir -p $(RESEARCH_DIR)

.PHONY: research/guile
research/guile: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/guile" ]; then \
		echo "Cloning Guile repository..."; \
		git clone https://git.savannah.gnu.org/git/guile.git $(RESEARCH_DIR)/guile; \
	else \
		echo "Guile repository already exists"; \
	fi

.PHONY: research/clojure
research/clojure: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/clojure" ]; then \
		echo "Cloning Clojure repository..."; \
		git clone https://github.com/clojure/clojure.git $(RESEARCH_DIR)/clojure; \
	else \
		echo "Clojure repository already exists"; \
	fi

.PHONY: research/python
research/python: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/cpython" ]; then \
		echo "Cloning Python repository..."; \
		git clone https://github.com/python/cpython.git $(RESEARCH_DIR)/cpython; \
	else \
		echo "Python repository already exists"; \
	fi

.PHONY: research/nodejs
research/nodejs: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/node" ]; then \
		echo "Cloning Node.js repository..."; \
		git clone https://github.com/nodejs/node.git $(RESEARCH_DIR)/node; \
	else \
		echo "Node.js repository already exists"; \
	fi

.PHONY: research/emacs
research/emacs: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/emacs" ]; then \
		echo "Cloning Emacs repository..."; \
		git clone https://github.com/emacs-mirror/emacs.git $(RESEARCH_DIR)/emacs; \
	else \
		echo "Emacs repository already exists"; \
	fi

.PHONY: research/hy
research/hy: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/hy" ]; then \
		echo "Cloning Hy repository..."; \
		git clone https://github.com/hylang/hy.git $(RESEARCH_DIR)/hy; \
	else \
		echo "Hy repository already exists"; \
	fi

.PHONY: research/go
research/go: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/go" ]; then \
		echo "Cloning Go repository..."; \
		git clone https://github.com/golang/go.git $(RESEARCH_DIR)/go; \
	else \
		echo "Go repository already exists"; \
	fi

.PHONY: research/smalltalk
research/smalltalk: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/smalltalk" ]; then \
		echo "Cloning GNU Smalltalk repository..."; \
		git clone https://git.savannah.gnu.org/git/smalltalk.git $(RESEARCH_DIR)/smalltalk; \
	else \
		echo "GNU Smalltalk repository already exists"; \
	fi

.PHONY: research/rust
research/rust: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/rust" ]; then \
		echo "Cloning Rust repository..."; \
		git clone https://github.com/rust-lang/rust.git $(RESEARCH_DIR)/rust; \
	else \
		echo "Rust repository already exists"; \
	fi

.PHONY: research/zig
research/zig: research-dir
	@if [ ! -d "$(RESEARCH_DIR)/zig" ]; then \
		echo "Cloning Zig repository..."; \
		git clone https://github.com/ziglang/zig.git $(RESEARCH_DIR)/zig; \
	else \
		echo "Zig repository already exists"; \
	fi

# Clone all research repositories
.PHONY: research-all
research-all: research/guile research/clojure research/python research/nodejs research/emacs research/hy research/go research/smalltalk research/rust research/zig
	@echo "All research repositories cloned"

# Clean research directory
.PHONY: clean-research
clean-research:
	@echo "Cleaning research directory..."
	rm -rf $(RESEARCH_DIR)
	@echo "Research directory cleaned"