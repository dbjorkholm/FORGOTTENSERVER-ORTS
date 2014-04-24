function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 2416) then
		if(itemEx.uid == 3071) then
			if(getPlayerStorageValue(cid, 26) < 1) then
				doSetMonsterOutfit(cid, "skeleton", 3 * 1000)
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_ENERGYHIT)
				for x = -1, 1 do
					for y = -1, 1 do
						doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_YELLOWENERGY)
					end
				end
				Player(cid):setStorageValue(26, 1)
				Player(cid):setStorageValue(12012, Player(cid):getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif(itemEx.uid == 3072) then
			if(getPlayerStorageValue(cid, 27) < 1) then
				for x = -1, 1 do
					for y = -1, 1 do
						if(math.random(1, 2) == 2) then
							doSummonCreature("rat", {x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z})
							doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_TELEPORT)
						end
					end
				end
				Player(cid):setStorageValue(27, 1)
				Player(cid):setStorageValue(12012, Player(cid):getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif(itemEx.uid == 3073) then
			if(getPlayerStorageValue(cid, 28) < 1) then
				doCreatureSay(cid, "You have used the crowbar on a grate.", TALKTYPE_ORANGE_1)
				Player(cid):setStorageValue(28, 1)
				Player(cid):setStorageValue(12012, Player(cid):getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		elseif(itemEx.uid == 3074) then
			if(getPlayerStorageValue(cid, 29) < 1) then
				doSetMonsterOutfit(cid, "bog raider", 5 * 1000)
				doCreatureSay(cid, "You have used the crowbar on a knot.", TALKTYPE_ORANGE_1)
				Player(cid):setStorageValue(29, 1)
				Player(cid):setStorageValue(12012, Player(cid):getStorageValue(12012) + 1) -- StorageValue for Questlog "Mission 01: Something Rotten"
			end
		end
	end
	return true
end