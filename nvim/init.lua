if require "mn.bootstrap" () then
	os.exit()
end

require "mn.globals"
require "mn.options"
require "mn.plugins"

-- Machine local settings...
pcall(require, "mn.local")
