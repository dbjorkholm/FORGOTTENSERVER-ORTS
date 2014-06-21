function onUse(cid, item, fromPosition, itemEx, toPosition)
local targetItem = Item(itemEx.uid)
local player = Player(cid)
	if itemEx.itemid == 4861 and itemEx.actionid == 12130 and player:getStorageValue(Storage.TheApeCity.Mission09) == 1 then -- destroy cobra statue
		targetItem:transform(4862)
        targetItem:decay()
       	toPosition:sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.TheApeCity.Mission09, 2) -- The Ape City Questlog - Mission 9: The Deepest Catacombs
		player:setStorageValue(Storage.TheApeCity.Questline, 22)
	elseif itemEx.itemid == 4996 then -- destroy large amphora
		targetItem:transform(4997)
        targetItem:decay()
       	toPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
