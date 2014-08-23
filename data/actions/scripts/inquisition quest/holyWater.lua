local doorPosition = Position(32260, 32791, 7)
local shadowNexusPosition = Position(33115, 31702, 12)
local effectPositions = {
	Position(33113, 31702, 12),
	Position(33116, 31702, 12)
}

local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local function nexusMessage(player, message)
	local spectators = Game.getSpectators(shadowNexusPosition, 3, 3, false, true)
	for i = 1, #spectators do
		player:say(message, TALKTYPE_MONSTER_YELL, false, spectators[i], shadowNexusPosition)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	-- Eclipse
	if itemEx.actionid == 2000 then
		Item(item.uid):remove(1)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		-- The Inquisition Questlog- 'Mission 2: Eclipse'
		player:setStorageValue(Storage.TheInquisition.Mission02, 2)
		player:setStorageValue(Storage.TheInquisition.Questline, 5)
		return true

	-- Haunted Ruin
	elseif itemEx.actionid == 2003 then
		if player:getStorageValue(Storage.TheInquisition.Questline) ~= 12 then
			return true
		end

		Game.createMonster('Pirate Ghost', toPosition)
		Item(item.uid):remove(1)

		-- The Inquisition Questlog- 'Mission 4: The Haunted Ruin'
		player:setStorageValue(Storage.TheInquisition.Questline, 13)
		player:setStorageValue(Storage.TheInquisition.Mission04, 2)

		local doorItem = Tile(doorPosition):getItemById(8697)
		if doorItem then
			doorItem:transform(8696)
		end
		addEvent(revertItem, 10 * 1000, doorPosition, 8696, 8697)
		return true
	end

	-- Shadow Nexus
	if isInArray({8753, 8755, 8757}, itemEx.itemid) then
		local nexusItem = Item(itemEx.uid)
		nexusItem:transform(itemEx.itemid + 1)
		nexusItem:decay()
		nexusMessage(player, player:getName() .. ' damaged the shadow nexus! You can\'t damage it while it\'s burning.')
		shadowNexusPosition:sendMagicEffect(CONST_ME_HOLYAREA)

	elseif itemEx.itemid == 8759 then
		if Game.getStorageValue(210) ~= 0 then
			addEvent(Game.setStorageValue, 20 * 1000, 210, 0)
		end

		if player:getStorageValue(cid, Storage.TheInquisition.Questline) < 22 then
			-- The Inquisition Questlog- 'Mission 7: The Shadow Nexus'
			player:setStorageValue(Storage.TheInquisition.Mission07, 2)
			player:setStorageValue(cid, Storage.TheInquisition.Questline, 22)
		end

		for i = 1, #effectPositions do
			effectPositions[i]:sendMagicEffect(CONST_ME_HOLYAREA)
		end

		nexusMessage(player, player:getName() .. ' destroyed the shadow nexus! In 20 seconds it will return to its original state.')
		Item(item.uid):remove(1)
	end
	return true
end
