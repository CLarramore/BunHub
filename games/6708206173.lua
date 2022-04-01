-- Made by Brickmane#0447
-- fixed by swat turret#5653

local Players = game:GetService("Players")

function changeName(n)
	local A_1 = "Update"
	local A_2 = {
		["DescriptionText"] = n,
		["ImageId"] = nil,
	}
	local event = game:GetService("ReplicatedStorage").CustomiseBooth
	event:FireServer(A_1, A_2)
end

function changeImage(n)
	local A_1 = "Update"
	local A_2 = {
		["DescriptionText"] = nil,
		["ImageId"] = n,
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

changeName("Talking Ben")
changeImage(8962954473)

Players.PlayerChatted:Connect(function(chatType, plr, message) --When a player speaks
	if chatType ~= Enum.PlayerChatType.All then return end
	if
		(Players.LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
		<= 12
	then
	local responses={"Yes.","No.","Hohoho","Ugh."}
		changeName(responses[math.random(1,#responses)])
		print(message, plr) -- chat log
		task.wait(4)
		changeName("Talking ben") --The function is called
	end
end)
