--[[

Separate Module Needed

]]--
local Players=game:GetService("Players")
local Mercury=loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local chatter=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/simsimi.lua"))()
local credit=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/credit.lua"))()
local chatbotsettings={
Name="Ribbon";
Enabled=true;
Distance=20;
NameVisible=true;
};

local gui=Mercury:Create{
Name="Chatbot";
Link="https://github.com/CLarramore/BunHub";
};
gui:set_status("Waiting")
gui:Credit{
Name=credit.Creator.Name;
Description="Creator of the GUI";
Discord=credit.Creator.Discord;
V3rm="CLoggermore";
}
gui:Credit{
Name="Simsimi";
Description="Chatbot";
}
gui:Credit{
Name="Hoang Giap";
Description="Creator of the Simsimi API that I use.";
};
gui:Credit{
Name=credit.Creator.Name;
Description="Creating this bot";
Discord=credit.Creator.Discord;
};


-- UI Lib --

local Ribbon=chatter:new({language="en",chatfuel="True"})

local Chatbot=gui:Tab{
Name="Chatbot";
}

Chatbot:Toggle{
Name="Enabled";
StartingState=chatbotsettings.Enabled;
Callback=function(state) chatbotsettings.Enabled=state
if state==true then
gui:Set_Status("Listening")
else
gui:Set_Status("Not Listening")
end
 end;}

Chatbot:Textbox{
Name="Bot Name";
Placeholder="Name";
Callback=function(text) chatbotsettings.Name=text end;
};

Chatbot:Slider{
Name="Distance";
Default=chatbotsettings.Distance;
Min=1;
Max=50;
Callback=function(value) chatbotsettings.Distance=value end;};

Chatbot:Toggle{
Name="Name Visible";
Description="Toggles if the name is visible";
StartingState=chatbotsettings.NameVisible;
Callback=function(state) chatbotsettings.NameVisible=state; end;}

if chatbotsettings.Enabled then
gui:Set_Status("Listening")
end
-- REsponse --

function Respond(message)
local response=Ribbon:response(message)
response=response:gsub("\n","")
   if response:match("Please teach me") or response=="You love it ya ye" then else
   game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(""..((chatbotsettings.NameVisible and (chatbotsettings.Name..": ")) or "")..response, 'All')
   end
end




Players.PlayerChatted:Connect(function(type, plr, message)
    for _,plrs in pairs(game.Players:GetPlayers()) do
	
	if (Players.LocalPlayer.Character.HumanoidRootPart.Position-plrs.Character.HumanoidRootPart.Position).magnitude<=chatbotsettings.Distance	then
		if plr.Name==plrs.Name then
		   if chatbotsettings.Enabled then Respond(message) end
		end
	end
	
end
end)