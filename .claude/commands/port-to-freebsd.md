# Port $ARGUMENTS language support to FreeBSD 14.3

1. **Check FreeBSD ports**:
   ```bash
   pkg search $ARGUMENTS
   ls /usr/ports/lang/ | grep -i $ARGUMENTS
   ```

2. **Document installation process**:
   - Package dependencies
   - Build requirements
   - Configuration needs

3. **Update Makefile**:
   - Add to install-deps target
   - Ensure compatibility with BSD make

4. **Test on FreeBSD**:
   - Verify compilation/interpretation
   - Check for BSD-specific issues
   - Document any workarounds
