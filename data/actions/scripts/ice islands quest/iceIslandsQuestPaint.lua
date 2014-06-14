function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local targetItem = Item(itemEx.uid)
	if itemEx.itemid == 7178 and item.itemid == 7253 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) == 8 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			player:setStorageValue(Storage.TheIceIslands.PaintSeal, player:getStorageValue(Storage.TheIceIslands.PaintSeal) + 1)
			if player:getStorageValue(Storage.TheIceIslands.PaintSeal) == 2 then
				player:setStorageValue(Storage.TheIceIslands.Questline, 9)
				player:setStorageValue(Storage.TheIceIslands.Mission04, 2) -- Questlog The Ice Islands Quest, Nibelor 3: Artful Sabotage
			end
			player:say("You painted a baby seal.", TALKTYPE_ORANGE_1)
			targetItem:transform(7252)
			addEvent(function(toPosition) toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN) end, 30 * 1000, toPosition)
			addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(7178) end end end, 30 * 1000)			
		end
	end
	return true
end