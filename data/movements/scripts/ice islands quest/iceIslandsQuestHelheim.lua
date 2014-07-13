function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if player:getStorageValue(Storage.TheIceIslands.Questline) == 30 then
		player:setStorageValue(Storage.TheIceIslands.Questline, 31)
		player:setStorageValue(Storage.TheIceIslands.Mission07, 3) -- Questlog The Ice Islands Quest, The Secret of Helheim
		player:say("You discovered the necromantic altar and should report about it.", TALKTYPE_MONSTER_SAY)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
		for x = -1, 1 do
			for y = 1, 1 do
				if y ~= 0 and x ~= 0 then
					Position(position.x + x, position.y + y, position.z):sendMagicEffect(CONST_ME_DEATH)
					Position(position.x, position.y - 1, position.z):sendMagicEffect(CONST_ME_YALAHARIGHOST)
				end
			end
		end
	end
	return true
end
