function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7804) then
		if(getPlayerStorageValue(cid, 30) >= 41) then
			if(item.itemid == 1257) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1258)
			elseif(item.itemid == 9177) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9178)
			end
		end
	end
	return true
end