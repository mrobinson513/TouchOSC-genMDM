# Global Controls

These controls affect all channels. Signals are always sent on Channel 1.

## LFO 
### Enable
**CC# 74**
* Turn the low frequency oscillator on or off.

### Rate
**CC# 1**
* Set the rate/speed of the LFO.

## DANGER
### Channel 3 Special Mode
**CC #83**
* When enabled, The operators on channel 3 each control frequency independantly. This is done by triggering notes on MIDI channels 3, 11, 12, and 13.
    * The Total Level (TL) value is set by note velocity. Not playing a note is effectively muting the operator.
    * This mode can feel buggy and weird, but makes it possible for some very unique sound design.


### NTSC / PAL Tuning
**CC #00**
* By default, if this button is "off", the system will use NTSC (North America) tuning. Enable for PAL / European systems.

### Pitch transposition
**CC #85**


### Octave Division
**CC #84**
* The number of semitones representing an octave. Defaults to 12 (MIDI CC value 11). Touching this control on any page will change the value, and setting it back to default is annoying.

