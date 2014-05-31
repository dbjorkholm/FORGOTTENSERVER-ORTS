local config = {
	{1, 30, "Enraged White Deer", "The white deer summons all his strength and turns to fight!"},
	{31, 100, "Desperate White Deer", "The white deer desperately tries to escape!"}
}

function onDeath(cid, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local monster = Monster(cid)
	if not monster or monster:getMaster() ~= nil then
		return true
	end
	
	local rand = math.random(100)
	for i = 1, #config do
		if rand >= config[i][1] and rand <= config[i][2] then
			local spawnMonster = Game.createMonster(config[i][3], monster:getPosition())
			if not spawnMonster then
				return true
			end
			
			spawnMonster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			monster:say(config[i][4], TALKTYPE_MONSTER_SAY)
			break
		end
	end
end