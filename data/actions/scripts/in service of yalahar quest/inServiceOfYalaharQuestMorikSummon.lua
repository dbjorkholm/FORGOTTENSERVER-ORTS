function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9031) then
	local player = Player(cid)
		if(player:getStorageValue(30) == 31 and player:getStorageValue(9031) < 1) then
			local ret = Game.createMonster("Morik the Gladiator", fromPosition) 
			ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(9031, 1)
		end
	end
return true
end
