# Scope Safari: A Cross-Language Environment Exploration

<p align="center">
  <img src="https://img.shields.io/badge/status-development-orange" alt="Status: Development"/>
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="License: MIT"/>
  <img src="https://img.shields.io/badge/platform-FreeBSD%2014.2-red" alt="Platform: FreeBSD 14.2"/>
</p>

## About

Scope Safari is a multi-language programming project that explores how different programming languages implement scope, environment, and closures. Each implementation provides the same simple functionality: converting boolean values to emoji (true → 😊, false → 😔) while tracking usage count.

By implementing this same functionality across multiple language paradigms, we can compare:

- Lexical vs dynamic scoping rules
- Different approaches to state management
- Closure implementations and variable capture
- Module systems and namespaces
- Thread safety mechanisms
- Data encapsulation patterns

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
| Haskell    | 9.4.8        | TODO    | Issue #1                      |
| Elixir     | 1.16.1       | TODO    | Issue #2                      |
| OCaml      | 4.14.0       | TODO    | Issue #4                      |
| Kotlin     | 1.9.20       | TODO    | Issue #14                     |
| Crystal    | 1.9.2        | TODO    | Issue #19                     |
| Julia      | 1.10.0       | TODO    | Issue #18                     |
| V          | 0.4.0        | TODO    | Issue #20                     |
| Nim        | 1.6.14       | TODO    | Planned implementation        |

## Setup

1. Clone the repository
2. Create and activate the Python virtual environment:
   ```bash
   uv venv
   source .venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   uv install
   ```

## Project Structure

```
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
├── tools/               # TLA+ and verification tools
├── docs/                # Documentation and reference manuals
├── .venv/               # Python virtual environment
├── scope-safari.el      # Emacs support for the project
└── .dir-locals.el       # Emacs directory local variables
```

## Language Selection Criteria

The languages for this project were selected based on several factors:

- Initial focus on Lisp family languages (Elisp, Scheme, Clojure, Hy)
- High popularity/usage languages from the [TIOBE Index](https://www.tiobe.com/tiobe-index/)
- Languages available in FreeBSD ports (/usr/ports/lang/)
- Inspiration from [MAL (Make A Lisp)](https://github.com/kanaka/mal) project
- Diverse representation of programming paradigms

Additional language implementations are tracked as GitHub issues, allowing other contributors to extend the project while maintaining the consistent test structure.

## Key Insights

From the exploration of scope and environment across different languages:

1. *Lexical vs Dynamic*: All modern implementations use lexical scope by default
2. *Privacy*: Ranges from convention (Python `_`) to enforced (JS closures)
3. *Introspection*: Lisp-family languages generally offer more runtime inspection
4. *State Management*: Closures remain the universal pattern for encapsulation

## Usage

Each language implementation can be run independently using the Makefile targets:

```bash
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
```

## Formal Verification

This project includes formal specifications of the TruthMoji behavior using:

- TLA+ specification (contracts/TruthMoji.tla)
- Pydantic model for Python (contracts/truthmoji_contract.py)
- Solidity smart contract (contracts/TruthMoji.sol)
- Lean theorem proving (contracts/truthmoji.lean)

To download TLA+ tools and language reference manuals:

```bash
make download-tools
```

To run the TLA+ model checker against the specification:

```bash
make verify-tla
```

To verify against the Pydantic contract:

```bash
make verify-contract
```

To run all verification tools:

```bash
make verify-all
```

## Contributing

Contributions are welcome! Please check the ISSUES.md file for planned language implementations and features.

## License

MIT