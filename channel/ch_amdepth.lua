-- Control type: Radial

CHANNEL_PAGE = self.parent.parent
PAGE = tonumber(CHANNEL_PAGE.values.page)
CC_NUM = 76 -- FM Op1 Feedback per channel

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
