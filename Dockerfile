FROM nixos/nix:latest

# Install systemd and any other desired packages
RUN nix-env -iA nixpkgs.systemd \
    && nix-env -iA nixpkgs.dbus

# Set up necessary directories and environment
RUN mkdir -p /run/systemd && \
    mkdir -p /run/dbus && \
    chmod 755 /run/dbus

# Copy the systemd service configuration if needed (optional)
# COPY my-service.service /etc/systemd/system/

# Enable any custom services (optional)
# RUN systemctl enable my-service

# Set the entrypoint to systemd
STOPSIGNAL SIGRTMIN+3
CMD ["/nix/store/hg0gma6hg0p70cs95bpxhhbvxc8w8rvn-systemd-255.9/lib/systemd/systemd"]

# Expose any necessary ports
EXPOSE 80