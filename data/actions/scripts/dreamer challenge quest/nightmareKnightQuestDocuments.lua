function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3041) then
		if(getPlayerStorageValue(cid, 66) >= 4) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	elseif(item.uid == 3041) then
		if(getPlayerStorageValue(cid, 66) >= 4) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	elseif(item.uid == 3041) then
		if(getPlayerStorageValue(cid, 66) >= 4) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		end
	end
	return true
end