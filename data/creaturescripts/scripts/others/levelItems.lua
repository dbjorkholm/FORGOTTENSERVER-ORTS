function onAdvance(cid, skill, oldLevel, newLevel)
	local player = Player(cid)
        if(skill == SKILL_LEVEL) then
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doSendMagicEffect(getPlayerPosition(cid), math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		doCreatureSay(cid, "LEVEL UP!", TALKTYPE_ORANGE_2)
		player:save()
	end
	return true
end