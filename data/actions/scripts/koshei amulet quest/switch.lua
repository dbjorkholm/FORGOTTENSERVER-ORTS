function onUse(cid, item, fromPosition, itemEx, toPosition)
	if Tile(Position(33281, 32442, 8)):getItemById(3698) and Tile(Position(33286, 32444, 8)):getItemById(3698) and Tile(Position(33276, 32444, 8)):getItemById(3697) and Tile(Position(33278, 32450, 8)):getItemById(3697) and Tile(Position(33284, 32450, 8)):getItemById(3697) then
		local coffinPosition = Position(33273, 32452, 8)
		local coffinItem = Tile(coffinPosition):getTopVisibleThing()
		if coffinItem and isInArray({7250, 7525}, coffinItem:getId()) then
			coffinItem:transform(coffinItem:getId() == 7520 and 7525 or 7520)
		end
		Player(cid):say('Click!', TALKTYPE_MONSTER_SAY, false, cid, coffinPosition)
	end
	return true
end
