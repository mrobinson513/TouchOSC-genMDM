-- Control type: Radio with 8 steps
CHANNEL_PAGE = self.parent.parent
CONNS = {true, false, false, false, false}
PAGE = tonumber(channel_page.values.page)
CC_NUM = 14 -- FM Algorithm
STEPS = self.properties.steps
SCALE = STEPS / 128

function onValueChanged(key)
  if key == 'x' then
    CC_VAL = self.values[key] * SCALE
    print(
    'MIDI Channel: ', PAGE + 1,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + PAGE, CC_NUM, CC_VAL })
  end
end
