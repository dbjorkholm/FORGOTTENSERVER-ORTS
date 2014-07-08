function onStepIn(cid, item, position, fromPosition)
	if(item.actionid == 5092) then
		if(getPlayerLevel(cid) < 3) then
			doTeleportThing(cid, fromPosition)
		end
	end
	return true
end