-- Global controls always send on channel 1. No reference to `page` is needed
-- Control type: Button/Toggle Press
-- Can use TouchOSC built-in MIDI messages. This script is for reference

-- DANGER ZONE, only use if you don't mind things will sound fucky
-- See GenMDM manual for more details on CH3 special mode

CC_NUM = 83 -- Global LFO Enable

function onValueChanged(key)
  if key == 'x' then
    CC_VAL = self.values[key] * 127
    print(
    'MIDI Channel: ', PAGE + 1,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL
    )
    sendMIDI({ MIDIMessageType.CONTROLCHANGE, CC_NUM, CC_VAL })
  end
end
