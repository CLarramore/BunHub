--[[

Hey uh, another chatbot?

]]--
local events=game.ReplicatedStorage.Storage["Folder_Events"]
local Players=game:GetService("Players")
local plr=Players.LocalPlayer
local Mercury=loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local credit=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/credit.lua"))()
_G.chatbotsettings={
Name="Ribbon";
Enabled=true;
Distance=20;
NameVisible=true;
chatfuel="False";};



local gui=Mercury:Create{
Name="Daycare Center";
Link="https://github.com/CLarramore/BunHub";
};
gui:Credit{
Name=credit.Creator.Name;
Description="Creating this chatbot script.";
Discord=credit.Creator.Discord;
};
if plr.Character:FindFirstChild("ModelPet_Bunny")==nil then
events["Event_PetHandler"]:FireServer("Pet_Bunny",true
end
_G.chatbotsettings.callchat=function(output)
events["Event_MakePetRPName"]:FireServer(output)
end

_G.gui=gui
loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/scripts/chatbotgui.lua"))()
