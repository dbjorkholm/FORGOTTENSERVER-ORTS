function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	if not targetItem then
		return false
	end

	if targetItem == 9949 then
		targetItem:transform(9948)
		targetItem:decay(math.random(604800))
	elseif targetItem == 9954 then
		targetItem:transform(9953)
		targetItem:decay(math.random(604800))
	end
	return true
end

