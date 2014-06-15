local waves = {
	{x = 32779, y = 31166, z = 10},
	{x = 32787, y = 31166, z = 10},
	{x = 32782, y = 31162, z = 10},
	{x = 32784, y = 31162, z = 10},
	{x = 32782, y = 31170, z = 10},
	{x = 32784, y = 31170, z = 10},
}

local function doClearArea(fromPos, toPos)
	if(getGlobalStorageValue(982) == 1) then
		for x = fromPos.x, toPos.x do
			for y = fromPos.y, toPos.y do
				if(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid > 0) then
					if(isMonster(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid)) then
						doRemoveCreature(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid)
					end
				end
			end
		end
		setGlobalStorageValue(982, 0)
	end
	return true
end

local function doChangeAzerus(fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if (creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid) == "Azerus") then
					doCreatureSay(creature.uid, "No! I am losing my energy!", TALKTYPE_ORANGE_1)
					doSummonCreature("Azerus", getThingPos(creature.uid))
					doRemoveCreature(creature.uid)
					return true
				end
			end
		end
	end
	return false
end		

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3086) then
		if(getGlobalStorageValue(982) < 1) then -- Fight
    		local amountOfPlayers = 3
    		local p = getSpectators(getCreaturePosition(cid), 7, 7, false, true)  
 
    		local players = #p
    		if (players < amountOfPlayers) then
	  		for _, pid in pairs(p) do
				p:sendTextMessage(MESSAGE_INFO_DESCR, "You need atleast "..amountOfPlayers.." players inside the quest room.")
			end
		return true
		end
			setGlobalStorageValue(982, 1)
			addEvent(doSummonCreature, 18 * 1000, "Azerus2", {x = 32783, y = 31167, z = 10})
			for i = 1, 4 do
				if(i == 1) then
					creature = "rift worm"
				elseif(i == 2) then
					creature = "rift scythe"
				elseif(i == 3) then
					creature = "rift brood"
				elseif(i == 4) then
					creature = "war golem"
				end
				for k = 1, table.maxn(waves) do			
					addEvent(doSummonCreature, i * 20 * 1000, creature, waves[k])
					addEvent(doSendMagicEffect, i * 20 * 1000, waves[k], CONST_ME_TELEPORT)
				end
			end
			for x = 32779, 32787, 8 do
				for y = 31161, 31171, 10 do      
					doSendMagicEffect({x=x, y=y, z=10}, CONST_ME_HOLYAREA)
				end
			end
			addEvent(doChangeAzerus, 4 * 20 * 1000, {x = 32776, y = 31157, z = 10}, {x = 32790, y = 31175, z = 10})
			addEvent(doClearArea, 5 * 1000 * 60, {x = 32776, y = 31157, z = 10}, {x = 32790, y = 31175, z = 10})
		else
			p:say('You have to wait some time before this globe charges.', TALKTYPE_ORANGE_1)
		end
	end
	return true
end