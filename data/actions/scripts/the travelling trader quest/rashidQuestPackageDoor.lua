dofile('data/lib/MissionSelect.lua')
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, Rashid.MissionStart + 1) >= 3) then
		if(item.itemid == 1223) then
			doTeleportThing(cid, toPosition, true)
			doTransformItem(item.uid, 1224)
		end
	end
	return true
end