Yes, running the command `chown mdelgert:mdelgert /portainer` will make the user `mdelgert` the owner of the `/portainer` directory, which will allow that user to have read-write access if the Samba share permissions are also correctly configured.

### Important Considerations:
1. **Docker Compatibility**:
   - Ensure that the Docker process (or the Portainer container) does not rely on root ownership or specific permissions for `/portainer`. If it does, changing ownership might cause Docker or Portainer to encounter permission issues.
   - You can verify the UID and GID used by Docker for the volume. If it conflicts with `mdelgert`, consider adding the Docker process user to the `mdelgert` group or adjusting permissions.

2. **Alternative Approach Without Changing Ownership**:
   If changing ownership might affect Docker:
   - Use group permissions:
     ```bash
     sudo chgrp -R mdelgert /portainer
     sudo chmod -R g+rw /portainer
     ```
   - Ensure the Samba `valid users` configuration includes group membership for `mdelgert`.

3. **Validate Samba Configuration**:
   - Verify the share permissions in `/etc/samba/smb.conf` to ensure the `create mask` and `directory mask` allow `mdelgert` to write.
   - Restart Samba after modifying the configuration:
     ```bash
     sudo systemctl restart smbd
     ```

4. **Test**:
   - After making changes, test write access via the Samba share to confirm the changes work as expected.
