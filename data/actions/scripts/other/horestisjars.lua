local config = {
	jarPositions = {
		[1] = Position({x = 32991, y = 32721, z = 8}),
		[2] = Position({x = 32940, y = 32778, z = 9}),
		[3] = Position({x = 32985, y = 32772, z = 10}),
		[4] = Position({x = 32936, y = 32752, z = 11}),
		[5] = Position({x = 32979, y = 32737, z = 12})
	},
	time = 3600,
	brokenJarId = 13495,
	chance = 5,
	randomText = {"Waaaaaah", "You are too afraid to destroy this object"},
	bossName = "Horestis",
	bossPosition = Position({x = 32943, y = 32767, z = 12})
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.itemid == 13500 then
		if player:getStorageValue(item.actionid) > os.time() then
			player:say("You are too afraid to destroy this object", TALKTYPE_ORANGE_1)
			return true
		end
	
		player:setStorageValue(item.actionid, os.time() + config["time"])
	
		local rand = math.random(100)
		if rand > config["chance"] then
			player:say(config["randomText"][math.random(#config["randomText"])], TALKTYPE_ORANGE_1)
			return true
		end
	
		Item(item.uid):transform(config["brokenJarId"])
	
		for i = 1, #config["jarPositions"] do
			local tile = config["jarPositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["brokenJarId"])
				if thing and thing:isItem() then
					broken = 1
				else
					broken = 0
					break
				end
			end
		end
	
		if broken > 0 then
			Game.createMonster(config["bossName"], config["bossPosition"])
		end
	else
		player:say("This jar is already broken!", TALKTYPE_ORANGE_1)
	end
	return true
end