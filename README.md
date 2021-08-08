# GenMDM for TouchOSC

A TouchOSC control surface for [little-scale](https://github.com/little-scale)'s GenMDM peripheral and cartridge

## Description
This control surface manages all global, channel strip and operator controls using the MIDI CC assignments [documented](https://little-scale.com/GENMDM/GENMDM_103/GENMDM_103.txt) by little-scale. It does not have a keyboard or any other means of note triggering, for that you'll need something else.

## Requirements
* TouchOSC (desktop or tablet)
    * Not tested on nor intended for use on TouchOSC Mk1
    * Tested on TouchOSC for MacOS and iOS (iPad Pro gen1)
* MIDI interface
* [GenMDM](https://catskullelectronics.com/collections/sega/products/genmdm)
* Some means by which to trigger notes

## Features
* 6 pages of controls representing a channel / voice in the YM2612
* 4 pages per voice of FM operator controls

# Template files
The provided template file(s) are binary encoded.

### Lua scripts
This template makes heavy utilization of Lua scripting in place of TouchOSC's built in MIDI. It was necessary to support automatically changing the MIDI channel of a control based on the assigned page. Scripts used for each control have been provided as separate files for parsibility.

If you make changes to the lua files, be sure to test them in your own template in the appropriate control.

### Documentation

In progress. I will eventually develop a thorough doc/tutorial for GenMDM and FM synthesis in general.

### Roadmap
* support poly mode
    * Controls affects all channels instead of one
* lua-based param automation