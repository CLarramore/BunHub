--[[

Isabelle Gets Held Back

]]--


function chat(message)

game:GetService 'ReplicatedStorage':WaitForChild 'DefaultChatSystemChatEvents'
	:WaitForChild 'SayMessageRequest':FireServer(message, 'All')
	
	
	print(message)
end



function solve(what)
local msg=what
if msg:match("%d+ [\+] %d+") then
local pattern=0
for a in msg:gmatch("%d+") do
pattern+=a
end 
wait(.5)
chat(tostring(pattern))
end

end

("the rating of my's presentation is 8 stars, so they earn 10 points"):match("the rating of (.+)'s presentation is (%d+) stars?, so they earn (%d+) points?")

function teacherchat(msg)
msg=msg:lower()

solve(msg)

if msg:match("how would you like to rate (.+)'s%spresentation?") then
wait(.5)
chat(tostring(math.random(10,50)/10))
end
if msg:match("who wants to present") then
wait(.5)
chat("me")
end 

end

--teacherchat("what 8 + 8")


game.Chat.Chatted:connect(function(part,msg)
if part==workspace.Teacher.Head then

teacherchat(msg)

--print(("10 + 10 equals"):match("%d+ [\+] %d+"))
end

end)

--[[
local mathme="whats 1 + 5"
local pattern=0
if mathme:match("%d+ [\+] %d+") then

for a in mathme:gmatch("%d+") do
print(a)
pattern+=a
end end print(pattern)]]--