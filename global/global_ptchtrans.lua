-- Global controls always send on channel 1. No reference to `page` is needed
-- Control type: Radial

-- Can use TouchOSC built-in MIDI messages. This script is for reference

-- DANGER ZONE, only use if you don't mind things will sound fucky
-- Also affects PSG sound chip

CC_NUM = 85 -- Global LFO Enable

function onValueChanged(key)
  if key == 'x' then
    CC_VAL = math.ceil(self.values[key] * 128)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE, CC_NUM, CC_VAL })
  end
end
