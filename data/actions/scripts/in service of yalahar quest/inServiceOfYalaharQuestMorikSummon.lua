function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9031) then
		if(Player(cid):getStorageValue(30) == 31 and Player(cid):getStorageValue(9031) < 1) then
			local ret = doSummonCreature("Morik the Gladiator", getThingPos(cid)) 
			Position(getThingPos(ret)):sendMagicEffect(CONST_ME_TELEPORT)
			Player(cid):setStorageValue(9031, 1)
		end
	end
return true
end
