local sharedItems = exports['qbr-core']:GetItems()
local campfire = 0

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(9)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

-- setup campfire
RegisterNetEvent('fists_campfirecrafting:client:cookinggrill')
AddEventHandler('fists_campfirecrafting:client:cookinggrill', function(itemName)
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        SetEntityAsMissionEntity(cookgrill)
        DeleteObject(cookgrill)
        campfire = 0
    else
		local playerPed = PlayerPedId()
		TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
		Citizen.Wait(10000)
		ClearPedTasksImmediately(PlayerPedId())
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
		local prop = CreateObject(GetHashKey("p_campfire05x"), x, y, z, true, false, true)
		local prop2 = CreateObject(GetHashKey("p_cookgrate01x"), x, y, z, true, false, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		SetEntityHeading(prop2, GetEntityHeading(PlayerPedId()))
		PlaceObjectOnGroundProperly(prop)
		PlaceObjectOnGroundProperly(prop2)
		campfire = prop
		cookgrill = prop2
	end
end, false)

-- p_campfire05x
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local cookObject = GetClosestObjectOfType(pos, 5.0, GetHashKey("p_campfire05x"), false, false, false)
		if cookObject ~= 0 then
			local objectPos = GetEntityCoords(cookObject)
			if #(pos - objectPos) < 3.0 then
				awayFromObject = false
				DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~J~w~ - Cook Menu")
				if IsControlJustReleased(0, 0xF3830D8E) then
					TriggerEvent('fists_campfirecrafting:client:menu')
				end
			end
		end
		
		if awayFromObject then
			Wait(1000)
		end
	end
end)

-- p_campfirecombined01x
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local cookObject1 = GetClosestObjectOfType(pos, 5.0, GetHashKey("p_campfirecombined01x"), false, false, false)
		if cookObject1 ~= 0 then
			local objectPos = GetEntityCoords(cookObject1)
			if #(pos - objectPos) < 3.0 then
				awayFromObject = false
				DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~J~w~ - Cook Menu")
				if IsControlJustReleased(0, 0xF3830D8E) then
					TriggerEvent('fists_campfirecrafting:client:menu')
				end
			end
		end
		
		if awayFromObject then
			Wait(1000)
		end
	end
end)

-- p_campfirecombined02x
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local cookObject2 = GetClosestObjectOfType(pos, 5.0, GetHashKey("p_campfirecombined02x"), false, false, false)
		if cookObject2 ~= 0 then
			local objectPos = GetEntityCoords(cookObject2)
			if #(pos - objectPos) < 3.0 then
				awayFromObject = false
				DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~J~w~ - Cook Menu")
				if IsControlJustReleased(0, 0xF3830D8E) then
					TriggerEvent('fists_campfirecrafting:client:menu')
				end
			end
		end
		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)

-- p_campfirecombined03x
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local cookObject3 = GetClosestObjectOfType(pos, 5.0, GetHashKey("p_campfirecombined03x"), false, false, false)
		if cookObject3 ~= 0 then
			local objectPos = GetEntityCoords(cookObject3)
			if #(pos - objectPos) < 3.0 then
				awayFromObject = false
				DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~J~w~ - Cook Menu")
				if IsControlJustReleased(0, 0xF3830D8E) then
					TriggerEvent('fists_campfirecrafting:client:menu')
				end
			end
		end
		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)

-- p_campfirecombined04x
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
		local cookObject4 = GetClosestObjectOfType(pos, 5.0, GetHashKey("p_campfirecombined04x"), false, false, false)
		if cookObject4 ~= 0 then
			local objectPos = GetEntityCoords(cookObject4)
			if #(pos - objectPos) < 3.0 then
				awayFromObject = false
				DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~J~w~ - Cook Menu")
				if IsControlJustReleased(0, 0xF3830D8E) then
					TriggerEvent('fists_campfirecrafting:client:menu')
				end
			end
		end
		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)

-- crafting main menu
RegisterNetEvent('fists_campfirecrafting:client:menu', function(data)
    exports['qbr-menu']:openMenu({
        {
            header = 'Fists Crafting Menu',
            icon = 'fas fa-code',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Cooking',
            txt = 'Cooking!',
            icon = 'fas fa-code-merge',
            params = {
                event = 'qbr-menu:client:cookingMenu',
                args = {
                    number = 1,
                }
            }
        },  
        {
            header = 'Brewing',
            txt = 'Brew Menu',
            icon = 'fas fa-code-pull-request',
            -- disabled = false, -- optional, non-clickable and grey scale
            -- hidden = true, -- optional, hides the button completely
            params = {
                -- isServer = false, -- optional, specify event type
                event = 'qbr-menu:client:brewingMenu',
                args = {
                    number = 2,
                }
            }
        },
    })
end)

--sub cooking menu categories
RegisterNetEvent('qbr-menu:client:cookingMenu', function(data)
    local number = data.number
    exports['qbr-menu']:openMenu({
        {
            header = 'Return to Crafting menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'fists_campfirecrafting:client:menu',
                args = {}
            }
        },
        {
            header = 'Venison Steak',
            txt = '1 x Raw Meat',
            icon = 'fas fa-code-merge',
            params = {
                event = ""

            }
        }
    })
end)

RegisterNetEvent('qbr-menu:client:brewMenu', function(data)
    local number = data.number
    exports['qbr-menu']:openMenu({
        {
            header = 'Return to Crafting menu',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'fists_campfirecrafting:client:menu',
                args = {}
            }
        },
        {
            header = 'Coffee',
            txt = '1 x Raw Meat',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:coffee"

            }
        }
    })
end)

RegisterNetEvent("fists_campfirefrafting:coffee")
AddEventHandler("fists_campfirefrafting:coffee", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("coffee_beans", "Brewing Coffee..", 30000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "coffee_beans", 4)
				TriggerServerEvent('QBCore:Server:AddItem', "coffee", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["coffee"], "add")
				exports['qbr-core']:Notify(9, 'You Brewed a coffee', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'You don\'t have the ingredients to make this!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['coffee'] = 1 })
end)

RegisterNetEvent("fists_campfirefrafting:steak")
AddEventHandler("fists_campfirefrafting:steak", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("apple", "Cooking Fish Steak..", 30000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "apple", 4)
				TriggerServerEvent('QBCore:Server:AddItem', "cooked_meat", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["cooked_meat"], "add")
				exports['qbr-core']:Notify(9, 'You Brewed a coffee', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'You don\'t have the ingredients to make this!', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['cooked_meat'] = 1 })
end)