function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2234) then
		if(getPlayerStorageValue(cid, 330) == 2) then
			if(item.itemid == 1225) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1226)
			elseif(item.itemid == 1226)	then
				doTransformItem(item.uid, 1225)
				doTeleportThing(cid, {x = 32455, y = 31966, z = 14})
			end
		end
	end
	return true
end