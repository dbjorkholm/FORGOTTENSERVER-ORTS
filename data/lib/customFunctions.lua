stopMoveStorage = 100000

function Player.allowMovement(self, param)
	return self:setStorageValue(stopMoveStorage, param and 0 or 1)
end

function Player.hasAllowMovement(self)
	if self:getStorageValue(stopMoveStorage) == 1 then
		return false
	end
	return true
end

function getBaseVocation(vocationId)
	if vocationId == 0 then
		return 0
	end

	return (vocationId - 1) % 4 + 1
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
		result.free(a)
		return true
	end
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
		if not playerExists(target) then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967296)
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
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
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				local tile = Tile(Position(x, y, z))
				if tile then
					local creature = tile:getTopCreature()
					if creature and creature:isPlayer() then
						return true
					end
				end
			end
		end
	end

	return false
end

function isMonsterInArea(fromPos, toPos, ignoreSummons)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				local tile = Tile(Position(x, y, z))
				if tile then
					local creature = tile:getTopCreature()
					if creature and creature:isMonster() and not(ignoreSummons and creature:getMaster()) then
						return true
					end
				end
			end
		end
	end

	return false
end

function doPlayerGnomishRank(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.BigfootBurden.Rank) >= 30 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 14 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 15)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 120 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 15 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 16)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 480 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 16 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 17)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 1440 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 17 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 18)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end

function teleportAllPlayersFromArea(fromArea, toPos)
	for x = fromArea[1].x, fromArea[2].x do
		for y = fromArea[1].y, fromArea[2].y do
			for z = fromArea[1].z, fromArea[2].z do
				if(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
					local thing = getThingfromPos({x = x, y = y, z = z, stackpos = 255})
					local player = Player(thing.uid)
					if thing and player then
						doTeleportThing(thing.uid, toPos)
						doSendMagicEffect(toPos, CONST_ME_TELEPORT)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported out by the gnomish emergency device.")
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
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature and creature:isMonster() and creature:getName():lower() == bossName:lower() then
					creature:remove()
				end
			end
		end
	end
end

function clearArena(fromPos, toPos)
	if Game.getStorageValue(3157) == 1 then
		for x = fromPos.x, toPos.x do
			for y = fromPos.y, toPos.y do
				for z = fromPos.z, toPos.z do
					local creature = getTopCreature({x = x, y = y, z = z})
					if creature and creature.uid > 0 then
						if isPlayer(creature.uid) then
							doTeleportThing(creature.uid, {x = 33049, y = 31017, z = 2})
							doSendMagicEffect({x = 33049, y = 31017, z = 2}, CONST_ME_TELEPORT)
						else
							doRemoveCreature(creature.uid)
						end
					end
				end
			end
		end
	Game.setStorageValue(3157, 0)
	end
	return true
end

function Player.getBlessings(self)
	local blessings = 0
	for i = 1, 5 do
		if self:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	return blessings
end
