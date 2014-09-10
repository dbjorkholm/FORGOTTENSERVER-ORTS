function pushThing(thing)
	local t = {uid = 0, itemid = 0, type = 0, actionid = 0}
	if thing ~= nil then
		if thing:isItem() then
			t.uid = thing:getUniqueId()
			t.itemid = thing:getId()
			if ItemType(t.itemid):hasSubType() then
				t.type = thing:getSubType()
			end
			t.actionid = thing:getActionId()
		elseif thing:isCreature() then
			t.uid = thing:getId()
			t.itemid = 1
			if thing:isPlayer() then
				t.type = 1
			elseif thing:isMonster() then
				t.type = 2
			else
				t.type = 3
			end
		end
	end
	return t
end

-- still used in some actions
function isPlayer(cid) return Player(cid) ~= nil end
function isMonster(cid) return Monster(cid) ~= nil end
function getCreaturePosition(cid) local c = Creature(cid) return c ~= nil and c:getPosition() or false end

function doRemoveCreature(cid) local c = Creature(cid) return c ~= nil and c:remove() or false end
function doCreatureSay(cid, text, type, ...) local c = Creature(cid) return c ~= nil and c:say(text, type, ...) or false end

function getPlayerByName(name) local p = Player(name) return p ~= nil and p:getId() or false end
function getIPByPlayerName(name) local p = Player(name) return p ~= nil and p:getIp() or false end
function getPlayerGUID(cid) local p = Player(cid) return p ~= nil and p:getGuid() or false end
function getPlayerName(cid) local p = Player(cid) return p ~= nil and p:getName() or false end
function getPlayerPosition(cid) local p = Player(cid) return p ~= nil and p:getPosition() or false end
function getPlayerAccess(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end
	return player:getGroup():getAccess() and 1 or 0
end
function getPlayerMaxMana(cid) local p = Player(cid) return p ~= nil and p:getMaxMana() or false end
function getPlayerVocation(cid) local p = Player(cid) return p ~= nil and p:getVocation():getId() or false end
function getPlayerSex(cid) local p = Player(cid) return p ~= nil and p:getSex() or false end
function getPlayerGroupId(cid) local p = Player(cid) return p ~= nil and p:getGroup():getId() or false end
function getPlayerLookDir(cid) local p = Player(cid) return p ~= nil and p:getDirection() or false end
function getPlayerLight(cid) local p = Player(cid) return p ~= nil and p:getLight() or false end
function getPlayerDepotItems(cid, depotId) local p = Player(cid) return p ~= nil and p:getDepotItems(depotId) or false end
function getPlayerSkullType(cid) local p = Player(cid) return p ~= nil and p:getSkull() or false end
function getPlayerLossPercent(cid) local p = Player(cid) return p ~= nil and p:getDeathPenalty() or false end
function getPlayerMount(cid, mountId) local p = Player(cid) return p ~= nil and p:hasMount(mountId) or false end
function getPlayerPremiumDays(cid) local p = Player(cid) return p ~= nil and p:getPremiumDays() or false end
function getPlayerBlessing(cid, blessing) local p = Player(cid) return p ~= nil and p:hasBlessing(blessing) or false end
function getPlayerGuildId(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end

	local guild = player:getGuild()
	if guild == nil then
		return false
	end
	return guild:getId()
end
function getPlayerGuildLevel(cid) local p = Player(cid) return p ~= nil and p:getGuildLevel() or false end
function getPlayerGuildName(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end

	local guild = player:getGuild()
	if guild == nil then
		return false
	end
	return guild:getName()
end
function getPlayerGuildRank(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end

	local guild = player:getGuild()
	if guild == nil then
		return false
	end

	local rank = guild:getRankByLevel(player:getGuildLevel())
	return rank ~= nil and rank.name or false
end
function getPlayerGuildNick(cid) local p = Player(cid) return p ~= nil and p:getGuildNick() or false end
function getPlayerMasterPos(cid) local p = Player(cid) return p ~= nil and p:getTown():getTemplePosition() or false end
function getPlayerItemCount(cid, itemId, ...) local p = Player(cid) return p ~= nil and p:getItemCount(itemId, ...) or false end
function getPlayerSlotItem(cid, slot)
	local player = Player(cid)
	if player == nil then
		return pushThing(nil)
	end
	return pushThing(player:getSlotItem(slot))
end
function getPlayerItemById(cid, deepSearch, itemId, ...)
	local player = Player(cid)
	if player == nil then
		return pushThing(nil)
	end
	return pushThing(player:getItemById(itemId, deepSearch, ...))
end
function getPlayerFood(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end
	local c = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT) return c ~= nil and math.floor(c:getTicks() / 1000) or 0
end
function canPlayerLearnInstantSpell(cid, name) local p = Player(cid) return p ~= nil and p:canLearnSpell(name) or false end
function getPlayerLearnedInstantSpell(cid, name) local p = Player(cid) return p ~= nil and p:hasLearnedSpell(name) or false end
function isPremium(cid) local p = Player(cid) return p ~= nil and p:isPremium() or false end
function getPlayersByIPAddress(ip, mask)
	if mask == nil then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player:getId()
		end
	end
	return result
end
function getPlayersByAccountNumber(accountNumber)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player:getId()
		end
	end
	return result
end
function getPlayerGUIDByName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getGuid()
	end

	local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local guid = result.getDataInt(resultId, "id")
		result.free(resultId)
		return guid
	end
	return 0
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

function doPlayerAddItemEx(cid, uid, ...) local p = Player(cid) return p ~= nil and p:addItemEx(Item(uid), ...) or false end
function canPlayerWearOutfit(cid, lookType, addons) local p = Player(cid) return p ~= nil and p:hasOutfit(lookType, addons) or false end
function doPlayerAddManaSpent(cid, mana) local p = Player(cid) return p ~= nil and p:addManaSpent(mana * configManager.getNumber(configKeys.RATE_MAGIC)) or false end
function doPlayerJoinParty(cid, leaderId)
	local player = Player(cid)
	if player == nil then
		return false
	end

	if player:getParty() ~= nil then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are already in a party.")
		return true
	end

	local leader = Player(leaderId)
	if leader == nil then
		return false
	end

	local party = leader:getParty()
	if party == nil or party:getLeader() ~= leader then
		return true
	end

	for _, invitee in ipairs(party:getInvitees()) do
		if player ~= invitee then
			return true
		end
	end

	party:addMember(player)
	return true
end
function getPartyMembers(cid)
	local player = Player(cid)
	if player == nil then
		return false
	end

	local party = player:getParty()
	if party == nil then
		return false
	end

	local result = {party:getLeader():getId()}
	for _, member in ipairs(party:getMembers()) do
		result[#result + 1] = member:getId()
	end
	return result
end

function getMonsterTargetList(cid)
	local monster = Monster(cid)
	if monster == nil then
		return false
	end

	local result = {}
	for _, creature in ipairs(monster:getTargetList()) do
		if monster:isTarget(creature) then
			result[#result + 1] = creature:getId()
		end
	end
	return result
end
function getMonsterFriendList(cid)
	local monster = Monster(cid)
	if monster == nil then
		return false
	end

	local z = monster:getPosition().z

	local result = {}
	for _, creature in ipairs(monster:getFriendList()) do
		if not creature:isRemoved() and creature:getPosition().z == z then
			result[#result + 1] = creature:getId()
		end
	end
	return result
end
function doSetMonsterTarget(cid, target)
	local monster = Monster(cid)
	if monster == nil then
		return false
	end

	if monster:getMaster() ~= nil then
		return true
	end

	local target = Creature(cid)
	if target == nil then
		return false
	end

	monster:selectTarget(target)
	return true
end
function doMonsterChangeTarget(cid)
	local monster = Monster(cid)
	if monster == nil then
		return false
	end

	if monster:getMaster() ~= nil then
		return true
	end

	monster:searchTarget(1)
	return true
end
function doConvinceCreature(cid, target)
	local creature = Creature(cid)
	if creature == nil then
		return false
	end

	local targetCreature = Creature(target)
	if targetCreature == nil then
		return false
	end

	targetCreature:setMaster(creature)
	return true
end

function getTownId(townName) local t = Town(townName) return t ~= nil and t:getId() or false end
function getTownName(townId) local t = Town(townId) return t ~= nil and t:getName() or false end
function getTownTemplePosition(townId) local t = Town(townId) return t ~= nil and t:getTemplePosition() or false end

function doSetItemActionId(uid, actionId) local i = Item(uid) return i ~= nil and i:setActionId(actionId) or false end
function doTransformItem(uid, newItemId, ...) local i = Item(uid) return i ~= nil and i:transform(newItemId, ...) or false end
function doChangeTypeItem(uid, newType) local i = Item(uid) return i ~= nil and i:transform(i:getId(), newType) or false end
function doRemoveItem(uid, ...) local i = Item(uid) return i ~= nil and i:remove(...) or false end

function getContainerCap(uid) local c = Container(uid) return c ~= nil and c:getCapacity() or false end
function getContainerItem(uid, slot)
	local container = Container(uid)
	if container == nil then
		return pushThing(nil)
	end
	return pushThing(container:getItem(slot))
end

function doAddContainerItemEx(uid, virtualId)
	local container = Container(uid)
	if container == nil then
		return false
	end

	local res = container:addItemEx(Item(virtualId))
	if res == nil then
		return false
	end
	return res
end

function doSendMagicEffect(pos, magicEffect, ...) return Position(pos):sendMagicEffect(magicEffect, ...) end
function doSendDistanceShoot(fromPos, toPos, distanceEffect, ...) return Position(fromPos):sendDistanceEffect(toPos, distanceEffect, ...) end
function isSightClear(fromPos, toPos, floorCheck) return Position(fromPos):isSightClear(toPos, floorCheck) end

function getPromotedVocation(vocationId)
	local vocation = Vocation(vocationId)
	if vocation == nil then
		return 0
	end

	local promotedVocation = vocation:getPromotion()
	if promotedVocation == nil then
		return 0
	end
	return promotedVocation:getId()
end

function getGuildId(guildName)
	local resultId = db.storeQuery("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(guildName))
	if resultId == false then
		return false
	end

	local guildId = result.getDataInt(resultId, "id")
	result.free(resultId)
	return guildId
end

function isItemStackable(itemId) return ItemType(itemId):isStackable() end
function isItemRune(itemId) return ItemType(itemId):isRune() end
function isItemDoor(itemId) return ItemType(itemId):isDoor() end
function isItemContainer(itemId) return ItemType(itemId):isContainer() end
function isItemFluidContainer(itemId) return ItemType(itemId):isFluidContainer() end
function isItemMovable(itemId) return ItemType(itemId):isMovable() end
function isCorpse(uid) local i = Item(uid) return i ~= nil and ItemType(i:getId()):isCorpse() or false end

isItemMoveable = isItemMovable
isMoveable = isMovable

function getItemName(itemId) return ItemType(itemId):getName() end
function getItemWeight(itemId, ...) return ItemType(itemId):getWeight(...) end
function getItemDescriptions(itemId)
	local itemType = ItemType(itemId)
	return {
		name = itemType:getName(),
		plural = itemType:getPluralName(),
		article = itemType:getArticle(),
		description = itemType:getDescription()
	}
end
function getItemIdByName(name)
	local id = ItemType(name):getId()
	if id == 0 then
		return false
	end
	return id
end
function getItemWeightByUID(uid, ...)
	local item = Item(uid)
	if item == nil then
		return false
	end

	local itemType = ItemType(item:getId())
	return itemType:isStackable() and itemType:getWeight(item:getCount(), ...) or itemType:getWeight(1, ...)
end
function getItemRWInfo(uid)
	local item = Item(uid)
	if item == nil then
		return false
	end

	local rwFlags = 0
	local itemType = ItemType(item:getId())
	if itemType:isReadable() then
		rwFlags = bit.bor(rwFlags, 1)
	end

	if itemType:isWritable() then
		rwFlags = bit.bor(rwFlags, 2)
	end
	return rwFlags
end

function doSetItemText(uid, text)
	local item = Item(uid)
	if item == nil then
		return false
	end

	if text ~= "" then
		item:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		item:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
	return true
end
function doSetItemSpecialDescription(uid, desc)
	local item = Item(uid)
	if item == nil then
		return false
	end

	if desc ~= "" then
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, desc)
	else
		item:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
	return true
end
function doDecayItem(uid) local i = Item(uid) return i ~= nil and i:decay() or false end

function setHouseOwner(id, guid) local h = House(id) return h ~= nil and h:setOwnerGuid(guid) or false end
function getHouseRent(id) local h = House(id) return h ~= nil and h:getRent() or nil end
function getHouseAccessList(id, listId) local h = House(id) return h ~= nil and h:getAccessList(listId) or nil end
function setHouseAccessList(id, listId, listText) local h = House(id) return h ~= nil and h:setAccessList(listId, listText) or false end

function getHouseByPlayerGUID(playerGUID)
	for _, house in ipairs(Game.getHouses()) do
		if house:getOwnerGuid() == playerGUID then
			return house:getId()
		end
	end
	return nil
end

function getTileHouseInfo(pos)
	local t = Tile(pos)
	if t == nil then
		return false
	end
	local h = t:getHouse()
	return h ~= nil and h:getId() or false
end

function getTilePzInfo(position)
	local t = Tile(position)
	if t == nil then
		return false
	end
	return t:hasFlag(TILESTATE_PROTECTIONZONE)
end

function getTileInfo(position)
	local t = Tile(position)
	if t == nil then
		return false
	end

	local ret = pushThing(t:getGround())
	ret.protection = t:hasFlag(TILESTATE_PROTECTIONZONE)
	ret.nopz = ret.protection
	ret.nologout = t:hasFlag(TILESTATE_NOLOGOUT)
	ret.refresh = t:hasFlag(TILESTATE_REFRESH)
	ret.house = t:hasFlag(TILESTATE_HOUSE)
	ret.bed = t:hasFlag(TILESTATE_BED)
	ret.depot = t:hasFlag(TILESTATE_DEPOT)

	ret.things = t:getThingCount()
	ret.creatures = t:getCreatureCount()
	ret.items = t:getItemCount()
	ret.topItems = t:getTopItemCount()
	ret.downItems = t:getDownItemCount()
	return ret
end

function getTileItemByType(position, itemType)
	local t = Tile(position)
	if t == nil then
		return pushThing(nil)
	end
	return pushThing(t:getItemByType(itemType))
end

function getTileItemById(position, itemId, ...)
	local t = Tile(position)
	if t == nil then
		return pushThing(nil)
	end
	return pushThing(t:getItemById(itemId, ...))
end

function getTileThingByPos(position)
	local t = Tile(position)
	if t == nil then
		if position.stackpos == -1 then
			return -1
		end
		return pushThing(nil)
	end

	if position.stackpos == -1 then
		return t:getThingCount()
	end
	return pushThing(t:getThing(position.stackpos))
end

function getTileThingByTopOrder(position, topOrder)
	local t = Tile(position)
	if t == nil then
		return pushThing(nil)
	end
	return pushThing(t:getItemByTopOrder(topOrder))
end

function getTopCreature(position)
	local t = Tile(position)
	if t == nil then
		return pushThing(nil)
	end
	return pushThing(t:getTopCreature())
end

function queryTileAddThing(thing, position, ...) local t = Tile(position) return t ~= nil and t:queryAdd(thing, ...) or false end

function doTeleportThing(uid, dest, pushMovement)
	if type(uid) == "userdata" then
		if uid:isCreature() then
			return uid:teleportTo(dest, pushMovement or false)
		else
			return uid:moveTo(dest)
		end
	else
		if uid >= 0x10000000 then
			local creature = Creature(uid)
			if creature ~= nil then
				return creature:teleportTo(dest, pushMovement or false)
			end
		else
			local item = Item(uid)
			if item ~= nil then
				return item:moveTo(dest)
			end
		end
	end
	return false
end

function getThingPos(uid)
	local thing
	if uid >= 0x10000000 then
		thing = Creature(uid)
	else
		thing = Item(uid)
	end

	if thing == nil then
		return false
	end

	local stackpos = 0
	local tile = thing:getTile()
	if tile ~= nil then
		stackpos = tile:getThingIndex(thing)
	end

	local position = thing:getPosition()
	position.stackpos = stackpos
	return position
end

function doRelocate(fromPos, toPos)
	if fromPos == toPos then
		return false
	end

	local fromTile = Tile(fromPos)
	if fromTile == nil then
		return false
	end

	if Tile(toPos) == nil then
		return false
	end

	for i = fromTile:getThingCount() - 1, 0, -1 do
		local thing = fromTile:getThing(i)
		if thing ~= nil then
			if thing:isItem() then
				if ItemType(thing:getId()):isMovable() then
					thing:moveTo(toPos)
				end
			elseif thing:isCreature() then
				thing:teleportTo(toPos)
			end
		end
	end
	return true
end

function getThing(uid)
	return uid >= 0x10000000 and pushThing(Creature(uid)) or pushThing(Item(uid))
end

function getConfigInfo(info)
	if type(info) ~= "string" then
		return nil
	end
	dofile('config.lua')
	return _G[info]
end

function getWorldCreatures(type)
	if type == 0 then
		return Game.getPlayerCount()
	elseif type == 1 then
		return Game.getMonsterCount()
	elseif type == 2 then
		return Game.getNpcCount()
	end
	return Game.getPlayerCount() + Game.getMonsterCount() + Game.getNpcCount()
end

function targetPositionToVariant(position)
	local variant = Variant(position)
	variant.type = VARIANT_TARGETPOSITION
	return variant
end

function doCreateTeleport(itemId, destination, position)
	local item = Game.createItem(itemId, 1, position)
	if not item:isTeleport() then
		item:remove()
		return false
	end
	item:setDestination(destination)
	return item:getUniqueId()
end

function getSpectators(centerPos, rangex, rangey, multifloor, onlyPlayers)
	local result = Game.getSpectators(centerPos, multifloor, onlyPlayers or false, rangex, rangex, rangey, rangey)
	if #result == 0 then
		return nil
	end

	for index, spectator in ipairs(result) do
		result[index] = spectator:getId()
	end
	return result
end

function broadcastMessage(message, messageType)
	Game.broadcastMessage(message, messageType)
	print("> Broadcasted message: \"" .. message .. "\".")
end
