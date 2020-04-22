# Openvidu Server

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with openvidu](#setup)
    * [What openvidu affects](#what-openvidu-affects)
    * [Beginning with openvidu](#beginning-with-openvidu)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)

## Description

This module allows you to install Openvidu-server and its dependencies. You will be able to deploy an OpenVidu based video conference server.

For more info on OpenVidu, please refer to the project [documents](https://docs.openvidu.io) website. This module as loosely based on the ["Deploying OpenVidu on Ubuntu"](https://docs.openvidu.io/en/2.12.0/deployment/deploying-ubuntu/) document

## Setup

### What openvidu affects

The following package and dependencies are installed:
* kurento-media-server
* coturn
* redis-server
* openjdk-8-jre
* unzip
* Docker (service is needed for video recording and it is installed)

### Beginning with openvidu

To install an openvidu server:

```
class {'openvidu':
  public_ip          => '192.168.33.10',
  network_interfaces => 'eth0',
  secret             => 'MY_SECRET',
}
```

## Usage


## Reference

### Parameters
* `public_ip` - The public IP address of your server. No default
* `network_interfaces` - The network interfaces listening (csv list). Default 'eth0'
* `install_path` - The OpenVidu install path (string). Default '/opt/openvidu-server'
* `kms_version` - The version of the Kurento-media-server (string). Default '6.13.0'
* `kms_uris` - KMS URL's to which OpenVidu Server will try to connect. They are tested in order until a valid one is found (array). Default Value '["ws://localhost:8888/kurento"]'
* `logfile` - The OpenVidu logfile path (string). Default '/var/log/openvidu.log'
* `recording` - Enable or disable video recording (boolean). Default true
* `recording_autostop` - Time in seconds to stop recording a finalized conference (integer). Default '0'
* `recording_path` - Path where the video files are recorded (string). Default '/opt/openvidu-server/recording'
* `secret` - Openvidu APP Secre (string). Default 'MY_SECRET'
* `turnserver_enabled` - Enable or disable the included COTURN server

## Limitations

This module is tested on the following platforms:
* Ubuntu 18.04

## Development

Project URL: https://github.com/alisio/alisio-openvidu

Copyright 2019 Antonio Alisio de Meneses Cordeiro

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
