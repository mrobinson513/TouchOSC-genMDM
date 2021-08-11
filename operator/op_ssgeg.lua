-- Control type: Radial with 9 steps
-- There are 8 patterns to choose from
-- This script works around a bug in GenMDM where the CC values don't scale as expected, where:
-- See GenMDM.ods (soon to be ssg-eg.md) for details and mapping

SSG_ON = 32
SSG_SCALE = 4
BASE_CC = 90 -- SSG-EG patterns Operator 1, range 90-93

function onValueChanged(key)
  if key == 'x' then
-- whenever x is above zero, add 32 to the CC value times (x - 1) * 4.
-- Adding 32 pushes the value into the "ON" range; 0-31 are "OFF"
    OPERATOR_PAGE = self.parent.parent
    CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
    OP_NUM = tonumber(OPERATOR_PAGE.values.page)
    CH_PAGE = tonumber(CHANNEL_PAGE.values.page)
    CC_NUM = BASE_CC + OP_NUM

    if self.values[key] > 0 then
      CC_VAL = SSG_ON + ((self.values[key] - 1) * SSG_SCALE)
    else
      CC_VAL = 0
    end

    print(
    'MIDI Channel: ', CH_PAGE,
    'FM Operator: ', OP_NUM,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + CH_PAGE, CC_NUM, CC_VAL })
  end
end


function update()
end