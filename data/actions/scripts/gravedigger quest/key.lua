function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9971) == 1) then
		if(itemEx.aid == 4639) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<swoosh> <oomph> <cough, cough>')
			doRemoveItem(item.uid,1)
			doTransformItem(getTileItemById( {x = 33071, y = 32442, z = 11},9624 ).uid, 9625)
		end
	end
	return true
end