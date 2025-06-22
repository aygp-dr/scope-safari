#!/bin/sh
# Simple script to install language dependencies for Scope Safari
# Idempotent: Only installs languages that aren't already available
# Run with: sudo ./scripts/install_languages.sh

set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a package if the associated command doesn't exist
install_if_missing() {
    command="$1"
    package="$2"
    
    if ! command_exists "$command"; then
        echo "Installing $package..."
        pkg install -y "$package"
    else
        echo "$command already installed, skipping."
    fi
}

echo "=== Checking and installing language dependencies ==="

# Python
install_if_missing "python3" "python311"

# JavaScript/Node.js
install_if_missing "node" "node"

# Emacs Lisp
install_if_missing "emacs" "emacs"

# Guile Scheme
install_if_missing "guile3" "guile3"

# Clojure
install_if_missing "clojure" "clojure"

# Hy
if ! command_exists "hy"; then
    if command_exists "pip3"; then
        echo "Installing Hy via pip..."
        pip3 install hy
    else
        echo "Installing Hy dependencies..."
        pkg install -y python3 py311-pip
        pip3 install hy
    fi
else
    echo "Hy already installed, skipping."
fi

# Smalltalk
install_if_missing "gst" "gnu-smalltalk"

# Go
install_if_missing "go" "go"

# Rust
install_if_missing "rustc" "rust"

# C (GCC)
install_if_missing "gcc" "gcc"

# Zig
install_if_missing "zig" "zig"

# Haskell
install_if_missing "ghc" "ghc"

# Elixir
install_if_missing "elixir" "elixir"

# OCaml
install_if_missing "ocaml" "ocaml"

# Kotlin
install_if_missing "kotlin" "kotlin"

# Crystal
install_if_missing "crystal" "crystal"

# Julia
install_if_missing "julia" "julia"

# V
install_if_missing "v" "v"

# Nim
install_if_missing "nim" "nim"

# Racket
install_if_missing "racket" "racket"

# Ruby
install_if_missing "ruby" "ruby"

# Perl
install_if_missing "perl" "perl5"

# Tcl
install_if_missing "tclsh" "tcl86"

# Lua
install_if_missing "lua54" "lua54"

echo "=== Language installation complete ==="
echo "To verify all installed languages, run: make check-langs"