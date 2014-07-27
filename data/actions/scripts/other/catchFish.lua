function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 5554 then
		return false
	end

	if math.random(100) ~= 1 then
		Player(cid):say("The golden fish escaped.", TALKTYPE_MONSTER_SAY)
		return true
	end
	
	Player(cid):say("You catch a golden fish in the bowl.", TALKTYPE_MONSTER_SAY)
	Item(item.uid):transform(8766)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end
