-- Push out all MIDI vals on page change

function onValueChanged(key, value)
  if key == 'page' then
    CH_PAGE = self.values['page']
    print(
      '\nChannel Page ID: ', CH_PAGE
    )
    ctrls = self.children[self.values['page'] + 1].children
    update = {}
    for i=1,#ctrls do
      if ctrls[i].type == ControlType.PAGER then
        update['channel'], update['op'] = CH_PAGE, ctrls[i].values['page']
        print(ctrls[i].name, ctrls[i].values['page'])
        ctrls[i]:notify("update", update)
      elseif not (
          ctrls[i].type == ControlType.LABEL
          or ctrls[i].type == ControlType.TEXT
    ) then
        print(
        "ControlTypeId: ", ctrls[i].type,
        "ControlName: ", ctrls[i].name,
        "Current X Value: ", ctrls[i].values['x']
        )
        update['channel'], update['x'] = CH_PAGE, ctrls[i].values['x']
        ctrls[i]:notify("update", update)
        end
    end
  end
end
