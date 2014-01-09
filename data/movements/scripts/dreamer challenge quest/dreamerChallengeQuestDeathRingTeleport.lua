local pos = {
	{x = 32857, y = 32231, z = 11},
	{x = 32857, y = 32232, z = 11},
	{x = 32857, y = 32233, z = 11}
}

function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 9234) then
		doTeleportThing(cid, {x = 32819, y = 32347, z = 9})
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		for i = 1, 3 do
			if(getTileItemById(pos[i], 2722).uid == 0) then
				doCreateItem(2722, 1, pos[i])
				doSendMagicEffect(pos[i], CONST_ME_MAGIC_BLUE)
			end
		end
	end
	return true
end
			