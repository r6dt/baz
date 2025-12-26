repeat task.wait() until game:IsLoaded()

local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("SettingRE")

remote:FireServer("Disable_Weather_Mutate_Sand", true)
remote:FireServer("Disable_Weather_Mutate_Aurora", true)

-- main
task.wait(5)
getgenv().g_config = {
    global_workspace = true, -- (Default: true)
    auto_hideui = true, -- (Default: false)
    whitescreen = false, -- (Default: false)
    headless = true -- (Default: false)
}
script_key="NfpFBaIfvgmDOLdlUUwkUEwulSeupYiD"
premium=true
loadstring(game:HttpGet("https://raw.githubusercontent.com/dodohubx-rgb/dodohub/refs/heads/main/loader.luau"))()
