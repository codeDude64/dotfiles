local ls = require 'luasnip'

return {
  {
    mode = 'i',
    '<C-l>',
    function()
      if ls.choice_active() then
        ls.change_choice()
      end
    end
  }
}
