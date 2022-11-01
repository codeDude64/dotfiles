local ls = require 'luasnip'

return {
  { 'i', '<C-l>', function()
    if ls.choice_active() then
      ls.change_choice()
    end
  end }
}
