function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local blueberryBush = item
	blueberryBush:transform(2786)
	blueberryBush:decay()
	Game.createItem(2677, 3, fromPosition)

	local cStorage = player:getStorageValue(Storage.Achievements.Bluebarian)
	if cStorage < 500 then
		player:setStorageValue(Storage.Achievements.Bluebarian, math.max(1, cStorage) + 1)
	elseif cStorage == 500 then
		player:addAchievement('Bluebarian')
		player:setStorageValue(Storage.Achievements.Bluebarian, 501)
	end
	return true
end
