# EZCFTunnelSSHConnect

## Prerequisites
- Windows 10 or later.
- The Windows Package Manager (winget) installed for automatic cloudflared installation.
- An SSH server already set up and accessible through a Cloudflare Tunnel. [How to set up](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/get-started/create-remote-tunnel/)

## Setup
Open the batch file with a text editor and set your host configuration and username at the beginning of the file.
```bat
SET host_config="your.host.com"
SET user_name="your_ssh_username"
```
