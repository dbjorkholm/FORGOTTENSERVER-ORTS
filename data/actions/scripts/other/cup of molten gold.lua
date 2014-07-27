function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 2700 then
		return false
	end
	
	Item(item.uid):remove(1)
	Player(cid):addItem(13539, 1)
	toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	return true
end