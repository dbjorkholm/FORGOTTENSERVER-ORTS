local config = {
	storage = 1017,
	item = 1955
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(config["storage"]) == -1 then
		player:setStorageValue(config["storage"], 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a black book.")
		local book = player:addItem(config["item"], 1)
		book:setAttribute(ITEM_ATTRIBUTE_TEXT, "I\nIt is of utmost importance to keep the subject unaware that he is under survey. To begin an inquiry it is necessary to start as casual as possible. The best thing to do is to ask 'how are you?' immediately after the exchange of greeting phrases. If the suspect answers that something troubles him, than immediately ask him about that subject. If not, ask the subject if he had any TROUBLE lately.\nII\nNext, ask him if he thinks that the AUTHORITIES will handle the subject that troubles him. If he states that the authorities will solve the trouble, ask him if he thinks that they could have AVOIDED the trouble in the first place. If he confirms that the trouble could have been avoided, he is to be observed for heretical tendencies. If the suspect has yet not shown any heretic opinion, ask him why he thinks that the GODS would ALLOW that such things are happening. If he claims that he doesn't know, it is implied that he doubts this godly decision and is to be observed for heretical tendencies. If he comes up with an explanation that suggests that the gods lack the power to prevent that such a thing happens, than he is to be observed for heretical tendencies as well. If he answers that only the gods know the answer or that the gods had some plausible reason, like testing humanity, he may have no heretical tendencies at all.\nIII\nIf the suspect claims that he has no trouble at all, ask him if he thinks that the lack of trouble is explained by the FORESIGHT of the AUTHORITIES. If he denies, he is to be observed for heretical tendencies. If he agrees, ask him if he thinks that it is ALSO for the GODS' will that he has no trouble. If he disagrees, he is to be observed for heretical tendencies. If the subject does not show any suspicious b haviour at this point, ask him if he thinks that any TROUBLE will arise in the near FUTURE. If he negates, he obviously will become lax in the line of his duty and he is to be observed for heretical tendencies. If he confirms that trouble might arise, continue as in paragraph II.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end 