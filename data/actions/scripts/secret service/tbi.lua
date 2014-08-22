function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	player:addItem(10515, 1)
	player:say('You\'ve found a useful little tool for secret agents in the parcel.', TALKTYPE_MONSTER_SAY)
	Item(item.uid):remove()
	
	return true
end
