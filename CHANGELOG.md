# Changelog

All notable changes to PiggySat will be documented in this file.

The project uses [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-08-15

First release of the PiggySat hardware project.

### Added

- nRF9151-based emergency communicator hardware for GNSS positioning and bidirectional LTE NB-IoT NTN satellite data
- main radio and power PCB project
- separate four-layer antenna PCB and controlled-delay RF feed network
- Altium multi-board assembly and exported assembly STEP model
- reusable schematic and PCB libraries
- PCB panelization project
- Fusion 360 and STEP housing models
- fabrication outputs for the main and antenna boards, including Gerber, NC drill, BOM, pick-and-place, PDF, STEP, and PCB images
- CERN-OHL-P-2.0 license, attribution notice, authorship file, and project documentation

### Known limitations

- the design remains under active development and has unresolved DRC violations
- the intended IP68 enclosure rating requires physical validation and does not constitute certification
- regulatory, RF, environmental, and emergency-use validation are not included in this release