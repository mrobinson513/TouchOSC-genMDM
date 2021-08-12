-- Control type: Radial

BASE_CC = 16  -- Total Level CC for OP1, range 16-19
SCALE = 127

function onValueChanged(key)
    if key == 'x' then
      OPERATOR_PAGE = self.parent.parent
      CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
      OP_NUM = tonumber(OPERATOR_PAGE.values.page)
      CH_PAGE = tonumber(CHANNEL_PAGE.values.page)
      CC_NUM = BASE_CC + OP_NUM

      CC_VAL = self.values[key] * SCALE
      print(
      'MIDI Channel: ', CH_PAGE,
      'FM Operator: ', OP_NUM,
      'Continuous Controller: ', CC_NUM,
      'CC Value: ', CC_VAL
      )
      sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
    end
  end

function onReceiveNotify(key, value)
  CH_PAGE, OP_NUM = value['channel'], value['op']
  CC_NUM = BASE_CC + OP_NUM

  CC_VAL = update['x'] * SCALE
  print(
  'MIDI Channel: ', CH_PAGE,
  'FM Operator: ', OP_NUM,
  'Continuous Controller: ', CC_NUM,
  'CC Value: ', CC_VAL
  )
  sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
end
