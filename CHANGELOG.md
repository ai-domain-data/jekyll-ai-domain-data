# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] - 2025-11-18

### Added

- Initial release
- Automatic generation of `.well-known/domain-profile.json` during Jekyll build
- Schema validation against AI Domain Data Standard v0.1.1
- Liquid tag `{% ai_domain_data %}` for accessing domain data in templates
- Support for all required and optional fields (name, description, website, contact, logo, entity_type, jsonld)
- Automatic field mapping from Jekyll site configuration
- Validation error reporting in build output

### Changed

- N/A (initial release)

### Fixed

- N/A (initial release)

