# Scope Safari: Cross-Language Environment Exploration

## Project Overview
This project implements a simple boolean-to-emoji converter across multiple programming languages to compare scope, environment, and closure implementations.

## Core Functionality
- Each implementation converts booleans to emoji:
  - `true` → "😊"
  - `false` → "😔"
- Each implementation tracks usage count in a closure
- Each implementation demonstrates environment inspection

## Implemented Languages
- JavaScript/Node.js
- Python
- Hy (Lisp syntax for Python)
- Elisp (Emacs Lisp)
- Guile Scheme
- Clojure

## Repository Structure
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
│           └── truthmoji.scm # Guile Scheme implementation
├── Makefile               # Build and run commands
└── README.org             # Project documentation
```

## Working with This Repository

### Environment Setup
```bash
# Create and activate Python virtual environment
uv venv
source .venv/bin/activate
```

### Running Implementations
```bash
# Run all implementations
make run-all

# Run individual implementations
make run-js
make run-py
make run-hy
make run-el
make run-scm
make run-clj
```

### Commit Guidelines
- Use conventional commits format (`type(scope): message`)
- Use --trailer for co-author attribution
- Do NOT include "generated with" in commit messages
- Keep commits focused on single concerns

## Next Steps & Potential Improvements
- Add unit tests for each language implementation
- Create Docker containers for consistent environments
- Add more advanced scope examples (currying, partial application)
- Add web UI examples to compare implementations
- Add comparison matrix of scope and environment features

## Notes for LLMs/Agents
- FreeBSD 14.2 is the primary development platform
- Access to all required language implementations is verified
- Python uses uv for environment management
- All implementations use the same simple boolean-to-emoji conversion API