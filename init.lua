local hotkey = require "mjolnir.hotkey"
local tiling = require "mjolnir.tiling"
local mash = {"ctrl", "cmd"}

hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, "r", function() tiling.retile() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
hotkey.bind(mash, "f", function() tiling.gotolayout("fullscreen") end)
hotkey.bind(mash, "h", function() tiling.gotolayout("main-horizontal") end)
hotkey.bind(mash, "v", function() tiling.gotolayout("main-vertical") end)

-- If you want to set the layouts that are enabled
tiling.set('layouts', {
	 'fullscreen', 'main-vertical', 'main-horizontal', 'columns', 'rows'
})
