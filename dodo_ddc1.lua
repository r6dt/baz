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
-- ฟังก์ชันจอดำ Overlay
-- ======================
local function _toggleBlackOverlay(show)
    local pg = player:FindFirstChild("PlayerGui")
    if not pg then return end

    local gui = pg:FindFirstChild("PerfBlack") or Instance.new("ScreenGui", pg)
    gui.Name = "PerfBlack"
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 1e9
    gui.ResetOnSpawn = false

    local frame = gui:FindFirstChild("F") or Instance.new("Frame", gui)
    frame.Name = "F"
    frame.Size = UDim2.fromScale(1,1)
    frame.BackgroundColor3 = Color3.new(0,0,0)
    frame.BackgroundTransparency = show and 0 or 1

    gui.Enabled = show
end

-- ======================
-- ซ่อน Pets / Eggs / Effects
-- ======================
local function HideAllClient()
    for _, obj in ipairs(Workspace:GetChildren()) do

        -- Pets
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

        -- Eggs
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

        -- Effects อื่น
        for _, v in ipairs(obj:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            end
        end
    end
end

-- ======================
-- AFK Mode อัตโนมัติ
-- ======================
task.defer(function()
    -- เปิด Overlay ทันที
    _toggleBlackOverlay(true)

    -- ซ่อนทุกอย่าง
    HideAllClient()
end)

-- ======================
-- กันของ Spawn ใหม่
-- ======================
RunService.RenderStepped:Connect(function()
    HideAllClient()
end)

print("[AFK MODE] TP + Hide Pets/Eggs/Effects + FPS lock + Overlay (3D ON)")

task.wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/r6dt/baz/refs/heads/main/config.lua"))()

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
