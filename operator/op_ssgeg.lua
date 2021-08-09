-- Control type: Radial with 9 steps
-- There are 8 patterns to choose from
-- This script works around a bug in GenMDM where the CC values don't scale as expected, where:
-- See GenMDM.ods (soon to be genmdm.md) for details and mapping


OPERATOR_PAGE = self.parent.parent
CHANNEL_PAGE = OPERATOR_PAGE.parent.parent
OP_NUM, CH_PAGE = tonumber(OPERATOR_PAGE.values.page), tonumber(CHANNEL_PAGE.values.page)
CC_NUM = 90 -- SSG-EG patterns Operator 1, range 90-93

SSG_ON = 32
SSG_SCALE = 4

function onValueChanged(key)
  if key == 'x' then
-- whenever x is above zero, add 32 to the CC value times (x - 1) * 4.
-- Adding 32 pushes the value into the "ON" range; 0-31 are "OFF"
    if self.values[key] > 0 then
      CC_VAL = SSG_ON + ((self.values[key] - 1) * SCALE)
    else
      CC_VAL = 0
    end
    print(
    'MIDI Channel: ', PAGE + 1,
    'Continuous Controller: ', CC_NUM, 
    'CC Value: ', CC_VAL)
    sendMIDI({ MIDIMessageType.CONTROLCHANGE + PAGE, CC_NUM, CC_VAL })
  end
end
