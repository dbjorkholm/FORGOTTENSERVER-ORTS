function onDeath(cid, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local monster = Monster(cid)
	if not monster or monster:getMaster() ~= nil then
		return true
	end
	
	local rand = math.random(100)
	if rand <= 10 then
		for i = 1, 2 do
			local spawnMonster = Game.createMonster("Elf Scout", monster:getPosition(), true, true)
			if spawnMonster then
				spawnMonster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		end
			
		monster:say("The elves came too late to save the deer, however they might avenge it.", TALKTYPE_MONSTER_SAY)
	end
end