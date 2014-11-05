function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid ~= 4224 then
		return false
	end

	if player:getStorageValue(Storage.SeaOfLightQuest.Questline) ~= 7 then
		return false
	end

	player:getStorageValue(Storage.SeaOfLightQuest.Questline, 8)
	player:setStorageValue(Storage.SeaOfLightQuest.Mission3, 2)
	local destination = Position(32017, 31730, 8)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	Item(item.uid):remove()
	return true
end
