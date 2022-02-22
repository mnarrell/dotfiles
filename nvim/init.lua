if require "mn.bootstrap"() then
	os.exit()
end

require "mn.options"
require "mn.plugins"

-- Machine local settings...
pcall(require, "mn.local")
