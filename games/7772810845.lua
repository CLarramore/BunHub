--[[

Isabelle Gets Held Back

]]--
local Players=game:GetService("Players")
local Mercury=loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local chatter=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/simsimi.lua"))()
local credit=loadstring(game:HttpGet("https://raw.githubusercontent.com/CLarramore/BunHub/main/libraries/credit.lua"))()
local responders={
auto=true,
mathquestions=true,
claim=true,
secondclaim=true,
rating=true,
};
local chatbotsettings={
Name="Ribbon";
Enabled=true;
Distance=20;
};

chat=function(message)

--rconsoleprint(message)
game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(message, 'All')
game.Players:Chat(message)


end

local gui=Mercury:Create{
Name="Presentation Experience";
Theme=Mercury.Themes.Serika;
Link="https://github.com/CLarramore/BunHub";
};

Window=gui

Window:Credit{
Name=credit.Creator.Name;
Description="Creator of the GUI";
Discord=credit.Creator.Discord;
V3rm="CLoggermore";
}
Window:Credit{
Name="Simsimi";
Description="Chatbot";
}
Window:Credit{
Name="Hoang Giap";
Description="Creator of the Simsimi API that I use.";
};

local AutoResponder=gui:Tab{
Name="Autoresponder";
};

AutoResponder:Toggle{
Name="Autoresponder";
Description="Completely turns on the autoresponder";
StartingState=responders.auto;
Callback=function(state) responders.auto=state end;
}

local Responder=AutoResponder:Section{
Name="Teacher's Responses";
};


Responder:Toggle{
Name="Auto Solve";
Description="Solves all math questions";
StartingState=responders.mathquestions;
Callback=function(state) responders.mathquestions=state end;
};

Responder:Toggle{
Name="Auto Claim";
Description="Automatically tries to claim your spot.";
StartingState=responders.claim;
Callback=function(state) responders.claim=state end;
};

Responder:Toggle{
Name="Auto Claim^2";
Description="Also claims your spot when presenting with a partner.";
StartingState=responders.secondclaim;
Callback=function(state) responders.secondclaim=state end;
};

Responder:Toggle{
Name="Auto Rate";
Description="Automatically rates each presentation.";
StartingState=responders.rating;
Callback=function(state) responders.rating=state end;
};

-- Chatbot Libs --

local Ribbon=chatter:new({language="en",chatfuel="True"})

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



-- The Functions --

function solve(what)
local msg=what
if msg:match("%d+ [\+] %d+") then
local pattern=0
for a in msg:gmatch("%d+") do
pattern+=a
end 
wait(.15)
chat(tostring(pattern))
end

end

--("the rating of my's presentation is 8 stars, so they earn 10 points"):match("the rating of (.+)'s presentation is (%d+) stars?, so they earn (%d+) points?")

function teacherchat(msg)
print(msg)
msg=msg:lower()
if responders.auto then 
print("E")
if responders.mathquestions then
solve(msg)
end

if msg:match("how would you like to rate") and responders.rating then-- (.+)'s%spresentation?") then
wait()
chat(tostring(math.random(10,50)/10))
end

if msg:match("who wants to present") and responders.claim then
wait(.075)
chat("me")
elseif msg:match("who will present with") and responders.secondclaim then
wait(.075)
chat("me")
end 


end

end

--teacherchat("what 8 + 8")


game.Chat.Chatted:connect(function(part,msg)
if part.Name=="Head" and part.Parent:FindFirstChildOfClass("Humanoid")~=nil then

teacherchat(msg)

--print(("10 + 10 equals"):match("%d+ [\+] %d+"))
end

end)


function Respond(message)
local response=Ribbon:response(message)
response=response:gsub("_ ",""):gsub("_",""):gsub("\n","")
   if response:match("Please teach me") or response=="You love it ya ye" then else
   game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer(""..chatbotsettings.Name..": "..response, 'All')
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


--[[
local mathme="whats 1 + 5"
local pattern=0
if mathme:match("%d+ [\+] %d+") then

for a in mathme:gmatch("%d+") do
print(a)
pattern+=a
end end print(pattern)]]--