function catchPlayer(cid)
	local player = Player(cid)
	player:setStorageValue(Storage.WrathoftheEmperor.GuardcaughtYou, 1)
	player:setStorageValue(Storage.WrathoftheEmperor.CrateStatus, 0)
	player:teleportTo({x = 33361, y = 31206, z = 8}, false)
	player:say("The guards have spotted you. You were forcibly dragged into a small cell. It looks like you need to build another disguise.", TALKTYPE_MONSTER_SAY)
	return true
end

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if item.actionid == 8015 then
		player:say("You hear guards moving behind doors in the distance. If you have any sort of disguise with you, this is the moment to use it.", TALKTYPE_MONSTER_SAY)
	elseif item.actionid == 8016 then
		if Tile(Position(player:getPosition().y < 31094 and 33080 or 33385, player:getPosition().y, 8)):getItemById(12213) then
			catchPlayer(cid)
		end
	elseif item.actionid == 8017 or item.actionid == 32362 or item.itemid == 11436 then
		catchPlayer(cid)
	elseif item.actionid == 8018 then
		if Game.getStorageValue(8018) ~= 1 then
			catchPlayer(cid)
		end
	elseif item.actionid == 8019 then
		if Game.getStorageValue(8019) ~= 1 then
			catchPlayer(cid)
		end
	elseif item.actionid == 8020 then
		if Game.getStorageValue(8020) ~= 1 then
			catchPlayer(cid)
		end
	elseif item.actionid == 8021 then
		player:say("Guards heavily patrol this area. Try to stay hidden and do not draw any attention to yourself by trying to attack.", TALKTYPE_MONSTER_SAY)
	elseif item.actionid == 8022 then
		if player:getStorageValue(Storage.WrathoftheEmperor.CrateStatus) ~= 1 then
			catchPlayer(cid)
		end
	elseif item.actionid == 8023 then
		-- player:setStorageValue(Storage.WrathoftheEmperor.CrateStatus, 0)
		-- doSetCreatureOutfit(cid, {lookTypeEx = 12496}, 1)
	end
	return true
end
