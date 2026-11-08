![PiggySat](Pictures/piggysat-comic.svg)

# PiggySat

[![License: CERN-OHL-P-2.0](https://img.shields.io/badge/license-CERN--OHL--P--2.0-blue.svg)](LICENSE)
![Release: v1.0.0](https://img.shields.io/badge/release-v1.0.0-brightgreen.svg)

PiggySat is an emergency communicator that determines its position using GNSS and exchanges data through an LTE NB-IoT satellite link. A Nordic Semiconductor nRF9151 provides both GNSS positioning and bidirectional NB-IoT NTN communications.

The hardware is built as an Altium Designer multi-board assembly. It combines a compact nRF9151 radio and power board with a separate four-layer antenna board and includes the mechanical housing, reusable component libraries, and a PCB panel project.

The design is under active development. Review the schematics, component availability, RF constraints, and manufacturing data before building hardware.

<p align="center">
  <img src="Pictures/pic3.jpg" alt="PiggySat main board with the antenna board mounted, next to the open housing" width="420">
</p>

## Purpose and architecture

- **Emergency communication** — designed to exchange essential data when terrestrial connectivity is unavailable.
- **Location** — the nRF9151 GNSS receiver determines the communicator's position.
- **Satellite data link** — the nRF9151 uses LTE NB-IoT NTN for transmitting and receiving data over satellite.
- **Integrated cellular IoT SiP** — a single nRF9151 handles both positioning and communication functions.
- **Simple user interface** — one touch button and three status LEDs provide direct control and visual feedback.
- **Rugged enclosure** — designed for an IP68 submersible housing suitable for emergency use in wet and exposed environments.
- **Multi-board construction** — the main electronics and antenna are implemented as separate PCBs and validated together in the Altium multi-board assembly.

## Block diagram

![PiggySat block diagram](Pictures/block-diagram.svg)

## Project layout

| Path | Description |
| --- | --- |
| `PiggySat.PrjMbd` | Top-level Altium multi-board project |
| `PiggySat.MbsDoc` | Multi-board schematic |
| `PiggySat.MbaDoc` | Multi-board assembly |
| `PiggySat.OutJob` | Multi-board output job |
| `PiggySat.stackup` | 1.6 mm four-layer fabrication stack-up |
| `PiggySat.RUL` | PCB design rules |
| `PiggySat-board/` | Main radio and power PCB project |
| `PiggySat-antenna/` | Antenna PCB project |
| `PiggySat-lib/` | Project schematic and PCB libraries |
| `PiggySat-panel/` | PCB panelization project |
| `Mechanical/` | IP68 housing design (Fusion 360 archive) and STEP models of the housing and PCB assembly |
| `Measurements/` | VNA S11 measurements of the antenna and matching network, with photos of the test setup |
| `Simulations/` | uSimmics simulations of the antenna matching network |
| `Pictures/` | README cover artwork, block diagram, and photos of the device |
| `Logo/` | Project artwork (PNG and SVG) |

## Hardware projects

### Main board

Open `PiggySat-board/PiggySat-board.PrjPcb` in Altium Designer. Its source documents are:

- `PiggySat-radio.SchDoc` — radio section
- `PiggySat-power.SchDoc` — power section
- `PiggySat-board.PcbDoc` — four-layer PCB layout
- `PiggySat-board.OutJob` — fabrication, assembly, and documentation outputs

The board uses the shared `PiggySat.stackup` and `PiggySat.RUL` in the repository root.

### Antenna board

Open `PiggySat-antenna/PiggySat-antenna.PrjPcb`. Its source documents are:

- `PiggySat-antenna.SchDoc` — antenna and feed network schematic
- `PiggySat-antenna.PcbDoc` — four-layer PCB layout
- `PiggySat-antenna.OutJob` — fabrication, assembly, and documentation outputs

The routed RF network includes phase/delay constraints for the `0DEG`, `90DEG`, `180DEG`, and `270DEG` nets. Preserve these constraints when changing the antenna feed network or stack-up.

### Component library

Open `PiggySat-lib/PiggySat.LibPkg` to edit or compile the project library. It contains:

- `PiggySat.SchLib` — schematic symbols
- `PiggySat.PcbLib` — footprints and component models

The compiled `PiggySat.IntLib` is not versioned. If Altium reports it missing while opening another project, compile the package, install or relink the resulting library, then confirm that every schematic component resolves to the intended symbol and footprint.

### Panel

Open `PiggySat-panel/PiggySat-panel.PrjPcb`. It contains `PiggySat-panel.PcbDoc` and `PiggySat-panel.OutJob`, which generates the production Gerber, NC drill, and pick-and-place data. Verify embedded-board links, tooling holes, rails, fiducials, breakaway features, and the fabricator's panel requirements before generating production data.

### Multi-board assembly

Open `PiggySat.PrjMbd` to inspect the relationship between the main board and antenna board through `PiggySat.MbsDoc` and `PiggySat.MbaDoc`. `PiggySat.OutJob` exports a STEP model of the full assembly for mechanical preview.

## Mechanical housing

The `Mechanical` directory contains:

- `PiggySat_housing.f3z` — Fusion 360 design archive of the housing
- `PiggySat_housing.step` — STEP model of the housing
- `PiggySat_pcb.step` — STEP model of the PCB assembly

The enclosure is designed to support an IP68 submersible implementation. The final ingress-protection rating depends on materials, seals, manufacturing tolerances, assembly, and validation testing; the design files alone do not constitute IP68 certification.

## Measurements and simulations

`Measurements/` contains vector network analyzer data for the antenna and its matching network:

- `s11_*.s1p` — 50 Ω Touchstone S11 measurements, one file per tested configuration
- `OSL_1_1_40G-1_70G_501pt.cal` — open/short/load calibration, 1.40–1.70 GHz, 501 points
- `s11.setup` — instrument setup used for the measurements
- `pic*.jpg` — photos of the antenna board on the measurement setup

`Simulations/` contains the uSimmics models of the matching network (`piggysat.sch`) and their results (`piggysat.dat`). The measured `.s1p` files can be loaded into the simulations for comparison.

## Requirements

- Altium Designer with support for PCB, library, and multi-board documents
- Autodesk Fusion 360 for the housing
- uSimmics for the simulations
- A Gerber/NC viewer independent of Altium for fabrication-output verification
- Access to the component datasheets and the intended PCB manufacturer's current capabilities

The exact Altium Designer release used to create the project has not yet been recorded. Before committing edits, open the project in the intended team version and check whether Altium proposes a document-format upgrade.

## Recommended workflow

1. Compile `PiggySat-lib/PiggySat.LibPkg` and install or relink the resulting integrated library if required.
2. Open and compile the main-board and antenna projects independently, and review the compile messages.
3. Confirm the controlled-impedance stack-up with the selected fabricator before changing RF geometry.
4. Open the multi-board project and check clearances, connectors, orientation, and mechanical alignment.
5. Review the panel project against the fabricator's panelization rules.
6. Run the output jobs from a clean, tagged source revision.
7. Inspect Gerbers, drill files, BOM, and placement data with independent tools before release.

## Design status

Version `1.0.0` is the first release of the PiggySat hardware project. See [CHANGELOG.md](CHANGELOG.md) for its contents and known limitations.

RF, GNSS, satellite-link, power, environmental, ingress-protection, and regulatory validation remain the responsibility of the builder.

## Version control

The repository contains only source material: Altium projects, documents, stack-up, rules and libraries, the housing design, measurements, simulations, and documentation. Files generated by the output jobs and by compiling the library are not versioned; regenerate them from the tagged revision you want to build. For traceable fabrication releases, attach the verified output archive to the Git tag or a GitHub Release.

Because Altium documents are mostly binary, keep commits small and explain schematic, layout, and library changes in commit messages. Avoid editing the same binary document concurrently on multiple branches.

## License

The original PiggySat hardware design files are licensed under the [CERN Open Hardware Licence Version 2 - Permissive](LICENSE), SPDX identifier `CERN-OHL-P-2.0`.

Copies, modifications, manufactured products, and redistributed versions must retain the applicable notices and credit the original work as:

> PiggySat — original hardware design by the PiggySat authors and contributors

See [NOTICE](NOTICE) for the attribution requirements. Modified versions must also identify that they were changed, with the date and a brief description. Third-party files remain governed by their respective licenses and notices.

## Authors

PiggySat was originally authored by **Marco Barbetta**. See [AUTHORS.md](AUTHORS.md) for authorship and contributor information.
