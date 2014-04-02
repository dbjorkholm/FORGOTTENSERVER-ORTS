function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 6087 then
		if player:getStorageValue(12050) < 1  then
				player:setStorageValue(12050, 1)
				player:removeItem(6087, 1)
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have learned the first part of a hymn.")
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		else
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already know the first verse of the hymn.", TALKTYPE_ORANGE_1)
		end
	elseif item.itemid == 6088 then
		if player:getStorageValue(12051) < 1 then
				player:setStorageValue(12051, 1)
				player:removeItem(6088, 1)
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have learned the second part of a hymn.")
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		else
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already know the second verse of the hymn.")
		end
	elseif item.itemid == 6089 then
		if player:getStorageValue(12052) < 1 then
				player:setStorageValue(12052, 1)
				player:removeItem(6089, 1)
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have learned the third part of a hymn.")
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		else
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already know the third verse of the hymn.")
		end
	elseif item.itemid == 6090  then
		if player:getStorageValue(12053) < 1 then
				player:setStorageValue(12053, 1)
				player:removeItem(6090, 1)
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have learned the fourth part of a hymn.")
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		else
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already know the fourth verse of the hymn.")
		end
	end
return true
end
