repeat task.wait() until game:IsLoaded()

getgenv().DuckyConfig = {
    ["EnableLog"] = true,
    ["discord_id"] = "1167566243969126442",
    ["PC_NAME"] = "ALL"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/DuckyE/duckyLog/refs/heads/main/ducky.host.lua"))()
