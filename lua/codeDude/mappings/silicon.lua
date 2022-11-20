local silicon = require 'silicon'

return {
  { 'v', '<leader>y', function() silicon.visualise_api({ to_clip = true, show_buf = true }) end },
}
