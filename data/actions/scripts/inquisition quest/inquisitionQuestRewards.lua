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
	local player = Player(cid)
	if(player:getStorageValue(Storage.TheInquisition.Reward) < 1) then
		player:setStorageValue(Storage.TheInquisition.Reward, 1)
		player:setStorageValue(Storage.TheInquisition.Questline, 25)
		player:setStorageValue(Storage.TheInquisition.Mission07, 5) -- The Inquisition Questlog- "Mission 7: The Shadow Nexus"
		player:addItem(rewards[item.uid], 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found " .. getItemName(rewards[item.uid]) .. ".")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
