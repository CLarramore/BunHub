local HttpService = game:GetService("HttpService")
local Bot={}

function Bot:new(...)
local Mena={}
local settings=...
Mena.language=settings.langauge or "en"
Mena.chatfuel=settings.chatfuel or "True"

function Mena:response(message)
local text=message
    local Response = game:HttpGet("https://api.simsimi.net/v2/?text="..text.."&lc="..language.."&cf="..chatfuel)
	local data=HttpService:JSONDecode(Response)
	return data.success
	end
	
	return Mena
	end
	
return setmetatable(Bot, {
	__index = function(_, i)
		return rawget(Bot, i:lower())
	end;
	__metatable="No";
})