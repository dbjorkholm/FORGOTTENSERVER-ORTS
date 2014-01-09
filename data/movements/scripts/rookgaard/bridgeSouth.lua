function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 5091) then
		doTeleportThing(cid, lastPosition)
	end
	return true
end