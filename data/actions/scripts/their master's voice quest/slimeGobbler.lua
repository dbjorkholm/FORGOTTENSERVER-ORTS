local position = {
	Position(33313, 31852, 9),
	Position(33313, 31865, 9),
	Position(33313, 31881, 9),
	Position(33328, 31860, 9),
	Position(33328, 31873, 9),
	Position(33328, 31885, 9),
	Position(33308, 31873, 9),
	Position(33320, 31873, 9),
	Position(33335, 31873, 9),
	Position(33360, 31873, 9),
	Position(33336, 31914, 9),
	Position(33343, 31914, 9),
	Position(33353, 31914, 9),
	Position(33361, 31914, 9),
	Position(33345, 31900, 9),
	Position(33352, 31900, 9),
	Position(33355, 31854, 9),
	Position(33355, 31861, 9),
	Position(33355, 31885, 9),
	Position(33345, 31864, 9),
	Position(33345, 31881, 9),
	Position(33309, 31867, 9),
	Position(33317, 31879, 9),
	Position(33311, 31854, 9),
	Position(33334, 31889, 9),
	Position(33340, 31890, 9),
	Position(33347, 31889, 9),
}

local creatureNames = {
	'iron servant',
	'golden servant',
	'diamond servant'
}

local function getFungusInArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for itemId = 13585, 13589 do
				if Tile(Position(x, y, 9)):getItemById(itemId) then
					return true
				end
			end
		end
	end
	return false
end

local function summonMonster(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isInArray({13585, 13586, 13587, 13588, 13589}, itemEx.itemid) then
		return false
	end
	
	local player = Player(cid)
	if player:getStorageValue(984) + 15 * 1000 < os.time() then
		Item(itemEx.uid):transform(13590)
		player:setStorageValue(984, os.time())
		toPosition:sendMagicEffect(CONST_ME_POFF)
		if not getFungusInArea(Position(33306, 31847), Position(33369, 31919)) then
			for i = 1, #position do
				addEvent(summonMonster, 5 * 1000, creatureNames[math.random(#creatureNames)], position[i])
			end
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			player:say('COME! My servants! RISE!', TALKTYPE_MONSTER_SAY)
			Game.setStorageValue(985)
			Game.setStorageValue(984)
		else
			player:say('The slime gobbler gobbles large chunks of the slime fungus with great satisfaction.', TALKTYPE_MONSTER_SAY)
			player:addExperience(20, true, true)
		end
	end
	return true
end