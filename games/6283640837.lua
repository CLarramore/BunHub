loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/auto/aafk.lua"))
local plr=game.Players.LocalPlayer
local options={
TABMENU="Tab MENU";
LastTab="View Last Tab";
Label1="Updated on 2022-03-30";
Label2="Created by bunnypadding#3576";};
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Snakeboy99/BLUEX/main/BlueXLibrary.lua"))()
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
	
local Window=library.new("Escape Fat Man",options)
local FunnyTab=Window:make_tab("Main",true)
local Section=FunnyTab:addSection("Main")

Section:AddButton("Instant Rebirth",instantrebirth)
Section:AddToggle("Loop Rebirth",false,function(when)
rebirthloop=when
coroutine.resume(coroutine.create(function()
while rebirthloop do
instantrebirth()
end
end))
end)
section:AddButton("Silence Music",function()
game.Players.LocalPlayer.PlayerScripts.DialogController.AbloomFreshAir:stop()
end)