repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- รอให้ตัวละครโหลด
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- ตำแหน่งปัจจุบัน + ทิศทางที่ตัวละครหันหน้าอยู่
local currentCFrame = humanoidRootPart.CFrame

-- ระยะที่จะ TP (30 studs)
local distance = 100

-- คำนวณตำแหน่งไปข้างหน้า
local newCFrame = currentCFrame * CFrame.new(0, 0, -distance)

-- TP
humanoidRootPart.CFrame = newCFrame

-- main
task.wait(10)
getgenv().g_config = {
    global_workspace = true, -- (Default: true)
    auto_hideui = true, -- (Default: false)
    whitescreen = false, -- (Default: false)
    headless = true -- (Default: false)
}
script_key="CyUpdWKPgIfhyZjdhWMZdtYcKyIZlnnO"
premium=true
loadstring(game:HttpGet("https://raw.githubusercontent.com/dodohubx-rgb/dodohub/refs/heads/main/loader.luau"))()

ใส่แบบนี้ได้ใช่มั้ย
