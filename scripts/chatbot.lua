--[[

Separate Module Needed

]]--
local Players=game:GetService("Players")
local chatter=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/simsimi.lua"))()
local credit=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/credit.lua"))()
local defaultsettings={
Name="Ribbon";
Enabled=true;
Distance=20;
NameVisible=true;
chatfuel="True";
};
local chatbotsettings = _G.chatbotsettings or defaultsettings

gui=_G.gui

gui:Credit{
Name=credit.Creator.Name;
Description="Creating this chatbot script.";
Discord=credit.Creator.Discord;
};
gui:Credit{
Name="Simsimi";
Description="Chatbot";
}
gui:Credit{
Name="Hoang Giap";
Description="Creator of the Simsimi API that I use.";
};



-- UI Lib --

local Ribbon=chatter:new({language="en",chatfuel=chatbotsettings.chatfuel})

local Chatbot=Window:Tab{
Name="Chatbot";
}

Chatbot:Toggle{
Name="Enabled";
StartingState=chatbotsettings.Enabled;
Callback=function(state) chatbotsettings.Enabled=state end;}

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

-- REsponse --

function Respond(message)
local response=Ribbon:response(message)
response=response:gsub("_ ",""):gsub("_",""):gsub("\n","")
   if response:match("Please teach me") then else
   if chatbotsettings.callchat==nil then
   game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(""..((chatbotsettings.NameVisible and (chatbotsettings.Name..": ")) or "")..response, 'All')
   else 
   pcall(chatbotsettings.callchat(""..((chatbotsettings.NameVisible and (chatbotsettings.Name..": ")) or "")..response))
   end
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