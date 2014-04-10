function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 3112 then
		if player:getStorageValue (12001) == 35 then
			player:setStorageValue(12001, 36)
			player:setStorageValue(12033, 2) -- Questlog The Ice Islands Quest, Formorgar Mines 1: The Mission
			local item1a = player:addItem(1954, 1)
			item1a:setAttribute(ITEM_ATTRIBUTE_TEXT, "<the paper is old and tattered, you can only make out a signature:> Tylaf, apprentice of Hjaern")
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a paper.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end