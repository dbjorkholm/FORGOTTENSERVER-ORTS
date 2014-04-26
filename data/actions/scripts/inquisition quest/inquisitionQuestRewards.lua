local rewards = {
	[1300] = 8890,
	[1301] = 8918,
	[1302] = 8881,
	[1303] = 8888,
	[1304] = 8851,
	[1305] = 8924,
	[1306] = 8928,
	[1307] = 8930,
	[1308] = 8854
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 300) < 1) then
		Player(cid):setStorageValue(300, 1)
		Player(cid):setStorageValue(200, 25)
		Player(cid):setStorageValue(12117, 5) -- The Inquisition Questlog- "Mission 7: The Shadow Nexus"
		doPlayerAddItem(cid, rewards[item.uid], 1)
		doTeleportThing(cid, {x = 32317, y = 32261, z = 9})
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found " .. getItemName(rewards[item.uid]) .. ".")
		doPlayerAddExp(cid, 1000000, true, true)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		doTeleportThing(cid, {x = 32317, y = 32261, z = 9})
	end
	return true
end
