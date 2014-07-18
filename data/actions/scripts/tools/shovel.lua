local holes = {468, 481, 483, 7932}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local iEx = Item(itemEx.uid)
	if isInArray(holes, itemEx.itemid) then
		iEx:transform(itemEx.itemid + 1)
		iEx:decay()
	elseif itemEx.itemid == 231 or itemEx.itemid == 9059 then
		local rand = math.random(100)
		if(itemEx.actionid  == 100 and rand <= 20) then
		iEx:transform(489)
		iEx:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif itemEx.itemid == 8579 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 20 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug a hole! Walk onto it as long as it is open to jump down into the forest cave.')
		player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 19)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		iEx:transform(469)
		addEvent(function(toPosition) 
			local tile = toPosition:getTile() 
			if tile then 
				local thing = tile:getItemById(469) 
				if thing and thing:isItem() then 
					thing:transform(8579) 
				end 
			end 
		end, 30 * 1000, toPosition)
	elseif itemEx.aid == 4654 and player:getStorageValue(9925) == 1 and player:getStorageValue(9926) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(9926, 1)
	elseif itemEx.aid == 4668 and player:getStorageValue(9943) == 1 and player:getStorageValue(9944) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(9944, 1)
	else
		return false
	end
	return true
end
