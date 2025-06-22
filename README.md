
# Scope Safari: A Cross-Language Environment Exploration

<p align="center">
  <img src="https://img.shields.io/badge/status-development-orange" alt="Status: Development"/>
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="License: MIT"/>
  <img src="https://img.shields.io/badge/platform-FreeBSD%2014.2-red" alt="Platform: FreeBSD 14.2"/>
</p>

This project explores scope, environment, and closures across different programming languages.

Each implementation provides a minimal utility that converts boolean values to emoji:

-   `true` → "😊"
-   `false` → "😔"

The focus is on examining how different languages handle scope, environment, and module systems.


## Tested Languages Matrix (FreeBSD 14.2-RELEASE)

| Language   | Version      | Status  | Notes                         |
|------------|--------------|---------|-------------------------------|  
| Python     | 3.11.11      | ✅      | Using uv for venv management  |
| JavaScript | Node 22.14.0 | ✅      | npm 10.9.2                    |
| Elisp      | Emacs 30.1   | ✅      | GNU Emacs                     |
| Guile      | 3.0.10       | ✅      | GNU Guile 3                   |
| Clojure    | 1.12.0.1488  | ✅      | Clojure CLI                   |
| Hy         | 1.0.0        | ✅      | Lisp syntax for Python        |
| Smalltalk  | 3.2.5        | ✅      | GNU Smalltalk                 |
| Go         | 1.21.13      | ✅      | Thread-safe implementation    |
| Rust       | 1.85.0       | ✅      | Using AtomicUsize for safety  |
| C          | GCC 13.3.0   | ✅      | Using atomic variables        |
| Zig        | 0.13.0       | ✅      | Memory-safe systems language  |
| Haskell    | 9.4.8        | ⬜      | [Issue #1](https://github.com/aygp-dr/scope-safari/issues/1), [#17](https://github.com/aygp-dr/scope-safari/issues/17) (High) |
| Elixir     | 1.16.1       | ⬜      | [Issue #2](https://github.com/aygp-dr/scope-safari/issues/2) (Medium) |
| OCaml      | 4.14.0       | ⬜      | [Issue #4](https://github.com/aygp-dr/scope-safari/issues/4) (High) |
| Kotlin     | 1.9.20       | ⬜      | [Issue #14](https://github.com/aygp-dr/scope-safari/issues/14) (Low) |
| Crystal    | 1.9.2        | ⬜      | [Issue #19](https://github.com/aygp-dr/scope-safari/issues/19) (Low) |
| Julia      | 1.10.0       | ⬜      | [Issue #18](https://github.com/aygp-dr/scope-safari/issues/18) (Low) |
| V          | 0.4.0        | ⬜      | [Issue #20](https://github.com/aygp-dr/scope-safari/issues/20) (Low) |
| Nim        | 1.6.14       | ⬜      | [Issue #23](https://github.com/aygp-dr/scope-safari/issues/23) (Medium) |
| Racket     | 8.11.1       | ⬜      | [Issue #24](https://github.com/aygp-dr/scope-safari/issues/24) (Medium) |
| Ruby       | 3.2.7        | ⬜      | [Issue #25](https://github.com/aygp-dr/scope-safari/issues/25) (Low) |
| Perl       | 5.36.3       | ⬜      | [Issue #26](https://github.com/aygp-dr/scope-safari/issues/26) (Low) |
| Tcl        | 8.6.15       | ⬜      | [Issue #27](https://github.com/aygp-dr/scope-safari/issues/27) (Low) |
| Lua        | 5.4.7        | ⬜      | [Issue #28](https://github.com/aygp-dr/scope-safari/issues/28) (Medium) |


## Setup

1.  Clone the repository
2.  Create and activate the Python virtual environment:
    
        uv venv
        source .venv/bin/activate


## Project Structure

The project follows a simple structure for each language implementation:

    scope-safari/
    ├── com/
    │   └── example/
    │       └── truthmoji/
    │           ├── index.js      # JavaScript implementation
    │           ├── index.ts      # TypeScript implementation
    │           ├── __init__.py   # Python implementation
    │           ├── truthmoji.hy  # Hy implementation
    │           ├── truthmoji.el  # Elisp implementation
    │           ├── truthmoji.scm # Guile Scheme implementation
    │           ├── truthmoji.st  # Smalltalk implementation
    │           ├── truthmoji.go  # Go implementation
    │           ├── truthmoji.rs  # Rust implementation
    │           ├── truthmoji.c   # C implementation
    │           └── truthmoji.zig # Zig implementation
    ├── contracts/           # Formal specifications
    │   ├── TruthMoji.tla    # TLA+ specification
    │   ├── TruthMoji.cfg    # TLA+ configuration
    │   ├── TruthMoji.sol    # Solidity contract
    │   ├── truthmoji.lean   # Lean theorem proving
    │   └── truthmoji_contract.py # Pydantic contract
    ├── scripts/             # Utility scripts
    │   └── download_tools.sh # Downloads TLA+ tools and reference manuals
    ├── tools/               # TLA+ and verification tools (created by download_tools.sh)
    ├── docs/                # Documentation and reference manuals
    │   └── references/      # Language reference manuals (created by download_tools.sh)
    ├── .venv/               # Python virtual environment
    ├── scope-safari.el      # Emacs support for the project
    ├── .dir-locals.el       # Emacs directory local variables
    └── README.org           # This file


## Language Selection

The languages for this project were selected based on several factors:

-   Initial focus on Lisp family languages (Elisp, Scheme, Clojure, Hy)
-   High popularity/usage languages from the [TIOBE Index](https://www.tiobe.com/tiobe-index/)
-   Languages available in FreeBSD ports (*usr/ports/lang*)
-   Inspiration from [MAL (Make A Lisp)](https://github.com/kanaka/mal) project
-   Diverse representation of programming paradigms

Additional language implementations are tracked as GitHub issues, allowing other contributors or AI agents to extend the project while maintaining the consistent test structure. Implementation priorities (High, Medium, Low) reflect the importance of each language to the core goals of the project.


## Key Insights

From the exploration of scope and environment across different languages:

1. *Lexical vs Dynamic*: All modern implementations use lexical scope by default
2. *Privacy*: Ranges from convention (Python `_`) to enforced (JS closures)
3. *Introspection*: Lisp-family languages generally offer more runtime inspection
4. *State Management*: Closures remain the universal pattern for encapsulation


## Usage

Each language implementation can be run independently. Use the Makefile targets for running implementations:

    # Run a specific language implementation
    make run-js      # JavaScript
    make run-py      # Python
    make run-hy      # Hy
    make run-el      # Elisp
    make run-scm     # Guile Scheme
    make run-clj     # Clojure
    make run-st      # Smalltalk
    make run-go      # Go
    make run-rust    # Rust
    make run-c       # C
    make run-zig     # Zig
    
    # Run all implementations
    make run-all

See SS.org for details on each implementation.


## Formal Verification

This project includes formal specifications of the TruthMoji behavior using:

-   TLA+ specification (contracts/TruthMoji.tla)
-   Pydantic model for Python (contracts/truthmoji<sub>contract.py</sub>)
-   Solidity smart contract (contracts/TruthMoji.sol)
-   Lean theorem proving (contracts/truthmoji.lean)

To download TLA+ tools and language reference manuals:

    make download-tools

To run the TLA+ model checker against the specification:

    make verify-tla

To verify against the Pydantic contract:

    make verify-contract

To run all verification tools:

    make verify-all


## License

MIT

