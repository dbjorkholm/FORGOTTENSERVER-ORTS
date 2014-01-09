function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3169) then
		if(getTileItemById({x = 33265, y = 31116, z = 8}, 3687).uid > 0) then
			doTeleportThing(cid, {x = 33265, y = 31116, z = 7})
			doCreatureSay(cid, "The area around the gate is suspiciously quiet, you have a bad feeling about this.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
