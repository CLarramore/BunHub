local lag,UIS=false,game:GetService("UserInputService")

function pressed(what)
if what.KeyCode==Enum.KeyCode.Home then
lag=not lag
if lag then
settings():GetService("NetworkSettings").IncomingReplicationLag=1000
else
settings():GetService("NetworkSettings").IncomingReplicationLag=0
end end end

UIS.InputBegan:connect(pressed)