function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue (Storage.TheIceIslands.Questline) == 35 then
		player:setStorageValue(Storage.TheIceIslands.Questline, 36)
		player:setStorageValue(Storage.TheIceIslands.Mission09, 2) -- Questlog The Ice Islands Quest, Formorgar Mines 1: The Mission
		local paperItem = player:addItem(1954, 1)
		if paperItem then
			paperItem:setText("<the paper is old and tattered, you can only make out a signature:> Tylaf, apprentice of Hjaern")
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a paper.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end