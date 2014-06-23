stopMoveStorage = 100000

function Player.stopMove(self, param)
	if param then
		self:setStorageValue(stopMoveStorage, 1)
	else
		self:setStorageValue(stopMoveStorage, 0)
	end
	return true
end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end
  
function playerExists(name)
	local a = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	  if a then
	   return true
	  end
	  return false
end
  
function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
	else
		if playerExists(target) == false then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function getRealTime()
	local hours = tonumber(os.date("%H", os.time()))
	local minutes = tonumber(os.date("%M", os.time()))
	
	if hours < 10 then
		hours = '0' .. hours
	end
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getRealDate()
	local month = tonumber(os.date("%m", os.time()))
	local day = tonumber(os.date("%d", os.time()))
	
	if month < 10 then
		month = '0' .. month
	end
	if day < 10 then
		day = '0' .. day
	end
	return day .. '/' .. month
end

function isPlayerInArea(fromPos, toPos)
		for _x = fromPos.x, toPos.x do
				for _y = fromPos.y, toPos.y do
						for _z = fromPos.z, toPos.z do
								creature = getTopCreature({x = _x, y = _y, z = _z})
								if (creature.type == THING_TYPE_PLAYER) then
										return true
								end
						end
				end
		end
		return false
end

function isMonsterInArea(fromPos, toPos, showMonsters, disableSummons)
		for _x = fromPos.x, toPos.x do
				for _y = fromPos.y, toPos.y do
						for _z = fromPos.z, toPos.z do
								creature = getTopCreature({x = _x, y = _y, z = _z})
								if (creature.type == 2 and showMonsters and (not disableSummons or (disableSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
										return true
								end
						end
				end
		end
		return false
end

function doPlayerGnomishRank(cid)
		if(getPlayerStorageValue(cid, 921) >= 30) then
				if(getPlayerStorageValue(cid, 900) == 14) then
						setPlayerStorageValue(cid, 900, 15)
						doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				end
		elseif(getPlayerStorageValue(cid, 921) >= 120) then
				if(getPlayerStorageValue(cid, 900) == 15) then
						setPlayerStorageValue(cid, 900, 16)
						doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				end
		elseif(getPlayerStorageValue(cid, 921) >= 480) then
				if(getPlayerStorageValue(cid, 900) == 16) then
						setPlayerStorageValue(cid, 900, 17)
						doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				end
		elseif(getPlayerStorageValue(cid, 921) >= 1440) then
				if(getPlayerStorageValue(cid, 900) == 17) then
						setPlayerStorageValue(cid, 900, 18)
						doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				end
		end
		return true
end
				
function teleportAllPlayersFromArea(fromArea, toPos)
		for x = fromArea[1].x, fromArea[2].x do
				for y = fromArea[1].y, fromArea[2].y do
						for z = fromArea[1].z, fromArea[2].z do
								if(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
										if(isPlayer(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) then
												doTeleportThing(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid, toPos)
												doSendMagicEffect(toPos, CONST_ME_TELEPORT)
												doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You were teleported out by the gnomish emergency device.")
										end
								end
						end
				end
		end
		return true
end

function removeBoss(fromArea, bossName)
		for x = fromArea[1].x, fromArea[2].x do
				for y = fromArea[1].y, fromArea[2].y do
						for z = fromArea[1].z, fromArea[2].z do
								if(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
										if(isMonster(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) then
												if(string.lower(getCreatureName(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) == bossName) then
														doRemoveCreature(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)
												end
										end
								end
						end
				end
		end
		return true
end

function clearArena(fromPos, toPos)
		if(getGlobalStorageValue(3157) == 1) then
				for x = fromPos.x, toPos.x do
						for y = fromPos.y, toPos.y do
								for z = fromPos.z, toPos.z do
										if(getTopCreature({x = x, y = y, z = z}).uid > 0) then
												if(isPlayer(getTopCreature({x = x, y = y, z = z}).uid)) then
														doTeleportThing(getTopCreature({x = x, y = y, z = z}).uid, {x = 33049, y = 31017, z = 2})
														doSendMagicEffect({x = 33049, y = 31017, z = 2}, CONST_ME_TELEPORT)
												else
														doRemoveCreature(getTopCreature({x = x, y = y, z = z}).uid)
												end
										end
								end
						end
				end
				setGlobalStorageValue(3157, 0)
		end
		return true
end

function isNpcInArea(NpcName, fromPos, toPos)
		for _x = fromPos.x, toPos.x do
				for _y = fromPos.y, toPos.y do
						for _z = fromPos.z, toPos.z do
								creature = getTopCreature({x = _x, y = _y, z = _z})
								if creature.type == THING_TYPE_NPC and getCreatureName(creature.uid):lower() == NpcName:lower() then
										return true
								end
						end
				end
		end
		return false
end

function doCopyItem(item, attributes)
		local attributes = attributes or false

		local ret = doCreateItemEx(item.itemid, item.type)
		if(attributes) then
				if(item.actionid > 0) then
						doSetItemActionId(ret, item.actionid)
				end
		end

		if(isContainer(item.uid) == TRUE) then
				for i = (getContainerSize(item.uid) - 1), 0, -1 do
						local tmp = getContainerItem(item.uid, i)
						if(tmp.itemid > 0) then
								doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
						end
				end
		end

		return getThing(ret)
end

function isMonsterInRange(monsterName, fromPos, toPos)
		for _x = fromPos.x, toPos.x do
				for _y = fromPos.y, toPos.y do
						for _z = fromPos.z, toPos.z do
								creature = getTopCreature({x = _x, y = _y, z = _z})
								if creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid):lower() == monsterName:lower() then
										return true
								end
						end
				end
		end
		return false
end

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
		local creaturesList = {}
		for x = -radiusx, radiusx do
				for y = -radiusy, radiusy do
						if not (x == 0 and y == 0) then
								local creature = getTopCreature({x = position.x + x, y = position.y + y, z = position.z})
								if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and (not showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
										table.insert(creaturesList, creature.uid)
								end
						end
				end
		end

		local creature = getTopCreature(position)
		if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and not (showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
				if not(table.find(creaturesList, creature.uid)) then
						table.insert(creaturesList, creature.uid)
				end
		end
		return creaturesList
end