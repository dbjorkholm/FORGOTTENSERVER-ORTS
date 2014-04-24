function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local sarcophagus = {x = 32205, y = 31002, z = 14}
	if toPosition.x == sarcophagus.x and toPosition.y == sarcophagus.y and toPosition.z == sarcophagus.z and itemEx.itemid == 7362 and item.itemid == 2361 then
		if getGlobalStorageValue(987) < os.time() then
			setGlobalStorageValue(987, os.time() + 24 * 60 * 60)
			if math.random(1, 2) == 2 then
				player:say("You have awoken the icewitch Yakchal from her slumber! She seems not amused...", TALKTYPE_ORANGE_1)
			else
				player:say("The frozen starlight shattered, but you have awoken the icewitch Yakchal from her slumber! She seems not amused...", TALKTYPE_ORANGE_1)
				doRemoveItem(item.uid, 1)
			end
			doSummonCreature("Yakchal", toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			for i = 1, 4 do
				if i == 1 then
					creature = "ice golem"
				elseif i == 2 then
					creature = "ice witch"
				elseif i == 3 then
					creature = "crystal spider"
				elseif i == 4 then
					creature = "frost dragon"
				end
				for k = 1, 70 do
					pos = {x = math.random(32193, 32215), y = math.random(30985, 31014), z = 14}
					if math.random(1, i + 1) == 1 then
						addEvent(doSummonCreature, i * 10 * 1000, creature, pos)
						addEvent(doSendMagicEffect, i * 10 * 1000, pos, CONST_ME_TELEPORT)
					end
				end
			end
		else
			player:say("Yakchal has already been awakened today. You should try again tomorrow.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end