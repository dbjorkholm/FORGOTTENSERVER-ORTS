function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 8001 then
		if player:getStorageValue (torage.OutfitQuest.DruidHatAddon) >= 7 then
			if item.itemid == 6261 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end
