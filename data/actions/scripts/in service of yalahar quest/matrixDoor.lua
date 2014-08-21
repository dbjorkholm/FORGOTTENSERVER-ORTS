function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 7805 then
		local player = Player(cid)
		if player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 45 then
			if item.itemid == 9277 then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 9278)
			elseif item.itemid == 9279 then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 9280)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
			end
		end
	end
	return true
end