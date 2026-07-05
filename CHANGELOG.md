# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Support for V 0.5.1.

## [0.3.0] - 2025-11-23

### Added

- Method to check if a string is a valid IP V4 ([#2](https://github.com/khalyomede/ip/issues/2)).
- Method to check if a string is a valid IP V6 ([#2](https://github.com/khalyomede/ip/issues/2)).
- Method to parse any string to an IP V4 or V6, e.g. an Address ([#1](https://github.com/khalyomede/ip/issues/1)).

## [0.2.0] - 2025-10-21

### Added

- You can now use the `Address` sum type to create functions that can return either an Ipv4 or Ipv6.

### Breaking

- Drop support for V versions below 0.4.12.

## [0.1.0] - 2025-10-05

### Added

- First working version.
