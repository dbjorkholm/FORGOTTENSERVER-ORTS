COMBAT_POISONDAMAGE = COMBAT_EARTHDAMAGE
CONDITION_EXHAUST = CONDITION_EXHAUST_WEAPON
TALKTYPE_ORANGE_1 = TALKTYPE_MONSTER_SAY
TALKTYPE_ORANGE_2 = TALKTYPE_MONSTER_YELL

function pushThing(thing)
	local t = {uid = 0, itemid = 0, type = 0, actionid = 0}
	if thing then
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

function isCreature(cid) return Creature(cid) end
function isPlayer(cid) return Player(cid) end
function isMonster(cid) return Monster(cid) end
function isSummon(cid) return Creature(cid):getMaster() end
function isNpc(cid) return Npc(cid) end
function isItem(uid) return Item(uid) end
function isContainer(uid) return Container(uid) end

function getCreatureName(cid) local c = Creature(cid) return c and c:getName() end
function getCreatureHealth(cid) local c = Creature(cid) return c and c:getHealth() end
function getCreatureMaxHealth(cid) local c = Creature(cid) return c and c:getMaxHealth() end
function getCreaturePosition(cid) local c = Creature(cid) return c and c:getPosition() end
function getCreatureOutfit(cid) local c = Creature(cid) return c and c:getOutfit() end
function getCreatureSpeed(cid) local c = Creature(cid) return c and c:getSpeed() end
function getCreatureBaseSpeed(cid) local c = Creature(cid) return c and c:getBaseSpeed() end

function getCreatureTarget(cid)
	local c = Creature(cid)
	if c then
		local target = c:getTarget()
		return target and target:getId() or 0
	end
	return false
end

function getCreatureMaster(cid)
	local c = Creature(cid)
	if c then
		local master = c:getMaster()
		return master and master:getId() or c:getId()
	end
	return false
end

function getCreatureSummons(cid)
	local c = Creature(cid)
	if not c then
		return false
	end

	local result = {}
	for _, summon in ipairs(c:getSummons()) do
		result[#result + 1] = summon:getId()
	end
	return result
end

getCreaturePos = getCreaturePosition

function doCreatureAddHealth(cid, health) local c = Creature(cid) return c and c:addHealth(health) end
function doRemoveCreature(cid) local c = Creature(cid) return c and c:remove() end
function doCreatureSetLookDir(cid, direction) local c = Creature(cid) return c and c:setDirection(direction) end
function doCreatureSay(cid, text, type, ...) local c = Creature(cid) return c and c:say(text, type, ...) end
function doCreatureChangeOutfit(cid, outfit) local c = Creature(cid) return c and c:setOutfit(outfit) end
function doSetCreatureDropLoot(cid, doDrop) local c = Creature(cid) return c and c:setDropLoot(doDrop) end
function doChangeSpeed(cid, delta) local c = Creature(cid) return c and c:changeSpeed(delta) end

doSetCreatureDirection = doCreatureSetLookDir

function registerCreatureEvent(cid, name) local c = Creature(cid) return c and c:registerEvent(name) end
function unregisterCreatureEvent(cid, name) local c = Creature(cid) return c and c:unregisterEvent(name) end

function getPlayerByName(name) local p = Player(name) return p and p:getId() end
function getIPByPlayerName(name) local p = Player(name) return p and p:getIp() end
function getPlayerGUID(cid) local p = Player(cid) return p and p:getGuid() end
function getPlayerIp(cid) local p = Player(cid) return p and p:getIp() end
function getPlayerAccountType(cid) local p = Player(cid) return p and p:getAccountType() end
function getPlayerLastLoginSaved(cid) local p = Player(cid) return p and p:getLastLoginSaved() end
function getPlayerName(cid) local p = Player(cid) return p and p:getName() end
function getPlayerFreeCap(cid) local p = Player(cid) return p and p:getFreeCapacity() end
function getPlayerPosition(cid) local p = Player(cid) return p and p:getPosition() end
function getPlayerMagLevel(cid) local p = Player(cid) return p and p:getMagicLevel() end
function getPlayerAccess(cid)
	local player = Player(cid)
	if not player then
		return false
	end
	return player:getGroup():getAccess() and 1 or 0
end
function getPlayerSkill(cid, skillId) local p = Player(cid) return p and p:getSkillLevel(skillId) end
function getPlayerMana(cid) local p = Player(cid) return p and p:getMana() end
function getPlayerMaxMana(cid) local p = Player(cid) return p and p:getMaxMana() end
function getPlayerLevel(cid) local p = Player(cid) return p and p:getLevel() end
function getPlayerTown(cid) local p = Player(cid) return p and p:getTown():getId() end
function getPlayerVocation(cid) local p = Player(cid) return p and p:getVocation():getId() end
function getPlayerSoul(cid) local p = Player(cid) return p and p:getSoul() end
function getPlayerSex(cid) local p = Player(cid) return p and p:getSex() end
function getPlayerStorageValue(cid, key) local p = Player(cid) return p and p:getStorageValue(key) end
function getPlayerBalance(cid) local p = Player(cid) return p and p:getBankBalance() end
function getPlayerMoney(cid) local p = Player(cid) return p and p:getMoney() end
function getPlayerGroupId(cid) local p = Player(cid) return p and p:getGroup():getId() end
function getPlayerLookDir(cid) local p = Player(cid) return p and p:getDirection() end
function getPlayerLight(cid) local p = Player(cid) return p and p:getLight() end
function getPlayerDepotItems(cid, depotId) local p = Player(cid) return p and p:getDepotItems(depotId) end
function getPlayerSkullType(cid) local p = Player(cid) return p and p:getSkull() end
function getPlayerLossPercent(cid) local p = Player(cid) return p and p:getDeathPenalty() end
function getPlayerMount(cid, mountId) local p = Player(cid) return p and p:hasMount(mountId) end
function getPlayerPremiumDays(cid) local p = Player(cid) return p and p:getPremiumDays() end
function getPlayerBlessing(cid, blessing) local p = Player(cid) return p and p:hasBlessing(blessing) end
function getPlayerParty(cid)
	local player = Player(cid)
	if not player then
		return false
	end

	local party = player:getParty()
	if not party then
		return nil
	end
	return party:getLeader():getId()
end
function getPlayerGuildId(cid)
	local player = Player(cid)
	if not player then
		return false
	end

	local guild = player:getGuild()
	if not guild then
		return false
	end
	return guild:getId()
end
function getPlayerGuildLevel(cid) local p = Player(cid) return p and p:getGuildLevel() end
function getPlayerGuildName(cid)
	local player = Player(cid)
	if not player then
		return false
	end

	local guild = player:getGuild()
	if not guild then
		return false
	end
	return guild:getName()
end
function getPlayerGuildRank(cid)
	local player = Player(cid)
	if not player then
		return false
	end

	local guild = player:getGuild()
	if guild then
		return false
	end

	local rank = guild:getRankByLevel(player:getGuildLevel())
	return rank and rank.name
end
function getPlayerGuildNick(cid) local p = Player(cid) return p and p:getGuildNick() end
function getPlayerMasterPos(cid) local p = Player(cid) return p and p:getTown():getTemplePosition() end
function getPlayerItemCount(cid, itemId, ...) local p = Player(cid) return p and p:getItemCount(itemId, ...) end
function getPlayerSlotItem(cid, slot)
	local player = Player(cid)
	if not player then
		return pushThing(nil)
	end
	return pushThing(player:getSlotItem(slot))
end
function getPlayerItemById(cid, deepSearch, itemId, ...)
	local player = Player(cid)
	if not player then
		return pushThing(nil)
	end
	return pushThing(player:getItemById(itemId, deepSearch, ...))
end
function getPlayerFood(cid)
	local player = Player(cid)
	if not player then
		return false
	end
	local c = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT) return c ~= nil and math.floor(c:getTicks() / 1000) or 0
end
function canPlayerLearnInstantSpell(cid, name) local p = Player(cid) return p and p:canLearnSpell(name) end
function getPlayerLearnedInstantSpell(cid, name) local p = Player(cid) return p and p:hasLearnedSpell(name) end
function isPlayerGhost(cid) local p = Player(cid) return p and p:isInGhostMode() end
function isPlayerPzLocked(cid) local p = Player(cid) return p and p:isPzLocked() end
function isPremium(cid) local p = Player(cid) return p and p:isPremium() end
function getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player:getId()
		end
	end
	return result
end
function getOnlinePlayers()
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		result[#result + 1] = player:getName()
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
	if player then
		return player:getGuid()
	end

	local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId then
		local guid = result.getDataInt(resultId, "id")
		result.free(resultId)
		return guid
	end
	return 0
end
function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId then
		local accountId = result.getDataInt(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

getPlayerAccountBalance = getPlayerBalance
getIpByName = getIPByPlayerName

function setPlayerStorageValue(cid, key, value) local p = Player(cid) return p and p:setStorageValue(key, value) end
function doPlayerSetBalance(cid, balance) local p = Player(cid) return p and p:setBankBalance(balance) end
function doPlayerAddMoney(cid, money) local p = Player(cid) return p and p:addMoney(money) end
function doPlayerRemoveMoney(cid, money) local p = Player(cid) return p and p:removeMoney(money) end
function doPlayerAddSoul(cid, soul) local p = Player(cid) return p and p:addSoul(soul) end
function doPlayerSetVocation(cid, vocation) local p = Player(cid) return p and p:setVocation(Vocation(vocation)) end
function doPlayerSetTown(cid, town) local p = Player(cid) return p and p:setTown(Town(town)) end
function setPlayerGroupId(cid, groupId) local p = Player(cid) return p and p:setGroup(Group(groupId)) end
function doPlayerSetSex(cid, sex) local p = Player(cid) return p and p:setSex(sex) end
function doPlayerSetGuildLevel(cid, level) local p = Player(cid) return p and p:setGuildLevel(level) end
function doPlayerSetGuildNick(cid, nick) local p = Player(cid) return p and p:setGuildNick(nick) end
function doShowTextDialog(cid, itemId, text) local p = Player(cid) return p and p:showTextDialog(itemId, text) end
function doPlayerAddItemEx(cid, uid, ...) local p = Player(cid) return p and p:addItemEx(Item(uid), ...) end
function doPlayerAddPremiumDays(cid, days) local p = Player(cid) return p and p:addPremiumDays(days) end
function doPlayerRemovePremiumDays(cid, days) local p = Player(cid) return p and p:removePremiumDays(days) end
function doPlayerAddBlessing(cid, blessing) local p = Player(cid) return p and p:addBlessing(blessing) end
function doPlayerAddOutfit(cid, lookType, addons) local p = Player(cid) return p and p:addOutfitAddon(lookType, addons) end
function doPlayerRemOutfit(cid, lookType, addons)
	local player = Player(cid)
	if not player then
		return false
	end
	if addons == 255 then
		return player:removeOutfit(lookType)
	else
		return player:removeOutfitAddon(lookType, addons)
	end
end
function canPlayerWearOutfit(cid, lookType, addons) local p = Player(cid) return p and p:hasOutfit(lookType, addons) end
function doPlayerAddMount(cid, mountId) local p = Player(cid) return p and p:addMount(mountId) end
function doPlayerRemoveMount(cid, mountId) local p = Player(cid) return p and p:removeMount(mountId) end
function doPlayerSendCancel(cid, text) local p = Player(cid) return p and p:sendCancelMessage(text) end
function doPlayerFeed(cid, food) local p = Player(cid) return p and p:feed(food) end
function playerLearnInstantSpell(cid, name) local p = Player(cid) return p and p:learnSpell(name) end
function doPlayerPopupFYI(cid, message) local p = Player(cid) return p and p:popupFYI(message) end
function doSendTutorial(cid, tutorialId) local p = Player(cid) return p and p:sendTutorial(tutorialId) end
function doAddMapMark(cid, pos, type, description) local p = Player(cid) return p and p:addMapMark(pos, type, description or "") end
function doPlayerSendTextMessage(cid, type, text, ...) local p = Player(cid) return p and p:sendTextMessage(type, text, ...) end
function doSendAnimatedText() debugPrint("Deprecated function.") return true end
function doPlayerAddExp(cid, exp, useMult, ...)
	local player = Player(cid)
	if not player then
		return false
	end

	if useMult then
		exp = exp * Game.getExperienceStage(player:getLevel())
	end
	return player:addExperience(exp, ...)
end
function doPlayerAddManaSpent(cid, mana) local p = Player(cid) return p and p:addManaSpent(mana * configManager.getNumber(configKeys.RATE_MAGIC)) end
function doPlayerAddSkillTry(cid, skillid, n) local p = Player(cid) return p and p:addSkillTries(skillid, n * configManager.getNumber(configKeys.RATE_SKILL)) end
function doPlayerAddMana(cid, mana, ...) local p = Player(cid) return p and p:addMana(mana, ...) end
function doPlayerJoinParty(cid, leaderId)
	local player = Player(cid)
	if not player then
		return false
	end

	if player:getParty() ~= nil then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already in a party.")
		return true
	end

	local leader = Player(leaderId)
	if not leader then
		return false
	end

	local party = leader:getParty()
	if not party or party:getLeader() ~= leader then
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
	if not player then
		return false
	end

	local party = player:getParty()
	if not party then
		return false
	end

	local result = {party:getLeader():getId()}
	for _, member in ipairs(party:getMembers()) do
		result[#result + 1] = member:getId()
	end
	return result
end

doPlayerSendDefaultCancel = doPlayerSendCancel

function getMonsterTargetList(cid)
	local monster = Monster(cid)
	if not monster then
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
	if not monster then
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
	if not monster then
		return false
	end

	if monster:getMaster() then
		return true
	end

	local target = Creature(cid)
	if not target then
		return false
	end

	monster:selectTarget(target)
	return true
end
function doMonsterChangeTarget(cid)
	local monster = Monster(cid)
	if not monster then
		return false
	end

	if monster:getMaster() then
		return true
	end

	monster:searchTarget(1)
	return true
end
function doCreateNpc(name, pos, ...)
	local npc = Game.createNpc(name, pos, ...) return npc and npc:setMasterPos(pos)
end
function doSummonCreature(name, pos, ...)
	local m = Game.createMonster(name, pos, ...) return m and m:getId()
end
function doConvinceCreature(cid, target)
	local creature = Creature(cid)
	if not creature then
		return false
	end

	local targetCreature = Creature(target)
	if not targetCreature then
		return false
	end

	targetCreature:setMaster(creature)
	return true
end

function getTownId(townName) local t = Town(townName) return t and t:getId() end
function getTownName(townId) local t = Town(townId) return t and t:getName() end
function getTownTemplePosition(townId) local t = Town(townId) return t and t:getTemplePosition() end

function doSetItemActionId(uid, actionId) local i = Item(uid) return i and i:setActionId(actionId) end
function doTransformItem(uid, newItemId, ...) local i = Item(uid) return i and i:transform(newItemId, ...) end
function doChangeTypeItem(uid, newType) local i = Item(uid) return i and i:transform(i:getId(), newType) end
function doRemoveItem(uid, ...) local i = Item(uid) return i and i:remove(...) end

function getContainerSize(uid) local c = Container(uid) return c and c:getSize() end
function getContainerCap(uid) local c = Container(uid) return c and c:getCapacity() end
function getContainerItem(uid, slot)
	local container = Container(uid)
	if not container then
		return pushThing(nil)
	end
	return pushThing(container:getItem(slot))
end

function doAddContainerItemEx(uid, virtualId)
	local container = Container(uid)
	if not container then
		return false
	end

	local res = container:addItemEx(Item(virtualId))
	if not res then
		return false
	end
	return res
end

function doSendMagicEffect(pos, magicEffect, ...) return Position(pos):sendMagicEffect(magicEffect, ...) end
function doSendDistanceShoot(fromPos, toPos, distanceEffect, ...) return Position(fromPos):sendDistanceEffect(toPos, distanceEffect, ...) end
function isSightClear(fromPos, toPos, floorCheck) return Position(fromPos):isSightClear(toPos, floorCheck) end

function getPromotedVocation(vocationId)
	local vocation = Vocation(vocationId)
	if not vocation then
		return 0
	end

	local promotedVocation = vocation:getPromotion()
	if not promotedVocation then
		return 0
	end
	return promotedVocation:getId()
end

function getGuildId(guildName)
	local resultId = db.storeQuery("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(guildName))
	if not resultId then
		return false
	end

	local guildId = result.getDataInt(resultId, "id")
	result.free(resultId)
	return guildId
end

function getHouseName(houseId) local h = House(houseId) return h and h:getName() end
function getHouseOwner(houseId) local h = House(houseId) return h and h:getOwnerGuid() end
function getHouseEntry(houseId) local h = House(houseId) return h and h:getExitPosition() end
function getHouseTown(houseId) local h = House(houseId) if not h then return false end local t = h:getTown() return t and t:getId() end
function getHouseTilesSize(houseId) local h = House(houseId) return h and h:getTileCount() end

function isItemStackable(itemId) return ItemType(itemId):isStackable() end
function isItemRune(itemId) return ItemType(itemId):isRune() end
function isItemDoor(itemId) return ItemType(itemId):isDoor() end
function isItemContainer(itemId) return ItemType(itemId):isContainer() end
function isItemFluidContainer(itemId) return ItemType(itemId):isFluidContainer() end
function isItemMovable(itemId) return ItemType(itemId):isMovable() end
function isCorpse(uid) local i = Item(uid) return i and ItemType(i:getId()):isCorpse() end

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
	if not item then
		return false
	end

	local itemType = ItemType(item:getId())
	return itemType:isStackable() and itemType:getWeight(item:getCount(), ...) or itemType:getWeight(1, ...)
end
function getItemRWInfo(uid)
	local item = Item(uid)
	if not item then
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
function getContainerCapById(itemId) return ItemType(itemId):getCapacity() end
function getFluidSourceType(itemId) local it = ItemType(itemId) return it.id ~= 0 and it:getFluidSource() end

function doSetItemText(uid, text)
	local item = Item(uid)
	if not item then
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
	if not item then
		return false
	end

	if desc ~= "" then
		item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, desc)
	else
		item:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
	return true
end
function doDecayItem(uid) local i = Item(uid) return i and i:decay() end

function setHouseOwner(id, guid) local h = House(id) return h and h:setOwnerGuid(guid) end
function getHouseRent(id) local h = House(id) return h and h:getRent() end
function getHouseAccessList(id, listId) local h = House(id) return h and h:getAccessList(listId) end
function setHouseAccessList(id, listId, listText) local h = House(id) return h and h:setAccessList(listId, listText) end

function getTileHouseInfo(pos)
	local t = Tile(pos)
	if not t then
		return false
	end
	local h = t:getHouse()
	return h and h:getId()
end

function getTilePzInfo(position)
	local t = Tile(position)
	if not t then
		return false
	end
	return t:hasFlag(TILESTATE_PROTECTIONZONE)
end

function getTileInfo(position)
	local t = Tile(position)
	if not t then
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
	if not t then
		return pushThing(nil)
	end
	return pushThing(t:getItemByType(itemType))
end

function getTileItemById(position, itemId, ...)
	local t = Tile(position)
	if not t then
		return pushThing(nil)
	end
	return pushThing(t:getItemById(itemId, ...))
end

function getTileThingByPos(position)
	local t = Tile(position)
	if not t then
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
	if not t then
		return pushThing(nil)
	end
	return pushThing(t:getItemByTopOrder(topOrder))
end

function getTopCreature(position)
	local t = Tile(position)
	if not t then
		return pushThing(nil)
	end
	return pushThing(t:getTopCreature())
end

function queryTileAddThing(thing, position, ...) local t = Tile(position) return t and t:queryAdd(thing, ...) end

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
			if creature then
				return creature:teleportTo(dest, pushMovement or false)
			end
		else
			local item = Item(uid)
			if item then
				return item:moveTo(dest)
			end
		end
	end
	return false
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

saveData = saveServer

function getGlobalStorageValue(key)
	return Game.getStorageValue(key) or -1
end

function setGlobalStorageValue(key, value)
	Game.setStorageValue(key, value)
	return true
end

getWorldType = Game.getWorldType

numberToVariant = Variant
stringToVariant = Variant
positionToVariant = Variant

function targetPositionToVariant(position)
	local variant = Variant(position)
	variant.type = VARIANT_TARGETPOSITION
	return variant
end

variantToNumber = Variant.getNumber
variantToString = Variant.getString
variantToPosition = Variant.getPosition

function doCreateTeleport(itemId, destination, position)
	local item = Game.createItem(itemId, 1, position)
	if not item:isTeleport() then
		item:remove()
		return false
	end
	item:setDestination(destination)
	return item:getUniqueId()
end
