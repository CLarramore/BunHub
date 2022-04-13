getgenv().exec = function(n, ...)
	local fs = {
		n,
		string.format('%s.lua', n),
		n == 'PLACE' and ('games/%d.lua'):format(game.PlaceId),
	}
	for _, f in next, fs do
		if f and isfile(f) then
			_G.EXEC_ARGS = {...}
			local s, e = pcall(loadfile(f))
			if not s then warn(e) end
			_G.EXEC_ARGS = nil
			break
		end
	end
end

local autos={
'aafk.lua',
'log.lua',
'click-dist.lua',
'zoom-dist.lua',
'tele-key.lua'}--should i bind this to tele-key or what?
--'esp.lua'}--(soon)
for a,b in next,autos do
loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/auto/"..b))()
end
-- loadfile'rspy.lua'()
--[[
local n = ('games/%d.lua'):format(game.PlaceId)
if isfile(n) then print('LOADFILE FOR PLACE:', pcall(loadfile(n))) end
]]--
