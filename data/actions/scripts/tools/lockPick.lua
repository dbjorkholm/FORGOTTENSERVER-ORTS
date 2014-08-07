function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.uid == 50137 then
		player:addItem(8760, 1)
		player:setStorageValue(Storage.thievesGuild.Mission02, 2)
	else
		return false
	end
	return true
end
