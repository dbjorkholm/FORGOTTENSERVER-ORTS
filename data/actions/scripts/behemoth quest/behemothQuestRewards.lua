function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10010) < 1) then
		doPlayerAddExp(cid, 75000, true, true)
		setPlayerStorageValue(cid, 10010, 1)
	end
	return true
end