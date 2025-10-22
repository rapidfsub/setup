local FRemap = require("foundation_remapping")
local remapper = FRemap.new()
remapper:remap("CapsLock", "escape"):remap("escape", "CapsLock")

remapper:register()
