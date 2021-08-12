-- Push out all MIDI vals on page change

function onValueChanged(key, value)
  if key == 'page' then
    CH_PAGE = tonumber(self.parent.parent.values.page)
    OP_PAGE = self.values['page']
    ctrls = self.children[self.values['page'] + 1].children
    update = {}
    for i=1,#ctrls do
      if not (
          ctrls[i].type == ControlType.LABEL
          or ctrls[i].type == ControlType.TEXT
      ) then
        print(
          'Channel Page ID: ', CH_PAGE,
          'Operator Page ID: ', OP_PAGE
        )
        print(
        "ControlTypeId: ", ctrls[i].type,
        "ControlName: ", ctrls[i].name,
        "Current X Value: ", ctrls[i].values['x']
        )
        update['channel'], update['op'], update['x'] = CH_PAGE, OP_PAGE, ctrls[i].values['x']
        ctrls[i]:notify("update", update)
      end
    end
  end
end

function onReceiveNotify(key, value)
  if value['op'] then
    print("Operator page...")
    CH_PAGE = tonumber(value['channel'])
    OP_PAGE = self.values['page']
    ctrls = self.children[self.values['page'] + 1].children
    update = {}
    for i=1,#ctrls do
      if not (
          ctrls[i].type == ControlType.LABEL
          or ctrls[i].type == ControlType.TEXT
          )
        then
          print(
            'Channel Page ID: ', CH_PAGE,
            'Operator Page ID: ', OP_PAGE
          )
          print(
          "ControlTypeId: ", ctrls[i].type,
          "ControlName: ", ctrls[i].name,
          "Current X Value: ", ctrls[i].values['x']
        )
        update['channel'], update['op'], update['x'] = CH_PAGE, OP_PAGE, ctrls[i].values['x']
        ctrls[i]:notify("update", update)
      end
    end
  end
end
