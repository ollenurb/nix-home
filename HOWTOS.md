# Instructions
Here I'll put every useful information regarding my system.

## AirPlay Server
In order to stream the iPad screen you need to run an AirPlay server
1. Install the `rpiplay` as a user package
2. Setup `avahi.daemon` server on `system/configuration`
3. Set the following allowed ports by the firewall (inside `system/configuration`):
    - TCP: 7000, 7100
    - UDP: 6000, 6001, 7011
