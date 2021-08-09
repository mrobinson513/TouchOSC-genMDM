controls = self:findAllByProperty('tag', 'channel', true)

function onValueChanged(key)
  if key == 'page' then
    MIDI_CHANNEL = self.values[key] + 1
    print('MIDI Channel: ', MIDI_CHANNEL)
    for i=1,#controls do
      local control = controls[i]
      print('Name: ', control.name)
      control:notify('CHANNEL', MIDI_CHANNEL)
    end
  end
end
