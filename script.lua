local P=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local D=game:GetService("Debris")
local T=game:GetService("TweenService")
local plr=P.LocalPlayer
local pg=plr:WaitForChild("PlayerGui",5)
if not pg then return end
local char=plr.Character or plr.CharacterAdded:Wait()
if not char.Parent then char.AncestryChanged:Wait() end
local hum=char:WaitForChild("Humanoid",10)
local rp=char:WaitForChild("HumanoidRootPart",10)
if not hum or not rp then return end
for _,g in pairs(pg:GetChildren()) do
if g.Name=="RKUI" then g:Destroy() end
end
local gui=Instance.new("ScreenGui")
gui.Name="RKUI"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.Parent=pg
pcall(function() hum.WalkSpeed=56 end)
local idleT,walkT,slashT,dashT
local function loadAnims()
pcall(function()
for _,t in pairs(hum:GetPlayingAnimationTracks()) do t:Stop() t:Destroy() end
local a=char:FindFirstChild("Animate")
if a then a:Destroy() end
local x1=Instance.new("Animation")
x1.AnimationId="rbxassetid://77003893779553"
idleT=hum:LoadAnimation(x1)
idleT.Looped=true
idleT.Priority=Enum.AnimationPriority.Idle
idleT:Play()
local x2=Instance.new("Animation")
x2.AnimationId="rbxassetid://70647917361899"
walkT=hum:LoadAnimation(x2)
walkT.Looped=true
walkT.Priority=Enum.AnimationPriority.Movement
walkT:Play()
local x3=Instance.new("Animation")
x3.AnimationId="rbxassetid://522635514"
slashT=hum:LoadAnimation(x3)
slashT.Priority=Enum.AnimationPriority.Action
local x4=Instance.new("Animation")
x4.AnimationId="rbxassetid://3333499562"
dashT=hum:LoadAnimation(x4)
dashT.Priority=Enum.AnimationPriority.Action
end)
end
loadAnims()
local function press(b,cb)
b.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
pcall(cb)
end
end)
end
local function mk(txt,pos,sz,col,ap)
local b=Instance.new("TextButton")
b.Size=sz
b.Position=pos
if ap then b.AnchorPoint=ap end
b.BackgroundColor3=col
b.BackgroundTransparency=0.2
b.Text=txt
b.TextColor3=Color3.new(1,1,1)
b.TextScaled=true
b.Font=Enum.Font.GothamBold
b.Parent=gui
b.Active=true
local c=Instance.new("UICorner")
c.CornerRadius=UDim.new(1,0)
c.Parent=b
local s=Instance.new("UIStroke")
s.Color=Color3.fromRGB(150,0,255)
s.Thickness=2
s.Parent=b
return b
end
local bs=UDim2.new(0,85,0,85)
local bQ=mk("Q\nРывок",UDim2.new(0,15,1,-105),bs,Color3.fromRGB(80,0,120),Vector2.new(0,1))
local bE=mk("SLASH",UDim2.new(0,105,1,-105),bs,Color3.fromRGB(120,0,60),Vector2.new(0,1))
local bR=mk("R\nКристалл",UDim2.new(0,15,1,-15),bs,Color3.fromRGB(60,0,120),Vector2.new(0,1))
local bF=mk("ROAR",UDim2.new(0,105,1,-15),bs,Color3.fromRGB(80,0,140),Vector2.new(0,1))
local bP=mk("PLATFORM",UDim2.new(1,-15,1,-165),UDim2.new(0,75,0,75),Color3.fromRGB(80,0,120),Vector2.new(1,1))
local bD=mk("DESCEND",UDim2.new(1,-15,1,-85),UDim2.new(0,75,0,75),Color3.fromRGB(100,0,0),Vector2.new(1,1))pcall(function()
local h=Instance.new("Highlight")
h.FillTransparency=1
h.OutlineColor=Color3.new(1,1,1)
h.OutlineTransparency=0
h.Parent=char
end)
pcall(function()
local h=Instance.new("Highlight")
h.FillTransparency=1
h.OutlineColor=Color3.new(0,0,0)
h.OutlineTransparency=0
h.Adornee=workspace
h.Parent=gui
end)
pcall(function()
for _,p in pairs(char:GetChildren()) do
if p:IsA("BasePart") and p.Name~="HumanoidRootPart" then
p.BrickColor=BrickColor.new("Really black")
p.Material=Enum.Material.SmoothPlastic
end
end
end)
pcall(function()
local acc=Instance.new("Accessory")
acc.Name="KnightSwordAcc"
local handle=Instance.new("Part")
handle.Name="Handle"
handle.Size=Vector3.new(0.4,0.4,7)
handle.BrickColor=BrickColor.new("Really black")
handle.Material=Enum.Material.Neon
handle.Color=Color3.fromRGB(80,0,120)
handle.CanCollide=false
handle.Massless=true
handle.Parent=acc
local grip=Instance.new("Attachment")
grip.Name="RightGripAttachment"
grip.Position=Vector3.new(0,0,-3.5)
grip.Parent=handle
local ok=pcall(function() hum:AddAccessory(acc) end)
if not ok then
acc:Destroy()
end
end)
pcall(function()
local roar=Instance.new("Sound")
roar.SoundId="rbxassetid://72750019250769"
roar.Volume=0.4
roar.Looped=true
roar.PlaybackSpeed=0.1
roar.Parent=rp
roar:Play()
end)
local dA1=Instance.new("Attachment")
dA1.Position=Vector3.new(0,-1.5,0)
dA1.Parent=rp
local dA2=Instance.new("Attachment")
dA2.Position=Vector3.new(0,1.5,0)
dA2.Parent=rp
local dTrail=Instance.new("Trail")
dTrail.Attachment0=dA1
dTrail.Attachment1=dA2
dTrail.Color=ColorSequence.new(Color3.new(0,0,0))
dTrail.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0.1),
NumberSequenceKeypoint.new(1,1)
})
dTrail.Lifetime=0.7
dTrail.Enabled=false
dTrail.Parent=rp
UIS.JumpRequest:Connect(function()
pcall(function()
hum:ChangeState(Enum.HumanoidStateType.Jumping)
hum.Jump=true
end)
end)
task.spawn(function()
while task.wait(1) do
for _,d in pairs(pg:GetDescendants()) do
if d:IsA("GuiButton") and d.Name:lower():find("jump") and not d:GetAttribute("KH") then
d:SetAttribute("KH",true)
d.InputBegan:Connect(function()
pcall(function()
hum:ChangeState(Enum.HumanoidStateType.Jumping)
hum.Jump=true
end)
end)
end
end
end
end)
local lastS=0
local function slash()
if tick()-lastS<1.5 then return end
lastS=tick()
if slashT then
pcall(function() slashT:Play(0.1) end)
task.delay(0.6,function() if slashT then pcall(function() slashT:Stop(0.1) end) end end)
end
local d=dir()
local o=rp.Position+d*3
local c=o+d*20
local beam=Instance.new("Part")
beam.Size=Vector3.new(4,4,40)
beam.CFrame=CFrame.new(c,c+d)
beam.Material=Enum.Material.SmoothPlastic
beam.Color=Color3.fromRGB(0,0,0)
beam.Anchored=true
beam.CanCollide=false
beam.Parent=workspace
local out=Instance.new("Part")
out.Size=Vector3.new(4.6,4.6,40)
out.CFrame=beam.CFrame
out.Material=Enum.Material.Neon
out.Color=Color3.fromRGB(80,0,120)
out.Transparency=0.4
out.Anchored=true
out.CanCollide=false
out.Parent=beam
D:AddItem(beam,0.5)
pcall(function()
local s=Instance.new("Sound")
s.SoundId="rbxassetid://9125402735"
s.Volume=1.2
s.PlaybackSpeed=0.9
s.Parent=rp
s:Play()
D:AddItem(s,2)
end)
local ht={}
local hs={}
for i=1,10 do
local pt=o+d*(40*i/10)
for _,t in pairs(targets(pt,7)) do
if not hs[t.h] then
hs[t.h]=true
table.insert(ht,t)
end
end
end
dmg(ht,25,80,o,false)
end
local cBusy=false
local function crystal()
if cBusy then return end
cBusy=true
for i=1,15 do
task.spawn(function()
local c=Instance.new("Part")
c.Size=Vector3.new(2.5,2.5,0.1)
c.Transparency=1
c.CanCollide=false
c.Anchored=true
c.Parent=workspace
local s1=Instance.new("Decal")
s1.Texture="rbxassetid://6031075931"
s1.Face=Enum.NormalId.Front
s1.Parent=c
local s2=Instance.new("Decal")
s2.Texture="rbxassetid://6031075931"
s2.Face=Enum.NormalId.Back
s2.Parent=c
c.CFrame=rp.CFrame*CFrame.new(math.random(-3,3),math.random(0,5),math.random(-2,2)-3)
c.Anchored=false
local bv=Instance.new("BodyVelocity")
local sd=(workspace.CurrentCamera.CFrame.LookVector+Vector3.new(math.random(-15,15)/100,math.random(-10,10)/100,0)).Unit
bv.Velocity=sd*(70+math.random(0,30))
bv.MaxForce=Vector3.new(1e6,1e6,1e6)
bv.Parent=c
local al=Instance.new("BodyGyro")
al.MaxTorque=Vector3.new(1e6,1e6,1e6)
al.P=1e5
al.Parent=c
local cn
cn=RS.RenderStepped:Connect(function()
if not c or not c.Parent then
if cn then cn:Disconnect() end
return
end
local cam=workspace.CurrentCamera
if cam then al.CFrame=CFrame.new(c.Position,c.Position+cam.CFrame.LookVector) end
end)
c.Touched:Connect(function(hit)
local h=hit.Parent:FindFirstChildOfClass("Humanoid")
if h and h.Health>0 and hit.Parent~=char then
h:TakeDamage(5)
if cn then cn:Disconnect() end
c:Destroy()
end
end)
D:AddItem(c,2)
end)
task.wait(0.05)
end
task.wait(0.1)
cBusy=false
end
local function targets(o,r)
local t={}
for _,p in pairs(P:GetPlayers()) do
if p~=plr then
local c=p.Character
if c then
local rr=c:FindFirstChild("HumanoidRootPart")
local h=c:FindFirstChildOfClass("Humanoid")
if rr and h and h.Health>0 and (o-rr.Position).Magnitude<=r then
table.insert(t,{h=h,r=rr})
end
end
end
end
return t
end
local function dmg(ts,d,kb,o,fk)
for _,t in pairs(ts) do
if t.h and t.h.Parent and t.h.Health>0 then
if fk then
pcall(function() t.h:TakeDamage(t.h.MaxHealth*10) end)
pcall(function() t.h.Health=0 end)
task.spawn(function()
for i=1,5 do
task.wait(0.05)
if not t.h or not t.h.Parent or t.h.Health<=0 then break end
pcall(function() t.h:TakeDamage(t.h.MaxHealth*10) end)
pcall(function() t.h.Health=0 end)
end
end)
else
pcall(function() t.h:TakeDamage(d) end)
end
if kb and t.r then
local d2=(t.r.Position-(o or rp.Position))
if d2.Magnitude>0.01 then d2=d2.Unit else d2=Vector3.new(0,1,0) end
local b=Instance.new("BodyVelocity")
b.Velocity=d2*kb+Vector3.new(0,30,0)
b.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
b.Parent=t.r
D:AddItem(b,0.3)
end
end
end
end
local function dir()
local c=workspace.CurrentCamera
if not c then return Vector3.new(0,0,-1) end
if hum.MoveDirection.Magnitude>0.1 then return hum.MoveDirection.Unit end
local ok,mv=pcall(function() return UIS:GetMoveVector() end)
if ok and mv and mv.Magnitude>0.1 then
local cl=c.CFrame.LookVector
local cr=c.CFrame.RightVector
local cf=Vector3.new(cl.X,0,cl.Z)
if cf.Magnitude>0.001 then cf=cf.Unit end
local crf=Vector3.new(cr.X,0,cr.Z)
if crf.Magnitude>0.001 then crf=crf.Unit end
local d=Vector3.new(0,0,0)
if mv.Z<-0.1 then d=d+cf end
if mv.Z>0.1 then d=d-cf end
if mv.X<-0.1 then d=d-crf end
if mv.X>0.1 then d=d+crf end
if d.Magnitude>0.01 then return d.Unit end
end
local cl=c.CFrame.LookVector
local fl=Vector3.new(cl.X,0,cl.Z)
if fl.Magnitude>0.01 then return fl.Unit end
return Vector3.new(0,0,-1)
end
local dashing=false
local function dash()
if dashing then return end
dashing=true
if dashT then
pcall(function() dashT:Play(0.05) end)
task.delay(0.4,function() if dashT then pcall(function() dashT:Stop(0.1) end) end end)
end
pcall(function() dTrail.Enabled=true end)
local d=dir()
local sp=rp.Position
local tp=sp+d*70
local wa=rp.Anchored
pcall(function() rp.Anchored=true end)
local el=0
local conn
conn=RS.RenderStepped:Connect(function(dt)
if not rp.Parent then
if conn then conn:Disconnect() end
pcall(function() rp.Anchored=wa end)
pcall(function() dTrail.Enabled=false end)
dashing=false
return
end
el=el+dt
local a=math.min(el/0.3,1)
local e=1-(1-a)*(1-a)
local np=sp:Lerp(tp,e)
rp.CFrame=CFrame.new(np,np+d)
if a>=1 then
if conn then conn:Disconnect() end
pcall(function() rp.Anchored=wa end)
task.delay(0.3,function() pcall(function() dTrail.Enabled=false end) end)
dashing=false
end
end)
task.spawn(function()
for i=1,20 do
task.wait(0.015)
if not rp or not rp.Parent then return end
dmg(targets(rp.Position,6),9999,0,rp.Position,true)
end
end)
end
local pPart,pConn,pActive,pY,desc
pActive=false
desc=false
pY=0
local function rmPlat()
if pConn then pConn:Disconnect() pConn=nil end
if pPart then pPart:Destroy() pPart=nil end
pActive=false
desc=false
end
local function mkPlat()
rmPlat()
local ok=pcall(function()
pY=rp.Position.Y-4
pPart=Instance.new("Part")
pPart.Name="KnightPlatform"
pPart.Size=Vector3.new(8,1,8)
pPart.BrickColor=BrickColor.new("Really black")
pPart.Material=Enum.Material.Neon
pPart.Color=Color3.fromRGB(120,0,200)
pPart.Anchored=true
pPart.CanCollide=true
pPart.Transparency=0.15
pPart.Parent=workspace
pConn=RS.RenderStepped:Connect(function(dt)
if not pPart or not pPart.Parent or not rp or not rp.Parent then return end
if desc then
pY=pY-12*dt
else
local q=rp.Position.Y
if q>pY+6 then pY=q-4 end
end
pPart.CFrame=CFrame.new(rp.Position.X,pY,rp.Position.Z)
end)
end)
if ok and pPart then pActive=true return true end
return false
end
local chg=false
local cS=0
local cSp=nil
local cC=nil
local function st()
if chg then return end
chg=true
cS=tick()
cSp=Instance.new("Part")
cSp.Shape=Enum.PartType.Ball
cSp.Size=Vector3.new(16,16,16)
cSp.Material=Enum.Material.ForceField
cSp.Color=Color3.new(1,1,1)
cSp.Transparency=0.5
cSp.Anchored=true
cSp.CanCollide=false
cSp.Parent=workspace
cC=RS.RenderStepped:Connect(function()
if not chg or not cSp or not cSp.Parent then return end
local el=math.min(tick()-cS,2)
local t=el/2
local rr=8+32*t
cSp.Size=Vector3.new(rr*2,rr*2,rr*2)
cSp.CFrame=CFrame.new(rp.Position)
end)
end
local function rl()
if not chg then return end
chg=false
if cC then cC:Disconnect() cC=nil end
if cSp then cSp:Destroy() cSp=nil end
local el=math.min(tick()-cS,2)
local t=el/2
local rr=8+32*t
local o=rp.Position
local e=Instance.new("Part")
e.Shape=Enum.PartType.Ball
e.Size=Vector3.new(rr*2,rr*2,rr*2)
e.Material=Enum.Material.Neon
e.Color=Color3.new(1,1,1)
e.Transparency=0.1
e.Anchored=true
e.CanCollide=false
e.CFrame=CFrame.new(o)
e.Parent=workspace
T:Create(e,TweenInfo.new(0.35),{Transparency=1,Size=Vector3.new(rr*3,rr*3,rr*3)}):Play()
D:AddItem(e,0.4)
pcall(function()
local s=Instance.new("Sound")
s.SoundId="rbxassetid://293168581"
s.Volume=0.4
s.PlaybackSpeed=0.9
s.Parent=rp
s:Play()
D:AddItem(s,3)
end)
dmg(targets(o,rr),9999,100,o,true)
end
press(bQ,function() dash() end)
press(bE,function() slash() end)
press(bR,function() crystal() end)
press(bP,function()
if pActive then
rmPlat()
bP.Text="PLATFORM"
bP.BackgroundColor3=Color3.fromRGB(80,0,120)
else
if mkPlat() then
bP.Text="STOP"
bP.BackgroundColor3=Color3.fromRGB(150,0,0)
end
end
end)
bF.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then st() end
end)
bF.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then rl() end
end)
bD.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
if pActive then desc=true end
end
end)
bD.InputEnded:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then desc=false end
end)
UIS.InputBegan:Connect(function(i,gp)
if gp then return end
if i.KeyCode==Enum.KeyCode.Q then dash()
elseif i.KeyCode==Enum.KeyCode.E then slash()
elseif i.KeyCode==Enum.KeyCode.R then crystal()
elseif i.KeyCode==Enum.KeyCode.F then st()
elseif i.KeyCode==Enum.KeyCode.G then
if pActive then
rmPlat()
bP.Text="PLATFORM"
bP.BackgroundColor3=Color3.fromRGB(80,0,120)
else
if mkPlat() then
bP.Text="STOP"
bP.BackgroundColor3=Color3.fromRGB(150,0,0)
end
end
elseif i.KeyCode==Enum.KeyCode.H then loadAnims() end
end)
UIS.InputEnded:Connect(function(i)
if i.KeyCode==Enum.KeyCode.F then rl() end
end)
