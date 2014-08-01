function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 5663 then
		return false
	end
	
	toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	Item(item.uid):transform(5939)
	return true
end