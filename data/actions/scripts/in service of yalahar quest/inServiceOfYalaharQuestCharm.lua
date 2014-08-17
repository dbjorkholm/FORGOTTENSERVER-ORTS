function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 100 and itemEx.itemid == 471 then
		local player = Player(cid)
		if player:getStorageValue(Storage.InServiceofYalahar.Questline) == 36 then
			player:removeItem(9737, 1)
			doCreateItem(9738, 1, toPosition)
			toPosition:sendMagicEffect(47)
			local ret = Game.createMonster("Tormented Ghost", getThingPos(cid))
			local ret2 = Game.createMonster("Tormented Ghost", getThingPos(cid))
			ret:getPosition:sendMagicEffect(CONST_ME_TELEPORT)
			ret2:getPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end
