--[==[HELP]==
[1] - string | nil
	The webhook URL.

[2] - string | boolean | nil
	If set to true or not passed in, writes to a file to path formatted as "./logs/%011(placeId) %Y-%m-%d %H%M%S.txt".
]==] --
--
local DEFAULT_WEBHOOK = nil

request=request or syn.request
local args = _G.EXEC_ARGS or {}
local WEBHOOK = readfile("url.txt")
local FILEPATH = true

if WEBHOOK == nil then WEBHOOK = DEFAULT_WEBHOOK end
--[[
if WEBHOOK then
	if WEBHOOK:find '^https://discorda?p*%.com/api/webhooks/' then
		WEBHOOK = WEBHOOK:sub(-87)
	end
	WEBHOOK = 'https://hooks.hyra.io/api/webhooks/' .. WEBHOOK
end
]]--
local pId = game.PlaceId
local sId = #game.JobId > 0 and game.JobId or 'PLAYTEST'
local uId = game.Players.LocalPlayer.UserId
local enabled = true

local function timestamp(t) return os.date('%Y-%m-%dT%H:%M:%SZ', t) end
if type(FILEPATH) ~= 'string' and FILEPATH ~= false then
	FILEPATH = string.format('logs/%011d %s.txt', pId, os.date('%Y-%m-%d %H%M%S'))
	makefolder('logs')
end

local function get_pname(pId)
	local s, r = pcall(
		game.MarketplaceService.GetProductInfo, game.MarketplaceService, pId)
	return (s and r) and r.Name or nil
end

local pName = get_pname(pId)
if not pName then
	pName = ''
	spawn(
		function()
			local n
			repeat
				wait(3)
				n = get_pname(pId)
			until n
			pName = n
		end)
end

function header(t)
	return string.format('[%11s] : [%11s] %s - %s', uId, pId, pName, sId)
end

function disc_send(txt)
	if not WEBHOOK then return end
	while not request do wait(1) end
	return request{
		Url = WEBHOOK,
		Method = 'POST',
		Headers = {['Content-Type'] = 'Application/Json'},
		Body = game.HttpService:JSONEncode{
			content = string.format('```\n%s\n```', txt),
		},
	}
end

local last
function _G.dlog(ln, frc, ts)
	if not enabled then return end
	ln = string.format('%s: %s', timestamp(ts), ln)
	_G.dlog_snip = _G.dlog_snip .. '\n' .. ln
	_G.dlog_long = _G.dlog_long .. '\n' .. ln
	if FILEPATH then writefile(FILEPATH, _G.dlog_long) end
	local t = tick()
	last = t

	local log = true
	if not frc and #_G.dlog_snip < 0x700 then
		wait(2)
		log = last == t
	end

	local snip = _G.dlog_snip
	if log and snip:find '\n' then
		_G.dlog_snip = header()
		disc_send(snip)
	end
end

function player_cht(pl, msg)
	local ch = pl.Character
	local pos = ''
	if ch then
		local hrp = ch:findFirstChild 'HumanoidRootPart'
		if hrp then
			pos = string.format(
				' (%7.1f, %7.1f, %7.1f)', hrp.Position.X, hrp.Position.Y, hrp.Position.Z)
		end
	end
	_G.dlog(
		string.format(
			'PLAYER CHATTED [%11s] %-20s%s\n  %s', pl.UserId, pl.Name, pos, msg))
end

function player_add(pl)
	_G.dlog(string.format('PLAYER ADDED   [%11s] %s', pl.UserId, pl.Name))
	table.insert(
		_G.dlog_evts, pl.Chatted:Connect(function(...) player_cht(pl, ...) end))
	table.insert(
		_G.dlog_evts, pl.CharacterAdded:Connect(function(...) player_spn(pl, ...) end))
end

function player_lve(pl)
	_G.dlog(
		string.format('PLAYER REMOVED [%11s] %s', pl.UserId, pl.Name),
			pl.UserId == uId)
end

function player_spn(pl, ch)
	local hrp = ch:WaitForChild 'HumanoidRootPart'
	local pos = string.format(
		' (%7.1f, %7.1f, %7.1f)', hrp.Position.X, hrp.Position.Y, hrp.Position.Z)
	_G.dlog(
		string.format('CHRCTER ADDED  [%11s] %-20s%s', pl.UserId, pl.Name, pos))
end

if _G.dlog_evts then for _, e in next, _G.dlog_evts do e:Disconnect() end end
_G.dlog_evts = {
	game.Players.PlayerAdded:Connect(player_add),
	game.Players.PlayerRemoving:Connect(player_lve),
	--[[
	game.Close:Connect(
		function()
			_G.dlog('CHAT STREAM SUCCESSFULLY ENDED', true)
			enabled = false
		end),
		]]
}

_G.dlog_snip = header()
_G.dlog_long = header()
_G.dlog('CHAT STREAM SUCCESSFULLY STARTED', true)
for _, player in pairs(game.Players:GetChildren()) do
	spawn(function() player_add(player) end)
end