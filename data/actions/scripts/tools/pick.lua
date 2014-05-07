function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local iEx = Item(itemEx.uid)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) then
		if (itemEx.itemid == 354 or itemEx.itemid == 355) then
			iEx:transform(392)
			iEx:decay()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif itemEx.itemid == 7200 then
			iEx:transform(7236)
        	iEx:decay()
       		toPosition:sendMagicEffect(CONST_ME_HITAREA)
	end
	--The Ice Islands Quest, Nibelor 1: Breaking the Ice
	if itemEx.itemid == 3621 and itemEx.actionid == 12026 then
		local tile1 = toPosition:getTile()
		local thing1 = tile1:getItemById(7185) 
		local chakoyas = {"chakoya toolshaper","chakoya tribewarden","chakoya windcaller"}
		if player:getStorageValue(12026) > 0 and player:getStorageValue(12002) < 3 and player:getStorageValue(12001) == 3  then
			player:setStorageValue(12002, player:getStorageValue(12002) + 1)
			player:setStorageValue(12026, player:getStorageValue(12026) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			thing1:transform(7186) 
			addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getItemById(7186) if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000)			
			if player:getStorageValue(12002) >= 2 then
				player:setStorageValue(12001, 4)
				player:setStorageValue(12026, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	end
	return true
end
