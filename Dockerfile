ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add --no-cache \
        curl \
        jq \
    \
    && curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/v0.18.1.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 \
        -C /tmp/bashio \
    \
    && mv /tmp/bashio/lib/standalone.sh /usr/lib/bashio/libstandalone.sh \
    && ln -s /usr/lib/bashio/libstandalone.sh /usr/lib/bashio/standalone.sh \
    && ln -s /usr/lib/bashio/libstandalone.sh /usr/lib/bashio/startup.sh \
    \
    && rm -f -r \
        /tmp/bashio \
        /tmp/bashio.tar.gz

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="philipsutevski <github@philipsutevski.com>"
