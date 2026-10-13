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
for _,g in pairs(pg:GetChildren()) do if g.Name=="RoaringKnightUI" then g:Destroy() end end
local gui=Instance.new("ScreenGui")
gui.Name="RoaringKnightUI" gui.ResetOnSpawn=false gui.IgnoreGuiInset=true gui.Parent=pg
pcall(function() hum.WalkSpeed=56 end)

local idleT,walkT,slashT,dashT
local function loadAnims()
    pcall(function()
        for _,t in pairs(hum:GetPlayingAnimationTracks()) do pcall(function() t:Stop() t:Destroy() end) end
        local a=char:FindFirstChild("Animate") if a then a:Destroy() end
        local a1=Instance.new("Animation") a1.AnimationId="rbxassetid://77003893779553"
        idleT=hum:LoadAnimation(a1) idleT.Looped=true idleT.Priority=Enum.AnimationPriority.Idle idleT:Play()
        local a2=Instance.new("Animation") a2.AnimationId="rbxassetid://70647917361899"
        walkT=hum:LoadAnimation(a2) walkT.Looped=true walkT.Priority=Enum.AnimationPriority.Movement walkT:Play()
        local a3=Instance.new("Animation") a3.AnimationId="rbxassetid://522635514"
        slashT=hum:LoadAnimation(a3) slashT.Priority=Enum.AnimationPriority.Action
        local a4=Instance.new("Animation") a4.AnimationId="rbxassetid://3333499562"
        dashT=hum:LoadAnimation(a4) dashT.Priority=Enum.AnimationPriority.Action
    end)
end
loadAnims()

local function press(b,cb)
    b.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then pcall(cb) end
    end)
end

local function mk(txt,pos,sz,col)
    local b=Instance.new("TextButton")
    b.Size=sz b.Position=pos
    b.BackgroundColor3=col b.BackgroundTransparency=0.2
    b.Text=txt b.TextColor3=Color3.new(1,1,1) b.TextScaled=true
    b.Font=Enum.Font.GothamBold b.Parent=gui b.AutoButtonColor=true b.Active=true
    Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
    local s=Instance.new("UIStroke",b) s.Color=Color3.fromRGB(150,0,255) s.Thickness=2
    return b
end

local bs=UDim2.new(0,85,0,85)
local bQ=mk("Q\nРывок",UDim2.new(0,15,1,-105),bs,Color3.fromRGB(80,0,120))
local bE=mk("SLASH",UDim2.new(0,105,1,-105),bs,Color3.fromRGB(120,0,60))
local bR=mk("R\nКристалл",UDim2.new(0,15,1,-15),bs,Color3.fromRGB(60,0,120))
local bF=mk("ROAR",UDim2.new(0,105,1,-15),bs,Color3.fromRGB(80,0,140))
local bP=mk("PLATFORM",UDim2.new(1,-105,1,-200),UDim2.new(0,85,0,85),Color3.fromRGB(80,0,120))
local bD=mk("DESCEND",UDim2.new(1,-105,1,-110),UDim2.new(0,85,0,85),Color3.fromRGB(100,0,0))

pcall(function()
    local h=Instance.new("Highlight")
    h.FillTransparency=1 h.OutlineColor=Color3.new(1,1,1)
    h.OutlineTransparency=0 h.Parent=char
end)
pcall(function()
    local h=Instance.new("Highlight")
    h.FillTransparency=1 h.OutlineColor=Color3.new(0,0,0)
    h.OutlineTransparency=0 h.Adornee=workspace h.Parent=gui
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
    for _,v in pairs(char:GetChildren()) do
        if v.Name=="KnightSword" or v.Name=="KnightSwordAcc" then
            pcall(function() v:Destroy() end)
        end
    end
    local acc=Instance.new("Accessory")
    acc.Name="KnightSwordAcc"
    local handle=Instance.new("Part")
    handle.Name="Handle" handle.Size=Vector3.new(0.4,0.4,7)
    handle.BrickColor=BrickColor.new("Really black")
    handle.Material=Enum.Material.Neon
    handle.Color=Color3.fromRGB(80,0,120)
    handle.CanCollide=false handle.Massless=true handle.Parent=acc
    local grip=Instance.new("Attachment")
    grip.Name="RightGripAttachment"
    grip.Position=Vector3.new(0,0,-3.5)
    grip.Parent=handle
    local ok=pcall(function() hum:AddAccessory(acc) end)
    if not ok then
        local sw=Instance.new("Part")
        sw.Name="KnightSword" sw.Size=Vector3.new(0.35,0.35,7)
        sw.BrickColor=BrickColor.new("Really black")
        sw.Material=Enum.Material.Neon
        sw.Color=Color3.fromRGB(80,0,120)
        sw.CanCollide=false sw.Massless=true sw.Parent=char
        local rh=char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm") or rp
        local w=Instance.new("Weld")
        w.Part0=rh w.Part1=sw
        w.C0=CFrame.new(0,-0.5,-3.5)
        w.Parent=sw
    end
end)

pcall(function()
    local roar=Instance.new("Sound")
    roar.SoundId="rbxassetid://72750019250769"
    roar.Volume=0.4 roar.Looped=true roar.PlaybackSpeed=0.1
    roar.Parent=rp roar:Play()
end)local dA1=Instance.new("Attachment") dA1.Position=Vector3.new(0,-1.5,0) dA1.Parent=rp
local dA2=Instance.new("Attachment") dA2.Position=Vector3.new(0,1.5,0) dA2.Parent=rp
local dTrail=Instance.new("Trail")
dTrail.Attachment0=dA1 dTrail.Attachment1=dA2
dTrail.Color=ColorSequence.new(Color3.new(0,0,0))
dTrail.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.1),NumberSequenceKeypoint.new(1,1)})
dTrail.Lifetime=0.7 dTrail.Enabled=false dTrail.Parent=rp

UIS.JumpRequest:Connect(function()
    pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) hum.Jump=true end)
end)
task.spawn(function()
    while task.wait(1) do
        for _,d in pairs(pg:GetDescendants()) do
            if d:IsA("GuiButton") and d.Name:lower():find("jump") and not d:GetAttribute("KH") then
                d:SetAttribute("KH",true)
                d.InputBegan:Connect(function()
                    pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) hum.Jump=true end)
                end)
            end
        end
    end
end)

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
                b.Parent=t.r D:AddItem(b,0.3)
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
        local cl=c.CFrame.LookVector local cr=c.CFrame.RightVector
        local cf=Vector3.new(cl.X,0,cl.Z) if cf.Magnitude>0.001 then cf=cf.Unit end
        local crf=Vector3.new(cr.X,0,cr.Z) if crf.Magnitude>0.001 then crf=crf.Unit end
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
    local d=dir() local sp=rp.Position local tp=sp+d*70
    local wa=rp.Anchored
    pcall(function() rp.Anchored=true end)
    local el=0 local conn
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
endlocal P=game:GetService("Players")
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
for _,g in pairs(pg:GetChildren()) do if g.Name=="RKUI" then g:Destroy() end end
local gui=Instance.new("ScreenGui")
gui.Name="RKUI" gui.ResetOnSpawn=false gui.IgnoreGuiInset=true gui.Parent=pg
pcall(function() hum.WalkSpeed=56 end)