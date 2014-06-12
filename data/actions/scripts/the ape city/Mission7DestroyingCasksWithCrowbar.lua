dofile('data/lib/StorageValues.lua')
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 3551 and item.actionid == 12127 then --door
		if player:getStorageValue (TheApeCity.Questline) >= 16 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end