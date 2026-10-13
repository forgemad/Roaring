local P,R,U,D,T=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("Debris"),game:GetService("TweenService")
local p=P.LocalPlayer
local g=p:WaitForChild("PlayerGui",5)
local c=p.Character or p.CharacterAdded:Wait()
local h=c:WaitForChild("Humanoid",10)
local r=c:WaitForChild("HumanoidRootPart",10)
h.WalkSpeed=56
for _,v in pairs(g:GetChildren())do if v.Name=="RK"then v:Destroy()end end
local s=Instance.new("ScreenGui")
s.Name="RK" s.ResetOnSpawn=false s.IgnoreGuiInset=true s.Parent=glocal function b(t,x,y)
local v=Instance.new("TextButton")
v.Size=UDim2.new(0,85,0,85)
v.Position=UDim2.new(0,x,1,y)
v.BackgroundColor3=Color3.fromRGB(80,0,120)
v.BackgroundTransparency=0.2
v.Text=t v.TextColor3=Color3.new(1,1,1)
v.TextScaled=true v.Font=Enum.Font.GothamBold
v.Parent=s
Instance.new("UICorner",v).CornerRadius=UDim.new(1,0)
return v
endlocal bQ=b("Q\nРывок",15,-105)
local bE=b("SLASH",105,-105)
local bR=b("R\nКристалл",15,-15)
local bF=b("ROAR",105,-15)local function pr(v,f)v.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then pcall(f)end end)end
for _,q in pairs(c:GetChildren())do
if q:IsA("BasePart")and q.Name~="HumanoidRootPart"then
q.BrickColor=BrickColor.new("Really black")
q.Material=Enum.Material.SmoothPlastic
end endlocal a=Instance.new("Accessory")
local hd=Instance.new("Part")
hd.Name="Handle" hd.Size=Vector3.new(0.4,0.4,7)
hd.BrickColor=BrickColor.new("Really black")
hd.Material=Enum.Material.Neon hd.Color=Color3.fromRGB(80,0,120)
hd.CanCollide=false hd.Massless=true hd.Parent=a
local gr=Instance.new("Attachment")
gr.Name="RightGripAttachment"
gr.Position=Vector3.new(0,0,-3.5) gr.Parent=hd
pcall(function()h:AddAccessory(a)end)pcall(function()
local rs=Instance.new("Sound")
rs.SoundId="rbxassetid://72750019250769"
rs.Volume=0.4 rs.Looped=true rs.PlaybackSpeed=0.1
rs.Parent=r rs:Play()
end)U.JumpRequest:Connect(function()
pcall(function()h:ChangeState(Enum.HumanoidStateType.Jumping)h.Jump=true end)
end)
task.spawn(function()while task.wait(1)do
for _,d in pairs(g:GetDescendants())do
if d:IsA("GuiButton")and d.Name:lower():find("jump")and not d:GetAttribute("K")then
d:SetAttribute("K",true)
d.InputBegan:Connect(function()pcall(function()h:ChangeState(Enum.HumanoidStateType.Jumping)h.Jump=true end)end)
end end end end)local function tg(o,z)
local a={}
for _,q in pairs(P:GetPlayers())do if q~=p then
local ch=q.Character
if ch then
local rr=ch:FindFirstChild("HumanoidRootPart")
local hh=ch:FindFirstChildOfClass("Humanoid")
if rr and hh and hh.Health>0 and(o-rr.Position).Magnitude<=z then a[#a+1]={h=hh,r=rr}end
end end end
return a
endlocal function dm(ts,d,k,o,f)
for _,t in pairs(ts)do
if t.h and t.h.Parent and t.h.Health>0 then
if f then
pcall(function()t.h:TakeDamage(t.h.MaxHealth*10)end)
pcall(function()t.h.Health=0 end)
else pcall(function()t.h:TakeDamage(d)end)end
if k and t.r then
local dv=t.r.Position-(o or r.Position)
if dv.Magnitude>0.01 then dv=dv.Unit else dv=Vector3.new(0,1,0)end
local bv=Instance.new("BodyVelocity")
bv.Velocity=dv*k+Vector3.new(0,30,0)
bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)
bv.Parent=t.r D:AddItem(bv,0.3)
end end end endlocal function dr()
local cm=workspace.CurrentCamera
if not cm then return Vector3.new(0,0,-1)end
if h.MoveDirection.Magnitude>0.1 then return h.MoveDirection.Unit end
local ok,mv=pcall(function()return U:GetMoveVector()end)
if ok and mv and mv.Magnitude>0.1 then
local cl=cm.CFrame.LookVector
local cr=cm.CFrame.RightVector
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
return Vector3.new(0,0,-1)
endlocal ds=false
local function da()
if ds then return end
ds=true
local d=dr()
local sp=r.Position
local tp=sp+d*70
local wa=r.Anchored
r.Anchored=true
local el=0
local cn
cn=R.RenderStepped:Connect(function(dt)
if not r.Parent then
cn:Disconnect() r.Anchored=wa ds=false return
endel=el+dt
local a=math.min(el/0.3,1)
local e=1-(1-a)*(1-a)
local np=sp:Lerp(tp,e)
r.CFrame=CFrame.new(np,np+d)
if a>=1 then
cn:Disconnect()
r.Anchored=wa
ds=false
end
end)
task.spawn(function()
for i=1,20 do task.wait(0.015)
if r and r.Parent then dm(tg(r.Position,6),9999,0,r.Position,true)end
end end)
endlocal lS=0
local function sl()
if tick()-lS<1.5 then return end
lS=tick()
local d=dr()
local o=r.Position+d*3
local cc=o+d*20
local bm=Instance.new("Part")
bm.Size=Vector3.new(4,4,40)
bm.CFrame=CFrame.new(cc,cc+d)
bm.Material=Enum.Material.SmoothPlastic
bm.Color=Color3.fromRGB(0,0,0)
bm.Anchored=true bm.CanCollide=false
bm.Parent=workspacelocal ot=Instance.new("Part")
ot.Size=Vector3.new(4.6,4.6,40)
ot.CFrame=bm.CFrame
ot.Material=Enum.Material.Neon
ot.Color=Color3.fromRGB(80,0,120)
ot.Transparency=0.4
ot.Anchored=true ot.CanCollide=false
ot.Parent=bm
D:AddItem(bm,0.5)
local ht={}local hs={}
for i=1,10 do
local pt=o+d*(40*i/10)
for _,t in pairs(tg(pt,7))do
if not hs[t.h]then hs[t.h]=true ht[#ht+1]=t end
end end
dm(ht,25,80,o,false)
endlocal cB=false
local function cr()
if cB then return end
cB=true
for i=1,15 do
task.spawn(function()
local cc=Instance.new("Part")
cc.Size=Vector3.new(2.5,2.5,0.1)
cc.Transparency=1 cc.CanCollide=false
cc.Anchored=true cc.Parent=workspace
local s1=Instance.new("Decal",cc)
s1.Texture="rbxassetid://6031075931"
s1.Face=Enum.NormalId.Front
local s2=Instance.new("Decal",cc)
s2.Texture="rbxassetid://6031075931"
s2.Face=Enum.NormalId.Backcc.CFrame=r.CFrame*CFrame.new(math.random(-3,3),math.random(0,5),math.random(-2,2)-3)
cc.Anchored=false
local bv=Instance.new("BodyVelocity")
local sd=(workspace.CurrentCamera.CFrame.LookVector+Vector3.new(math.random(-15,15)/100,math.random(-10,10)/100,0)).Unit
bv.Velocity=sd*80
bv.MaxForce=Vector3.new(1e6,1e6,1e6)
bv.Parent=cc
cc.Touched:Connect(function(hit)
local hh=hit.Parent:FindFirstChildOfClass("Humanoid")
if hh and hh.Health>0 and hit.Parent~=c then
hh:TakeDamage(5) cc:Destroy()
end end)
D:AddItem(cc,2)
end)
task.wait(0.05)
end
task.wait(0.1) cB=false
endlocal ch=false cS=0 cSp=nil cC=nil
local function st()
if ch then return end
ch=true cS=tick()
cSp=Instance.new("Part")
cSp.Shape=Enum.PartType.Ball
cSp.Size=Vector3.new(16,16,16)
cSp.Material=Enum.Material.ForceField
cSp.Color=Color3.new(1,1,1)
cSp.Transparency=0.5
cSp.Anchored=true cSp.CanCollide=false
cSp.Parent=workspace
cC=R.RenderStepped:Connect(function()
if not ch or not cSp or not cSp.Parent then return end
local el=math.min(tick()-cS,2)
local t=el/2
local rr=8+32*t
cSp.Size=Vector3.new(rr*2,rr*2,rr*2)
cSp.CFrame=CFrame.new(r.Position)
end)
endpr(bQ,da)
pr(bE,sl)
pr(bR,cr)
bF.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then st()end end)
bF.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then rl()end end)local function rl()
if not ch then return end
ch=false
if cC then cC:Disconnect() cC=nil end
if cSp then cSp:Destroy() cSp=nil end
local el=math.min(tick()-cS,2)
local t=el/2
local rr=8+32*t
local o=r.Position
local e=Instance.new("Part")
e.Shape=Enum.PartType.Ball
e.Size=Vector3.new(rr*2,rr*2,rr*2)
e.Material=Enum.Material.Neon
e.Color=Color3.new(1,1,1)
e.Transparency=0.1
e.Anchored=true e.CanCollide=false
e.CFrame=CFrame.new(o) e.Parent=workspace
D:AddItem(e,0.4)
dm(tg(o,rr),9999,100,o,true)
endU.InputBegan:Connect(function(i,gp)
if gp then return end
if i.KeyCode==Enum.KeyCode.Q then da()
elseif i.KeyCode==Enum.KeyCode.E then sl()
elseif i.KeyCode==Enum.KeyCode.R then cr()
elseif i.KeyCode==Enum.KeyCode.F then st()end
end)
U.InputEnded:Connect(function(i)
if i.KeyCode==Enum.KeyCode.F then rl()end
end)