-- Script Variables
QBCore = exports['qb-core']:GetCoreObject()
local player = QBCore.Functions.GetPlayerData()
local onduty = player.job.onduty
local isSpawned = false
local coords = vector3(-314.14, -1524.3, 27.57)
local Target = Config.ToggleThirdEye

Citizen.CreateThread(function()
    

      -- Create Job Blip (Needs Update!)
      local blip = AddBlipForCoord(-321.49, -1545.82, 31.02)
      SetBlipSprite(blip, 318)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 1)
      SetBlipColour(blip, 47)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Garbage Job")
      EndTextCommandSetBlipName(blip)
end)


local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Garbage Job", colour=47, id=318, x = -321.49, y = -1545.82, z = 31.02},
     --{title="Marlowe Vineyard", colour=3, id=499, x = -1873.58, y = 2023.76, z = 138.83}
  }
   

Citizen.CreateThread(function()
    -- Spawn Truck When On Duty
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local markDist = #(pos - vector3(-327.96, -1523.91, 27.54))
        if markDist < 27 and onduty == true then
            -- Truck Icon
            DrawMarker(39, -327.96, -1523.91, 27.54, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 200, 0, 0, 222, false, false, false, true, false, false, false)
            -- Circle Icon
            DrawMarker(25, -327.96, -1523.91, 26.58, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.9, 1.9, 1.9, 200, 0, 0, 222, false, false, false, true, false, false, false)
           

    -- Needs Patch Fix (Vehcile Spawns Without Pressing [E])
            if markDist < 1 then
                if IsPedInAnyVehicle(ped, false) then
                    ShowHelpNotification("Press [E] To Store Vehicle")
                else
                    ShowHelpNotification("Press [E] To Take Out Vehicle")
                end
                if IsControlJustReleased(0,38) then
                    if IsPedInAnyVehicle(ped, false) and isSpawned == true then
                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                        isSpawned = false
                    end
                    elseif isSpawned == false then
                        QBCore.Functions.SpawnVehicle("trash", function(veh)
                        SetEntityHeading(veh, 263.71)
                        exports['LegacyFuel']:SetFuel(veh, 100.0)
                        TaskWarpPedIntoVehicle(ped, veh, -1)
                        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                        SetVehicleEngineOn(veh, true, true)
                        isSpawned = true
                    end, coords, true)
                end
            end
        end
    end
end)


-- Toggle ThirdEye Use
Citizen.CreateThread(function()
    if Target == true then
        exports['qb-target']:AddBoxZone("Garbage Job", vector3(-322.24, -1545.87, 31.02),1,1, {
            name = "GarbageMan",
            heading = 88.17,
            debugPoly = false,
            minZ = 30,
            maxZ = 35,
            }, {
            options = {
                {
                    type = "client",
                    event = "TJ-GarbageJob:client:SetOnOffDutyTarget",
                    targeticon = 'fas fa-trash-alt',
                    label = "Clock In | Clock Out"
                },
            },
            distance = 3.0
        })
    end
end)

Citizen.CreateThread(function()

    -- Set On/Off Duty
    while true do
        Wait(0)
        if Target == false then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local garbageDist = #(pos - vector3(-322.25, -1545.87, 31.02))
            if garbageDist < 1 then
                inRange = true
                if garbageDist < 1 and onduty == false then
                    ShowHelpNotification("Press [E] To Go On Duty")
                    if IsControlJustPressed(0, 38) then
                        onduty = true
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end 
                elseif garbageDist < 1 and onduty == true then
                    ShowHelpNotification("Press [E] To Go Off Duty")
                    if IsControlJustPressed(0, 38) then
                        onduty = false
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        end
    end
end)


-- Handle On & Off Duty Using Third Eye Support
RegisterNetEvent('TJ-GarbageJob:client:SetOnOffDutyTarget')
AddEventHandler('TJ-GarbageJob:client:SetOnOffDutyTarget', function()
    if onduty == true then
        onduty = false
        TriggerServerEvent("QBCore:ToggleDuty")
    else
        onduty = true
        TriggerServerEvent("QBCore:ToggleDuty")
    end
end)

-- Shows Help Notification
function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
