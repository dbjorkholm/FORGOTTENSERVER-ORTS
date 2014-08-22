local levers = {
	[2050] = {text = "You flipped the first lever. Hurry up and find the next one!", number = 1},
	[2051] = {text = "You flipped the second lever. Hurry up and find the next one!", number = 2},
	[2052] = {text = "You flipped the third lever. Hurry up and find the next one!", number = 3},
	[2053] = {text = "You flipped the fourth lever. Hurry up and find the next one!", number = 4},
	[2054] = {text = "You flipped the fifth lever. Hurry up and find the next one!", number = 5},
	[2055] = {text = "You flipped the sixth lever. Hurry up and find the next one!", number = 6},
	[2056] = {text = "You flipped the seventh lever. Hurry up and find the next one!", number = 7},
	[2057] = {text = "You flipped the eighth lever. Hurry up and find the next one!", number = 8},
	[2058] = {text = "You flipped the ninth lever. Hurry up and find the next one!", number = 9},
	[2059] = {text = "You flipped the tenth lever. Hurry up and find the next one!", number = 10},
	[2060] = {text = "You flipped the eleventh lever. Hurry up and find the next one!", number = 11},
	[2061] = {text = "You flipped the twelfth lever. Hurry up and find the next one!", number = 12},
	[2062] = {text = "You flipped the thirteenth lever. Hurry up and find the next one!", number = 13},
	[2063] = {text = "You flipped the fourteenth lever. Hurry up and find the next one!", number = 14},
	[2064] = {text = "You flipped the fifteenth lever. Hurry up and find the next one!", number = 15}
}

local stones = {
	Position(32851, 32333, 12),
	Position(32852, 32333, 12)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if item.uid == 2065  then
		if item.itemid == 1945 or item.itemid == 1946 then
			if Game.getStorageValue(1000) == 15 then
				for i = 1, 2 do
					Tile(stones[i]):getItemById(1304):remove()
					stones[i]:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
				end
				Item(item.uid):transform(1946)
			else
				player:say("The final lever won't budge... yet.", TALKTYPE_MONSTER_SAY)
			end
			return true
		end
	end
	if Game.getStorageValue(1000) < 1 then
		Game.setStorageValue(1000, 0)
	end
	if item.itemid == 1945 or item.itemid == 1946 then
		if (Game.getStorageValue(1000) + 1) == levers[item.uid].number then
			Game.setStorageValue(1000, levers[item.uid].number)
			player:say(levers[item.uid].text, TALKTYPE_MONSTER_SAY)
			Item(item.uid):transform(1946)
		else
			player:say("The final lever won't budge... yet.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
