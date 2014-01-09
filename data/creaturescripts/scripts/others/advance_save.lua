function onAdvance(cid, skill, oldLevel, newLevel)
	local player = Player(cid)
        if skill == SKILL_LEVEL then
		player:addHealth(player:getMaxHealth())
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say("LEVEL UP!", TALKTYPE_ORANGE_1)
		player:save()
	end
	return true
end
