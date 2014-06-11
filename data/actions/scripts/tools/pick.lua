local lava = {
	{x = 32808, y = 32336, z = 11, stackpos = 0},
	{x = 32809, y = 32336, z = 11, stackpos = 0},
	{x = 32810, y = 32336, z = 11, stackpos = 0},
	{x = 32808, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32334, z = 11, stackpos = 0},
	{x = 32807, y = 32335, z = 11, stackpos = 0},
	{x = 32807, y = 32336, z = 11, stackpos = 0},
	{x = 32807, y = 32337, z = 11, stackpos = 0},
	{x = 32806, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32337, z = 11, stackpos = 0},
	{x = 32805, y = 32338, z = 11, stackpos = 0},
	{x = 32805, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32339, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32807, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32338, z = 11, stackpos = 0},
	{x = 32808, y = 32337, z = 11, stackpos = 0},
	{x = 32809, y = 32337, z = 11, stackpos = 0},
	{x = 32810, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32337, z = 11, stackpos = 0},
	{x = 32811, y = 32338, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32339, z = 11, stackpos = 0},
	{x = 32809, y = 32338, z = 11, stackpos = 0},
	{x = 32811, y = 32336, z = 11, stackpos = 0},
	{x = 32811, y = 32335, z = 11, stackpos = 0},
	{x = 32810, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32335, z = 11, stackpos = 0},
	{x = 32808, y = 32335, z = 11, stackpos = 0},
	{x = 32809, y = 32334, z = 11, stackpos = 0},
	{x = 32809, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32333, z = 11, stackpos = 0},
	{x = 32811, y = 32333, z = 11, stackpos = 0},
	{x = 32806, y = 32338, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32811, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32334, z = 11, stackpos = 0},
	{x = 32813, y = 32334, z = 11, stackpos = 0},
	{x = 32814, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32333, z = 11, stackpos = 0},
	{x = 32810, y = 32334, z = 11, stackpos = 0},
	{x = 32812, y = 32335, z = 11, stackpos = 0},
	{x = 32813, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32335, z = 11, stackpos = 0},
	{x = 32814, y = 32333, z = 11, stackpos = 0},
	{x = 32813, y = 32333, z = 11, stackpos = 0}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local iEx = Item(itemEx.uid)
	local targetItem = Item(itemEx.uid)
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
	elseif itemEx.itemid == 1304 and itemEx.uid == 1022 then --The Pits of Inferno Quest
		for i = 1, #lava do
			Game.createItem(5815, 1, lava[i])
		end
		targetItem:transform(2256)
		toPosition:sendMagicEffect(CONST_ME_SMOKE)
	else
		return false
	end
	return true
end
