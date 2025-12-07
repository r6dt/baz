repeat task.wait() until game:IsLoaded()

local args = {
    [1] = "Disable_Weather_Mutate_Sand",
    [2] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("SettingRE"):FireServer(unpack(args))

task.wait(10)
getgenv().g_config = {
    global_workspace = true, -- (Default: true)
    auto_hideui = true, -- (Default: false)
    whitescreen = false, -- (Default: false)
    headless = true -- (Default: false)
}
script_key="NfpFBaIfvgmDOLdlUUwkUEwulSeupYiD"
premium=true
loadstring(game:HttpGet("https://raw.githubusercontent.com/dodohubx-rgb/dodohub/refs/heads/main/loader.luau"))()
