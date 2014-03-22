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

BlueDjinn = {	-- NOT IMPLEMENTED YET
				NeedMission = false,
				MissionStart = 111,
				MissionEnd = 120,
				WithoutMissionPrice = 0.5
			}
	
GreenDjinn = {	-- NOT IMPLEMENTED YET
				NeedMission = false,
				MissionStart = 121,
				MissionEnd = 130,
				WithoutMissionPrice = 0.5
			}


-- Function used on this script and npcs system --
function sendTable(cid, table, storage, factor)
local mission = getPlayerStorageValue(cid, storage)
	if(mission ~= 1) then
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