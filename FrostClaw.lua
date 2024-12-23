function RE(RemoteName)
    return require(game:GetService("ReplicatedStorage").ClientModules.Core.RouterClient.RouterClient).get(RemoteName)
end
function Activate()
if workspace.Interiors:FindFirstChildOfClass("Model") then
local frostmodel = string.split(workspace.Interiors:FindFirstChildOfClass("Model").Name,"::")[2]
for i,v in pairs(workspace.Interiors:FindFirstChildOfClass("Model").LocalEnemies:GetChildren()) do
RE("MinigameAPI/MessageServer"):FireServer("frostclaws_revenge::"..frostmodel,"hit_enemies",{[1] = v.Name},"sword_slash")
    end
    RE("MinigameAPI/MessageServer"):FireServer("frostclaws_revenge::"..frostmodel,"upgrade_chosen","sword_speed")
    RE("MinigameAPI/MessageServer"):FireServer("frostclaws_revenge::"..frostmodel,"upgrade_chosen","sword_power")
    RE("MinigameAPI/MessageServer"):FireServer("frostclaws_revenge::"..frostmodel,"upgrade_chosen","charge_rate")
    RE("MinigameAPI/MessageServer"):FireServer("frostclaws_revenge::"..frostmodel,"upgrade_chosen","charge_power")
    game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("FrostclawsRevengeUpgradeApp").Enabled = false

else
RE("TeamAPI/Spawn"):InvokeServer()
wait(1)
RE("MinigameAPI/LobbyCreate"):InvokeServer("frostclaws_revenge")
wait(1)
RE("MinigameAPI/LobbyStart"):FireServer({["startup_settings"] = {}})
wait(1)
end
end
while wait() do
    pcall(Activate)
end