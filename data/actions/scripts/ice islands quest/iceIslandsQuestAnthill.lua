function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local mast = {x = 32360, y = 31365, z = 7}
	if itemEx.itemid == 3323 and item.itemid == 7243 then
		if player:getStorageValue(12001) == 6 then
			Position(toPosition):sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:setStorageValue(12027, 2) -- Questlog The Ice Islands Quest, Nibelor 2: Ecological Terrorism
			player:say("You fill the jug with ants.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7244)
		end
	elseif itemEx.itemid == 4942 and item.itemid == 7244 and toPosition.x == mast.x and toPosition.y == mast.y and toPosition.z == mast.z then
		if player:getStorageValue(12001) == 6 then
			Position(toPosition):sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:setStorageValue(12001, 7)
			player:setStorageValue(12027, 3) -- Questlog The Ice Islands Quest, Nibelor 2: Ecological Terrorism
			player:say("You released ants on the hill.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7243)
		end
	end
	return true
end