local versperothPosition = Position(33075, 31878, 12)

local function removeMinion(mid)
	local monster = Monster(mid)
	if monster then
		monster:getPosition():sendMagicEffect(CONST_ME_POFF)
		monster:remove()
	end
end

local function executeVersperothBattle(mid)
	if Game.getStorageValue(3147) ~= 1 then
		return
	end

	if mid then
		local monster = Monster(mid)
		if not monster then
			return
		end

		Game.setStorageValue(3148, monster:getMaxHealth() - monster:getHealth())
		monster:remove()
		versperothPosition:sendMagicEffect(CONST_ME_POFF)

		local position, minionMonster
		for i = 1, math.random(8, 10) do
			position = Position(math.random(33066, 33086), math.random(31870, 31887), 12)
			minionMonster = Game.createMonster('Minion of Versperoth', position)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			if minionMonster then
				addEvent(removeMinion, 20 * 1000, minionMonster:getId())
			end
		end
		addEvent(executeVersperothBattle, 10 * 1000)
		return
	end

	local monster = Game.createMonster('Versperoth', versperothPosition, false, true)
	if monster then
		versperothPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
		monster:addHealth(-Game.getStorageValue(3148))

		addEvent(executeVersperothBattle, 20 * 1000, monster:getId())
	end
end


function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if false and Game.getStorageValue(3147) >= 1 then
		return true
	end

	player:teleportTo(Position(33072, 31877, 12))
	Game.setStorageValue(3147, 1)
	Game.setStorageValue(3148, 0)
	executeVersperothBattle()
	Item(item.uid):transform(18462)
	return true
end