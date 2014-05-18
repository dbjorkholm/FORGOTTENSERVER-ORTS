local time = 180 --180seconds equal 3minutes

local function doRemoveMw(mwPos)
	local Tile = Position(mwPos):getTile()
	if Tile then
		local thing = Tile:getItemById(1498)
		if thing and thing:isItem() then
			thing:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			thing:remove()
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local iteml = Item(item.uid)
	if item.itemid == 1945 then
		if item.uid == 50000 then --firstLevel
			doRemoveMw({x = 32259, y = 31891, z = 10})
			addEvent(function() iteml:transform(1945) Game.createItem(1498, 1, {x = 32259, y = 31891, z = 10}) end, time * 1000)
		elseif item.uid == 50001 then
			doRemoveMw({x = 32259, y = 31890, z = 10})
			addEvent(function() iteml:transform(1945) Game.createItem(1498, 1, {x = 32259, y = 31890, z = 10}) end, time * 1000)
		else
			doRemoveMw({x = 32266, y = 31860, z = 11})
		end
		iteml:transform(1946)
	else
		Player(cid):sendCancelMessage("The lever has already been used.")
	end
	return true
end
