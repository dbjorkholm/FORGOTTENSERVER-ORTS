function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 100 and itemEx.itemid == 7362 and item.itemid == 2361) then
		if(getGlobalStorageValue(987) < os.time()) then
			setGlobalStorageValue(987, os.time() + 24 * 60 * 60 * 1000)
			if(math.random(1, 2) == 2) then
				doCreatureSay(cid, "You have awoken the icewitch Yakchal from her slumber! She seems not amused...", TALKTYPE_ORANGE_1)
			else
				doCreatureSay(cid, "The frozen starlight shattered, but you have awoken the icewitch Yakchal from her slumber! She seems not amused...", TALKTYPE_ORANGE_1)
				doRemoveItem(item.uid, 1)
			end
			for i = 1, 4 do
				if(i == 1) then
					creature = "ice golem"
				elseif(i == 2) then
					creature = "ice witch"
				elseif(i == 3) then
					creature = "crystal spider"
				elseif(i == 4) then
					creature = "frost dragon"
				end
				for k = 1, 70 do
					pos = {x = math.random(32193, 32215), y = math.random(30985, 31014), z = 14}
					if(math.random(1, i + 1) == 1) then
						addEvent(doSummonCreature, i * 10 * 1000, creature, pos)
						addEvent(doSendMagicEffect, i * 10 * 1000, pos, CONST_ME_TELEPORT)
					end
				end
				addEvent(doSummonCreature, 40 * 1000, "yakchal", fromPosition)
			end
		else
			doCreatureSay(cid, "Yakchal has already been awakened today. You should try again tomorrow.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end