#!/usr/bin/with-contenv bashio

# ==============================================================================
# Initialize Twingate Connector
# ==============================================================================

bashio::log.info "Initializing Twingate Connector..."

# Check if required options are set
if bashio::config.is_empty 'network'; then
    bashio::exit.nok "Twingate network is not set"
fi

if bashio::config.is_empty 'access_token'; then
    bashio::exit.nok "Twingate access token is not set"
fi

if bashio::config.is_empty 'refresh_token'; then
    bashio::exit.nok "Twingate refresh token is not set"
fi

# Get configuration
NETWORK=$(bashio::config 'network')
ACCESS_TOKEN=$(bashio::config 'access_token')
REFRESH_TOKEN=$(bashio::config 'refresh_token')
CONTAINER_NAME=$(bashio::config 'container_name')
NETWORK_MODE=$(bashio::config 'network_mode')
LOG_LEVEL=$(bashio::config 'log_level')
LOG_ANALYTICS=$(bashio::config 'log_analytics')

# Set hostname
HOSTNAME=$(hostname)

bashio::log.info "Starting Twingate Connector with network: ${NETWORK}"
bashio::log.info "Container name: ${CONTAINER_NAME}"
bashio::log.info "Network mode: ${NETWORK_MODE}"

# Create environment file for the Twingate container
cat > /tmp/twingate.env << EOF
TWINGATE_NETWORK=${NETWORK}
TWINGATE_ACCESS_TOKEN=${ACCESS_TOKEN}
TWINGATE_REFRESH_TOKEN=${REFRESH_TOKEN}
TWINGATE_LABEL_HOSTNAME=${HOSTNAME}
TWINGATE_LABEL_DEPLOYED_BY=hassio-addon
TWINGATE_LOG_LEVEL=${LOG_LEVEL}
TWINGATE_LOG_ANALYTICS=${LOG_ANALYTICS}
EOF

bashio::log.info "Twingate Connector initialization completed"
