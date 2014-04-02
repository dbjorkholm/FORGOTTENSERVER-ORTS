function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	-- In Service Of Yalahar Quest
	if(itemEx.uid == 3071) then
		if(player:getStorageValue(26) < 1) then
			doSetMonsterOutfit(cid, "skeleton", 3 * 1000)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_ENERGYHIT)
			for x = -1, 1 do
				for y = -1, 1 do
					doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_YELLOWENERGY)
				end
			end
			player:setStorageValue(26, 1)
		end
	elseif(itemEx.uid == 3072) then
		if(player:getStorageValue(27) < 1) then
			for x = -1, 1 do
				for y = -1, 1 do
					if(math.random(1, 2) == 2) then
						doSummonCreature("rat", {x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z})
						doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_TELEPORT)
					end
				end
			end
			player:setStorageValue(27, 1)
		end
	elseif(itemEx.uid == 3073) then
		if(player:getStorageValue(28) < 1) then
			doCreatureSay(cid, "You have used the crowbar on a grate.", TALKTYPE_ORANGE_1)
			player:setStorageValue(28, 1)
		end
	elseif(itemEx.uid == 3074) then
		if(player:getStorageValue(29) < 1) then
			doSetMonsterOutfit(cid, "bog raider", 5 * 1000)
			doCreatureSay(cid, "You have used the crowbar on a knot.", TALKTYPE_ORANGE_1)
			player:setStorageValue(29, 1)
		end
	end
	-- Postman Quest
	if(itemEx.actionid == 100 and itemEx.itemid == 2593) then
		if(player:getStorageValue(250) == 3) then
			player:setStorageValue(250, 4)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end