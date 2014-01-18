function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local creature = Creature(cid)
	if (player:getStorageValue(9995) == 1) and (player:getStorageValue(9996) < 1) then
		local chances=math.random(30)
		if chances == 13 then
			player:setStorageValue(9996,1)
			creature:say("You've got an amazing heart!", TALKTYPE_ORANGE_1)
			Position(creature:getPosition()):sendMagicEffect(CONST_ME_HEARTS)
			player:addItem(21394,1)
		else
			creature:say("Keep it trying!", TALKTYPE_ORANGE_1)
			Position(creature:getPosition()):sendMagicEffect(CONST_ME_POFF)
		end
	else
		creature:say("You've already got your heart", TALKTYPE_ORANGE_1)
	end
	return true
end