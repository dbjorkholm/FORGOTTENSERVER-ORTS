function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if math.random(50) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		player:say("You get the Prize!", TALKTYPE_MONSTER_SAY)
		Item(item.uid):transform(5958)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:say("You get nothing!", TALKTYPE_MONSTER_SAY)
		Item(item.uid):remove(1)
	end
	return true
end