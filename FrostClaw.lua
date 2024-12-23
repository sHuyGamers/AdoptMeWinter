local vu = game:GetService("VirtualUser")
local player = game:GetService("Players").LocalPlayer

-- Connect to the player's Idled event
player.Idled:Connect(function()
    -- Trigger a small movement to reset AFK timer
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AmountDisplayGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0) 
textLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
textLabel.Font = Enum.Font.SourceSansBold  
textLabel.TextScaled = false 
textLabel.TextSize = 1000  
textLabel.Text = "Waiting for Amount..."
textLabel.ZIndex = 10 

textLabel.Parent = screenGui

local function updateAmount()
    while true do
        local amountLabel = playerGui:FindFirstChild("AltCurrencyIndicatorApp")
            and playerGui.AltCurrencyIndicatorApp:FindFirstChild("CurrencyIndicator")
            and playerGui.AltCurrencyIndicatorApp.CurrencyIndicator:FindFirstChild("Container")
            and playerGui.AltCurrencyIndicatorApp.CurrencyIndicator.Container:FindFirstChild("Amount")

        if amountLabel and amountLabel:IsA("TextLabel") then
            textLabel.Text = amountLabel.Text
        else
            textLabel.Text = "Amount not found."
        end

        task.wait(1)
    end
end

coroutine.wrap(updateAmount)()
_G.whiteScreen = false
_G.fps = 60
_G.Mode = true
loadstring(game:HttpGet('https://raw.githubusercontent.com/AloneBiNgu/AloneHub/main/lag'))()
function RE(RemoteName)
    return 
require(game:GetService("ReplicatedStorage").ClientModules.Core.RouterClient.RouterClient).get(RemoteName)
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
