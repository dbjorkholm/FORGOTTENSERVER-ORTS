function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 3111 then
		if player:getStorageValue(12001) == 30 then
			player:setStorageValue(12001, 31)
			player:setStorageValue(12031, 3) -- Questlog The Ice Islands Quest, The Secret of Helheim
			player:say("You discovered the necromantic altar and should report about it.", TALKTYPE_ORANGE_1)
			toPosition:sendMagicEffect(CONST_ME_YALAHARIGHOST)
			for x = -1, 1 do
				for y = 1, 1 do
					if y ~= 0 and x ~= 0 then
						doSendMagicEffect({x = toPosition.x + x, y = toPosition.y + y, z = toPosition.z}, CONST_ME_DEATH)
					end
				end
			end
		end
	end
	return true
end


