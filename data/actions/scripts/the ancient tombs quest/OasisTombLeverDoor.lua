local doorPosition = Position(33122, 32765, 14)

local function revertCarrotAndLever(position, carrotPosition)
	local leverItem = Tile(position):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end

	local carrotItem = Tile(carrotPosition):getItemById(2684)
	if carrotItem then
		carrotItem:remove()
	end
end

function onUse(cid, item, position, itemEx, toPosition)
	if item.itemid == 1243 then
		Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, 'You first must find the Carrot under one of the three hats to get the access!')
		return true
	end

	if item.itemid ~= 1945 then
		return true
	end

	local player = Player(cid)
	if math.random(3) == 1 then
		local hatPosition = Position(toPosition.x - 1, toPosition.y, toPosition.z)
		hatPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		doorPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		Game.createItem(2684, 1, hatPosition)

		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You found the carrot! The door is open!')
		Item(item.uid):transform(1946)
		addEvent(revertCarrotAndLever, 4 * 1000, position, hatPosition)

		local doorItem = Tile(doorPosition):getItemById(1243)
		if doorItem then
			doorItem:transform(1244)
		end
		return true
	end

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'You guessed wrong! Take this! Carrot changed now the Hat!')
	doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, player:getPosition(), 0, -200, -200, CONST_ME_POFF)
	return true
end
