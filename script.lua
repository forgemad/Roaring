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
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            cb()
        end
    end)
    b.MouseButton1Click:Connect(function() pcall(cb) end)
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
endlocal bP=mk("PLATFORM",UDim2.new(1,-105,1,-200),UDim2.new(0,85,0,85),Color3.fromRGB(80,0,120))
local bD=mk("DESCEND",UDim2.new(1,-105,1,-110),UDim2.new(0,85,0,85),Color3.fromRGB(100,0,0))

local bSet=Instance.new("TextButton")
bSet.Size=UDim2.new(0,55,0,55) bSet.Position=UDim2.new(1,-75,0,15)
bSet.BackgroundColor3=Color3.fromRGB(40,40,40) bSet.BackgroundTransparency=0.2
bSet.Text="⚙" bSet.TextColor3=Color3.new(1,1,1) bSet.TextScaled=true
bSet.Font=Enum.Font.GothamBold bSet.Active=true bSet.Draggable=true bSet.Parent=gui
Instance.new("UICorner",bSet).CornerRadius=UDim.new(1,0)

local panel=Instance.new("Frame")
panel.Size=UDim2.new(0,300,0,320) panel.Position=UDim2.new(0.5,-150,0.5,-160)
panel.BackgroundColor3=Color3.fromRGB(25,15,40) panel.BackgroundTransparency=0.1
panel.Visible=false panel.Active=true panel.Draggable=true panel.Parent=gui
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)

local title=Instance.new("TextLabel",panel)
title.Size=UDim2.new(1,0,0,35) title.BackgroundColor3=Color3.fromRGB(50,20,80)
title.Text="⚙ НАСТРОЙКИ" title.TextColor3=Color3.new(1,1,1)
title.TextScaled=true title.Font=Enum.Font.GothamBold
Instance.new("UICorner",title).CornerRadius=UDim.new(0,12)

local btnClose=Instance.new("TextButton",panel)
btnClose.Size=UDim2.new(0,28,0,28) btnClose.Position=UDim2.new(1,-33,0,4)
btnClose.BackgroundColor3=Color3.fromRGB(150,0,0) btnClose.Text="✕"
btnClose.TextColor3=Color3.new(1,1,1) btnClose.TextScaled=true btnClose.Font=Enum.Font.GothamBold

local btnRA=Instance.new("TextButton",panel)
btnRA.Size=UDim2.new(0,260,0,45) btnRA.Position=UDim2.new(0,20,0,45)
btnRA.BackgroundColor3=Color3.fromRGB(80,0,120) btnRA.Text="↻  СБРОС АНИМАЦИЙ"
btnRA.TextColor3=Color3.new(1,1,1) btnRA.TextScaled=true btnRA.Font=Enum.Font.GothamBold

local btnRS=Instance.new("TextButton",panel)
btnRS.Size=UDim2.new(0,260,0,45) btnRS.Position=UDim2.new(0,20,0,100)
btnRS.BackgroundColor3=Color3.fromRGB(120,0,60) btnRS.Text="↺  СБРОС НАСТРОЕК"
btnRS.TextColor3=Color3.new(1,1,1) btnRS.TextScaled=true btnRS.Font=Enum.Font.GothamBold

local help=Instance.new("TextLabel",panel)
help.Size=UDim2.new(1,-20,0,155) help.Position=UDim2.new(0,10,0,160)
help.BackgroundTransparency=1 help.TextColor3=Color3.fromRGB(230,220,255)
help.TextXAlignment=Enum.TextXAlignment.Left help.TextYAlignment=Enum.TextYAlignment.Top
help.TextSize=13 help.Font=Enum.Font.Gotham help.TextWrapped=true
help.Text="УПРАВЛЕНИЕ:\nQ — Рывок (70 studs)\nSLASH — 25 урона\nR — 15 кристаллов\nROAR — зажми и отпусти\nPLATFORM — площадка\nDESCEND — зажми спуск"

press(bSet,function() panel.Visible=not panel.Visible end)
press(btnClose,function() panel.Visible=false end)
press(btnRA,function() loadAnims() end)
press(btnRS,function()
    pcall(function()
        hum.WalkSpeed=16 task.wait(0.1) hum.WalkSpeed=56
        local sp=workspace:FindFirstChildOfClass("SpawnLocation")
        if sp then rp.CFrame=CFrame.new(sp.Position+Vector3.new(0,5,0)) end
        loadAnims()
    end)
end)

pcall(function()
    local h=Instance.new("Highlight")
    h.FillTransparency=1 h.OutlineColor=Color3.new(1,1,1)
    h.OutlineTransparency=0 h.Parent=char
end)
pcall(function()
    local h=Instance.new("Highlight")
    h.FillTransparency=1 h.OutlineColor=Color3.new(0,0,0)
    h.OutlineTransparency=0 h.Adornee=workspace h.Parent=gui
end)local bs=UDim2.new(0,90,0,90)
local bQ=mk("Q\nРывок",UDim2.new(0,20,1,-20),bs,Color3.fromRGB(80,0,120))
local bE=mk("SLASH",UDim2.new(0,20,1,-120),bs,Color3.fromRGB(120,0,60))
local bR=mk("R\nКристалл",UDim2.new(0,20,1,-220),bs,Color3.fromRGB(60,0,120))
local bF=mk("ROAR",UDim2.new(0,20,1,-320),bs,Color3.fromRGB(80,0,140))pcall(function()
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
        w.Part0=rh w.Part1=sw w.C0=CFrame.new(0,-0.5,-3.5) w.Parent=sw
    end
end)

pcall(function()
    local roar=Instance.new("Sound")
    roar.Name="KnightRoarSound"
    roar.SoundId="rbxassetid://72750019250769"
    roar.Volume=0.4 roar.Looped=true roar.PlaybackSpeed=0.1
    roar.Parent=rp roar:Play()
end)

-- Чёрный след при рывке
local dA1=Instance.new("Attachment") dA1.Position=Vector3.new(0,-1.5,0) dA1.Parent=rp
local dA2=Instance.new("Attachment") dA2.Position=Vector3.new(0,1.5,0) dA2.Parent=rp
local dTrail=Instance.new("Trail")
dTrail.Attachment0=dA1 dTrail.Attachment1=dA2
dTrail.Color=ColorSequence.new({
    ColorSequenceKeypoint.new(0,Color3.new(0,0,0)),
    ColorSequenceKeypoint.new(0.5,Color3.fromRGB(30,0,50)),
    ColorSequenceKeypoint.new(1,Color3.new(0,0,0))
})
dTrail.Transparency=NumberSequence.new({
    NumberSequenceKeypoint.new(0,0.1),
    NumberSequenceKeypoint.new(1,1)
})
dTrail.Lifetime=0.7 dTrail.LightEmission=0 dTrail.Enabled=false
dTrail.Parent=rp

local dSmoke=Instance.new("ParticleEmitter")
dSmoke.Texture="rbxassetid://243660364"
dSmoke.Rate=0 dSmoke.Lifetime=NumberRange.new(0.6,1.2)
dSmoke.Speed=NumberRange.new(2,5)
dSmoke.Size=NumberSequence.new({
    NumberSequenceKeypoint.new(0,0.5),
    NumberSequenceKeypoint.new(1,3)
})
dSmoke.Transparency=NumberSequence.new({
    NumberSequenceKeypoint.new(0,0.3),
    NumberSequenceKeypoint.new(1,1)
})
dSmoke.Color=ColorSequence.new(Color3.new(0,0,0))
dSmoke.Parent=rpUIS.JumpRequest:Connect(function()
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
                pcall(function() t.h:ChangeState(Enum.HumanoidStateType.Dead) end)
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
    pcall(function() dSmoke:Emit(30) end)
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
        if math.random()<0.3 then pcall(function() dSmoke:Emit(5) end) end
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

local lastS=0
local function slash()
    if tick()-lastS<1.5 then return end
    lastS=tick()
    if slashT then
        pcall(function() slashT:Play(0.1) end)
        task.delay(0.6,function() if slashT then pcall(function() slashT:Stop(0.1) end) end end)
    end
    local d=dir() local o=rp.Position+d*3 local c=o+d*20
    local beam=Instance.new("Part")
    beam.Size=Vector3.new(4,4,40) beam.CFrame=CFrame.new(c,c+d)
    beam.Material=Enum.Material.SmoothPlastic beam.Color=Color3.fromRGB(0,0,0)
    beam.BrickColor=BrickColor.new("Really black") beam.Anchored=true beam.CanCollide=false beam.Parent=workspace
    local out=Instance.new("Part")
    out.Size=Vector3.new(4.6,4.6,40) out.CFrame=beam.CFrame
    out.Material=Enum.Material.Neon out.Color=Color3.fromRGB(80,0,120) out.Transparency=0.4
    out.Anchored=true out.CanCollide=false out.Parent=beam
    D:AddItem(beam,0.5)
    pcall(function()
        local s=Instance.new("Sound")
        s.SoundId="rbxassetid://9125402735" s.Volume=1.2 s.PlaybackSpeed=0.9
        s.Parent=rp s:Play() D:AddItem(s,2)
    end)
    local ht={} local hs={}
    for i=1,10 do
        local pt=o+d*(40*i/10)
        for _,t in pairs(targets(pt,7)) do if not hs[t.h] then hs[t.h]=true table.insert(ht,t) end end
    end
    dmg(ht,25,80,o,false)
end