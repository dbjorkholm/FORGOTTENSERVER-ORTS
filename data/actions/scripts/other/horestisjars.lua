local config = {
	jarPositions = {
		Position(32991, 32721, 8),
		Position(32940, 32778, 9),
		Position(32985, 32772, 10),
		Position(32936, 32752, 11),
		Position(32979, 32737, 12)
	},
	time = 3600,
	brokenJarId = 13495,
	chance = 5,
	randomText = {'Waaaaaah', 'You are too afraid to destroy this object'},
	bossName = 'Horestis',
	bossPosition = Position(32941, 32793, 12)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 13500 then
		local player = Player(cid)
		if player:getStorageValue(item.actionid) > os.time() then
			player:say('You are too afraid to destroy this object', TALKTYPE_MONSTER_SAY)
			return true
		end
	
		player:setStorageValue(item.actionid, os.time() + config.time)
	
		local rand = math.random(100)
		if rand > config.chance then
			player:say(config.randomText[math.random(#config.randomText)], TALKTYPE_MONSTER_SAY)
			return true
		end
	
		Item(item.uid):transform(config.brokenJarId)
		
		local tile, thing
		for i = 1, #config.jarPositions do
			tile = Tile(config.jarPositions[i])
			if tile then
				thing = tile:getItemById(config.brokenJarId)
				if thing then
					broken = 1
				else
					broken = 0
					break
				end
			end
		end
	
		if broken > 0 then
			Game.createMonster(config.bossName, config.bossPosition)
		end
	else
		Player(cid):say('This jar is already broken!', TALKTYPE_MONSTER_SAY)
	end
	return true
end