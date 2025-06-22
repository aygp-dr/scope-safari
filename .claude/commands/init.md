# Session Initialization Instructions

When starting a new session with Scope Safari, please perform these steps:

## 1. Check GitHub Issues

Always check GitHub issues to identify open tasks and priorities:

```bash
gh issue list
```

Focus on issues with higher priority labels and those recently updated.

## 2. Review Git History

Check the commit history to understand recent work and find trailer notes from previous sessions:

```bash
git log --pretty=full
```

Look for commits with `--trailer` notes containing:
- Co-Author information
- Task information
- Notes for future sessions
- TODO items

## 3. Use Trailers for Commits

When committing changes, always use trailers for:

- Co-authorship attribution
  ```
  Co-Authored-By: Claude <noreply@anthropic.com>
  ```

- Notes about the implementation
  ```
  Notes: Implementation uses atomic operations for thread safety
  ```

- Tasks that remain to be done
  ```
  Tasks: Add tests for edge cases, Improve error handling
  ```

- References to related issues
  ```
  Fixes: #42
  Related: #24, #36
  ```

## 4. Use Conventional Commits

Follow the conventional commits format:

```
<type>(<scope>): <description>

<body>

<trailer>
```

Where:
- `type` is one of: feat, fix, docs, style, refactor, test, chore
- `scope` is the area of the codebase (e.g., python, rust, verification)
- `description` is a concise description of the change
- `body` provides additional context
- `trailer` contains co-author info and other metadata

## 5. Check Language Dependencies

Before implementing in a new language, verify that the language is installed:

```bash
make check-langs
```

## Example Workflow

```bash
# 1. Check current issues
gh issue list

# 2. Review recent work
git log --pretty=full -n 5

# 3. Make changes to code...

# 4. Commit with proper format and trailers
git commit -m "feat(go): add concurrency example

Added example of goroutines in the Go implementation to demonstrate 
concurrent usage counter increments.

Co-Authored-By: Claude <noreply@anthropic.com>
Tasks: Add benchmark tests for concurrent usage
Notes: Possible race condition at high concurrency"
```