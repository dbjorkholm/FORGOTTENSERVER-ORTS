function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local item = Item(item.uid)
	if math.random(50) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		item:transform(5958)
		player:say("You get the Prize!", TALKTYPE_ORANGE_1)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		item:remove(1)
		player:say("You get nothing!", TALKTYPE_ORANGE_1)
	end
	return true
end