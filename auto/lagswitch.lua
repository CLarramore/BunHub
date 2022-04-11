local lag,UIS=false,game:GetService("UserInputService")

function pressed(what)
if what.KeyCode==Enum.KeyCode.Break then
lag=not lag
if lag then
settings().Network.IncomingReplicationLag=2000
else
settings().Network.IncomingReplicationLag=0
end end end

UIS.InputBegan:connect(pressed)