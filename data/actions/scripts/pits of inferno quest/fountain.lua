function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if getPlayerStorageValue(cid, 0611141300) =~ 1 then
	setPlayerStorageValue(cid, 0611141300, 1)
	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:addAchievement('Fountain of Life')
	player:say('You feel very refreshed and relaxed.', TALKTYPE_MONSTER_SAY)
	return true
end
