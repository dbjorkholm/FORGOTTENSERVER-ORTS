-- NPCS STORAGE --
-- (HIGHLY RECOMMENDED -> ONE mission per STORAGE) --

--[[ explaining
NPCname or QuestName = {
						NeedMission		 	-- need mission to trade items with npc, true = Need Missions.
						MissionStart 	 	-- Start Storage Mission on NPC
						MissionEnd		 	-- End Storage Mission on NPC
						WithoutMissionPrice -- [tobuy = npcprice / WithoutMissionPrice] -- [tosell = npcprice * WithoutMissionPrice]
						}
			
	exemple

Rashid = {
			NeedMission = false		-- mission does not need to be able to trade items,
									-- however if WithoutMissionPrice differs from 1, the price will be different for players who have no mission
			MissionStart = 200			
			MissionEnd	= 210
			WithoutMissionPrice = 0.5 -- newpricebuy = 10000gp / 0.5 = 20000gp // newpricesell = 10000gp * 0.5 = 5000gp
		}
]]
Rashid = {
			NeedMission = false,
			MissionStart = 101,
			MissionEnd = 107,
			WithoutMissionPrice = 0.5
		}
		
--RASHID OLD STORAGE 85
--[[
descrip
[85] =  { OLD STORAGE VALUE = {STORAGE} {VALUE}
			1 = 101 1
			2 = 101 2
			3 = 102 1
			4 = 102 2
			5 = 102 3
			6 = 102	4
			7 =	102 5
			8 = 103 1
			9 = 103 2
			10 = 103 3
			11 = 104 1
			12 = 104 2
			13 = 104 3
			14 = 105 1
			15 = 105 2
			16 = 105 3
			17 = 106 1
			18 = 106 2 -- removed
			19 = 106 {3} = newvalue {2} 
			20 = 107 1
		}
]]		

BlueOrGreen = false		-- blue djinn or green djinn quest, true = only one. -- NOT IMPLEMENTED YET
Factions = 110	-- shared storage between blue and green djinn quest and others.

BlueDjinn = {
				NeedMission = false,
				MissionStart = 111,
				MissionEnd = 114,
				WithoutMissionPrice = 0.5
			}
			
--[[
	STORAGE VALUE = STORAGE VALUE
	Factions 2 = 80 1
	BlueDjinn.MissionStart 1 = 82 1
	BlueDjinn.MissionStart+1 1 = 82 2
	BlueDjinn.MissionStart+1 2 = 82 3
	BlueDjinn.MissionStart+1 3 = 82 4
	BlueDjinn.MissionStart+2 1 = 82 5
	BlueDjinn.MissionStart+2 2 = 82 6
	BlueDjinn.MissionStart+2 3 = 82 7
	BlueDjinn.MissionStart+3 1 = 82 8
	BlueDjinn.MissionStart+3 2 = 82 9
	BlueDjinn.MissionStart+3 3 = 82 10
	BlueDjinn.MissionStart+3 4 = 82 11

]]
	
GreenDjinn = {
				NeedMission = false,
				MissionStart = 121,
				MissionEnd = 124,
				WithoutMissionPrice = 0.5
			}
			
--[[
	STORAGE VALUE = STORAGE VALUE
	Factions 2 = 80 1
	GreenDjinn.MissionStart 1 = 81 1
	GreenDjinn.MissionStart+1 1 = 81 2
	GreenDjinn.MissionStart+1 2 = 81 3
	GreenDjinn.MissionStart+1 3 = 81 4
	GreenDjinn.MissionStart+1 4 = 81 5
	GreenDjinn.MissionStart+2 1 = 81 6
	GreenDjinn.MissionStart+2 2 = 81 7
	GreenDjinn.MissionStart+2 3 = 81 8
	GreenDjinn.MissionStart+3 1 = 81 9
	GreenDjinn.MissionStart+3 2 = 81 10
	GreenDjinn.MissionStart+3 3 = 81 11
	GreenDjinn.MissionStart+3 4 = 81 12
]]


-- Function used on this script and npcs system --
function sendTable(cid, table, storage, factor, endValue)
local player = Player(cid)
local mission = player:getStorageValue(storage)
	if(mission < endValue) then
		for i = 1, #table do
			table[i].buy = table[i].buy / factor
			table[i].sell = table[i].sell * factor
		end
	end
return table
end

function setNewTradeTable(table)
	local items = {}
	for _, v in ipairs(table) do
			items[v.id] = {itemId = v.id, buyPrice = v.buy, sellPrice = v.sell, subType = 0, realName = v.name}
	end
	return items
end

function TradeRequest(cid, npc, table, STORAGE, Fvalue) -- exemple TradeRequest(cid, npcHandler, getTable(), GreenDjinn, 4)
	local player = Player(cid)
	if(player:getStorageValue(STORAGE.MissionEnd) >= Fvalue or STORAGE.NeedMission ~= true) then
	
		local ItemTable = sendTable(cid, table, STORAGE.MissionEnd, STORAGE.WithoutMissionPrice, Fvalue)
		local items = setNewTradeTable(ItemTable)
		
		local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if (ignoreCap == false and (player:getFreeCapacity() < getItemWeight(items[item].itemId, amount) or inBackpacks and player:getFreeCapacity() < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
				return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice <= player:getMoney() then
				if inBackpacks then
					local itembp = doCreateItemEx(1988, 1)
					local bp = player:addItemEx(itembp)
					if(bp ~= 1) then
						return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')	
					end
					for i = 1, amount do
						doAddContainerItem(itembp, items[item].itemId, items[item])
					end
				else
					return 
					player:addItem(items[item].itemId, amount, false, items[item]) and
					player:removeMoney(amount * items[item].buyPrice) and
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				player:removeMoney(amount * items[item].buyPrice)
			else
				player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You do not have enough money.')
			end
			return true
			end
			 
		local function onSell(cid, item, subType, amount, ignoreEquipped)
			if items[item].sellPrice then
				return
				player:addMoney(items[item].sellPrice * amount) and
				player:removeItem(items[item].itemId, amount, 1, ignoreEquipped) and
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
		end
		openShopWindow(cid, ItemTable, onBuy, onSell)
		return npc:say('It\'s my offer.', player)
	else
		npcHandler:say("I don't trade with not recognized traders.", player)
		return false
	end
end