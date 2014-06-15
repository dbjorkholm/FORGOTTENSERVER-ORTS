function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3081) then
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 24) then
			if(item.itemid == 5288) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 5289)
				player:setStorageValue(Storage.InServiceofYalahar.MrWestDoor, 1)
			end
		end
	elseif(item.uid == 3082) then
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 24) then
			if(item.itemid == 6261) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 6262)
				player:setStorageValue(Storage.InServiceofYalahar.MrWestDoor, 2)
			end
		end
	end
	return true
end