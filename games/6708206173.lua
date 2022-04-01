-- Made by Brickmane#0447 pls dont remove credit :(

local Players = game:GetService("Players")


function changeName(n)
local A_1 = "Update"
local A_2 = 
{
    ["DescriptionText"] = n, 
    ["ImageId"] = nil
}
local event = game:GetService("ReplicatedStorage").CustomiseBooth
event:FireServer(A_1, A_2)
end

function changeImage(n)
local A_1 = "Update"
local A_2 = 
{
    ["DescriptionText"] = nil, 
    ["ImageId"] = n
}
local event = game:GetService("ReplicatedStorage").CustomiseBooth
event:FireServer(A_1, A_2)
end




local function BenDialogue()
	local Randomize = math.random(1, 4)
	if Randomize == 1 then
		changeName("Yes.")
	elseif Randomize == 2 then
		changeName("No.")
	elseif Randomize == 3 then
		changeName("HOHOHO")
    elseif Randomize == 4 then
		changeName("Ough.")
    end
end




changeName("Talking Ben \n (cant use mic)")
changeImage(8962954473)

Players.PlayerChatted:Connect(function(plr, message) --When a player speaks
    for _,plrs in pairs(game.Players:GetPlayers()) do
	
	if (Players.LocalPlayer.Character.HumanoidRootPart.Position - plrs.Character.HumanoidRootPart.Position).magnitude <= 12 then 
		if plr.Name == plrs.Name then
		local responses={"Yes.","No.","Hohoho","Ugh."}
		    changeName(responses[math.random(1,#responses)])
            print(message, plr) -- chat log
            task.wait(4)
            changeName("Talking Ben \n (cant use mic)") --The function is called
		end
	end
	
end
end)