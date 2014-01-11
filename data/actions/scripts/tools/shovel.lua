local holes = {468, 481, 483}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif itemEx.itemid == 7932 then
		doTransformItem(itemEx.uid, 7933)
		doDecayItem(itemEx.uid)	
	elseif itemEx.itemid == 231 then
		local rand = math.random(1, 100)
		if(itemEx.actionid  == 100 and rand <= 20) then
			doTransformItem(itemEx.uid, 489)
			doDecayItem(itemEx.uid)
		elseif rand == 1 then
			doCreateItem(2159, 1, toPosition)
		elseif rand > 95 then
			doSummonCreature("Scarab", toPosition)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	elseif (itemEx.aid == 4654) and (getPlayerStorageValue(cid, 9925) == 1) and (getPlayerStorageValue(cid, 9926) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerAddItem(cid,21250,1)
		setPlayerStorageValue(cid,9926,1)
	elseif (itemEx.aid == 4668) and (getPlayerStorageValue(cid, 9943) == 1) and (getPlayerStorageValue(cid, 9944) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doPlayerAddItem(cid,21250,1)
		setPlayerStorageValue(cid,9944,1)
	elseif isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
        doDecayItem(itemEx.uid)
	else
		return FALSE
	end
	return TRUE
end