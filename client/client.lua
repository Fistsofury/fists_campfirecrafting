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
            params = {
                event = 'qbr-menu:client:brewingMenu',
                args = {
                    number = 2,
                }
            }
        },
        {
            header = 'Baking',
            txt = 'Baking Menu',
            icon = 'fas fa-code-pull-request',
            params = {
                event = 'qbr-menu:client:bakingMenu',
                args = {
                    number = 3,
                }
            }
        },
        {
            header = 'Produce',
            txt = 'Produce Menu',
            icon = 'fas fa-code-pull-request',
            params = {
                event = 'qbr-menu:client:produceMenu',
                args = {
                    number = 4,
                }
            }
        },
    })
end)

--sub cooking menu categories

--cooking
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
            txt = '1 x Raw Meat & 1 x Salt',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:steak",

            }
        }
        {
            header = 'Lamb Steak',
            txt = '1 x Raw Meat & 1 x Salt',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:;steak",

            }
        }
    })
end)

RegisterNetEvent('qbr-menu:client:brewingMenu', function(data)
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
            txt = '4 x coffee beans & 1 x Water',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:coffee",

            }
        }
    })
end)

RegisterNetEvent('qbr-menu:client:bakingMenu', function(data)
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
            header = 'Corn bread',
            txt = '2 x Corn & 1 x Water',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:cornbread",

            }
        }
    })
end)

RegisterNetEvent('qbr-menu:client:produceMenu', function(data)
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
            header = 'Corn Starch',
            txt = '2 x Corn & 1 x Sugar',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:cornstarch",

            }
        },
        {
            header = 'Cigar',
            txt = '4 x Dried Tobacco & 1 x Tobacco leaves',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:cigar",

            }
        },
        {
            header = 'Dried tobacco',
            txt = '1 x Tobacco',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:driedtobacco",

            }
        },
        {
            header = 'Tobacco Leaves',
            txt = '5 x Tobacco',
            icon = 'fas fa-code-merge',
            params = {
                event = "fists_campfirefrafting:tobaccoleaves",

            }
        }

    })
end)
--coffee
RegisterNetEvent("fists_campfirefrafting:coffee")
AddEventHandler("fists_campfirefrafting:coffee", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("coffeebeans", "Brewing Coffee..", 3000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "coffeebeans", 4)
                TriggerServerEvent('QBCore:Server:RemoveItem', "water", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "coffee", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["coffee"], "add")
				exports['qbr-core']:Notify(9, 'You Brewed a coffee', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['coffeebeans'] = 4, ['water'] = 1 })
end)
--steak
RegisterNetEvent("fists_campfirefrafting:steak")
AddEventHandler("fists_campfirefrafting:steak", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("raw_meat", "Cooking Fish Steak..", 30000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "raw_meat", 1)
                TriggerServerEvent('QBCore:Server:RemoveItem', "salt", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "cooked_meat", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["cooked_meat"], "add")
				exports['qbr-core']:Notify(9, 'You made a steak', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['raw_meat'] = 1, ['salt'] = 1 })
end)
--bread
RegisterNetEvent("fists_campfirefrafting:cornbread")
AddEventHandler("fists_campfirefrafting:cornbread", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("corn", "Baking bread..", 3000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "corn", 2)
                TriggerServerEvent('QBCore:Server:RemoveItem', "water", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "cornbread", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["cornbread"], "add")
				exports['qbr-core']:Notify(9, 'You have baked a loaf of Corn Bread', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['corn'] = 2, ['water'] = 1 })
end)

RegisterNetEvent("fists_campfirefrafting:cornstarch")
AddEventHandler("fists_campfirefrafting:cornstarch", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("corn", "Making Starch..", 3000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "corn", 2)
                TriggerServerEvent('QBCore:Server:RemoveItem', "sugar", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "cornstarch", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["cornstarch"], "add")
				exports['qbr-core']:Notify(9, 'You have grounded the corn into starch', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['corn'] = 2, ['sugar'] = 1 })
end)

RegisterNetEvent("fists_campfirefrafting:cigar")
AddEventHandler("fists_campfirefrafting:cigar", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("cigar", "Rolling Cigar..", 3000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "tobaccodry", 2)
                TriggerServerEvent('QBCore:Server:RemoveItem', "tobacco_leaves", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "cigar", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["cigar"], "add")
				exports['qbr-core']:Notify(9, 'You have rolled a cigar', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['tobaccodry'] = 2, ['tobacco_leaves'] = 1 })
end)

RegisterNetEvent("fists_campfirefrafting:driedtobacco")
AddEventHandler("fists_campfirefrafting:driedtobacco", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("driedtobacco", "Drying Tobacco..", 12000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "tobacco", 1)
                TriggerServerEvent('QBCore:Server:RemoveItem', "wood", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "tobaccodry", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["tobaccodry"], "add")
				exports['qbr-core']:Notify(9, 'You have dried out your tobacco', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['tobacco'] = 2, ['wood'] = 1 })
end)

RegisterNetEvent("fists_campfirefrafting:tobaccoleaves")
AddEventHandler("fists_campfirefrafting:tobaccoleaves", function()
	exports['qbr-core']:TriggerCallback('QBCore:HasItem', function(hasItem) 
		if hasItem then
			exports['qbr-core']:Progressbar("tobaccoleaves", "Rolling Tobacco Leaves..", 5000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "tobacco", 5)
				TriggerServerEvent('QBCore:Server:AddItem', "tobacco_leaves", 1)
				TriggerEvent("inventory:client:ItemBox", sharedItems["tobacco_leaves"], "add")
				exports['qbr-core']:Notify(9, 'You have rolled your tobacco leaves', 5000, 0, 'inventory_items', 'consumable_drink_coffee_brewed', 'COLOR_WHITE')
				
			end)
		else
			exports['qbr-core']:Notify(9, 'Missing ingredients', 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
		end
	end, { ['tobacco'] = 5, })
end)