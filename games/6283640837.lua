local plr=game.Players.LocalPlayer
local options={
TABMENU="Tab MENU";
LastTab="View Last Tab";
Label1="Updated on 2022-03-30";
Label2="Created by bunnypadding#3576";};
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
--local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Snakeboy99/BLUEX/main/BlueXLibrary.lua"))()
local rebirthloop=false



function instantrebirth()
	local char=plr.Character
	local primepart=char:FindFirstChildOfClass("Part")
	firetouchinterest(primepart,workspace.Stages["52"],0)
	plr.leaderstats.Stage.Changed:wait()
	firetouchinterest(primepart,workspace.Stages["52"],1)
	game.ReplicatedStorage.Rebirth:FireServer()
	plr.CharacterAdded:wait()
	repeat wait() until plr.Character:FindFirstChildOfClass("Part")~=nil
	end
	
local Window=Mercury:Create{
Name="Escape FatMan";
Size=UDim2.fromOffset(600,400);
Theme=Mercury.Themes.Dark;
Link="https://github.com/CLarramore/BunHub";
}

Window:Credit{
Name="Bunny";
Description="Creator of this stupid GUI.";
Discord="bunnypadding#3576";
V3rm="CLoggermore";
}

local FunnyTab=Window:Tab{
Name="Main"};

FunnyTab:Button{
Name="Instant Rebirth",Description="Rebirth instantly!";
Callback=instantrebirth;}

FunnyTab:Toggle{
Name="Loop Rebirth";
StartingState=false;
Description="Loop Rebirth";
Callback=function(when)
rebirthloop=when
coroutine.resume(coroutine.create(function()
while rebirthloop do
instantrebirth()
end
end))
end;}

FunnyTab:Button{
Name="Silence Music";
Callback=(function()
game.Players.LocalPlayer.PlayerScripts.DialogController.AbloomFreshAir:stop()
end);};

FunnyTab:Button{
Name="Skip Stage",
Callback=function()
local stage=plr.leaderstats.Stage.Value	
if stage==52 then
game.ReplicatedStorage.Rebirth:FireServer()
else
local nextstage=stage+1
local primepart=plr.Character.HumanoidRootPart--:FindFirstChildOfClass("Part")
firetouchinterest(primepart,workspace.Stages[tostring(nextstage)],0)
plr.leaderstats.Stage.Changed:wait()
firetouchinterest(primepart,workspace.Stages[tostring(nextstage)],1)
plr.Character.HumanoidRootPart.CFrame=workspace.Stages[tostring(nextstage)].CFrame*CFrame.new(0,2,0)
end
end;}
