local config = {
        storage = 9155,
        bp_id = 1988 -- bp ID
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
        if player:getStorageValue(config.storage) < 1 then
		player:setStorageValue(config.storage, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a backpack.")
		local backpack = player:addItem(config.bp_id, 1)
		backpack:addItem(2648, 1)
		backpack:addItem(2458, 1)
		backpack:addItem(2397, 1)
		local book = backpack:addItem(1950, 1)
		book:setAttribute(ITEM_ATTRIBUTE_TEXT, "I am doomed!\nI know that Hugo lurks somewhere in\nthe bushes in the North. I won't\nsurvive his deadly breath which would\nkill even the mightiest warrior!\nI have no clue how to trick the\ninfamous Hugo but there has to be a\nway! Perhaps alchemy is the key to\nsuccess. I will mix these two potions I\nbought from the travelling dwarf. We'll\nsee what is going to happen. Perhaps it\nmakes me invulnerable to the deadly\nbreath! Then the secrets of the\nNightmare Knights are at my grasp.")		
        else
                player:sendTextMessage(MESSAGE_INFO_DESCR, "The dead human is empty.")
        end
	return true
end