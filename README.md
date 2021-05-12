# run1

#### Table of Contents

- [run1](#run1)
      - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Setup](#setup)
    - [What run1 affects](#what-run1-affects)
    - [Setup Requirements](#setup-requirements)
  - [Usage](#usage)
  - [OS Compatibility](#os-compatibility)
  - [Running tests](#running-tests)

## Overview

This module installs run1 from copr.

## Setup

### What run1 affects

* The run1 package
* A repo file in /etc/yum.repos.d

### Setup Requirements

This module requires [puppetlabs-stdlib](https://forge.puppet.com/puppetlabs/stdlib).

## Usage

``` puppet
include run1
```

## OS Compatibility

This module has been tested on recent Fedora and CentOS, and it should work on RHEL.

## Running tests

This project contains tests for both [rspec-puppet](http://rspec-puppet.com/)
and [beaker-rspec](https://github.com/puppetlabs/beaker-rspec) to verify
functionality.

To run the default tests, execute the following:

```
gem install bundler
bundle install
bundle exec rake spec
bundle exec rake beaker
```

By default, beaker tests will execute against CentOS 7.  To run beaker tests
against Fedora 26, execute the following:

```
bundle exec rake beaker:fedora-26
```

Run `bundle exec rake beaker:sets` to see all available beaker nodesets.
Run `bundle exec rake --tasks` to see all available test options.

Beaker tests require functional [docker](https://www.docker.com/).
