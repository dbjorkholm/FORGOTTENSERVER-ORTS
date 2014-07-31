local config = {
	[1] = Position({x = 32991, y = 31497, z = 1}),
	[2] = Position({x = 32990, y = 31498, z = 1}),
	[3] = Position({x = 32991, y = 31497, z = 1}),
	[4] = Position({x = 32992, y = 31498, z = 1}),
	[5] = Position({x = 32991, y = 31497, z = 1}),
	[6] = Position({x = 32991, y = 31498, z = 1}),
	[7] = Position({x = 32990, y = 31497, z = 1}),
	[8] = Position({x = 32991, y = 31496, z = 1}),
	[9] = Position({x = 32992, y = 31497, z = 1}),
	[10] = Position({x = 32991, y = 31496, z = 1}),
	[11] = Position({x = 32991, y = 31497, z = 1}),
	[12] = Position({x = 32990, y = 31496, z = 1}),
	[13] = Position({x = 32991, y = 31497, z = 1}),
	[14] = Position({x = 32992, y = 31496, z = 1}),
	[15] = Position({x = 32991, y = 31497, z = 1}),
	[16] = Position({x = 32991, y = 31496, z = 1})
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	local targetValue = config[player:getStorageValue(Storage.UnnaturalSelection.DanceStatus)]
	if not targetValue then
		return true
	end
	if player:getPosition() == targetValue then
		player:say(targetValue.text, TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.UnnaturalSelection.DanceStatus, player:getStorageValue(Storage.UnnaturalSelection.DanceStatus) + 1) --Questlog, Unnatural Selection Quest "Mission 2: All Around the World"
		local nextpos = config[player:getStorageValue(Storage.UnnaturalSelection.DanceStatus)]
		if nextpos then
			nextpos:sendMagicEffect(CONST_ME_SMALLPLANTS)
		end
	else
		player:setStorageValue(Storage.UnnaturalSelection.DanceStatus, 1)
		player:say("You did it wrong. now you have to start again.", TALKTYPE_MONSTER_SAY)
		config[1]:sendMagicEffect(CONST_ME_SMALLPLANTS)
	end
	if Player(cid):getStorageValue(Storage.UnnaturalSelection.DanceStatus) == 17 then
		player:setStorageValue(Storage.UnnaturalSelection.Questline, 7)
		player:setStorageValue(Storage.UnnaturalSelection.Mission03, 3) --Questlog, Unnatural Selection Quest "Mission 3: Dance Dance Evolution"
		player:say("Krunus should be pleased.", TALKTYPE_MONSTER_SAY)
	end
	return true
end


