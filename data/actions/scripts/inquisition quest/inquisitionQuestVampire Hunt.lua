local altars = {
	{x = 32777, y = 31982, z = 9},
	{x = 32779, y = 31977, z = 9},
	{x = 32781, y = 31982, z = 9}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 2002) then
	local player = Player(cid)
		if(player:getStorageValue(Storage.TheInquisition.Questline) == 8) then
			player:setStorageValue(Storage.TheInquisition.Questline, 9)
			player:setStorageValue(Storage.TheInquisition.Mission03, 4) -- The Inquisition Questlog- "Mission 3: Vampire Hunt"
			local k = {}
			for _, v in ipairs(altars) do
				local tmp = getTileItemById(v, 2199).uid
				if (tmp == 0) then
					Game.createMonster("The Count", toPosition)
					return true
				else
					table.insert(k, tmp)
				end
			end
			for i = 1, #k do
				doRemoveItem(k[i])
			end
			Game.createMonster("The Weakened Count", toPosition)
			return true
		end
	end
end