function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7806) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.MatrixReward) >= 1) then
			if(item.itemid == 9279) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end
