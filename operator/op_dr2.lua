--control type: Fader

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM = tonumber(OPERATOR_PAGE.values.page)
CH_PAGE = tonumber(CHANNEL_PAGE.values.page)

CC_NUM = 51 -- Second Decay Rate CC for OP1, range 51-54

function onValueChanged(key)
  if key == 'x' then
    local CC_VAL = math.ceil(self.values[key] * 128)
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