repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- รอ Character พร้อม
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

task.wait(1.5)

-- ======================
-- TP ไปข้างหน้า 100 studs
-- ======================
hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -100)

-- ======================
-- ฟังก์ชันซ่อน Pets / Eggs / Effects (Client Only)
-- ======================
local function HideAllClient()
    for _, obj in ipairs(Workspace:GetChildren()) do

        -- ซ่อน Pets
        if obj:IsA("Folder") and obj.Name == "Pets" then
            for _, pet in ipairs(obj:GetChildren()) do
                for _, part in ipairs(pet:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                        part.CanCollide = false
                    elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Beam") then
                        part.Enabled = false
                    end
                end
            end
        end

        -- ซ่อน Eggs
        if obj:IsA("Folder") and obj.Name == "Eggs" then
            for _, egg in ipairs(obj:GetChildren()) do
                for _, part in ipairs(egg:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                        part.CanCollide = false
                    elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Beam") then
                        part.Enabled = false
                    end
                end
            end
        end

        -- ปิด Effects อื่น ๆ
        for _, v in ipairs(obj:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            end
        end
    end
end

-- ======================
-- รัน AFK Mode อัตโนมัติ
-- ======================
task.defer(function()
    HideAllClient()

    -- ล็อก FPS
    if setfpscap then
        setfpscap(5)
    elseif _setFPSCap then
        _setFPSCap(5)
    end
end)

-- ======================
-- เรียกซ้ำ เผื่อมี spawn ใหม่
-- ======================
RunService.RenderStepped:Connect(function()
    HideAllClient()
end)

print("[AFK MODE] TP + Hide Pets/Eggs/Effects + FPS lock (NO BLACK/WHITE SCREEN)")

-- main
task.wait(20)
getgenv().g_config = {
    global_workspace = true, -- (Default: true)
    auto_hideui = true, -- (Default: false)
    whitescreen = false, -- (Default: false)
    headless = true -- (Default: false)
}
script_key="rkogwwQUPbsTDEMOBUpZJFhVdpHavQqN"
premium=true
loadstring(game:HttpGet("https://raw.githubusercontent.com/dodohubx-rgb/dodohub/refs/heads/main/loader.luau"))()
