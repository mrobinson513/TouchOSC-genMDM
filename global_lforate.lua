-- Global controls always send on channel 1. No reference to `page` is needed
-- Control type: Radial
-- Suggest change to Radio with 8 steps


CC_NUM = 1 -- Global LFO Enable

function onValueChanged(key)
  if key == 'x' then
    CC_VAL = math.ceil(self.values[key] * 128)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE, CC_NUM, CC_VAL })
  end
end
