function onValueChanged(key, value)
  if key == 'page' then
    OP_NUM = self.values['page']
    CH_PAGE = self.parent.parent.values['page']
    print(
      '\nChannel Page ID: ', CH_PAGE,
      '\nOperator ID: ', OP_NUM
    )
  end
end