-- Basic --
function getBaseVocation(vocationId)
	if vocationId == 0 then
		return 0
	end

	return (vocationId - 1) % 4 + 1
end

function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
end

function isValidMoney(money)
	return isNumber(money) and money > 0 and money < 4294967296
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

function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getDataInt(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

function doPlayerGnomishRank(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.BigfootBurden.Rank) >= 30 and player:getStorageValue(Storage.BigfootBurden.Rank) < 120 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 14 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 15)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 120 and player:getStorageValue(Storage.BigfootBurden.Rank) < 480 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 15 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 16)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 480 and player:getStorageValue(Storage.BigfootBurden.Rank) < 1440 then
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
				local creature = Tile(Position(x, y, z)):getTopCreature()
				if creature and creature:isPlayer() then
					creature:teleportTo(toPos)
					toPos:sendMagicEffect(CONST_ME_TELEPORT)
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported out by the gnomish emergency device.")
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
	local exitPosition = Position(33049, 31017, 2)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				local creature = Tile(x, y, z):getTopCreature()
				if creature then
					if creature:isPlayer() then
						creature:teleportTo(exitPosition)
						exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
					else
						creature:remove()
					end
				end
			end
		end
	end
end


-- Game --
function Game.getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getPlayersByAccountNumber(accountNumber)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getHouseByPlayerGUID(playerGUID)
	for _, house in ipairs(Game.getHouses()) do
		if house:getOwnerGuid() == playerGUID then
			return house
		end
	end
	return nil
end


-- Item --
function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end


-- Party --
function Party.getVocationCount(self)
	local count = 1
	local bits = bit.lshift(1, getBaseVocation(self:getLeader():getVocation():getId()))

	local members = self:getMembers()
	for i = 1, #members do
		local vocationId = getBaseVocation(members[i]:getVocation():getId())
		local vocation = bit.lshift(1, vocationId)
		if bit.band(bits, vocation) == vocation then
			return false
		end

		bits = bit.bor(bits, bit.lshift(1, vocationId))
		count = count + 1
	end

	return count
end


-- Player --
function Player.allowMovement(self, allow)
	return self:setStorageValue(Storage.blockMovementStorage, allow and -1 or 1)
end

function Player.hasAllowMovement(self)
	return self:getStorageValue(Storage.blockMovementStorage) ~= 1
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

function Player.getBlessings(self)
	local blessings = 0
	for i = 1, 5 do
		if self:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	return blessings
end

function Player.isMage(self)
	return isInArray({1, 2, 5, 6}, self:getVocation():getId())
end


-- Tile --
function Tile.relocateTo(self, toPosition)
	if self:getPosition() == toPosition then
		return false
	end

	if not Tile(toPosition) then
		return false
	end

	for i = self:getThingCount() - 1, 0, -1 do
		local thing = self:getThing(i)
		if thing then
			if thing:isItem() then
				if ItemType(thing:getId()):isMovable() then
					thing:moveTo(toPosition)
				end
			elseif thing:isCreature() then
				thing:teleportTo(toPosition)
			end
		end
	end
	return true
end

function Tile.isPz(self)
	return self:hasFlag(TILESTATE_PROTECTIONZONE)
end

function Tile.isHouse(self)
	local house = self:getHouse()
	return house and true or false
end
