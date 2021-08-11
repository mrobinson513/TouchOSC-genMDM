-- Control type: Radio with 8 steps

CC_NUM = 14 -- FM Algorithm

SCALE = 128 / self.properties.steps

function onValueChanged(key)
  if key == 'x' then
    CHANNEL_PAGE = self.parent.parent
    PAGE = tonumber(CHANNEL_PAGE.values.page)
    CC_VAL = self.values[key] * SCALE
    
    print(
    'MIDI Channel: ', PAGE + 1,
    'Continuous Controller: ', CC_NUM,
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + PAGE, CC_NUM, CC_VAL })
  end
end
