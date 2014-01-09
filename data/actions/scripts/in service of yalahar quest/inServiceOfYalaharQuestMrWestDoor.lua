function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3081) then
		if(getPlayerStorageValue(cid, 30) >= 24) then
			if(item.itemid == 5288) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5289)
				setPlayerStorageValue(cid, 19, 1)
			end
		end
	elseif(item.uid == 3082) then
		if(getPlayerStorageValue(cid, 30) >= 24) then
			if(item.itemid == 6261) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 6262)
				setPlayerStorageValue(cid, 19, 2)
			end
		end
	end
	return true
end