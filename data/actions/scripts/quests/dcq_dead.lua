function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.QuestChests.DCQGhoul) ~= 1 then
		player:setStorageValue(Storage.QuestChests.DCQGhoul, 1)
		local backpack = player:addItem(1988, 1)
		if not backpack then
			return true
		end

		local itemId = { 2648, 2458, 2397 }
		for i = 1, #itemId do
			backpack:addItem(itemId[i], 1)
		end

		local bookItem = backpack:addItem(1950, 1)
		if bookItem then
			bookItem:setText("I am doomed!\nI know that Hugo lurks somewhere in\nthe bushes in the North. I won't\nsurvive his deadly breath which would\nkill even the mightiest warrior!\nI have no clue how to trick the\ninfamous Hugo but there has to be a\nway! Perhaps alchemy is the key to\nsuccess. I will mix these two potions I\nbought from the travelling dwarf. We'll\nsee what is going to happen. Perhaps it\nmakes me invulnerable to the deadly\nbreath! Then the secrets of the\nNightmare Knights are at my grasp.")
		end

		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a backpack.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dead human is empty.")
	end
	return true
end