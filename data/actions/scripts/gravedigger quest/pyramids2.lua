function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4663 or itemEx.actionid == 4664 or itemEx.actionid == 4665 or itemEx.actionid == 4666 or itemEx.actionid == 4667 then
		local player = Player(cid)
		if player:getStorageValue(9937) == 1 and player:getStorageValue(9938) < 1 then
			player:setStorageValue(9938, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		elseif player:getStorageValue(9938) == 1 and player:getStorageValue(9939) < 1 then
			player:setStorageValue(9939, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		elseif getPlayerStorageValue(cid, 9939) == 1 and player:getStorageValue(9940) < 1 then
			player:setStorageValue(9940, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		elseif getPlayerStorageValue(cid, 9940) == 1 and player:getStorageValue(9941) < 1 then
			player:setStorageValue(9941, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		elseif getPlayerStorageValue(cid, 9941) == 1 and player:getStorageValue(9942) < 1 then
			player:setStorageValue(9942, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<screeeech> <squeak> <squeaaaaal>')
		end
	end
	return true
end