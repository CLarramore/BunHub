local HttpService = game:GetService("HttpService")
local Bot={}

Bot:new=function(settings)
local Mena={}
settings=settings or ...
Mena.language=settings.langauge or "en"
Mena.chatfuel=settings.chatfuel or "True"

function Mena:response=function(message)
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