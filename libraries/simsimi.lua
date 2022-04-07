local HttpService = game:GetService("HttpService")
local Bot={}

function Bot:new(settings)
local Mena={}
local settings=settings or {}
Mena.language=settings.langauge or "en"
Mena.chatfuel=settings.chatfuel or "True"
Mena.Name=settings.Name or "Ribbon"

function Mena:response(message)
local text=message
    local Response = game:HttpGet("https://api.simsimi.net/v2/?text="..text.."&lc="..Mena.language.."&cf="..Mena.chatfuel.."&name="..Mena.Name)
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