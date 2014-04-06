function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 12055 then
		if player:getStorageValue (12055) > 0 then
			if item.itemid == 1225 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 1226 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 32369, y = 32797, z = 10}, true)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end
