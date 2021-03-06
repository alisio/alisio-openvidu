# Changelog

All notable changes to this project will be documented in this file.

# Release 0.3

**Features**
- Add parameter to enable/disable CDR logging (cdr_enable: bool).

# Release 0.2

**Bugfixes**
- Set kms and turn logrotate



# Release 0.1.9

**Bugfixes**
- Fix issue that prevented webhook config

# Release 0.1.8

**Bugfixes**
- Change webhook parameter type to boolean instead of string

# Release 0.1.7

**Bugfixes**
- Fix bug preventing install if kms or docker repo set to false

# Release 0.1.6

**Features**

* add Webhook service config
* Add openvidu version parameter

**Bugfixes**

* Potential resource ordering issues
* Fix parameters description (README)

# Release 0.1.5

**Features**

* Add option to set openvidu version


# Release 0.1.4

**Features**

* add option to enable/disable kms repo install
* add option do enable/disable docker install
* Docker module is no longer needed

**Bugfixes**


**Known Issues**


## Release 0.1.3

**Features**

* change default openvidu install folder
* add public_url variable
* remove hardcoded install_path
* Restart openvidu service when config file changes
* Add option to set your own certificate through java key store
* Separate error log using variable logfile_error


**Bugfixes**


**Known Issues**



## Release 0.1.2

**Features**

* Add a parameter for setting the kurento media server uri.

**Bugfixes**

* Fix ordering issues

**Known Issues**


## Release 0.1.1

**Features**

**Bugfixes**

* Declare dependencies in metadata.json

**Known Issues**

* There are ordering issues that cause dependencies problems. You should run puppet again to fix the issue



## Release 0.1.0

First version

**Features**

**Bugfixes**

**Known Issues**

* There are ordering issues that cause dependencies problems. You should run puppet again to fix the issue
