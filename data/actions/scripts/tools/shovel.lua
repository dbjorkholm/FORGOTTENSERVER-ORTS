local holes = {468, 481, 483, 7932}

local function revertHole(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(469)
		if thing then
			thing:transform(8579)
		end
	end
end

local function removeRemains(toPosition)
	local item = Tile(toPosition):getItemById(2248)
	if item then
		item:remove()
	end
end

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local targetItem = Item(itemEx.uid)
	if isInArray(holes, itemEx.itemid) then
		targetItem:transform(itemEx.itemid + 1)
		targetItem:decay()
	elseif itemEx.itemid == 231 or itemEx.itemid == 9059 then
		local rand = math.random(100)
		if itemEx.actionid == 100 and rand <= 20 then
			targetItem:transform(489)
			targetItem:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
	-- Wrath of the emperor quest
	elseif itemEx.itemid == 351 and itemEx.actionid == 8024 then
		player:addItem(12297, 1)
		player:say("You dig out a handful of earth from this sacred place.", TALKTYPE_MONSTER_SAY)
	-- RookgaardTutorialIsland
	elseif itemEx.itemid == 8579 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 20 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug a hole! Walk onto it as long as it is open to jump down into the forest cave.')
		player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 19)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		targetItem:transform(469)
		addEvent(revertHole, 30 * 1000, toPosition)
	-- Gravedigger Quest
	elseif itemEx.actionid == 4654 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission50) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission50, 1)
	elseif itemEx.actionid == 4668 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission67) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission68) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission68, 1)
	-- ???
	elseif itemEx.actionid == 50118 then
		local position = Position(32717, 31492, 11)
		if Tile(position):getItemById(7131) then
			Game.createItem(8749, 1, position)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif itemEx.itemid == 8749 then
		local tile = Tile(Position(32699, 31492, 11))
		if tile:getItemById(8749) then
			tile:getItemById(8749):remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)
			Tile(Position(32699, 31494, 11)):getItemById(8642):setActionId(50119)
		end
	elseif isInArray({9632, 20230}, itemEx.itemid) then
		if player:getStorageValue(Storage.SwampDiggingTimeout) >= os.time() then
			return false
		end

		local config, chance = {
			{from = 1, to = 39, itemId = 2817},
			{from = 40, to = 79, itemId = 2145},
			{from = 80, to = 100, itemId = 20138}
		}, math.random(100)

		for i = 1, #config do
			local randItem = config[i]
			if chance >= randItem.from and chance <= randItem.to then
				player:addItem(randItem.itemId, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug up a ' .. ItemType(randItem.itemId):getName() .. '.')
				player:setStorageValue(Storage.SwampDiggingTimeout, os.time() + 604800)
				toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
				break
			end
		end
	elseif itemEx.itemid == 103 then
		if itemEx.actionid == 4205 then
			if player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) ~= 1 then
				return false
			end

			local remains = Game.createItem(2248, 1, toPosition)
			if remains then
				remains:setActionId(4206)
			end
			toPosition:sendMagicEffect(CONST_ME_HITAREA)
			addEvent(removeRemains, 60000, toPosition)
		end
	elseif itemEx.itemid == 22674 then
		if not player:removeItem(5091, 1) then
			return false
		end

		targetItem:transform(5731)
		targetItem:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
