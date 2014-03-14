	if(itemEx.actionid  == 1000 and itemEx.itemid == 1369) then
		fromPosition.z = fromPosition.z + 1
		doTeleportThing(cid, fromPosition, FALSE)
	end
	return TRUE
end