function onStepIn(cid, item, position, fromPosition)
	doCreateItem(5543, 1, {x = 32854, y = 32321, z = 11})
	return true
end

function onStepOut(cid, item)
	doRemoveItem(getTileItemById({x = 32854, y = 32321, z = 11}, 5543).uid, 1)
	return true
end