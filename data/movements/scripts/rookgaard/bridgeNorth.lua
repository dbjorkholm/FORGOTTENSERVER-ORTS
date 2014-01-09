function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 5092) then
		if(getPlayerLevel(cid) < 3) then
			doTeleportThing(cid, lastPosition)
		end
	end
	return true
end