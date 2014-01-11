function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9948) == 1) and (getPlayerStorageValue(cid,9949) < 1) then
		if  getTileItemById( {x = 33071, y = 32442, z = 11},21476 ).uid  then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The scroll burns to dust. The magic stutters. Omrabas\' soul flees to his old hideaway.')
			doPlayerRemoveItem(cid,21251,1)
			setPlayerStorageValue(cid,9949,1)
			doRemoveItem(getTileItemById( {x = 33071, y = 32442, z = 11},21476 ).uid)
			doSummonCreature("Chicken", {x = 33015, y = 32418, z = 11})
		end
	end
	return true
end