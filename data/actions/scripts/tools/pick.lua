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
	local targetItem = Item(itemEx.uid)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) then
		if (itemEx.itemid == 354 or itemEx.itemid == 355) then
			targetItem:transform(392)
			targetItem:decay()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif itemEx.itemid == 7200 then
		targetItem:transform(7236)
		targetItem:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
	end
	--The Ice Islands Quest, Nibelor 1: Breaking the Ice
	if itemEx.itemid == 3621 and itemEx.actionid == 12026 then
		local tile1 = toPosition:getTile()
		local thing1 = tile1:getItemById(7185) 
		local chakoyas = {"chakoya toolshaper","chakoya tribewarden","chakoya windcaller"}
		if player:getStorageValue(Storage.TheIceIslands.Mission02) > 0 and player:getStorageValue(Storage.TheIceIslands.PickAmount) < 3 and player:getStorageValue(Storage.TheIceIslands.Questline) == 3  then
			player:setStorageValue(Storage.TheIceIslands.PickAmount, player:getStorageValue(Storage.TheIceIslands.PickAmount) + 1)
			player:setStorageValue(Storage.TheIceIslands.Mission02, player:getStorageValue(Storage.TheIceIslands.Mission02) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			doSummonCreature(chakoyas[math.random(3)], toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			thing1:transform(7186) 
			addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getItemById(7186) if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000)			
			if player:getStorageValue(Storage.TheIceIslands.PickAmount) >= 2 then
				player:setStorageValue(Storage.TheIceIslands.Questline, 4)
				player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	elseif itemEx.itemid == 1304 then
		if itemEx.uid == 1022 then --The Pits of Inferno Quest
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			targetItem:transform(2256)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)
		elseif itemEx.actionid == 50058 then -- naginata quest
			local stoneStorage = Game.getStorageValue(itemEx.actionid)
			if stoneStorage ~= 5 then
				Game.setStorageValue(itemEx.actionid, math.max(0, stoneStorage or 0) + 1)
			elseif stoneStorage == 5 then
				Item(itemEx.uid):remove()
				Game.setStorageValue(itemEx.actionid)
			end
			
			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end
	elseif itemEx.itemid == 9025 and itemEx.actionid == 101 then --The Banshee Quest
		targetItem:transform(392)
		targetItem:decay()
		toPosition:sendMagicEffect(CONT_ME_POFF)
	elseif itemEx.actionid == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then -- The Hidden City of Beregar Quest
			player:teleportTo(Position(32566, 31338, 10))
		end
	elseif itemEx.actionid == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1027) and Tile(Position(32617, 31514, 9)):getItemById(1205) then
			Tile(Position(32619, 31514, 9)):getItemById(5709):remove()
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You can't remove this pile since it's currently holding up the tunnel.")
		end
	elseif itemEx.actionid == 50127 then
		Tile(Position(32551, 31379, 15)):getItemById(9341):remove()
		Tile(Position(32551, 31379, 15)):getItemById(1304):remove()
		Tile(Position(32551, 31379, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31378, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31377, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31376, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31375, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31374, 15)):getGround():getId():transform(5815)
		Tile(Position(32551, 31373, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31373, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31374, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31375, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31376, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31377, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31378, 15)):getGround():getId():transform(5815)
		Tile(Position(32550, 31379, 15)):getGround():getId():transform(5815)
		local portal = Game.createItem(1387, Position(32551, 31376, 15))
		portal:setActionId(50126)
	else
		return false
	end
	return true
end
