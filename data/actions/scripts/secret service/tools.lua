local config = {
	[7960] = 10515, -- TBI
	[7961] = 10513, -- CGB
	[7962] = 10511 -- AVIN
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	player:addItem(useItem)
	player:say('You\'ve found a useful little tool for secret agents in the parcel.', TALKTYPE_MONSTER_SAY)

	Item(item.uid):remove()
	return true
end
