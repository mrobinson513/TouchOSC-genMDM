-- Control type: Radio with 4 steps

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM = tonumber(OPERATOR_PAGE.values.page)
CH_PAGE = tonumber(CHANNEL_PAGE.values.page)

SCALE = 128 / self.properties.steps

CC_NUM = 39 -- Rate Scale CC for OP1, range 39-42

function onValueChanged(key)
  if key == 'x' then
    local CC_VAL = self.values[key] * SCALE
    print(
    'MIDI Channel: ', CH_PAGE + 1,
    'FM Operator: ', OP_NUM + 1,
    'Continuous Controller: ', CC_NUM + OP_NUM, 
    'CC Value: ', CC_VAL
    )
    sendMIDI({ 
      MIDIMessageType.CONTROLCHANGE + CH_PAGE, 
      CC_NUM + OP_NUM, 
      CC_VAL })
  end
end