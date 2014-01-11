function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9937) == 1) and (getPlayerStorageValue(cid, 9938) < 1) then
		if itemEx.aid == 4663 or itemEx.aid == 4664 or itemEx.aid == 4665 or itemEx.aid == 4666 or itemEx.aid == 4667 then
			setPlayerStorageValue(cid,9938,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	if (getPlayerStorageValue(cid, 9938) == 1) and (getPlayerStorageValue(cid, 9939) < 1) then
		if itemEx.aid == 4663 or itemEx.aid == 4664 or itemEx.aid == 4665 or itemEx.aid == 4666 or itemEx.aid == 4667 then
			setPlayerStorageValue(cid,9939,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	if (getPlayerStorageValue(cid, 9939) == 1) and (getPlayerStorageValue(cid, 9940) < 1) then
		if itemEx.aid == 4663 or itemEx.aid == 4664 or itemEx.aid == 4665 or itemEx.aid == 4666 or itemEx.aid == 4667 then
			setPlayerStorageValue(cid,9940,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	if (getPlayerStorageValue(cid, 9940) == 1) and (getPlayerStorageValue(cid, 9941) < 1) then
		if itemEx.aid == 4663 or itemEx.aid == 4664 or itemEx.aid == 4665 or itemEx.aid == 4666 or itemEx.aid == 4667 then
			setPlayerStorageValue(cid,9938,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	if (getPlayerStorageValue(cid, 9941) == 1) and (getPlayerStorageValue(cid, 9942) < 1) then
		if itemEx.aid == 4663 or itemEx.aid == 4664 or itemEx.aid == 4665 or itemEx.aid == 4666 or itemEx.aid == 4667 then
			setPlayerStorageValue(cid,9938,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	return true
end