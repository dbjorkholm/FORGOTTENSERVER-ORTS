local fruits = {2673, 2674, 2675, 2676, 2677, 2678, 2679, 2680, 2681, 2682, 2684, 2685, 5097, 8839, 8840, 8841}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = Item(itemEx.uid)
	if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
		if itemEx.itemid == 7106 and item.itemid == 7286 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:say("You take some hot water from the geyser.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7246)	
		elseif itemEx.itemid == 388 and item.itemid == 2565 then
			if player:getStorageValue(Storage.TheIceIslands.SulphurLava) < 1 then
				player:addItem(8301, 1)
				player:setStorageValue(Storage.TheIceIslands.SulphurLava, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say("You retrive a fine sulphur from a lava hole.", TALKTYPE_ORANGE_1)
			end
		elseif itemEx.itemid == 4184 and item.itemid == 2565 then
			if player:getStorageValue(Storage.TheIceIslands.SporesMushroom) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(Storage.TheIceIslands.SporesMushroom, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say("You retrive spores from a mushroom.", TALKTYPE_ORANGE_1)
			end
		end
	end
	if item.itemid == 2566 then --kitchen knife
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if itemEx.itemid == 7261 then
				if player:getStorageValue(Storage.TheIceIslands.FrostbiteHerb) < 1 then
					player:addItem(7248, 1)
					player:setStorageValue(Storage.TheIceIslands.FrostbiteHerb, 1)
					toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:say("You cut a leaf from a frostbite herb.", TALKTYPE_ORANGE_1)
				end
			elseif itemEx.itemid == 2733 then
				if player:getStorageValue(Storage.TheIceIslands.FlowerCactus) < 1 then
					player:addItem(7245, 1)
					player:setStorageValue(Storage.TheIceIslands.FlowerCactus, 1)
					targetItem:transform(2723)
					addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(2733) end end end, 60 * 1000)			
					toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
					player:say("You cut a flower from a cactus.", TALKTYPE_ORANGE_1)
				end
			elseif itemEx.itemid == 4017 then
				if player:getStorageValue(Storage.TheIceIslands.FlowerBush) < 1 then
					player:addItem(7249, 1)
					player:setStorageValue(Storage.TheIceIslands.FlowerBush, 1)
					targetItem:transform(4014)
					addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(4017) end end end, 60 * 1000)			
					toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
					player:say("You cut a flower from a bush.", TALKTYPE_ORANGE_1)
				end
			end
		end
		if isInArray(fruits, itemEx.itemid) and player:removeItem(6278, 1) then
			targetItem:remove(1)
			player:addItem(6279, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end
	end
	return true
end