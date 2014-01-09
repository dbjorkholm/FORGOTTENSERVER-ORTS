function onAddItem(moveitem, tileitem, position)
	if (tileitem.actionid > 0 or tileitem.uniqueid > 0) then
		doRemoveItem(moveitem.uid)
		doSendMagicEffect(position, CONST_ME_POFF)
	end
	return true
end