-- Control type: Radial

OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM = tonumber(OPERATOR_PAGE.values.page)
CH_PAGE = tonumber(CHANNEL_PAGE.values.page)

BASE_CC = 20 -- Multiple CC for OP1, range 20-23
CC_NUM = BASE_CC + OP_NUM

print(
  '\nPage ID: ', CH_PAGE,
  '\nOperator ID: ', OP_NUM,
  '\nBase CC#: ', BASE_CC,
  '\nCurrent CC#: ', CC_NUM
)

function onValueChanged(key)
  if key == 'x' then
    local CC_VAL = math.ceil(self.values[key] * 128)
    print(
    'MIDI Channel: ', CH_PAGE,
    'FM Operator: ', OP_NUM,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL
    )
    sendMIDI({ 
      MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
  end
end

function update()
end