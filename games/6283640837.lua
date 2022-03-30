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
Section:AddButton("Silence Music",function()
game.Players.LocalPlayer.PlayerScripts.DialogController.AbloomFreshAir:stop()
end)
Section:AddButton("Skip Stage",function()
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
end)
