--control type: Button/Toggle Press

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM, CH_PAGE = tonumber(OPERATOR_PAGE.values.page), tonumber(CHANNEL_PAGE.values.page)

CC_NUM = 70 -- Amp Mod enable CC for OP1, range 70-73

function onValueChanged(key)
    if key == 'x' then
      CC_VAL = self.values[key] * 127
      sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
    end
  end