function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 5091) then
		doTeleportThing(cid, fromPosition)
	end
	return true
end