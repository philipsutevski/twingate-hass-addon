ARG BUILD_FROM
ARG BUILD_ARCH

# Stage to source the Twingate connector binary
FROM --platform=linux/${BUILD_ARCH} twingate/connector:1 AS twingate_src

# Final image based on Home Assistant Debian base image (includes s6-overlay & bashio)
FROM ${BUILD_FROM}

# Install required shared libraries for Twingate connector (Debian packages)
RUN apt-get update && apt-get install -y \
    libsystemd0 \
    libc6 \
    libgcc-s1 \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Copy the connector binary from the Twingate image and make it executable
COPY --from=twingate_src /connectord /usr/local/bin/connectord
RUN chmod +x /usr/local/bin/connectord && \
    ls -la /usr/local/bin/connectord

# Copy root filesystem (s6 services)
COPY rootfs /

# Ensure scripts are executable
RUN chmod +x /etc/services.d/twingate/run || true

# Labels
LABEL maintainer="philipsutevski <github@philipsutevski.com>" \
      description="Twingate Connector for Home Assistant"
