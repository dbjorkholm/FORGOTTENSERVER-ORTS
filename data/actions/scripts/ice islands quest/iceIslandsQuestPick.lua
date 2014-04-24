local chakoyas = {
	"chakoya toolshaper",
	"chakoya tribewarden",
	"chakoya windcaller"
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local tile1 = toPosition:getTile() 
local thing1 = tile1:getTopVisibleThing() 
--if item.itemid == 2553 then -- the cracked tile dont react on tools is bugged, so first time use it only
	if itemEx.itemid == 3621 and thing1:getId() == 7185 then
		if player:getStorageValue(12026) > 0 and player:getStorageValue(12002) < 3 and player:getStorageValue(12001) == 3  then
			player:setStorageValue(12002, player:getStorageValue(12002) + 1)
			player:setStorageValue(12026, player:getStorageValue(12026) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
			Position(toPosition):sendMagicEffect(CONST_ME_TELEPORT)
			thing1:transform(7186) 
			addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000)			
			if player:getStorageValue(12002) >= 2 then
				player:setStorageValue(12001, 4)
				player:setStorageValue(12026, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	end
--end
	return true
end


