function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2071 then
		if isInRange(player:getPosition(), Position(32695, 31717, 2), Position(32699, 31719, 2)) then
			local lyreProgress = player:getStorageValue(Storage.Diapason.Lyre)
			if lyreProgress < 7
					and player:getStorageValue(Storage.Diapason.Edala) ~= 1
					and player:getStorageValue(Storage.Diapason.LyreTimer) < os.time() then
				player:setStorageValue(Storage.Diapason.Lyre, math.max(0, lyreProgress) + 1)
				player:setStorageValue(Storage.Diapason.Edala, 1)
				player:setStorageValue(Storage.Diapason.LyreTimer, os.time() + 86400)
			end
		end
	end

	item:getPosition():sendMagicEffect(CONST_ME_SOUND_BLUE)
	return true
end
