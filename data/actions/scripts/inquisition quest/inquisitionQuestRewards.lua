local rewards = {
	[1300] = 8851,
	[1301] = 8854,
	[1302] = 8918,
	[1303] = 8930,
	[1304] = 8924,
	[1305] = 8928,
	[1306] = 8888,
	[1307] = 8881,
	[1308] = 8890
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 300) < 1) then
		setPlayerStorageValue(cid, 300, 1)
		setPlayerStorageValue(cid, 200, 25)
		doPlayerAddItem(cid, rewards[item.uid], 1)
		doTeleportThing(cid, {x = 32317, y = 32261, z = 9})
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found " .. getItemNameById(rewards[item.uid]) .. ".")
		doPlayerAddExp(cid, 1000000, true, true)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		doTeleportThing(cid, {x = 32317, y = 32261, z = 9})
	end
	return true
end