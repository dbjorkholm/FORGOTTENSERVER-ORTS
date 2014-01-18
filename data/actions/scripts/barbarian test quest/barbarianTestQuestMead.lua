function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local creature = Creature(cid)
	if(item.uid == 3110) then
		if(player:getStorageValue(120) == 2 and player:getStorageValue(118) < 0) then
			if(math.random(1, 5) > 1) then
				creature:say("The world seems to spin but you manage to stay on your feet.", TALKTYPE_ORANGE_1)
				if(player:getStorageValue(119) == 10) then
					player:setStorageValue(120, 3)
					return true
				end
				player:setStorageValue(119, player:getStorageValue(119) < 0 and 0 or player:getStorageValue(119) + 1)
			else
				creature:say("The mead was too strong. You passed out for a moment.", TALKTYPE_ORANGE_1)
				player:setStorageValue(119, 0)
				player:setStorageValue(120, 1)
			end
			player:setStorageValue(118, player:getStorageValue(118) < 0 and 0 or player:getStorageValue(118) + 1)
		elseif(player:getStorageValue(120) == 1) then
			creature:say("Ask Sven for another round.", TALKTYPE_ORANGE_1)
		elseif(player:getStorageValue(120) == 3) then
			creature:say("You already passed the test, no need to torture yourself anymore.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end