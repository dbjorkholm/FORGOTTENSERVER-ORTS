function onUse(cid, item, fromPosition, itemEx, toPosition)
	local paladinbasin = Tile(Position({x = 32673, y = 32083, z = 8}))
	local sorcererbasin = Tile(Position({x = 32679, y = 32089, z = 8}))
	local knightbasin = Tile(Position({x = 32673, y = 32094, z = 8}))
	local druidbasin = Tile(Position({x = 32667, y = 32089, z = 8}))
	local paladin = Tile(Position({x = 32673, y = 32085, z = 8})):getTopCreature() if paladin == nil or not paladin:isPlayer() then return true end
	local sorcerer = Tile(Position({x = 32677, y = 32089, z = 8})):getTopCreature() if sorcerer == nil or not sorcerer:isPlayer()  then return true end
	local knight = Tile(Position({x = 32673, y = 32093, z = 8})):getTopCreature() if knight == nil or not knight:isPlayer()  then return true end
	local druid = Tile(Position({x = 32669, y = 32089, z = 8})):getTopCreature() if druid == nil or not druid:isPlayer()  then return true end

	if item.itemid == 1945 then
		if(paladin:getVocation():getId() == 3 or paladin:getVocation():getId() == 7) and (sorcerer:getVocation():getId() == 1 or sorcerer:getVocation():getId() == 5) and (knight:getVocation():getId() == 4 or knight:getVocation():getId() == 8) and (druid:getVocation():getId() == 2 or druid:getVocation():getId() == 6) then
			if paladinbasin:getItemById(2455) and sorcererbasin:getItemById(2175) and knightbasin:getItemById(2376) and druidbasin:getItemById(2674) then
				paladinbasin:getItemById(2455):remove() --crossbow
				sorcererbasin:getItemById(2175):remove() --spellbook
				knightbasin:getItemById(2376):remove() --sword
				druidbasin:getItemById(2674):remove() --apple
				Item(item.uid):transform(1946)
				paladin:teleportTo({x = 32670, y = 32071, z = 8})
				sorcerer:teleportTo({x = 32671, y = 32071, z = 8})
				knight:teleportTo({x = 32672, y = 32071, z = 8})
				druid:teleportTo({x = 32673, y = 32071, z = 8})
				paladin:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				sorcerer:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				knight:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				druid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have the required items.")
			end
		else
			Player(cid):sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have the right Vocations.")
		end
	else
		Item(item.uid):transform(1945)
	end
	return true
end