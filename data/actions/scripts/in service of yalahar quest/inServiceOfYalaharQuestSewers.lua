function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 2416) then
	local player = Player(cid)
		if(itemEx.uid == 3071) then
			if(player:getStorageValue(26) < 1) then
				player:setOutfit("skeleton", 3 * 1000)
				fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
				player:setStorageValue(26, 1)
				player:setStorageValue(12012, player:getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
				for x = -1, 1 do
					for y = -1, 1 do
						doSendMagicEffect({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}, CONST_ME_YELLOWENERGY)
					end
				end
			end
		elseif(itemEx.uid == 3072) then
			if(player:getStorageValue(27) < 1) then
				player:setStorageValue(27, 1)
				player:setStorageValue(12012, player:getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
				for x = -1, 1 do
					for y = -1, 1 do
						if(math.random(1, 2) == 2) then
							Game.createMonster("rat", {x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z})
							doSendMagicEffect({x = player:getPosition().x + x, y = player:getPosition().y + y, z = player:getPosition().z}, CONST_ME_TELEPORT)
						end
					end
				end
			end
		elseif(itemEx.uid == 3073) then
			if(player:getStorageValue(28) < 1) then
				player:say("You have used the crowbar on a grate.", TALKTYPE_ORANGE_1)
				player:setStorageValue(28, 1)
				player:setStorageValue(12012, player:getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif(itemEx.uid == 3074) then
			if(player:getStorageValue(29) < 1) then
				doSetMonsterOutfit(cid, "bog raider", 5 * 1000)
				player:say("You have used the crowbar on a knot.", TALKTYPE_ORANGE_1)
				player:setStorageValue(29, 1)
				player:setStorageValue(12012, player:getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		end
	end
	return true
end