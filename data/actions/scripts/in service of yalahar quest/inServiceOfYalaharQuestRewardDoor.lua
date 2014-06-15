function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7811) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 53) then
			if(item.itemid == 1255) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end