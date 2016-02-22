local hotkey = require "mjolnir.hotkey"
local tiling = require "mjolnir.tiling"
local layouts = require "mjolnir.tiling.layouts"
local mash = {"ctrl", "cmd"}

tiling.addlayout('E', function(windows)
  local wincount = #windows

  if wincount == 1 then
	return layouts['fullscreen'](windows)
  end

  for index, win in pairs(windows) do
	local frame = win:screen():frame()

	if index == 1 then
	  frame.w = frame.w / 3
	else
	  frame.x = frame.x + frame.w / 3
	  frame.w = frame.w / 3 * 2
	  frame.h = frame.h / (wincount - 1)
	  frame.y = frame.y + frame.h * (index - 2)
	end

	win:setframe(frame)
  end
end)

tiling.addlayout('3', function(windows)
  local wincount = #windows

  if wincount == 1 then
	return layouts['fullscreen'](windows)
  end

  for index, win in pairs(windows) do
	local frame = win:screen():frame()

	if index == 1 then
	  frame.w = frame.w / 3 * 2
	else
	  frame.x = frame.x + frame.w / 3 * 2
	  frame.w = frame.w / 3
	  frame.h = frame.h / (wincount - 1)
	  frame.y = frame.y + frame.h * (index - 2)
	end

	win:setframe(frame)
  end
end)
-- If you want to set the layouts that are enabled
tiling.set('layouts', {
  'fullscreen', 'main-vertical', 'main-horizontal', 'columns', 'rows', 'E', '3'
})

hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, "r", function() tiling.retile() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
-- hotkey.bind(mash, "f", function() tiling.gotolayout("fullscreen") end)
hotkey.bind(mash, "h", function() tiling.gotolayout("main-horizontal") end)
hotkey.bind(mash, "v", function() tiling.gotolayout("main-vertical") end)
