# Twingate Connector Add-on for Home Assistant

A Home Assistant add-on that runs the Twingate connector for secure network access.

## About

This add-on runs the official Twingate connector as a service alongside Home Assistant OS. It provides secure access to your Twingate network resources directly from your Home Assistant environment.

## Features

- **Easy Configuration**: Configure through Home Assistant add-on interface
- **Automatic Management**: Handles container lifecycle automatically
- **Network Mode Options**: Support for host, bridge, and none network modes
- **Logging**: Integrated logging with Home Assistant
- **Restart Policy**: Automatic restart on failure

## Installation

### Option 1: Add-on Store (Recommended)

1. In Home Assistant, go to **Settings** → **Add-ons** → **Add-on Store**
2. Click the menu (⋮) in the top right corner
3. Select **Repositories**
4. Add this repository: `https://github.com/philipsutevski/twingate-homeasisstant-addon`
5. Find "Twingate Connector" in the add-on store
6. Click **Install**

### Option 2: Manual Installation

1. Download this repository
2. Copy the files to your Home Assistant `addons` directory
3. Restart Home Assistant
4. Go to **Settings** → **Add-ons** → **Local Add-ons**
5. Find "Twingate Connector" and click **Install**

## Configuration

### Required Settings

1. **Network**: Your Twingate tenant name (e.g., `philbytech`)
2. **Access Token**: Your Twingate access token
3. **Refresh Token**: Your Twingate refresh token

### Optional Settings

- **Container Name**: Name for the container (default: `twingate-hass-addon`)
- **Network Mode**: Choose network mode (host, bridge, none)
- **Log Level**: Logging level (0-4, default: 3)
- **Log Analytics**: Analytics logging (default: v2)

### Getting Twingate Credentials

1. Log into your Twingate console at https://admin.twingate.com
2. Navigate to **Settings** → **Connectors**
3. Click **Create Connector** or select an existing one
4. Copy the following information:
   - **Tenant Name** (e.g., `philbytech` from https://philbytech.twingate.com)
   - **Access Token**
   - **Refresh Token**

## Network Modes

- **host** (Recommended): Uses the host's network stack directly. Best performance and compatibility.
- **bridge**: Uses Docker's default bridge network. Good for compatibility.
- **none**: No network access. Only use for testing.

## Usage

1. Configure the add-on with your Twingate credentials
2. Click **Start** to launch the connector
3. Check the logs to verify the connector is online
4. The connector will appear in your Twingate admin console

## Troubleshooting

### Common Issues

1. **Add-on won't start**
   - Check that all required fields are filled
   - Verify your Twingate credentials are correct
   - Check the logs for error messages

2. **Connector not showing in admin panel**
   - Verify network connectivity
   - Check that tokens haven't expired
   - Try switching network mode to "bridge"

3. **Authentication errors**
   - Ensure tokens are copied correctly
   - Check that the network name is correct
   - Verify tokens haven't expired

### Logs

View logs in the add-on interface or in Home Assistant's main logs. Look for:
- Connection status messages
- Authentication errors
- Network connectivity issues

## Support

For issues and questions:
- Create an issue on GitHub
- Check the logs for error messages
- Verify your Twingate configuration

## License

This project is licensed under the MIT License.

## Credits

- Based on the official [Twingate Connector](https://www.twingate.com/docs/deploy-connector-with-docker-compose)
- Built for Home Assistant OS compatibility
