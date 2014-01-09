function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 1010) == 2) then
		return (doTeleportThing(cid, {x = 32714, y = 32398, z = 8}))
	end
end