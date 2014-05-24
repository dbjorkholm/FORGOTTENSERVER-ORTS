function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2021) then
		if(getPlayerStorageValue(cid, 231) < 1) then
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found the holy Tible.")
				local book = doPlayerAddItem(cid,1970,1)
					doSetItemText(book,"Banor I praise your name.\nBe with me in the battle.\nBe my shield, let me be your sword.\nI will honour the godly spark in my soul. May it flourish and grow.")
					setPlayerStorageValue(cid, 231, 1)
						else
							doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"The chest is empty.")
								end
									end
	return true
	end
