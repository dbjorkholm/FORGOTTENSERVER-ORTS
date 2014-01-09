local function doCreateDummy(cid, pos)
	if(getPlayerStorageValue(cid, 902) < 5) then
		if(getTileItemById(pos, 18226).uid > 0) then
			doRemoveItem(getTileItemById(pos, 18226).uid, 1)
		elseif(getTileItemById(pos, 18227).uid > 0) then
			doRemoveItem(getTileItemById(pos, 18227).uid, 1)
		end
		doSendMagicEffect(pos, CONST_ME_POFF)
		doCreateItem(math.random(18226, 18227), 1, pos)
	elseif(getPlayerStorageValue(cid, 902) == 5) then
		if(getTileItemById(pos, 18226).uid > 0) then
			doRemoveItem(getTileItemById(pos, 18226).uid, 1)
		elseif(getTileItemById(pos, 18227).uid > 0) then
			doRemoveItem(getTileItemById(pos, 18227).uid, 1)
		end
		mayNotMove(cid, false)
		setPlayerStorageValue(cid, 900, 9)
	end
	return addEvent(doCreateDummy, 2 * 1000, cid, pos)
end

function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 8030) then
		if(getPlayerStorageValue(cid, 900) == 8) then
			setPlayerStorageValue(cid, 902, 0)
			mayNotMove(cid, true)
			doCreateDummy(cid, {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 5, z = 10})
			doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
		else
			doTeleportThing(cid, lastPosition)
		end
	end
	return true
end