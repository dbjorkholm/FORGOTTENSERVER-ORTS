function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if player:getStorageValue(Storage.SvargrondArena.Arena) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This door seems to be sealed against unwanted intruders.')
		return true
	end

	-- Doors to rewards
	if isInArray({SvargrondArena.actionGreenhorn, SvargrondArena.actionScrapper, SvargrondArena.actionWarlord}, item.actionid) then
		if player:getStorageValue(item.actionid) <= 0 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It\'s locked.')
			return true
		end

		-- Cannot use opened door
		if item.itemid == 5133 then
			return false
		end
		Item(item.uid):transform(item.itemid + 1)
		player:teleportTo(toPosition, true)

	-- Arena entrance doors
	else
		if player:getStorageValue(Storage.SvargrondArena.Pit) ~= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This door seems to be sealed against unwanted intruders.')
			return true
		end

		-- Cannot use opened door
		if item.itemid == 5133 then
			return false
		end
		Item(item.uid):transform(item.itemid + 1)
		player:teleportTo(toPosition, true)
	end

	return true
end
