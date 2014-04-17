function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
		if itemEx.uid == 12101 then  -- Peninsula 	Omruc 	 Crystal Arrow 	 Helmet Adornment
			if player:getStorageValue(12101) < 1 then
				player:setStorageValue(12101, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2341, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Helmet Adornment.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12102 then  -- Stone 	Thalas 	 Cobrafang Dagger 	 Gem Holder
			if player:getStorageValue(12102) < 1 then
				player:setStorageValue(12102, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2336, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Gem Holder.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12103 then  -- Mountain 	Dipthrah 	 Ornamented Ankh 	 Damaged Helmet
			if player:getStorageValue(12103) < 1 then
				player:setStorageValue(12103, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2339, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Damaged Helmet.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12104 then  -- Shadow 	Mahrdis 	 Burning Heart 	 Helmet Ornament
			if player:getStorageValue(12104) < 1 then
				player:setStorageValue(12104, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2335, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Helmet Ornament.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12105 then  -- Ancient Ruins 	Vashresamun 	 Blue Note 	 Left Horn
			if player:getStorageValue(12105) < 1 then
				player:setStorageValue(12105, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2338, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Left Horn.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12106 then  -- Tarpit 	Morguthis 	 Sword Hilt 	 Right Horn
			if player:getStorageValue(12106) < 1 then
				player:setStorageValue(12106, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2337, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Right Horn.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
		elseif itemEx.uid == 12107 then  -- Oasis 	Rahemos 	 Ancient Rune 	 Helmet Piece
			if player:getStorageValue(12107) < 1 then
				player:setStorageValue(12107, 1) 
				player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
				player:addItem(2340, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a Helmet Piece.")
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
			end
	end
	return true
end
