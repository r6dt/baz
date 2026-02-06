repeat task.wait() until game:IsLoaded()

task.wait(20)
loadstring(game:HttpGet("https://raw.githubusercontent.com/r6dt/baz/refs/heads/main/config.lua"))()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- รอให้ Character พร้อมจริง ๆ
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- รอให้ Roblox เซ็ตตำแหน่งเสร็จ
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
-- ฟังก์ชันซ่อน Pets/Eggs/Effects
-- ======================
local function HideAllClient()
    for _, obj in ipairs(Workspace:GetChildren()) do

        -- ซ่อน Pets
        if obj.Name == "Pets" and obj:IsA("Folder") then
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
        if obj.Name == "Eggs" and obj:IsA("Folder") then
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

        -- ปิด Effects ที่อยู่ใน Workspace โดยตรง
        for _, v in ipairs(obj:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                v.Enabled = false
            end
        end
    end
end

-- ======================
-- ฟังก์ชันจัดการ 3D Rendering + Overlay
-- ======================
local function Perf_Set3DEnabled(enable3D)
    local ok = pcall(function()
        RunService:Set3dRenderingEnabled(enable3D)
    end)
    _toggleBlackOverlay(not enable3D) -- ถ้า disable 3D -> จอดำ
end

-- ======================
-- รัน AFK Mode อัตโนมัติ
-- ======================
task.defer(function()
    -- ปิด 3D + Overlay ดำ
    Perf_Set3DEnabled(false)

    -- ซ่อน Pets/Eggs/Effects
    HideAllClient()

    -- ล็อก FPS
    if setfpscap then
        setfpscap(5)
    elseif _setFPSCap then
        _setFPSCap(5)
    end
end)

-- ======================
-- เรียกซ้ำทุก Frame เผื่อ spawn ใหม่
-- ======================
RunService.RenderStepped:Connect(function()
    HideAllClient()
end)

print("[AFK MODE] TP + Hide Pets/Eggs/Effects + FPS lock + Black Screen applied")

-- main
task.wait(20)
getgenv().g_config = {
    global_workspace = true, -- (Default: true)
    auto_hideui = true, -- (Default: false)
    whitescreen = false, -- (Default: false)
    headless = true -- (Default: false)
}
script_key="SeffeWnaAQYPEuJVerUaeRKtdvnTxISs"
premium=true
loadstring(game:HttpGet("https://raw.githubusercontent.com/dodohubx-rgb/dodohub/refs/heads/main/loader.luau"))()
