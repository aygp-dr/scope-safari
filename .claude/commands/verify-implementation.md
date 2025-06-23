# Verify $ARGUMENTS implementation against formal contracts

1. **Run language-specific tests**:
   ```bash
   make run-$ARGUMENTS
   ```

2. **Check against TLA+ specification**:
   - Verify state transitions
   - Check invariants
   - Confirm safety properties

3. **Validate with Pydantic contract**:
   - Test input/output types
   - Verify counter behavior
   - Check emoji mappings

4. **Generate compliance report**:
   - TLA+ model checking results
   - Contract validation status
   - Any deviations or extensions
