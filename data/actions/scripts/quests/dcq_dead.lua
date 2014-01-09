local config = {
        storage = 9155,
        key_id = 1988 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if (getPlayerStorageValue(cid, config.storage) < 1) then
        	setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
		doAddContainerItem(key, 2648, 1)
		doAddContainerItem(key, 2458, 1)
		doAddContainerItem(key, 2397, 1)
		local book = doAddContainerItem(key,1950,1)
		doSetItemText(book,"I am doomed!\nI know that Hugo lurks somewhere in\nthe bushes in the North. I won't\nsurvive his deadly breath which would\nkill even the mightiest warrior!\nI have no clue how to trick the\ninfamous Hugo but there has to be a\nway! Perhaps alchemy is the key to\nsuccess. I will mix these two potions I\nbought from the travelling dwarf. We'll\nsee what is going to happen. Perhaps it\nmakes me invulnerable to the deadly\nbreath! Then the secrets of the\nNightmare Knights are at my grasp.")		
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead human is empty.")
        end
	return true
end