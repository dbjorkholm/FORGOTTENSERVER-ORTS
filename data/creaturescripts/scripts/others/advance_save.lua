local config = {
	heal = true,
	save = true,
	effect = true
}

function onAdvance(cid, skill, oldLevel, newLevel)
	if skill ~= 8 or newLevel <= oldLevel then
		return true
	end

	local player = Player(cid)
	if config.effect then
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
	end

	if config.heal then
		player:addHealth(player:getMaxHealth())
	end

	if config.save then
		player:save()
	end
	return true
end
