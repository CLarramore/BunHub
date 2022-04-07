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
local settings={
petname=true;
};



local gui=Mercury:Create{
Name="Daycare Center";
Link="https://github.com/CLarramore/BunHub";
};
gui:Credit{
Name=credit.Creator.Name;
Description="Creator of this script.";
Discord=credit.Creator.Discord;
};
if plr.Character:FindFirstChild("ModelPet_Bunny")==nil and settings.petname then
events["Event_PetHandler"]:FireServer("Pet_Bunny",true)
end
_G.chatbotsettings.callchat=function(output)
if settings.petname then
events["Event_MakePetRPName"]:FireServer(output)
else
game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(output, 'All')
end
end

_G.gui=gui
local Chatbot=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/scripts/chatbot.lua"))

local GameChatbot=Chatbot:Section{
Name="Game Exclusive";};

GameChatbot:Toggle{
Name="Use Pet Name";
Description="Uses the pet name to respond for you (unfiltered)";
StartingState=settings.petname;
Callback=function(state) settings.petname=state;
if settings.petname==true then
events["Event_PetHandler"]:FireServer("Pet_Bunny",true) else
events["Event_PetHandler"]:FireServer("Pet_Bunny",false)
end end;};