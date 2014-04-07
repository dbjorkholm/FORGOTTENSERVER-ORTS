function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 3110 then
		if player:getStorageValue(120) == 2 and player:getStorageValue(118) <= 20 then
			if math.random(1, 5) > 1 then
				player:say("The world seems to spin but you manage to stay on your feet.", TALKTYPE_ORANGE_1)
				player:setStorageValue(119, player:getStorageValue(119) + 1)
				if player:getStorageValue(119) == 9 then -- 9 sips here cause local player at start
					player:say("10 sips in a row. Yeah!", TALKTYPE_ORANGE_1)
					player:setStorageValue(120, 3)
					player:setStorageValue(12022, 3) -- Questlog Barbarian Test Quest Barbarian Test 1: Barbarian Booze
					return true
				end
			else
				player:say("The mead was too strong. You passed out for a moment.", TALKTYPE_ORANGE_1)
				player:setStorageValue(119, 0)
			end
			player:setStorageValue(118, player:getStorageValue(118) + 1)
		elseif player:getStorageValue(118) > 20 then
			player:say("Ask Sven for another round.", TALKTYPE_ORANGE_1)
			player:setStorageValue(120, 1)
			player:setStorageValue(12022, 1) -- Questlog Barbarian Test Quest Barbarian Test 1: Barbarian Booze
		elseif player:getStorageValue(120) >= 3 then
			player:say("You already passed the test, no need to torture yourself anymore.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end