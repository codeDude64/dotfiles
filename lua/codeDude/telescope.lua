local telescope = require('telescope')
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

telescope.setup {
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.file_split,
        ['<C-q>'] = actions.send_to_qflist
      }
    }
  },
  extensions = {
    fzy_native = {override_generic_sorter = false, override_file_sorter = true}
  }
}
telescope.load_extension('fzy_native')
telescope.load_extension('repo')
telescope.load_extension('dap')
telescope.load_extension('media_files')
telescope.load_extension('node_modules')
