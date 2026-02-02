repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- รอให้ Character พร้อมจริง ๆ
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- รอให้ Roblox เซ็ตตำแหน่งเสร็จ
task.wait(1.5)

-- TP ไปข้างหน้า 100 studs
hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -100)

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
