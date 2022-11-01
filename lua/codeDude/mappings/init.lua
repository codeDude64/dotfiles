local utils = require 'codeDude.utils'
local maps = require 'codeDude.mappings.maps'

local function setup_mappings(m)
  for _, map in ipairs(m) do
    local mode, key, result, opts = map[1], map[2], map[3], map[4]
    utils.key_mapper(mode, key, result, opts)
  end

end

setup_mappings(maps);
