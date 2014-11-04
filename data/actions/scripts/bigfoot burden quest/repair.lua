function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local targetMonster = Monster(itemEx.uid)
	if not targetMonster then
		return true
	end

	if player:getStorageValue(Storage.BigfootBurden.GolemCount) < 4 and player:getStorageValue(Storage.BigfootBurden.MissionTinkersBell) == 1 and targetMonster:getName():lower() == 'damaged crystal golem' then
		player:setStorageValue(Storage.BigfootBurden.GolemCount, player:getStorageValue(Storage.BigfootBurden.GolemCount) + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The golem has been returned to the gnomish workshop.')
		targetMonster:remove()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end