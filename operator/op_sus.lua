--control type: Fader

BASE_CC = 55 -- Second Amp LVL (sustain) CC for OP1, range 55-58

function onValueChanged(key)
  if key == 'x' then
    OPERATOR_PAGE = self.parent.parent
    CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
    OP_NUM = tonumber(OPERATOR_PAGE.values.page)
    CH_PAGE = tonumber(CHANNEL_PAGE.values.page)
    CC_NUM = BASE_CC + OP_NUM

    local CC_VAL = math.ceil(self.values[key] * 127)
    print(
    'MIDI Channel: ', CH_PAGE,
    'FM Operator: ', OP_NUM,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL
    )
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
  end
end

function update()
end