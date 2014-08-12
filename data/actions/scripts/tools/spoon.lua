function onUse(cid, item, fromPosition, itemEx, toPosition)
	--The Ice Islands Quest
	if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
		if itemEx.itemid == 388 then
			if player:getStorageValue(Storage.TheIceIslands.SulphurLava) < 1 then
				player:addItem(8301, 1)
				player:setStorageValue(Storage.TheIceIslands.SulphurLava, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive a fine sulphur from a lava hole.', TALKTYPE_MONSTER_SAY)
			end
		elseif itemEx.itemid == 4184 then
			if player:getStorageValue(Storage.TheIceIslands.SporesMushroom) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(Storage.TheIceIslands.SporesMushroom, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive spores from a mushroom.', TALKTYPE_MONSTER_SAY)
			end
		end
	end
	return true
end
