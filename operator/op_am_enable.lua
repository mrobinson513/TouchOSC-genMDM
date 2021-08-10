--control type: Button/Toggle Press

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM, CH_PAGE = tonumber(OPERATOR_PAGE.values.page), tonumber(CHANNEL_PAGE.values.page)

CC_NUM = 70 -- Amp Mod enable CC for OP1, range 70-73

function onValueChanged(key)
    if key == 'x' then
      CC_VAL = self.values[key] * 127
      print(
      'MIDI Channel: ', CH_PAGE + 1,
      'FM Operator: ', OP_NUM + 1,
      'Continuous Controller: ', CC_NUM + OP_NUM, 
      'CC Value: ', CC_VAL
      )
      sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
    end
  end