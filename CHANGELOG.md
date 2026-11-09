# Changelog

All notable changes to PiggySat will be documented in this file.

The project uses [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-08-15

First release of the PiggySat hardware project.

### Added

- nRF9151-based emergency communicator hardware for GNSS positioning and bidirectional LTE NB-IoT NTN satellite data
- main radio and power PCB project
- separate four-layer antenna PCB and controlled-delay RF feed network
- Altium multi-board assembly
- reusable schematic and PCB libraries
- PCB panelization project
- Fusion 360 and STEP housing models
- output jobs for the main board, antenna board, panel and multi-board assembly, which generate the fabrication and documentation data
- CERN-OHL-P-2.0 license, attribution notice, authorship file, and project documentation

### Known limitations

- no display and no Bluetooth Low Energy link to a phone
- power consumption needs improvement: the GNSS LNA and the RF switch stay powered between transmissions