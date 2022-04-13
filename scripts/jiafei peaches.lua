--[[

game id : 8226464958
be near fat fag in that jail cell for it to work. should kill everyone but you.

i will optimize it later on. 
]]--
local plr=game.Players.LocalPlayer
ch=plr.Character
_G.oldCF=ch.HumanoidRootPart.CFrame
ch.HumanoidRootPart.Anchored=true
ch.HumanoidRootPart.CFrame=workspace.Peaches.HumanoidRootPart.CFrame--*CFrame.new(0,-5,0)
for a,b in pairs(game.Players:GetPlayers()) do
if b.UserId~=plr.UserId then
if b.Character~=nil then
local char=b.Character
if char:FindFirstChild("HumanoidRootPart")~=nil then

char.HumanoidRootPart.Anchored=true
char.HumanoidRootPart.CFrame=workspace.Peaches.LowerTorso.CFrame*CFrame.new(0,0,0)--*CFrame.Angles(0,math.pi/2,0)--math.random(-20,20)/10,0,math.random(-20,20)/10)
for c,d in pairs(char:GetDescendants()) do if d:IsA("BasePart") then d.CanCollide=false end end
--firetouchinterest(char.HumanoidRootPart,game.Workspace.Peaches.UpperTorso,1)
end end end end
ch.HumanoidRootPart.Anchored=false
--ch.HumanoidRootPart.CFrame=_G.oldCF
--_G.oldCF=nil
--[[

for c,d in pairs(char:GetDescendants()) do if d:IsA("BasePart") then d.CanCollide=true end end
for c,d in pairs(char:GetDescendants()) do
if d:IsA("BasePart") then d.CanCollide=true end end]]--