-- Control type: Radial

CHANNEL_PAGE = self.parent.parent
CONNS = {true, false, false, false, false}
PAGE = tonumber(CHANNEL_PAGE.values.page)
CC_NUM = 81 -- Pitch Bend Amount

function onValueChanged(key)  
  if key == 'x' then
    CC_VAL = math.ceil(self.values[key] * 128)
    print(
    'MIDI Channel: ', PAGE + 1,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + PAGE, CC_NUM, CC_VAL })
  end
end
