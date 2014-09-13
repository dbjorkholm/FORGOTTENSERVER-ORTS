local exitPosition = Position(32605, 31902, 4)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local ground = Tile(exitPosition):getGround()
	if ground and isInArray({369, 413}, ground:getId()) then
		ground:transform(ground:getId() == 369 and 413 or 369)

		if ground:getId() == 369 then
			local items = ground:getTile():getItems()
			if items then
				exitPosition.z = exitPosition.z + 1
				for i = 1, #items do
					items[i]:moveTo(exitPosition)
				end
			end
		end
	end

	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end