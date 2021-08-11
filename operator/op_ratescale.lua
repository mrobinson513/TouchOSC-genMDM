-- Control type: Radio with 4 steps

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM = tonumber(OPERATOR_PAGE.values.page)
CH_PAGE = tonumber(CHANNEL_PAGE.values.page)

SCALE = 128 / self.properties.steps

BASE_CC = 39 -- Rate Scale CC for OP1, range 39-42
CC_NUM = BASE_CC + OP_NUM

print(
  '\nPage ID: ', CH_PAGE,
  '\nOperator ID: ', OP_NUM,
  '\nBase CC#: ', BASE_CC,
  '\nCurrent CC#: ', CC_NUM
)

function onValueChanged(key)
  if key == 'x' then
    local CC_VAL = self.values[key] * SCALE
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