local saveOnAdavance = true
local healOnAdvance = true

function onAdvance(cid, skill, oldLevel, newLevel)
	local player = Player(cid)
        if skill == 8 and newLevel > oldLevel then
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say("LEVEL UP!", TALKTYPE_MONSTER_SAY)
		if healOnAdvance then
			player:addHealth(player:getMaxHealth())
		end
		if saveOnAdavance then
			player:save()
		end
	end
	return true
end
