function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7800) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 17) then
			if(item.itemid == 1257) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 1258)
			end
		end
	end
	return true
end