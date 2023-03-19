return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'cljoly/telescope-repo.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-node-modules.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-lua/popup.nvim',
    },
    keys = function ()
     print(vim.inspect(require('keymaps.telescope')))
      return require('keymaps.telescope')
    end,
    config = function()
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
          fzy_native = { override_generic_sorter = false, override_file_sorter = true }
        }
      }
      telescope.load_extension('fzy_native')
      telescope.load_extension('repo')
      --telescope.load_extension('dap')
      telescope.load_extension('media_files')
      telescope.load_extension('node_modules')
    end
  }
}
