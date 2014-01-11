function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9972) == 1) and (getPlayerStorageValue(cid, 9973) < 1) then
		if(itemEx.aid == 4641) then
			setPlayerStorageValue(cid,9973,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Shadows rise and engulf the candle. The statue flickers in an unearthly light.')
			doRemoveItem(item.uid,1)
		end
	end
	if (getPlayerStorageValue(cid, 9973) == 1) and (getPlayerStorageValue(cid, 9974) < 1) then
		if(itemEx.aid == 4642) then
			setPlayerStorageValue(cid,9974,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The shadows of the statue swallow the candle hungrily.')
			doRemoveItem(item.uid,1)
		end
	end
	if (getPlayerStorageValue(cid, 9974) == 1) and (getPlayerStorageValue(cid, 9975) < 1) then
		if(itemEx.aid == 4643) then
			setPlayerStorageValue(cid,9975,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'A shade emerges and snatches the candle from your hands.')
			doRemoveItem(item.uid,1)
		end
	end
	return true
end