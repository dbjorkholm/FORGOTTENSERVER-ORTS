function onUse(cid, item, fromPosition, itemEx, toPosition)
	if Tile(Position(33281, 32442, 8)):getItemById(3698) and Tile(Position(33286, 32444, 8)):getItemById(3698) and Tile(Position(33276, 32444, 8)):getItemByID(3697) and Tile(Position(33278, 32450, 8)):getItemByID(3697) and Tile(Position(33284, 32450, 8)):getItemByID(3697) then
		if Tile(Position(33273, 32458, 8)):getItemById(7520) then
			Tile(Position(33273, 32458, 8)):getItemById(7520):transform(7525)
		else
			Tile(Position(33273, 32458, 8)):getItemById(7525):transform(7520)
		end
		doCreatureSay(cid, "Click!", TALKTYPE_MONSTER_SAY, false, cid, {x = 33273, y = 32452, z = 8})
	end
	return true
end