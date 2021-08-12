-- Control type: Radial
-- Channel controls do not increment CC numbers, only the channel
CC_NUM = 81 -- Pitch Bend Amount

function onValueChanged(key)
  if key == 'x' then
    CHANNEL_PAGE = self.parent.parent
    PAGE = tonumber(CHANNEL_PAGE.values.page)
    CC_VAL = math.ceil(self.values[key] * 127)

    print(
    'MIDI Channel: ', PAGE,
    'Continuous Controller: ', CC_NUM,
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + PAGE, CC_NUM, CC_VAL })
  end
end
